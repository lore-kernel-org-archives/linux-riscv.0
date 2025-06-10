Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7851C5B543
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 13:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Obl5SIFdcQyrXY6Cy2rAjiOvdxt/FF8qqIyNKKRpYY=; b=JXIGhFTiBMiETL
	KxOirBZjbKfy3A9fr4/KsBY7b/BCTUNu2Gg/IXvqeYzhllliEZJ2RV9JOfGD2r3dYS7sKLZM6sajp
	Pk1V3U5xbacJ2+MvBRmRszLyQ84Xwej0WdrME9KkQASSi8cjHS2HM89i7Y1UUcJfPTF9mwBMr2Bv/
	CheTNwnGP+aWmff8eBFEC4D8f9mYC1rpLEKyt9OuW2aBh2C6IAxEVaIUYd4y0dTPLIiQh2EU9lHdJ
	ag0fTgp0nr79U2FQUk9RCtGAWKm1G55ESdNWXHAm5PVIOSU885SQepg/7B/e943LT7588Hneh5w4n
	Kk3SGTELDh1GzpGgvRDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzQM-000000073GH-2F4m;
	Tue, 10 Jun 2025 13:53:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAY-00000006mO4-43vC
	for linux-riscv@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=qxLzYZOTSdUIwG/dDdz19oBo7jupe4wC7PnSCC6qO4k=; b=DvxX5DbNb/RTJ9wmZdvmYjcy0/
	KpHtn5tnkv2Gh2tNjp+5BGL8Wpv9XVnwQDIcCu5LmTE5MZ33Z7U+JlzG713dC8Z9bNtlurkIKsQN4
	KqMCDtpM/Mi4ylyASyECQwyPaA3ty6HNfe9fZS5EOc8vycSsbZoD/nvAQ2fIcHxSpVWfQAl4BcxVc
	JyRcCZumw6mjvsnKjVYpcVOT73u4aPs6oSMv6RbjIfG70vYx2Ekaxrout7lpg5jenw+YmmyQV6YXM
	BFcatzgll9MTt8+X7IvH6rVZGqepNPC5D7mb+hxqM1MX3LAu0ujrtuPQiz8gELicuuNpJCjhvUE9y
	nYDLLf1w==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyAW-00000001oXt-30gg
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 12:33:34 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so2122441f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 05:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558810; x=1750163610; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxLzYZOTSdUIwG/dDdz19oBo7jupe4wC7PnSCC6qO4k=;
        b=19kdwULqkD3ak1ufvVGr7Zv7t5l+cinvzM6iI6IAJrqhez/53QZQjA80S6Zjk9lCY9
         ijc7cHxAnlQjGY4nlQE5nzrrjDgMrOk4neTKCg/m5a1tzUbU/VmSrRUivxrUVs4k+Utu
         vkOQioI6nZt+0AfFxd/8cx9n2L8a/sIVOpc6oSpIjJ+F766D8ByM21ABl6c9zqeEHLvY
         JKQGL2YR8glL9iR7l0POJ1u8iwjOPDIJE5727LW9neVK+6zUCKD/poTAS92IFx/OOK2N
         /lx+qf7dISoQoRQm2nn/CNFhc1686QzeLeZAXXczsx2Q3w4wD2ymkcujE4yxVTjEdm63
         +RWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558810; x=1750163610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxLzYZOTSdUIwG/dDdz19oBo7jupe4wC7PnSCC6qO4k=;
        b=JSK69woILPh8YLavkMEthhSWLYKpfkToA6QsCApklSBKPkBdlvFZYf0In8QoZ36OrL
         cR56F90D5bUBnK3zmeV2X2E5ByoKHAiAG2j7wWL2xPCZ+t0TZt04SJn1mr/YjGNSMCVl
         KTZU+tPxwxiPfYI5hW6sig5Z0R1tqJ97NVe+HHzC2U5kSyRykD0PJteOG4wjyo6hTozX
         LCoNzSrLpcQD3DwXqmAuqN/DpmaLEoauspBRk+XBZHfpa6J/bSz6b9Q4tri+EH+qyvDN
         DFmXx3RtnujIvgOaaJg/3Cl2cxE73ymT9TthvIC0rIm0rv8ngz2cBKxZd4v55RdGF8tB
         6j8A==
X-Forwarded-Encrypted: i=1; AJvYcCXY6DTT7o4tSAi5DhAA+WHZBx3uE2avdHdsuZqbtajcsFcQN0JEwKxXVY4buD41i4Ru53/CqMvVU+AqFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YypTXiNkcUNzdLFWx+w3rmzyRRkp2cgVTcv0IKowQWfRYJrfVo/
	JaGkfPYAcydfWCLFMXclnqvkyurp3A24SiLNB4WGNFWafikBCdKYtDiGJWKsHNcGazg=
