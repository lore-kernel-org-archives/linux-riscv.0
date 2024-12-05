Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F63E7716E
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 18:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YYtrOrCUrZSnkjhEQSRuGhRBJN4DzpA2EuzcYmPfuCE=; b=OMleT70tTp5hsA
	NbcG4ZBYpawLEaacNUUrk9weGUHbuZyTL22tY9i0tYbXY+WtMVuSckwSxh05C76LmJuAcLJjR2vVl
	jcXiN5eRwueucS29NB1JRbfH+UdXxsAriw926Mt4qq5/HPtzwSfLfm8ixBnYRC0rRNH3al3/XUqe8
	BdkIpS6WhQUX0gXrNY0pzazjyZkWkP5tEWl/70AZdK2EmzEjIF1pLEInAu+CepVnmR3/Zshrwx578
	l9rR2pRd+grQaDtuvg+Yn1UNSR2nflNfrFpJNauxSsNfi6VjwlETzYnxdFAv5CSW1CJADSM5enaPn
	qLprrSpkbQFt2YG4UE5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGLs-0000000H5LC-0fUq;
	Thu, 05 Dec 2024 18:13:24 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGKR-0000000H4pp-0cDf
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 18:11:56 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2eeb2e749c5so1101992a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 10:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1733422313; x=1734027113; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2MUjUIXHE2bJtGuB7BkRXXqw/hOym15VxRARXET8bls=;
        b=csabldNiyBPA0VUf0x4x6hL0a8Vvqd4FNjqz+CdwiOZnuFudAQSN63lVOAQHuPTnPp
         3r9qgJqLqH2cYQR+tSKux1s5Tqnr/Ij7+k70mBGcw3PgOpxyW74txk3AnZPBo+MO2ZUJ
         vJHV73Eq5ZL3P9kbC87Gk8zQ9L9HWTBIIw0o/5OXQ3/4KJZGvPp/UX7swmNLGygQPvYR
         6mRa90xNy3voNJO6v3sC8lePQE328odTyA8cue6ujnk+BlACvBHctyQw/pfQUhy2JpbC
         FLe2wPTq5f9lNdgKsI8Crj3HV0PJExzk/4eNoWIhpc9Bcbj+/u4C1hMUHUQXmk3XUE6y
         07Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733422313; x=1734027113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MUjUIXHE2bJtGuB7BkRXXqw/hOym15VxRARXET8bls=;
        b=o7sBh1o/H9VG0x1YFj+leFHQKjE3+HPMAKRLpOQ3PvxOPPJz8mecFTBxOC7joIv16Z
         LM/DrL5r4Nain/H/rekR0peLRnhLBIYh8BNqCM8q4yfJ82L3WN7F8jC8X0buyG4xpNLZ
         iNEyn2EMPXNcebU8ldU/Q7SyX7GQj6kh9POa0a6X54/PEtPeWqlMz6N1U8iROB7xox05
         jUoXp4utjGIwiPm5g5Hh7T3D7eGcKS4LKQA4sUUVvCzne5MFEocRY/dtKl1GDcKnOV/C
         OBaLyhPdmqM1GgqcpApIPuVAueLtNoCGE4WLX+FbeEqXV9inSEqToP2EApnJpoVr33IX
         EaWg==
X-Forwarded-Encrypted: i=1; AJvYcCUZdb2ILZCXKU5nLVEM7qdehkRK98fZ9JIJE0rl1I2axg3E+lQ2MEszsX4XRopf8jhDjiSeBIUTfCUPVg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdPut47543bS/uUN7mHbZmjhPMNLxPk52VHcFMZg53xveA5gZI
	pOf2rN/MNKgvxAoB3gqijn4KkpKkBy4ZBAGOCBAW4cSibi8GrZoBBXrIbnTzcjU=
X-Gm-Gg: ASbGncuCpCp9EuZO5zYxQrgC+lpZGQZK04DWJBr2bYZ7sPusJI8dXRL1P/XYJ38WV4g
	RLmmBIGPCTNZu37QUaaIRgJrNJsVZKy1PVykoRFB0RSnYCF+nlcUikviaJAujeCmQS9gfos3xvK
	GtDmp4v44CtLFvTSpT3OzxJ/Kghrv+WODkT/JH5rjgznKNpGgkV7YWlZFdF0m+rKX4oSVqhvFi0
	bppYi1CUjGi6a0TG4vqWdVR+TFnluQ=
