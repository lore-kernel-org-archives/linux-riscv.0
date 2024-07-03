Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36933C2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 19:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GSflo4Yc2fnWXKSZNjDT3rmxTSYLQ5i9LEU1rlIj5rc=; b=hvcAmdbSW0PssXN7AesSNKD/lR
	ZXI2eXqx8JpEEopqHujytNJyM48dyFH+OsiyXpGb+SruGXgIHgiiNZO4gJpqplKs/tQviRUQxX+Rw
	qk5JFYH0UfWe0a4To9jB5toxqS7QqmP/3h761WMZUdSK245QFwtqSAQ+vLbqU9azKBFwOYArboBs8
	1b8ltyvYJMxZGki/AvOXTuKsc5kDtdhWMT5xw35ypVeTatkl3L25MtcagrTHPlOf4efvl8E9aU55d
	FDPOZkcQQllOTDv9tTCZIfBpE8DeSuocZniUe9zbnAXeso5lMjWokU1bb20f57UNRDcizNuUlFgLo
	9ef9XmFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP5WA-0000000BGHG-1SQ2;
	Wed, 03 Jul 2024 19:19:50 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP5W7-0000000BGGl-0GkU
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 19:19:49 +0000
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 80A373FD49
	for <linux-riscv@lists.infradead.org>; Wed,  3 Jul 2024 19:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1720034384;
	bh=4AL8Q8t5GvaSDcDlTv2xvRzLk0BHc20eWebGxrnXzHw=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=RPoRTLfcfq+jMTLG2h1dXkBX7EkZr/zBB9s0Wx7ItaVrUSzDGfjsoPk9tIErmTrpf
	 dBm5nyYhLD1rXf9gQ/ob0at+cgEacw/C0gI4/aQqrhLhHHY5zG5GygvCagZXOjs0Ic
	 C2C5MrIMPbIFWsWciFn+aPiMpRfFjwcQJnd2v4agOFMdRi9YpOVHDCcaoZx/om/Nla
	 druJi5bYPGfSKL3LzI4LBd8W2Zogw1z/OaaIihiqC/c7D4zcBtoJWeVY93GJZWf6W9
	 DmkrCFAq1uxR+Qutq5SGHgAEv8Ijwsjmm+JXtH4Z4nQns+68MjKF7d/Yp17U8YdTyb
	 yOUZaHpRBNJWA==
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-79d5d9b24a7so676146485a.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jul 2024 12:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720034383; x=1720639183;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4AL8Q8t5GvaSDcDlTv2xvRzLk0BHc20eWebGxrnXzHw=;
        b=nC6cssenouHnGWhDQcas/S+J+x9qfcxW7KSE6Fsm3CEm1kyHOMFpzm2u0s3ziDEnWc
         F0wKs5O2T76QwmaBTCPa4+9dC5TWwjaGVe7JCp7PF0NFh29Xo9pMqtQftfR3qoy52SGw
         JxHIgGBzgJS0pouLUgcufnY4H39w0ekQ1RgCHIdZIpfJBU99y50ITkQuR9cyIXSgTSi1
         iyEFQE4IFsfkqCCdFFTgkaBS4XoeL1N+3GPevz6iISxi3z1849Evaeq36t+FFlfqbReo
         cOAHFbhEUv9V4UzRWSmPp5KpFtnSTqPF/W556bZ6OZSPzHctwYSByPPKGvpSYZyYm74k
         azvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPrIq1jGow8oUgfHy91DWLXwCl8GxcixLjxj9+/FhGAtZVxxg/ZlofZsQ0C9qpO1Vbcyy1gBTiV8fhnNomy65f3hKeiYoawHg73lwqxM0Z
X-Gm-Message-State: AOJu0Yzd8ZSyQc5Ykf0PWtErZKaursvBib8gkubZR/Wg+AqdKJpv+yUk
	8HZFfPyfx7zxq8xNoBfuIKFUMO0RRCb4Fnf1RNInlE9Z+qKrg1AIxkWdJHEijqia2ScK6OnZ+E4
	jlfhGioKegMyvk798Ps61pYQK1Ng6JgaNGvOzPCruJ/0WhvZaGL/p3TqyrAXliGCliYNniFEch7
	aKLMWM9gcSnsP7PATRyERHB0nEJMw+f1WA3Aaljg8I8dDts93TcojLNbjV
X-Received: by 2002:a05:622a:4c6:b0:441:58c7:92fb with SMTP id d75a77b69052e-44662e48d9fmr131261211cf.47.1720034382948;
        Wed, 03 Jul 2024 12:19:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGac9ZwuaiHgni0ADiKooLH8mMTml1Wkk3i3pPQYN7kaucLcuApVxgidfFEb5Qy7OVYNbEL6OKn20MHspRgJho=
X-Received: by 2002:a05:622a:4c6:b0:441:58c7:92fb with SMTP id
 d75a77b69052e-44662e48d9fmr131260881cf.47.1720034382502; Wed, 03 Jul 2024
 12:19:42 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 3 Jul 2024 12:19:41 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240703135303.GA56155-robh@kernel.org>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
 <20240103132852.298964-2-emil.renner.berthing@canonical.com>
 <20240115173657.GA999912-robh@kernel.org> <CAJM55Z9xF6_WCcg02xJJfu=UCOj=4m64BXvJTaV4vX09WLhc0w@mail.gmail.com>
 <20240703135303.GA56155-robh@kernel.org>
