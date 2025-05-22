resource "local_file" "all_ips" {
  content  = join("\n", concat(
    esxi_guest.webserver[*].ip_address,
   ))
  filename = "${path.module}/serverips.txt"
}
