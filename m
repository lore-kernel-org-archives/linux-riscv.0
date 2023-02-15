Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4003C636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 12:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=trDr5xF9oyraBrkawDr4wJjk2zNGSQtv7nU0ufCkU+k=; b=nI+3+r5gFVziS9
	Dwto2fCQo7kN66JHoqgZNXSt/wX9MS13orXKQKunpKn4TgQ0kVzYoRZZTnspLu8lKPPA0H/8bi3p5
	31cbwLoOMcZqypObbDU/0o/EjPOl6eU847vNP2cq6xvYzC1eq1b6PwUuxWXVfh9HovmQDktExCdAv
	nKZk90mF9Vb5Y7Oalfr8pty2jvF5iC3bXEGPa3mjJRhu+C3a2b5Hu8RrjAbgIwWGTYcSsZQdLVKNw
	RUfhB1ccodoKXOMtfYID6Q8tOjFE+7O+0dj+SBXx4cvwM7dFsaEO6QXe21zuNbSFVTJDMGugLQeF2
	x+Q0hJbSOYPdm5Tdw9OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSGnv-005kEM-Lj; Wed, 15 Feb 2023 12:22:31 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSGnr-005kCN-Ib
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 12:22:29 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B3D463F206
	for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 12:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1676463738;
	bh=Ys8CZojIwyiyHL3vfQqMFK60gwHNRkm+YvncjitOGyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=WC1Q82JyPS6us5x06iqoagIY0hMh6LqaFg3iojR/nnRNnD3JuDW867Zw5dGilHjQc
	 mUemOEc8cOEOxZMlP6f/p9d47QNKDLt6HXzfg4rSM+NCtNZWEHUvfwji1GYRrLY+U7
	 BCU9WvZ2JW9MDjSbW1WD/Dg54dCDjLsJ+s2m9njhNqgT0YEUtlYGbbmnT4snEEII8A
	 caXqbu2Pk+IwF0TCPD+3/kxp+wLtftFMpSSKEp7akENWVfYJLqljoL0fKrVQ/MeHsC
	 BhabM6cuYJXTbb9Czjp2rIKuOGXyR+u7r9BlUHggcLDRCtYbePgCJywYcC+1im6AO4
	 c9Fz8+8mj/SMA==
Received: by mail-qt1-f198.google.com with SMTP id a24-20020ac87218000000b003bb7c7a82f7so10879799qtp.9
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 04:22:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ys8CZojIwyiyHL3vfQqMFK60gwHNRkm+YvncjitOGyM=;
        b=FqmM80XwMEahwp/rP4eX0ZG71WzyPTGZEWwZ6LNWoauu+2cfjtEHdsmnCWk0Z06bf+
         KON94UEr62nB41s2r/UON1ruYwNedyju3cEombrxFMC1rtXvVwNYLX3YHD22I7gfEvNj
         10wLPYMBMWHe3NlDLvgvvvUOS2ptsWPUiOKyfaLf6KkBKKt9Eu+ZQLwVGW2JnxOfDOsG
         rqNk02Z2dHqDKTdeQpUZh6ZYJilxcxL4GYOeDdGp0F8ZgAdy3sM1hXbKiVF3EepW2Dy1
         9O0D1MH1dX57mngZnJqdUVYKbb9T/Tve0vIdKUWxxnuRkVIZWuW+y8C1YcL9cx4kcHEl
         VJWg==
X-Gm-Message-State: AO0yUKVkSrgULTeAqQCNvOYVxttp54YIWxJOjiXjY56WMWEv10gjxUHF
	hnypholirvTNDpVfiQvKAtO++eND5xyEnNcBcjf38urnCburYP4GAKyuX/fqoWjek1LcdeoBpX2
	0iCzkGM7fzKn4LdWhmcL9h92XbAzSIRlf72LdfdYtq8U0DzPCnR4oTkal/8+GOg==
X-Received: by 2002:a37:4249:0:b0:73b:3411:48b1 with SMTP id p70-20020a374249000000b0073b341148b1mr99313qka.219.1676463737793;
        Wed, 15 Feb 2023 04:22:17 -0800 (PST)
X-Google-Smtp-Source: AK7set8VCvji9WHmh+GciDNEQcXCQUKLSVfuPNnOPdx+AWLSQHOdX7DU6aUZf6xJQbp70/suV8jyyvielU6wnwPhUbQ=
X-Received: by 2002:a37:4249:0:b0:73b:3411:48b1 with SMTP id
 p70-20020a374249000000b0073b341148b1mr99312qka.219.1676463737464; Wed, 15 Feb
 2023 04:22:17 -0800 (PST)
MIME-Version: 1.0
References: <20230215113249.47727-1-william.qiu@starfivetech.com>
 <20230215113249.47727-4-william.qiu@starfivetech.com> <CAJM55Z8gVEZS4Ws2Gi7_JbdkS-4y3_8mQvR4ZxLCWZ4A1y9X1g@mail.gmail.com>
In-Reply-To: <CAJM55Z8gVEZS4Ws2Gi7_JbdkS-4y3_8mQvR4ZxLCWZ4A1y9X1g@mail.gmail.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 15 Feb 2023 13:22:00 +0100
Message-ID: <CAJM55Z-h+CUmWtkn31Ek+qvxrOr5_Jz3QRRLqWYLz2A0E+h+rA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] riscv: dts: starfive: Add mmc node
To: William Qiu <william.qiu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-mmc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_042227_916899_2E8D1063 
X-CRM114-Status: GOOD (  23.17  )
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

