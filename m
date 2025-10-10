Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FBFCCA476
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 14:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SiEr2REQCLx/3gnWMnsr20gDN5aTNkAn1U9+KC5bguQ=; b=Di0S+O9sWckujp42jd7eJodpaJ
	jhTHvaRZ7+PwW53NfaiFY5BbsxF2/glz2qb1pMBqtYPz0bStLzRIP8MJzsLm53FojU1+OLIWn0BC7
	PtBnq9/4uDDFH9rHHXCYULuVExPVwUf/Zzu1UJL3bqqgsvv9J4MgwSl48A6OaL/+DA0tO28pf1Wiv
	GY1jEUagPOkif9NJtjTF9P6aEZuo9fHO0ulN36DKMwFbUYssQU22QDca9n2Usi4rbAeO6cIyeF1KN
	6qs1MmslWy55GnruBWTr4AtNp0LtteqRRPN4SckUNZLDlgeOowMqKbPZqRVegy1psIbgl84uzyv5E
	gUyyB3rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7DyW-00000008fST-0DfZ;
	Fri, 10 Oct 2025 14:20:04 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7DyS-00000008fRG-2Atr
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 14:20:02 +0000
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BE0D43F7D9
	for <linux-riscv@lists.infradead.org>; Fri, 10 Oct 2025 14:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1760105996;
	bh=wZFsc0cqoEjkO7gKnFRYSVcb3ZWZEOVIH/oA4k6SVYM=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=O2ZANWc1aJh9qDm0BsJ17JgUiBclSlvysh3FvJCtYCbKAykqYMx4tt7GvbmqcbuTQ
	 I08kPRRWzquYvVguPF+Ng7X9YKiDMrfyAr4BN6bvnHa1+KJBRelWWTpSOs3/fmpKy3
	 A7oxLH0dbkfuqCKjLJ8RZF17j/a9ZrthjXhgG9g9aYwWYGVfKdTwjQCEkOeKfRuoMH
	 tKgW1bkMy5pXdJRRg4S2nXnfUTEN7nvSgguq/1yhrfel562fI5h0unJxAlHQP4jSox
	 VoE8kGpEcTT0lxfNBEMGoLFccn2xxVm4Ty5LPN7roVeZ+L4E7GAqJRpkaaUQ8Ex343
	 ozd7TRPEUW8QvR/WpzGHOTTCEo6x+piSNb0roDl45KR/Xzxsc1z2CfN128X7ACMctT
	 Olh5pJ8o1QYlfwdz0ECBs3TWPRiydxdDLZYqrbhw9gd9PqIET1o2caVUXQgTFwITXs
	 7ET6tcu8kD4Frlo1ixdDycqAVHYABReaUeQBHFVemA0NaO40ivLXganoRb1T4gBcdm
	 7PC//u4zZmukDHipisZrbf7M6N0a1tOn0NCC4Bt1iV7QBDNyFGky8EwEriNnGevYPY
	 dUxkzcaLhAuShSRpUCRBBQvFvZXqGRahL4r8PJEVrJR+JX71Qq0tySeT8MF3OowdMT
	 OoSR9O3mgrf4NFT9WcKWR3sQ=
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-92ee22d4ba3so4493434241.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Oct 2025 07:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760105996; x=1760710796;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wZFsc0cqoEjkO7gKnFRYSVcb3ZWZEOVIH/oA4k6SVYM=;
        b=tplBMp0ZfygyCpe34s63C+37KXiI3ZL875nRxwM5km7UEU667kWqVOJZMZWNrpwueJ
         4Kl9F9/Ck3TMZdYJr06JrjmvK1Z9RJKbPuJ5GHZk3DTKg9fECHjmG0LN9hzeKiV8rwUH
         oY4zO6k6aqijA+uuCW27GPqh7RgcD39149JPCnwe0ChpHe4Q2EkaYiDN/Dn1hBumS/NB
         wSA/QTilvs+495DrysTR5IGaYC3TPJIK2AuTizAdLTIUlfpd832GYJqP/z7VnNcrLiKL
         1VdiLsNzmmSHlcJXQahCMB2U3jDHaxcrS38wNa/FtqJm4ZnN6/SvbE4x4GXbjfZTz5qJ
         aIAg==
