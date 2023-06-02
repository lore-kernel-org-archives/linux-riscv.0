Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82916C77B7A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 07:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g9EQsh9INY+cNIZ4tC424BB++mN85gpG2Cb4kzIDxbA=; b=tsvrBJy72RcDJU
	4XqWHmipULHrb1EIxBHlCanCOesjCVG3rMcFvw7XAG3PT5imAvU0o5mDR98Z0e7zM2wbjTWDM5fUa
	WdHvfYuZ6bjwkEskugiNtLSM67BFO5kfK/IAgN5ud+jhVlksU1vrQeeHoKWvy7R38/fcquki1lvjo
	rpZY9ZLF1Wv/fB1xWDyXhaofYgSPq7cCeV+uh2ZhAvkKZVLTLGx+eu/biinKsZGs5XoogAmNpsGS+
	PeYDMClsfxQWT5PhzOahQHNYKKBpbIZ+sXEMvRxp3Ha0bc8aD+ptsZ1YGvxCCLe+yy3p2ZgVJxSMe
	Nh0L9bpgIvAQIdVOKvMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4zPa-0062Ja-0O;
	Fri, 02 Jun 2023 07:41:26 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4zPV-0062G2-1g
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 07:41:24 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 13F9B8109;
	Fri,  2 Jun 2023 15:40:49 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Jun
 2023 15:40:49 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Jun
 2023 15:40:48 +0800
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
Subject: [PATCH 5/9] drm/verisilicon: Add mode config funcs
Date: Fri, 2 Jun 2023 15:40:39 +0800
Message-ID: <20230602074043.33872-6-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602074043.33872-1-keith.zhao@starfivetech.com>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_004121_904205_6C465379 
X-CRM114-Status: GOOD (  22.88  )
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

Add mode setting functions for JH7110 SoC.

Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
---
 drivers/gpu/drm/verisilicon/Makefile |   1 +
 drivers/gpu/drm/verisilicon/vs_drv.c |   3 +
 drivers/gpu/drm/verisilicon/vs_fb.c  | 181 +++++++++++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_fb.h  |  15 +++
 4 files changed, 200 insertions(+)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_fb.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_fb.h

diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
index 30360e370e47..38254dc5d98d 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 vs_drm-objs := vs_drv.o \
+		vs_fb.o \
 		vs_gem.o
 
 obj-$(CONFIG_DRM_VERISILICON) += vs_drm.o
diff --git a/drivers/gpu/drm/verisilicon/vs_drv.c b/drivers/gpu/drm/verisilicon/vs_drv.c
index e0a2fc43b55f..d84aacd751bc 100644
--- a/drivers/gpu/drm/verisilicon/vs_drv.c
+++ b/drivers/gpu/drm/verisilicon/vs_drv.c
@@ -30,6 +30,7 @@
 #include <drm/drm_vblank.h>
 
 #include "vs_drv.h"
+#include "vs_fb.h"
 #include "vs_gem.h"
 
 #define DRV_NAME	"starfive"
@@ -118,6 +119,8 @@ static int vs_drm_bind(struct device *dev)
 	if (ret)
 		goto err_mode;
 
+	vs_mode_config_init(drm_dev);
+
 	ret = drm_vblank_init(drm_dev, drm_dev->mode_config.num_crtc);
 	if (ret)
 		goto err_bind;
