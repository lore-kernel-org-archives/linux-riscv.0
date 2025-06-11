Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3CDC71134
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 06:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u/LDbM8Cechu1fUShRESM5jt7vChEi30klL7utt2BLQ=; b=jfJJMQsXSZSHtk
	LY9ypM1/qZ2eA4sLFLgaqiWcylL3wAAKbJvm0UeElrid3csU3r+TKRMa6+zZBVobof1+FZvtW+sk3
	Ubx3oqE4iXZcICLU5B5IWdW42xdPgeLOQT5AuIwq53WsgEpOyESmmyQLk+YIpeVVHDcDajIhQ05vZ
	9aMVXzvHblOQMOkEJu9S6xLKSjWkq1P4JfKg6hGRJD3jbHFGQJ5Cx06SwMdNAFrGhxECCitvOgfQg
	Do+xVdWcvEfruNJtxiFPqcs17RzCjvhWOAQad0v3xBgmB8OfupCRbttfI5Qe63+2VcUaUxni994pV
	i4u4qbTG1+cLENVfIbRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEj1-00000008wL6-0s6G;
	Wed, 11 Jun 2025 06:14:15 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEix-00000008wIv-3HBi
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:14:13 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4519dd6523dso408845e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622450; x=1750227250; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rlyv04vogoughQAdjKFOOQI6+Za2bCSuZln2DyzNVIw=;
        b=TwAFkOCMpjWNozhawjAVuR5lImJE7eHnKf0ScuAGdmsGlLveLVnt+obJPZMyryoQbU
         wen8UJRmDvzlVUgV7o82ZJcyoDqFduoRFiWbyz9KCaDKltsp7V8zzj7mrsfEtVRCXmCg
         N3pZsy98ivgBZ3VfJbafNWNfRaUJjjw3KVIxitfcsp0lCiGo4tUQvuPJBO8b3L3hCCKN
         xt1qETPtDFoFALHstEEyje690hxM788kOqVEvQa695H5UGQ4P0MBWi163AM0vXttnICM
         4fQm/iIRkuhsquWplHWe9Db9n+pYONvShVP3oZtKo/6bv7YghJg7qrMyP+/cjV42ymdg
         B0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622450; x=1750227250;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rlyv04vogoughQAdjKFOOQI6+Za2bCSuZln2DyzNVIw=;
        b=dZNSWy+Q6HSKhHZNQZV1YO+H8TrzCsyECjW3Dzp685mG6FLpmD/VStOA3eACgKvIkv
         3TlccGDM8jSyRLUBCeORix6l7sYxscmH7b6CIue5S05hr6xjWjoud4Gu9RruSOg2M9Tl
         lCHWle6gz97Q3esVCBhZ5xbC3JS8yoTfIk8NHA9xsT0gjkTbBk4so4ooeZMHPktFHH8z
         JkfV9HJ/lQQ14BV2NXCGdLEmgh75n7IQPv6nvEtio4fGgJKAct2ALXndgkQWUQwLbKM1
         o1ofgpj6YXlg8c0ib9bpVykSaEFIlvi804QbJkDyVqIGmYhrtJ+quGIqoej/8GXx4MXA
         alHg==
X-Forwarded-Encrypted: i=1; AJvYcCW9Lnd9CVY54nFi5Po/XH2AJ1p/E2N8YRCPgpOEOfPngzUucUOhxp4Uj+RRK2bb3xu/Kh9kGgC6HNEEcg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCiUcIrSz9qIobQ/T4doGzMAd0zWPK0uVQXSnbglOZsNbUIyxn
	UPoXGHCudcVUx+8vgMiSCLEVaO9p4KH90efqp9feX10PQS6UXTVXDcdawXnjLgTExOE=
