Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078DCC30653
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 17:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=km3WmPuCZibNFnOw/zDyO5ddCDxftDID4/FZ1fiAOXw=; b=3/h1FVmX+2m+Yc
	xPzp7iRdTTDASJTgLtdNr2y5Bu+yk3DYEGr9rRiTOqib1rjFcSDTnZyPEOprzOio7vlrSrwHK4UXE
	FJmp/KphQeCJ1F8jMAQduA6q5LYJiyWaRecM8hGqVXw63c9eGKt3TzhDdxBtgMQwPNlMJxpUh4OPG
	3v86QL8R4f8kbVntBG+xqPB/vur0At2X16q0KqjJ7BfyLTRYmmAYa1O2pKdQ9hQnzimn71okgHi3G
	UyxStr2yLtGydLei4NzIcdfWk/fWW6g3R7tR93ZIvQnh5GNb0hIadudOeqx6OpnNrP58POX1yVypJ
	lqGAs4MSvvgD7pe3kLyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPQe7-0000000E5Nf-34SP;
	Thu, 04 Jul 2024 17:53:27 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPQe4-0000000E5MZ-2Gw8
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 17:53:26 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1fb222a8eaeso6527175ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jul 2024 10:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1720115603; x=1720720403; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8uryZ79GMK3Hbevhm1GUwmInwdQUDjClI1eiCDdIwGw=;
        b=r3gCgqtqWGjavOlgCmgmHDwEXn/1VYRCzqZSNBwElabJBnDL892vTlttLASrqlGE3U
         tyddgOfVi4OLnDlfq5SFS5/ipTST5reNx6Y5y2TN0XRnD4XCC4O0KidLpKnSoh+reu6l
         HYYk7R7/GkkelKDkQFsnv4m2Yoxt7BQPRJgpFGmRT7tDqpJPx6rBpbniz7iT0+atZKZ2
         wDsY2nT1ZYbXJk6O9YWyhuMpIg5VdhRaT/SdpsMgzld2ZtzSSwxFthx8434ZEHZAUo6j
         /eklB+lJ5N6JIT3mwf/WqWLDvj+Vh118aNoUb88zao6Ib66uh7Vj31HXlLvOto+fiuLK
         S/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720115603; x=1720720403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uryZ79GMK3Hbevhm1GUwmInwdQUDjClI1eiCDdIwGw=;
        b=G359nBbRSQBAg2La3x3kfMphs0QuH5P3lM279JaN2RW1aPnJY5KiA2bETQd3+6QRDu
         EW8/8aGgnURt7XMr8+W8xqhaBDAdJG0Va6/Aqhxml0ZeE6L2LywPwVhPV3rz1Ah1ICYl
         okwbfYDVu2famCAXHzk/Ua0O0hIIKEQ9ZQd4HXg3u5TLbMTW2pJVh/hPPIQIHv2g0Bzv
         oGjgEnf4yfv8M/4CpDGiLiQa9ixddMyKJ71/h98FANCIX98twycopFQ0+KpEJBOUmzqa
         6uBWUrmnndQoVW9peiBksEeBIa5cKCCyJNpnX+wWkUPIUaMN+1KvMPiP4K9GVCvbtvFx
         g0dw==
X-Forwarded-Encrypted: i=1; AJvYcCXtBJSEYtErjNX50Qn+7VX/C21oo4h8aik3TxopRRmef76iu9WkBx/kvkzgRJagXuh8kA5RhNFrvxSagiOFdhGjGPkdHSgJOE5j9PvI/OrB
X-Gm-Message-State: AOJu0YyTX4Hjeab+VmvjkaL2amz2M+PMcfSeHqRvk+BJpdt2MNapk3zh
	nIBMRjd0M+RVJ5a0gny/ZuQhlZrvApl5WXKJ5pMRE4QpbTdKEvqR2zWyqSS82dg=
