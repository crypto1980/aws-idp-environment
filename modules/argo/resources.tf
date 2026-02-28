
###---Application---###
resource "argocd_application" "grafana" {
  metadata {
    name      = "grafana"
    namespace = "argocd"
  }

  spec {
    project = "default"

    source {
      repo_url        = "https://gitlab.com/infra/prod/global-charts/argo-toolkit.git"
      target_revision = "HEAD"
      path            = "grafana"
    }

    destination {
      server    = "https://kubernetes.default.svc"
      namespace = "default"
    }

    sync_policy {
      automated {
        prune = true
        self_heal = true
      }
    }
  }
}
