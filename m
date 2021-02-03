Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F75C433DB
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 20:24:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 625D964F78
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 20:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 625D964F78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V3xwiM4/QLUhjxhLqzK54eseSU9BqOW+2fQp4F4mzTA=; b=HncdfKzGx1EgaUq+wr0/EwnmA
	2Z+OkaLusczF5UCscTnSDwHCVG77GqNgbr8bWjk2lKSPQuJvp083EaJ8E7cIIJdFFhvIS/yMsv3dr
	usueTPWILeX9HueCCNgE3DSvY6VOuhj8aqMNmzmh/HHxEZr9XJx8duigPCyD8+CzO8ax2KKtWW8h1
	DoBcsBmoUEpxmtp/eqEDkTnBI9yuQjziO1i4FznJIaUrpMwG2T+UPughZSED/grb5ktzy7MzCm1n2
	y2vgjpCGejm7YjzruKrZt/W9MepXIqFLt+te7KZ+YtnF9NJkW31bcUwu3MmhHJ+KYk4Gs/zBog3gM
	L4CtM/M0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Ogv-0005I2-Fc; Wed, 03 Feb 2021 20:23:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Ogs-0005HD-3r
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 20:23:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7EC564F8C
 for <linux-riscv@lists.infradead.org>; Wed,  3 Feb 2021 20:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612383832;
 bh=lvzxnyQ4LGchCjzj64FoLucWel7XOLDmMGVWL1qPvZQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DmMd7rfQV6X36FLZZVSI6Z6zOwMvQfELVaTQHnhkssA++dJvyQqp1KjV9vadKRFtq
 f3NtskH36lEykamyR8oKcP/4f26sTlcZi0GF1fVAB7O1tK0UEwzMjUmZId8oi+X7Uc
 xu/widme4gBWFmMoHiS5iGDeuhi32f3hPP/BNgtXqKhVfn33Is/wjgMoE2uAJxHnxM
 92YPYnsOCNldme0CfzC84piDnFm4EO8nDx/M6rD3qDsi24Nh8clbnPWv6f3gMb0ZUf
 MLZZCzVPX/sBITytk7Os9XjoiljGwsDUXsirCPnAHFNGAjp4Zgj0cNQT2u85Zn64Cb
 uGBUyhhl/BXAg==
Received: by mail-ed1-f41.google.com with SMTP id t5so1174039eds.12
 for <linux-riscv@lists.infradead.org>; Wed, 03 Feb 2021 12:23:51 -0800 (PST)
X-Gm-Message-State: AOAM531aNGJIlR777FU1HUg2rAKk/eI2y6Xv7lZ0Z+wnRe5oUjV2S9z9
 mIIRdDJCxVtUq8pV2F59ZhT13T7gGZ/Y3ox7tw==
X-Google-Smtp-Source: ABdhPJyA1Tss86MXlcAlrpQkuRucxUDHkyXLMCSLnXm4M3GuYqj5FdL/1GGY+hoHFP3n5n/8Lzi+2lUk0vrJYUOSMcA=
X-Received: by 2002:a05:6402:2c5:: with SMTP id
 b5mr5052176edx.258.1612383830012; 
 Wed, 03 Feb 2021 12:23:50 -0800 (PST)
MIME-Version: 1.0
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
 <20210202103623.200809-8-damien.lemoal@wdc.com>
 <CAL_JsqJNqKrsB3LJvBpNmY6H3V1c5x4duqB_0p8YKit4+ZYRBw@mail.gmail.com>
 <700da807-a5c8-a552-3d50-948b3ff6a734@gmail.com>
In-Reply-To: <700da807-a5c8-a552-3d50-948b3ff6a734@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 3 Feb 2021 14:23:38 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK-zuhq=rkHyXPMbcGyFhMdfShZYeNhSzLbCu8c7RvCGQ@mail.gmail.com>
Message-ID: <CAL_JsqK-zuhq=rkHyXPMbcGyFhMdfShZYeNhSzLbCu8c7RvCGQ@mail.gmail.com>
Subject: Re: [PATCH v14 07/16] dt-bindings: fix sifive gpio properties
To: Sean Anderson <seanga2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_152354_354644_1A86075F 
X-CRM114-Status: GOOD (  26.52  )
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
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 2, 2021 at 6:01 PM Sean Anderson <seanga2@gmail.com> wrote:
>
> On 2/2/21 2:02 PM, Rob Herring wrote:
> > On Tue, Feb 2, 2021 at 4:36 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
> >>
> >> The sifive gpio IP block supports up to 32 GPIOs. Reflect that in the
> >> interrupts property description and maxItems. Also add the standard
> >> ngpios property to describe the number of GPIOs available on the
> >> implementation.
> >>
> >> Also add the "canaan,k210-gpiohs" compatible string to indicate the use
> >> of this gpio controller in the Canaan Kendryte K210 SoC. If this
> >> compatible string is used, do not define the clocks property as
> >> required as the K210 SoC does not have a software controllable clock
> >> for the Sifive gpio IP block.
> >>
> >> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> >> Cc: Rob Herring <robh@kernel.org>
> >> Cc: devicetree@vger.kernel.org
> >> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> >> ---
> >>   .../devicetree/bindings/gpio/sifive,gpio.yaml | 21 ++++++++++++++++---
> >>   1 file changed, 18 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> >> index ab22056f8b44..2cef18ca737c 100644
> >> --- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> >> +++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> >> @@ -16,6 +16,7 @@ properties:
> >>         - enum:
> >>             - sifive,fu540-c000-gpio
> >>             - sifive,fu740-c000-gpio
> >> +          - canaan,k210-gpiohs
> >>         - const: sifive,gpio0
> >>
> >>     reg:
> >> @@ -23,9 +24,9 @@ properties:
> >>
> >>     interrupts:
> >>       description:
> >> -      interrupt mapping one per GPIO. Maximum 16 GPIOs.
> >> +      interrupt mapping one per GPIO. Maximum 32 GPIOs.
> >>       minItems: 1
> >> -    maxItems: 16
> >> +    maxItems: 32
> >>
> >>     interrupt-controller: true
> >>
> >> @@ -38,6 +39,10 @@ properties:
> >>     "#gpio-cells":
> >>       const: 2
> >>
> >> +  ngpios:
> >> +    minimum: 1
> >> +    maximum: 32
> >
> > What's the default as obviously drivers already assume something.
>
> The driver currently assumes 16. However, as noted in reply to Atish,
> the number of GPIOs is configurable.

So you need a 'default: 16' here.

> > Does a driver actually need to know this? For example, does the
> > register stride change or something?
>
> No. I believe that the number of GPIOs sets which bits in the control
> registers are valid. So the maximum number of GPIOs is the word width of
> the bus.

So like register access size (e.g. readw vs readl)? If so, we have
'reg-io-width' for that purpose.

> > Please don't add it if the only purpose is error check your DT (IOW,
> > if it just checks the max cell value in gpios phandles).
>
> Why not? This seems like exactly the situation this property was
> designed for.

Because it is redundant. All the GPIO lines you want to use should be
connected to something with a *-gpios property. If not, then that's a
failure to describe part of the h/w.

For comparison, we generally don't define how many interrupts an
interrupt controller has. Or how many power-domains a power domain
provider has. I can go on with every provider/consumer binding...

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