X-Gm-Gg: ASbGnctsb+h7I2vNx1jCyk5yiggCtgjdkhek9fF3HSx3MeTDzSgBZOPCI00skEgQ19x
	C0d24ltWEziYoQRbMtBYA92uoZ81bdKbwINpiVxqEwyBhGZW3H71d42aOoX2mfyhQbPEuwBql3N
	nWKuKMKL2Ob21cob4WNlGmEwaENcvjAWpChCRB9eqzaUM31jQAJUBJscZ31riSSNQBqOG8VeBRZ
	59Lge6hhyYSH3E+VuHQ1bZB2+QHMwT6zHojGnurzjLg/asf+DAcHyGXgDJ1UhTiS/zAWFfnR5sd
	qP/iAp97/uAjbCVkYnwaE03cc+qIxi2OwGxlhffhY6tSiCsaFglvyKdk/KR0918zGQR91HnKv63
	OOxO2IJU=
X-Google-Smtp-Source: AGHT+IHdRXjfhWjLOdwo/Es6Crc9zuoJuSCwsTyx1a1IJmVOPmaXxFQNpnMjbvHQ6+89WTmnzm3cfA==
X-Received: by 2002:a05:6000:288e:b0:3a5:2dae:970f with SMTP id ffacd0b85a97d-3a558821396mr547717f8f.13.1749622449979;
        Tue, 10 Jun 2025 23:14:09 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 00/17] pinctrl: Constify pointers to 'pinctrl_desc' and
 more
Date: Wed, 11 Jun 2025 08:13:32 +0200
Message-Id: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIweSWgC/32NQQqDMBBFryKz7pQYTTWueo/iIsRRBySRiUiLe
 PemHqDL9+C/f0AiYUrQFQcI7Zw4hgz6VoCfXZgIecgMWmmjjG5x5eA3WdDHkDYcKHmsXK2osuR
 daSAPV6GR31f01WeeOW1RPtfHXv7s39xeosLmMZJtWmttbZ4LByfxHmWC/jzPL+k64GC1AAAA
X-Change-ID: 20250528-pinctrl-const-desc-3a40e39eca15
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4396;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=jEd48vl9QSQfzJRNBpRv6p4cKnnNhkUJ4fLA7sMP4dg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6ZNJXNtzDS06LfmSN9fRLSYJEq6TBJKxjlO
 0BdYrKgNxuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkemQAKCRDBN2bmhouD
 19wvD/49T/2W6MD/HM9DqX8B584NX/5doowuan1+HGbgL34Jkh+d7CgyP1/jT80yenqBpDEMWD3
 Ck/IBEYyVtvu9+lBHSavpcGJimI3dvzrS2eIQEYHrv+Db8ILvy2SuVEHWV/SsYTwrQwOFnMpGvW
 9W/ZSKMpl9m4M9tAVHaDBbkMl+Tb5ncycLl6wFt/FsGS9t5Cx2rco/bWPa2MKncWcM9GcsA+2qs
 8E3IELZ63OxMUKovUR0i6iB6rfsJQdSP4qfVLCrHfQKh1mtC2RtQvtSTeTxCP4gOFwoOkDnqhxT
 15x4Pa3hOLuqGQQ07HCsCypN8/p1cAnUGs43CorB6AvmkX+W6f24hElt4yTdzuSXdIbkCoRJ0Ru
 5lhPuh5vXCcYpuGDSVgWG79t3dEa91VeieYekylNWvWQ2AJVwUWT0FUEI5MFevKXuqYvdRw3CKy
 HWh6koZO844FafrzJBAEBAqai2FBax1mQOSMBRpLINtogb1nAKviRdDOWfjMbThMZYrnQhSDwv5
 UPDEC+1fbQmFThXN6Yqbm40F/AyOypi0XO1oAdDCp5+Yscm14p2nyyP6+iZvOY2DWEROhfLuPMw
 u5/9PfeVRutqtDCyfBbpoQgW2VkWNSctUpZgDM5ju51b2N7iqATLm08lXVHj/020ojBZ33Ew4L+
 uvN7ZKqtl1zf1jQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_231411_829561_75D67AFE 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

