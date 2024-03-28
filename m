Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92993CD1283
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 12:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=S4+Y0/p4ys05DUsow6Igy7gfjIdc5rifI3ZzU6VLF6k=; b=aq0ZwbM54G5SRtypkXWveI4+ii
	AarDtntIjBDRjEFr56jTqajzr61XhhCHHLg1TsHWO67L7D1LYrcj67qRkAoY8Gbpw22CFgEnpCLDi
	fGIc5+TiZ1AnlIdSYimYAeLll3MKOAq3yXQaDKcNR0I9tF/emzYfm6cjxD+2AHfxc5ff1WHo//8vi
	8tTgmNhUVrtAVXkR4FNT9gkmzTiapDnL+yxkUYsim1mMVRDFxAhruYOq5ZqCDI8v3M7t6806tuMpA
	ZINuavAJ+VxlMa6U/cJ10P6yQkuoAdjeIX/S3eBI1nVeuOOKGbgWkU9di+58oLD6t7D0LvnCA7oTV
	P4Ron4/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpp8V-0000000Dyts-3eXA;
	Thu, 28 Mar 2024 12:45:40 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpp8N-0000000Dyqm-1bMT
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 12:45:36 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A16DE3FB79
	for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 12:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1711629923;
	bh=mcy8xBzJhA5/GwagWLEOHwxzAhDGLHOwYxY0lrDfVFk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=HFFTLrEiJOTPG1C3kw4CIjslQ/f0MthN5gb8SFu70vCYm0ZQ90GRQddrD2/qy5yDS
	 EN289qhHPxysZ9yVSIbLfvOE2rGrtqPb/JV2NzlyZqNz2eLzZ0CGyFEHQguqHHbj1K
	 B7b+LE/cSixFk78JlwjPK3uw+gwcFglLSK6/LclCmybpU2GbH1uwictQ3PxjQ/w40u
	 s/9vdJG44fpEpYzbOBSodmCctU4mWLFBCNXvIplrUYy0vokHJ3Gb016RvxPMZesCW4
	 RzhYtmZr94BFzsM77k6tySW0u+wUrpxYQf0C/AqOUn5iGKlNlta5mXHlXQmwwiMSGv
	 pdDY9aqwlC6WA==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-430b327e703so7474481cf.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 05:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711629922; x=1712234722;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mcy8xBzJhA5/GwagWLEOHwxzAhDGLHOwYxY0lrDfVFk=;
        b=L1UlX7UFsBGodtrdIWddsdI3KZBxOfc5CcNLz4cOe9M4NCCJqpfvewxCVwrFXmVXjW
         IsPWM0nTbNN1dP0Usv1oubrOFCWzikWSqOvxssnzCW8TcZs34+tX32/ap2WlOhfSZB+0
         09OBUczgnF5/AqaLtkcovSnJIhlwA37fCXnmTk7+GnmiuV9bY66EfqB9+8dFmzhj46/4
         0LmQ6UkjRs8ajz7BfD2QZF7Rfl7BxNYLocsfmJM9yUub0l/yXGNE3TC8I1TaL2hRD5jJ
         wF9XUrjObvik9c870mrt4PHLv1CNYZVW7HCdZ/SCQ7eiHbjjJ/f4nhf7KSG3bk61jarI
         NF0g==
X-Forwarded-Encrypted: i=1; AJvYcCVCGZKc6nYCKo1chBr71fuGIvkEqJMhWegKcBndD859YbWFgkLjl5JYUORALGy5Xct/Su4SUZE5fA4Nx4rHotIlrF8vgqMIg7LT3re2MEpJ
X-Gm-Message-State: AOJu0YyXORk+e289hMYpHgHsHOvNuGH1qcZhLhIW3V+ANG1JpAPSvioR
	wgN100uKFXheet87vEHJMnbY6hriEp4ihR9nHuZ8g+uj6OKbRQIHjRiql/gYk1zdQz7JCRR8fyM
	QIFqCNk/UTNPodHipQyCwj4EsPtWu0eE81Xu83Vp4RIXF3e89YUp/Mq870zVpw008DrgJ5Zc+lW
	KQKNBpLXbxiRi2WEUDeDHkCAfcf7/i/lYzqOpjoqFMaJCzzn+Bx6l9AhAz
