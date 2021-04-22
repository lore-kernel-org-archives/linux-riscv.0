Return-Path: <SRS0=CVeS=JT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EBBEC433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Apr 2021 22:34:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6690661139
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Apr 2021 22:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6690661139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SEEGPlGIUYFT6GquU2jONLqQNQo6njWuZkxitjAbJJA=; b=icXzrQQyUejr+2pzPtXeldqUR
	zJOO2JYT7476dheNlKhZfhYeqzrusXSOfc8R61EN4SPgm3HldcNkgw0b3S5/CzeB5DA9eMD5iSh5a
	KiLFGxrEnlaen0Fc8C0cUxgRfwu2AnaoiUY/TIT7xuPDDumx/mjjEL+krUcBCC8hnrj/7QMQFo3Y4
	xv1m1EvAnqP/UQpn5sJ0HGbDdV2mh7uWefXQ66tyBI0hF7Rg4aSommVF5d3jIINTOmn9B2JRQREDK
	DHUpsChTg6Xs27iOodpX5X6ElbMtC8mpTCa/I7RBqWV7eskbliwJsNjkDqsbxB4ez3ahva89t4Kvt
	sdslpAvPQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZhta-0002MF-LQ; Thu, 22 Apr 2021 22:34:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZhtU-0002M1-Gm
 for linux-riscv@desiato.infradead.org; Thu, 22 Apr 2021 22:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=jcnNcy3xEzSBfglTcOYjFIN3PxQZlBAWD1DKw9DY21M=; b=hufdkgdJem/Sz7Y9CFYgp9kgfE
 wP2Ub+rB9/ktHS5zUT2H6BUWsjO0QnHYaKF8Otx554vDo0JrrvUD+No80Ezknyh6bOQzktd1ZFefV
 Rps+yqruir+k7NDxo2QuX0EoikOlkgX5O0QJkJhYMUmVlYIL/Ncz0ud53UO1RR19cfemw4aPdEijL
 MKkv/S7autNI+t47ZbqUYc2SQq0cjYavqzJm6xt9igLJ6sLi1p/iXSK8RCEgN0hyan+FvLc1Z/fH1
 HE+9zXke4iSZmT5mVJKoazGH+EK7P+jNdRr9dVuy4uRlk+0cAu8jVMfNVRDZ3CRlSOK4gW6S12t2p
 mYiMboRw==;
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZhtQ-00E1Oi-8F
 for linux-riscv@lists.infradead.org; Thu, 22 Apr 2021 22:33:55 +0000
Received: by mail-il1-x131.google.com with SMTP id y10so17319807ilv.0
 for <linux-riscv@lists.infradead.org>; Thu, 22 Apr 2021 15:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jcnNcy3xEzSBfglTcOYjFIN3PxQZlBAWD1DKw9DY21M=;
 b=K0kdLys4ozVg1KxW2mM79QNCe1oDKQG1Lf40Pyu7KkT5gP6tVLsF8Z92X6TTxaPiiU
 1lxo1GoQTQPK9n5ks+2otp9uE2QITAUscik37LBQRgX5ZGn3QqXWi41/LAV5tKRQAKeL
 wGjQrh8FSyP+rY5Lh8X3oeZ9cNJ7fZ9iafDhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jcnNcy3xEzSBfglTcOYjFIN3PxQZlBAWD1DKw9DY21M=;
 b=CAU9fPxqPkTUK37HSkIUH/iKspzRSj6RVotB4ixBmc8pjKyyvlO2XpH0N9NZHRAyYM
 /p7sQjE6zZQAm51qxRqJ+EWduimNQXoCEqH7PlRHhkk/fuUngkI+fYqQOZnFATGTFwqe
 D8E+NkLMUO7lXvUryvOfh2hl/xUFKKAaWM/IE78LHYabMDyPQF1HL35fIsLCbBJUaQBp
 mSIK1nWKuL33UeC7VSLcOPGoohJaQla5Cm52D26tzCEox073qzk1Ae9RlOn59GMa/JEE
 YETQdsOqii+sRbSVrsWNkqgGaD/K4Sj7eikwjJ62/xQL6zrttqE6YySF9QdEEgbw+MYJ
 BFgw==
X-Gm-Message-State: AOAM531A493CNJECh4Ffvl5/ZilvhFWDI2Q68hUetKtQBRZ3sgBGL0tM
 PDtkZVfDCRHieLKR4mu3Bsz4lrKoabSKHhobVT+u
