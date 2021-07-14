Return-Path: <SRS0=1/OQ=MG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB41BC07E9A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 13:55:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0430613BF
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 13:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0430613BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BzzNINjQoJGUtZ62ByjIPbJfrm01Lzc6aYYsZZ6N3Pk=; b=IIFiuoRHEZnwYv
	PKjz0GMAUtltsLOH+CaW7TrM+QXBNWP03eQtQF0tCtIpPQ5nY6hJa+/PIw4cbMv+3wna0tRpJxEbS
	2iMptpehh4FUrcbA6NgjpxK0i8l7b6ipn5Y/eRAMQzBZPtXe5GzeeHL+rxrL6RMO+zLJ6/7w4xD60
	yC7n3YPaDKYqp5iWSqRsDI6AJnaUPr1w0v2nwItb2s2YH6Coq2u0ePuOEmoWUq1uZh+PmzC4Uyne2
	+tJFeepdzOYEJ2PGSlmfC+B4mgC0MaD/C3cWyqzE1oLnZaWI9lPfUxi0KsR6r8yXKjvWSIUz2VoZt
	xOCPDjEPY1G4GltagaVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3fM3-00DjnF-4d; Wed, 14 Jul 2021 13:55:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3fM1-00Djks-2m
 for linux-riscv@bombadil.infradead.org; Wed, 14 Jul 2021 13:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=rVINQ13Qiw1BCWO4bcmdktam4YAfw7ZUvn65dOysZ+c=; b=LXzHZ+qmnCgHvgwX56QWaiFxvq
 P1vEySfvqIkCtLV9LvcVDdMUNqlAJ9JLq3gjhaZsvfPKu9N8C97KxJvJa03p2N6jEUzLk5RHuV6g1
 8MNaoJbF9Tl/q8d3UJnvyimo8M1zc1GrA5dBS/KDXPJOjvS+W9qjTi9K7PUBAeg9RTZwoKkYC0BUe
 X4VjHc87/5wHOW9zjhXT7GJgtTNs4wTC36DWoq0U0LvE7bf1r0kNpbfKX6ZIbFJbZy+Oi6ZTRDP6T
 LgXowN7r9kIWD/J98hu3CaXCz5M/sI1nhV3hJf0Hkcp2VfY4MNSdh12eaUpVSh63luGh45umhSvHr
 +NxN8hRA==;
Received: from leibniz.telenet-ops.be ([195.130.137.77])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3eLu-00HUFI-Oz
 for linux-riscv@lists.infradead.org; Wed, 14 Jul 2021 12:51:06 +0000
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4GPy6M5tjfzMqfss
 for <linux-riscv@lists.infradead.org>; Wed, 14 Jul 2021 14:50:51 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
 by andre.telenet-ops.be with bizsmtp
 id V0qW2500C1ccfby010qWoz; Wed, 14 Jul 2021 14:50:47 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3eLO-0018dO-3E; Wed, 14 Jul 2021 14:50:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3eLN-00AaE5-OX; Wed, 14 Jul 2021 14:50:29 +0200
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
Subject: [PATCH v4 03/10] of: fdt: Add generic support for parsing elf core
 headers property
Date: Wed, 14 Jul 2021 14:50:13 +0200
Message-Id: <24d93c713f6faeaee6105f57c3d94ac17f12405f.1626266516.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626266516.git.geert+renesas@glider.be>
References: <cover.1626266516.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_135102_928808_7AA0BC85 
X-CRM114-Status: GOOD (  19.97  )
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
adding platform-agnostic handling for parsing this property to the FDT
core code.  This can co-exist safely with the architecture-specific
parsing, until the latter has been removed.

This requires moving the call to of_scan_flat_dt() up, as the code
scanning the "/chosen" node now needs to be aware of the values of
"#address-cells" and "#size-cells".

Architecture-specific code still has to reserve the memory used by the
elf core headers, if present.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
About the change to chosen.txt: I have a similar change for
schemas/chosen.yaml in dt-schema.

v4:
  - Use IS_ENABLED() instead of #ifdef,
  - Clarify what architecture-specific code is still responsible for.
---
 Documentation/devicetree/bindings/chosen.txt |  6 ++--
 drivers/of/fdt.c                             | 34 ++++++++++++++++++--
 2 files changed, 34 insertions(+), 6 deletions(-)

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
index 344f16bb04ccf081..f797d52c5b492cb7 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -8,6 +8,7 @@
 
 #define pr_fmt(fmt)	"OF: fdt: " fmt
 
+#include <linux/crash_dump.h>
 #include <linux/crc32.h>
 #include <linux/kernel.h>
 #include <linux/initrd.h>
@@ -908,6 +909,32 @@ static inline void early_init_dt_check_for_initrd(unsigned long node)
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
@@ -1055,6 +1082,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 		return 0;
 
 	early_init_dt_check_for_initrd(node);
+	early_init_dt_check_for_elfcorehdr(node);
 
 	/* Retrieve command line */
 	p = of_get_flat_dt_prop(node, "bootargs", &l);
@@ -1199,14 +1227,14 @@ void __init early_init_dt_scan_nodes(void)
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
