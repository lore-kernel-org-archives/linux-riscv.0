Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE56CA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 07:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jjj5BvYHsrCe7GAHL6uM4bzK0RNEtSaFNTu41fu2h5Q=; b=E2gAPf9iZ+2oOB
	xJK8C0y77N8ytAwpi19Rlqd7JPXL8k7Vd7fYgWL6zeQkLdVL6fv0cPCUXjaytVBJdRqtGtHipfqUe
	NRSMGDDsqi6gyC6cUt1YTqiEMkOVMg1UFjjG8YqNzy2HHbxwvymNXDpYd7/eQpmFtRdWz245+VZPf
	3XBTEDys77GEM04fIJMuAtGo0WMatXzwk5PQqCBeG9wHU+zBkk7HhEULkxWuEiaOcLMqMZ14vwgAc
	3drw8cArAtiucmhGhkV4KbFNLuztzRFIznRNJ2/hbGW8plBEVM20Y1TFqopqVH3KXS+ArBUKFvGKV
	2JxkE5hmSy1zbJibGmlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unBg4-00000004F3K-1gdb;
	Sat, 16 Aug 2025 07:50:12 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unBg1-00000004F17-305S
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 07:50:11 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755330602; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Wk3n11qAalAXzPVmgZZZEaJ/zqMH94YdP8W8QseZQilV6/fFOzeOtrnBU1TXIvODhpSNzdlGWIDJ2+yw8ymZzysVuRQZrsozLJKUaQYITfoMVeCLl0s72kHk5mri7VtzVqYEDJZlftbhE5hojvDdXmbRdlvChgRpybVpG3Tvxjs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755330602; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Dl80jSPpC5O2vp6knEfeEZ6aNBmqt3cz1+4K1LZ3LiI=; 
	b=me6QuRwSn9njgRjEz6S5/2cYS5Y092ZrOcumAsy52X6gIcD8JZRPVwxs3sfBsCVIpNwf9NEFfoZSqrxcnL9ii/k+y+uwzAAsySjpgqVPnHfzEsEXQ7NeAFt8VCBtlG1+HLv8IBp80yjAwKlxunj7CaPW4Z3/bafXVJQ2Hg4UiW0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755330602;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Dl80jSPpC5O2vp6knEfeEZ6aNBmqt3cz1+4K1LZ3LiI=;
	b=hPzr9B4YznreZqMCWBxJhlGuLr6dC74K5IcxVNIzU4nYbGEWF5KX2wfOyZc8e3D5
	jJjl9MYmwzB9mVo8Anoq/4kaoy1EeojMnCvxKjOg4gD4s06PQRP5WFJo1P9abFcXmpF
	Rv3apgURWVbMaCFXp+Oe5nERN8N/roueIkSvSGRUsnKox7sX9OVieVFX6LCaFe7LNNs
	YTlRpGK2pqrb7KwKB6MyHyNAJgF9O6zWVoVRzrWdUXW9lueVYcuffMw7AapQibVMJ0q
	/wgA/we+W/iAHt1pLdokwdSy+0YjxmcExLkgwFoumAyTTt6f+4kgJrn+60zDlHV7fvV
	PE0+R4f2Zw==
Received: by mx.zohomail.com with SMTPS id 175533059910433.10218510901905;
	Sat, 16 Aug 2025 00:49:59 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 6/7] drm/etnaviv: add shared context support for iommuv2
Date: Sat, 16 Aug 2025 15:47:56 +0800
Message-ID: <20250816074757.2559055-7-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816074757.2559055-1-uwu@icenowy.me>
References: <20250816074757.2559055-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_005009_814298_16F5483C 
X-CRM114-Status: GOOD (  12.17  )
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

Unfortunately the GC620 GPU seems to have broken PTA capibility, and
switching page table ID in command stream after it's running won't work.
As directly switching mtlb isn't working either, there will be no
reliable way to switch page table in the command stream, and a shared
context, like iommuv1, is needed.

Add support for this shared context situation. Shared context is set
when the broken PTA is known, and the context allocation code will be
made short circuit when a shared context is set.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c | 8 ++++++++
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c      | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_mmu.h      | 2 ++
 3 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c b/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
index 5654a604c70cf..960ba3d659dc5 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
@@ -273,6 +273,12 @@ etnaviv_iommuv2_context_alloc(struct etnaviv_iommu_global *global)
 	struct etnaviv_iommu_context *context;
 
 	mutex_lock(&global->lock);
+	if (global->shared_context) {
+		context = global->shared_context;
+		etnaviv_iommu_context_get(context);
+		mutex_unlock(&global->lock);
+		return context;
+	}
 
 	v2_context = vzalloc(sizeof(*v2_context));
 	if (!v2_context)
@@ -301,6 +307,8 @@ etnaviv_iommuv2_context_alloc(struct etnaviv_iommu_global *global)
 	mutex_init(&context->lock);
 	INIT_LIST_HEAD(&context->mappings);
 	drm_mm_init(&context->mm, SZ_4K, (u64)SZ_1G * 4 - SZ_4K);
+	if (global->v2.broken_pta)
+		global->shared_context = context;
 
 	mutex_unlock(&global->lock);
 	return context;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index df5192083b201..a0f9c950504e0 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -504,6 +504,7 @@ int etnaviv_iommu_global_init(struct etnaviv_gpu *gpu)
 	memset32(global->bad_page_cpu, 0xdead55aa, SZ_4K / sizeof(u32));
 
 	if (version == ETNAVIV_IOMMU_V2) {
+		global->v2.broken_pta = gpu->identity.model == chipModel_GC620;
 		global->v2.pta_cpu = dma_alloc_wc(dev, ETNAVIV_PTA_SIZE,
 					       &global->v2.pta_dma, GFP_KERNEL);
 		if (!global->v2.pta_cpu)
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.h b/drivers/gpu/drm/etnaviv/etnaviv_mmu.h
index 2ec4acda02bc6..5627d2a0d0237 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.h
@@ -55,6 +55,8 @@ struct etnaviv_iommu_global {
 		u64 *pta_cpu;
 		dma_addr_t pta_dma;
 		DECLARE_BITMAP(pta_alloc, ETNAVIV_PTA_ENTRIES);
+		/* Whether runtime switching page table ID will fail */
+		bool broken_pta;
 	} v2;
 };
 
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
