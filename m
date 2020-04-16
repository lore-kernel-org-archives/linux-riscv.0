Return-Path: <SRS0=YukA=6A=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD33EC2BB85
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 Apr 2020 08:04:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3EB7206B9
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 Apr 2020 08:04:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QFDpo6hL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X0/ss7Bs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3EB7206B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sHJ12tcYNsSfgttEUfr+8K97RYYeru+HfS3132z1u6U=; b=QFDpo6hLmW4Gl6z54aM+2zX/t
	cXld3vCPW+iGqkdmzhw0y5zxMGiz5bUtdzhF8nI5v0npPCgpymPM50598MfnnwvCCdFclLh6SbN5k
	D8+34A0Z8Joo2tVjsoIY+ykP+pHaj4cx1qk4U0MQ5x+jfNV7mSguKl+x4a46CKT7PadFtePiM6z71
	WzEHu/dfznatKj7HMwpfXezw/OLrfr1+qr3uPga8PBTSGBTIUpvD0o7RFbuXP+yqd5E4+0bkBfiES
	pxdA9FcCJ5pyTdwyirqRLap/CcexhP9T5OsR9V0+wfYvJ8CzKldgztQThLGg6Rjjzpr7CEq2av8wE
	GYS7NIujQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOzVe-00062Y-QR; Thu, 16 Apr 2020 08:04:30 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOzVb-00061T-6e
 for linux-riscv@lists.infradead.org; Thu, 16 Apr 2020 08:04:28 +0000
Received: by mail-lj1-x242.google.com with SMTP id h25so6757499lja.10
 for <linux-riscv@lists.infradead.org>; Thu, 16 Apr 2020 01:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sHJ12tcYNsSfgttEUfr+8K97RYYeru+HfS3132z1u6U=;
 b=X0/ss7BsABjV0v58eUDRQHcZuoc6jZGR8QlxXHm4iMm2jIobcqWr46sIwdS9XtZxjv
 J6lyowndGnsjJ2T09ZLAXy4vuLLuNuWfByvI3ZL89WC2FPNAxvWKs0UVVQzT5Ee2llor
 wzSBTCJVOBt2+9Ohb9KBSlvOhscZ+OiUHUnMWxgzt6ZDO9PVTPdpvuxMydg2t99gu6wZ
 oj37Ec/BUycHap9z0+LYieFHR2fzSSCOI+l9sq7xxfebteYGbDW3WPgbMFAteqOk2bKf
 K6q0mR7VNoF30yy9UA6z33ozE8ZHcOBMgzyIRBgLhkAceDqUT6mHxhpEYBOQpImmHhPe
 fohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sHJ12tcYNsSfgttEUfr+8K97RYYeru+HfS3132z1u6U=;
 b=Wm5T8oN7CJv4HvwEBdrxVrBo5SsiOq3YCYHOW6rCWDQy2N96rn0l7BlO6wSmrFyhZI
 ANygrFt64UH/UHA1/FaeUZ7UmFpFp/XIbc/rmKUDTS8r/giYjfiGafm2gZTQHmklZLVw
 BdW1PXBo5scvdxoz590CmZhEmddonrvaiM+oGDUAo4YPzMlazXoP27VTm5A2O+icvtD+
 qO65zX4aGsShjI316p/vFIiJtx55Z/goyTU4HBHG3GRdnnIlvIONgaUaWM2CQNkQai5e
 nGeJ+25Qo8BTsLMaa89XsNDmwEir1ff96L8c9ajiF13gESqY2hcAd0KcwgepzoDE1lxP
 v4dA==
X-Gm-Message-State: AGi0PubURwmDBaVsYsxi1gsQWyKUW5sGcMPXZArmRNVQRnr9sBG4/92i
 a5yBWUVnxX4hhbmpFCoxfCuF0fFtumsiv6qELTweLA==
X-Google-Smtp-Source: APiQypJa0ViiE/ZtKOxobDklTprFmqZh7Nrc1Zappo4GrzOsZZrJysLNIrOKRtQLmBogZMZaiR9WSbvdJtt5f/9aPuw=
X-Received: by 2002:a2e:9ad9:: with SMTP id p25mr5793355ljj.39.1587024265660; 
 Thu, 16 Apr 2020 01:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200416005549.9683-1-robh@kernel.org>
 <20200416005549.9683-2-robh@kernel.org>
In-Reply-To: <20200416005549.9683-2-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Apr 2020 10:04:14 +0200
Message-ID: <CACRpkdYDrytCL3ZX9YeW39t2mb4M8KbCfCFm0Ba67oPpshckLw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: Remove cases of 'allOf' containing a
 '$ref'
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_010427_259980_48E54417 
X-CRM114-Status: GOOD (  12.69  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Sam Ravnborg <sam@ravnborg.org>,
 linux-pwm@vger.kernel.org, linux-iio <linux-iio@vger.kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>, linux-remoteproc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-i2c <linux-i2c@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
 linux-riscv@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, linux-rtc@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Linux Input <linux-input@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Maxime Ripard <mripard@kernel.org>,
 linux-can@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Amit Kucheria <amit.kucheria@linaro.org>,
 linux-spi <linux-spi@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 netdev <netdev@vger.kernel.org>, Jonathan Cameron <jic23@kernel.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 16, 2020 at 2:55 AM Rob Herring <robh@kernel.org> wrote:

> json-schema versions draft7 and earlier have a weird behavior in that
> any keywords combined with a '$ref' are ignored (silently). The correct
> form was to put a '$ref' under an 'allOf'. This behavior is now changed
> in the 2019-09 json-schema spec and '$ref' can be mixed with other
> keywords. The json-schema library doesn't yet support this, but the
> tooling now does a fixup for this and either way works.
>
> This has been a constant source of review comments, so let's change this
> treewide so everyone copies the simpler syntax.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for fixing this!
Linus Walleij