X-Google-Smtp-Source: AGHT+IH9Qxre7SaXJmwLVox5H0UwU/C+KDg/si4WFNP6RN/USaZJmdrSMdvHNGZqEVGV0+rIUHI/aw==
X-Received: by 2002:a17:90b:5448:b0:2ef:2d9f:8e58 with SMTP id 98e67ed59e1d1-2ef6ab29c49mr113446a91.34.1733422313419;
        Thu, 05 Dec 2024 10:11:53 -0800 (PST)
Received: from x1 ([192.210.17.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef26ffb6f5sm3584572a91.6.2024.12.05.10.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 10:11:53 -0800 (PST)
Date: Thu, 5 Dec 2024 10:11:50 -0800
From: Drew Fustini <drew@pdp7.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: bigunclemax@gmail.com, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: dts: thead: Fix TH1520 emmc and shdci clock
 rate
Message-ID: <Z1Hs5smgFV4C6c90@x1>
References: <20241204111424.263055-1-bigunclemax@gmail.com>
 <CAJM55Z-YAMtRN=K5KxCH1+++Xw4uMM_c49z8tGzi3snU+-KrYA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z-YAMtRN=K5KxCH1+++Xw4uMM_c49z8tGzi3snU+-KrYA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_101155_451073_1C932B33 
X-CRM114-Status: GOOD (  23.24  )
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

On Wed, Dec 04, 2024 at 03:19:28PM +0000, Emil Renner Berthing wrote:
> bigunclemax@ wrote:
> > From: Maksim Kiselev <bigunclemax@gmail.com>
> >
> > In accordance with LicheePi 4A BSP the clock that comes to emmc/sdhci
> > is 198Mhz.
> >
> > But changing from fixed-clock to CLK_EMMC_SDIO leads to increasing input
> > clock from 198Mhz to 792Mhz. Because the CLK_EMMC_SDIO is actually 792Mhz.
> >
> > Therefore calculation of output SDCLK is incorrect now.
> > The mmc driver sets the divisor to 4 times larger than it should be
> > and emmc/sd works 4 times slower.
> >
> > This can be confirmed with fio test:
> > Sequential read of emmc with fixed 198Mz clock:
> > READ: bw=289MiB/s (303MB/s)
> >
> > Sequential read with CLK_EMMC_SDIO clock:
> > READ: bw=82.6MiB/s (86.6MB/s)
> >
> > Let's fix this issue by providing fixed-factor-clock that divides
> > CLK_EMMC_SDIO by 4 for emmc/sd nodes.
> 
> Thanks for finding this bug!
> 
> However, this feels like a work-around for a bug in the clock driver, and even
> if there is a fixed factor divider somewhere this should probably be modelled
> by the clock driver. Did you look into the documentation[1] and try to figure
> out where eMMC clock comes from and where the /4 is missing?
> 
> There is also a vendor tree somewhere with a much more complete clock driver.
> Drew do you remember where it is? Maybe it's worth looking at how that driver
> models the eMMC clocks.

Sorry for the delay, I'm travelling until tomorrow.

Maksim, thanks for finding this issue and sending a patch.

That is a good point about checking the thead vendor kernel. I normally
look at revy's thead-kernel repo [1] which is 5.10. revy also has a 6.6
lts branch in th1520-linux-kernel [2].

https://github.com/revyos/thead-kernel/tree/lpi4a/drivers/clk/thead


Looking at line 454 in drivers/clk/thead/clk-light-fm.c [3]:

  clks[EMMC_SDIO_REF_CLK] =
  thead_light_clk_fixed_factor("emmc_sdio_ref_clk",
                               "video_pll_foutpostdiv", 1, 4)
                               /* Note: base clk is div 4 to 198M*/

Which derives from line 373:

  clks[VIDEO_PLL_FOUTPOSTDIV] =
  thead_clk_fixed("video_pll_foutpostdiv", 792000000);

Thanks,
Drew

[1] https://github.com/revyos/thead-kernel
[2] https://github.com/revyos/th1520-linux-kernel
[3] https://github.com/revyos/thead-kernel/blob/lpi4a/drivers/clk/thead/clk-light-fm.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