Mime-Version: 1.0
Date: Wed, 3 Jul 2024 12:19:41 -0700
Message-ID: <CAJM55Z-ntP55uaTQob_=P-8ud43YNh7Gy0XgUfQ7-O8zPpuGxg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl bindings
To: Rob Herring <robh@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Drew Fustini <dfustini@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_121947_513481_18E95C3A 
X-CRM114-Status: GOOD (  46.72  )
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

Rob Herring wrote:
> On Fri, May 17, 2024 at 07:48:17AM -0500, Emil Renner Berthing wrote:
> > Rob Herring wrote:
> > > On Wed, Jan 03, 2024 at 02:28:38PM +0100, Emil Renner Berthing wrote:
> > > > Add bindings for the pin controllers on the T-Head TH1520 RISC-V SoC.
> > > >
> > > > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > > > ---
> > > >  .../pinctrl/thead,th1520-pinctrl.yaml         | 372 ++++++++++++++++++
> > > >  1 file changed, 372 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> > > > new file mode 100644
> > > > index 000000000000..d3ad7a7cfdd1
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> > > > @@ -0,0 +1,372 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/pinctrl/thead,th1520-pinctrl.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: T-Head TH1520 SoC pin controller
> > > > +
> > > > +maintainers:
> > > > +  - Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > > > +
> > > > +description: |
> > > > +  Pinmux and pinconf controller in the T-Head TH1520 RISC-V SoC.
> > > > +
> > > > +  The TH1520 has 3 groups of pads each controlled from different memory ranges.
> > > > +  Confusingly the memory ranges are named
> > > > +    PADCTRL_AOSYS  -> PAD Group 1
> > > > +    PADCTRL1_APSYS -> PAD Group 2
> > > > +    PADCTRL0_APSYS -> PAD Group 3
> > > > +
> > > > +  Each pad can be muxed individually to up to 6 different functions. For most
> > > > +  pads only a few of those 6 configurations are valid though, and a few pads in
> > > > +  group 1 does not support muxing at all.
> > > > +
> > > > +  Pinconf is fairly regular except for a few pads in group 1 that either can't
> > > > +  be configured or has some special functions. The rest have configurable drive
> > > > +  strength, input enable, schmitt trigger, slew rate, pull-up and pull-down in
> > > > +  addition to a special strong pull up.
> > > > +
> > > > +  Certain pads in group 1 can be muxed to AUDIO_PA0 - AUDIO_PA30 functions and
> > > > +  are then meant to be used by the audio co-processor. Each such pad can then
> > > > +  be further muxed to either audio GPIO or one of 4 functions such as UART, I2C
> > > > +  and I2S. If the audio pad is muxed to one of the 4 functions then pinconf is
> > > > +  also configured in different registers. All of this is done from a different
> > > > +  AUDIO_IOCTRL memory range and is left to the audio co-processor for now.
> > >
> > > It is still not clear to me if each instance is a different programming
> > > model or the same with just different connections. The latter should
> > > be the same compatible string. That needs to be answered in *this*
> > > patch, not a reply.
> >
> > Hi Rob,
> >
> > Sorry for the late response. I honestly don't know exactly what you mean by
> > differenty programming models and what the difference is, so I'll need a bit of
> > help with what you want me to write here.
>
> Is the register interface of each instance the same? Looks like it is
> from the driver. So normally that's 3 instances of the same compatible.
>
> > Any driver for the TH1520 SoC (not just Linux) would need some way to discern
> > between the 3 pin controllers so they know how many pins to control and what
> > pinmux settings are valid. Basically they'd need the data in the three
> > th1520_group{1,2,3}_pins arrays in the driver and a way to know which of them
> > to use.
> >
> > https://lore.kernel.org/linux-riscv/20240103132852.298964-3-emil.renner.berthing@canonical.com/
>
> Why do you need to know how many pins? The DT says configure a pin and
> you just configure it. It's not the kernel's job to validate that the DT
> is correct.
>
> Aren't the pin names globally unique? So you just look up the pin name
> across all the arrays. Or you can just look up one pin from each
> instance to find which th1520_groupN_pins array goes with the instance.
> Or just have 1 array.

Just to be clear, do you mean to add just one node for all 3 instances like
this?

padctrl: pinctrl@ffe7f3c000 {
    compatible = "thead,th1520-pinctrl";
    reg = <0xff 0xe7f3c000 0x0 0x1000>,
          <0xff 0xec007000 0x0 0x1000>,
          <0xff 0xfff4a000 0x0 0x2000>;
    reg-names = "group2", "group3", "group1";
    clocks = <&apb_clk>, <&apb_clk>, <&aonsys_clk>;
    clock-names = "group2", "group3", "group1";
};

That will work since we can then register all pins at the same time. But I
can't see how it will work when keeping the 3 different nodes since each
instance needs to register the pins they control at probe time. So there will
need to be some way to tell the 3 different nodes apart.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