diff --git a/drivers/gpu/drm/verisilicon/vs_fb.c b/drivers/gpu/drm/verisilicon/vs_fb.c
new file mode 100644
index 000000000000..3e85f7365084
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_fb.c
@@ -0,0 +1,181 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#include <linux/module.h>
+#include <linux/version.h>
+
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+
+#include "vs_fb.h"
+#include "vs_gem.h"
+
+#define fourcc_mod_vs_get_type(val) \
+	(((val) & DRM_FORMAT_MOD_VS_TYPE_MASK) >> 54)
+
+static struct drm_framebuffer_funcs vs_fb_funcs = {
+	.create_handle	= drm_gem_fb_create_handle,
+	.destroy	= drm_gem_fb_destroy,
+	.dirty		= drm_atomic_helper_dirtyfb,
+};
+
+static struct drm_framebuffer *
+vs_fb_alloc(struct drm_device *dev, const struct drm_mode_fb_cmd2 *mode_cmd,
+	    struct vs_gem_object **obj, unsigned int num_planes)
+{
+	struct drm_framebuffer *fb;
+	int ret, i;
+
+	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
+	if (!fb)
+		return ERR_PTR(-ENOMEM);
+
+	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
+
+	for (i = 0; i < num_planes; i++)
+		fb->obj[i] = &obj[i]->base;
+
+	ret = drm_framebuffer_init(dev, fb, &vs_fb_funcs);
+	if (ret) {
+		dev_err(dev->dev, "Failed to initialize framebuffer: %d\n",
+			ret);
+		kfree(fb);
+		return ERR_PTR(ret);
+	}
+
+	return fb;
+}
+
+static struct drm_framebuffer *vs_fb_create(struct drm_device *dev,
+					    struct drm_file *file_priv,
+					    const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	struct drm_framebuffer *fb;
+	const struct drm_format_info *info;
+	struct vs_gem_object *objs[MAX_NUM_PLANES];
+	struct drm_gem_object *obj;
+	unsigned int height, size;
+	unsigned char i, num_planes;
+	int ret = 0;
+
+	info = drm_get_format_info(dev, mode_cmd);
+	if (!info)
+		return ERR_PTR(-EINVAL);
+
+	num_planes = info->num_planes;
+	if (num_planes > MAX_NUM_PLANES)
+		return ERR_PTR(-EINVAL);
+
+	for (i = 0; i < num_planes; i++) {
+		obj = drm_gem_object_lookup(file_priv, mode_cmd->handles[i]);
+		if (!obj) {
+			dev_err(dev->dev, "Failed to lookup GEM object.\n");
+			ret = -ENXIO;
+			goto err;
+		}
+
+		height = drm_format_info_plane_height(info,
+						      mode_cmd->height, i);
+
+		size = height * mode_cmd->pitches[i] + mode_cmd->offsets[i];
+
+		if (obj->size < size) {
+			drm_gem_object_put(obj);
+
+			ret = -EINVAL;
+			goto err;
+		}
+
+		objs[i] = to_vs_gem_object(obj);
+	}
+
+	fb = vs_fb_alloc(dev, mode_cmd, objs, i);
+	if (IS_ERR(fb)) {
+		ret = PTR_ERR(fb);
+		goto err;
+	}
+
+	return fb;
+
+err:
+	for (; i > 0; i--)
+		drm_gem_object_put(&objs[i - 1]->base);
+
+	return ERR_PTR(ret);
+}
+
+struct vs_gem_object *vs_fb_get_gem_obj(struct drm_framebuffer *fb,
+					unsigned char plane)
+{
+	if (plane > MAX_NUM_PLANES)
+		return NULL;
+
+	return to_vs_gem_object(fb->obj[plane]);
+}
+
+static const struct drm_format_info vs_formats[] = {
+	{.format = DRM_FORMAT_NV12, .depth = 0, .num_planes = 2, .char_per_block = { 20, 40, 0 },
+	 .block_w = { 4, 4, 0 }, .block_h = { 4, 4, 0 }, .hsub = 2, .vsub = 2, .is_yuv = true},
+	{.format = DRM_FORMAT_YUV444, .depth = 0, .num_planes = 3, .char_per_block = { 20, 20, 20 },
+	 .block_w = { 4, 4, 4 }, .block_h = { 4, 4, 4 }, .hsub = 1, .vsub = 1, .is_yuv = true},
+};
+
+static const struct drm_format_info *
+vs_lookup_format_info(const struct drm_format_info formats[],
+		      int num_formats, u32 format)
+{
+	int i;
+
+	for (i = 0; i < num_formats; i++) {
+		if (formats[i].format == format)
+			return &formats[i];
+	}
+
+	return NULL;
+}
+
+static const struct drm_format_info *
+vs_get_format_info(const struct drm_mode_fb_cmd2 *cmd)
+{
+	if (fourcc_mod_vs_get_type(cmd->modifier[0]) ==
+		DRM_FORMAT_MOD_VS_TYPE_CUSTOM_10BIT)
+		return vs_lookup_format_info(vs_formats, ARRAY_SIZE(vs_formats),
+									 cmd->pixel_format);
+	else
+		return NULL;
+}
+
+static const struct drm_mode_config_funcs vs_mode_config_funcs = {
+	.fb_create			 = vs_fb_create,
+	.get_format_info	 = vs_get_format_info,
+	.output_poll_changed = drm_fb_helper_output_poll_changed,
+	.atomic_check		 = drm_atomic_helper_check,
+	.atomic_commit		 = drm_atomic_helper_commit,
+};
+
+static struct drm_mode_config_helper_funcs vs_mode_config_helpers = {
+	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+};
+
+void vs_mode_config_init(struct drm_device *dev)
+{
+	dev->mode_config.fb_modifiers_not_supported = false;
+
+	if (dev->mode_config.max_width == 0 ||
+	    dev->mode_config.max_height == 0) {
+		dev->mode_config.min_width  = 0;
+		dev->mode_config.min_height = 0;
+		dev->mode_config.max_width  = 4096;
+		dev->mode_config.max_height = 4096;
+	}
+	dev->mode_config.funcs = &vs_mode_config_funcs;
+	dev->mode_config.helper_private = &vs_mode_config_helpers;
+}
diff --git a/drivers/gpu/drm/verisilicon/vs_fb.h b/drivers/gpu/drm/verisilicon/vs_fb.h
new file mode 100644
index 000000000000..78dda8e42894
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_fb.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef __VS_FB_H__
+#define __VS_FB_H__
+
+#define MAX_NUM_PLANES		3 /* colour format plane */
+
+struct vs_gem_object *vs_fb_get_gem_obj(struct drm_framebuffer *fb,
+					unsigned char plane);
+
+void vs_mode_config_init(struct drm_device *dev);
+#endif /* __VS_FB_H__ */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
