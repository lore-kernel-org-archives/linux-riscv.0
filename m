Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3527C54798
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 23:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bIa/sMyvUe96VRuMUj44sYme081XryrDnO3URG4Kido=; b=WygALIPc1WQdtt
	s6OkKwdJVfUchWCy7XqKDCKRDr3ZxLyz99/bc4x4zrcgnLtd1x0QaRfeMCSFGCBgMGADpsKCkwyM+
	jAapczuVCCd1PGA3N79YnzNrJ6xj1jqmrH4Xe2rr9HOGLMDitwFuEn9GNGN/GdSmiNMPZgoeMGpuy
	20p0UTgzlUtHK4hNmKSw597OwrJMZKOBkbmlVIGXN8bpfunJ90jWHEnhqVraqUB1+GbdL8nfWW63Y
	qPIRDJLQJZ/ihcB0Nu5iLVW+aI3PLLkPacvDcO6hDSDuNqmrKl0bO1dswe9Rj12DG3+lJRUH4BART
	ELw0/BsK2x1Q9mSkXMQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhegV-0000000FgjY-33zd;
	Tue, 05 Mar 2024 23:58:59 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhegS-0000000FgiE-0Iga
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 23:58:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A66CFCE1F1D;
	Tue,  5 Mar 2024 23:58:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D0CC433C7;
	Tue,  5 Mar 2024 23:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709683132;
	bh=4m3UYcXB+SiijSFEXT4aO9oLM2P/SBGwSBd5v733kis=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TkKw9JSKB5H6BhFodbbUblRTJv/WG01QKKMY8DWwWA1Zg661jA6QWfSi5DcgZ5CYY
	 gOqtfC6yzNgqsHKVFS/DrSaEzC0hg899TWegmtszDWoeUJvTw6YyMUOHEBsrQL05Bt
	 +od0e/wmluRxRknht3ZPQ3NMAFn87ba2oR8dROdgS8m0f1Ux9/Hrn1S8nNIUdI3wgr
	 XQwFyZcRswsjwAlnDXBBNtCfDgF1FI1i52RxFSzK98bey37mXJ9ahEH1eaupPZ0W+3
	 xXnyRvOfKgN9WCKWXT7LGcwY6QE4vlkmRba3HS5X36qjoyynC90RMonbnx0a8CuveJ
	 W2aqQZ3cTSvqA==
Message-ID: <311bdf17-c16f-41d8-8366-10f9b00adf27@kernel.org>
Date: Wed, 6 Mar 2024 08:58:49 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] riscv: Kconfig.socs: Allow SOC_CANAAN with MMU for
 K230
To: Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
 <tencent_0432DA968E39B81431F921F38D747C008208@qq.com>
 <ef8df22f-dac8-4652-bf17-d10254e6abfb@kernel.org>
 <tencent_E56A833916E00EC7B4840C34FAF1250ADE0A@qq.com>
 <20240305-fascism-enrich-06483ddeb149@spud>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240305-fascism-enrich-06483ddeb149@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_155856_493872_67DCE9DE 
X-CRM114-Status: GOOD (  19.33  )
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

On 3/6/24 02:20, Conor Dooley wrote:
> On Tue, Mar 05, 2024 at 03:47:15PM +0800, Yangyu Chen wrote:
>> On 2024/3/5 07:46, Damien Le Moal wrote:
>>> On 3/5/24 06:05, Yangyu Chen wrote:
>>>> Since K230 was released, SOC_CANAAN is no longer only referred to the K210.
>>>> Remove it depends on !MMU will allow building dts for K230 and remove the
>>>> K210 string from the help message.
>>>>
>>>> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
>>>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>>>> ---
>>>>   arch/riscv/Kconfig.socs | 5 ++---
>>>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>>>> index 623de5f8a208..b4e9b7f75510 100644
>>>> --- a/arch/riscv/Kconfig.socs
>>>> +++ b/arch/riscv/Kconfig.socs
>>>> @@ -75,13 +75,12 @@ config ARCH_CANAAN
>>>>   	def_bool SOC_CANAAN
>>>>   config SOC_CANAAN
>>>> -	bool "Canaan Kendryte K210 SoC"
>>>> -	depends on !MMU
>>>
>>> This seems wrong to me. The k210 support does require no-mmu. So why remove
>>> this ?
>>
>> It just allows SOC_CANAAN to be selected when MMU=y. With this patch,
>> nommu_k210_defconfig still works.
> 
> I think the concern here is that this would allow people to build a
> kernel for the k120 with the MMU enabled, not that the existing nommu
> build will be affected.

Yes, this is my concern. Apologies for the lack of clarity.

> 
> Maybe you could squash in something like the following?
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index b4e9b7f75510..75d55059163f 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -72,15 +72,19 @@ config SOC_VIRT
>  	  This enables support for QEMU Virt Machine.
>  
>  config ARCH_CANAAN
> -	def_bool SOC_CANAAN
> +	bool "Canaan Kendryte SoCs"
> +	help
> +	  This enables support for Canaan Kendryte SoC platform hardware.
>  
>  config SOC_CANAAN
> -	bool "Canaan Kendryte SoC"
> +	bool "Canaan Kendryte K210 SoC"
> +	depends on !MMU
> +	depends on ARCH_CANAAN
>  	select CLINT_TIMER if RISCV_M_MODE
>  	select ARCH_HAS_RESET_CONTROLLER
>  	select PINCTRL
>  	select COMMON_CLK
>  	help
> -	  This enables support for Canaan Kendryte SoC platform hardware.
> +	  This enables support for Canaan Kendryte K210 SoC platform hardware.
>  
>  endmenu # "SoC selection"
> 
> (Which reminds me, I really need to go and finish sorting out the ARCH_
> stuff)

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
