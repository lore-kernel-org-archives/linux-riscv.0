Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59FAC0219B
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 17:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8z4RjcF5E8KW2e2dmIfVn16uKhDmOKUmUZrKNecs5cw=; b=n5vWhKSqWRKEcr
	BCSjpFVdTwZbV0ohchwXrUipOkROfgfocWIoKupI8z1zwZlzJ0D6tJ4YXwc4L55UnoRBEYNKc0YJl
	gbf7CGaPYJWOjgeritgQv+YeP2jVOwTaWRLnby6sFZT5iuQnUQbkIAw6ouJZXEjPVo/mETkD7S7yn
	LWlp+aXATjEwx0V4GhhZkMSi6CHYmaT7J49VLN/0npBHuh3LFqZlWEmbEkRNExyHR8iWLGipkmp2+
	CY4ORhjwezrvv+FTcNz1W6p879fyQkWJ0Bp8THzwq5VQd4uaM3DC3GDKv9zzupNnWm5ubBUbKFOEa
	HHljEijeLSdD7PMdx3pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuHc-00000004iIS-1zpR;
	Tue, 11 Feb 2025 17:42:52 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thu3m-00000004fzz-15vK
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 17:28:35 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-38dd14c9a66so1642075f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Feb 2025 09:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739294912; x=1739899712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2biH2pTKEoyD3yCVVt7sf7r+6yC9eORZimpeabOUGQ=;
        b=wmfNEeu613nVUguogghTfBjsEKMWvNt3hKwHcEc2gJsriYa4ZWy+uI8hN83/NdWiQa
         lk9L2OB/OCssRUiTqHxKfZOLFUbejzQb5J6oxowfkj9B48tRHswSqRFE0vM1O3NrY4Dn
         a6ZTaFiM8g0NaVVMed6O+eu1LRv9fFxqIzj42vhxpappW9r5OlCQ4iE6QyHCVon5Yoaj
         zLE6wV/bvuWEh+hXZkyotgZ/gZaC9VOEpwCDJDYeYvxoAme447pUL8Muco34gY5dX8Si
         R0ztwU5lA6FCDElOHCVfVkDKlCL6N8A/RY5Y6X6i9uXWpJC0OeTKmUCHHMHBtt6zqO8V
         XC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294912; x=1739899712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2biH2pTKEoyD3yCVVt7sf7r+6yC9eORZimpeabOUGQ=;
        b=RHOimr5Rv7sj7CEffPZa38n0eu3w7M6pr19C7cnx6uk6IXvJxMKWDygtx3j61CK4Ce
         LLYAIm9+Zjf7lA9AfHjdcj8SO68z5zxp+anbz5izjeMk9kiyQCCq4L+IlTnvClxPBx3f
         gb8YOZGlwnnLxwTq3vEbxNMaRW7k9XK+1cOEWRWIcXVmPDlLTyUMIfukgwFAY11ayKCs
         TglwKsYBCFb1POXLP2w06hQItolc6108BVFpfvIEEGfC0pvrQ+N6Y7YdFMpK6ey4545Q
         +bgCZfbEJGjQbwmKcotyCiFp8mgTPQDsw85txxAVsX9nhSgqF59LhizlGZL3USgjlBNm
         M06Q==
X-Forwarded-Encrypted: i=1; AJvYcCWL247DIWo//fC0d6cSRDP1jz+QcyT4hISTP57m0FNrdvVdPixoxxEqsnR9eTO8EbW6wW/dHIBH57xLqA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhXYrbKzKC7nS1zov+xGTRy6vN6oFqwefpJZbvpPdLNumYQMjF
	pez/cayr6pQR+tIIcLChWUnysXTnBJenHIkS/rffUsFoqroK8B/VKX+PvaQFbXw=
