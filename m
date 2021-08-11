Return-Path: <SRS0=vOU+=NC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3AAC4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Aug 2021 09:17:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA50160F55
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Aug 2021 09:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA50160F55
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P7ah6zZurOIyqTekv5yB/gSUSfOmxrmw/9zgVLqLaA0=; b=Mqc9S3k8g8sWjf
	jsqgSEvIc72iTsT/sbC2YRf7xJ/xEH3QRZSKFkOfSrVC1OdCB2BcsBnvPUeYNhBsvRVPEnEcGp82d
	dO6FyDsizg9lg56g6FvzaKscIetdIwPlOW/LZUiIUbZRkZiWWrxdAuu9tMTw9uSlhq0gThn1hEkig
	L0fJOUM4trMtjVglqCp4mwfwIh7I2peD9XOAcQKPxJl27qruk5+3u9lgbDVWNEPFBXtC8bS+5CwoF
	z8su77UmtmBux7cvFKdKK0hjBokZioBmjHNpxz8XkqX6s5qFEREvb8EXPhchS9rH1Mke/Vs4KPJJQ
	Z0tmX0p/ThdisCvLXNlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDkLz-006Eij-MS; Wed, 11 Aug 2021 09:16:51 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDjxX-0067WK-TH
 for linux-riscv@lists.infradead.org; Wed, 11 Aug 2021 08:51:42 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
 by xavier.telenet-ops.be with bizsmtp
 id g8rG2500m1gJxCh018rGUb; Wed, 11 Aug 2021 10:51:32 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mDjxE-001yaA-I3; Wed, 11 Aug 2021 10:51:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mDjxD-0058x3-C2; Wed, 11 Aug 2021 10:51:15 +0200
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
Subject: [PATCH v5 4/9] of: fdt: Add generic support for handling usable
 memory range property
Date: Wed, 11 Aug 2021 10:51:02 +0200
Message-Id: <3bd69bada93ee59b7d23c38b3527fc1654e19343.1628670468.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628670468.git.geert+renesas@glider.be>
References: <cover.1628670468.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_015136_264760_353F8167 
X-CRM114-Status: GOOD (  16.15  )
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

Add support for handling the "linux,usable-memory-range" property in the
"/chosen" node to the FDT core code.  This can co-exist safely with the
architecture-specific handling, until the latter has been removed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
About the change to chosen.txt: I have a similar change for
schemas/chosen.yaml in dt-schema.

v5:
  - Handle the actual capping in generic code, too,

v4:
  - New.
---
 Documentation/devicetree/bindings/chosen.txt |  6 ++--
 drivers/of/fdt.c                             | 30 ++++++++++++++++++++
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
index 5b0b94eb2d04e79d..1cc3aa10dcb10588 100644
--- a/Documentation/devicetree/bindings/chosen.txt
+++ b/Documentation/devicetree/bindings/chosen.txt
@@ -79,9 +79,9 @@ a different secondary CPU release mechanism)
 linux,usable-memory-range
 -------------------------
 
-This property (arm64 only) holds a base address and size, describing a
-limited region in which memory may be considered available for use by
-the kernel. Memory outside of this range is not available for use.
+This property holds a base address and size, describing a limited region in
+which memory may be considered available for use by the kernel. Memory outside
+of this range is not available for use.
 
 This property describes a limitation: memory within this range is only
 valid when also described through another mechanism that the kernel
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 99be3e03af29089f..bc041d8141e86e62 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -956,6 +956,32 @@ static void __init early_init_dt_check_for_elfcorehdr(unsigned long node)
 		 elfcorehdr_addr, elfcorehdr_size);
 }
 
+static phys_addr_t cap_mem_addr;
+static phys_addr_t cap_mem_size;
+
+/**
+ * early_init_dt_check_for_usable_mem_range - Decode usable memory range
+ * location from flat tree
+ * @node: reference to node containing usable memory range location ('chosen')
+ */
+static void __init early_init_dt_check_for_usable_mem_range(unsigned long node)
+{
+	const __be32 *prop;
+	int len;
+
+	pr_debug("Looking for usable-memory-range property... ");
+
+	prop = of_get_flat_dt_prop(node, "linux,usable-memory-range", &len);
+	if (!prop || (len < (dt_root_addr_cells + dt_root_size_cells)))
+		return;
+
+	cap_mem_addr = dt_mem_next_cell(dt_root_addr_cells, &prop);
+	cap_mem_size = dt_mem_next_cell(dt_root_size_cells, &prop);
+
+	pr_debug("cap_mem_start=%pa cap_mem_size=%pa\n", &cap_mem_addr,
+		 &cap_mem_size);
+}
+
 #ifdef CONFIG_SERIAL_EARLYCON
 
 int __init early_init_dt_scan_chosen_stdout(void)
@@ -1104,6 +1130,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 
 	early_init_dt_check_for_initrd(node);
 	early_init_dt_check_for_elfcorehdr(node);
+	early_init_dt_check_for_usable_mem_range(node);
 
 	/* Retrieve command line */
 	p = of_get_flat_dt_prop(node, "bootargs", &l);
@@ -1258,6 +1285,9 @@ void __init early_init_dt_scan_nodes(void)
 
 	/* Setup memory, calling early_init_dt_add_memory_arch */
 	of_scan_flat_dt(early_init_dt_scan_memory, NULL);
+
+	/* Handle linux,usable-memory-range property */
+	memblock_cap_memory_range(cap_mem_addr, cap_mem_size);
 }
 
 bool __init early_init_dt_scan(void *params)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
