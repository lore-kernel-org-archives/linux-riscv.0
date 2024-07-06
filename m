Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C253C2BD09
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Jul 2024 10:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzMNDXpex3xprRmBDBl9P3VhAiQpgljODbick9yXZ5M=; b=hIkEHLS8GwTJKT
	k5uFXFjjOt5Jmg1hCNOIjXYjPtp5CtmLBobt15TQ104qTQae791dfRu017qRIHIKwRz/4ZQ5qzuSI
	/cfmRpeRxNJPoRUmjoh5zeGhr97yN3873aGP7zKG79/tUKLNPJaW6+3mq6d8D4pQQpJ71nHOcIVJ8
	zBbd8kQT4VRwvDQ/l5XDzArkXCrHccu1zM5NTn9eYLhdK4wk96JjRwNmUsaVpoE5pDEHGuM9HASU7
	5GrcGm69bL7A0j6jvZwbcAmjwX5LeRQoD+dgmkTqWfP425dbx1DPjVl5MBQuvwZh42g8mmWUf1Cfz
	AOiXq7vYuYMdvzhWRyVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ37j-0000000066F-2OwU;
	Sat, 06 Jul 2024 10:58:35 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ37g-0000000065s-3xRx
	for linux-riscv@lists.infradead.org;
	Sat, 06 Jul 2024 10:58:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3B058CE1B13;
	Sat,  6 Jul 2024 10:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A15FC4AF0A;
	Sat,  6 Jul 2024 10:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720263510;
	bh=XFmbSHZPyF4ncxdS/EMdWTrzlspJlgiQH+AGeELwC5Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CbHIdkPbyDI0zp//4XKdrhjCHYfOseNHpqfSG2aP9N1bRlc1erSqCraNVQerpPRVE
	 +nCs33FtE6eI8u+WE9v8zzyvtVYSjBTP1fNmZsyQg+yPGRRQjZTSBwMrxsFJIDO+GF
	 w+cAw3SNTsEahv+QsSNEFKSFj9RN/h0enVpmsDLUgt1c4IWxRcKnQTJCmJIzvHm+r1
	 a5b+jzPsymuIOYfD94hesrH9nnNUonKILW6BmBleFIWtr2KE0Tr3d2EaGF9Vy+4dFT
	 xLoFym3fBBueEDZRfklXBgS1uG9ZpeJfED7e5o9uNyM/IZVthbgm5ps4SoHaK9/Q70
	 nofrsLjAdMITw==
Date: Sat, 6 Jul 2024 11:58:19 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen Wang
 <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, =?UTF-8?B?TWlxdcOobA==?= Raynal
 <miquel.raynal@bootlin.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/3] iio: adc: sophgo-saradc: Add driver for Sophgo
 SARADC
Message-ID: <20240706115819.49a570e3@jic23-huawei>
In-Reply-To: <202407061311.ZEmwMY8m-lkp@intel.com>
References: <20240705-sg2002-adc-v2-2-83428c20a9b2@bootlin.com>
	<202407061311.ZEmwMY8m-lkp@intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_035833_373803_048717D4 
X-CRM114-Status: GOOD (  16.69  )
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

On Sat, 6 Jul 2024 13:16:36 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Thomas,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on d20f6b3d747c36889b7ce75ee369182af3decb6b]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Bonnefille/dt-bindings-iio-adc-sophgo-cv18xx-saradc-yaml-Add-Sophgo-SARADC-binding-documentation/20240706-040736
> base:   d20f6b3d747c36889b7ce75ee369182af3decb6b
> patch link:    https://lore.kernel.org/r/20240705-sg2002-adc-v2-2-83428c20a9b2%40bootlin.com
> patch subject: [PATCH v2 2/3] iio: adc: sophgo-saradc: Add driver for Sophgo SARADC
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240706/202407061311.ZEmwMY8m-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407061311.ZEmwMY8m-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407061311.ZEmwMY8m-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/iio/adc/sophgo-cv18xx-adc.c:85:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]  
>       85 |                 struct cv18xx_adc *saradc = iio_priv(indio_dev);
>          |                 ^
>    1 warning generated.
> 
> 
> vim +85 drivers/iio/adc/sophgo-cv18xx-adc.c
> 
>     78	
>     79	static int cv18xx_adc_read_raw(struct iio_dev *indio_dev,
>     80					  struct iio_chan_spec const *chan,
>     81					  int *val, int *val2, long mask)
>     82	{
>     83		switch (mask) {
>     84		case IIO_CHAN_INFO_RAW:

I guess you figured this out but if not.. Key is you need to define a scope so
			{
>   > 85			struct cv18xx_adc *saradc = iio_priv(indio_dev);  
>     86			u32 sample;
>     87			int ret;
>     88	
>     89			scoped_guard(mutex, &saradc->lock) {
>     90				cv18xx_adc_start_measurement(saradc, chan->scan_index);
>     91				ret = cv18xx_adc_wait(saradc);
>     92				if (ret < 0)
>     93					return ret;
>     94	
>     95				sample = readl(saradc->regs + CV18XX_ADC_CH_RESULT_REG(chan->scan_index));
>     96			}
>     97			if (!(sample & CV18XX_ADC_CH_VALID))
>     98				return -ENODATA;
>     99	
>    100			*val = sample & CV18XX_ADC_CH_RESULT;
>    101			return IIO_VAL_INT;

			}

>    102		case IIO_CHAN_INFO_SCALE:
>    103			*val = 3300;
>    104			*val2 = 12;
>    105			return IIO_VAL_FRACTIONAL_LOG2;
>    106		default:
>    107			return -EINVAL;
>    108		}
>    109	}
>    110	
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
