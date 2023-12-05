Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF95C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 17:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YqJYLYvW2KybYFw6j5//qydaZHtT4u5g6t0K0c99a1s=; b=XsLTSs887xOnAz
	5Kpv/JCCXrpCZjr6F7LP0k4fDVlcyhZnsZIuvEaFIPXbxwZ4uDHZWTffoMSfc11EalPrCMqe5eGu6
	tEvvoc+0reofjMB69JuiIya2M18o4ybJzsWCudrmJMkpDap2AC+aLQTh3qI1it5QP8+HtHBwAt9+c
	iN574FBcSXc8Vto3NdBdWu8LQNZqeoN0gdonB7lEIcDqpbfP0gnWJ1XctCUdtlHGmH/nGs0IujcYv
	usgOcYa+HtIWhb9niAZ/iwlPU0ddIuunq4UJ5m2fw6f+XzPzhf3tWy0v72hWD4emm7TBDNJESlFI3
	WPXUHjMysRmGQZmBIR3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAYuY-007zpP-1v;
	Tue, 05 Dec 2023 17:08:42 +0000
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rAYuW-007zp0-1J;
	Tue, 05 Dec 2023 17:08:40 +0000
Message-ID: <5f9f018a-dc4f-42f0-ba90-2f44d2f61a7c@infradead.org>
Date: Tue, 5 Dec 2023 09:08:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv, crash: don't export some symbols when
 CONFIG_MMU=n
Content-Language: en-US
To: Baoquan He <bhe@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, akpm@linux-foundation.org,
 ignat@cloudflare.com, linux-next@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kexec@lists.infradead.org, eric_devolder@yahoo.com
References: <ZW00/Cfk47Cc3kGo@MiWiFi-R3L-srv>
 <ZW03ODUKGGhP1ZGU@MiWiFi-R3L-srv>
 <694baf13-65d0-4877-b6c7-56e3006f83be@infradead.org>
 <ZW7OsX4zQRA3mO4+@MiWiFi-R3L-srv>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ZW7OsX4zQRA3mO4+@MiWiFi-R3L-srv>
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



On 12/4/23 23:18, Baoquan He wrote:
> On 12/04/23 at 11:14am, Randy Dunlap wrote:

[]

>>
>> Both riscv 32-bit and 64-bit complain:
>>
>> ../arch/riscv/kernel/crash_core.c: In function 'arch_crash_save_vmcoreinfo':
>> ../arch/riscv/kernel/crash_core.c:11:58: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'int' [-Wformat=]
>>    11 |         vmcoreinfo_append_str("NUMBER(VMALLOC_START)=0x%lx\n", VMALLOC_START);
>>       |                                                        ~~^
>>       |                                                          |
>>       |                                                          long unsigned int
>>       |                                                        %x
> 
> Thanks for all these testing.
> 
> This warning is irrelevant to the kexec patch, it's becasue 
> VMALLOC_START is defined as 0 which is int when CONFIG_MMU=n.
> 
> Below patch can fix the warning.
> 
> From 46984a0287e5f1b41ae3e9adfcfa0d26b71db8f4 Mon Sep 17 00:00:00 2001
> From: Baoquan He <bhe@redhat.com>
> Date: Tue, 5 Dec 2023 11:02:55 +0800
> Subject: [PATCH] riscv: fix VMALLC_START definition
> Content-type: text/plain
> 
> When below config items are set, compiler complained:
> 
> --------------------
> CONFIG_CRASH_CORE=y
> CONFIG_KEXEC_CORE=y
> CONFIG_CRASH_DUMP=y
> ......
> -----------------------
> 
> -------------------------------------------------------------------
> arch/riscv/kernel/crash_core.c: In function 'arch_crash_save_vmcoreinfo':
> arch/riscv/kernel/crash_core.c:11:58: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'int' [-Wformat=]
> 11 |         vmcoreinfo_append_str("NUMBER(VMALLOC_START)=0x%lx\n", VMALLOC_START);
>    |                                                        ~~^
>    |                                                          |
>    |                                                          long unsigned int
>    |                                                        %x
> ----------------------------------------------------------------------
> 
> This is because on riscv macro VMALLOC_START has different type when
> CONFIG_MMU is set or unset.
> 
> arch/riscv/include/asm/pgtable.h:
> --------------------------------------------------
> 
> Changing it to _AC(0, UL) in case CONFIG_MMU=n can fix the warning.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


Thanks.

> ---
>  arch/riscv/include/asm/pgtable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 294044429e8e..ab00235b018f 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -899,7 +899,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>  #define PAGE_KERNEL		__pgprot(0)
>  #define swapper_pg_dir		NULL
>  #define TASK_SIZE		0xffffffffUL
> -#define VMALLOC_START		0
> +#define VMALLOC_START		_AC(0, UL)
>  #define VMALLOC_END		TASK_SIZE
>  
>  #endif /* !CONFIG_MMU */

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
