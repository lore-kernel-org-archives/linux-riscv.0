Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E42C5479D
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 20:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O4e5asoxWHpwgJ4zZ5cLIYYkFABCqAO1n5sV14X6f8E=; b=U6B+0rvGNXhMuP
	uWLclanyq71kN1E5+JbkfNKgu/N8Y4uNqo66kDkWBRtnpqDN87X8Cc5K6zn88Agxl00khJXXdjhD6
	6vD/oKk8/fsPF9WcgFOe1/fBvorOXBLO5iHzPG9MJ65+EwAzD2/Y2kcLbRVG829WGEY+YbQl1t7B+
	cH1s1ZKffcDRWHcQlZhxyviNa4wj2SiIRLY6qnf2oKe3gkAtzFpuDk6p13DspOH+xjpimIXQSgXyo
	4tYvepXBPo9zYu182wbBrjLIzPjpeIZP0s3OWZJIsVm21GGHGoOfCgiCzvKLCQTLWy0ofb9GXRsoD
	qDSa1GOlqzkFb6znaiqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDX56-00EglY-If; Thu, 05 Jan 2023 20:43:20 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCyQM-007SCx-Rq
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 07:43:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1672818172; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z+bSljoBgMVCb5F45aypNicisSPEIsMFGeM8garunuuCAwi4j4RYw/KQkKUVCCzxWCPiEsFn9mWPpU+aIcTuT0/ZOmqK890gtrv33CaaW8rVpaOO008eklQdUEv0bPiZ1UUyNnSUM+EJliRTYOyo+tbLAttiShytBNyRYMz/dD4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1672818172; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=I1yLqUv9qtAxD+32sW8R0natEhKR+NpsTiFNiBXZnzE=; 
	b=LL9oZHYnrYWPdm5iBcEkKxjHWVgWbJoMG9uRCoFicVBqbxSSl/YNPPsjA++l0ax8/6SU4Jt4IP8f7uZn0ThLlaRVqNY53vBYY1KzoKg1V9z/1NFvyj1EHqjyGNpV+CjC7Kz010wBHFIzAimeQfO7xgcBMg+40GAQjsVUHokJ1KY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1672818172;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=I1yLqUv9qtAxD+32sW8R0natEhKR+NpsTiFNiBXZnzE=;
	b=f/cmixoJAa76Oo8QOw5rAc55kzPbX+Wlm3NgMj+g/L1it5IcTrSmkU1lNf8RmHIn
	G/pbGUNrflODsoeNQUmdg6YMSciAJj8C0e+MDch84didHcNkaVsiggWhZsF8KbwpHju
	C8GUUnTUJEnsQhN+sb0RVfV9VsPJ2UDYYnaiL7Vw=
Received: from edelgard.fodlan.icenowy.me (120.85.96.143 [120.85.96.143]) by mx.zohomail.com
	with SMTPS id 167281817077737.67600097251102; Tue, 3 Jan 2023 23:42:50 -0800 (PST)
From: Icenowy Zheng <uwu@icenowy.me>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [RFC PATCH 3/3] riscv: use VA+PA variant of CMO macros for DMA page preparation
Date: Wed,  4 Jan 2023 15:41:46 +0800
Message-Id: <20230104074146.578485-4-uwu@icenowy.me>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104074146.578485-1-uwu@icenowy.me>
References: <20230104074146.578485-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_234259_365044_A4BA439F 
X-CRM114-Status: GOOD (  10.26  )
X-Mailman-Approved-At: Thu, 05 Jan 2023 12:28:40 -0800
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

When doing DMA page preparation, both the VA and the PA are easily
accessible from struct page.

Use the alternative macro variant that takes both VA and PA as
parameters, thus in case the ISA extension used support PA directly, the
overhead for re-converting VA to PA can be omitted.

Suggested-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 arch/riscv/mm/dma-noncoherent.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index a751f4aece62..0ad0614d1ad4 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -52,8 +52,9 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 void arch_dma_prep_coherent(struct page *page, size_t size)
 {
 	void *flush_addr = page_address(page);
+	phys_addr_t paddr = PFN_PHYS(page_to_pfn(page));
 
-	ALT_CMO_OP(flush, flush_addr, size, riscv_cbom_block_size);
+	ALT_CMO_OP_VPA(flush, flush_addr, paddr, size, riscv_cbom_block_size);
 }
 
 void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
