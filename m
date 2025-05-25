Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A83C54FB3
	for <linux-riscv@archiver.kernel.org>; Sun, 25 May 2025 14:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m/maDY1cu2G69ItBHREVLZ78mOLVfmHUjO1BhWkbhmM=; b=GdZ8iXeF05H6sY
	KuAf1b3I1qCPw9VN+UzJRyQXpCQCdIIlBFZrE2pF6MBJEPmY03URYF4FmC9G/s5uJmgm7bk+1xCnQ
	G4eC74dyRODO45spfKWdTDisQCY7BQl0/PwaH87jaupLoTHRtpHSnfs9MvxjCQ2Jl7WIHISjL0UbZ
	KyN3HcdL+3p+/MDhbPDPxeAFudYqxTtMUOCKwp+VIUqhPTvS6LbOXL/mFj8oXlzMDG97nASGLTM0l
	yT02DQwYi/yQ4MH6Rbb8z0TEkp4d4u21YwLrvUg1mBQZAxHqsGZOvZE/6xmdKAoxwgKsk/Pit1/GQ
	V6sbfzNPn6vVN93qgZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJCcx-00000007D2t-0DNp;
	Sun, 25 May 2025 14:47:03 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJCcv-00000007D16-0yF8
	for linux-riscv@lists.infradead.org;
	Sun, 25 May 2025 14:47:02 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-22e09f57ed4so19037255ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 25 May 2025 07:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748184420; x=1748789220; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mUBZLDan2eHNaNoZcWdVDsVnGQBcMSxMokkMwlfK4G4=;
        b=OqwW7q9aph3P2OZ82f0Fh6Qf5bL7pFi3PVS9sTZQMdkiMuO6LbbduZ0U1j/lv8G6rC
         DEYfP5fyanyG3xjo1i36wjIWy8sdTAUQTskp/yG91YimNFrTP5YHVDfn5O9MMn+u7Noy
         1qFp1DGHWHYvF39DchMe+Cc1uYSNw5bm15C05ToeIRcjFyAJ4JCIu75/ceuA2mVkw/Sz
         wyKCMyDoQQ8mUvRX3D73OmiY2xZE8MWiGD8Fvz1r1eH/Cw77X7KMYDu7yVi4U4B+8qH9
         ub6Me4Yb1tuM4HT9HCuqTcLgHM8KsbAklC8yIYW9iKbsXF3X05z1WO0DYkp8OSezGn0E
         AUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748184420; x=1748789220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mUBZLDan2eHNaNoZcWdVDsVnGQBcMSxMokkMwlfK4G4=;
        b=MFVVKl23lZd+E/ugEHnvzUo1SWAt4xl/MIc8zjJ29clFnDaoLX9wvIwJxTo04s+ArF
         0meF1vOpIS/uoYC88omKGxKH5EY+Jctls9nRQO9GRVbGpeWhx/ZVqsl0iWl0i4VuYYlo
         bJ5BM69ndWtheNttgTF9UtFaMLnb6aTpY56SKNJ+8WelDp9CSdwBnmHjiXcs42LJkccn
         9he1hK+x0RhX4hiKozOZhMve96szrN228BezPQ4ersFYxTk+E/xk9UmTB4QYfZIWde9Q
         OeC7jRA1RF0AiiXUSwd5+Y6TBwT6B3qHa8bR+cJprbvJdD0p035gqX6uVylPnRtKFLI1
         UZlg==
X-Forwarded-Encrypted: i=1; AJvYcCXrNHjr8Z9uAq0c86mFXE8dg2++BZh6UBPRTYP6WUpXoVSk6aFHcu46+YeHqEr5E1jXo2GoDLP6x2Hmuw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5v6pjJfB9m+XrpnRKbUgnkL39tXmz8On6hMumnkjwDMvGHXDH
	7uWcI9VSUIYq+R3imlmxRHpk2x2wGz3z5HKDLIGLz8Gxmp3ut0ajCXJw
