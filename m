Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63620CD3445
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 23:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5TFdgZ3x2EoVg4Fj5+8oj/f9ap6U9/v+M3sCVkwNicQ=; b=G6W6bsVgOEw2L7
	7UuxrFmbFaWa2JY9lVCt4K3CdPr9lhBUNhWA3ezEk+HUTgkLWbmI2hiEZMx0ecTb+YcrzrTh1vQ7g
	SasjQ+cl83sxSlnZ0RLSRxsmroaO2m3rcrHwcC2sSOTDVJaPZ2Erg5gAsXi5oZkTTecg4mqRcjLzV
	xXMdl/xeSp+EJHPHK3Z8CHuqXbEIG6iTraED5Rkrx/9NpMKTcVl3FPOxRucv6sMlMPqxLxbVsqvG9
	lVgM0ZUK3dy4zGz8gJGVEV4oRVYCCtarUoWS6lTXJx6I87D3ZSC8DZTntQmq5ozpritwzxpZhQY/l
	capMeb8kptr04NV89ttQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLULQ-00000007iGU-3v3O;
	Fri, 08 May 2026 23:10:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLULO-00000007iFf-46hV
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 23:10:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3DE7440B1B;
	Fri,  8 May 2026 23:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92092C2BCB0;
	Fri,  8 May 2026 23:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778281854;
	bh=ORUCAFTKRGtPG3yUupNBAwqRD7T186ukSAgBZG1/VzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bkp2tTvzxBQ1lw4TojOwbCxXjFn3apkpbGAlAAl5jjvRm5xLfk8ckS7o6lDCOr39s
	 e5KMX0cyLx1MfBiyzPyqTOYi1r+GROZMtblQykNNnLG8Sc7Rke17bGGU0WSCMOOgkh
	 vvKSYbgB6rBj2dIxILCpx7T865GFhyyO8Ry+4h0bP4QLSRliClw3wSMTcYiEOBpZTy
	 QU/NcDi+61hZwBCBbqYjZ/+0VouP5O7jGAxRW8AyPkL4KH/pG90FxoRht62WhY13N1
	 c95TPlVgYcd5XOOrLa8Di/sQ3bXfAqYENtWDfxaJftaR0PkggdRkpgSl5ICD2sZFab
	 Shn1Z4ZNkMdxA==
Date: Fri, 8 May 2026 23:10:51 +0000
From: Yixun Lan <dlan@kernel.org>
To: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH v8 8/9] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
Message-ID: <20260508231051-GKC3590877@kernel.org>
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
 <20260413-orangepi-sd-card-uhs-v8-8-c21c40ec16d0@gmail.com>
 <CA+Xcp4nY9GVMOmtMG-PNhY2vqP4Cc_amAMSa+M3vuDjWUkuCHw@mail.gmail.com>
 <CABdCQ=OsPva9=YPdBd=3HW1OO7=_zJtpXjvaiA0WLEDT5Scs_Q@mail.gmail.com>
 <DICDTHYTPDSP.210EBVHTQ6966@linux.dev>
 <20260508225341-GKB3590877@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260508225341-GKB3590877@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_161055_039837_4C32E576 
X-CRM114-Status: GOOD (  12.45  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, Margherita Milani <margherita.milani@amarulasolutions.com>, linux-riscv@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>, Ulf Hansson <ulf.hansson@linaro.org>, spacemit@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 22:53 Fri 08 May     , Yixun Lan wrote:
> Hi Iker, Troy,
> 
..
> I would object to add CONFIG_I2C_K1 as hard dependency, the reason is
> that the spacemit sdhci driver (sdhci-of-k1.c) has no used i2c
> api/function, it's just need I2C function via an indirect requirement,
> which sdhci -> regulator(p1) -> i2c, besides, from the hardware design
> perspective, it just happens that K1 use P1(via I2C) as PMIC, it's
> totally possible(even in theory) to use other PMIC as power supply
> control which may not be I2C interface (maybe use SPI, for example)
> 
> If we want to solve this more gracefully, I'm in favor to add explict
> option enabled in defconfig..
> 
or I think it's better we do this way..

+++ b/drivers/i2c/busses/Kconfig
@@ -794,6 +794,7 @@ config I2C_K1
        tristate "SpacemiT K1 I2C adapter"
        depends on ARCH_SPACEMIT || COMPILE_TEST
        depends on OF
+       default ARCH_SPACEMIT


-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