X-Gm-Gg: ASbGncvWiVWNyzjv68D3Yfk5/kPofS4dmrgd/lyezSrUp5fdN63ZJWnUvcY6zpwMkgA
	oO/xcP+a9WptzjrMjdWTVDAG5M7j9EMDATMpAMfLicezuSfgDJ6ae1Bd9RjtpqeY/0LKu38dg9D
	ZaQX/JD02UZrPf0F8gmWvMRF6DfOnZ3NAXDswHbhyJYNPx+ann0RszLDrGmgDjmkenrg83CE/SY
	sfb6Bc5A1qI0br8Gj8ss6LwKGovZTiQUDmOID9PeojECmulCPHhL0/qpv61aauPn4o5zLln39iZ
	jvWv4WuqcYQfprSAg6L5lvgLPALB4KQMXEI8wFCFQzIXg6nhSxyWtA==
X-Google-Smtp-Source: AGHT+IGf24xBNhS/K1ZbKglpgFrm46LA9T2wVtmfcyS7odITVr/pCroc70/4xTfamtgoFjylllZKEA==
X-Received: by 2002:a05:6000:4205:b0:3a3:7987:945f with SMTP id ffacd0b85a97d-3a531ced4e1mr13192942f8f.57.1749558810273;
        Tue, 10 Jun 2025 05:33:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:17 +0200
Subject: [PATCH 07/12] gpio: msc313: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-7-3a9a3c1472ff@linaro.org>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1676;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ZmOs9Rn2Ofc7KtPnQgf3fHbIJejOw5G9OgMOgcVcOTU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYPS6rMr9JHakl/jEzS6gu3nnJM5OwNcNdkw
 pcSFpc7hKKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDwAKCRARpy6gFHHX
 cvrUD/9GpMmudRkoErJ8Jc3wJWG5D7s/6ppxZ4bAKfLPHuIf3cullW2xXMdGEisXFnYba5VEHpt
 VlXc3SJRZDpOEvM0F3v/+jUIZiuOD6pvawQnW/qxtq/Ozv1UfpKrpuN1fRrh7pL2XMWCAwwRnUw
 aBDKVyyJlBxP2MtvGqRaa982whCS2SZd6kG22Dddodz3o3nAzrh2kTO1S+fWFysy1uyhRTTIlpQ
 cXCVQ1wQMGQQOX44beuLfNlLd9SEPnqHDgf0Lj3MudgUqT22IGiNR10kwDiB3wQ1raD/uYBJnzl
 8vxKAn3c0fCywJcvMFP6K8S2ZAHGytispiNwpf8Pa9l06WV5vZCyzZswFKsDYk8zO45sEPi2IYK
 skKkUVLEkgJycvjqe9Z0PM21t3y0NVWKx5KjMcH6+hefemyBEzaHcFyl5ARdxki12GE3lCixf8f
 RHBvPI0sed+6K74ffsqTELAk4EffI6LaNvWOSEG6F6OvP91+rEkaHy/kCIJFTo7DMnnu+SKtCLB
 ghIRIU0nZmltloZYikzkZfcgB8uYVjw5f42C9UGksap9z2d2juN4inFBf0R8psL7OAHQB7occ8w
 nuAi7PvG6Lmjmnv+Hq6TmLCI75PEi8A9HehvhBXXbFG1lUF0a3ELPJqeFHbc8O3ZLGrwJsZY5KR
 oWc3lgWCenglKuA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_133332_840024_0E8C3389 
X-CRM114-Status: GOOD (  12.59  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-msc313.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
index 6db9e469e0dc254e791d497b89a4c6d329d0add4..992339a89d19840fc03ccf849972a83cb86415ae 100644
--- a/drivers/gpio/gpio-msc313.c
+++ b/drivers/gpio/gpio-msc313.c
@@ -486,7 +486,7 @@ struct msc313_gpio {
 	u8 *saved;
 };
 
-static void msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct msc313_gpio *gpio = gpiochip_get_data(chip);
 	u8 gpioreg = readb_relaxed(gpio->base + gpio->gpio_data->offsets[offset]);
@@ -497,6 +497,8 @@ static void msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int val
 		gpioreg &= ~MSC313_GPIO_OUT;
 
 	writeb_relaxed(gpioreg, gpio->base + gpio->gpio_data->offsets[offset]);
+
+	return 0;
 }
 
 static int msc313_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -656,7 +658,7 @@ static int msc313_gpio_probe(struct platform_device *pdev)
 	gpiochip->direction_input = msc313_gpio_direction_input;
 	gpiochip->direction_output = msc313_gpio_direction_output;
 	gpiochip->get = msc313_gpio_get;
-	gpiochip->set = msc313_gpio_set;
+	gpiochip->set_rv = msc313_gpio_set;
 	gpiochip->base = -1;
 	gpiochip->ngpio = gpio->gpio_data->num;
 	gpiochip->names = gpio->gpio_data->names;

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
