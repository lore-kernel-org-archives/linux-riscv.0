Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72444CA101F
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 07:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BPG0wvmQ5PS3rBEhT60BujqpRRKerXOcuV+fB2AzqqA=; b=dMa47MhUBGqYQT
	SBl8bV4Qet290Th4EbE9K2AiTLjpTqhiJLM7K0kNyPTInsH/P9Z7jP5hCLabhzaRBryJCZQvI2mf9
	NN8VM8fzUkKw1nSDu4aatqRn9XbsWMlB4NR243PvtEF9Kpdm851MG3f0+fCz1sf0t6SD2/kPnWrnr
	m4QFVwRc0RcC+f0WzEtHpzC/vvPv1K+rU0Wx1zRNk3EhIU6kHYukajFCqy8lynrYqV1saxRvawoWh
	6uZ7sYrd9NU4WnLmHeDWcR6mAawdNYsirrnfbPQoezHfiuPmNeMW9UmKFcoLe91bfdOHYGwDNDyQv
	hqwDQtArztmWbKSqSreQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4lC-0000000A0YD-1CAm;
	Thu, 04 Sep 2025 07:51:58 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4Sr-00000009t7R-38le
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 07:33:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1756971173; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=N830F5wCRmvGHXVmsXdayID+KtpY2o6AJO2tdC0f/MH1zdB1usLtXMzO6ttVurh9YjURoo37Ub/Xeh932XUgp72R0QxWNr6lhhQYf2LfhCalx7BAZnpIz3meRa69wbSqjh48nBN3ViCOkgeQ40jzbi64IBHHOkvc2tB1i7oGbr8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1756971173; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=p9rz+uqQBiZe0UfpVbdcyvqjvC0WRMUSRqowV8Z/90g=; 
	b=Phi3WAXsrZHdA+DfeIi7LkCkmOTlCTmWg5araHSQb5tZBmjMZCDJyUENygcoq9WoX7Qf5MFPDsPSVlkPPN32jEWJ+VgrjiuQE3+sZFU6atnebIwSR55kUBLSP7cgapQI8CA5kxcVP/KELsFbbYpcQYKcKO6NhquBXUhjdHvbqos=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756971173;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=p9rz+uqQBiZe0UfpVbdcyvqjvC0WRMUSRqowV8Z/90g=;
	b=iJRsZ5KaFmvFZsr/OqKS1U0LB+C82w9uTKq2gw3yjnGuhrqWdirmTddpGoSKJNGa
	jPBKusVIlHBZD3zBs3grmOEaCUD5YysN3xzP2pNJnRttlBOWsYMgksP+hAdjwUZw6CS
	0DdpHnb5uB/+TK5e3sAWvqrTkFvrtgTYvj+oTec/NGxsYGZINyLb0TgQDLgiXOyz/tG
	VleSIqFbtAQ8eSGxQmlCH/tbqLNBjDGW+dqUKWRtHy243kZ3TViprgaIZQA1ekX5raY
	Tfj2Opj/IfykXHK+i5Y+lpjkNyIaZfcX6DbP2ZeIjoZiZ/kHqtXDaYWMEUjgohx08M3
	EuuTn1LlnA==
Received: by mx.zohomail.com with SMTPS id 1756971172084895.5447141221532;
	Thu, 4 Sep 2025 00:32:52 -0700 (PDT)
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
Subject: [PATCH v2 3/7] drm/etnaviv: setup DEC400EX on GC620 r5552
Date: Thu,  4 Sep 2025 15:31:47 +0800
Message-ID: <20250904073151.686227-4-uwu@icenowy.me>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904073151.686227-1-uwu@icenowy.me>
References: <20250904073151.686227-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_003301_845768_ADFDCD51 
X-CRM114-Status: GOOD (  11.91  )
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

The GC620 r5552 GPU found on T-Head TH1520 features (and requires) a
DEC400EX buffer compressor that needs to be set up. In addition, some
quirk exist for the DEC400 part that needs to be handled during GPU
reset, otherwise the reset will not happen.

Set the DEC400EX up and add the quirk code to the GPU reset codepath.

Currently the DEC400EX setup is gated by this specific GPU identity,
however in future we should add a feature flag for it.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
No changes in v2.

 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 7431e180b3ae4..a8d4394c8f637 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -559,6 +559,10 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
 		control |= VIVS_HI_CLOCK_CONTROL_ISOLATE_GPU;
 		gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, control);
 
+		if (etnaviv_is_model_rev(gpu, 0x620, 0x5552)) {
+			gpu_write(gpu, VIVS_DEC400EX_UNK00800, 0x10);
+		}
+
 		if (gpu->identity.minor_features7 & chipMinorFeatures7_BIT_SECURITY) {
 			gpu_write(gpu, VIVS_MMUv2_AHB_CONTROL,
 			          VIVS_MMUv2_AHB_CONTROL_RESET);
@@ -797,6 +801,15 @@ static void etnaviv_gpu_hw_init(struct etnaviv_gpu *gpu)
 		gpu_write(gpu, VIVS_MC_BUS_CONFIG, bus_config);
 	}
 
+	/*
+	 * FIXME: Required by GC620 r5552 as a bug workaround, but might be
+	 * useful on other GPUs with G2D_DEC400EX feature too.
+	 */
+	if (etnaviv_is_model_rev(gpu, 0x620, 0x5552)) {
+		gpu_write(gpu, VIVS_DEC400EX_UNK00800, 0x2010188);
+		gpu_write(gpu, VIVS_DEC400EX_UNK00808, 0x3fc104);
+	}
+
 	if (gpu->identity.minor_features7 & chipMinorFeatures7_BIT_SECURITY) {
 		u32 val = gpu_read(gpu, VIVS_MMUv2_AHB_CONTROL);
 		val |= VIVS_MMUv2_AHB_CONTROL_NONSEC_ACCESS;
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
