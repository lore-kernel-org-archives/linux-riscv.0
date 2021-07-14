Return-Path: <SRS0=1/OQ=MG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FB9C07E9A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 12:51:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88E1C613B6
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 12:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88E1C613B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZtFnkqGqvy50rRDkBYGXgF0cqhf1LqqNdmWbcF0jmw=; b=tNpiFDp658zTB9
	PxFEBQd7JXIpieAsv5+3bzA+OgdonyXTD+HZueyf5/p4I3cQbReaX254B2m/GayseItQxBeq3W7uH
	dg37orgC8TyR+KDwkm7LN5TfOqlEY2M2SwQLy5v2fs0mkfGLgrVfbyIOL8u3d0i5jTOAELiLGM1lu
	2vR2XYQk+KUfNHznGj+nbi3lPNb0hIQCSZJz3P/j1P1NxxJII5vpip3s2tzBsz+KV5C3H3kKO95K8
	nK+esFxLWT1soCdLmMAhAJTbSNt0sD7OOOOnRUhN7EsMY8I5W0JXSZX/f8RKDjT5REOuZBLt13VnU
	kO84Nq6dkGD+bLP9g9OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3eMV-00Dbe1-R0; Wed, 14 Jul 2021 12:51:39 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3eLl-00DbGU-2R
 for linux-riscv@lists.infradead.org; Wed, 14 Jul 2021 12:50:56 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
 by baptiste.telenet-ops.be with bizsmtp
 id V0qX2500E1ccfby010qXMw; Wed, 14 Jul 2021 14:50:49 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3eLO-0018dT-Vc; Wed, 14 Jul 2021 14:50:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3eLN-00AaEe-S6; Wed, 14 Jul 2021 14:50:29 +0200
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
Subject: [PATCH v4 08/10] arm64: kdump: Remove custom linux,
 usable-memory-range parsing
Date: Wed, 14 Jul 2021 14:50:18 +0200
Message-Id: <8ee4eacc4ce00b95fdb4b28daf3eb597212c5941.1626266516.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626266516.git.geert+renesas@glider.be>
References: <cover.1626266516.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_055053_429512_4C9FF267 
X-CRM114-Status: GOOD (  12.73  )
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

Remove the architecture-specific code for parsing the
"linux,usable-memory-range" property under the "/chosen" node in DT, as
the platform-agnostic handling in the FDT core code already takes care
of this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - New.
---
 arch/arm64/mm/init.c | 34 +---------------------------------
 1 file changed, 1 insertion(+), 33 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 946e246660f2b180..f90ba99437c0f3c9 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -227,44 +227,12 @@ static int __init early_mem(char *p)
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
 
 	/* Handle linux,usable-memory-range property */
-	fdt_enforce_memory_region();
+	memblock_cap_memory_range(cap_mem_addr, cap_mem_size);
 
 	/* Remove memory above our supported physical address size */
 	memblock_remove(1ULL << PHYS_MASK_SHIFT, ULLONG_MAX);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