X-Google-Smtp-Source: ABdhPJwtRG38ji/buQ1uGL0nlGipaF8+BvqUnB6p4XjEXGNFBHm4wLKN7FtAIzgH/UuiZTO7zEgDCEsJjX0Y6wGBGTQ=
X-Received: by 2002:a92:1304:: with SMTP id 4mr591258ilt.126.1619130830378;
 Thu, 22 Apr 2021 15:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210303200253.1827553-1-atish.patra@wdc.com>
 <mhng-13c067eb-0011-408d-83f4-2950c1e791fa@palmerdabbelt-glaptop>
 <CAOnJCUKtt3LF0zh6dKAAUtbCKsYCMby5TasA59fY2hpODX3vnQ@mail.gmail.com>
In-Reply-To: <CAOnJCUKtt3LF0zh6dKAAUtbCKsYCMby5TasA59fY2hpODX3vnQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 22 Apr 2021 15:33:39 -0700
Message-ID: <CAOnJCUKvyDPO55QtPXDhCMKYBb70WpR01jM1F=ddA=pmFJo5_Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Add Microchip PolarFire Soc Support
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Atish Patra <Atish.Patra@wdc.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <Anup.Patel@wdc.com>, 
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 devicetree <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Conor.Dooley@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>, 
 Ivan.Griffin@microchip.com, Lewis.Hanly@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_153352_321997_FC924E62 
X-CRM114-Status: GOOD (  38.37  )
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

On Sat, Apr 17, 2021 at 8:26 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Mon, Mar 29, 2021 at 9:17 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >
> > On Wed, 03 Mar 2021 12:02:48 PST (-0800), Atish Patra wrote:
> > > This series adds minimal support for Microchip Polar Fire Soc Icicle kit.
> > > It is rebased on v5.12-rc1 and depends on clock support.
> > > Only MMC and ethernet drivers are enabled via this series.
> > > The idea here is to add the foundational patches so that other drivers
> > > can be added to on top of this. The device tree may change based on
> > > feedback on bindings of individual driver support patches.
> > >
> > > This series has been tested on Qemu and Polar Fire Soc Icicle kit.
> > > It depends on the updated clock-series[2] and macb fix[3].
> > > The series is also tested by Lewis from Microchip.
> > >
> > > The series can also be found at.
> > > https://github.com/atishp04/linux/tree/polarfire_support_upstream_v4
> > >
> > > [1] https://lists.nongnu.org/archive/html/qemu-devel/2020-10/msg08582.html
> > > [2] https://www.spinics.net/lists/linux-clk/msg54579.html
> > >
> > > Changes from v3->v4:
> > > 1. Fixed few DT specific issues.
> > > 2. Rebased on top of new clock driver.
> > > 3. SD card functionality is verified.
> > >
> > > Changes from v2->v3:
> > > 1. Fixed a typo in dt binding.
> > > 2. Included MAINTAINERS entry for PolarFire SoC.
> > > 3. Improved the dts file by using lowercase clock names and keeping phy
> > >    details in board specific dts file.
> > >
> > > Changes from v1->v2:
> > > 1. Modified the DT to match the device tree in U-Boot.
> > > 2. Added both eMMC & SDcard entries in DT. However, SD card is only enabled
> > >    as it allows larger storage option for linux distros.
> > >
> > > Atish Patra (4):
> > > RISC-V: Add Microchip PolarFire SoC kconfig option
> > > dt-bindings: riscv: microchip: Add YAML documentation for the
> > > PolarFire SoC
> > > RISC-V: Initial DTS for Microchip ICICLE board
> > > RISC-V: Enable Microchip PolarFire ICICLE SoC
> > >
> > > Conor Dooley (1):
> > > MAINTAINERS: add microchip polarfire soc support
> > >
> > > .../devicetree/bindings/riscv/microchip.yaml  |  27 ++
> > > MAINTAINERS                                   |   8 +
> > > arch/riscv/Kconfig.socs                       |   7 +
> > > arch/riscv/boot/dts/Makefile                  |   1 +
> > > arch/riscv/boot/dts/microchip/Makefile        |   2 +
> > > .../microchip/microchip-mpfs-icicle-kit.dts   |  72 ++++
> > > .../boot/dts/microchip/microchip-mpfs.dtsi    | 329 ++++++++++++++++++
> > > arch/riscv/configs/defconfig                  |   4 +
> > > 8 files changed, 450 insertions(+)
> > > create mode 100644 Documentation/devicetree/bindings/riscv/microchip.yaml
> > > create mode 100644 arch/riscv/boot/dts/microchip/Makefile
> > > create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> > > create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> >
> > I had this left in my inbox waiting for either some reviews to come in or a v2,
> > but I don't see any.  Did I miss something?
> >
> Sorry for the late reply. I am on vacation until May. I think I saw
> all the patches have already been reviewed.
> Let me know if it is not the case.
>
I cross checked and all the patches are reviewed-by.
@palmer: Is it possible to take this series for 5.13 MW ?

> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
>
>
> --
> Regards,
> Atish



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
