Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15859C433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 13:43:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C3046143B
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 13:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C3046143B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2cLTeaXrzCd7S0zMRvC//V7top82dNui86aeG/I1DuA=; b=nCf8oehFx2Zno/s7eemwl0QCa
	5Bc9c0VW638t1pwKO5qSnlNeCxgU7G4kHcVMDtssru5AKe2qo2BYepy6Clite8a0oSSQlmKtmKH+8
	VxIDG2SfesBLrWz22Rd9SFM3EubXth3n7aeA2Ss5YP7GVba0MtGueqNlLpcLiDafNekuzYCCafJDB
	Gd1SLlUO9xm/s/gJ2OzbcPLZLAXOhjtbKAr7Vw6PHXEJJPn/9KC7rgdWN6NhDeJwifIag0geR0xZp
	b49p7DtamerVjOg3AnJjR16kVQs2XrwwomkOfUli8A55dDRkbTfgK7ZmwSH1QJOMQKdA6FdmnHOG/
	HDjcBFf9Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc6wo-005ik5-87; Thu, 29 Apr 2021 13:43:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc6wl-005iji-SK
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 13:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=XZER40fbm0StF/i9ee6KEEUSzD8I796XUa9Elf7XvI4=; b=tNAtxfOC65+S+XovD+UtZvE17G
 E/ZpxDqpyLAMuZC9GWj+CiPQgdokhxIoo3MmPHjKBT/TMwCI0bbi3Jpa2iHbsanG+GPVcL1Af2MHG
 GCIglTjNqk++s+dwKNIMpy9T71e+Zwl3dcLmKbz22M+yQPZknYLTo+pS/8eszI1Gwm0NT6OnqDYEm
 qI2q9nbYrrIA4IWyOnlnLe6hE7wxH/cX9e+8qGDxo+B30MBcSXoE22itn335c5qDyyRG7aLzm9T2k
 8Ci9fSjgiDB5rXdu0MmjXOszu1rHMLXBj/cUklbzXtPP9yUNkrdnWz1pncn07yW06CWxxsTav0868
 vyTiLe0w==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc6wi-000evg-W7
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 13:43:14 +0000
X-Originating-IP: 2.7.49.219
Received: from [192.168.1.100] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 934956000F;
 Thu, 29 Apr 2021 13:43:06 +0000 (UTC)
Subject: Re: [PATCH v2] RISC-V: Always define XIP_FIXUP
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Atish Patra <Atish.Patra@wdc.com>, akpm@linux-foundation.org,
 rppt@kernel.org, Anup Patel <Anup.Patel@wdc.com>,
 wangkefeng.wang@huawei.com, vitaly.wool@konsulko.com,
 greentime.hu@sifive.com, 0x7f454c46@gmail.com, chenhuang5@huawei.com,
 linux-kernel@vger.kernel.org, kernel-team@android.com,
 Palmer Dabbelt <palmerdabbelt@google.com>, Guenter Roeck <linux@roeck-us.net>
References: <20210428214512.551153-1-palmer@dabbelt.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <fd30ede9-b105-e9e2-c9e8-f2d88dc2a653@ghiti.fr>
Date: Thu, 29 Apr 2021 09:43:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210428214512.551153-1-palmer@dabbelt.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_064313_192254_E8849A37 
X-CRM114-Status: GOOD (  18.28  )
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

Le 4/28/21 =E0 5:45 PM, Palmer Dabbelt a =E9crit=A0:
> From: Palmer Dabbelt <palmerdabbelt@google.com>
> =

> XIP depends on MMU, but XIP_FIXUP is used throughout the kernel in
> order to avoid excessive ifdefs.  This just makes sure to always define
> XIP_FIXUP, which will fix MMU=3Dn builds.  XIP_OFFSET is used by assembly
> but XIP_FIXUP is C-only, so they're split.
> =

> Fixes: 44c922572952 ("RISC-V: enable XIP")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
> Changes since v1:
> =

> * Clean up the commit text.
> * Define XIP_OFFSET for assembly.
> ---
>   arch/riscv/include/asm/pgtable.h | 23 +++++++++++++----------
>   1 file changed, 13 insertions(+), 10 deletions(-)
> =

> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pg=
table.h
> index 2f1384e14e31..9469f464e71a 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -73,18 +73,10 @@
>   #endif
>   #define FIXADDR_START    (FIXADDR_TOP - FIXADDR_SIZE)
>   =

> +#endif
> +
>   #ifdef CONFIG_XIP_KERNEL
>   #define XIP_OFFSET		SZ_8M
> -#define XIP_FIXUP(addr) ({							\
> -	uintptr_t __a =3D (uintptr_t)(addr);					\
> -	(__a >=3D CONFIG_XIP_PHYS_ADDR && __a < CONFIG_XIP_PHYS_ADDR + SZ_16M) =
?	\
> -		__a - CONFIG_XIP_PHYS_ADDR + CONFIG_PHYS_RAM_BASE - XIP_OFFSET :\
> -		__a;								\
> -	})
> -#else
> -#define XIP_FIXUP(addr)		(addr)
> -#endif /* CONFIG_XIP_KERNEL */
> -
>   #endif
>   =

>   #ifndef __ASSEMBLY__
> @@ -101,6 +93,17 @@
>   #include <asm/pgtable-32.h>
>   #endif /* CONFIG_64BIT */
>   =

> +#ifdef CONFIG_XIP_KERNEL
> +#define XIP_FIXUP(addr) ({							\
> +	uintptr_t __a =3D (uintptr_t)(addr);					\
> +	(__a >=3D CONFIG_XIP_PHYS_ADDR && __a < CONFIG_XIP_PHYS_ADDR + SZ_16M) =
?	\
> +		__a - CONFIG_XIP_PHYS_ADDR + CONFIG_PHYS_RAM_BASE - XIP_OFFSET :\
> +		__a;								\
> +	})
> +#else
> +#define XIP_FIXUP(addr)		(addr)
> +#endif /* CONFIG_XIP_KERNEL */
> +
>   #ifdef CONFIG_MMU
>   /* Number of entries in the page global directory */
>   #define PTRS_PER_PGD    (PAGE_SIZE / sizeof(pgd_t))
> =


XIP_KERNEL works now and !MMU compiles so you can add:

Tested-by: Alexandre Ghiti <alex@ghiti.fr>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
