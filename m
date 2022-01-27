Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA22C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 07:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bO8wpoHeP0cUlC5UiditISKU6TB13teVxfluguHhWYM=; b=JJseWMM/XqcgSy
	JpXZIDVJC8Gv0ih5LfLzsuLZpASICVSejl+/+6c8zLLMgWDaLlD3JD5UHMC+lcDerwtnukAFfFSf1
	MQv397IeAPMkYZxFdPSDGluS5j2DPWtBzGycIGMiqjTBg6RCeOLR6PWUO+FT/HNMOAeRoAx/lJzd+
	vcxTkbm7a68J9BTpcgBf/RaE/DzWcZQVccXcCx3ya790N9eJplllPk6LKCzLACzkJGyA/I836t/fJ
	/K8tjTAbxIQQpbYjMROITn7gyVTuIGtVO7lL5hxnhzeWy6I09KDmaQOokQcuzbOlXpfJ5K+xjtroi
	rZJQyPZq77GvfAyBuhBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCzJi-00EepN-5y; Thu, 27 Jan 2022 07:35:38 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCzJf-00EeoN-Q6
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 07:35:37 +0000
Received: by mail-lf1-x129.google.com with SMTP id x11so3638380lfa.2
 for <linux-riscv@lists.infradead.org>; Wed, 26 Jan 2022 23:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mFlPNohioylVZ6TzuDEF1YOceKLEX6bvfPEUnxwBSPg=;
 b=XFXzHL+kIWa4NRQpGa6wnShMiw3hMRKNdslDa69Y5VYsiAda4Q+QgRSLTgcbuSGw4G
 gAVH55GiAna7rm2tROsn6FnVPvuKF+3XdMAJToQwfid1OfbuefnYGCCWkw4bsDJN2H3k
 +GOAlBrR1PYeGFQ9dEgDTCuFU2ltP8CNM1ldIB+UAx2HTyiBX1m8FTns7P/3xmo2hlmz
 QW8uZ4Ct/Xo5UBimw9CZLN8Q7kOHYxXGHemjQAgUPoYxzNcW3ckQMzUX2wMuY/jzWHrs
 CXM4MnBAUEqRbQVKS0/N+S5OHEm6fjvQM59ZeuLL/RfzperAIe0v4ur5lVRDVX7p9AWN
 zo0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mFlPNohioylVZ6TzuDEF1YOceKLEX6bvfPEUnxwBSPg=;
 b=DAiNXpHf5vmw9/ES3VpaM8/AhjQbRrC4ZVcMWdQfRsrivqI6LIsKoRtw8onj7OsV/q
 8DufiWeheSGiODdFwzBwWoWBEsHvpfNA4emJnZ88OYgr+rDIfKpBs8c+Gm5AkA+EGD0D
 22KmHRbKreE99hPfQbhOzQwMuVfTi+NbzXbF+A4J8o6rSlMcy8PD2fzkPHbq5x6URouK
 499fg+D/fioEdMfXy2Mqq6mEf3zDfkpe0c5QJU8mnoLdipoBAnFT/i928i7vuSuEcZrR
 tubPlLDtgMqZY2tkXRxmkmXv0zTaEGvcV3/6sTUK+fcHr7Xm7aGC7smodq1EoLMc1dYt
 Xtaw==
X-Gm-Message-State: AOAM533x6/MTDDYyqNth/5hNQ7cuY4pG93mVS5rRXi81hmRtvf5A2tnt
 ckKKaer53Sl+dXviHpa1aXIcWIHNeeTVK/VkVjPkDw==
X-Google-Smtp-Source: ABdhPJwOaezJNsHNZ784GwMKibaqQucQTzXckcoN/zwUBW6a5VrWDpMAG4Y5Sntkn5L2pTPY81CTneDwFvH3vmstqZg=
X-Received: by 2002:a05:6512:3052:: with SMTP id
 b18mr2082206lfb.5.1643268933354; 
 Wed, 26 Jan 2022 23:35:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1642383007.git.zong.li@sifive.com>
 <163a2cf11b2aceee2a1b8dc83251576d2371d4a6.1642383007.git.zong.li@sifive.com>
 <YfJD11wlgkzuE+Sp@matsya>
In-Reply-To: <YfJD11wlgkzuE+Sp@matsya>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 27 Jan 2022 15:35:21 +0800
Message-ID: <CANXhq0qX_TZTRyZGGBSs0_zUa87ktSSv-CubHF8pFxuhv7rocA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] riscv: dts: Add dma-channels property in dma node
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Conor Dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Bin Meng <bin.meng@windriver.com>, Green Wan <green.wan@sifive.com>, 
 dmaengine <dmaengine@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_233535_894433_311105FA 
X-CRM114-Status: GOOD (  16.57  )
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

On Thu, Jan 27, 2022 at 3:03 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 17-01-22, 09:35, Zong Li wrote:
> > Add dma-channels property, then we can determine how many channels there
> > by device tree.
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 1 +
> >  arch/riscv/boot/dts/sifive/fu540-c000.dtsi        | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> > index c9f6d205d2ba..3c48f2d7a4a4 100644
> > --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> > +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> > @@ -188,6 +188,7 @@ dma@3000000 {
>
> Unrelated but the node name should be dma-controller@...
>

Thanks for the correction, I guess we could give another patch for
changing the node name.

> >                       reg = <0x0 0x3000000 0x0 0x8000>;
> >                       interrupt-parent = <&plic>;
> >                       interrupts = <23 24 25 26 27 28 29 30>;
> > +                     dma-channels = <4>;
> >                       #dma-cells = <1>;
> >               };
> >
> > diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> > index 0655b5c4201d..2bdfe7f06e4b 100644
> > --- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> > +++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> > @@ -171,6 +171,7 @@ dma: dma@3000000 {
> >                       reg = <0x0 0x3000000 0x0 0x8000>;
> >                       interrupt-parent = <&plic0>;
> >                       interrupts = <23 24 25 26 27 28 29 30>;
> > +                     dma-channels = <4>;
> >                       #dma-cells = <1>;
> >               };
> >               uart1: serial@10011000 {
> > --
> > 2.31.1
>
> --
> ~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