X-Gm-Gg: ASbGncvmt7JeI+RDNnzCNZehR9li0eeBjfoLdjlvmCsnlclpNh9wkUymgd4/rPAkhq9
	+LUum5btiLzrCgkQ6M135FMnU8DGur3evZYhcuenM8jsSqApOj86z0Sp8Dn929+PbHFSQCSpsnB
	W1lFV4bMNJUvIoF8assRacFuOHuZChdUGhTP6aUsjHqCupOSzTKHGTDrsnUcJ/AQ2w2JxhSESrM
	ERdu/helPqa3YUnuLU0RL1El+CecsgrktN6aYdI/MUXe6dT/277nBrEX708qaScPUUMBhfwXx4h
	5VOh85nvMMBliLoVug==
X-Google-Smtp-Source: AGHT+IE/lWpaI6pWVO8Sv+YQSGH06MG0caNle2AbW37wTjANlrKJ9s7lqNySg7B+IZ8uIOLB+l1Tjw==
X-Received: by 2002:a5d:47aa:0:b0:38d:d69e:1314 with SMTP id ffacd0b85a97d-38dd69e1ba1mr9007347f8f.9.1739294912415;
        Tue, 11 Feb 2025 09:28:32 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fc0c:6c04:7ae0:c5c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc6c80df2sm13691082f8f.18.2025.02.11.09.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:28:31 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v3 3/7] drm/bridge: ti-sn65dsi86: use the auxiliary device creation helper
Date: Tue, 11 Feb 2025 18:28:00 +0100
Message-ID: <20250211-aux-device-create-helper-v3-3-7edb50524909@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4038; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=4I/YUW3hUfV7LW4vqIimfK2wLippJhEosTDRns8e2Tk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnq4g3KBrsjz/YbGJrLq2rlkWwu0SsOmQVpTCXu
 VtviTS8naaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6uINwAKCRDm/A8cN/La
 hV5wD/9CJGF/RCRwHbIbJXrKSWU73Zd91U9+X8P+nRRrN2lbOiILtbHRZF2AXs7l2tOiLDUVf4G
 hypCmzHSVFVgMR06Q7kXrEbTRx0O2Ul1Q07H0IFD4k0xt58ug/V7ezrJ8lMEcM/FcwImcVkoYJ8
 lwmjvrONgcgoZBExdOnJlv1UD+Dddr4Wi+sWDLmDALlFjbDYuQrfZjHc4L2zc9ve8rHjnU0pC6f
 YMm6EjEhHMcFgsbKge/+kkfDcTqsuk4jfLytI2sF2jHT2cwesgQfceYXMsqKePtNCuHTv8Tpp1b
 5nWhj/l8S+yLfIAiVNy2nxba00yx5R4v4NoCPZCX05JCtquBC2WB4CNUzhQYHyHMMQ+ePGN7JKm
 NVtRFVPUx9oJOjGRhqWRi88hiSwNg4QPj+OFtWuOs7D51J/yTJdD5XMgYgADimBsSrLGtGB/1r/
 IorMXfmpkm0xw+RREwA4WKwLMT/KLgfShgDVdmOk4Kbnh4GrUvX/Rspym/xjVfg9es+PgegGjWK
 rCix4SNzCGiSAgOwWvJGJDOCAjzpvnzAHYXnvgCoFs75RSMC9B2KvyOk+IQ1l+9g5tLRkthUfJX
 P2X8n0M0gtdsistRrOtkv7GakcFOKAF6ZmIzmj/mW2xQRBXpnMf+sa95bdok5/LFdpbKMw5knAN dqVQqlnz7A0W1ig==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_092834_315919_1C84ADC9 
X-CRM114-Status: GOOD (  16.31  )
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

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 84 +++++++++--------------------------
 1 file changed, 20 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index e4d9006b59f1b975cf63e26b221e985206caf867..e583b8ba1fd4f27d98e03d4382e0417bbd50436f 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -454,62 +454,6 @@ static void ti_sn65dsi86_debugfs_init(struct ti_sn65dsi86 *pdata)
 	debugfs_create_file("status", 0600, debugfs, pdata, &status_fops);
 }
 
