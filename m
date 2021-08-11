Return-Path: <SRS0=vOU+=NC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA5AC432BE
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Aug 2021 10:02:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CF4460EB9
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Aug 2021 10:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0CF4460EB9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SyzebtDBm3G9vk13IjFoZmM8u8GASG/I32I5iGOrg1g=; b=rU2zJjWhVjFQWy
	/ZqqfcSbUju24yLCamIcnW5h38ItwUXGjpKzy364WOjjmPrUB3TWO7q2518qplYGwi/v2t9zfyHGK
	W9ucQY8fQmm8kFQv14ssWf/Gs9/SwkEtlmBY0XtJ7xZVqVseo1wta7TD8mhu5JAo1U5f2TjLJz51t
	uP0QSndzaP637TU9JV6R3WpW61oOZBEDZkB5GwtIuNq/oh4EU8OrJFpE2lA/LJxyuob9P9GX9fEEG
	GBDyw0JuBNX+NSW6p1Ft7M8vSl9dGclwGCNT+iomOwKBE8bit6vVOvEJBW6Im7ZEdKU+V6oOKEBzy
	5bteq1s2R3yPLlVpdUWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDl3P-006VBk-FG; Wed, 11 Aug 2021 10:01:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDkxG-006SOH-T8
 for linux-riscv@bombadil.infradead.org; Wed, 11 Aug 2021 09:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Y3gv0hBrtzVbkJDFvKWNiJujXFdCYCk+E8RB6R0yRRw=; b=KIZKrRCB4B8jrlafDTAMGs4ZnE
 nkbsEcPBu1jpTagMy+4BTW4eA8kfzRZH93dqkfz3+G4hVF31m8uojEsH5LPG5/zhWyJJP7sBQz3x8
 nGECwSIH4v6wTTT3hp0rm7TUV7NISZg10p+nskKHZQIhQAW2f4FdPjyjZh4ZqsXjxZRMa9zL7WSTK
 BEhvtuZaHSXIj2kfRWBrkEA4+Ez/VwEiwkFQnO3X+nrm/0F3y79NRsLDpDEtDqIZqPpJ5nNg09cDV
 t2QCwDgsRJRbgIP8FctgtE4fmlR3+t7yJTVFoy4jwYwMhQNY86UGDr7Qf/+3WzelIP3nGiNlrksqP
 gMrJWgEA==;
Received: from leibniz.telenet-ops.be ([195.130.137.77])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDjxZ-00800x-6B
 for linux-riscv@lists.infradead.org; Wed, 11 Aug 2021 08:51:41 +0000
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4Gl3TL6DSlzMqjMq
 for <linux-riscv@lists.infradead.org>; Wed, 11 Aug 2021 10:51:34 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
 by baptiste.telenet-ops.be with bizsmtp
 id g8rG2500D1gJxCh018rG4B; Wed, 11 Aug 2021 10:51:33 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mDjxE-001yaG-7u; Wed, 11 Aug 2021 10:51:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mDjxD-0058xY-G7; Wed, 11 Aug 2021 10:51:15 +0200
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
Subject: [PATCH v5 8/9] arm64: kdump: Remove custom linux,
 usable-memory-range handling
Date: Wed, 11 Aug 2021 10:51:06 +0200
Message-Id: <7356c531c49a24b4a55577bf8e46d93f4d8ae460.1628670468.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628670468.git.geert+renesas@glider.be>
References: <cover.1628670468.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_095137_451485_DE5157A9 
X-CRM114-Status: GOOD (  11.68  )
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

Remove the architecture-specific code for handling the
"linux,usable-memory-range" property under the "/chosen" node in DT, as
the platform-agnostic FDT core code already takes care of this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5:
  - Remove all handling, not just parsing,

v4:
  - New.
---
 arch/arm64/mm/init.c | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index bac4f06bb7d900a2..4e90a1d170587376 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -197,45 +197,10 @@ static int __init early_mem(char *p)
 }
 early_param("mem", early_mem);
 
-static int __init early_init_dt_scan_usablemem(unsigned long node,
-		const char *uname, int depth, void *data)
-{
-	struct memblock_region *usablemem = data;
-	const __be32 *reg;
-	int len;
-
-	if (depth != 1 || strcmp(uname, "chosen") != 0)
-		return 0;
-
-	reg = of_get_flat_dt_prop(node, "linux,usable-memory-range", &len);
-	if (!reg || (len < (dt_root_addr_cells + dt_root_size_cells)))
-		return 1;
-
-	usablemem->base = dt_mem_next_cell(dt_root_addr_cells, &reg);
-	usablemem->size = dt_mem_next_cell(dt_root_size_cells, &reg);
-
-	return 1;
-}
-
-static void __init fdt_enforce_memory_region(void)
-{
-	struct memblock_region reg = {
-		.size = 0,
-	};
-
-	of_scan_flat_dt(early_init_dt_scan_usablemem, &reg);
-
-	if (reg.size)
-		memblock_cap_memory_range(reg.base, reg.size);
-}
-
 void __init arm64_memblock_init(void)
 {
 	const s64 linear_region_size = PAGE_END - _PAGE_OFFSET(vabits_actual);
 
-	/* Handle linux,usable-memory-range property */
-	fdt_enforce_memory_region();
-
 	/* Remove memory above our supported physical address size */
 	memblock_remove(1ULL << PHYS_MASK_SHIFT, ULLONG_MAX);
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