X-Gm-Gg: ASbGnctDAiGXp8y7M8jGdhMqL4szaYryUZWNHgztgsisBzGo+9eDVO1rA5dj5VOy245
	Ppy4PXysRzClhu2zL8m2h2TUQhR/qOlic3fJZxf5tHAgkSuUUA7Jf47U/kKwm7JJBxYs+mRGCUm
	7lZNXxeceVDy70t+BdKkJxLnT6X9BO+tzbobrKrfwEveelurhsSIYixt2lm0zMZ8jujMfy1/rTk
	6DQRqfZHlQQoNLeWI/5URZ5+uV2WEGyYcTedsMzonFCyT1rOUVA7kp1rZ2+YQugQfh87j+PBUqY
	UYtVfy5sV7SivBgbZRV/fLChl8jOUYHqfECJJW7pLdb+PcQcsBjSTNfy
X-Google-Smtp-Source: AGHT+IHZ4ZVvOSCTSKofCdJ6GvvfD60Ebge+g2JstzGYgmfkSNm08awAgjeBbuyIeU+QYdMtvOSe3A==
X-Received: by 2002:a17:903:2b03:b0:234:557d:a4cb with SMTP id d9443c01a7336-234557da6f4mr15822185ad.20.1748184419704;
        Sun, 25 May 2025 07:46:59 -0700 (PDT)
Received: from eleanor-wkdl.. ([140.116.96.205])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2341b732b58sm25121925ad.180.2025.05.25.07.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 07:46:59 -0700 (PDT)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: thierry.reding@gmail.com,
	mperttunen@nvidia.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	jonathanh@nvidia.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	jserv@ccns.ncku.edu.tw,
	visitorckw@gmail.com,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH] drm: tegra: Fix undefined behavior in left shift operation
Date: Sun, 25 May 2025 22:46:50 +0800
Message-ID: <20250525144650.2365704-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_074701_272835_C670BECB 
X-CRM114-Status: GOOD (  11.07  )
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

According to the C11 standard (ISO/IEC 9899:2011, 6.5.7):
"If E1 has a signed type and E1 x 2^E2 is not representable in the result
type, the behavior is undefined."

Shifting 1 << 31 causes signed integer overflow, which leads to undefined
behavior.

Fix this by explicitly using 'BIT(31)' to ensure the shift operates on an
unsigned type, avoiding undefined behavior.

Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
Compile test only

 drivers/gpu/drm/tegra/dc.c    |  2 +-
 drivers/gpu/drm/tegra/hdmi.c  |  8 ++++----
 drivers/gpu/drm/tegra/hdmi.h  |  8 ++++----
 drivers/gpu/drm/tegra/riscv.c |  2 +-
 drivers/gpu/drm/tegra/sor.h   | 14 +++++++-------
 5 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 430b2eededb2..3047a380bb83 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2171,7 +2171,7 @@ static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
 		u32 syncpt = host1x_syncpt_id(dc->syncpt), enable;
 
 		if (dc->soc->has_nvdisplay)
