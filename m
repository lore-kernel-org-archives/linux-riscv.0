Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0B3C636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 10:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MmyP9JLl0l0z7lN2j/oVph8DICiaLjiXKQA99lP2OaA=; b=YPg057HJ4yv4It
	KxsQ4ytOWTWmNFfoEYlijMfPW26OdMgAzaQUFr1qg5mVHRR6sfUqT97Wg+ncmFM802X1/c8TWH8iL
	En7t29VhpaexPxMYiSvmyT3dUtExEiJ46D9p7ZC727Bx8QJLY79O04pEx1Aq9WBrUgmkOErJ6ii5e
	oH330LZcdLt6clB/gwTpCVT7snKs7EOj/Ww+2kAu2aXqal4IeM6ogF1wabxY0jBjCjlmtu7tUolYN
	wUuJ4TzinK7Z4srstaIGvEDLuEfE8ekVrVPShAbyOZMRROXLC1W8f0p/M0mFez57hfPneyr6gN1eG
	Y5lf1iPWa8S8VUuEDdVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSEbK-005O4L-AG; Wed, 15 Feb 2023 10:01:22 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSEbH-005Nyo-4S
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 10:01:21 +0000
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 90C963F216
	for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 10:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1676455264;
	bh=N6nLfe3Ogw8JebzYy5+qmB5POBTivnyXYU0aBkUXowQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=JIeaudR4mbYN5e4tKLDFictbCRnvVkglBxXXDqci5fp33DonnGKb6QTB0qQFzKfb6
	 vez+mG8MVCKwKnL7SLl0usuVkvF/KCuXL+BXiXhiGowKhVLfAuPyCsTj6LiOOyNejs
	 u08z4nyfN0sb9slFB9QVMzj+m0AvncBXSgS73wEnXbvQX5f5kKSptcBs/El+rF9M+y
	 HYs6coNe4gp2dk+UTvhTXcTbSpamiDJQ4DKX46tvhwI8L71rtZDfd/AOqyEjARLiK+
	 yeBWeNr+mC8G4UGiI64o8gusUbDY4+i5u07TYTEh7TdbQHpyfpvJxFzW2fkJ9u66wN
	 HUvqrbZbAjBww==
Received: by mail-qk1-f198.google.com with SMTP id j29-20020a05620a001d00b00724fd33cb3eso11211683qki.14
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 02:01:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6nLfe3Ogw8JebzYy5+qmB5POBTivnyXYU0aBkUXowQ=;
        b=oPYgvsJpcP2wh59qy6yR3c+X9sOABiolsi9GaB8gPjXjRjOKHRgmiyclLnpdklBXIQ
         Gi7V/6FBRkYn1zOFKCSzAg6r3tV8rEny0nMeXKuTDO0OHxE04sSQ3qmL8KLYq3uYe94u
         RynhWw/InO5i1Ppq2bkW/GrO91eZ/ns3MIhXFQZQkz8r6SRcB7uB4dlHDEbF8p+pP2p2
         54gda6I0z90dD0KD+IFvBDmlVHXvpPq70QcyFyJuneMlT8MeRhHb9PiormK9wL6C4RNL
         +TjYSXbApAVICRMm4XPNrCpc1Y6AqJjfTWw43L07LrSsF7z4jjRXNWycnGxIu3fGPFPL
         Xkeg==
X-Gm-Message-State: AO0yUKW/B56TVd4MF0a3gbakwAkGgHpRxXsTV2EE+9u7PQX2btOHH/wf
	rBPH+YCCo8FpfuzaLcHCmgGtLf5uyu5ePP2mDgB0/r714sgMLzVrDC/dJbHFLl2ESICzzpGhMiD
	iFsCMNacbDpsJRAxLL137y5tyq0QUhYg3wvbvJqmuLaIPjC1CqSPor2EoxdCQOg==
X-Received: by 2002:a37:4249:0:b0:73b:3411:48b1 with SMTP id p70-20020a374249000000b0073b341148b1mr77171qka.219.1676455263497;
        Wed, 15 Feb 2023 02:01:03 -0800 (PST)
X-Google-Smtp-Source: AK7set+9H4L1nqdu+2ESDHje9l8E+qLdMohDtVuTVdGzCspjXkgOLnXU/9AA+6LBSrMd5WIhdVG6YbR1SazSJWLVTSk=
X-Received: by 2002:a37:4249:0:b0:73b:3411:48b1 with SMTP id
 p70-20020a374249000000b0073b341148b1mr77162qka.219.1676455263227; Wed, 15 Feb
 2023 02:01:03 -0800 (PST)
MIME-Version: 1.0
References: <20230203081913.81968-1-william.qiu@starfivetech.com> <CAPDyKFqei-GjKpBUQnDZUbYnSyn-JS5f_EnTLOuA1U4PdYTyVA@mail.gmail.com>
In-Reply-To: <CAPDyKFqei-GjKpBUQnDZUbYnSyn-JS5f_EnTLOuA1U4PdYTyVA@mail.gmail.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 15 Feb 2023 11:00:46 +0100
Message-ID: <CAJM55Z8gpBDu9818GPLRYJ9DBa+NfXW0uo76_bkwWm6RS1S9wg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] StarFive's SDIO/eMMC driver support
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: William Qiu <william.qiu@starfivetech.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_020119_528323_8BACC19D 
X-CRM114-Status: GOOD (  24.10  )
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

On Tue, 14 Feb 2023 at 13:21, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Fri, 3 Feb 2023 at 09:19, William Qiu <william.qiu@starfivetech.com> wrote:
> >
> > Hi,
> >
> > This patchset adds initial rudimentary support for the StarFive
> > designware mobile storage host controller driver. And this driver will
> > be used in StarFive's VisionFive 2 board. The main purpose of adding
> > this driver is to accommodate the ultra-high speed mode of eMMC.
> >
> > The last patch should be applied after the patchset [1]:
> > [1] https://lore.kernel.org/all/20221220011247.35560-1-hal.feng@starfivetech.com/
> >
> > Changes since v2:
> > - Wraped commit message according to Linux coding style.
> > - Rephrased the description of the patches.
> > - Changed the description of syscon regsiter.
> > - Dropped redundant properties.
> >
> > The patch series is based on v6.1.
> >
> > William Qiu (3):
> >   dt-bindings: mmc: Add StarFive MMC module
> >   mmc: starfive: Add sdio/emmc driver support
> >   riscv: dts: starfive: Add mmc node
> >
> >  .../bindings/mmc/starfive,jh7110-mmc.yaml     |  77 ++++++++
> >  MAINTAINERS                                   |   6 +
> >  .../jh7110-starfive-visionfive-2.dtsi         |  23 +++
> >  arch/riscv/boot/dts/starfive/jh7110.dtsi      |  37 ++++
> >  drivers/mmc/host/Kconfig                      |  10 +
> >  drivers/mmc/host/Makefile                     |   1 +
> >  drivers/mmc/host/dw_mmc-starfive.c            | 185 ++++++++++++++++++
> >  7 files changed, 339 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
> >  create mode 100644 drivers/mmc/host/dw_mmc-starfive.c
> >
>
> Patch 1 and patch 2 applied for next, thanks!
>
> Note that I fixed some checkpatch errors/warnings. Next time, please
> run ./scripts/checkpatch.pl before you submit your patches.

Hi,

Something here is not right. The bindings document "starfive,sysreg",
but the code is looking for "starfive,syscon".
William, did you test this and run dtbs_check before sending this series?

/Emil

> Kind regards
> Uffe
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
