Return-Path: <SRS0=vOU+=NC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A5EC4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Aug 2021 10:01:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F7B06023B
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Aug 2021 10:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F7B06023B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4xCgDNY7kPULYVV9VgrSnqBNkmb17Hi2TfPMXSqF8wk=; b=KuVMs/DfZorSPd
	Zrmu3byIz9U0NfcHKsoCXPZfX95cgHAgJ2ro5Ba6XOlJQys4fFMNzmNzjI3o6FDSI+8o/TXWDyZGA
	EOVWa6jQQvcT/mVMjm5ZzcPP+INc908hTJ0HB+aPhwKXTZOIjOkLcA8Rc256tOXSgWZQbi5l+LSqZ
	w4Pd63pKq/6emSHRjTUPM+CxVaNaeHwXamQM6hzR/OKYbViak9XnUKR7Q6jVh8oEB3rf8vsb0Il+3
	RxHakOAK0Jeq4BDB1aihfBX0F+GKhG6toxv5+Ax6swUUNQ0Z4dD16fqJsOB25X1des4p/H06BiM8J
	d/1Mj/AfQTvnao5psIUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDl37-006V25-1T; Wed, 11 Aug 2021 10:01:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDkxG-006SOH-Dc
 for linux-riscv@bombadil.infradead.org; Wed, 11 Aug 2021 09:55:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=RLbsQ+M6vcwNouwMwyHvDx5eqpVljj/HaK1+Ekn8wxc=; b=iQq6t6tNBGmjzGvsZs4qu44Gc+
 wfmU9sJjbX6u2CMiUeo4VF9aImpLGb/O+zFA14c/WGk37xbitDpjNbc3NASKJYtg3HsN18oBi5ooM
 eL0CF8YakEq/fZ9GLQtbZckjs4z10ynuQsIbw9FeQ/R3DHP5KkHwvKL0EoMK1zTzDAD0YqtFrYcgU
 lz+Nz3RzGBGpkc6Orx1VVslCsRQ3b0QzIbHn6hkeGIbXVfAD1N1jr/T1WLIQ6o/A6KMlLlrIAGjph
 BWVimcUuyh1byhXhXTu3PVW0pz/PAkPcnl4pK9dRoT7mihvQo2mHr55QKW7SONdUhEVWKpX0MegPO
 zuxi7MPQ==;
Received: from newton.telenet-ops.be ([195.130.132.45])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDjxZ-00800u-7Q
 for linux-riscv@lists.infradead.org; Wed, 11 Aug 2021 08:51:42 +0000
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by newton.telenet-ops.be (Postfix) with ESMTPS id 4Gl3TL6D61zMqlKh
 for <linux-riscv@lists.infradead.org>; Wed, 11 Aug 2021 10:51:34 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
 by baptiste.telenet-ops.be with bizsmtp
 id g8rG2500G1gJxCh018rG4C; Wed, 11 Aug 2021 10:51:33 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mDjxE-001ya8-9x; Wed, 11 Aug 2021 10:51:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mDjxD-0058wx-B1; Wed, 11 Aug 2021 10:51:15 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Nicolas Pitre <nico@fluxnic.net>, Ard Biesheuvel <ardb@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Kossifidis <mick@ics.forth.gr>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Frank Rowand <frowand.list@gmail.com>, Dave Young <dyoung@redhat.com>
Cc: Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Mike Rapoport <rppt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5 3/9] of: fdt: Add generic support for handling elf core
 headers property
Date: Wed, 11 Aug 2021 10:51:01 +0200
Message-Id: <c7e46e50aaf87ef49bdaa61358d25b122f32b7df.1628670468.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628670468.git.geert+renesas@glider.be>
References: <cover.1628670468.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_095137_454744_435BF37E 
X-CRM114-Status: GOOD (  24.23  )
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

There are two methods to specify the location of the elf core headers:
using the "elfcorehdr=" kernel parameter, as handled by generic code in
kernel/crash_dump.c, or using the "linux,elfcorehdr" property under the
"/chosen" node in the Device Tree, as handled by architecture-specific
code in arch/arm64/mm/init.c.

Extend support for "linux,elfcorehdr" to all platforms supporting DT by
adding platform-agnostic handling for handling this property to the FDT
core code.  This can co-exist safely with the architecture-specific
handling, until the latter has been removed.

This requires moving the call to of_scan_flat_dt() up, as the code
scanning the "/chosen" node now needs to be aware of the values of
"#address-cells" and "#size-cells".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Notes:
  1. To avoid reserving the region twice, this depends on "MIPS: Avoid
     duplicate elf core header reservation",
  2. IA64 also has custom code to reserve the region, but is not
     affected, as IA64 does not use DT,
  3. About the change to chosen.txt: I have a similar change for
     schemas/chosen.yaml in dt-schema.

v5:
  - Handle the actual reservation in generic code, too,

v4:
  - Use IS_ENABLED() instead of #ifdef,
  - Clarify what architecture-specific code is still responsible for.
---
 Documentation/devicetree/bindings/chosen.txt |  6 +-
 drivers/of/fdt.c                             | 59 +++++++++++++++++++-
 2 files changed, 59 insertions(+), 6 deletions(-)

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
index 9e5074d52879649b..99be3e03af29089f 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -8,6 +8,7 @@
 
 #define pr_fmt(fmt)	"OF: fdt: " fmt
 
+#include <linux/crash_dump.h>
 #include <linux/crc32.h>
 #include <linux/kernel.h>
 #include <linux/initrd.h>
@@ -581,6 +582,30 @@ static int __init __fdt_scan_reserved_mem(unsigned long node, const char *uname,
 	return 0;
 }
 
+/*
+ * reserve_elfcorehdr() - reserves memory for elf core header
+ *
+ * This function reserves the memory occupied by an elf core header
+ * described in the device tree. This region contains all the
+ * information about primary kernel's core image and is used by a dump
+ * capture kernel to access the system memory on primary kernel.
+ */
+static void __init reserve_elfcorehdr(void)
+{
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP) || !elfcorehdr_size)
+		return;
+
+	if (memblock_is_region_reserved(elfcorehdr_addr, elfcorehdr_size)) {
+		pr_warn("elfcorehdr is overlapped\n");
+		return;
+	}
+
+	memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
+
+	pr_info("Reserving %llu KiB of memory at 0x%llx for elfcorehdr\n",
+		elfcorehdr_size >> 10, elfcorehdr_addr);
+}
+
 /**
  * early_init_fdt_scan_reserved_mem() - create reserved memory regions
  *
@@ -606,6 +631,7 @@ void __init early_init_fdt_scan_reserved_mem(void)
 
 	of_scan_flat_dt(__fdt_scan_reserved_mem, NULL);
 	fdt_init_reserved_mem();
+	reserve_elfcorehdr();
 }
 
 /**
@@ -904,6 +930,32 @@ static inline void early_init_dt_check_for_initrd(unsigned long node)
 }
 #endif /* CONFIG_BLK_DEV_INITRD */
 
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
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
+		return;
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
+
 #ifdef CONFIG_SERIAL_EARLYCON
 
 int __init early_init_dt_scan_chosen_stdout(void)
@@ -1051,6 +1103,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 		return 0;
 
 	early_init_dt_check_for_initrd(node);
+	early_init_dt_check_for_elfcorehdr(node);
 
 	/* Retrieve command line */
 	p = of_get_flat_dt_prop(node, "bootargs", &l);
@@ -1195,14 +1248,14 @@ void __init early_init_dt_scan_nodes(void)
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
