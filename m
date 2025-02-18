Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CADC021AF
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 20:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HEYHbyHj4/VNL7rXsUdzL/0wcbFjTUL/q52m8H3NwZo=; b=UEIyGYAFCnD+hs
	KqLplg6ayWkbCcdKN+xaTEfuQtdjoQwE6chxgE9cjttJL55rOt/eRZzKOp72Oy7T9vVMZ3nZlHONQ
	/sXqMNd37+OZbK1wGouLCd2t5mB6fRIIzLHGQ1HuDiJGkMGbPqw+yG4z9dKwb165NRZQBrUh2IPzV
	KWDe6HRKwNogIeRsu9abh9Vofz8Msa7dNn1+jPGcKnescXXw47/SBmTheyn3a36qkHmRK6BAdD5DY
	nm+kc7qKMITkOiwfnJ1nInEvEvlIp4BLnHDRcvyx1wV8K34+LyA+qMM/ow44La1YLluoTei0iroMK
	ZrvXawbXLs5lBe6vh8lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTwT-00000009hwr-3FVv;
	Tue, 18 Feb 2025 20:11:41 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTIm-00000009a2u-27Y9
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 19:30:42 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e04cb346eeso5574010a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Feb 2025 11:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739907039; x=1740511839; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0T8F81F4dclX+rJ/ZeU1mJZ2+c2tosLP5JZ1w46AvKI=;
        b=1Xq8JAhuKw6FKZNs8NK52regejxrwrj7ytwGrxS2QSLKMTkqR3CEdILeezUswl+k8q
         RiVAFg1rvAaZlXQuQXLZj7prHgTHDwMDrYhVBIZ4A20o3mjkWHyek0Qzi/BemZKWQqJC
         2kyJuK6h5aKnwbP3Q4odgG3KzaF5bPLPj8yu9SeBIaj+igUjhkhPbjmMn12IJkDsFpB5
         Ib29KDyI62GpAKu0RD2g/SUbAPBTXoXt6QED4NnpV1L9NqfWsZAXFhXkkLDOK++vkvc3
         Atz5txQCxktgPtWBgfs6ZMiiLMhz+mR5TMNPFmxHMW9d0LDxK1UVwwXJYWdubte9fdOG
         /Yig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907039; x=1740511839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0T8F81F4dclX+rJ/ZeU1mJZ2+c2tosLP5JZ1w46AvKI=;
        b=GLlINrObtRv1J9Jk/7cupZAZEODlNidD6j8xeDcluUuqfCxNX5iudg76etFV9SQsVx
         3h0aFOmYAkWLzR9zohSbXNFgQVoP802MBKnVzsRLk14UZCfePfIqPYq7EXDER/UVjZIa
         zWbg0ndewmhK2xydXZLNaRosFyMoxEQz19kOBU1kSKhdTHTAJikssf8gXogElq//6tQw
         PtWbpZkQdOQyJrUgP32JJx2oeAWPI3E5rmh45jtRM6gXUoL7odra+ZdHRl6e4c3qgtSb
         fF/+2Yk2GwVrLUwcdPAmX3wUcJnSsPWoNwsKRstku4VgNPEvC/SWtpVH8Fmd2FL0Vqvp
         Cwtg==
X-Forwarded-Encrypted: i=1; AJvYcCUD1zFH8x69WvuTlXSSPB5Ute+BL+y+GPLoryWrel5DRLTUFmwMx/ns4yKSsL7V2DwvQJPI1LoRvkVYQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDPBSL4JtAuZKv6paPFyURoIgLHz7BY6v6Qko2ezdvfIWYTZHb
	echqGqo5LRgK4uGjljb0jtGjuZPgWTMt36CQJ7FAw5/jAsysrbvUSfKa8wE1I/Y=
X-Gm-Gg: ASbGncsRJ5RsrauHFt7jI7cUuXZzjnRqsGXGSzYChO5wDLKAwps2rinoMk+DFpNc8Vu
	lWMWjFAVQp9ziAgDS/gIkkuoUZv5ltEMgoHsxGI0QacsdeQfVVaJst00dgHAF4/9WhGN/xGsCaf
	4foHFAbCA2lCh9/MZ9vhyL5+bd6aNPSWOgrximbDr21yyFtbon242DX+jhQjydi7/ICtMml/reb
	z9EaEetVLLer19QZ0XQZAuzH81Xvc0cVdxqx0km+Ftd6pWTfHPIQJDvXUikKOWLo+skANpvrm4V
	VIofKABntnh5S0Rs9IokSsCw8bcs
