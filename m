Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BED2CE8E9A
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 18:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8NPf81gRe4twSmw2h2aW7Q5jfAyRNFXbgx4sDI0Nn8=; b=jcEyaqp9D0rvZG
	HY2SQ0H417S7/XM9s0Gk9+qjp+w+/2LRSd9Eltz3CD+M90YE8Bl7B9+mGv3iZ+MYiYnoYgoSVV4ui
	jcBcptAhAJ8f4oReIxATFmorFCgqViWR/8EpTPz2mPvQTR3bzgDWbCLIA7vCg3KglNtzXa0f0mzc8
	0N/Sn9s40EYfw2pCQovO8vjTt0sj1mIKHeNe/35UhBwMzA3VGSSqxsG//ja92XoRe6K/Qtz/BIJYs
	zNEwqv7UlvXYizI+y4yzZ0xZo3+8CoMGNIn00Qs1kTM6CEy2LpyEG7Yr2FIlZrBmEJ3kDXa5TfDa5
	xtYHr8EP+eP238K5AeXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t42BP-00000001Opm-2j33;
	Thu, 24 Oct 2024 18:03:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41v3-00000001Kpv-2FQR
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 17:46:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5DFAC5C4328;
	Thu, 24 Oct 2024 17:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60947C4CEC7;
	Thu, 24 Oct 2024 17:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729792003;
	bh=0oe8ZaFyqJHIzvDer+HKlnboZayD2eODXd02TS0w2+8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Y2gnKRPioD/Z5egwlJ/6dS+E/lum1fNQLt/sPBMPdcjNKpydwW0bZDFh0ZPU8rlX/
	 AGoSyQ5eDpRFfVzR2BkED0rtDVJLGsu8iGhAv4jBZhIgLGtyOlke3Fk4uR8LgL6IYb
	 ZXU8MzikUVwqgR0iewFfhkYpTWxhkXal5hU+RYDwGePDNJ39y+WdXrQkCJZv+N9vKQ
	 QyYk/qguUbsGAJRvMBZ+hMEdrnke6vsa/RUbd/KGLjmRhJd5tfz8GvpzAIxwlEN9NT
	 GIbrPgmohatXfVQzMrcltgwrKl4nvNDhXDs8YPKOF42TwpBkAjYboqthttTv4mib9e
	 bCRB56R17vzaA==
Date: Thu, 24 Oct 2024 18:46:34 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <lars@metafoo.de>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <nuno.sa@analog.com>,
 <javier.carrasco.cruz@gmail.com>, <sunke@kylinos.cn>,
 <conor.dooley@microchip.com>, <anshulusr@gmail.com>,
 <kimseer.paller@analog.com>, <michael.hennerich@analog.com>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <noname.nuno@gmail.com>
Subject: Re: [PATCH v2] iio: dac: Kconfig: Fix build error for ltc2664
Message-ID: <20241024184634.3bfcde82@jic23-huawei>
In-Reply-To: <20241024015553.1111253-1-ruanjinjie@huawei.com>
References: <20241024015553.1111253-1-ruanjinjie@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_104645_737837_41E05180 
X-CRM114-Status: GOOD (  17.35  )
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

On Thu, 24 Oct 2024 09:55:53 +0800
Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> If REGMAP_SPI is n and LTC2664 is y, the following build error occurs:
> 
> 	riscv64-unknown-linux-gnu-ld: drivers/iio/dac/ltc2664.o: in function `ltc2664_probe':
> 	ltc2664.c:(.text+0x714): undefined reference to `__devm_regmap_init_spi'
> 
> Select REGMAP_SPI instead of REGMAP for LTC2664 to fix it.
> 
> Fixes: 4cc2fc445d2e ("iio: dac: ltc2664: Add driver for LTC2664 and LTC2672")
> Reviewed-by: Nuno Sa <nuno.sa@analog.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Applied to the fixes-togreg branch of iio.git 
Thanks,

Jonathan

> ---
> v2:
> - Select REGMAP_SPI instead of REGMAP.
> - Update the commit subject.
> - Add Reviewed-by.
> ---
>  drivers/iio/dac/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
> index 45e337c6d256..9f5d5ebb8653 100644
> --- a/drivers/iio/dac/Kconfig
> +++ b/drivers/iio/dac/Kconfig
> @@ -380,7 +380,7 @@ config LTC2632
>  config LTC2664
>  	tristate "Analog Devices LTC2664 and LTC2672 DAC SPI driver"
>  	depends on SPI
> -	select REGMAP
> +	select REGMAP_SPI
>  	help
>  	  Say yes here to build support for Analog Devices
>  	  LTC2664 and LTC2672 converters (DAC).


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