-			enable = 1 << 31;
+			enable = BIT(31);
 		else
 			enable = 1 << 8;
 
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index e705f8590c13..524b46a297be 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1719,7 +1719,7 @@ static const struct tegra_hdmi_config tegra20_hdmi_config = {
 	.tmds = tegra20_tmds_config,
 	.num_tmds = ARRAY_SIZE(tegra20_tmds_config),
 	.fuse_override_offset = HDMI_NV_PDISP_SOR_LANE_DRIVE_CURRENT,
-	.fuse_override_value = 1 << 31,
+	.fuse_override_value = BIT(31),
 	.has_sor_io_peak_current = false,
 	.has_hda = false,
 	.has_hbr = false,
@@ -1729,7 +1729,7 @@ static const struct tegra_hdmi_config tegra30_hdmi_config = {
 	.tmds = tegra30_tmds_config,
 	.num_tmds = ARRAY_SIZE(tegra30_tmds_config),
 	.fuse_override_offset = HDMI_NV_PDISP_SOR_LANE_DRIVE_CURRENT,
-	.fuse_override_value = 1 << 31,
+	.fuse_override_value = BIT(31),
 	.has_sor_io_peak_current = false,
 	.has_hda = true,
 	.has_hbr = false,
@@ -1739,7 +1739,7 @@ static const struct tegra_hdmi_config tegra114_hdmi_config = {
 	.tmds = tegra114_tmds_config,
 	.num_tmds = ARRAY_SIZE(tegra114_tmds_config),
 	.fuse_override_offset = HDMI_NV_PDISP_SOR_PAD_CTLS0,
-	.fuse_override_value = 1 << 31,
+	.fuse_override_value = BIT(31),
 	.has_sor_io_peak_current = true,
 	.has_hda = true,
 	.has_hbr = true,
@@ -1749,7 +1749,7 @@ static const struct tegra_hdmi_config tegra124_hdmi_config = {
 	.tmds = tegra124_tmds_config,
 	.num_tmds = ARRAY_SIZE(tegra124_tmds_config),
 	.fuse_override_offset = HDMI_NV_PDISP_SOR_PAD_CTLS0,
-	.fuse_override_value = 1 << 31,
+	.fuse_override_value = BIT(31),
 	.has_sor_io_peak_current = true,
 	.has_hda = true,
 	.has_hbr = true,
diff --git a/drivers/gpu/drm/tegra/hdmi.h b/drivers/gpu/drm/tegra/hdmi.h
index 8deb04223c18..57727703779b 100644
--- a/drivers/gpu/drm/tegra/hdmi.h
+++ b/drivers/gpu/drm/tegra/hdmi.h
@@ -119,7 +119,7 @@
 
 #define ACR_SUBPACK_CTS(x) (((x) & 0xffffff) << 8)
 #define ACR_SUBPACK_N(x)   (((x) & 0xffffff) << 0)
-#define ACR_ENABLE         (1 << 31)
+#define ACR_ENABLE         BIT(31)
 
 #define HDMI_NV_PDISP_HDMI_CTRL					0x44
 #define HDMI_CTRL_REKEY(x)         (((x) & 0x7f) <<  0)
@@ -130,7 +130,7 @@
 #define HDMI_NV_PDISP_HDMI_VSYNC_WINDOW				0x46
 #define VSYNC_WINDOW_END(x)   (((x) & 0x3ff) <<  0)
 #define VSYNC_WINDOW_START(x) (((x) & 0x3ff) << 16)
-#define VSYNC_WINDOW_ENABLE   (1 << 31)
+#define VSYNC_WINDOW_ENABLE   BIT(31)
 
 #define HDMI_NV_PDISP_HDMI_GCP_CTRL				0x47
 #define HDMI_NV_PDISP_HDMI_GCP_STATUS				0x48
@@ -158,8 +158,8 @@
 #define SOR_PWR_SAFE_STATE_PD       (0 << 16)
 #define SOR_PWR_SAFE_STATE_PU       (1 << 16)
 #define SOR_PWR_SETTING_NEW_DONE    (0 << 31)
-#define SOR_PWR_SETTING_NEW_PENDING (1 << 31)
-#define SOR_PWR_SETTING_NEW_TRIGGER (1 << 31)
+#define SOR_PWR_SETTING_NEW_PENDING BIT(31)
+#define SOR_PWR_SETTING_NEW_TRIGGER BIT(31)
 
 #define HDMI_NV_PDISP_SOR_TEST					0x56
 #define HDMI_NV_PDISP_SOR_PLL0					0x57
diff --git a/drivers/gpu/drm/tegra/riscv.c b/drivers/gpu/drm/tegra/riscv.c
index 6580416408f8..a5941239b194 100644
--- a/drivers/gpu/drm/tegra/riscv.c
+++ b/drivers/gpu/drm/tegra/riscv.c
@@ -19,7 +19,7 @@
 #define RISCV_BCR_CTRL_CORE_SELECT_RISCV		(1 << 4)
 #define RISCV_BCR_DMACFG				0x466c
 #define RISCV_BCR_DMACFG_TARGET_LOCAL_FB		(0 << 0)
-#define RISCV_BCR_DMACFG_LOCK_LOCKED			(1 << 31)
+#define RISCV_BCR_DMACFG_LOCK_LOCKED			BIT(31)
 #define RISCV_BCR_DMAADDR_PKCPARAM_LO			0x4670
 #define RISCV_BCR_DMAADDR_PKCPARAM_HI			0x4674
 #define RISCV_BCR_DMAADDR_FMCCODE_LO			0x4678
diff --git a/drivers/gpu/drm/tegra/sor.h b/drivers/gpu/drm/tegra/sor.h
index 00e09d5dca30..4f404f22dd04 100644
--- a/drivers/gpu/drm/tegra/sor.h
+++ b/drivers/gpu/drm/tegra/sor.h
@@ -74,7 +74,7 @@
 #define SOR_CAP 0x14
 
 #define SOR_PWR 0x15
-#define  SOR_PWR_TRIGGER			(1 << 31)
+#define  SOR_PWR_TRIGGER			BIT(31)
 #define  SOR_PWR_MODE_SAFE			(1 << 28)
 #define  SOR_PWR_NORMAL_STATE_PU		(1 << 0)
 
@@ -154,7 +154,7 @@
 #define  SOR_SEQ_CTL_PU_PC(x)		(((x) & 0xf) <<  0)
 
 #define SOR_LANE_SEQ_CTL 0x21
-#define  SOR_LANE_SEQ_CTL_TRIGGER		(1 << 31)
+#define  SOR_LANE_SEQ_CTL_TRIGGER		BIT(31)
 #define  SOR_LANE_SEQ_CTL_STATE_BUSY		(1 << 28)
 #define  SOR_LANE_SEQ_CTL_SEQUENCE_UP		(0 << 20)
 #define  SOR_LANE_SEQ_CTL_SEQUENCE_DOWN		(1 << 20)
@@ -163,7 +163,7 @@
 #define  SOR_LANE_SEQ_CTL_DELAY(x)		(((x) & 0xf) << 12)
 
 #define SOR_SEQ_INST(x) (0x22 + (x))
-#define  SOR_SEQ_INST_PLL_PULLDOWN (1 << 31)
+#define  SOR_SEQ_INST_PLL_PULLDOWN BIT(31)
 #define  SOR_SEQ_INST_POWERDOWN_MACRO (1 << 30)
 #define  SOR_SEQ_INST_ASSERT_PLL_RESET (1 << 29)
 #define  SOR_SEQ_INST_BLANK_V (1 << 28)
@@ -192,7 +192,7 @@
 #define  SOR_PWM_DIV_MASK			0xffffff
 
 #define SOR_PWM_CTL 0x33
-#define  SOR_PWM_CTL_TRIGGER			(1 << 31)
+#define  SOR_PWM_CTL_TRIGGER			BIT(31)
 #define  SOR_PWM_CTL_CLK_SEL			(1 << 30)
 #define  SOR_PWM_CTL_DUTY_CYCLE_MASK		0xffffff
 
@@ -261,7 +261,7 @@
 #define  SOR_LANE_POSTCURSOR_LANE0(x) (((x) & 0xff) << 0)
 
 #define SOR_DP_CONFIG0 0x58
-#define SOR_DP_CONFIG_DISPARITY_NEGATIVE	(1 << 31)
+#define SOR_DP_CONFIG_DISPARITY_NEGATIVE	BIT(31)
 #define SOR_DP_CONFIG_ACTIVE_SYM_ENABLE		(1 << 26)
 #define SOR_DP_CONFIG_ACTIVE_SYM_POLARITY	(1 << 24)
 #define SOR_DP_CONFIG_ACTIVE_SYM_FRAC_MASK	(0xf << 16)
@@ -370,7 +370,7 @@
 #define  SOR_HDMI_ACR_SUBPACK_LOW_SB1(x) (((x) & 0xff) << 24)
 
 #define SOR_HDMI_ACR_0320_SUBPACK_HIGH 0xb3
-#define  SOR_HDMI_ACR_SUBPACK_HIGH_ENABLE (1 << 31)
+#define  SOR_HDMI_ACR_SUBPACK_HIGH_ENABLE BIT(31)
 
 #define SOR_HDMI_ACR_0441_SUBPACK_LOW 0xb4
 #define SOR_HDMI_ACR_0441_SUBPACK_HIGH 0xb5
@@ -382,7 +382,7 @@
 #define  SOR_HDMI_CTRL_REKEY(x) (((x) & 0x7f) << 0)
 
 #define SOR_HDMI_SPARE 0xcb
-#define  SOR_HDMI_SPARE_ACR_PRIORITY_HIGH (1 << 31)
+#define  SOR_HDMI_SPARE_ACR_PRIORITY_HIGH BIT(31)
 #define  SOR_HDMI_SPARE_CTS_RESET(x) (((x) & 0x7) << 16)
 #define  SOR_HDMI_SPARE_HW_CTS_ENABLE (1 << 0)
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
