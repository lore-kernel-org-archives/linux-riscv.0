Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B789C001DB
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Aug 2023 13:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mCvBpSW5XkKDk31f7NY11i0XAFvF5YGqcMAFl6h/ROY=; b=uC94xmuhWSqFXW
	wl6KI7atAhqnUSl0uEGcbTkXxRt+YbK1d8hqOQvIrUXpSFXmfHWvIF6zLwAHUVcODlRz1mxidXfWV
	e4i/3zcJrjYk0E+qHP5IuN08OXPHPNrQ2cn0b2xEPR3jPwgiFA2kZd3VtwXcPJVA0jTnIEtTOKDQJ
	oqyr9ACBcVbMNZa9tqNvDnxPkkCyQfhvHxCDgiQj66GC3nYMhQaJ/gTGu5IKzqzcy4FAUqeFGC4A2
	tuXQPn+kjL5q1J8qaqpfHrAcaXDonNbcft9KoAMuSn+VEUUzIWEEHdSNpRRV5a1vfZim7xAX1ay0E
	yjX15RkSXD9cgVn2BsGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSH7K-00EBHm-39;
	Sat, 05 Aug 2023 13:14:50 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSH7H-00EBGm-0A
	for linux-riscv@lists.infradead.org;
	Sat, 05 Aug 2023 13:14:49 +0000
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 009EA417B9
	for <linux-riscv@lists.infradead.org>; Sat,  5 Aug 2023 13:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1691241279;
	bh=UIZCorPNYUH2jkiVRuR7FSmjsopaTm8kFTAnEKf8VTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=DZAIk53bWNUiFvTJGzRD0d0OTya6k9GR3OkuO8HbMWyEJACAYec3LjbRS3O+rFTth
	 77YjDghJE9zlkvQXUBvfnHTLNl38S/X1RAVNWsi/cRYafFkX/VySLXrYaqiJbv64XP
	 waWpktViP22tymNNfTqJMPVQW5mjFbDtL/cW/75/mhTOtwY72yf/S2YEoxaqD2D8hM
	 MMrNgiq2xgXbs25xyiEmMkqRvMv2Goiewk89rLBMtuPoyZl3my0QG8bUQqRvT56HEd
	 kDwAzx51nMV4/Hdi78aH+t1weWallbnjvnuW2XXXnlmWxQgbzhdjVjyveDilZ3QFkj
	 zs0290kXJaEiQ==
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7683da3e2a5so332739485a.3
        for <linux-riscv@lists.infradead.org>; Sat, 05 Aug 2023 06:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691241277; x=1691846077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UIZCorPNYUH2jkiVRuR7FSmjsopaTm8kFTAnEKf8VTE=;
        b=aMt2dAYztKiCkll+4ukWn3l8zOZW3YDpzR6X0XPyW2Eoth6m5gldMIPFwZlxJvLLsQ
         DY7UOeJhFvrcYCh8UaO3DOBeXylh2Au5FmNVa60RoISpgrWcee/wWDe+kblCO/17j5+E
         LOYCiIFdKclmemtMd+SlX17dfknOvyO8EmHPeT1zKhytryK+8Mahfj9v7fvkEhSfjgw0
         5haT3sZfpn2ijaDEINcSHc4KsD8sG1dV5pVw4VQBZhtxLWPEOJoZGmk3W2dEHEeP6PwK
         OyNwLKh8HxczKYJ8juF0IVkEgYYvkNZKFkJjrBRFLuI2Ao4NsbqU1zj+v9WvzfHAmei+
         jlvw==
X-Gm-Message-State: AOJu0Yy62c9vnmQdinjqMLoSbJwKQlY0GjtxBzafBeOGNHtdnPc1ulpC
	vatrQ7rr9uVRJ2mTCKhOK+EsgftFf1eE4fsbo/RFUKJcy6rzxn8X6xWGrr7S0R8XkQDsfdSBgd2
	JXzsQRxV79HYTg+LXQSlbRt6GWyYbkZRMQo9LgYt1ojEMjsngJTB5PlTD/Cn5WQ==
X-Received: by 2002:a05:620a:b19:b0:76c:4833:f851 with SMTP id t25-20020a05620a0b1900b0076c4833f851mr4889924qkg.47.1691241277322;
        Sat, 05 Aug 2023 06:14:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+eIfLgnZw5L9ycwyhdLrN0uqyoE4q3saqIVPvg88zQ5KEtjZikqCgXF3BhVK1Upko+kK9baLSnF/xrJ3ejpg=
