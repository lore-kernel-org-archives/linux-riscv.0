Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1854ACA0EE6
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 07:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qF9Y4gwRbtuS+94cQMtfoyGyAl7YsO3goV6WZVIQx68=; b=MxJp6IlwrTN+S9
	My8Ibs+xJJYPISvjpbu29oYWo9FOEne7IyUSf55qXYvQ5TbcZR79B8WhnR851GKROYFDnLQO3eoDP
	VBXkh2mk27ondPcgfHcpyN7op8W4aHFy+wo0+mJTleNFNTwGBc/nlxrq7JCE2xPJfM5512j4vCqjj
	0b4rvuZ1+uEwNCbIIu3hztk9XXqau5QKlbKjZDEaGZFjigViAAjAK1gSxOyWvEIQ48jlhGi18kRCL
	3F0Y9Kg4RXzDWkVzlpFFCNxcHKgdG5ntc6vf8Z22YrvKkOSH7a/O0db9MsJbdGYRgjqXg/Cle51lq
	CX9LJgXSrB3lT8mP7tGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unBg3-00000004F2h-3Kgg;
	Sat, 16 Aug 2025 07:50:11 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unBg0-00000004F0T-3xK3
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 07:50:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755330596; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SnNrqvFDzgNV5KJ3LbmREpj4lP9rVFATsmMgKcd5J68M27/MoPHtT1SufEGnPkBJqpMIdhu1Ghoat3wRlZwt8HVBVFTxAnAuL3fb/JrwFOjFUXRZTtmuSDmlzT8qgpTsxGKXtQ1SklhLmE0dTyqT1ueCenM04Q6X2D4xZfhSpww=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755330596; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JoRCF6ssZwmH7R938xLhOJLH6I8iPbEeE3FkzT0OL4I=; 
	b=d79zLvaW2ZE1XwPjonVBq98wiOfcPe4rvQGgUqzGsrMt7PboLu3xda7vViUhokeLNfv+UdM+AoaHpXQzKqACD2vbCy44bpD5ZicNVeRwk+xAAcFn/uzlA0f8Sq/Cbb33jDqXLpNge0UPMlK0JWhzrUcTsfoc9KR8zP42AfXI3fk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755330596;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=JoRCF6ssZwmH7R938xLhOJLH6I8iPbEeE3FkzT0OL4I=;
	b=F/nRtus4XTVwvujBNyWX5E0zTKi12Rm8SQlz4pKqTnKxKqisCqwDQ5UQHJ8wnrQ8
	9BwJrnuRGWtwHNqQ4j4/VvBYRmFaOrZs4sCP5DJLgejTMUJ/3vUnQ7onShVqht9pzd/
	wncsAgwvSGs8g5eONFnoRHylwa8i/nVgrovAo98bnVGlDRkjY+XgmxA2zyXzsfT4/GI
	nfwgzynMpucRQ07lipj+Ul+sTAHjAgzeH4Vxo6DfxTWs16vPdL63IYD2R6YJfdnJP+h
	rugoHM1Sgb+dC9rjhYjTk82Eu8Mku41p/8s42rRJ1dK3s49unqnWDV+Ll3ORsiqvQfD
	UuE8TmImww==
Received: by mx.zohomail.com with SMTPS id 1755330593074146.76093361763662;
	Sat, 16 Aug 2025 00:49:53 -0700 (PDT)
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
Subject: [PATCH 5/7] drm/etnaviv: prepare for shared_context support for iommuv2
Date: Sat, 16 Aug 2025 15:47:55 +0800
Message-ID: <20250816074757.2559055-6-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816074757.2559055-1-uwu@icenowy.me>
References: <20250816074757.2559055-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_005009_044302_2418843D 
X-CRM114-Status: GOOD (  14.17  )
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

As we have some unfortunate GPUs with IOMMUv2 but broken PTA (reloading
a different page table at runtime always fails), shared_context is now
not a v1-only thing.

Move it out of the v1 struct in the union.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 drivers/gpu/drm/etnaviv/etnaviv_iommu.c |  8 ++++----
 drivers/gpu/drm/etnaviv/etnaviv_mmu.h   | 22 +++++++---------------
 2 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_iommu.c b/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
index afe5dd6a9925b..6fdce63b9971a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
@@ -39,7 +39,7 @@ static void etnaviv_iommuv1_free(struct etnaviv_iommu_context *context)
 	dma_free_wc(context->global->dev, PT_SIZE, v1_context->pgtable_cpu,
 		    v1_context->pgtable_dma);
 
-	context->global->v1.shared_context = NULL;
+	context->global->shared_context = NULL;
 
 	kfree(v1_context);
 }
@@ -136,8 +136,8 @@ etnaviv_iommuv1_context_alloc(struct etnaviv_iommu_global *global)
 	 * a stop the world operation, so we only support a single shared
 	 * context with this version.
 	 */
-	if (global->v1.shared_context) {
-		context = global->v1.shared_context;
+	if (global->shared_context) {
+		context = global->shared_context;
 		etnaviv_iommu_context_get(context);
 		mutex_unlock(&global->lock);
 		return context;
@@ -163,7 +163,7 @@ etnaviv_iommuv1_context_alloc(struct etnaviv_iommu_global *global)
 	mutex_init(&context->lock);
 	INIT_LIST_HEAD(&context->mappings);
 	drm_mm_init(&context->mm, GPU_MEM_START, PT_ENTRIES * SZ_4K);
-	context->global->v1.shared_context = context;
+	context->global->shared_context = context;
 
 	mutex_unlock(&global->lock);
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.h b/drivers/gpu/drm/etnaviv/etnaviv_mmu.h
index 7f8ac01785474..2ec4acda02bc6 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.h
@@ -49,21 +49,13 @@ struct etnaviv_iommu_global {
 
 	u32 memory_base;
 
-	/*
-	 * This union holds members needed by either MMUv1 or MMUv2, which
-	 * can not exist at the same time.
-	 */
-	union {
-		struct {
-			struct etnaviv_iommu_context *shared_context;
-		} v1;
-		struct {
-			/* P(age) T(able) A(rray) */
-			u64 *pta_cpu;
-			dma_addr_t pta_dma;
-			DECLARE_BITMAP(pta_alloc, ETNAVIV_PTA_ENTRIES);
-		} v2;
-	};
+	struct etnaviv_iommu_context *shared_context;
+	struct {
+		/* P(age) T(able) A(rray) */
+		u64 *pta_cpu;
+		dma_addr_t pta_dma;
+		DECLARE_BITMAP(pta_alloc, ETNAVIV_PTA_ENTRIES);
+	} v2;
 };
 
 struct etnaviv_iommu_context {
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