On Wed, 15 Feb 2023 at 13:12, Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:
>
> On Wed, 15 Feb 2023 at 12:35, William Qiu <william.qiu@starfivetech.com> wrote:
> >
> > Add the mmc node for the StarFive JH7110 SoC.
> > Set mmco node to emmc and set mmc1 node to sd.
> >
> > Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> > ---
> >  .../jh7110-starfive-visionfive-2.dtsi         | 23 +++++++++
> >  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 47 +++++++++++++++++++
> >  2 files changed, 70 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > index c60280b89c73..e1a0248e907f 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > @@ -42,6 +42,29 @@ &rtc_osc {
> >         clock-frequency = <32768>;
> >  };
> >
> > +&mmc0 {
> > +       max-frequency = <100000000>;
> > +       bus-width = <8>;
> > +       cap-mmc-highspeed;
> > +       mmc-ddr-1_8v;
> > +       mmc-hs200-1_8v;
> > +       non-removable;
> > +       cap-mmc-hw-reset;
> > +       post-power-on-delay-ms = <200>;
> > +       status = "okay";
> > +};
> > +
> > +&mmc1 {
> > +       max-frequency = <100000000>;
> > +       bus-width = <4>;
> > +       no-sdio;
> > +       no-mmc;
> > +       broken-cd;
> > +       cap-sd-highspeed;
> > +       post-power-on-delay-ms = <200>;
> > +       status = "okay";
> > +};

These nodes are also still oddly placed in the middle of the external
clocks. Again please keep the external clocks at the top and then
order the nodes alphabetically to have some sort of system.

> >  &gmac0_rmii_refin {
> >         clock-frequency = <50000000>;
> >  };
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > index 64d260ea1f29..17f7b3ee6ca3 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > @@ -314,6 +314,11 @@ uart2: serial@10020000 {
> >                         status = "disabled";
> >                 };
> >
> > +               stg_syscon: syscon@10240000 {
> > +                       compatible = "starfive,jh7110-stg-syscon", "syscon";
> > +                       reg = <0x0 0x10240000 0x0 0x1000>;
> > +               };
> > +
> >                 uart3: serial@12000000 {
> >                         compatible = "snps,dw-apb-uart";
> >                         reg = <0x0 0x12000000 0x0 0x10000>;
> > @@ -370,6 +375,11 @@ syscrg: clock-controller@13020000 {
> >                         #reset-cells = <1>;
> >                 };
> >
> > +               sys_syscon: syscon@13030000 {
> > +                       compatible = "starfive,jh7110-sys-syscon", "syscon";
> > +                       reg = <0x0 0x13030000 0x0 0x1000>;
> > +               };
> > +
> >                 gpio: gpio@13040000 {
> >                         compatible = "starfive,jh7110-sys-pinctrl";
> >                         reg = <0x0 0x13040000 0x0 0x10000>;
> > @@ -397,6 +407,11 @@ aoncrg: clock-controller@17000000 {
> >                         #reset-cells = <1>;
> >                 };
> >
> > +               aon_syscon: syscon@17010000 {
> > +                       compatible = "starfive,jh7110-aon-syscon", "syscon";
> > +                       reg = <0x0 0x17010000 0x0 0x1000>;
> > +               };
> > +
> >                 gpioa: gpio@17020000 {
> >                         compatible = "starfive,jh7110-aon-pinctrl";
> >                         reg = <0x0 0x17020000 0x0 0x10000>;
> > @@ -407,5 +422,37 @@ gpioa: gpio@17020000 {
> >                         gpio-controller;
> >                         #gpio-cells = <2>;
> >                 };
> > +
> > +               mmc0: mmc@16010000 {
> > +                       compatible = "starfive,jh7110-mmc";
> > +                       reg = <0x0 0x16010000 0x0 0x10000>;
> > +                       clocks = <&syscrg JH7110_SYSCLK_SDIO0_AHB>,
> > +                                <&syscrg JH7110_SYSCLK_SDIO0_SDCARD>;
> > +                       clock-names = "biu","ciu";
> > +                       resets = <&syscrg JH7110_SYSRST_SDIO0_AHB>;
> > +                       reset-names = "reset";
> > +                       interrupts = <74>;
> > +                       fifo-depth = <32>;
> > +                       fifo-watermark-aligned;
> > +                       data-addr = <0>;
> > +                       starfive,sysreg = <&sys_syscon 0x14 0x1a 0x7c000000>;
> > +                       status = "disabled";
> > +               };
> > +
> > +               mmc1: mmc@16020000 {
> > +                       compatible = "starfive,jh7110-mmc";
> > +                       reg = <0x0 0x16020000 0x0 0x10000>;
> > +                       clocks = <&syscrg JH7110_SYSCLK_SDIO1_AHB>,
> > +                                <&syscrg JH7110_SYSCLK_SDIO1_SDCARD>;
> > +                       clock-names = "biu","ciu";
> > +                       resets = <&syscrg JH7110_SYSRST_SDIO1_AHB>;
> > +                       reset-names = "reset";
> > +                       interrupts = <75>;
> > +                       fifo-depth = <32>;
> > +                       fifo-watermark-aligned;
> > +                       data-addr = <0>;
> > +                       starfive,sysreg = <&sys_syscon 0x9c 0x1 0x3e>;
> > +                       status = "disabled";
> > +               };
>
> Hi William,
>
> These nodes still don't seem to be sorted by address, eg. by the
> number after the @
> Also please move the dt-binding patch before this one, so dtb_check
> won't fail no matter where git bisect happens to land.
>
> /Emil
>
> >         };
> >  };
> > --
> > 2.34.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
