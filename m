Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9E4C021AA
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 21:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EbYiIu2kuuVNxsmg8k53X11n/Emzw4emwZiz8G0V2zo=; b=nvx27bQRimE8N7
	6AOU7VQMozKUKypERIcgzjFBxWj8vEdT2r8YqHQz9Rfc5hDGQyv77fhmrZqtOUH5pJiNQfrmSgW4U
	us4NXyabGY123OEF1ikcbBR25g4uew8YSozjdqkEivAK7GzLWaQDZPWhgPaZODkUW2FOffmMKMyVz
	DlYynkrx4qBcrIkpd/0nvbqI6ZLSVZsP2QYE5pVYCo7Yve1q+29P3YyLk5buI4tr/en1msmqg4yia
	2aFOCtZpuRfwPWCmyg+Sr3r4RES4O+uu/xHAk3AI8sP2MUtYiCK7psIF4it8f2l49iYJUfjLNfZU+
	ZLxRoJQ1H12h1GK/DSHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkV6U-00000009ywX-0UHh;
	Tue, 18 Feb 2025 21:26:06 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTJ0-00000009aDZ-2gVK
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 19:30:56 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e058ca6806so1288394a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 18 Feb 2025 11:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739907053; x=1740511853; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rf7170qq7Y3fQ7uVc37Bv/W29DRyxfOGfDaN3M72oXs=;
        b=jZ0EtP+c+TEl2ibZM64fMd++8Qz25TCW38r1Gq6AA/Wn280kT+kLJp3wKkCW2AlRnv
         aL1EFwzLucWRpcu19Y724K6UjOMo/su8ndRCTN18MhfWu/1pi7BPeXAwuJbI6alI4rcR
         x7LNP6IX1+4Ze4yvetwz+EldU5hTPdMLQmdTAmlSp5XlQjQx6S7OpburhhiYqM7tb8lB
         0udb/Jmy3vGymsswbnRdSf/18eKhk5PMhzohRKUHxOXU1ncLHIHW5Js0Rw+2sdpesxyu
         4tgF9pmu9H3PHHNqwOlo8qQD3+bLoxbfubteVUzBe4AJikAWJ7ZSaLaEqQIAzN43b5kJ
         0Jng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907053; x=1740511853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rf7170qq7Y3fQ7uVc37Bv/W29DRyxfOGfDaN3M72oXs=;
        b=ZUZKpo9dS9BvrT2gSypMA93lyHZISb999FNkFiEHWIF9BS2izVBYZwedZE5BIqiWyf
         L52XJQ3NBqOTV5x4A3Xw6UJEkEKkoR+c/zvVwLEoikFWWHI4847ZeCr+K/6i8gY1b9uy
         A3bAfxkdPdm8KcYNKJmPYjYfrEvxKDi9yXSAH3DnZjFMAjg/+xBVwywP0l7+wZUdVuFN
         Tw0SQ8zjznjMsVpYZTiDYNF7WZJXZwX8Zdqu2rUnty44R4W/X2FPN+Hmj6ERwWY9Iqnm
         c8E1r5w1F56Gu/ndDzWe1LawpMrCIeLp08KqqNs6PN5bKXCdog/KjU1KvYn1Gp/HgFvz
         WFUA==
X-Forwarded-Encrypted: i=1; AJvYcCVgZbWXrRYOiFIfC33A/dVIQVCo21gfcqnUqQLuPZi5OHVVMXqIgUlZ5m1zDeOnYIL1FXY1h+Y6oy3e2A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7YI/Be4ie5b3UH8+N+SCI3SHBDajca25quJkysIhpxIFMyWzH
	G0+nzyPYrXxWyBm1RrMpMBQkQjwmibG9daNHgGSf7pT3sFcTMS/k3wXKfr66ows=
X-Gm-Gg: ASbGncuh4UGSNfxMNAbBJZacuJ9rshciIGZPKYXR2Bs5nf8k6uJYiczoqNF03YBFvB7
	y8sMV5p23ZGxNXn3h2XqM4T21eY6++mT4kWRckM6l5+WuSc2SBYJJaeH7ecnUDaLWXheDI4aELQ
	fGNMA0wTOYUXBbBZnUslXqayV6q6H0vEp1KHwym88QxKESVFLqncD7RcX7Exj9sftUZ9b91wFoT
	rJ0eaolWIvZNseIPRkcnGy6GqEGUkibAmy8GrG0ctbql9fGjeZ2C18GL2eZVBfU+Q2yciUimsY/
	PSmyf2RvV6m7IClyVl7iyWAChyR1
X-Google-Smtp-Source: AGHT+IHpHIYxB4dVNZ3LyzCs91SySOLLXWjws+ryoYBHtygC8Wxu6MzjUCPyJSfIFH4a8C/yd6uRcA==
X-Received: by 2002:a05:6402:51cb:b0:5e0:82a0:50dd with SMTP id 4fb4d7f45d1cf-5e082a05797mr2098352a12.27.1739907052712;
        Tue, 18 Feb 2025 11:30:52 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:cbaf:af0:839d:fb4a])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c3ce5sm9338985a12.17.2025.02.18.11.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:30:52 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 18 Feb 2025 20:29:52 +0100