X-Received: by 2002:a05:620a:b19:b0:76c:4833:f851 with SMTP id
 t25-20020a05620a0b1900b0076c4833f851mr4889905qkg.47.1691241277035; Sat, 05
 Aug 2023 06:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230215113249.47727-1-william.qiu@starfivetech.com>
 <20230215113249.47727-4-william.qiu@starfivetech.com> <CAJM55Z8gVEZS4Ws2Gi7_JbdkS-4y3_8mQvR4ZxLCWZ4A1y9X1g@mail.gmail.com>
 <CAJM55Z-h+CUmWtkn31Ek+qvxrOr5_Jz3QRRLqWYLz2A0E+h+rA@mail.gmail.com> <d967d628-6961-568e-d72e-ce0e17153818@starfivetech.com>
In-Reply-To: <d967d628-6961-568e-d72e-ce0e17153818@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Sat, 5 Aug 2023 15:14:20 +0200
Message-ID: <CAJM55Z_sXt8G4+SFuN74g95zjE73f=9gbtVE+dxZ0UDEcH1hMQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] riscv: dts: starfive: Add mmc node
To: William Qiu <william.qiu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-mmc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_061447_332274_8BDE6B26 
X-CRM114-Status: GOOD (  29.00  )
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

On Wed, 15 Feb 2023 at 13:26, William Qiu <william.qiu@starfivetech.com> wrote:
> On 2023/2/15 20:22, Emil Renner Berthing wrote:
> > On Wed, 15 Feb 2023 at 13:12, Emil Renner Berthing
> > <emil.renner.berthing@canonical.com> wrote:
> >>
> >> On Wed, 15 Feb 2023 at 12:35, William Qiu <william.qiu@starfivetech.com> wrote:
> >> >
> >> > Add the mmc node for the StarFive JH7110 SoC.
> >> > Set mmco node to emmc and set mmc1 node to sd.
> >> >
> >> > Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> >> > ---
> >> >  .../jh7110-starfive-visionfive-2.dtsi         | 23 +++++++++
> >> >  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 47 +++++++++++++++++++
> >> >  2 files changed, 70 insertions(+)
> >> >
> >> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> >> > index c60280b89c73..e1a0248e907f 100644
> >> > --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> >> > +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> >> > @@ -42,6 +42,29 @@ &rtc_osc {
> >> >         clock-frequency = <32768>;
> >> >  };
> >> >
> >> > +&mmc0 {
> >> > +       max-frequency = <100000000>;
> >> > +       bus-width = <8>;
> >> > +       cap-mmc-highspeed;
> >> > +       mmc-ddr-1_8v;
> >> > +       mmc-hs200-1_8v;
> >> > +       non-removable;
> >> > +       cap-mmc-hw-reset;
> >> > +       post-power-on-delay-ms = <200>;
> >> > +       status = "okay";
> >> > +};
> >> > +
> >> > +&mmc1 {
> >> > +       max-frequency = <100000000>;
> >> > +       bus-width = <4>;
> >> > +       no-sdio;
> >> > +       no-mmc;
> >> > +       broken-cd;
> >> > +       cap-sd-highspeed;
> >> > +       post-power-on-delay-ms = <200>;
> >> > +       status = "okay";
> >> > +};
> >
> > These nodes are also still oddly placed in the middle of the external
> > clocks. Again please keep the external clocks at the top and then
> > order the nodes alphabetically to have some sort of system.
> >
>
>
> Hi Emil,
>
> I'll update it in next version.

Hi William,

It seems the mmc nodes are still missing from the upstream device
tree. The sysreg nodes have been added in Conors riscv-dt-for-next[1]
branch, so I don't see any missing dependencies. Could you please
update and send a new version of this?

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=riscv-dt-for-next

/Emil

