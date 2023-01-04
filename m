Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7F4C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 16:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D3XKpVa3Tfti0gStmUeGgxuIrqt32OCxIuRZyP0WUQ4=; b=In4c+k3QzpTdGI
	5p/Hq4rKHKUR6CjUGSp4DsVZPmL7oZDU3OYWihGV4LLzl1696x5pVoSlHyvnMNkOd1a/+TYhjTVcp
	KmNgJMMbBGdx40VtwnH7VKp1lkjasLoPKPcazIARCk79wd89YpO3vcSjCNcYvIEQHiC35q4wsoCeO
	Scszg4EzM+afIty3ZOYb9iPja94LHojFaETv9oYaQ3R9xV4AN2K2mebSLGQ0ftW8a5TvuWL3m2liH
	g7OO/Fx369NKFizrrR+J4z1zsnfZjEP0H9gS0OnBeu/5ouSiLhLUSTRLzsog7BanRt2E0afsSUkPS
	JTlSk337U6ek2sDMJnIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD6UL-00ALnx-5g; Wed, 04 Jan 2023 16:19:37 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD6Ho-00AIIH-UU
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 16:06:42 +0000
Received: by mail-pl1-x629.google.com with SMTP id b2so36295228pld.7
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jan 2023 08:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qoMsanQfdrnJNpK+VHphw12WDh7b/ImX3dHhODz+IvA=;
        b=xTS8w7m0XrsQQYE15w0Gmn+j7j9adCpRTTi1yI86BOf1Ey2uLEUmfrH0yoZbFjVWm4
         fBDOTqraLqcuSMaiYFb+uZTm6Mx/iXsvbHPX39ZfeQ6LH/TDkKKGYHhpa7h8zfXP/KQI
         LW6AkV7EJFtzd4tcPol6Fi6Ccr/Wn8Y6lXp0hPjXaeNq06WyHnQqS+5Ffq+/cQ54+5BB
         AABHT07Lj8MP0y84HSwyBxZbzwTPfDdbb2xBoftOlDMJUWlzz/El7TNjP01HnxhavgJK
         hYavH+0i8lleDyhCGaSc6eZP8JaiUlPaFGr1ES6R7f55/zMgM37q94e2/rD7Po/ypTg4
         LFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoMsanQfdrnJNpK+VHphw12WDh7b/ImX3dHhODz+IvA=;
        b=T6L+OYCKEWsKMIxWgPl6Tgm7x55RKS0+8cSB68OlnlKhGh5BO2DUvklmUDR4yyW8bW
         Ty3Ho/J/UNwo61fTvkRk+lED0HNy43YqeEkj2t1iBd62WFFoh/puMeeLRSOwCShe77jm
         J9i5wtiYd3efos6SuS+0M9QIuT1gs6KkaWldBakrn1Op5LiLbT37tjNG+TyOoTqYtYEG
         HIQylxVdwBraPXv9Rx0VUFyiPpA3tiXIom8fLGOT9Oo4uCB6+F/xxLgftiAAA3mz/Tt9
         iCPP6wTPyRr5lYBYElrc5rvUsECaLWK9cGQjY9ZFnkMIAURFqPv8L7MCDKbwP+EXDZf7
         w2bA==
X-Gm-Message-State: AFqh2kpy/4lZ99qm/uAYYIJtZ+rGvR6cRvj1i+6XVS27hTvOXeo/bu3W
	080k/m+TRGIrf6wPQQXJwYx9QRrDuLeLn/Vu+0fvrw==
X-Google-Smtp-Source: AMrXdXu0Zkm98NSEmToInkvbeoOiqHqFC2u77W6RRb8vCi1vUtqqdRNIozRRUc8NnGm/zSv0I6VrewLi0U1sjbVAX7E=
X-Received: by 2002:a17:90a:c083:b0:226:6c53:fc27 with SMTP id
 o3-20020a17090ac08300b002266c53fc27mr877853pjs.202.1672848387129; Wed, 04 Jan
 2023 08:06:27 -0800 (PST)
MIME-Version: 1.0
References: <20221227122227.460921-1-william.qiu@starfivetech.com>
 <20221227122227.460921-4-william.qiu@starfivetech.com> <CAPDyKFqziA+PB__v8nJzgkTuM9ZszW8X2U-akvRFv0_qwZ22OA@mail.gmail.com>
 <14433b44-8359-b9e8-446c-bb49e86bf48f@starfivetech.com>
