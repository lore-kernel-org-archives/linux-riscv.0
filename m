Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC9AC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 07:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FKzaf+cPKFxEkCU0S0VUD2thhFF9UHw8ZS02sKheELA=; b=3NS9Ij8izbPFhr
	9PVequE0s8VxIj7SiFuvOIA6E3l9K8QBE8MfKyClLEIiH4frksopdbXgXEsln8n3hseXhiztr3iwT
	zOfDlecfI7f3ACKCSAu3wkj+cLPP/KnaiI2wIw/nRkoOHshwbKIsH1Yhhz0aARVWsQ0Z9Glawf5nj
	uO74gCd/rwRmgQ4A9IonPh4CCs59lCIrTRXmjtftYEiEvo/WcnoZjF1F1bwiEO6nJ17ixdFBiiTV8
	2K0JLxYvKopLLIRPPeO4bN8l4CNQ1j4TWdmj8VKfZrY01SEEcXXVAdt1pR3SHtTiPZKdSXSTE0Br2
	AF7C+VDB5d4Izi9VAyCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhQsC-00BwO8-RB; Thu, 21 Apr 2022 07:05:04 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhQs9-00BwMI-U5
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 07:05:03 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8A2213F1BA
 for <linux-riscv@lists.infradead.org>; Thu, 21 Apr 2022 07:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1650524697;
 bh=6HdSC5MBPOMufV6HBiKEeWBhFc9GPRC0t6FN09g0Ni0=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=Cw2hKVUc6XGwBB+Gjih/0VWVNIVc7Dp0qKge0i9JpzERau/+WbW88f6qq58S2RJlD
 3qjXktxUjy4B2y60soDW/Kkm1I8bU2kHWTAYO0F69gAIN3Mk44KWa/kF5CVwulr1Et
 FJfPUQ/jqGSBAqCj8ClZAzT9Ln3uI8qBQ8JMRWCIrKOY6q3aw0VNcnWOI7mwC767/J
 JdnC0xjrZxEgeQedGIW3bEULykCJBPFYsPSxCeJ0Y/MdUg0RcKSit9bSuufsNWSh4H
 jl9EtmHZKmzej+6HXTvx6dW8k3iDYXkOIIsYltEM2o8RBXqKjgCBsoHyGyuvtltfaA
 p6krUlgwd9e5w==
Received: by mail-ej1-f72.google.com with SMTP id
 jg25-20020a170907971900b006f010192c19so1288425ejc.21
 for <linux-riscv@lists.infradead.org>; Thu, 21 Apr 2022 00:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6HdSC5MBPOMufV6HBiKEeWBhFc9GPRC0t6FN09g0Ni0=;
 b=3EgO+j92KwfeIxnNzFHROao1yLQHt3qknFyH2ElOZiruuXhZvLFgXnDcBoIwKCS1ge
 HoXpf9hpX/G2+GDIU1LYBya3Rn+I+Kozo/uwSFyWIxYYXksQ7IfrdLkrjr9bSfONQXgL
 URPzBV0QSz17aVMUCQkm3Ox9BFmdtK6gFo3+4PMEOQi9AHkVNr7qZS8fSWTrtTUYQFZq
 kqAqL7QY94xhUTyRSE6HNt11JZKD2b0IxOP7X+RmynrEOKB0oFGEzkM//p3AumYi4m7t
 eZhK86raUqKS8MVbkO7nh/9NNMp8aLdw92FlOeWV80Z0fUnaNnOxZDiyFso0DvOngPWS
 2naA==
X-Gm-Message-State: AOAM533rIKSH1gpq02Dr1dfEoFAxzhF0zSg/zMvq6hFaR6pUImnKdLi3
 NE9p/Dyo08Iaup+OixrKkjVLDYsQYoPo0mMnRIBZsCyz1LquEP+A5P+FtH4KmPXIXd9isU25iZl
 rDKtUm2qI9I+x+9ovIU81bBqj7kTQz/5xTv/8z/PpUIvy6Q==
X-Received: by 2002:a17:906:5d04:b0:6db:7262:570e with SMTP id
 g4-20020a1709065d0400b006db7262570emr21773801ejt.8.1650524697228; 
 Thu, 21 Apr 2022 00:04:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynJjrtS0hF16SVmG5l/ZQENi4TBpgJyFKjQc4HjrAuWcJ+5tpAdnARz6DxwRaPkxDgvSHyjw==
X-Received: by 2002:a17:906:5d04:b0:6db:7262:570e with SMTP id
 g4-20020a1709065d0400b006db7262570emr21773783ejt.8.1650524697000; 
 Thu, 21 Apr 2022 00:04:57 -0700 (PDT)
Received: from [192.168.123.94] (ip-088-152-144-107.um26.pools.vodafone-ip.de.
 [88.152.144.107]) by smtp.gmail.com with ESMTPSA id
 kb28-20020a1709070f9c00b006d5d8bf1b72sm7465162ejc.78.2022.04.21.00.04.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 00:04:56 -0700 (PDT)
Message-ID: <3fa5215b-84c3-5e4c-cb53-6c05d05e4350@canonical.com>
Date: Thu, 21 Apr 2022 09:04:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3] RISC-V: Increase range and default value of NR_CPUS
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel
 <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220420112408.155561-1-apatel@ventanamicro.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20220420112408.155561-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_000502_298358_912F5DB1 
X-CRM114-Status: GOOD (  20.03  )
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



On 4/20/22 13:24, Anup Patel wrote:
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

Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

> ---
> Changes since v2:
>   - Rebased on Linux-5.18-rc3
>   - Use a different range when SBI v0.1 is enabled
> Changes since v1:
>   - Updated NR_CPUS range to 2-512 which reflects maximum number of
>     CPUs supported by QEMU virt machine.
> ---
>   arch/riscv/Kconfig | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 00fd9c548f26..1823f281069f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -275,10 +275,13 @@ config SMP
>   	  If you don't know what to do here, say N.
>   
>   config NR_CPUS
> -	int "Maximum number of CPUs (2-32)"
> -	range 2 32
> +	int "Maximum number of CPUs (2-512)"
>   	depends on SMP
> -	default "8"
> +	range 2 512 if !SBI_V01
> +	range 2 32 if SBI_V01 && 32BIT
> +	range 2 64 if SBI_V01 && 64BIT
> +	default "32" if 32BIT
> +	default "64" if 64BIT
>   
>   config HOTPLUG_CPU
>   	bool "Support for hot-pluggable CPUs"

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
