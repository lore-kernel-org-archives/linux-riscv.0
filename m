Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00627C021AA
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 20:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GxYoFetjkigoU4YpB+c3iFWUIUOPdJoSMm7AF/Sxdw=; b=xK9NyNXtxDCMYC
	XB62APC+/grVRK5stfzvng6Eq1uZ0uhIgyk2G1Efi+N8jVVCt8I0AoDXQAhPUxWP3VcsLLNVdoucX
	REQ/UmKfryQbLD6GwApW3FwCQWUszqx85vSC1wc4PO8Sdcu6EwHhA+39XRDWJghMuHcDHp/ixi0MK
	2LZ94Jzu+qdciFdM/1rBVpoOf16+fQ6jlo7ZRTx+YvVsQPJXxplz5wuGabt4o6NdIPEHL/bgWQd0l
	G9vbvOWS9Y7db4JfqmBF0KfYMvf7cdxOnQU1Ab/NkFlI5YrPQgj3YAGFW4q7PwfWuoAoGDpQSDpWI
	+DXenxVWxSH+RZwhzegg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTwg-00000009i2D-1VxT;
	Tue, 18 Feb 2025 20:11:54 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTIr-00000009a5u-1xu5
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 19:30:46 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5e04f87584dso4128975a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 18 Feb 2025 11:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739907044; x=1740511844; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hjJyNDYGWNlVfx3UHGcOmdtWcFRQpeErkJQFZDrnkgk=;
        b=l4WiK+hbbHtWP1TvXBiZEBgNtqchc97pSJL9TdKLAmZ0hOnBjTIMT+Uqfn9z/rpoYc
         JIaaSHBc/+gtj/kZyqfqA/TXr3dI8/UKqvYqDnEBZkdrpj0oqbHgRK68oeJy8fTkDkGH
         AlRdCq3HSZOT5lFWSlT1X4jcQdgwoRbFRVxcTLllel0ku5+9d4TTGKBxhfuNM1J3/EZo
         P4qZDh1VgMx4rYw+oL2Y2WI7LrFxKkmkhWiv7JXPPzpzTnMdNOaZZqhj7bQFC/xFk0dR
         GYSgGtvxUBnvGPYClRmHv1fLCQPXI8ik8j5RXLbwakZcHobxQNOa3QMCaLZ3WaiNm8ki
         rmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907044; x=1740511844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hjJyNDYGWNlVfx3UHGcOmdtWcFRQpeErkJQFZDrnkgk=;
        b=iNf2SEBiWfgWg7Nanvz40a+bqHmlerjUlc5Vzxf9Hz4IvSB/xNcomw3XFTx/zwA0HL
         +bONNa3JQCFLPP4eXpT/tW67dH8cDXFYt/Q+6B1zJkCDEesaqAS9JUIi/epUYa6VuFps
         1XuvYuPdwStLUI3w/lEyJDrPVg+aZF0daVKmT4FC8xDKmEDK95zbcl1uKgKuVxONfket
         qqR9wp+fy6FuETZH8DtYDZu7OpTOR/Z3Q9V2gQL8IHVY4A4aXHH5XZcJijGxd9LxLfi3
         TakUuMyFTuZ1PlNvxz3z+q6XtNhGDLUxBzOr1eD2fP8+/uPS4RKdCeGszVTpqU9aCCwM
         Foeg==
X-Forwarded-Encrypted: i=1; AJvYcCWzrXQ89W3dq22znNGBP2q36/Gs7ic8WyJ3O8GblObh12tBKwKmcd9LBJkrFt8MeUwg3cJW9l4gA2rEpg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmIxRd3uRrim7rvjK4Ztz6RZF/4LYzl7c8PipZ+NHh6NDoK6PT
	Dyo/ycfKuIVreJ+4cFiQEVtivoY+esukJvL5/rw4Fgs+HNlwiPJdbOlZNUBGvts=
X-Gm-Gg: ASbGncugWuKkDTV6ID6wQVIwsjHAZns6sllMTI2lm5qL2duAwO2xouF2Snk8ecrwVAa
	P6p7dS23ReKuJ/8HWTPJvCJPM6Cho4+j0wO1IVBvCuB43Gd32n3CzPgx/Sp+1v3y6RLNZEK8QcL
	U3Beu0n8zU4RldXCJnpN5OzqVJKiDk3u7mSByebwOD/Yd4W89ZtcZkEHPIj74NWFN6f+lox3XDa
	lFLqmC6u7v7PhXiOAEIYNamHUJ1eYPTnW4EKgl9SYDECHFbtbTWRvm9E05s7hfQ6oVFg2HR4U9S
	xxwJxuZ/+eZR+6XLMli06p0KxoqA