In-Reply-To: <14433b44-8359-b9e8-446c-bb49e86bf48f@starfivetech.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 Jan 2023 17:05:50 +0100
Message-ID: <CAPDyKFrH=U-Sz1Kx2AJ+X_FXi9GcEdHXjO+aC=MXpGP_+xgOsQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: dts: starfive: Add mmc node
To: William Qiu <william.qiu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-mmc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_080641_108989_E3A92931 
X-CRM114-Status: GOOD (  27.52  )
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

On Wed, 4 Jan 2023 at 07:08, William Qiu <william.qiu@starfivetech.com> wrote:
>
>
>
> On 2023/1/2 22:03, Ulf Hansson wrote:
> > On Tue, 27 Dec 2022 at 13:22, William Qiu <william.qiu@starfivetech.com> wrote:
> >>
> >> This adds the mmc node for the StarFive JH7110 SoC.
> >> Set sdioo node to emmc and set sdio1 node to sd.
> >>
> >> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> >> ---
> >>  .../jh7110-starfive-visionfive-v2.dts         | 25 ++++++++++++
> >>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 38 +++++++++++++++++++
> >>  2 files changed, 63 insertions(+)
> >>
> >> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> >> index c8946cf3a268..d8244fd1f5a0 100644
> >> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> >> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> >> @@ -47,6 +47,31 @@ &clk_rtc {
> >>         clock-frequency = <32768>;
> >>  };
> >>
> >> +&mmc0 {
> >> +       max-frequency = <100000000>;
> >> +       card-detect-delay = <300>;
> >
> > Nitpick:  This seems redundant for a non-removable card!?
> >
>
> Will drop
>
> >> +       bus-width = <8>;
> >> +       cap-mmc-highspeed;
> >> +       mmc-ddr-1_8v;
> >> +       mmc-hs200-1_8v;
> >> +       non-removable;
> >> +       cap-mmc-hw-reset;
> >> +       post-power-on-delay-ms = <200>;
> >> +       status = "okay";
> >> +};
> >> +
> >> +&mmc1 {
> >> +       max-frequency = <100000000>;
> >> +       card-detect-delay = <300>;
> >
> > Nitpick: This looks redundant for polling based card detection
> > (broken-cd is set a few lines below).
> >
>
> Will drop
>
> >> +       bus-width = <4>;
> >> +       no-sdio;
> >> +       no-mmc;
> >> +       broken-cd;
> >> +       cap-sd-highspeed;
> >> +       post-power-on-delay-ms = <200>;
> >> +       status = "okay";
> >> +};
> >> +
> >>  &gmac0_rmii_refin {
> >>         clock-frequency = <50000000>;
> >>  };
> >> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> >> index c22e8f1d2640..08a780d2c0f4 100644
> >> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> >> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> >> @@ -331,6 +331,11 @@ aoncrg: clock-controller@17000000 {
> >>                         #reset-cells = <1>;
> >>                 };
> >>
> >> +               syscon: syscon@13030000 {
> >> +                       compatible = "starfive,syscon", "syscon";
> >> +                       reg = <0x0 0x13030000 0x0 0x1000>;
> >> +               };
> >> +
> >>                 gpio: gpio@13040000 {
> >>                         compatible = "starfive,jh7110-sys-pinctrl";
> >>                         reg = <0x0 0x13040000 0x0 0x10000>;
> >> @@ -433,5 +438,38 @@ uart5: serial@12020000 {
> >>                         reg-shift = <2>;
> >>                         status = "disabled";
> >>                 };
> >> +
> >> +               /* unremovable emmc as mmcblk0 */
> >
> > Don't confuse the mmc0 node name with mmcblk0. There is no guarantee
> > that this is true, unless you also specify an alias.
> >
>
> Hi Ulf,
>
> Thank you for taking time to review and provide helpful comments for this patch.
> Actually we define mmc0 as eMMC, which is mmcblk0 in the kernel, and define mmc1 as SDIO,
> which is mmcblk1 in the kernel, so it's not confuse.
>

My point is, mmc0 from DT node perspective doesn't necessarily need to
map to mmc0, as that depends on the "probe" order of the devices. At
least for the Linux kernel, mmc0 from DT point of view, could end up
being mmc1.

To avoid confusion, please drop the "mmcblk*" here. It's anyway a
Linux specific thing. Don't get me wrong, feel free to keep the
information about eMMC and SDIO for the corresponding mmc controller
node.

Moreover, if you can't use PARTID/UUID to find the rootfs device -
then you may use an aliases node, to let mmc0 to be enumerated as
mmc0, for example. See below.

aliases {
     mmc0 = &mmc0;
}

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
