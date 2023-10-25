Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1B9C25B6B
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 10:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmz8V/0J+1p8YvHGWDR0U9kcdTxRORI29IDZdNSsd7I=; b=LmmW/KRbkw7ksi
	0kYuIRLCm1M52PfojUhpN+WT5DLVT7KqXyvLeuNcWp7pKfFBpy0tiJCMKut4vDsxJ5lYl2iJaaJv1
	a5Q/+QZJx2pM33/b4a1ND9sRfkDICGeVdnV5MyQ6+VmO4ckgriaDXUUWCAFmg4laoJxJVKDjENm/V
	dYgl9S6juj0/6Lgm0istfZYUoKfmaxJnWP2WtnW/lFT3tg1VhKngbWJJqwUd0DP/ewH/SBcrphizH
	XLSFax2V2aTaJoCFlWGEPhrp4AQPT2tuuX6C1Ix/2evvJPkIIHtWDAycVqjTNADvfXiRRqM3eC1/c
	7eV+Nd1LqHDqgQBEJakQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvbJd-00C5Uh-1e;
	Wed, 25 Oct 2023 10:40:45 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvbJZ-00C5PI-0C
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 10:40:42 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 9330F83D4;
	Wed, 25 Oct 2023 18:39:59 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 25 Oct
 2023 18:39:59 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 25 Oct
 2023 18:39:59 +0800
From: Keith Zhao <keith.zhao@starfivetech.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Emil Renner Berthing" <kernel@esmil.dk>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel
	<p.zabel@pengutronix.de>, Sumit Semwal <sumit.semwal@linaro.org>,
	<christian.koenig@amd.com>, Bjorn Andersson <andersson@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>, Jagan Teki
	<jagan@edgeble.ai>, Chris Morgan <macromorgan@hotmail.com>, Keith Zhao
	<keith.zhao@starfivetech.com>, Jack Zhu <jack.zhu@starfivetech.com>,
	Shengyang Chen <shengyang.chen@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>
Subject: [PATCH v2 3/6] drm/fourcc: Add drm/vs tiled modifiers
Date: Wed, 25 Oct 2023 18:39:54 +0800
Message-ID: <20231025103957.3776-4-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025103957.3776-1-keith.zhao@starfivetech.com>
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_034041_421405_8D8AB529 
X-CRM114-Status: GOOD (  10.39  )
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

For each modifier, add the corresponding description

Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
---
 include/uapi/drm/drm_fourcc.h | 57 +++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 8db7fd3f7..a580a848c 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -419,6 +419,7 @@ extern "C" {
 #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
 #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
+#define DRM_FORMAT_MOD_VENDOR_VERISILICON 0x0b
 
 /* add more to the end as needed */
 
@@ -1562,6 +1563,62 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 #define AMD_FMT_MOD_CLEAR(field) \
 	(~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
 
+#define DRM_FORMAT_MOD_VERISILICON_TYPE_NORMAL					0x00
+#define DRM_FORMAT_MOD_VERISILICON_TYPE_MASK					((__u64)0x3 << 54)
+
+#define fourcc_mod_vs_code(type, val) \
+	fourcc_mod_code(VERISILICON, ((((__u64)type) << 54) | (val)))
+
+#define DRM_FORMAT_MOD_VERISILICON_NORM_MODE_MASK				0x1F
+
+/*
+ * An x-major 8x8 super tile consists of 64 8x8 sub-tiles in total.
+ * Each 8x8 sub-tile consists of four standard tiles .
+ * standard tiles (see Vivante 4x4 tiling layout)
+ */
+#define DRM_FORMAT_MOD_VERISILICON_SUPER_TILED_XMAJOR_8X8		0x02
+
+/*
+ * A y-major 8x8 super tile consists of 64 8x8 sub-tiles in total.
+ * Each 8x8 sub-tile consists of four standard tiles .
+ * standard tiles (see Vivante 4x4 tiling layout)
+ */
+#define DRM_FORMAT_MOD_VERISILICON_SUPER_TILED_YMAJOR_8X8		0x03
+
+/*
+ * An 8x8 tile consists of four standard tiles
+ * that are organized in Z-order.
+ * standard tiles (see Vivante 4x4 tiling layout)
+ */
+#define DRM_FORMAT_MOD_VERISILICON_TILE_8X8						0x04
+
+/*
+ * An 8x4 tile consists of two standard tiles
+ * that are organized in Z-order.
+ * standard tiles (see Vivante 4x4 tiling layout)
+ */
+#define DRM_FORMAT_MOD_VERISILICON_TILE_8X4						0x07
+
+/*
+ * An x-major 8x4 super tile consists of 128 8x4 sub-tiles in total.
+ * Each 8x4 sub-tile consists of two standard tiles.
+ * two standard tiles also same with DRM_FORMAT_MOD_VS_TILE_8X4
+ * standard tiles (see Vivante 4x4 tiling layout)
+ */
+#define DRM_FORMAT_MOD_VERISILICON_SUPER_TILED_XMAJOR_8X4		0x0B
+
+/*
+ * A y-major 4x8 super tile consists of 128 4x8 sub-tiles in total.
+ * Each 4x8 sub-tile consists of two standard tiles.
+ * two standard tiles also same with DRM_FORMAT_MOD_VS_TILE_8X4
+ * standard tiles (see Vivante 4x4 tiling layout)
+ */
+#define DRM_FORMAT_MOD_VERISILICON_SUPER_TILED_YMAJOR_4X8    0x0C
+
+#define fourcc_mod_vs_norm_code(tile) \
+	fourcc_mod_vs_code(DRM_FORMAT_MOD_VERISILICON_TYPE_NORMAL, \
+				(tile))
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
