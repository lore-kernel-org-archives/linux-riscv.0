Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68531C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 17:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XutqQGU0Fmb9S/qNyyzSWg5ALLEfwBlxU6l7w3MYGXw=; b=zy+5YV+oY5xB1i
	t+wWhp5rGBqXXaZVzGl735oRgP7B2PZHon+uaOPmeW22HM6r/VUYM7KirwU8jfMkL+6kXepBJ4OO+
	HxgMh/ckIpJ0XiOUQp+Ur08K4+mMcKMKlrzdW/hnYhIpa4oyE++ushHFA9dsnm6TPHp8wDDiqxQBI
	avoBc9Cn+2fpi78NRvnZS5OLWtsQ5DvLkeouwFMTRasLs7xGub7E9Lg1WAJdsZRfJfKfQ6WahqE5f
	ehMgyrSJUS6dYaHVX9DEVywPOU50yfTeA7mybAlOjZNQw8yVV5OoRhAp8vrs68vutGO/TNdwUyj7b
	HL+i7UNirSv0WRxpCkfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8kSm-00BSYk-2h;
	Thu, 30 Nov 2023 17:04:32 +0000
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r8kSl-00BSYN-0d;
	Thu, 30 Nov 2023 17:04:31 +0000
Message-ID: <7372f74b-ad5a-4545-9d48-b5eed9005557@infradead.org>
Date: Thu, 30 Nov 2023 09:04:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Nov 22 (riscv: DMA_GLOBAL_POOL)
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
References: <20231122145257.6f668afa@canb.auug.org.au>
 <24942b4d-d16a-463f-b39a-f9dfcb89d742@infradead.org>
 <20231130-mothproof-tripod-fe35364591ee@spud>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231130-mothproof-tripod-fe35364591ee@spud>
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



On 11/30/23 08:35, Conor Dooley wrote:
> On Wed, Nov 22, 2023 at 02:37:43PM -0800, Randy Dunlap wrote:
>>
>>
>> On 11/21/23 19:52, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20231121:
>>>
>>
>> on riscv 32-bit:
>>
>> WARNING: unmet direct dependencies detected for DMA_GLOBAL_POOL
>>   Depends on [n]: !ARCH_HAS_DMA_SET_UNCACHED [=n] && !DMA_DIRECT_REMAP [=y]
>>   Selected by [y]:
>>   - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y] && NONPORTABLE [=y] && RISCV_ALTERNATIVE [=y] && !RISCV_ISA_ZICBOM [=n] && RISCV_SBI [=y]
>>
>> WARNING: unmet direct dependencies detected for DMA_GLOBAL_POOL
>>   Depends on [n]: !ARCH_HAS_DMA_SET_UNCACHED [=n] && !DMA_DIRECT_REMAP [=y]
>>   Selected by [y]:
>>   - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y] && NONPORTABLE [=y] && RISCV_ALTERNATIVE [=y] && !RISCV_ISA_ZICBOM [=n] && RISCV_SBI [=y]
> 
> DMA_DIRECT_REMAP is selected by the T-HEAD CMO erratum.
> DMA_GLOBAL_POOL by the Andes CMO erratum.
> 
> We could do
> 
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index 0071864c2111..d8723fdf1e55 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -339,6 +339,7 @@ if RISCV
>  
>  config ARCH_R9A07G043
>  	bool "RISC-V Platform support for RZ/Five"
> +	depends on !DMA_DIRECT_REMAP
>  	depends on NONPORTABLE
>  	depends on RISCV_ALTERNATIVE
>  	depends on !RISCV_ISA_ZICBOM

OK, that works for me.

Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
