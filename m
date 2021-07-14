Return-Path: <SRS0=1/OQ=MG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5BBC07E9A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 14:01:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96403613C2
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 14:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96403613C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/WPyDoeIoJ6fyoHrnZ2ECxOwpyQj0zeNrDyClo19HdY=; b=BHqv911rHKWuK0
	6/OCrqjDfbQMRCd3xJPUhv1PTCWod2YArMKzO2YbU9zwYfPuh4y19vc108QSzQZbC48z4RYJpwqAd
	IJX5m8/J+1DxsQZ58MZFmbCffPKpX28FwgyguXGNzcfoQxK3ryhU0T8xW9RJS7TY2wAj+Sfzlk8ht
	xzdxnW+Q9HL7uKy0wQwMuD5UafEdIIUuPiqAGfbUGsaGNlgk/UhhkDD7oqv602OmcEOT0Bs7Td5Ob
	P/8j3bmnbKqzqOJDdBmb48/mFbmFMnGeeuozAwbwVYvKQEuFhVEmQbX5I7PHy26YWMg7zpDPhqdCO
	wiqo3ua5Ls+4Mm8UKCcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3fRz-00Dm0L-AL; Wed, 14 Jul 2021 14:01:23 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3eLl-00DbFj-50
 for linux-riscv@lists.infradead.org; Wed, 14 Jul 2021 12:50:57 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
 by xavier.telenet-ops.be with bizsmtp
 id V0qX250091ccfby010qX5Y; Wed, 14 Jul 2021 14:50:46 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3eLO-0018dP-Vb; Wed, 14 Jul 2021 14:50:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3eLN-00AaEC-PF; Wed, 14 Jul 2021 14:50:29 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Nicolas Pitre <nico@fluxnic.net>, Ard Biesheuvel <ardb@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Nick Kossifidis <mick@ics.forth.gr>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Frank Rowand <frowand.list@gmail.com>, Dave Young <dyoung@redhat.com>,
 Mike Rapoport <rppt@kernel.org>
Cc: Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 kexec@lists.infradead.org, linux-mm@kvack.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 04/10] of: fdt: Add generic support for parsing usable
 memory range property
Date: Wed, 14 Jul 2021 14:50:14 +0200
Message-Id: <4064ea598a10ea0a4b9043aa771bcea1a00efac3.1626266516.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626266516.git.geert+renesas@glider.be>
References: <cover.1626266516.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_055053_411457_427950F4 
X-CRM114-Status: GOOD (  16.17  )
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

Add support for parsing the "linux,usable-memory-range" property in the
"/chosen" node to the FDT core code.  This can co-exist safely with the
architecture-specific parsing, until the latter has been removed.

Architecture-specific code still has to make sure the resulting memory
range limitation is applied, if present.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
About the change to chosen.txt: I have a similar change for
schemas/chosen.yaml in dt-schema.

v4:
  - New.
---
 Documentation/devicetree/bindings/chosen.txt |  6 ++---
 drivers/of/fdt.c                             | 24 ++++++++++++++++++++
 2 files changed, 27 insertions(+), 3 deletions(-)

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
index f797d52c5b492cb7..1b4dd5418b44b9fb 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -935,6 +935,29 @@ static void __init early_init_dt_check_for_elfcorehdr(unsigned long node)
 		 elfcorehdr_addr, elfcorehdr_size);
 }
 
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
@@ -1083,6 +1106,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 
 	early_init_dt_check_for_initrd(node);
 	early_init_dt_check_for_elfcorehdr(node);
+	early_init_dt_check_for_usable_mem_range(node);
 
 	/* Retrieve command line */
 	p = of_get_flat_dt_prop(node, "bootargs", &l);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
