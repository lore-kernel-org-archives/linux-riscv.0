Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B28CFC280
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 13:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7biyF5O14VPkj/VtDLWdHeC7mLQUYUN+bEfcvZpPMDI=; b=RkVedkqJFoHZxG
	++7D2k/mc8uni6ztTdFFTqhclV6y+Pt90Tbk6RKqgBR4S0mgtHZFC9hn3DvnLgU6pVwy5IFfrsNey
	6gVYyp0nosKMSRbE2ZnMu/Rvef0MAB9BqLZ4V1lq16N/EhAeZRIdkkr6wQOzhY7edy8S37yXO+cMn
	/D9R/WuW9HPkUY1O7GcBcMYVpBIwBFwfy/EPuOVrA18xgKQfAEVrxlKDyMtZ/mz8v3sBnd14I8f73
	WagEc8peCmoi6OFt3Oxl3+7rkG1JXlmHAm7vXHeTr+PLj9zMG0xlR4hG2W5Rwbg80drK/RdI9U9k/
	Y9U5kwi6wwnqBevuaafQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRdB-00000008TNQ-0ADA;
	Fri, 21 Nov 2025 13:56:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRd5-00000008THA-0zxo
	for linux-riscv@bombadil.infradead.org;
	Fri, 21 Nov 2025 13:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0IyiIhaEl6CE8qIj09KectGI7dNfK8v13xrzuko4YKY=; b=rLAdt5Tde4PRc6KbvOnoce7hKJ
	SNu2fJnsolzU27Wnk+TWRfC6frbKvZffUsV1rvT0p/WbV0yvFtj5J4rwdIHXde2Albgct2J9cQTxY
	ke+xMN2BSOuds910zsiVmNOCqEOMC+bJOFJESezEyjb4MK+Xakt6PPIA5Zl3ZGM/zOz5P03HwaLpu
	OD9U8sy4UFb2m5zLPD+oimKvioHgA+MGYPd9KjGRx8WV6MsoDhDQUq1trV4MZ05gW/9kxMqsEJr6L
	s04dT6AoE393TvdSlEoMarga/oFJclgYZVdgj2kslZyCmxzKrA926zFNuTnsbo5/JLBGiwLhAq1/O
	3bSzeEHQ==;
