Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACCAC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 19:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=VIKnsDC4KQcbeXmyw/CoSfwsejx8aMjeyNNNMrH6MOo=; b=rtRMK2VAA9h12VEW054bU/E9LZ
	apY2acmu6U1833yUn7/SOfFSKWtID7R1V513xeDBfKDPmQziIlx2YQgoA3TyJJIR2IOECdfCkcf1J
	xAmXPFco/X5CIfuMeoYTx7wO42Nd4gjYxLATHb5UGtGG2gFtMpUpmBY2+j+/cNDIDTA5HlA0Fohg7
	n69naUKvsnsnzAAL8YRwsofEmasKW3xu2EJRHQ0EM7oWq2S+WYBG+dLnSwgRdNqZrr6r8qEjMIkx5
	l//YvziE7eN4w3MhpE54nz7D+wsISPRYWRO1MBAQPpx1QVeXbDsUvRX6TVhVVdjey1PdcycDWNmF/
	3ysAXGfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1na0gq-003Sxg-FN; Thu, 31 Mar 2022 19:42:40 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1na0gm-003SxJ-QY
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 19:42:38 +0000
Received: by mail-pf1-x435.google.com with SMTP id t2so517952pfj.10
 for <linux-riscv@lists.infradead.org>; Thu, 31 Mar 2022 12:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=qEPi6DppYoxU2evZZ00sDfEbEQwJezvupzY4bXgJJvE=;
 b=Qp2w4QzXAGQcQb2QyAc3nBMAFCSeUx76gQmZDosS+jKF7BpXGCT6LbReoC97lWREGw
 sNi6rgxHqqmrU/2aDpVIu0WJ1VNKxZIteBrcpUILZrFroLwxpnc4MvCnNskS3Wlxljdl
 GtWF2YK8rRCio8mJpu5gygNrl/88fy21roa7bzD2oSLL2Faji9RiW2hOMYGiT3N61jKt
 BYA0VgZoILLcQjDJrhvru95osHwJ6cMKsUJDsAKEPAibflN6tpanKHydJkFa4z9Bmlzp
 j8R/gjHNvXMKqg0oRIryiGeVyt1hTp5tZV4Ohw2ND6mBOGbOsI4nHCfiy33yozmcPkZ7
 lbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=qEPi6DppYoxU2evZZ00sDfEbEQwJezvupzY4bXgJJvE=;
 b=YmQCFffg7CmC7LpWANaCu8ko+oS4guSQYmqJT2Gbe9Z2+eJ9Fb/GdRPHiVw9YQGv7v
 zjil6gx88CoZJMkeK2Lxnr3Y6bjx5rCSmxOgMZrxAuBWcCuplqy/4NCVGrYRRtnAuUV7
 pafm8UifeORHfUoL5o178foDGaDfHCHcGUhkOJvvScB1l79s4wxyw1b1yvPAYWAX1cKT
 QYQ3H7Oqsh8pe8jT/RjgnGbe7hQo0BIUd5katg/PH/tAh+3Wt+Or+CEjpR3UjutaE9/X
 VOPl2PlIeQNHiKl1O2bEwZvHnVqT2JZAQ1l56WpyTlKcMh44tBDVN5uTqoHJmp0pI4kV
 5VvA==
X-Gm-Message-State: AOAM532+KxaWxOuh9y0WwNIPpvSjwZ47jWe/eLeuZdS5PwhtZZeQHr+7
 hIT/ucSLgZFPf6Eftf3LyFuqrw==
X-Google-Smtp-Source: ABdhPJxOP0vT3aSLvEQxxYn+4QTXcAAgQOlP3eNSJqVjCYYlah9s+sO3FQhgnfu6MpB47iCXqhK4+g==
X-Received: by 2002:a65:4503:0:b0:382:aad5:ad7d with SMTP id
 n3-20020a654503000000b00382aad5ad7dmr12186621pgq.488.1648755755822; 
 Thu, 31 Mar 2022 12:42:35 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 u204-20020a6279d5000000b004fa58625a80sm278641pfc.53.2022.03.31.12.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 12:42:34 -0700 (PDT)
Date: Thu, 31 Mar 2022 12:42:34 -0700 (PDT)
X-Google-Original-Date: Thu, 31 Mar 2022 11:37:08 PDT (-0700)
Subject: Re: [PATCH v2] RISC-V: Increase range and default value of NR_CPUS
In-Reply-To: <20220319121206.95919-1-apatel@ventanamicro.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Arnd Bergmann <arnd@arndb.de>,
 atishp@atishpatra.org, Alistair Francis <Alistair.Francis@wdc.com>,
 anup@brainfault.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 apatel@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: apatel@ventanamicro.com
Message-ID: <mhng-9cbb2a46-8bcb-4bfe-b927-0ed469dbd3a6@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_124237_092597_17C59141 
X-CRM114-Status: GOOD (  24.91  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 19 Mar 2022 05:12:06 PDT (-0700), apatel@ventanamicro.com wrote:
> Currently, the range and default value of NR_CPUS is too restrictive
> for high-end RISC-V systems with large number of HARTs. The latest
> QEMU virt machine supports upto 512 CPUs so the current NR_CPUS is
> restrictive for QEMU as well. Other major architectures (such as
> ARM64, x86_64, MIPS, etc) have a much higher range and default
> value of NR_CPUS.
>
> This patch increases NR_CPUS range to 2-512 and default value to
> XLEN (i.e. 32 for RV32 and 64 for RV64).
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
> Changes since v1:
>  - Updated NR_CPUS range to 2-512 which reflects maximum number of
>    CPUs supported by QEMU virt machine.
> ---
>  arch/riscv/Kconfig | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 5adcbd9b5e88..423ac17f598c 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -274,10 +274,11 @@ config SMP
>  	  If you don't know what to do here, say N.
>
>  config NR_CPUS
> -	int "Maximum number of CPUs (2-32)"
> -	range 2 32
> +	int "Maximum number of CPUs (2-512)"
> +	range 2 512
>  	depends on SMP
> -	default "8"
> +	default "32" if 32BIT
> +	default "64" if 64BIT
>
>  config HOTPLUG_CPU
>  	bool "Support for hot-pluggable CPUs"

I'm getting all sorts of boot issues with more than 32 CPUs, even on the 
latest QEMU master.  I'm not opposed to increasing the CPU count in 
theory, but if we're going to have a setting that goes up to a huge 
number it needs to at least boot.  I've got 64 host threads, so it 
shouldn't just be a scheduling thing.

If there was some hardware that actually boots on these I'd be happy to 
take it, but given that it's just QEMU I'd prefer to sort out the bugs 
first.  It's probably just latent bugs somewhere, but allowing users to 
turn on configs we know don't work just seems like the wrong way to go.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
