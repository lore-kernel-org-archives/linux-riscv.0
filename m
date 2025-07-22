Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC50AC83F25
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 11:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BVftt2Lq/pctjL5PEC9I4T34581zcoLGDeFmnK9uuBA=; b=OH5qsGxQil4f14
	R5dCHvtycQj3uUqXl02kbQxIcINNgfQIGbdy4hKfM2Bg9xxl45wmhsQ8K0nNixj6C5HnI41lup3xt
	kfu2dAjhPiVRUwUH9Kb4ZN5YQKBWbZlQoOUzXGLTEdCuiPHk0qFWDHytspGpXuEwL7QV8RlrEMZLB
	q7fSrrfXjFwB1NnJJpTsdPAzY9c6vwp8yKOiYlB6391BhFSmihPsmPUUAke++jOL0O5cZkNsNNrkE
	nS7iREbr1RwhzsBLj216vppq7aidoo2NKpN4y5VKCD0mM5wvenSbVCBmyw+BAsT2ExWikHGK+a8Bf
	MZvmG+xrHryikiFA9UCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueB3y-00000002Ga3-3m0v;
	Tue, 22 Jul 2025 11:21:38 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueB3w-00000002GZe-0ofx
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 11:21:37 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753183273; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Gv9oGH68zKdRkIgjVM1zHmhUNikzYByusvfpbbSI3qQrbR6dy7qMYYwdrP+vfVtzjqSY3lUQygV2QTV/Hu1Ti5IJpeQ8rKdG22+0BAYZr0tNvlz9JqyAZ2y3T+rbZe50Mi4MhWEO14deO3OcSdCjzpt1BDVU2sZDspacWWB7heg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753183273; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FmEk2snejcbJWJ/01YuvjfvZovqB2NJooCH4yUHlJEc=; 
	b=B24BUEmKFJAz5yfFZeg5er2Np9zSmQYtrHTHcIqcQYsKrwpBi9jthCB1aH6NLfP4KhDQaCqUOCBndWWI7Dqq5GoTehMGhU3aQGETCOCjahgK9BGvZqk+P3460BfoA1nGGNLGBB1p1KTuBTHVTozOORhc6563ExzGPRN1d9cc5tk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753183273;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=FmEk2snejcbJWJ/01YuvjfvZovqB2NJooCH4yUHlJEc=;
	b=TZ6myj7noYo/vloSK0+qJn14TElPvDkOLnV5/7kic+HAO8Qdthw7GMjZEZUJJdFi
	qJJkpLbCew9GtF4j3OBAD/EGxtlgqClS9ltt3MBSM9G9vlJOXqXdZEUOM2DANShjwF7
	wibTDBRYgilWN6uiJ9RDRtQDh91rdmrG/UzFcbEC/+Un8X5Pc+VkmXnuTB3OCZtF2o7
	xFQkdSYwDrlaT63t9a0R+dH5TenGOie2A50uNZl56lSj7hRUScy78fNMR5wSyFOHkDV
	sQZ4bnGxMt9GxW22cVKDGfEaUAHnPcE/EuIio2MJ9gjZavtajc7SNeF70S8TpHczmwY
	sjw4Lxro0g==
Received: by mx.zohomail.com with SMTPS id 1753183268062183.51689612735777;
	Tue, 22 Jul 2025 04:21:08 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Christian Koenig <christian.koenig@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Han Gao <rabenda.cn@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH] drm/ttm: add pgprot handling for RISC-V
Date: Tue, 22 Jul 2025 19:20:50 +0800
Message-ID: <20250722112050.909616-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_042136_293650_708EC7F2 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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

The RISC-V Svpbmt privileged extension provides support for overriding
page memory coherency attributes, and, along with vendor extensions like
Xtheadmae, supports pgprot_{writecombine,noncached} on RISC-V.

Adapt the codepath that maps ttm_write_combined to pgprot_writecombine
and ttm_noncached to pgprot_noncached to RISC-V, to allow proper page
access attributes.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 drivers/gpu/drm/ttm/ttm_module.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_module.c b/drivers/gpu/drm/ttm/ttm_module.c
index b3fffe7b5062..aa137ead5cc5 100644
--- a/drivers/gpu/drm/ttm/ttm_module.c
+++ b/drivers/gpu/drm/ttm/ttm_module.c
@@ -74,7 +74,8 @@ pgprot_t ttm_prot_from_caching(enum ttm_caching caching, pgprot_t tmp)
 #endif /* CONFIG_UML */
 #endif /* __i386__ || __x86_64__ */
 #if defined(__ia64__) || defined(__arm__) || defined(__aarch64__) || \
-	defined(__powerpc__) || defined(__mips__) || defined(__loongarch__)
+	defined(__powerpc__) || defined(__mips__) || defined(__loongarch__) || \
+	defined(__riscv)
 	if (caching == ttm_write_combined)
 		tmp = pgprot_writecombine(tmp);
 	else
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
