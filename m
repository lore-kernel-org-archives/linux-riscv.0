Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6D5606A327
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 03:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gpmSjlAi;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=pVtGfPM7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hDbIqp7vqp/j6ydS0S9NX6E/3mKaWzI27XeC/WQ9qog=; b=gpmSjlAiNNysJDxj1y+DMb9iTP
	7vPJcf71HhIPeWrDutGSGsGFdVsudDYw5145q4JYdeDswNpWsm74K5y+55zIAHHdtYzlAbCpIugDE
	D2Mqylwmtp+BkLpRm8HSQ8mVFFCQIYaJvzTpXX9KDqvTivM7YRJyxBKo2QejZBjKk8ezBKnwoFhof
	So7N+zZoCk452yoJU/iPxemHu4Cqep0agpTmWn4/ecHzQh8pRm/n50FS58zfDElOkyXDZITfxeESc
	Zth+v0TUndM69HP04540vEf/qpaEYwB1PYDdEwWKZ2k1ZJY3CO0N/XXXy17AzizMNrUR5kZqZfKu6
	zn1xhTdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNieZ-0000000FRYQ-3zkU;
	Mon, 02 Nov 2026 03:24:11 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNieV-0000000FRXG-3vPR
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 03:24:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793589817;
	bh=m8op6PwWVPH29KHkSl2bqXfs4ZxwQ7xpDqblCTtVsmw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=pVtGfPM7l5FtyERpjiSOzrhdwKAL5StqmyOP2N/DdfzeSnyQeUlGlHhrW3ZM4yVQQ
	 bpmi7aVZ4wlMLScizHp/3gemojWykBuQZmSyvNrKjlgPKjEclNHyHvrc+81Y4ZB0jB
	 Q/aWUEJmoWZ22Q+loAx3HhbMw2fXhXETBOxtTwjs=
X-QQ-mid: zesmtpgz4t1793589817t63f878aa
X-QQ-Originating-IP: dAMvPSd+eckKdZSnpjKL7bx/dXh7sFEyv4sNmhzmv8s=
Received: from mail-pl1-f180.google.com ( [209.85.214.180])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <linux-riscv@lists.infradead.org>; Mon, 02 Nov 2026 11:23:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11461545889202687458
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ea7190aea1so11843475ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 01 Nov 2026 19:23:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwk7NKOgaQAndnuvMTriAoaV5PByOowQopIjBmZ3nSvE8Jiv2mg9kalngFcr1bco4eATz8byE35HEWgRg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8hRB0WbpNJa75XRPWSl81eOhHQ1vy1xlMlIjLr+ctXygJOJWVX
	tZqcJk/raKIKdkdiR81ZByu/YRNf5Ezeq4vimkBMjRJKfdMvyuai7hs4ZSHIoHtfltIXuoUrQHG
	ZLwoREgkFIPUO3h7wlRZ8V7UCepTenfE=
X-Received: by 2002:a17:902:cf08:b0:2e8:b5af:22e0 with SMTP id
 d9443c01a7336-2eb36465f1amr76602555ad.41.1793589814309; Sun, 01 Nov 2026
 19:23:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030094024.3226356-1-chunyan.zhang@linux.spacemit.com> <auYxFRtKWbGAlRTL@aurel32.net>
In-Reply-To: <auYxFRtKWbGAlRTL@aurel32.net>
From: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
Date: Mon, 2 Nov 2026 11:22:58 +0800
X-Gmail-Original-Message-ID: <EBCEB49359C4BBC0+CAAfSe-shesRwmdKhZojqbZjJejVEtA47NXBwNmrpAsTsk6m5rA@mail.gmail.com>
X-Gm-Features: AclHuK9_kWiUHPoaWjYOWVhMFk9nT072XgylDHIVHiujJpZKDNExi2p2MezyEo8
Message-ID: <CAAfSe-shesRwmdKhZojqbZjJejVEtA47NXBwNmrpAsTsk6m5rA@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: add USB3 port A (DRD) nodes
To: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-riscv@lists.infradead.org, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, devicetree@vger.kernel.org
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NQTe7jWt+V0XtWKqGk4eqKKznDm5pCyk5K1CpBytE3gCWruKLmNQmUJZ
	OE7L8qT2azxrPwXvQ+deCWREIR1SsAIhcuCuKOB4M4jO14/+X3xqTtXyMes+02oc8M9LIvm
	6Rj35ULdIKCTqoy4ajJ1T6fDrA15x8th+k4UU+pUrJgpCP3fbfeq0nStvewBv9g+aDvADVo
	eQ6c+MkCl6dL5rO40igeZjdKbUkGGSPBBEHyyhYtYMQgBEXtVkDUxOLAml4OBVt/k2YdHHB
	pKgwgMkFDJHMxLovfbAfj0zdgSm2+bIql03u3Y0uYW5OyIrMehe43XxiDG5u3l63I2gO9Gs
	aa+AEwnDHeEPaQL96jipxUHf3tmpaijI0ZlSKxhm5sLhLsGPy/zGBeuxdsr8H/T5xk/QZB4
	6OnKtXysdzQhnAyk5VbhlI0oeCzU6Fo4KxKOwH+0nY06WR1MA1J7F/9vui5AQ6WHr2Fyxuw
	oB4fx255EEglp+IW5TUe8tpzsT2o3DIyEYSt69CNmq3t82c2EcPvexDbzTgp7T8snY/Y4A0
	7l4iRxEpEglFvzXPITwr5xlmbFnUxQeayaeMcIwOZ2wQ5r7MbXRmBT7MCvIo5Fo/NKhTefq
	o9B3sGCc9b+GOdeX/BYJOtaJzMBrfC4R4o4sYMQ4UBK2Qs5uigUm32GNaSrP81ydQxLcEAv
	58SWESONBYaasXsSvkezlyl0msFAKnDTyVE5xUkA1aD60lPVqFs/tiPN47uXTBVFvSZWZGr
	CC/ZHfidqLfRMrVA8UH/QBjoiF39c5/rRTxoD1nlNmwkdMT4tdPE/2Qw1SkwKHW/UV+FM9s
	peDvJj/YrzHchZcOUBdH06DcY9a8iTJZ9+dDmU5yfLkQZha8dNl1kHV3Nhsb4YDIYfdEwdr
	eMAuoK+xjNlA3l70fo2lvyEeUycPv1P9tomfACZaR47u4wSw0iw/QKwOzKP1X8MFilQ/y7J
	XKxar3C5KLds7F1K0xqlWgOb/Ni/xgwkzKvI8P0oFA8A8f6s+Qu5GbYR6ZFhqhSCSsFsmXr
	2LTWKv5g0hDGz6f1NBxx/vqDZzh0X1ASfWotDNAex2f0LcLEZ2XDgQjmMg8GPxwaRmTmi32
	/5KgM3Fnf4Umg9OvaKph3k=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_192408_623523_00B942AD 
