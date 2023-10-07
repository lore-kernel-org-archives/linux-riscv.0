Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A39E95A63
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 16:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sgefPTtQqKGP+cTYg0QWBJ4VZMMinyVn+tpdkh5bTKU=; b=cBnnSBBSN60uoi
	SdpXnCnGwmxCh6bSCxzW1TTlrZ5RVlGno+BkGeRZdmvHNoj9CZ69IkriKUD/NTpuJp1CPysRtzQqg
	xuYlGrLu64inKGWsY9G3izM81etDnj3bRcV5pWDeP0LtpBNzv5hQ3DzlyNUJEob3FtDvE9Ww1Aw/I
	WrOT8RspMvzG1KX0Zc0xnXxGPxPS/qKxgBpKyHwIWN5DIj/BqQ7K6RDddbquv5E3pivLNLKy3hmUi
	51SLdwIz1hlmRE50MrCwmKczkr4PnGkhWEn6CLAuqR6oppHckZNZVCU3CIn3zqKDcL54vgqLDnPaa
	bIsnwkbxtq2b4l4nWowg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp9p7-007iOi-2i;
	Sat, 07 Oct 2023 16:06:37 +0000
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qp9p5-007iOO-00;
	Sat, 07 Oct 2023 16:06:35 +0000
Message-ID: <ff4bbd33-e494-4db2-93e2-59d1a866d7cf@infradead.org>
Date: Sat, 7 Oct 2023 09:06:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Oct 6 (riscv: andes)
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20231006153809.2054a0f8@canb.auug.org.au>
 <09a6b0f0-76a1-45e3-ab52-329c47393d1d@infradead.org>
 <20231007-poach-refute-b84fe5b7431a@spud>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231007-poach-refute-b84fe5b7431a@spud>
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

Hi Conor,

On 10/7/23 03:56, Conor Dooley wrote:
> On Fri, Oct 06, 2023 at 05:28:27PM -0700, Randy Dunlap wrote:
>>
>>
>> On 10/5/23 21:38, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20231005:
>>>
>>
>> on riscv 64bit:
>>
>> WARNING: unmet direct dependencies detected for ERRATA_ANDES
>>   Depends on [n]: RISCV_ALTERNATIVE [=n] && RISCV_SBI [=y]
>>   Selected by [y]:
>>   - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y] && NONPORTABLE [=y] && RISCV_SBI [=y]
>>
>> ../arch/riscv/errata/andes/errata.c:59:54: warning: 'struct alt_entry' declared inside parameter list will not be visible outside of this definition or declaration
>>    59 | void __init_or_module andes_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
>>       |                                                      ^~~~~~~~~
>>
>>
>> Full randconfig file is attached.
> 
> Riiight. XIP_KERNEL is enabled, which means no alternatives are
> permitted, but that R9A config option selects the Andes errata, which in
> turn depends on alternatives.
> 
> I suppose we could do something like (untested):
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index 7b74de732718..6fe85255e2ce 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -343,7 +343,7 @@ config ARCH_R9A07G043
>         select ARCH_RZG2L
>         select AX45MP_L2_CACHE if RISCV_DMA_NONCOHERENT
>         select DMA_GLOBAL_POOL
> -       select ERRATA_ANDES if RISCV_SBI
> +       select ERRATA_ANDES if (RISCV_SBI & RISCV_ALTERNATIVE)

s/&/&&/ and then this works. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

>         select ERRATA_ANDES_CMO if ERRATA_ANDES
>         help
>           This enables support for the Renesas RZ/Five SoC.

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
