Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09D7D5E130
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 11:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UzdwpUta8F0obfD9TYYykUPg/KSUBa7cnxtwLOPgEqc=; b=n+tkG4Hf2pSOiq
	JgxWnbg6sVkx7ECfBwa/0i9rxlZ5JRxwJ+cNGuxlf1bq1OkEk2cTObkuHWh1WCUem+/PXE1l/AFFy
	eUbcoTUvselIYvPFjNMZ3LfZ+1zgYi/Ij76uyzz4Kz15wHDZ0acceaRN4DwR2d4zBiwBnaBxFJI/z
	1ueTo6qRTmPayqKnkXNb6v8S4rutOikK8uS5U2XWhay9bZJghLUhyBVt7NqYAvuKIWNhJmUZDWLgj
	EhC43PV+vlQ96GqF1S9vawXYIj0lz3OIX/GkANzcI3IHGeGPbXHE+NOwIPF8d67bTRu857oNXBxMi
	K99DUI5mOb4Kjfg8OynA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSwh-0000000567r-4AWG;
	Tue, 16 Dec 2025 11:10:24 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSwf-0000000567S-25QB
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 11:10:22 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-34c30f0f12eso2531377a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 03:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765883420; x=1766488220; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ej3ICkCwAh2kwXUgz8fJWzp7gMYAFkjNFgF5UWgoP2A=;
        b=CIGSaxv3S8wgbSh36Hd8aKbs/PJc1dZG2s7XJe+SfkaiHwzqhj4JZxZjgZXLsOomjK
         BdExWJ0adxHPYgEqEIOOwjTMMUA2KWGL2H5xWsuMdZTg9JA21FdpRiYyX4GDfO1qLiTN
         LbR5O2RrBpEIvAIgAJ1e36qj+kx9GKZWDgCvrMRTK6EtoG7ZhgxSQ57Nx3lBCzjg9aNB
         3/mreLGpGKS/viyq1x4FTa1EaiecFLgjn/fuzabBx0DYSYJAJ4QdH1Z4EaNi62pkpV5e
         jgrObkGvQxMLzFKSrqzVWEtdyakQ/AWS3bqeQ4mboBNuM0xi9A+Ln5tX8+oOcsnY0Xy2
         9/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765883420; x=1766488220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ej3ICkCwAh2kwXUgz8fJWzp7gMYAFkjNFgF5UWgoP2A=;
        b=CRCt0stGNdk4J3M3Cq3Tv7jm8Qv3yiD8JdX4UmLeLWOA6OLjzBkw0TEErwPA4T08j1
         zCZmdcUI5aCvl4Vt9L4s/qiC+YCukTr2JlgQcrrGwru9k5YKvXY35Cm2jWfRo/3GYbuO
         p48bKDDvId32XpSIbjUbjNtT7HHH0iDcRSbPwE3iHhOEyZzwnPORivNl7Ag/35ZKi/fs
         x+UFGSbbLwPkZkBE0hviF7effuHNHgf1ZrAa6GsQ52XCtd6W+W3pjAOcwACsipG/AAxh
         yeFb5b3WKZG9/++NZb+Islntjg/hSJWtAtCX+TRnjpd4rmOizT1GnWaCu0tT2RXYyZxR
         s/hQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5XgnUqE7Ds68kgHhgNHfgzx6yiGgN+4Uw03nHjbfy/0xZ9605oEM+PObJ4HJv1iBWd0W5OBu9DUPqxg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc8SPxSxUHqJTYpLONp+7zLWo2cc4NDxW9l0dGFcD5exY3so5d
	/udLSIakDF3tmSQQKLGqxO43OIbh5CIUlnjH3FVA3W5Pg1LJLqxhqoid
X-Gm-Gg: AY/fxX7KfqcelFQw4Ps2c2LDv5xk7UEqi+yznISifo4Mwd0ABZNmBASRRgdEAjLPkf6
	g7jhy80kDlkgR403+EGU9epjs7PHU9807hYY9wPW+W0O+S96VI2uWlFTbMUDGom2trl3kYHh7Vx
	gcnj5B5RKrqMCtfumv7AHTD0duiyQo2ts05Ys7M3opba4JqLonPcfLoVGJZCrosuB0SYgFQ9h9m
	40qaev9O3kzTtN0C4CaOWtO90e57h0jwO2UlOwrktQNETcIcZye9V/Pw+7+Mwtla9fC0Tc/Q4zn
	rxM+Vp3WjJHB4NQoDXwfn90yhkNXIU9cKqHRiYti7Wk15FDfBMERl6ZLDtF30Yf3QBtqCLawCr0
	1D9gZsDy7HQcWFCjfZNABVT7NRUBPTPioppVWijlU/e13WlIBG3l46VvH5sOF0I6O4b4FH5t0lg
	Jp1CDuffdgn3j72fuIUp69
X-Google-Smtp-Source: AGHT+IEn5RsKYSO5hlJJgYZT/9nyqBTv5DdsyrL3E95sfCO8MKdD/gWsaEX+ukrp/NOH0Js4gDXwRw==
X-Received: by 2002:a05:7022:3a8e:b0:119:e56b:98c0 with SMTP id a92af1059eb24-11f34c18eddmr9239549c88.39.1765883420209;
        Tue, 16 Dec 2025 03:10:20 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ff624sm53688630c88.12.2025.12.16.03.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 03:10:19 -0800 (PST)
Date: Tue, 16 Dec 2025 19:09:16 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Anton D . Stavinskii" <stavinsky@gmail.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Longbin Li <looong.bin@gmail.com>, 
	Ze Huang <huangze@whut.edu.cn>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v2 0/3] riscv: sophgo: allow DMA multiplexer set channel
 number for DMA controller
Message-ID: <aUE9hDtflXpcgGnX@inochi.infowork>
References: <20251214224601.598358-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251214224601.598358-1-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_031021_538661_42251414 
X-CRM114-Status: GOOD (  16.62  )
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

On Mon, Dec 15, 2025 at 06:45:57AM +0800, Inochi Amaoto wrote:
> As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
> the SoC provides a dma multiplexer to reuse the DMA channel. However,
> the dma multiplexer also controlls the DMA interrupt multiplexer, which
> means that the dma multiplexer needs to know the channel number.
> 
> Change the DMA phandle args parsing logic so it can use handshake
> number as channel number if necessary.
> 
> Change from v1:
> 1. rebase to v6.19-rc1
> 2. patch 1: remove a comment placed in wrong place.
> 3. patch 2: fix typo in comments.
> 4. patch 2: initialize chan as NULL in dw_axi_dma_of_xlate.
> 
> Inochi Amaoto (3):
>   dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible
>   dmaengine: dw-axi-dmac: Add support for CV1800B DMA
>   riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel
>     number for DMA controller
> 
>  .../bindings/dma/snps,dw-axi-dmac.yaml        |  1 +
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi        |  2 +-
>  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 26 ++++++++++++++++---
>  drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  1 +
>  4 files changed, 25 insertions(+), 5 deletions(-)
> 
> --
> 2.52.0
> 

Hi Anton,

Since you have tested this patch before, could you give a Tested-by?

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