Received: from smtp-out1.suse.de ([195.135.223.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMQlO-0000000Gu1E-2w5Q
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 13:01:24 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 09C31218F4;
	Fri, 21 Nov 2025 13:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763733393; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0IyiIhaEl6CE8qIj09KectGI7dNfK8v13xrzuko4YKY=;
	b=xF0kHtiXXUWoN3S5ekmTQP/UJV8Ahv4IoX9tnPUJUqVbCgTNiQXJU2C0eww4V2tWqgTN+f
	bSwHpJIF5DohvIL4WU1g7FIo8ga4OrAx+cuXjCq4xUJISpwzm8BfZDg7AxdHZ1NLedVrJg
	WYoiqTJfeiWf61nHGAFBeHeYZOzOW6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763733393;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0IyiIhaEl6CE8qIj09KectGI7dNfK8v13xrzuko4YKY=;
	b=tyYedpPucuXO1lZdE8/02tWRAq0Bho4DVmILep2/MImDmBvh/X4HJmm7tnKlNEszl6mIEE
	cNfjF5lXojC3g1BQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763733393; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0IyiIhaEl6CE8qIj09KectGI7dNfK8v13xrzuko4YKY=;
	b=xF0kHtiXXUWoN3S5ekmTQP/UJV8Ahv4IoX9tnPUJUqVbCgTNiQXJU2C0eww4V2tWqgTN+f
	bSwHpJIF5DohvIL4WU1g7FIo8ga4OrAx+cuXjCq4xUJISpwzm8BfZDg7AxdHZ1NLedVrJg
	WYoiqTJfeiWf61nHGAFBeHeYZOzOW6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763733393;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0IyiIhaEl6CE8qIj09KectGI7dNfK8v13xrzuko4YKY=;
	b=tyYedpPucuXO1lZdE8/02tWRAq0Bho4DVmILep2/MImDmBvh/X4HJmm7tnKlNEszl6mIEE
	cNfjF5lXojC3g1BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A6A703EA62;
	Fri, 21 Nov 2025 13:56:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2Dx9J5BvIGkqdQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 21 Nov 2025 13:56:32 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ardb@kernel.org,
	javierm@redhat.com,
	arnd@arndb.de
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-hyperv@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/6] sysfb: Pass sysfb_primary_display to devices
Date: Fri, 21 Nov 2025 14:36:09 +0100
Message-ID: <20251121135624.494768-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251121135624.494768-1-tzimmermann@suse.de>
References: <20251121135624.494768-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RLykjg6e7ifkwtw7jmpw7b9yio)];
	RCVD_TLS_ALL(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_130123_004622_C8938230 
X-CRM114-Status: GOOD (  17.01  )
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

Instead of screen_info, store a copy of sysfb_primary_display as
device data. Pick it up in drivers. Later changes will add additional
data to the display info, such as EDID information.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/firmware/sysfb.c        |  5 +++--
 drivers/gpu/drm/sysfb/efidrm.c  |  9 ++++++---
 drivers/gpu/drm/sysfb/vesadrm.c |  9 ++++++---
 drivers/video/fbdev/efifb.c     | 10 ++++++----
 drivers/video/fbdev/vesafb.c    | 10 ++++++----
 drivers/video/fbdev/vga16fb.c   |  8 +++++---
 6 files changed, 32 insertions(+), 19 deletions(-)

diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
index 1f671f9219b0..8833582c1883 100644
--- a/drivers/firmware/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -141,7 +141,8 @@ static struct device *sysfb_parent_dev(const struct screen_info *si)
 
 static __init int sysfb_init(void)
 {
-	struct screen_info *si = &sysfb_primary_display.screen;
+	struct sysfb_display_info *dpy = &sysfb_primary_display;
+	struct screen_info *si = &dpy->screen;
 	struct device *parent;
 	unsigned int type;
 	struct simplefb_platform_data mode;
@@ -202,7 +203,7 @@ static __init int sysfb_init(void)
 
 	sysfb_set_efifb_fwnode(si, pd);
 
-	ret = platform_device_add_data(pd, si, sizeof(*si));
+	ret = platform_device_add_data(pd, dpy, sizeof(*dpy));
 	if (ret)
 		goto err;
 
diff --git a/drivers/gpu/drm/sysfb/efidrm.c b/drivers/gpu/drm/sysfb/efidrm.c
index 1b683d55d6ea..29533ae8fbbf 100644
--- a/drivers/gpu/drm/sysfb/efidrm.c
+++ b/drivers/gpu/drm/sysfb/efidrm.c
@@ -4,7 +4,7 @@
 #include <linux/efi.h>
 #include <linux/limits.h>
 #include <linux/platform_device.h>
-#include <linux/screen_info.h>
+#include <linux/sysfb.h>
 
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic.h>
@@ -141,6 +141,7 @@ static const struct drm_mode_config_funcs efidrm_mode_config_funcs = {
 static struct efidrm_device *efidrm_device_create(struct drm_driver *drv,
 						  struct platform_device *pdev)
 {
+	const struct sysfb_display_info *dpy;
 	const struct screen_info *si;
 	const struct drm_format_info *format;
 	int width, height, stride;
@@ -160,9 +161,11 @@ static struct efidrm_device *efidrm_device_create(struct drm_driver *drv,
 	size_t nformats;
 	int ret;
 
-	si = dev_get_platdata(&pdev->dev);
-	if (!si)
+	dpy = dev_get_platdata(&pdev->dev);
+	if (!dpy)
 		return ERR_PTR(-ENODEV);
+	si = &dpy->screen;
+
 	if (screen_info_video_type(si) != VIDEO_TYPE_EFI)
 		return ERR_PTR(-ENODEV);
 
diff --git a/drivers/gpu/drm/sysfb/vesadrm.c b/drivers/gpu/drm/sysfb/vesadrm.c
index 7b7b5ba26317..16fc223f8c5b 100644
--- a/drivers/gpu/drm/sysfb/vesadrm.c
+++ b/drivers/gpu/drm/sysfb/vesadrm.c
@@ -4,7 +4,7 @@
 #include <linux/ioport.h>
 #include <linux/limits.h>
 #include <linux/platform_device.h>
-#include <linux/screen_info.h>
+#include <linux/sysfb.h>
 
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic.h>
@@ -391,6 +391,7 @@ static const struct drm_mode_config_funcs vesadrm_mode_config_funcs = {
 static struct vesadrm_device *vesadrm_device_create(struct drm_driver *drv,
 						    struct platform_device *pdev)
 {
+	const struct sysfb_display_info *dpy;
 	const struct screen_info *si;
 	const struct drm_format_info *format;
 	int width, height, stride;
@@ -410,9 +411,11 @@ static struct vesadrm_device *vesadrm_device_create(struct drm_driver *drv,
 	size_t nformats;
 	int ret;
 
-	si = dev_get_platdata(&pdev->dev);
-	if (!si)
+	dpy = dev_get_platdata(&pdev->dev);
+	if (!dpy)
 		return ERR_PTR(-ENODEV);
+	si = &dpy->screen;
+
 	if (screen_info_video_type(si) != VIDEO_TYPE_VLFB)
 		return ERR_PTR(-ENODEV);
 
diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index 0e1bd3dba255..47ebc0107209 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -15,7 +15,7 @@
 #include <linux/fb.h>
 #include <linux/platform_device.h>
 #include <linux/printk.h>
-#include <linux/screen_info.h>
+#include <linux/sysfb.h>
 #include <video/vga.h>
 #include <asm/efi.h>
 #include <drm/drm_utils.h> /* For drm_get_panel_orientation_quirk */
@@ -345,6 +345,7 @@ ATTRIBUTE_GROUPS(efifb);
 
 static int efifb_probe(struct platform_device *dev)
 {
+	struct sysfb_display_info *dpy;
 	struct screen_info *si;
 	struct fb_info *info;
 	struct efifb_par *par;
@@ -360,10 +361,11 @@ static int efifb_probe(struct platform_device *dev)
 	 * driver. We get a copy of the attached screen_info, so that we can
 	 * modify its values without affecting later drivers.
 	 */
-	si = dev_get_platdata(&dev->dev);
-	if (!si)
+	dpy = dev_get_platdata(&dev->dev);
+	if (!dpy)
 		return -ENODEV;
-	si = devm_kmemdup(&dev->dev, si, sizeof(*si), GFP_KERNEL);
+
+	si = devm_kmemdup(&dev->dev, &dpy->screen, sizeof(*si), GFP_KERNEL);
 	if (!si)
 		return -ENOMEM;
 
diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
index a81df8865143..10d3d9ae73aa 100644
--- a/drivers/video/fbdev/vesafb.c
+++ b/drivers/video/fbdev/vesafb.c
@@ -20,7 +20,7 @@
 #include <linux/ioport.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
-#include <linux/screen_info.h>
+#include <linux/sysfb.h>
 #include <linux/io.h>
 
 #include <video/vga.h>
@@ -243,6 +243,7 @@ static int vesafb_setup(char *options)
 
 static int vesafb_probe(struct platform_device *dev)
 {
+	struct sysfb_display_info *dpy;
 	struct screen_info *si;
 	struct fb_info *info;
 	struct vesafb_par *par;
@@ -257,10 +258,11 @@ static int vesafb_probe(struct platform_device *dev)
 	 * driver. We get a copy of the attached screen_info, so that we can
 	 * modify its values without affecting later drivers.
 	 */
-	si = dev_get_platdata(&dev->dev);
-	if (!si)
+	dpy = dev_get_platdata(&dev->dev);
+	if (!dpy)
 		return -ENODEV;
-	si = devm_kmemdup(&dev->dev, si, sizeof(*si), GFP_KERNEL);
+
+	si = devm_kmemdup(&dev->dev, &dpy->screen, sizeof(*si), GFP_KERNEL);
 	if (!si)
 		return -ENOMEM;
 
diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index eedab14c7d51..7853d84f10df 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -21,7 +21,7 @@
 #include <linux/ioport.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
-#include <linux/screen_info.h>
+#include <linux/sysfb.h>
 
 #include <asm/io.h>
 #include <video/vga.h>
@@ -1305,15 +1305,17 @@ static const struct fb_ops vga16fb_ops = {
 
 static int vga16fb_probe(struct platform_device *dev)
 {
+	struct sysfb_display_info *dpy;
 	struct screen_info *si;
 	struct fb_info *info;
 	struct vga16fb_par *par;
 	int i;
 	int ret = 0;
 
-	si = dev_get_platdata(&dev->dev);
-	if (!si)
+	dpy = dev_get_platdata(&dev->dev);
+	if (!dpy)
 		return -ENODEV;
+	si = &dpy->screen;
 
 	ret = check_mode_supported(si);
 	if (ret)
-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
