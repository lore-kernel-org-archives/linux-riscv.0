Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731B4C48BDF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 21:48:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12D376109E
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 21:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12D376109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DPNokNLfishPPggGdyiM0x5M8AL0map/ozp7RJmTplQ=; b=c3qhtiA7hFsEQ7
	L52/hou5R0vCaY2etgOSDE5qEoWBRYlZoKcMLT2NlMik6j81nkm7S/tcGIHR9sH8Q2MQY24iTXsO8
	SlQuH093hRyyDA08CxhUBZbjdIOfsU0OJBuR88NmEeJGChgqm8af29A/APblbBXk0MgW2piS25N90
	lH76oLefUq11LKrYceTI9gamJ0LvBw2wAS87xVRZRgsBIGwe0U70OHObeqETLKLjM5A5xeu5B01JM
	zxW6rNJGCghgW8iTaU3O8Gs6TGBsfzPdjQRqDqt6zZnnj/z3LgXI0LjbVDvfh2hrJX3HQg0JdMlsP
	cy1HRcmQVCbfpZrqtQlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltGvE-003J42-Rl; Tue, 15 Jun 2021 21:48:36 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltDdD-0023Nl-0X
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 18:17:49 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:bda0:7de0:767e:26f9])
 by albert.telenet-ops.be with bizsmtp
 id HWHe2500a4N5gS306WHeeA; Tue, 15 Jun 2021 20:17:42 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1ltDd4-00HYOP-66; Tue, 15 Jun 2021 20:17:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1ltDd3-005qAG-NQ; Tue, 15 Jun 2021 20:17:37 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh+dt@kernel.org>, Nick Kossifidis <mick@ics.forth.gr>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Frank Rowand <frowand.list@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] of: fdt: Add generic support for parsing elf core header
 properties
Date: Tue, 15 Jun 2021 20:17:25 +0200
Message-Id: <8661d652968d050489852ccb50df5ad4cc048900.1623780059.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623780059.git.geert+renesas@glider.be>
References: <cover.1623780059.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_111747_238724_C27714E0 
X-CRM114-Status: GOOD (  17.07  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

There are two methods to specify the location of the elf core header:
using the "elfcorehdr=" kernel parameter, as handled by generic code in
kernel/crash_dump.c, or using the "linux,elfcorehdr" property under the
"/chosen" node in the Device Tree, as handled by architecture-specific
code in arch/arm64/mm/init.c.

Extend support for "linux,elfcorehdr" to all platforms supporting DT by
adding platform-agnostic handling for parsing this property to the FDT
core code.  This can co-exist safely with the architecture-specific
handling, until the latter has been removed.

This requires moving the call to of_scan_flat_dt() up, as the code
scanning the "/chosen" node now needs to be aware of the values of
"#address-cells" and "#size-cells".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/chosen.txt |  6 ++--
 drivers/of/fdt.c                             | 37 ++++++++++++++++++--
 2 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
index 45e79172a646c537..5b0b94eb2d04e79d 100644
--- a/Documentation/devicetree/bindings/chosen.txt
+++ b/Documentation/devicetree/bindings/chosen.txt
@@ -106,9 +106,9 @@ respectively, of the root node.
 linux,elfcorehdr
 ----------------
 
-This property (currently used only on arm64) holds the memory range,
-the address and the size, of the elf core header which mainly describes
-the panicked kernel's memory layout as PT_LOAD segments of elf format.
+This property holds the memory range, the address and the size, of the elf
+core header which mainly describes the panicked kernel's memory layout as
+PT_LOAD segments of elf format.
 e.g.
 
 / {
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index a03d43f95495d8e1..f13db831c8028cce 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -8,6 +8,7 @@
 
 #define pr_fmt(fmt)	"OF: fdt: " fmt
 
+#include <linux/crash_dump.h>
 #include <linux/crc32.h>
 #include <linux/kernel.h>
 #include <linux/initrd.h>
@@ -909,6 +910,35 @@ static inline void early_init_dt_check_for_initrd(unsigned long node)
 }
 #endif /* CONFIG_BLK_DEV_INITRD */
 
+#ifdef CONFIG_CRASH_DUMP
+/**
+ * early_init_dt_check_for_elfcorehdr - Decode elfcorehdr location from flat
+ * tree
+ * @node: reference to node containing elfcorehdr location ('chosen')
+ */
+static void __init early_init_dt_check_for_elfcorehdr(unsigned long node)
+{
+	const __be32 *prop;
+	int len;
+
+	pr_debug("Looking for elfcorehdr property... ");
+
+	prop = of_get_flat_dt_prop(node, "linux,elfcorehdr", &len);
+	if (!prop || (len < (dt_root_addr_cells + dt_root_size_cells)))
+		return;
+
+	elfcorehdr_addr = dt_mem_next_cell(dt_root_addr_cells, &prop);
+	elfcorehdr_size = dt_mem_next_cell(dt_root_size_cells, &prop);
+
+	pr_debug("elfcorehdr_start=0x%llx elfcorehdr_size=0x%llx\n",
+		 elfcorehdr_addr, elfcorehdr_size);
+}
+#else
+static inline void early_init_dt_check_for_elfcorehdr(unsigned long node)
+{
+}
+#endif
+
 #ifdef CONFIG_SERIAL_EARLYCON
 
 int __init early_init_dt_scan_chosen_stdout(void)
@@ -1057,6 +1087,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 		return 0;
 
 	early_init_dt_check_for_initrd(node);
+	early_init_dt_check_for_elfcorehdr(node);
 
 	/* Retrieve command line */
 	p = of_get_flat_dt_prop(node, "bootargs", &l);
@@ -1201,14 +1232,14 @@ void __init early_init_dt_scan_nodes(void)
 {
 	int rc = 0;
 
+	/* Initialize {size,address}-cells info */
+	of_scan_flat_dt(early_init_dt_scan_root, NULL);
+
 	/* Retrieve various information from the /chosen node */
 	rc = of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
 	if (!rc)
 		pr_warn("No chosen node found, continuing without\n");
 
-	/* Initialize {size,address}-cells info */
-	of_scan_flat_dt(early_init_dt_scan_root, NULL);
-
 	/* Setup memory, calling early_init_dt_add_memory_arch */
 	of_scan_flat_dt(early_init_dt_scan_memory, NULL);
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