-/* -----------------------------------------------------------------------------
- * Auxiliary Devices (*not* AUX)
- */
-
-static void ti_sn65dsi86_uninit_aux(void *data)
-{
-	auxiliary_device_uninit(data);
-}
-
-static void ti_sn65dsi86_delete_aux(void *data)
-{
-	auxiliary_device_delete(data);
-}
-
-static void ti_sn65dsi86_aux_device_release(struct device *dev)
-{
-	struct auxiliary_device *aux = container_of(dev, struct auxiliary_device, dev);
-
-	kfree(aux);
-}
-
-static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
-				       struct auxiliary_device **aux_out,
-				       const char *name)
-{
-	struct device *dev = pdata->dev;
-	struct auxiliary_device *aux;
-	int ret;
-
-	aux = kzalloc(sizeof(*aux), GFP_KERNEL);
-	if (!aux)
-		return -ENOMEM;
-
-	aux->name = name;
-	aux->dev.parent = dev;
-	aux->dev.release = ti_sn65dsi86_aux_device_release;
-	device_set_of_node_from_dev(&aux->dev, dev);
-	ret = auxiliary_device_init(aux);
-	if (ret) {
-		kfree(aux);
-		return ret;
-	}
-	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_uninit_aux, aux);
-	if (ret)
-		return ret;
-
-	ret = auxiliary_device_add(aux);
-	if (ret)
-		return ret;
-	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_delete_aux, aux);
-	if (!ret)
-		*aux_out = aux;
-
-	return ret;
-}
-
 /* -----------------------------------------------------------------------------
  * AUX Adapter
  */
@@ -671,7 +615,12 @@ static int ti_sn_aux_probe(struct auxiliary_device *adev,
 	 * The eDP to MIPI bridge parts don't work until the AUX channel is
 	 * setup so we don't add it in the main driver probe, we add it now.
 	 */
-	return ti_sn65dsi86_add_aux_device(pdata, &pdata->bridge_aux, "bridge");
+	pdata->bridge_aux = devm_auxiliary_device_create(pdata->dev, "bridge",
+							 NULL, 0);
+	if (IS_ERR(pdata->bridge_aux))
+		return PTR_ERR(pdata->bridge_aux);
+
+	return 0;
 }
 
 static const struct auxiliary_device_id ti_sn_aux_id_table[] = {
@@ -1950,15 +1899,17 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 	 */
 
 	if (IS_ENABLED(CONFIG_OF_GPIO)) {
-		ret = ti_sn65dsi86_add_aux_device(pdata, &pdata->gpio_aux, "gpio");
-		if (ret)
-			return ret;
+		pdata->gpio_aux = devm_auxiliary_device_create(pdata->dev, "gpio",
+							       NULL, 0);
+		if (IS_ERR(pdata->gpio_aux))
+			return PTR_ERR(pdata->gpio_aux);
 	}
 
 	if (IS_ENABLED(CONFIG_PWM)) {
-		ret = ti_sn65dsi86_add_aux_device(pdata, &pdata->pwm_aux, "pwm");
-		if (ret)
-			return ret;
+		pdata->pwm_aux = devm_auxiliary_device_create(pdata->dev, "pwm",
+							      NULL, 0);
+		if (IS_ERR(pdata->pwm_aux))
+			return PTR_ERR(pdata->pwm_aux);
 	}
 
 	/*
@@ -1967,7 +1918,12 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 	 * AUX channel is there and this is a very simple solution to the
 	 * dependency problem.
 	 */
-	return ti_sn65dsi86_add_aux_device(pdata, &pdata->aux_aux, "aux");
+	pdata->aux_aux = devm_auxiliary_device_create(pdata->dev, "aux",
+						      NULL, 0);
+	if (IS_ERR(pdata->aux_aux))
+		return PTR_ERR(pdata->aux_aux);
+
+	return 0;
 }
 
 static const struct i2c_device_id ti_sn65dsi86_id[] = {

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
