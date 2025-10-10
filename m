Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFADCCCA476
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 16:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O6GMJOgXZalGh210ycNl4rUKH0VCvJV3Wo3ly06b5AY=; b=PIsivoO4aC67rC
	UxbGwherhEkURWu3HOnRodJrXKHSAuHi3w/Daj89oetB7Sut76egLU85b03gT92ULFcXJr9Cb5UFS
	pRte5jPRlHvjDVHd7pXfesgWnerV5j++8+vAypF/QwNCU4Dy9Om8ujmicIxRcwkPrsJnsVgI34hI9
	IfsOmeIzHeiNa8tviccI1pz8+Gffqq7UO0HY3aPCLpj349j/1JJkzTgYEovPjcouG+Pm2l7EwdEAa
	r4FC+Iw8WOU3iGILlqLMEqXJh6fbV3QA3UTVda0MLeIEDnLE5QpkBwfAlKKn9Qpvzs3N89QIEicXQ
	g32lwaD41Wtev8iIEmVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GLB-00000008zdw-2aTK;
	Fri, 10 Oct 2025 16:51:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GLA-00000008zdm-0WB3
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 Oct 2025 16:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oEIgQBXV9GwQ/0dS70LI3mvqTg3PMZTKu+jR89lRS3I=; b=mJYUXgw9TaXNTKvTtyhu8e45Wv
	S8f9Vw8yD37OQcYei7UZE8MSUdGYmopHsbZLYBTGShwzgGGialul0eg5gp4H8M3PfsXu51ALVv2S0
	X/Qcsz9xW7JmkNS8MvsRRTbchJ7KOLxKZp0bIc2fsQYxweTjJYESbC9Tog1P/u1+K+FcXV2+Q2ZRL
	bAphkKkwk+t11YRVXdKWqt/3e7MtlwYq2ci7B20rzOs6bdu6X9ErGreCErwNgFMJZsQmU0Ksl1DXe
	ApNOL+j4ONDOChLPTzZxlJi6x8J/Q4yOGrRJTr0IO5vTU77jGEEDew2yS74Xfp1Ic/NhUIru/Oyer
	IS6Q/c4Q==;
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GL6-00000002IvJ-0SDS
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 16:51:34 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-90926724bceso205593539f.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Oct 2025 09:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760115089; x=1760719889; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oEIgQBXV9GwQ/0dS70LI3mvqTg3PMZTKu+jR89lRS3I=;
        b=gpvbwliztPaquH+TKxBv/nf3d0Zh6Tm9Jr8fP68Ku/zc3d9qxjaHKYwqYzp3bNszWs
         0egroUH9FCRE/GXt21nWtdKNYX9s5WkiKdfOnH2YnC4bHhrjpJPjHuYxquNwQ8ZxeyPU
         chBRZn11zqpF32gFJxYf+d9mdjTCPmCM+re+R7vi7i6abwxqvzXyl0FGwDDa6b7mqOQP
         kgk0F1aVFR3Y3/oqrJCgQoGi6JxYwb3xjfhBcytwEfySe9JckouMfpyozvWA0+38961x
         C7+3WVm0vKMwWFaNuVj/IAxKdjgPQ4owA/25/bdEt0x1lpk2s/Z45oNRdek+Prfu6LsP
         uqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760115089; x=1760719889;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oEIgQBXV9GwQ/0dS70LI3mvqTg3PMZTKu+jR89lRS3I=;
        b=J38BDWziNildPC9A7O9K0DpXtdDdpM4GId4VlpZ8HXnLVA02VNJE3e1TCclRjeoY/4
         R5g9X0hqZUUdlMnU+691tFXXi/BF2OXSPI1Z7WjTLfaxxX0xCT8r6deOIyvk9kYda+Tv
         iIoGkZFL6nKdBQ7tSm+5W7ZNbiYdkZ2JZ1UOpPFmIaVM7XteGSIE7Nl7l+jv03FWH5w1
         9cE/8AVuDEumvm73POLA3vD6kapjaAagugjwtPn6FI63fSvIC4kChDGAn7t+l/jiqPNZ
         ObbDTQYI/lI51LLvAPRniSFPiUW2NwKJibQjAQfYTA/kpWNQTByYOJjmq8LUiGZh7Cnl
         +Qpw==
X-Forwarded-Encrypted: i=1; AJvYcCU8V8ffuo4d1vI4OmQknCdU9/jmY3AtjtQfmRvkZ1v10iTwJkyr16k2No9RZ9t+0dAiP7DjRCwbyzwSNw==@lists.infradead.org
X-Gm-Message-State: AOJu0YysIAk+2AJtaSqEONaWphRisv+kevFYNRDzGErqBat6gQWPBq/5
	nm/NfU9bzODmwubO2pCgR5nzEBzvjj7Lcti4Ezj442ZJcXU6eyzsJm1Ly++AHVsrs7k=
