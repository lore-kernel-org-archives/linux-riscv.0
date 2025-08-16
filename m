Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B68CA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 07:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dc2da2l3TZn+3vA6Jm+n+qQ6VRECbb/3GRaHvVKfwxM=; b=I//qFElmo/82Gs
	KyAqrxv2dV9LWNxmY2F7GQbPtJxwzqGeRyGkiS2cdNiSaRfvC4OZXcvpuT55gyAzLubF/jpnRR90j
	FQprD5slG3iSFttZ3vTBYP4KBm8DIXzEDNFyXdLfpajQJVtZtK4yo9wKtfl8FLLktuWn5KJoMMYv7
	zvf24KqQ9VCsCyWbh7JeGuLJBil09i/tggCOM8zCAK8gAW60JFF8ytXAbb9GNevJ4kXXu/E9cUh0X
	ewYhNrevLqVodHIgQIxWfX4xLI7bTOhL8F8Lv1uNlxuj90RYwXhaNro/G2+2dzE7TpslA/+jzU5kh
	mdw1AwMKO8QXIpBL4umw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unBfH-00000004Egu-2Ex6;
	Sat, 16 Aug 2025 07:49:23 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unBfE-00000004Ef6-37XB
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 07:49:21 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755330551; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GGx/y22vt2n1+VvXqcL2yWNISLQy4SswC3PcUorScO2WXW70gvIjkkcb8kSaKdDQIafkgPuRGr+/0gGiNJzSTDqYog+q4VV5Fh3NDjxibz04TKFC+yV3xCD1q+FQ+I5bbOPaqrOG49zq14gmMQGL56ZoE0l9zfBP/YEA9WDq08I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755330551; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cUbeoz3eH2Lp/NXawnV6Nuu9wKEOZRT4VvJUTFslJ1M=; 
	b=JE6YfCJ4AaU1Dwlvhzd60dYfZzy+C8zMgltuqNXSaanwAkTwnumHETf/QIzxB3j1xvY3ssIOVFbi5yHv1Aw6P6u3o5lYlk8anlTwGoc/v3vRsnsbXnZLtA1yXEmYMjCK9iukawYr1n225tfNiOHzu4hl4Gh1sgEaQ8JB7Y/D3Mg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755330551;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cUbeoz3eH2Lp/NXawnV6Nuu9wKEOZRT4VvJUTFslJ1M=;
	b=jUmOF3tpWt6gG0OC6wxeq1XDIjFVEXlKRh3WkQCtROEYE4OJRzhrgRmBQ9RS7hrv
	Bwrzmv/CfFWEkfgZhfnt5pUMQb1l1eVEiQEwU/q3vfiSfXMbxxrIskYN/HX7NsFGouY
	z6Jm8m2OqtHSX3SS2biCDxFynVBSPGyN2BSleC6rwMi6JR1tQdppG9fLq19CgP4VbDN
	HYnOooly7hRmXUdvxN7DJg9Ljiz77t2shehAFugY5xf8jgXQEmWsiDdC3RRH7U4rWp7
	i9y8UCgCnn9I9vS4TvzA1e5fttjypXdYfvmZaaNQzusw7tbK1MgdnqzeKhv8K7jr9/C
	evok/aeJTQ==
Received: by mx.zohomail.com with SMTPS id 1755330548740860.1574521157502;
	Sat, 16 Aug 2025 00:49:08 -0700 (PDT)
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
Subject: [PATCH 3/7] drm/etnaviv: setup DEC400EX on GC620 r5552
Date: Sat, 16 Aug 2025 15:47:53 +0800
Message-ID: <20250816074757.2559055-4-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816074757.2559055-1-uwu@icenowy.me>
References: <20250816074757.2559055-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_004920_840247_8AD7CA3D 
X-CRM114-Status: GOOD (  11.50  )
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
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
