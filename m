From: mick@ics.forth.gr (Nick Kossifidis)
Date: Sat, 10 Nov 2018 02:53:17 +0200
Subject: [PATCH] OF: Add a warning in case chosen node is not present
Message-ID: <20181110005317.5631-1-mick@ics.forth.gr>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On architectures that only get their bootargs through devicetree's
chosen node (such as RISC-V), that node is mandatory. After a
discussion with Rob [1] I'm adding a warning in case chosen node
is not present, to let users know about it.

[1]: https://patchwork.ozlabs.org/patch/984224/#2016136

Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
---
 drivers/of/fdt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index bb532aae0d92..7ff67bf1f6d6 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1200,8 +1200,12 @@ bool __init early_init_dt_verify(void *params)
 
 void __init early_init_dt_scan_nodes(void)
 {
+	int rc = 0;
+
 	/* Retrieve various information from the /chosen node */
-	of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
+	rc = of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
+	if (!rc)
+		pr_warn("No chosen node found, continuing without\n");
 
 	/* Initialize {size,address}-cells info */
 	of_scan_flat_dt(early_init_dt_scan_root, NULL);
-- 
2.16.4