X-Forwarded-Encrypted: i=1; AJvYcCVKhUcjgU06rTdre9r+wYa5ab7ZBs7rorbkvcQBzRMC3L1Z294HVx3kedIF7ShlWrDXvGsFv2jqUEF+gA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxyeijWlX+i0h9a8QhHsbFOAchdGCRHTn0PkZdHhCHhUGPNfUqg
	Np5b9Qr2tbi/Ufcpki950+wveNJyA77ufJF2ULWwOzt0Hu7LtL/TJ6E/0NbXN/mbF/hxUdY+DWG
	Wt5qHXjmRiBP0qNt+qeUrYKrCmBka6rH2d1yXKyXvjY/kQdty1F4RGK1BQ/Y5liQpjdhHSLECHx
	CVL4+nsrsHgu7jp9HsruXnmn/aG54zTMlslJ7E2+yjykcFJadSUykXomko65/W
X-Gm-Gg: ASbGncuoYL+atfGbnCe47uziQ4WqnArLxTTma5uorbMLWs5XUl5rI16ybUn60vuRlrc
	cgRDQ9VjH6JoBPvEWS6Pta1UKcUKO1IbGWWZyT2iPtFqmikC7MeDzADftB1vPKCdr2PSJ4avGnr
	DbcYtOjSiDm/YSrM+h1Bc=
X-Received: by 2002:a05:6102:290a:b0:5d5:f8df:8eeb with SMTP id ada2fe7eead31-5d5f8df90b1mr2375359137.24.1760105995651;
        Fri, 10 Oct 2025 07:19:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtJ5BK2Kci2VugCpCugcyMp0MfaVnQs+KUCQn6J+Waq0JOsbp/jIivsCDhg0pl1qZjDL6SXhAjfxWgLCXGQEQ=
X-Received: by 2002:a05:6102:290a:b0:5d5:f8df:8eeb with SMTP id
 ada2fe7eead31-5d5f8df90b1mr2375335137.24.1760105995272; Fri, 10 Oct 2025
 07:19:55 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Oct 2025 09:19:54 -0500
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Oct 2025 09:19:54 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20251009015839.3460231-18-samuel.holland@sifive.com>
References: <20251009015839.3460231-1-samuel.holland@sifive.com> <20251009015839.3460231-18-samuel.holland@sifive.com>
Mime-Version: 1.0
Date: Fri, 10 Oct 2025 09:19:54 -0500
X-Gm-Features: AS18NWBjDcHrw1s8RwyRjhr8EvaCuZc8XkxMvBfhsZ2PsGnZOM9VUAkh7k1guZY
Message-ID: <CAJM55Z_C_ce6wwCpNyGeozxBKW1krSrdzApvGumLn_p7K0hhYw@mail.gmail.com>
Subject: Re: [PATCH v2 17/18] riscv: dts: starfive: jh7100: Use physical
 memory ranges for DMA
To: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	Emil Renner Berthing <kernel@esmil.dk>, Andrew Morton <akpm@linux-foundation.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_072000_812878_D32E24C4 
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

