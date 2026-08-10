Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FE0C5AC82
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 11:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	References:MIME-Version:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=T4+w1MxI9Q+pLdwkfQHyUBh1KFAxzy2OSr0zf5qnc4M=; b=aXUTZIYDpI7adhtrQwFQMrIpBF
	1/Q3ot3XJqCvjQLGUr7KsIlEa6JpZ87Roez49Aq/ZByYJUFPozzRGkxynZu3Y+CH2ETAgY7ofj6/a
	3qw55MZQl+WZInD4YUm888pJME8ROhePgNmF4tXpRz/C/iIQVc1h0KJeHqIO5ooB69R8UnlhWXQY7
	8G/0hRmrW1T+52TXSPSLmnAviDOBdlIJTbEqPj8RcUPky9DXENLKH+6uUHhv0LyUhiCEaLtP2Lep3
	Rj5kllC6Zh2kbpxnY7uPfYJFp4X696RN+u8UXBNFnjH+CIFDKZYuoUZ9J1spxENY8EpF7eECuElEv
	e+mPm3iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtO8y-0000000BcLK-0eER;
	Mon, 10 Aug 2026 11:26:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtO8w-0000000BcKh-2Iq1
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 11:26:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 062A340A09
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 11:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0E71F00A3D
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 11:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786361169;
	bh=wZoyj/bcYqq2WaFoOPNolBM0q0on9gdK76aAsSvObhU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=TMYGiQiVyWdja3666tnZyi5AUbCLb4zbspLWjOIyDSld4bkZaB32jXvzVJ7y80nGE
	 bVdpTc4xyAyY5YkfK5HDTntoQwjnWA4qQQWhDeEqkzZZX5CROFNQ49SD0wQMAqpEcS
	 9DJKJ++Z8zhB9f1Wjs2x6/baRiIxyHJu9d++5Qv3KHKdIxWLIJ2mvLNfBRoiQntJ89
	 QgVzjtB2wMbEMcbgaAM1oDDDJWeHAFSRjxDNO+rMpBWAf6ZX5hHObx4k3el+FYth8s
	 NJe07b67fdpivNIpoH/OOSuxYErtLXYeg4QE/sCkYlILbJmWzAVROEJnKyim6UydhL
	 Oc0Tvomcx/orQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b015b2d792so1644034e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 04:26:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RofPRzVf/IHZWeXY3AKcSg2Enc4BQZDVIErK6+lOgaCa51ujd4F2zntezS3+OEAiTEDDIZ+hcvph+G76Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGwvKc+60avfKjmWiHOwK4AChd9GCNZYUD86DYOqdCAr8k7Kg8
	qty/IQ6Ya+qfKkx/88GhRSp0RCfCqj+j5m5z7HzkOLLZBuaiXA6qL6ggH51HA1KOae36Y8MB3jm
	dEZoSgVCcaHyLyKp3SOd/4PG8FdBxkOMvG/3QCbIWOw==
X-Received: by 2002:ac2:4d18:0:b0:5b0:1b0f:7a60 with SMTP id
 2adb3069b0e04-5b2f4cc8da0mr3704106e87.32.1786361168649; Mon, 10 Aug 2026
 04:26:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 06:26:07 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 06:26:07 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260801195613.235430-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260801195613.235430-2-krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 06:26:07 -0500
X-Gmail-Original-Message-ID: <CAMRc=MeiXHL-1i31q-+wuibK5qM1=xV+4qn0z+CWFXjt3CdrCQ@mail.gmail.com>
X-Gm-Features: AUfX_myd-9E67e5jDYYEWIDd_Fhka4yTI8ar0CZ3ucq5EUGNAu2R2AhAZ0we-FI
Message-ID: <CAMRc=MeiXHL-1i31q-+wuibK5qM1=xV+4qn0z+CWFXjt3CdrCQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Correct white-space style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Lee Jones <lee@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Yangbo Lu <yangbo.lu@nxp.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Richard Cochran <richardcochran@gmail.com>, 
	Jens Wiklander <jenswi@kernel.org>, Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>, 
	YC Hung <yc.hung@mediatek.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Sean Wang <sean.wang@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	coresight@lists.linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-ide@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, mfd@lists.linux.dev, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-pm@vger.kernel.org, netdev@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-usb@vger.kernel.org
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

On Sat, 1 Aug 2026 21:56:14 +0200, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> said:
> Correct a few white-space issues, like double space after '=' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> ---
>
> Patch applies on Rob's for-next branch.
> ---
>  .../arm/firmware/linaro,optee-tz.yaml         |  8 +-
>  .../devicetree/bindings/arm/psci.yaml         | 18 ++--
>  .../bindings/arm/qcom,coresight-tnoc.yaml     |  2 +-
>  .../devicetree/bindings/ata/st,ahci.yaml      | 22 ++---
>  .../bindings/display/ti/ti,am65x-dss.yaml     | 12 +--
>  .../bindings/display/ti/ti,j721e-dss.yaml     | 96 +++++++++----------
>  .../bindings/display/ti/ti,k2g-dss.yaml       | 36 +++----
>  .../bindings/dsp/mediatek,mt8195-dsp.yaml     |  2 +-
>  .../bindings/gpio/st,nomadik-gpio.yaml        |  2 +-
>  .../devicetree/bindings/i2c/st,sti-i2c.yaml   |  2 +-
>  .../bindings/mailbox/st,sti-mailbox.yaml      |  2 +-
>  .../bindings/mfd/maxim,max77620.yaml          |  2 +-
>  .../bindings/net/wireless/qcom,ath10k.yaml    | 34 +++----
>  .../devicetree/bindings/opp/opp-v2.yaml       | 28 +++---
>  .../pinctrl/mediatek,mt7988-pinctrl.yaml      |  2 +-
>  .../devicetree/bindings/ptp/fsl,ptp.yaml      | 12 +--
>  .../devicetree/bindings/pwm/pwm-sifive.yaml   |  2 +-
>  .../bindings/usb/ti,twl4030-usb.yaml          |  2 +-
>  18 files changed, 142 insertions(+), 142 deletions(-)
>

For GPIO:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
