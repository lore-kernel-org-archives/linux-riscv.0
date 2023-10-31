Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07F9C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 14:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3LDcSwF03j0dY63NWh5rGzGcIJb3yZ43qsr+3Wcf1QE=; b=QhFm4YBxVtoqDPSH00FWM9V0CA
	tkGAJ+S5ytJbLa14itEM5stqA8WI9eoHRUW57EhLT+WGno2vDNItZTXVQu6HWb54M5hIMVordlfka
	VPoj2NOoARnfD6DX/qK53eaWEDESoczRnd8mFPloeZOLJcnlclUCByxj7oUifaiIHNChHdpF2XFmu
	3/IJwQBkl3e3HXC/3+Hod8Lid3kPtMg7Q/KfbxIi+tfamlgIflCd6rFKSKUen10+R5ZVOjW11wTDF
	uQbqFKRKvPJ6sE12ue9TgU/yTJTfKnPtXlCvSE3dAsTb6NONH+jauFZ+fMN2o4OcK2aRaFRGxGXSY
	c/mwIK7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxpvq-005SLz-2O;
	Tue, 31 Oct 2023 14:41:26 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxpvn-005SJs-1R
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 14:41:25 +0000
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CDD5D3F19A
	for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 14:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698763279;
	bh=bM2sMwP6Emxus/eSEbKlChfhnru0P5WYRen9BWIIMG8=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=aXwrMohxFnEgfP+859FPEdzgUlym/+bSMQzjbbhTNITUDdw6NMdKKYOic1Jtwhn2S
	 b+hlVk/FpPcY2yIY/5ZgI49Z7FH7j1TB/CT8lTUzq/FW61moAsAQqsXawNsVrC0oMM
	 9dJwarAWm35DBGaWQ74FSaiGvQUN898PuqP0U8OuGP7PaFDjAE/s4fATwyTSwKieNG
	 5jlfV+MWkDCF4OKN7IomMBezzYNq//WpW2xD1BobI5Xy051XnhHzMUSu0/wHPddQ++
	 NGbXfkse32YTSiPJSdviyk1/ipjyM41+j624GFElWzAvEU3ujxBP9BilPwl4aps7Fr
	 aJmcmccUquxjQ==
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-67445c67d5dso15280606d6.2
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 07:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698763278; x=1699368078;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bM2sMwP6Emxus/eSEbKlChfhnru0P5WYRen9BWIIMG8=;
        b=Uh+jLYfqRznQyaYR0cxAbUoSzGpHaaMM6c4ZiFH7a2G66ncQgFOJ6BHTMyqEdAS0EG
         VjiiRDXtJ5ZtN2MpBSKAdVRLbd+xXs9ddJPMwxsOHRNvgzEx4ZHLHwuLeJ97dniPawEI
         LOSlRLsu5uyXyj9hlob7RM19MtE2uozfApj79mYYJmi/TwHEXTcxnXIOyyhKMj+t8xM5
         s17CURlJKC63BSJjta9MnQ/5p+VGa3S+vQuzjMd3l4z9sfFfh5ob/cAUgVd8IaEXp3G7
         ZMGPz+AWE1cyyWInHHQwCD3p+uHSK68Txf8DKBUzSMwB070n0hvX8YzTtA7klHk9WQgJ
         50Sw==
X-Gm-Message-State: AOJu0Yw+OQM33UP84dQOb3hj1kbMIkKJ67dR0U/yU+Ekg0p88eixg7DH
	MspWNNJbRK+cSkMlxvItA9BNxy3lsYO4KgwN8ds6+oV28fJ4eHEWbkeFAf1REoOPpiEWp/1Z8vL
	GK2z7dUCKoHMz4nvtmTW+w0SAjCR2/QkFpuaUdsxqLn8jxGLpwYrIloQuZcz6Bg==
X-Received: by 2002:a05:6870:1b16:b0:1ef:d51b:5f50 with SMTP id hl22-20020a0568701b1600b001efd51b5f50mr7603591oab.22.1698763257487;
        Tue, 31 Oct 2023 07:40:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFANyRAH1nXo4IUkrqN1HKuYxzfESQEmdy7ahALAdU7wdendE3vJG+CITZSdHBFI/mTHqrjKI5/+mlEUc3+Ggo=
X-Received: by 2002:a05:6870:1b16:b0:1ef:d51b:5f50 with SMTP id
 hl22-20020a0568701b1600b001efd51b5f50mr7603564oab.22.1698763257269; Tue, 31
 Oct 2023 07:40:57 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 31 Oct 2023 07:40:56 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231029042712.520010-9-cristian.ciocaltea@collabora.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com> <20231029042712.520010-9-cristian.ciocaltea@collabora.com>
Mime-Version: 1.0
Date: Tue, 31 Oct 2023 07:40:56 -0700
Message-ID: <CAJM55Z_2hdsvw8gdYLs2kZbRrH6xcM6+xCZn8BCf5zsWYyhY3w@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] riscv: dts: starfive: Add pool for coherent DMA
 memory on JH7100 boards
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Samin Guo <samin.guo@starfivetech.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_074123_790171_67DC68F1 
X-CRM114-Status: GOOD (  17.57  )
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

Cristian Ciocaltea wrote:
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>
> The StarFive JH7100 SoC has non-coherent device DMAs, but most drivers
> expect to be able to allocate coherent memory for DMA descriptors and
> such. However on the JH7100 DDR memory appears twice in the physical
> memory map, once cached and once uncached:
>
>   0x00_8000_0000 - 0x08_7fff_ffff : Off chip DDR memory, cached
>   0x10_0000_0000 - 0x17_ffff_ffff : Off chip DDR memory, uncached
>
> To use this uncached region we create a global DMA memory pool there and
> reserve the corresponding area in the cached region.
>
> However the uncached region is fully above the 32bit address limit, so add
> a dma-ranges map so the DMA address used for peripherals is still in the
> regular cached region below the limit.

Adding these nodes to the device tree won't actually do anything without
enabling CONFIG_DMA_GLOBAL_POOL as is done here:

https://github.com/esmil/linux/commit/e14ad9ff67fd51dcc76415d4cc7f3a30ffcba379

>
> Link: https://github.com/starfive-tech/JH7100_Docs/blob/main/JH7100%20Data%20Sheet%20V01.01.04-EN%20(4-21-2021).pdf
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  .../boot/dts/starfive/jh7100-common.dtsi      | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> index b93ce351a90f..504c73f01f14 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> @@ -39,6 +39,30 @@ led-ack {
>  			label = "ack";
>  		};
>  	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		dma-reserved {
> +			reg = <0x0 0xfa000000 0x0 0x1000000>;
> +			no-map;
> +		};
> +
> +		linux,dma {
> +			compatible = "shared-dma-pool";
> +			reg = <0x10 0x7a000000 0x0 0x1000000>;
> +			no-map;
> +			linux,dma-default;
> +		};
> +	};
> +
> +	soc {
> +		dma-ranges = <0x00 0x80000000 0x00 0x80000000 0x00 0x7a000000>,
> +			     <0x00 0xfa000000 0x10 0x7a000000 0x00 0x01000000>,
> +			     <0x00 0xfb000000 0x00 0xfb000000 0x07 0x85000000>;
> +	};
>  };
>
>  &gpio {
> --
> 2.42.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