X-Google-Smtp-Source: AGHT+IE38d9H2TgXTyTup8jkjPe2nCO1VlNwQJGJqEx5dpp48IZsz14VskWGHfiixxpwINWmEkNfGA==
X-Received: by 2002:a05:6402:13ce:b0:5e0:4a92:6b45 with SMTP id 4fb4d7f45d1cf-5e04a926cd7mr12713674a12.24.1739907038738;
        Tue, 18 Feb 2025 11:30:38 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:cbaf:af0:839d:fb4a])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c3ce5sm9338985a12.17.2025.02.18.11.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:30:37 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 18 Feb 2025 20:29:47 +0100
Subject: [PATCH v4 2/8] reset: mpfs: use the auxiliary device creation
MIME-Version: 1.0
Message-Id: <20250218-aux-device-create-helper-v4-2-c3d7dfdea2e6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2301; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=lC4JGAW79Gffs1TQMyzi5K8iGZRUrc3LT4D+fKp54fk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBntN/QcUQEhOWVZzyl8Bk6xzmnH//yZHJXSRo9/
 qRN2pMyjUyJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ7Tf0AAKCRDm/A8cN/La
 hWnTD/9N7uDw2MgUMxhgsAUT5/+278puGBABcsLjbLLras1TheSQNvuJ2k6CxLv1JzCY2D66v4g
 1IZyaW6xKXiWnXsDJvRMfcjRdcEROcGnF3UC4ySSisSHu/ZQztXxFB+ZWe/fkAj0Yr8I5rv9jdi
 CVlbgdypg0F/xyy31QioTBrNDzru3kX+AZPogf8//n1HoaxOA5nRQAU+AMJDDJE4Tu3ZuwXujs8
 eHY+xCL7EVf2v0LnCxVtOkWdzWc1WD/1f83AvRqQh8zo/ADR5A8bcX432Ca2efhXfpTiJtTGV3C
 nkRAlV3jUon29+Atl1cui8KDavDFHk/+0IIwCMvrCreR+4YHxT4f+w2ay7hyiJ93zHmOpeBNwlD
 nsa+oMRZdeU6vHD2y2GJHX7m9CSFp1E8zmd2evt/+ZCvVMPhdfGJInOpC0HIWUKb46a8NeJxWly
 0eI7MOS4MfFJow59r73kkCyYHBPv3mfqUg+oCigQGJHFaP5irNw8C9yO4xX7Rabili/pwsYyI7G
 JTcCo+pvGbCJ2MnXqS0x6JpyZ/ZFrneZmwpN5fi3gPKSYljCbeXbCHd8pjuzg/Gu0I9u//RPWWo
 ufdtuzliUyzrzCu0/+O2KjwjCQuyA3XbhhDaA6uUq+TsSZbwdcJ6nKs4JMfwO9I4wruQJBQ8Dxc
 0NFwBr/IpdOtN0g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_113040_549086_B8B332BB 
X-CRM114-Status: GOOD (  11.83  )
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-mpfs.c | 56 +++++-----------------------------------------
 1 file changed, 5 insertions(+), 51 deletions(-)

diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
index 574e59db83a4fcf30b60cb5f638607a2ec7b0580..f6fa10e03ea889e5434110156f7bece808a6ae92 100644
--- a/drivers/reset/reset-mpfs.c
+++ b/drivers/reset/reset-mpfs.c
@@ -155,62 +155,16 @@ static int mpfs_reset_probe(struct auxiliary_device *adev,
 	return devm_reset_controller_register(dev, rcdev);
 }
 
-static void mpfs_reset_unregister_adev(void *_adev)
-{
-	struct auxiliary_device *adev = _adev;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
-static void mpfs_reset_adev_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static struct auxiliary_device *mpfs_reset_adev_alloc(struct device *clk_dev)
-{
-	struct auxiliary_device *adev;
-	int ret;
-
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return ERR_PTR(-ENOMEM);
-
-	adev->name = "reset-mpfs";
-	adev->dev.parent = clk_dev;
-	adev->dev.release = mpfs_reset_adev_release;
-	adev->id = 666u;
-
-	ret = auxiliary_device_init(adev);
-	if (ret) {
-		kfree(adev);
-		return ERR_PTR(ret);
-	}
-
-	return adev;
-}
-
 int mpfs_reset_controller_register(struct device *clk_dev, void __iomem *base)
 {
 	struct auxiliary_device *adev;
-	int ret;
 
-	adev = mpfs_reset_adev_alloc(clk_dev);
-	if (IS_ERR(adev))
-		return PTR_ERR(adev);
-
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
-
-	adev->dev.platform_data = (__force void *)base;
+	adev = devm_auxiliary_device_create(clk_dev, "reset-mpfs",
+					    (__force void *)base);
+	if (!adev)
+		return -ENODEV;
 
-	return devm_add_action_or_reset(clk_dev, mpfs_reset_unregister_adev, adev);
+	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(mpfs_reset_controller_register, "MCHP_CLK_MPFS");
 

-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
