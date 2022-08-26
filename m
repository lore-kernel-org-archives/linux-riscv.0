Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033F8ECAAA2
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 00:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:In-Reply-To:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=hax3zVlu7FCuKeg91d19o5Q5jEtampfSm+/FDFZij1o=; b=k0c1pIgbNGOx6i
	gE7VBTewCVQsvhhQwAsQHmSjohRTsSdWislCuFpKGuHLs5V6E4nbVr/Z6Sh/imParb8rmFYF2vRxc
	LRN/tlLw+OwojB+m5I8hwFMX14L6ATu/UUIs9yjN0fUYT8663WUzVsMtPWQgzmP/T3l0kC+2UQpOM
	Mz2UUCw2QlZ7AYqvmUmlViKflb4MkaYKZ4GhdxUX38rb0WI4Xe2cpNdXkWyt2fN7BeQxbd7RfXpRR
	rvKploGKVcjbWpZoXhiA8pPqL64P6wzQatwRKf5be0IyO9pztCxuxMXGLW8NhiFIalmFzncPuXHzz
	cXXb60Gr2QATQ/zRilzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRN0e-004QKD-VX; Fri, 26 Aug 2022 00:15:41 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRN0b-004QI0-AK
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 00:15:39 +0000
Received: by mail-pl1-x62d.google.com with SMTP id y4so223274plb.2
        for <linux-riscv@lists.infradead.org>; Thu, 25 Aug 2022 17:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc;
        bh=nC2tg0emIzyQ6j7+Pili4KJidqGPH8PH55AhgBkY/FA=;
        b=M+CckdCklD6yjY0v7efK+WsWpGf9w/E/Q5cg7pw0xwEU/hCwcWtKeNb5OS2y9JM/Jl
         RSRS6Wh6W1BYofO43BbuBBqnZqCmyjx740wWDvfArbBM9VaI0X9w1T44rrX1LokKQviF
         c8XvlFXfnf7KxBbhy3Bql+ojwci6kFMMv3Yc9NwgpVgOlxT3+Pti+kRO9npKJRdnsKUs
         B8KtQ54rYbS6Oxif4vj5sL0bl/d1puynyKcWPcJJvTCUhIMsD8ft7hPS6Kj+3FnySFhF
         aLlORF9pdVPeVZK1FOjGiWhDZvQQfaMR98tajHTXjTYcDmwdhJGueQCgLlfue53AoHhb
         /YYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
         :from:to:cc;
        bh=nC2tg0emIzyQ6j7+Pili4KJidqGPH8PH55AhgBkY/FA=;
        b=SImO/WFJiUW5+uH2AQ6K3lRM/XHtjRGqBeUsa3J5amYxKj9iI2jYPZJwr6s7YOSrZ2
         jJ+BB+dqHVIW6siEXBVBTVP70trhvtxf8vAI5hkHvUKQKvcHVgfw5nO46rC7YK6Ow7JP
         qQR1yzXg2NGdLj89fiYVZMFT87Yj/zSuJ0PSnsJ5Wb9Wuyv2S0cmK5gTykS04H6E68Lm
         n8Ha32KaOMFRBY7aGzf6h3jHsRL1Xw8TCf+q0f/V0k3o8HaHK8KAReuBT0RlL7jcwv1U
         CESAsKXq8v1O2yVLue4UJ+Q7w42eAPKyt+hQcNMKav3qKZQMsmRlD4709Zopxowdf0t/
         +MYQ==
X-Gm-Message-State: ACgBeo1YGsqjtXsW3J738LxToZ5GXAd0PMIbqjrMM22enlQePFH/EIeO
	a0Ub78SF6Nnia94qKJ2Ji5q49g==
X-Google-Smtp-Source: AA6agR5DmVcNrt1Ba1Wa44I7a7PSdKiS4h2VM9U5UvcW94BYWPNSRTvF3TTwSht20a22gL3iZRxeYQ==
X-Received: by 2002:a17:90b:4d12:b0:1f5:59e1:994f with SMTP id mw18-20020a17090b4d1200b001f559e1994fmr1496973pjb.217.1661472936347;
        Thu, 25 Aug 2022 17:15:36 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id d2-20020a170902654200b001725d542190sm141317pln.181.2022.08.25.17.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 17:15:35 -0700 (PDT)
Date: Thu, 25 Aug 2022 17:15:35 -0700 (PDT)
X-Google-Original-Date: Thu, 25 Aug 2022 16:48:09 PDT (-0700)
Subject: Re: [RESEND PATCH 1/2] MAINTAINERS: add PolarFire SoC dt bindings
In-Reply-To: <20220810171124.74ew3yz5dtkz6v2s@pengutronix.de>
CC: conor.dooley@microchip.com, soc@kernel.org, daire.mcnamara@microchip.com,
  broonie@kernel.org, wsa@kernel.org, thierry.reding@gmail.com, jassisinghbrar@gmail.com,
  linus.walleij@linaro.org, brgl@bgdev.pl, Greg KH <gregkh@linuxfoundation.org>,
  Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, mturquette@baylibre.com, sboyd@kernel.org,
  devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, mkl@pengutronix.de
From: Palmer Dabbelt <palmer@dabbelt.com>
To: u.kleine-koenig@pengutronix.de
Message-ID: <mhng-7c3ab2fe-b9da-47ce-8a00-4eb0979183c8@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_171537_379568_04CA2D3C 
X-CRM114-Status: GOOD (  16.88  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2236613032859200338=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2236613032859200338==
Content-Type: text/plain

On Wed, 10 Aug 2022 10:11:24 PDT (-0700), u.kleine-koenig@pengutronix.de wrote:
> On Wed, Aug 10, 2022 at 03:02:43PM +0100, Conor Dooley wrote:
>> So far when I added bindings for the platform I never added them to
>> our MAINTAINERS entry. No time like the present to improve the coverage.
>> 
>> CC: Mark Brown <broonie@kernel.org>
>> CC: Wolfram Sang <wsa@kernel.org>
>> CC: Thierry Reding <thierry.reding@gmail.com>
>> CC: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>
> Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Looks like git-am isn't handling the UTF here, not sure what's up but 
it's probably just something broken with my email setup.  I fixed it up 
manually, but apologies if I've missed one in the past.

>> CC: Jassi Brar <jassisinghbrar@gmail.com>
>> CC: Linus Walleij <linus.walleij@linaro.org>
>> CC: Bartosz Golaszewski <brgl@bgdev.pl>
>> CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> CC: Arnd Bergmann <arnd@arndb.de>
>> CC: Olof Johansson <olof@lixom.net>
>> CC: Michael Turquette <mturquette@baylibre.com>
>> CC: Stephen Boyd <sboyd@kernel.org>
>> Suggested-by: Mark Brown <broonie@kernel.org>
>> Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for can
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  MAINTAINERS | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 868bbf31603d..fd0f10a110e7 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -17512,6 +17512,15 @@ M:	Conor Dooley <conor.dooley@microchip.com>
>>  M:	Daire McNamara <daire.mcnamara@microchip.com>
>>  L:	linux-riscv@lists.infradead.org
>>  S:	Supported
>> +F:	Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
>> +F:	Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
>> +F:	Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
>> +F:	Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
>> +F:	Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
>> +F:	Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
>> +F:	Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
>> +F:	Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
>> +F:	Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
>>  F:	arch/riscv/boot/dts/microchip/
>>  F:	drivers/char/hw_random/mpfs-rng.c
>>  F:	drivers/clk/microchip/clk-mpfs.c
>> -- 
>> 2.36.1
>> 
>> 
>
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |


--===============2236613032859200338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2236613032859200338==--
