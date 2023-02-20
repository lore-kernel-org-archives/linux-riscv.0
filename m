Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D250C64ED8
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 10:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VnNpPgom8T52gIOhPZnT92j+wpSzbJMSDvfH07NPOXs=; b=T5Z0t1ehGRLvdf
	JUSQD/oHNWszSh9Q8yTJNqK1uEbfooPEoLJBMCd2ABJMix6WLCGusLTvKp9GgJ8aiLEZS3fSesvTN
	BLuoFmV7ukdd3nxHfda8SkG7eV9MKeijVB/z9c3myr+kSo8GjnlyKKR0JozcgA5f+D5BsGvFJawRx
	MAslM3ca6dCV5Kn5MQR+O9Gb6DJW/QxB3YsXNXpjDGVwbgFLlsBt2JMW/3nzfg9cf9VE9Yvi90P5a
	SSDm004SPWQYnUUNsuh9xOrD1eOwoefoG3imPnc3Q+urSNk3GajCnFTvJzpCibvHnhJVrN6wu/qDN
	xBSlzZ7Ra69zSy1Nn+dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU3Dt-003bmP-8H; Mon, 20 Feb 2023 10:16:41 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU3DK-003bgh-Qd
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 10:16:33 +0000
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 391753F722
	for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 10:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1676888162;
	bh=fKd9fxybT9+hFfyTDDr2Mtw7ZX+21Hd2dT0jDnkibYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=qhg4hpVsVwo4NJzEHTDfmK6ZkTVSPFhCOU+4/92n/JWey0E1qN5PUlL+ldnFny+Ld
	 N+zDTOpuKPna3MO0mlMPGZo5sktSg0f4oGksqENTpX5n7wFOkEvLVX+Ch7BS86Ee2m
	 3FD4eSBP5JUzVviNlM9SkEXe7NxT7jXZxqDk7QvGK1k7O3Ev58sdV1+H2vpm1u7v7o
	 jAD3TUApYmR3tsu88fsMtLC2ZKWBpWxZNiihL3ZNHbPFe5lECNmRH2muxluOAmW0NI
	 cpYzpjuYFsIkg3YyQt/BmRahDnGKWPH7cxd1mDlWdjJQ7BdrBDugoCzlBi7RsIlVQU
	 pZraWF8xOHo+A==
Received: by mail-qv1-f69.google.com with SMTP id m1-20020a05621402a100b004bb706b3a27so103316qvv.20
        for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 02:16:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKd9fxybT9+hFfyTDDr2Mtw7ZX+21Hd2dT0jDnkibYM=;
        b=ofSrvwDdfybQJj/87OI+BIFtoOLTLMtOhMwHi7+d0Ao6Owv0HjYal15lslMzKsWkv8
         53ZF6XBofjFam/HaENe6d7QxCtyWtBBpqTA7xUHMt2isHcY5SOe91ByklTMNW33I3/MT
         G3kasYOijpZ28aCVQZzV4XhVmrAmSBBNHQ1aD6Xziro2wwbtipkuXrdbON1dWBZ83Dzv
         LFx/GtsVIc6oEObsjBXn/NTqK/8k5sfxjhP3Tf8By13ilUgUiFyTra5KlDomfKdnXJCI
         IVySY5bLJkQA3wb2v44AE3N4aZ3rbPAT1TaduPDJhO+9ccFSS5XTVkpT92UvV8ZNlAfL
         hItg==
X-Gm-Message-State: AO0yUKWY6wMfIo68u13zPDX6qE1e22NGvx2UVkx0lmm1/A9BMwtssntx
	uMcKXM//w4bSveiFPosUA/uClMoedU1zWvbb6c9smJEf3ETUvizpOfVC31+JGRZaJnPHjEiSxWI
	DqIfUvXFecgret6NBwROqlFQf6HhOta4+UKJCSSxLkIAgm5n76bHoIKkuwwGsog==
X-Received: by 2002:a0c:d990:0:b0:570:fc87:4f2c with SMTP id y16-20020a0cd990000000b00570fc874f2cmr203792qvj.83.1676888160749;
        Mon, 20 Feb 2023 02:16:00 -0800 (PST)
X-Google-Smtp-Source: AK7set/YEwtnCc0MdoLEDmbY+Jh+bhbVGYGL0//BwQFePHm998lWNjLRhslfWc3fYUt397bZwhY8xJy7wcjRn5Bnl4Y=
X-Received: by 2002:a0c:d990:0:b0:570:fc87:4f2c with SMTP id
 y16-20020a0cd990000000b00570fc874f2cmr203789qvj.83.1676888160500; Mon, 20 Feb
 2023 02:16:00 -0800 (PST)
MIME-Version: 1.0
References: <20230209143702.44408-1-hal.feng@starfivetech.com>
 <CACRpkdbao9M5dMHFO_QE8z4_E6DZLZsMUW1OnUNjKSfQc59=ew@mail.gmail.com> <4211d93d-702c-6759-6f25-f86160c0be5d@starfivetech.com>
In-Reply-To: <4211d93d-702c-6759-6f25-f86160c0be5d@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 20 Feb 2023 11:15:44 +0100
Message-ID: <CAJM55Z-+Cxdebcn4MLXfQdOVhx4c2SQ+zMH8cjn-Yq35xO8g0A@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] Basic pinctrl support for StarFive JH7110 RISC-V SoC
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Andreas Schwab <schwab@suse.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_021612_868431_854B1D1A 
X-CRM114-Status: GOOD (  19.66  )
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

On Sat, 11 Feb 2023 at 09:25, Hal Feng <hal.feng@starfivetech.com> wrote:
> On Fri, 10 Feb 2023 23:45:05 +0100, Linus Walleij wrote:
> > On Thu, Feb 9, 2023 at 3:37 PM Hal Feng <hal.feng@starfivetech.com> wrote:
> >
> > > This patch series adds basic pinctrl support for StarFive JH7110 SoC.
> >
> > This v4 version applied, the driver is in good shape and all bindings ACKed,
> > nice work on this driver!
>
> v4? Is this a typo? This series is v5.
> Anyway, thank you so much!

Hi Hal and Linus

I'm curious if there is a plan to address Icenowy's concerns here:
https://lore.kernel.org/linux-gpio/52dcbe48dbf5f2561713a9642943353216fef15a.camel@icenowy.me/

The problem is that input from "GPIO" pins is configured a little
differently on the StarFive SoCs. Instead of having a register pr.
pin(grroup) there is a register pr. control line to the peripherals,
and into these you write the pin number + 2 of the pin you want the
peripheral to react to. Why +2? That's because 0 is a special "always
low" signal and similarly 1 is a special "always high" signal.

With the current bindings one hacky way to solve this is to treat
those two special values as kind of "virtual pins" that will always be
high or low. So that would be something like

pinmux = <GPIOMUX(GPIO_ALWAYS_LOW, GPOUT_IGNORED, GPOEN_DISABLE,
GPI_SYS_USB_OVERCURRENT)>;

..but this means we might need to mux these two virtual pins to
multiple peripherals. I'm not sure the pinmux framework is prepared
for that.

/Emil

> Best regards,
> Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