Samuel Holland wrote:
> JH7100 provides a physical memory region which is a noncached alias of
> normal cacheable DRAM. Now that Linux can apply PMAs by selecting
> between aliases of a physical memory region, any page of DRAM can be
> marked as noncached for use with DMA, and the preallocated DMA pool is
> no longer needed. This allows portable kernels to boot on JH7100 boards.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
> Changes in v2:
>  - Move the JH7100 DT changes from jh7100-common.dtsi to jh7100.dtsi
>  - Keep RISCV_DMA_NONCOHERENT and RISCV_NONSTANDARD_CACHE_OPS selected
>
>  arch/riscv/Kconfig.errata                     | 19 ---------------
>  arch/riscv/Kconfig.socs                       |  2 ++
>  .../boot/dts/starfive/jh7100-common.dtsi      | 24 -------------------
>  arch/riscv/boot/dts/starfive/jh7100.dtsi      |  4 ++++
>  4 files changed, 6 insertions(+), 43 deletions(-)
>
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index e318119d570de..62700631a5c5d 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -53,25 +53,6 @@ config ERRATA_SIFIVE_CIP_1200
>
>  	  If you don't know what to do here, say "Y".
>
> -config ERRATA_STARFIVE_JH7100
> -	bool "StarFive JH7100 support"
> -	depends on ARCH_STARFIVE
> -	depends on !DMA_DIRECT_REMAP
> -	depends on NONPORTABLE
> -	select DMA_GLOBAL_POOL
> -	select RISCV_DMA_NONCOHERENT
> -	select RISCV_NONSTANDARD_CACHE_OPS
> -	select SIFIVE_CCACHE
> -	default n
> -	help
> -	  The StarFive JH7100 was a test chip for the JH7110 and has
> -	  caches that are non-coherent with respect to peripheral DMAs.
> -	  It was designed before the Zicbom extension so needs non-standard
> -	  cache operations through the SiFive cache controller.
> -
> -	  Say "Y" if you want to support the BeagleV Starlight and/or
> -	  StarFive VisionFive V1 boards.
> -
>  config ERRATA_THEAD
>  	bool "T-HEAD errata"
>  	depends on RISCV_ALTERNATIVE
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 848e7149e4435..a8950206fb750 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -50,6 +50,8 @@ config SOC_STARFIVE
>  	bool "StarFive SoCs"
>  	select PINCTRL
>  	select RESET_CONTROLLER
> +	select RISCV_DMA_NONCOHERENT
> +	select RISCV_NONSTANDARD_CACHE_OPS

Hi Samuel,

Thanks for working on this! I think you also need to select DMA_DIRECT_REMAP
here, otherwise devices complain that they can't allocate coherent memory at
all.

But even with that added it still doesn't work for me with 6.17 on the JH7100,
the sdcard isn't initialized properly, and I haven't figured out why yet. I
seem to remember your previous version did work though.

Plain 6.17:          https://esmil.dk/pma/upstream.txt
6.17 + this series:  https://esmil.dk/pma/test.txt

The kernel config I'm using is available here:
https://esmil.dk/pma/config.txt

/Emil

>  	select ARM_AMBA
>  	help
>  	  This enables support for StarFive SoC platform hardware.
> diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> index ae1a6aeb0aeaa..47d0cf55bfc02 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> @@ -42,30 +42,6 @@ led-ack {
>  		};
>  	};
>
> -	reserved-memory {
> -		#address-cells = <2>;
> -		#size-cells = <2>;
> -		ranges;
> -
> -		dma-reserved@fa000000 {
> -			reg = <0x0 0xfa000000 0x0 0x1000000>;
> -			no-map;
> -		};
> -
> -		linux,dma@107a000000 {
> -			compatible = "shared-dma-pool";
> -			reg = <0x10 0x7a000000 0x0 0x1000000>;
> -			no-map;
> -			linux,dma-default;
> -		};
> -	};
> -
> -	soc {
> -		dma-ranges = <0x00 0x80000000 0x00 0x80000000 0x00 0x7a000000>,
> -			     <0x00 0xfa000000 0x10 0x7a000000 0x00 0x01000000>,
> -			     <0x00 0xfb000000 0x00 0xfb000000 0x07 0x85000000>;
> -	};
> -
>  	wifi_pwrseq: wifi-pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  		reset-gpios = <&gpio 37 GPIO_ACTIVE_LOW>;
> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> index 7de0732b8eabe..34ff65d65ac7e 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> @@ -7,11 +7,15 @@
>  /dts-v1/;
>  #include <dt-bindings/clock/starfive-jh7100.h>
>  #include <dt-bindings/reset/starfive-jh7100.h>
> +#include <dt-bindings/riscv/physical-memory.h>
>
>  / {
>  	compatible = "starfive,jh7100";
>  	#address-cells = <2>;
>  	#size-cells = <2>;
> +	riscv,physical-memory-regions =
> +		<0x00 0x80000000 0x08 0x00000000 (PMA_RWXA | PMA_NONCOHERENT_MEMORY) 0x0>,
> +		<0x10 0x00000000 0x08 0x00000000 (PMA_RWX | PMA_NONCACHEABLE_MEMORY | PMR_ALIAS(1)) 0x0>;
>
>  	cpus: cpus {
>  		#address-cells = <1>;
> --
> 2.47.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