X-Gm-Gg: ASbGncvtZc05A+6CxXxhu8ixY5L31F3lZI58JnBxNYalNE676UAl8wKzynbTGMIjlwm
	RgA21K9JYhx6nXw/+vQRz2zQ/4QiOjQgiiojKW2b76CR9AFJgbFi6xU3/pAYnZdChSY2lmz0nwA
	PDMlDa6+FlLBrfNBFs0XFW8gmL4f8qGOZwcYJGCE1oWRBki4ym19wZo8r44gYXsBPSdTEyjMxvz
	cinUZahkw0HnFCINBECbZVJg4BN3Il2AY9Q7uOoDJ1cyT1IjpIJ+oCIx7IOoD0K83CWKQI9l9Qz
	6KsV24KchQkfs8AlnRKO7W/xQ5THz7u9oIoCNOlmVnElktncD2cHtvgYXz8DMr7a7+BgCTZVM+b
	/C3qh6dX7z+l25DjPkw5WhqZ3WV2DO9j0I9xFYCxu8g==
X-Google-Smtp-Source: AGHT+IE3jpt/o7GLJZwpn6pE5MwHXBbBbWmYCLc2vN2apcU0MOIuhKG3h3YETs47jD8aWS8NvxasSQ==
X-Received: by 2002:a05:6602:6013:b0:8ef:d0e4:43d8 with SMTP id ca18e2360f4ac-93bd186600dmr1560312839f.3.1760115089131;
        Fri, 10 Oct 2025 09:51:29 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.207])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-93e25a95cbbsm111538339f.22.2025.10.10.09.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 09:51:28 -0700 (PDT)
Message-ID: <53f717fb-b79e-49e0-9c1d-cf626b9a99b0@sifive.com>
Date: Fri, 10 Oct 2025 11:51:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/18] riscv: dts: starfive: jh7100: Use physical
 memory ranges for DMA
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Conor Dooley <conor@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Emil Renner Berthing <kernel@esmil.dk>,
 Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20251009015839.3460231-1-samuel.holland@sifive.com>
 <20251009015839.3460231-18-samuel.holland@sifive.com>
 <CAJM55Z_C_ce6wwCpNyGeozxBKW1krSrdzApvGumLn_p7K0hhYw@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <CAJM55Z_C_ce6wwCpNyGeozxBKW1krSrdzApvGumLn_p7K0hhYw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_175132_344837_1DABC9B3 
X-CRM114-Status: GOOD (  28.76  )
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

Hi Emil,

On 2025-10-10 9:19 AM, Emil Renner Berthing wrote:
> Samuel Holland wrote:
>> JH7100 provides a physical memory region which is a noncached alias of
>> normal cacheable DRAM. Now that Linux can apply PMAs by selecting
>> between aliases of a physical memory region, any page of DRAM can be
>> marked as noncached for use with DMA, and the preallocated DMA pool is
>> no longer needed. This allows portable kernels to boot on JH7100 boards.
>>
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>>
>> Changes in v2:
>>  - Move the JH7100 DT changes from jh7100-common.dtsi to jh7100.dtsi
>>  - Keep RISCV_DMA_NONCOHERENT and RISCV_NONSTANDARD_CACHE_OPS selected
>>
>>  arch/riscv/Kconfig.errata                     | 19 ---------------
>>  arch/riscv/Kconfig.socs                       |  2 ++
>>  .../boot/dts/starfive/jh7100-common.dtsi      | 24 -------------------
>>  arch/riscv/boot/dts/starfive/jh7100.dtsi      |  4 ++++
>>  4 files changed, 6 insertions(+), 43 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
>> index e318119d570de..62700631a5c5d 100644
>> --- a/arch/riscv/Kconfig.errata
>> +++ b/arch/riscv/Kconfig.errata
>> @@ -53,25 +53,6 @@ config ERRATA_SIFIVE_CIP_1200
>>
>>  	  If you don't know what to do here, say "Y".
>>
>> -config ERRATA_STARFIVE_JH7100
>> -	bool "StarFive JH7100 support"
>> -	depends on ARCH_STARFIVE
>> -	depends on !DMA_DIRECT_REMAP
>> -	depends on NONPORTABLE
>> -	select DMA_GLOBAL_POOL
>> -	select RISCV_DMA_NONCOHERENT
>> -	select RISCV_NONSTANDARD_CACHE_OPS
>> -	select SIFIVE_CCACHE
>> -	default n
>> -	help
>> -	  The StarFive JH7100 was a test chip for the JH7110 and has
>> -	  caches that are non-coherent with respect to peripheral DMAs.
>> -	  It was designed before the Zicbom extension so needs non-standard
>> -	  cache operations through the SiFive cache controller.
>> -
>> -	  Say "Y" if you want to support the BeagleV Starlight and/or
>> -	  StarFive VisionFive V1 boards.
>> -
>>  config ERRATA_THEAD
>>  	bool "T-HEAD errata"
>>  	depends on RISCV_ALTERNATIVE
>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>> index 848e7149e4435..a8950206fb750 100644
>> --- a/arch/riscv/Kconfig.socs
>> +++ b/arch/riscv/Kconfig.socs
>> @@ -50,6 +50,8 @@ config SOC_STARFIVE
>>  	bool "StarFive SoCs"
>>  	select PINCTRL
>>  	select RESET_CONTROLLER
>> +	select RISCV_DMA_NONCOHERENT
>> +	select RISCV_NONSTANDARD_CACHE_OPS
> 
> Hi Samuel,
> 
> Thanks for working on this! I think you also need to select DMA_DIRECT_REMAP
> here, otherwise devices complain that they can't allocate coherent memory at
> all.