X-CRM114-Status: GOOD (  23.50  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Aurelien,

On Sun, 1 Nov 2026 at 02:19, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Hi,
>
> On 2026-10-30 17:40, Chunyan Zhang wrote:
> > Describe the DWC3 controller and its USB 2.0 PHY for USB3 port A
> > of the K3 SoC.
> >
> > Only the U2 lane is described: Port A's SuperSpeed PHY has no driver
> > yet, so the port runs at high-speed (maximum-speed = "high-speed").
> >
> > Enable USB3 port A with dr_mode = "peripheral", so it can be used as
> > a USB device.
> >
> > Signed-off-by: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  9 ++++++
> >  arch/riscv/boot/dts/spacemit/k3.dtsi         | 30 ++++++++++++++++++++
> >  2 files changed, 39 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > index b084a35aa00e..74d4fdf9e405 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > @@ -323,6 +323,15 @@ &usb2_phy {
> >       status = "okay";
> >  };
> >
> > +&usb3a_u2phy {
> > +     status = "okay";
> > +};
> > +
> > +&usb3a {
> > +     dr_mode = "peripheral";
> > +     status = "okay";
> > +};
> > +
> >  &usb3d_u2phy {
> >       status = "okay";
> >  };
> > diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > index c3f2dce0969c..220dfe29bb78 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > @@ -630,6 +630,36 @@ gmac2_axi_setup: stmmac-axi-config {
> >                       };
> >               };
> >
> > +             usb3a: usb@cad00000 {
>
> Please move this after the eth2 node, so that the node addresses are
> kept sorted.
>
> > +                     compatible = "spacemit,k3-dwc3";
> > +                     reg = <0x0 0xcad00000 0x0 0x10000>;
> > +                     interrupts = <118 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-parent = <&saplic>;
> > +                     clocks = <&syscon_apmu CLK_APMU_USB3_PORTA_BUS>;
> > +                     clock-names = "usbdrd30";
> > +                     resets = <&syscon_apmu RESET_APMU_USB3_A_AHB>,
> > +                              <&syscon_apmu RESET_APMU_USB3_A_VCC>,
> > +                              <&syscon_apmu RESET_APMU_USB3_A_PHY>;
> > +                     reset-names = "ahb", "vcc", "phy";
> > +                     phys = <&usb3a_u2phy>;
> > +                     phy-names = "usb2-phy";
>
> Please move the PHYs definition to the board level, matching was it is
> done for the other USB3 ports, as other boards might have different PHY
> configuration.
>
> > +                     phy_type = "utmi";
> > +                     snps,dis_enblslpm_quirk;
> > +                     snps,dis_u2_susphy_quirk;
> > +                     snps,dis-del-phy-power-chg-quirk;
> > +                     snps,dis-tx-ipgap-linecheck-quirk;
> > +                     maximum-speed = "high-speed";
>
> I think the maximum-speed property should also be moved to the board
> level, as its value depends on the PHYs configuration.

Sure. I will address all the above comments.

>
> > +                     status = "disabled";
> > +             };
>
> Any reason not to define the snps,parkmode-disable-ss-quirk property? It
> is defined for the other USB3 ports, as well as for the USB3 A port in
> the vendor kernel

The original thought was that this property is SS-specific and thus unnecessary
without usb3-phy support. However, since it reflects a hardware characteristic
that applies regardless of the current PHY configuration, adding it makes sense
for consistency and forward compatibility.

>
> > +
> > +             usb3a_u2phy: phy@cad20000 {
> > +                     compatible = "spacemit,k3-usb2-phy";
> > +                     reg = <0x0 0xcad20000 0x0 0x200>;
> > +                     clocks = <&syscon_apmu CLK_APMU_USB3_PORTA_BUS>;
> > +                     #phy-cells = <0>;
> > +                     status = "disabled";
> > +             };
> > +
> >               pdma: dma-controller@d4000000 {
> >                       compatible = "spacemit,k3-pdma";
> >                       reg = <0x0 0xd4000000 0x0 0x4000>;
>
> Otherwise looks good.

Thanks for the review,
Chunyan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