X-Google-Smtp-Source: AGHT+IECmlrf1Z+1L2rx/ADMh1RlCaQ+nxKiAFCqRveAMzjHV+oepi3NANZfof9OC/6vmxpoOyaleQ==
X-Received: by 2002:a05:6402:50c7:b0:5e0:87fb:72fb with SMTP id 4fb4d7f45d1cf-5e089510c40mr694282a12.6.1739907044107;
        Tue, 18 Feb 2025 11:30:44 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:cbaf:af0:839d:fb4a])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c3ce5sm9338985a12.17.2025.02.18.11.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:30:43 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 18 Feb 2025 20:29:49 +0100
Subject: [PATCH v4 4/8] platform: arm64: lenovo-yoga-c630: use the
 auxiliary device creation helper
MIME-Version: 1.0
Message-Id: <20250218-aux-device-create-helper-v4-4-c3d7dfdea2e6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1973; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Cr25mWKeZ/YkxEU3AVjqGal7txJ2589uVh41kSdabtQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBntN/SD4OL52K/QfMKVSEvyPzO6g3xqyAnnznv2
 tNz5v43QBWJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ7Tf0gAKCRDm/A8cN/La
 hQ3NEACMePloQ6q9Op19MgwdvWmpVPN0pvC4qMKEleBTPpWgSbX07LzsOs33BF6DElzTXnPBE7V
 Hc6gTFj4eFpmZWZ0JLOLUmssy6Psl/FT45fjkiI6n1fz3DAwt9ZAHMX8li1/hrg9Jm8kTJTxkdT
 4bDV79Tklwis8J/7ZD2hJKoV02hT7FGm3mi0VzB65ZDGv6b5LcNmbZn95vUsmM9vQKOlyDsZ+5j
 xQZKbwufaGoPkjT64mDVnAKoZdF3vNaNN5Yje/d9tiezCjghHjEQXg8nP5TIJgDzYrbByCFDCQ2
 uO6nlODoPUfF90cbT60YJAE7QcCQOsrjt8e2+MvwcZdOMX6+e4wy3mIs24V2+8OKbSSxEO46L2l
 Bq5ehm93JeFwihWXwSSzccoDgTdL9uTM0T+n7gXSmVWMuo9FQ7ezZ1NcVkhY0hIn/oSI7yHdM9C
 oDiWNvNBvsV3+EksgLl8g8CFq0b8ykBaFZsBO19TLYDtzd0YUEbvkjbHjpFaDvVWVQFbxmFOiOm
 RwwfbcTkpQ8yKuwqtYNwng31MbhKDu90tRu3Q02h5kBTCZ8xPP4EIT+baSgD9YzWlOAKtcjFrRT
 Er3q3PLeaKRm/ZarDvM72dgEjzwT5TsJ6qku+wsH87MnixceMMf524tJXp0zcQWBJYtba1cPB09
 RzDUMDBKnqETK4A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_113045_515147_5EB23937 
X-CRM114-Status: GOOD (  11.24  )
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
 drivers/platform/arm64/lenovo-yoga-c630.c | 40 +++----------------------------
 1 file changed, 3 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/arm64/lenovo-yoga-c630.c b/drivers/platform/arm64/lenovo-yoga-c630.c
index 1f05c9a6a89d5ee146144062f5d2e36795c56639..75060c842b249c1b4cab21fef943266ae0b31d32 100644
--- a/drivers/platform/arm64/lenovo-yoga-c630.c
+++ b/drivers/platform/arm64/lenovo-yoga-c630.c
@@ -191,50 +191,16 @@ void yoga_c630_ec_unregister_notify(struct yoga_c630_ec *ec, struct notifier_blo
 }
 EXPORT_SYMBOL_GPL(yoga_c630_ec_unregister_notify);
 
-static void yoga_c630_aux_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static void yoga_c630_aux_remove(void *data)
-{
-	struct auxiliary_device *adev = data;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
 static int yoga_c630_aux_init(struct device *parent, const char *name,
 			      struct yoga_c630_ec *ec)
 {
 	struct auxiliary_device *adev;
-	int ret;
 
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	adev = devm_auxiliary_device_create(parent, name, ec);
 	if (!adev)
-		return -ENOMEM;
-
-	adev->name = name;
-	adev->id = 0;
-	adev->dev.parent = parent;
-	adev->dev.release = yoga_c630_aux_release;
-	adev->dev.platform_data = ec;
-
-	ret = auxiliary_device_init(adev);
-	if (ret) {
-		kfree(adev);
-		return ret;
-	}
-
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
+		return -ENODEV;
 
-	return devm_add_action_or_reset(parent, yoga_c630_aux_remove, adev);
+	return 0;
 }
 
 static int yoga_c630_ec_probe(struct i2c_client *client)

-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