Subject: [PATCH v4 7/8] clk: clk-imx8mp-audiomix: use the auxiliary device
 creation helper
MIME-Version: 1.0
Message-Id: <20250218-aux-device-create-helper-v4-7-c3d7dfdea2e6@baylibre.com>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
In-Reply-To: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2798; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ma6EXu0EtX44zpd7hqJ6kC+ikAUaUrZisGtu8UlCCLk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBntN/VIh7m+Cn8Gx+R/npCxGvJH4NCUefaxFlhn
 gu0IqWnjBiJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ7Tf1QAKCRDm/A8cN/La
 hYVyD/90MBlzLttiipSPEDV3EdUFxIRifW8CB/ozE3YsCyj2v/DltrmPk563MQ5pa8itqfo5hkU
 4A8uKNAUHs14NclRLizOGn6E2OBZW/tn4ElVBMO65CtqbYyOtqBnsWDcaS758f/TBsB/KzwIRqe
 u/MdB86COXZ7E0Yx33885Shus9RahC6bGdvoBax0KzyWXB28Zfs56Dpy4haxed1jB0YzQnGrtWx
 pZ6HQxrdNKrS1V4FWGSzPl5f1oazL81zZnYpSBz200B7CNxKcAEEAMCMMIANqSAhDDxXaynOTSp
 WYqRQirSRpdrRSgogove/vJqlyJQEvkEoP08xVSBRUH0k8jPl8AyeIy1RrwvPiTPgoekvpMSb+8
 DMkOah/WLuym+3gJnOq9dtIg+X/ZPE7iPKreaC4TIHkCRQ4enqoO0BaYy2G/W5t+uDGBzxhsqFH
 CpQYATnH9X7aGhTIgcEatDE5NENzgl26jip0Dl2U6fTkcbRiYzRHwqdqqqlwsbZ6l9EooZL+6f4
 5kPCwJXOzUKfvTD8tNkD/GUpx8I1zc3pQ7R7KzzLxiiOG6oyQqm+HLCl/Bzr+afc+t51LbakoAm
 t6Qd2Q3tmZH1iA0sds5miFLH45OdqHtXeqrKPzPI+3W8oH37DOBtnvGssDoHjB8HiBJ1Bx4Xdg9
 OxcTaNJ3Vo552uA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_113054_701089_FD4EE842 
X-CRM114-Status: GOOD (  14.13  )
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
 drivers/clk/imx/clk-imx8mp-audiomix.c | 49 ++++++-----------------------------
 1 file changed, 8 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
index c409fc7e061869988f83c7df3ef7860500426323..fa15a5ed59e304687317b5a23c845a0588890bee 100644
--- a/drivers/clk/imx/clk-imx8mp-audiomix.c
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -230,61 +230,28 @@ struct clk_imx8mp_audiomix_priv {
 
 #if IS_ENABLED(CONFIG_RESET_CONTROLLER)
 
-static void clk_imx8mp_audiomix_reset_unregister_adev(void *_adev)
+static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
 {
-	struct auxiliary_device *adev = _adev;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
-static void clk_imx8mp_audiomix_reset_adev_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
-							 struct clk_imx8mp_audiomix_priv *priv)
-{
-	struct auxiliary_device *adev __free(kfree) = NULL;
-	int ret;
+	struct auxiliary_device *adev;
 
 	if (!of_property_present(dev->of_node, "#reset-cells"))
 		return 0;
 
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	adev = devm_auxiliary_device_create(dev, "reset", NULL);
 	if (!adev)
-		return -ENOMEM;
-
-	adev->name = "reset";
-	adev->dev.parent = dev;
-	adev->dev.release = clk_imx8mp_audiomix_reset_adev_release;
-
-	ret = auxiliary_device_init(adev);
-	if (ret)
-		return ret;
+		return -ENODEV;
 
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
-
-	return devm_add_action_or_reset(dev, clk_imx8mp_audiomix_reset_unregister_adev,
-					no_free_ptr(adev));
+	return 0;
 }
 
 #else /* !CONFIG_RESET_CONTROLLER */
 
-static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
-							 struct clk_imx8mp_audiomix_priv *priv)
+static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
 {
 	return 0;
 }
 
-#endif /* !CONFIG_RESET_CONTROLLER */
+#endif
 
 static void clk_imx8mp_audiomix_save_restore(struct device *dev, bool save)
 {
@@ -408,7 +375,7 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clk_register;
 
-	ret = clk_imx8mp_audiomix_reset_controller_register(dev, priv);
+	ret = clk_imx8mp_audiomix_reset_controller_register(dev);
 	if (ret)
 		goto err_clk_register;
 

-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
