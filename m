Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2988DCAC580
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 07:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6LSPGpJ5RkQdXJdOuFUfdogLsTSYNx6rRGivNc4ARjQ=; b=VfblmxEz26mEDh
	jnhxGYqgDg72NbXSJMZ6DqGf2WJVgBV4JFdJT49Eu6EsnbYFKsI9/uOHqU36VNgKKkc3tTTfd8Qyz
	vVv+f0Zi3d9ATzo1bWYCMk3rinr9iL+MWdwHwMweWBF9L0i7ZN7Y9n3MmJbKgwIWegI0agtWdjCk1
	ywVM36ZPFu84CquXPIq/PaZeyg1c7RD/q94B74V4h7SNiVYVk1J2SELxh06G8iA0LxXAtH/rNrYkF
	mZYAN9E4dqke55BwijZyz5X3+YXOqRVK9r8RQKXxApk9aI1iEFnEAWQsFMCilVYOrFgcQkNFvRJ/e
	Ez1rkjKhPhClqroU6krw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4lC-0000000A0ZD-4BN7;
	Thu, 04 Sep 2025 07:51:59 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4T1-00000009tBk-46QN
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 07:33:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1756971184; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=no4G4U4VTPUEeCXAYyz0MmsXiOaO0yNzUNM12+zgecrXH2aqWdG6Xz3b3XUDZy505ydhXLrde107DktyYH/JfAuzemSTUgr8D0OixdvA7+DUW+M45AvcQirQEKfrZnW0C/hgKIbo0ClH/9xfv8f2/Cj+DPsocQgjqrOMpSwPV7g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1756971184; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Gpts7NthN3eibQeZcZSvSI9koYWBnwv2X6pMUbjR4LA=; 
	b=FlT2y2BMEKv/azvXnUrNsTlOSPxovipKC4PPdOHhbXkbLlAtvkmT935UiMmge/W7ehEuM4MHzcIkfcdrOcQ7LKmIdVfIuXKgAg6neZdOiiIRxF/TSFF4Jjyvg9RfxNDoLE3FEeD5GPGIWyQaq+Fki3V+Nrg13FKtsUSYZh0Ovls=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756971184;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Gpts7NthN3eibQeZcZSvSI9koYWBnwv2X6pMUbjR4LA=;
	b=B6bf3QTTVN+bwbuz986odcG8+mnqNaZHoKKyjRNlKt4HqBIHjRhZOy3son02rUUR
	cs40uPIfW/1mD7Ei45RXzzzxJax1zACDC+8d2Kioc45xSfSTna0rdvH60nZFDPWjxe0
	SB0wSbeik3PU4W9vC62al5hX636fKVvHUanLgWA3es9U7EPliep0ByhuDyXlSN5Vimu
	GfjtJCx1xslOhbi4S2WTZYtOsKmQadfHXWRdzIHLHc5Tde3ieZdXiSK4bPB+0YMj9Cu
	FY8cU1NSs8sd40TW6g9nV47Pf6bXnk4X1YDT+OsJxZCyE11CO/d/j514ipnHj/7LbO2
	OP+9/1uezg==
Received: by mx.zohomail.com with SMTPS id 1756971181360796.0305334552593;
	Thu, 4 Sep 2025 00:33:01 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org,
	etnaviv@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 4/7] drm/etnaviv: protect whole iommuv2 ctx alloc func under global mutex
Date: Thu,  4 Sep 2025 15:31:48 +0800
Message-ID: <20250904073151.686227-5-uwu@icenowy.me>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904073151.686227-1-uwu@icenowy.me>
References: <20250904073151.686227-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_003312_073618_A7A7478A 
X-CRM114-Status: GOOD (  10.14  )
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

As we are forced to use a global shared context on some
PTA-equipped-but-broken GPUs, the fine-grained mutex locking in the
current implemtnation of etnaviv_iommuv2_context_alloc() won't be
meaningful any more.

Make the whole function to be protected by the global lock, in order to
prevent reentrance when allocating global shared context.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
No changes in v2.

 drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c b/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
index d664ae29ae209..5654a604c70cf 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
@@ -272,20 +272,18 @@ etnaviv_iommuv2_context_alloc(struct etnaviv_iommu_global *global)
 	struct etnaviv_iommuv2_context *v2_context;
 	struct etnaviv_iommu_context *context;
 
+	mutex_lock(&global->lock);
+
 	v2_context = vzalloc(sizeof(*v2_context));
 	if (!v2_context)
-		return NULL;
+		goto out_mutex_unlock;
 
-	mutex_lock(&global->lock);
 	v2_context->id = find_first_zero_bit(global->v2.pta_alloc,
 					     ETNAVIV_PTA_ENTRIES);
-	if (v2_context->id < ETNAVIV_PTA_ENTRIES) {
+	if (v2_context->id < ETNAVIV_PTA_ENTRIES)
 		set_bit(v2_context->id, global->v2.pta_alloc);
-	} else {
-		mutex_unlock(&global->lock);
+	else
 		goto out_free;
-	}
-	mutex_unlock(&global->lock);
 
 	v2_context->mtlb_cpu = dma_alloc_wc(global->dev, SZ_4K,
 					    &v2_context->mtlb_dma, GFP_KERNEL);
@@ -304,11 +302,14 @@ etnaviv_iommuv2_context_alloc(struct etnaviv_iommu_global *global)
 	INIT_LIST_HEAD(&context->mappings);
 	drm_mm_init(&context->mm, SZ_4K, (u64)SZ_1G * 4 - SZ_4K);
 
+	mutex_unlock(&global->lock);
 	return context;
 
 out_free_id:
 	clear_bit(v2_context->id, global->v2.pta_alloc);
 out_free:
 	vfree(v2_context);
+out_mutex_unlock:
+	mutex_unlock(&global->lock);
 	return NULL;
 }
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