Changes in v2:
- Add Rb tags
- Patch #1: rephrase commit msg (Geert)
- Patch #2: fix/require dependency on OF
- Link to v1: https://lore.kernel.org/r/20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org

Description:
------------
In several drivers pointers to 'struct pinctrl_desc' is not modified, so
since core does not modify it, it can be made as const.

Dependencies/merging:
---------------------
Patch #4 "pinctrl: Constify pointers to 'pinctrl_desc'" is a
prerequisite for all further patches, including RTC patch, therefore
probably everything should be via main pinctrl tree.

I split several patches, although not all, per SoC-submaintainers, so
reviewing will be easier.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (17):
      pinctrl: starfive: Allow compile testing on other platforms
      pinctrl: Allow compile testing for K210, TB10X and ZYNQ
      pinctrl: amd: Constify pointers to 'pinctrl_desc'
      pinctrl: Constify pointers to 'pinctrl_desc'
      pinctrl: aspeed: Constify static 'pinctrl_desc'
      pinctrl: nuvoton: Constify static 'pinctrl_desc'
      pinctrl: bcm: Constify static 'pinctrl_desc'
      pinctrl: bcm: cygnus-mux: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: bcm: cygnus-ns2: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: bcm: cygnus-nsp: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: as3722: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: max77620: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: palmas: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: renesas: Move fixed assignments to 'pinctrl_desc' definition
      pinctrl: pistachio: Constify static 'pinctrl_desc'
      pinctrl: Constify static 'pinctrl_desc'
      rtc: stm32: Constify static 'pinctrl_desc'

 drivers/pinctrl/Kconfig                            |  9 +++++----
 drivers/pinctrl/Makefile                           |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c         |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            |  2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.h            |  2 +-
 drivers/pinctrl/bcm/pinctrl-bcm4908.c              |  2 +-
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c           |  8 ++++----
 drivers/pinctrl/bcm/pinctrl-ns.c                   |  2 +-
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c              |  8 ++++----
 drivers/pinctrl/bcm/pinctrl-nsp-mux.c              |  8 ++++----
 drivers/pinctrl/berlin/berlin.c                    |  2 +-
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c           |  2 +-
 drivers/pinctrl/core.c                             | 13 +++++++------
 drivers/pinctrl/core.h                             |  2 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c          |  2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c          |  2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c          |  2 +-
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c          |  2 +-
 drivers/pinctrl/pinctrl-amd.c                      |  8 ++++----
 drivers/pinctrl/pinctrl-artpec6.c                  |  2 +-
 drivers/pinctrl/pinctrl-as3722.c                   |  4 ++--
 drivers/pinctrl/pinctrl-bm1880.c                   |  2 +-
 drivers/pinctrl/pinctrl-k210.c                     |  2 +-
 drivers/pinctrl/pinctrl-lpc18xx.c                  |  2 +-
 drivers/pinctrl/pinctrl-max77620.c                 |  9 ++++-----
 drivers/pinctrl/pinctrl-mlxbf3.c                   |  2 +-
 drivers/pinctrl/pinctrl-palmas.c                   |  4 ++--
 drivers/pinctrl/pinctrl-pistachio.c                |  8 ++++----
 drivers/pinctrl/pinctrl-tb10x.c                    |  2 +-
 drivers/pinctrl/pinctrl-zynq.c                     |  2 +-
 drivers/pinctrl/renesas/pinctrl-rzn1.c             |  4 ++--
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c |  2 +-
 drivers/rtc/rtc-stm32.c                            |  2 +-
 include/linux/pinctrl/pinctrl.h                    |  8 ++++----
 36 files changed, 70 insertions(+), 69 deletions(-)
---
base-commit: b27cc623e01be9de1580eaa913508b237a7a9673
change-id: 20250528-pinctrl-const-desc-3a40e39eca15

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