It looks like the logic for selecting DMA_DIRECT_REMAP is all messed up.
Currently it's selected by RISCV_ISA_ZICBOM and ERRATA_THEAD_CMO, but really it
has nothing to do with CMOs and everything to do with being able to allocate and
map coherent pages. So it should be selected by the three PBMT options instead.
I'll fix this in v3. I didn't notice because I always had RISCV_ISA_ZICBOM enabled.

> But even with that added it still doesn't work for me with 6.17 on the JH7100,
> the sdcard isn't initialized properly, and I haven't figured out why yet. I
> seem to remember your previous version did work though.
> 
> Plain 6.17:          https://esmil.dk/pma/upstream.txt
> 6.17 + this series:  https://esmil.dk/pma/test.txt
> 
> The kernel config I'm using is available here:
> https://esmil.dk/pma/config.txt

There's a bug in this DT patch (see below). If that still doesn't work, please
ping me and I can help debug. I will also have access to a JH7100 board within
the next few days, so I will be able to test this SoC locally before sending v3.

Thanks,
Samuel

>>  	select ARM_AMBA
>>  	help
>>  	  This enables support for StarFive SoC platform hardware.
>> diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
>> index ae1a6aeb0aeaa..47d0cf55bfc02 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
>> @@ -42,30 +42,6 @@ led-ack {
>>  		};
>>  	};
>>
>> -	reserved-memory {
>> -		#address-cells = <2>;
>> -		#size-cells = <2>;
>> -		ranges;
>> -
>> -		dma-reserved@fa000000 {
>> -			reg = <0x0 0xfa000000 0x0 0x1000000>;
>> -			no-map;
>> -		};
>> -
>> -		linux,dma@107a000000 {
>> -			compatible = "shared-dma-pool";
>> -			reg = <0x10 0x7a000000 0x0 0x1000000>;
>> -			no-map;
>> -			linux,dma-default;
>> -		};
>> -	};
>> -
>> -	soc {
>> -		dma-ranges = <0x00 0x80000000 0x00 0x80000000 0x00 0x7a000000>,
>> -			     <0x00 0xfa000000 0x10 0x7a000000 0x00 0x01000000>,
>> -			     <0x00 0xfb000000 0x00 0xfb000000 0x07 0x85000000>;
>> -	};
>> -
>>  	wifi_pwrseq: wifi-pwrseq {
>>  		compatible = "mmc-pwrseq-simple";
>>  		reset-gpios = <&gpio 37 GPIO_ACTIVE_LOW>;
>> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
>> index 7de0732b8eabe..34ff65d65ac7e 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
>> @@ -7,11 +7,15 @@
>>  /dts-v1/;
>>  #include <dt-bindings/clock/starfive-jh7100.h>
>>  #include <dt-bindings/reset/starfive-jh7100.h>
>> +#include <dt-bindings/riscv/physical-memory.h>
>>
>>  / {
>>  	compatible = "starfive,jh7100";
>>  	#address-cells = <2>;
>>  	#size-cells = <2>;
>> +	riscv,physical-memory-regions =
>> +		<0x00 0x80000000 0x08 0x00000000 (PMA_RWXA | PMA_NONCOHERENT_MEMORY) 0x0>,
>> +		<0x10 0x00000000 0x08 0x00000000 (PMA_RWX | PMA_NONCACHEABLE_MEMORY | PMR_ALIAS(1)) 0x0>;

This should be PMR_ALIAS(0), because I removed the special entry from the
beginning of this list.

>>
>>  	cpus: cpus {
>>  		#address-cells = <1>;
>> --
>> 2.47.2
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