> Best Regards
> William
>
> >> >  &gmac0_rmii_refin {
> >> >         clock-frequency = <50000000>;
> >> >  };
> >> > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> >> > index 64d260ea1f29..17f7b3ee6ca3 100644
> >> > --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> >> > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> >> > @@ -314,6 +314,11 @@ uart2: serial@10020000 {
> >> >                         status = "disabled";
> >> >                 };
> >> >
> >> > +               stg_syscon: syscon@10240000 {
> >> > +                       compatible = "starfive,jh7110-stg-syscon", "syscon";
> >> > +                       reg = <0x0 0x10240000 0x0 0x1000>;
> >> > +               };
> >> > +
> >> >                 uart3: serial@12000000 {
> >> >                         compatible = "snps,dw-apb-uart";
> >> >                         reg = <0x0 0x12000000 0x0 0x10000>;
> >> > @@ -370,6 +375,11 @@ syscrg: clock-controller@13020000 {
> >> >                         #reset-cells = <1>;
> >> >                 };
> >> >
> >> > +               sys_syscon: syscon@13030000 {
> >> > +                       compatible = "starfive,jh7110-sys-syscon", "syscon";
> >> > +                       reg = <0x0 0x13030000 0x0 0x1000>;
> >> > +               };
> >> > +
> >> >                 gpio: gpio@13040000 {
> >> >                         compatible = "starfive,jh7110-sys-pinctrl";
> >> >                         reg = <0x0 0x13040000 0x0 0x10000>;
> >> > @@ -397,6 +407,11 @@ aoncrg: clock-controller@17000000 {
> >> >                         #reset-cells = <1>;
> >> >                 };
> >> >
> >> > +               aon_syscon: syscon@17010000 {
> >> > +                       compatible = "starfive,jh7110-aon-syscon", "syscon";
> >> > +                       reg = <0x0 0x17010000 0x0 0x1000>;
> >> > +               };
> >> > +
> >> >                 gpioa: gpio@17020000 {
> >> >                         compatible = "starfive,jh7110-aon-pinctrl";
> >> >                         reg = <0x0 0x17020000 0x0 0x10000>;
> >> > @@ -407,5 +422,37 @@ gpioa: gpio@17020000 {
> >> >                         gpio-controller;
> >> >                         #gpio-cells = <2>;
> >> >                 };
> >> > +
> >> > +               mmc0: mmc@16010000 {
> >> > +                       compatible = "starfive,jh7110-mmc";
> >> > +                       reg = <0x0 0x16010000 0x0 0x10000>;
> >> > +                       clocks = <&syscrg JH7110_SYSCLK_SDIO0_AHB>,
> >> > +                                <&syscrg JH7110_SYSCLK_SDIO0_SDCARD>;
> >> > +                       clock-names = "biu","ciu";
> >> > +                       resets = <&syscrg JH7110_SYSRST_SDIO0_AHB>;
> >> > +                       reset-names = "reset";
> >> > +                       interrupts = <74>;
> >> > +                       fifo-depth = <32>;
> >> > +                       fifo-watermark-aligned;
> >> > +                       data-addr = <0>;
> >> > +                       starfive,sysreg = <&sys_syscon 0x14 0x1a 0x7c000000>;
> >> > +                       status = "disabled";
> >> > +               };
> >> > +
> >> > +               mmc1: mmc@16020000 {
> >> > +                       compatible = "starfive,jh7110-mmc";
> >> > +                       reg = <0x0 0x16020000 0x0 0x10000>;
> >> > +                       clocks = <&syscrg JH7110_SYSCLK_SDIO1_AHB>,
> >> > +                                <&syscrg JH7110_SYSCLK_SDIO1_SDCARD>;
> >> > +                       clock-names = "biu","ciu";
> >> > +                       resets = <&syscrg JH7110_SYSRST_SDIO1_AHB>;
> >> > +                       reset-names = "reset";
> >> > +                       interrupts = <75>;
> >> > +                       fifo-depth = <32>;
> >> > +                       fifo-watermark-aligned;
> >> > +                       data-addr = <0>;
> >> > +                       starfive,sysreg = <&sys_syscon 0x9c 0x1 0x3e>;
> >> > +                       status = "disabled";
> >> > +               };
> >>
> >> Hi William,
> >>
> >> These nodes still don't seem to be sorted by address, eg. by the
> >> number after the @
> >> Also please move the dt-binding patch before this one, so dtb_check
> >> won't fail no matter where git bisect happens to land.
> >>
> >> /Emil
> >>
> >> >         };
> >> >  };
> >> > --
> >> > 2.34.1
> >> >
> >> >
> >> > _______________________________________________
> >> > linux-riscv mailing list
> >> > linux-riscv@lists.infradead.org
> >> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
