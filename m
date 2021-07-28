Return-Path: <SRS0=BMZi=MU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B73C4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 07:21:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99C5760F00
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 07:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99C5760F00
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2N1i/U3GN1IIReSaIcq6p8eeDxryaoaP8ZdK/VVTrtM=; b=uS4Qq+o6sXwCyspwDrg9YRTCLw
	AnUDtT9W1cAOcOOnn6jBBz6UITq/VVc+AmbN/DJUohTJyP9zyZ7RPXxKvg8K1mT+QOXZw6CA2H+Ed
	fk2xsRbILUajeBjy1jAMPWQLmZIUW9gt9bnqPPAFgvBOq7Iez9uXVBAih1n4hnA2mmos5S+ZbPyI8
	/4HcGXxlO7ad3pfQctkdWneYtdcwQ8XzihnbyeXgIBhNSveuUt3D2g61nKb5vRAbRWzXWcGihOUXI
	CaGmIgmxK/rFfR8baoxhmkI8L5x5/itbQwC8EfiEZZ+gaoKvIhJbNNqsoavsea97fBpeb2DzbpDVC
	AAQJn3eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8dqm-00HLon-Pg; Wed, 28 Jul 2021 07:19:32 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8dqj-00HLnz-2E
 for linux-riscv@lists.infradead.org; Wed, 28 Jul 2021 07:19:30 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 4CA9D4000A;
 Wed, 28 Jul 2021 07:19:17 +0000 (UTC)
Subject: Re: [PATCH] riscv: fix the global name pfn_base confliction error
To: Kenneth Lee <nek.in.cn@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>,
 Kenneth Lee <liguozhu@hisilicon.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Vitaly Wool <vitaly.wool@konsulko.com>, Guo Ren <guoren@linux.alibaba.com>,
 Jisheng Zhang <jszhang@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: guohanjun@huawei.com, wangzhou1@hisilicon.com
References: <20210728064318.375747-1-nek.in.cn@gmail.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <0e81c8d2-468a-9afd-bce3-0e8211baa065@ghiti.fr>
Date: Wed, 28 Jul 2021 09:19:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210728064318.375747-1-nek.in.cn@gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_001929_287532_10EB77E8 
X-CRM114-Status: GOOD (  19.48  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Kenneth,

Le 28/07/2021 =E0 08:43, Kenneth Lee a =E9crit=A0:
> From: Kenneth Lee <liguozhu@hisilicon.com>
> =

> RISCV use a global variable pfn_base for page/pfn translation. But this
> is a common name and will be used elsewhere. In those case,
> the page-pfn macro which refer this name will refer to the local/input
> variable of those function (such as in vfio_pin_pages_remote). This make
> everything wrong.
> =

> This patch change the name from pfn_base to riscv_global_pfn_base to fix
> this problem

What about removing this variable entirely and using =

PFN_DOWN(kernel_map.phys_addr) directly in ARCH_PFN_OFFSET definition? =

That would remove code from mm/init.c, which is nice :)

Thanks,

Alex

> =

> Signed-off-by: Kenneth Lee <liguozhu@hisilicon.com>
> ---
>   arch/riscv/include/asm/page.h | 4 ++--
>   arch/riscv/mm/init.c          | 6 +++---
>   2 files changed, 5 insertions(+), 5 deletions(-)
> =

> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index cca8764aed83..8711e415f37c 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -79,8 +79,8 @@ typedef struct page *pgtable_t;
>   #endif
>   =

>   #ifdef CONFIG_MMU
> -extern unsigned long pfn_base;
> -#define ARCH_PFN_OFFSET		(pfn_base)
> +extern unsigned long riscv_global_pfn_base;
> +#define ARCH_PFN_OFFSET		(riscv_global_pfn_base)
>   #else
>   #define ARCH_PFN_OFFSET		(PAGE_OFFSET >> PAGE_SHIFT)
>   #endif /* CONFIG_MMU */
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index a14bf3910eec..2ce4e9a46ca0 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -228,8 +228,8 @@ static struct pt_alloc_ops _pt_ops __initdata;
>   #define pt_ops _pt_ops
>   #endif
>   =

> -unsigned long pfn_base __ro_after_init;
> -EXPORT_SYMBOL(pfn_base);
> +unsigned long riscv_global_pfn_base __ro_after_init;
> +EXPORT_SYMBOL(riscv_global_pfn_base);
>   =

>   pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>   pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> @@ -572,7 +572,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>   	kernel_map.va_kernel_pa_offset =3D kernel_map.virt_addr - kernel_map.p=
hys_addr;
>   #endif
>   =

> -	pfn_base =3D PFN_DOWN(kernel_map.phys_addr);
> +	riscv_global_pfn_base =3D PFN_DOWN(kernel_map.phys_addr);
>   =

>   	/*
>   	 * Enforce boot alignment requirements of RV32 and
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