X-Google-Smtp-Source: AGHT+IHr2Ly4uGxHjqpvelPSNVZYUdi1gXcvcSsc8YvBTQFpKVrUUJwR8TdaP1EKvh1cnQR14j81oQ==
X-Received: by 2002:a17:903:192:b0:1fa:cec7:9a9d with SMTP id d9443c01a7336-1fb33e0de4cmr17233465ad.15.1720115603590;
        Thu, 04 Jul 2024 10:53:23 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:8756:5e46:4951:e2d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb3dbd7dcdsm10711545ad.157.2024.07.04.10.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:53:23 -0700 (PDT)
Date: Thu, 4 Jul 2024 10:53:21 -0700
From: Drew Fustini <drew@pdp7.com>
To: Drew Fustini <pdp7pdp7@gmail.com>
Cc: Conor Dooley <conor@kernel.org>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/3] riscv: dts: thead: add basic spi node
Message-ID: <Zobhkf5qr13rKcWH@x1>
References: <20240701121355.262259-2-kanakshilledar@gmail.com>
 <20240701121355.262259-5-kanakshilledar@gmail.com>
 <20240703-juice-refreeze-62c468a56ea5@spud>
 <ZobU6K/R3pfHrK9c@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZobU6K/R3pfHrK9c@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_105324_602805_AAB96788 
X-CRM114-Status: GOOD (  34.79  )
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

On Thu, Jul 04, 2024 at 09:59:20AM -0700, Drew Fustini wrote:
> On Wed, Jul 03, 2024 at 03:45:37PM +0100, Conor Dooley wrote:
> > Kanak, Drew,
> > 
> > On Mon, Jul 01, 2024 at 05:43:54PM +0530, Kanak Shilledar wrote:
> > > created spi0 node with fixed clock. the spi0 node
> > > uses synopsis designware driver and has the following
> > > compatible "snps,dw-apb-ssi". the spi0 node is connected
> > > to a SPI NOR flash pad which is left unpopulated on the back
> > > side of the board.
> > > 
> > > Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
> > > ---
> > > Changes in v2:
> > > - Separated from a single patch file
> > > ---
> > >  .../boot/dts/thead/th1520-beaglev-ahead.dts      |  9 +++++++++
> > >  .../boot/dts/thead/th1520-lichee-module-4a.dtsi  |  4 ++++
> > >  .../riscv/boot/dts/thead/th1520-lichee-pi-4a.dts |  5 +++++
> > 
> > Didn't you say there was a flash on one of these two boards?
> > 
> > >  arch/riscv/boot/dts/thead/th1520.dtsi            | 16 ++++++++++++++++
> > >  4 files changed, 34 insertions(+)
> > > 
> > > diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > > index d9b4de9e4757..3103b74e0288 100644
> > > --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > > +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > > @@ -17,6 +17,7 @@ aliases {
> > >  		gpio1 = &gpio1;
> > >  		gpio2 = &gpio2;
> > >  		gpio3 = &gpio3;
> > > +		spi0 = &spi0;
> > 
> > "spi" would sort after "serial".
> > 
> > >  		serial0 = &uart0;
> > >  		serial1 = &uart1;
> > >  		serial2 = &uart2;
> > > @@ -52,6 +53,10 @@ &sdhci_clk {
> > >  	clock-frequency = <198000000>;
> > >  };
> > >  
> > > +&spi_clk {
> > > +	clock-frequency = <396000000>;
> > > +};
> > 
> > I'm pretty sceptical about adding more of these fixed clocks, rather
> > than waiting for the clock driver. Drew, what do you think? Should we
> > just add one more to your fixup list or would you rather delay? Guess it
> > depends on how long more you think that clock driver is likely to take.
> 
> I think the clk driver [1] is in good shape but it has not been reviewed
> by the clk maintainer yet. Thus it is hard to predict any timeline for
> it getting merged.
> 
> SPI support doesn't require any driver changes so I'd be inclined to
> allow the fixed clock in this case. It will be simple to change it over
> to a real clock once the clk driver is upstream.
> 
> Acked-by: Drew Fustini <drew@pdp7.com>
> 
> Thanks,
> Drew

Sorry, I meant to include the link to the most recent clk series:
https://lore.kernel.org/linux-riscv/20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com/

-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