X-Received: by 2002:ac8:5e13:0:b0:432:b582:1818 with SMTP id h19-20020ac85e13000000b00432b5821818mr1585120qtx.45.1711629922524;
        Thu, 28 Mar 2024 05:45:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUKlsOrsfvlyk23QZwEukdnQFti77COK+AMtjF8pDiCQ3BPtiLG/Cb9YHlaPR5B4U1pD56yQlPhI2rzGy27Xc=
X-Received: by 2002:ac8:5e13:0:b0:432:b582:1818 with SMTP id
 h19-20020ac85e13000000b00432b5821818mr1585094qtx.45.1711629922222; Thu, 28
 Mar 2024 05:45:22 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 Mar 2024 05:45:21 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <ZgVBurohYRDzFjgb@xhacker>
References: <20240131132600.4067-1-jszhang@kernel.org> <20240131132600.4067-7-jszhang@kernel.org>
 <20240206-magma-deem-2c88e45a545a@spud> <20240327-cotton-fang-37f6d8fde0e5@spud>
 <ZgVBurohYRDzFjgb@xhacker>
Mime-Version: 1.0
Date: Thu, 28 Mar 2024 05:45:21 -0700
Message-ID: <CAJM55Z8O20qjYmbjwOOE2CDCrWhCDGJ-jXY9TsR2hMSn-gEFtQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] riscv: dts: starfive: add Milkv Mars board device tree
To: Jisheng Zhang <jszhang@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berthing <kernel@esmil.dk>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_054533_015477_407800C8 
X-CRM114-Status: GOOD (  20.32  )
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

Jisheng Zhang wrote:
> On Wed, Mar 27, 2024 at 06:06:58PM +0000, Conor Dooley wrote:
> > Yo,
> >
> > On Tue, Feb 06, 2024 at 07:13:48PM +0000, Conor Dooley wrote:
> > > On Wed, Jan 31, 2024 at 09:26:00PM +0800, Jisheng Zhang wrote:
> > > > The Milkv Mars is a development board based on the Starfive JH7110 SoC.
> > > > The board features:
> > > >
> > > > - JH7110 SoC
> > > > - 1/2/4/8 GiB LPDDR4 DRAM
> > > > - AXP15060 PMIC
> > > > - 40 pin GPIO header
> > > > - 3x USB 3.0 host port
> > > > - 1x USB 2.0 host port
> > > > - 1x M.2 E-Key
> > > > - 1x eMMC slot
> > > > - 1x MicroSD slot
> > > > - 1x QSPI Flash
> > > > - 1x 1Gbps Ethernet port
> > > > - 1x HDMI port
> > > > - 1x 2-lane DSI and 1x 4-lane DSI
> > > > - 1x 2-lane CSI
> > > >
> > > > Add the devicetree file describing the currently supported features,
> > > > namely PMIC, UART, I2C, GPIO, SD card, QSPI Flash, eMMC and Ethernet.
> > > >
> > > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > >
> > > Got a dtbs_check issue in the patchwork CI:
> > >
> > >   +arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: gmac1-rgmii-rxin-clock: 'clock-frequency' is a required property
> > >   +	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
> > >   +arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: gmac1-rmii-refin-clock: 'clock-frequency' is a required property
> > >   +	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
> > >
> > > Can you fix that please? Also, I applied some patches the other day that
> > > seem to conflict quite a bit with the common board dts patch. Would you
> > > please do a rebase on top of that please?
> >
> > Been going through stuff on my todo list now that the merge window is
> > closed. Could you please resend this with the rebase done?
>
> Thanks for the reminding, I will rebase on 6.9-rc1 then send out the
> patches.

Hi Jisheng,

A rebase would be great. It looks good to me, but could you maybe call the
common .dtsi something more generic like jh7110-common.dtsi like the
jh7100-common.dtsi. If we'll see other boards based on the jh7110 upstreamed
(eg. Star64) I suspect they'll also be heavily based on^M^M^M similar to the
VF2 schematics.

/Emil

>
> >
> > Thanks,
> > Conor.
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
