Return-Path: <SRS0=fWiV=JZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E7CC433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 08:27:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FB086142A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 08:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FB086142A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3cUY0Uoob4RkVwCBlD8Qk0eQcxAHD0VbClTocqQLL2o=; b=WLZiCIIesxQ499lcJKMOOv2Ns
	4pr1aoog6QljWW7Wuh1wgmOEIXpqPGwGacEcS1HPX5AcKQ6TssQWHflST3hcmVm76qfUdMFXLFEXV
	FIw+LHI7v767wMYZHiYq7m/3glkdU1WOTFBcJMPjVpWOmvBvT862GowzA7s7Rzp6TpX7F1EKUmbPe
	mrAPCa7LqtcPlNpX+aKvC0aZaFhvDCwNZfEQ/xGEFlISWLUj5IIJTLaWBWq2165J37MltlXsabr6H
	zTTIrq1bChFmF2Q5mApZBtbnGMrY2K37AOyks8lKjaNPRStdj21sC4W92TD9HsK5WHX7GgugA6kcS
	n9CtpFC2A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbfWM-00372e-IW; Wed, 28 Apr 2021 08:26:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbfWL-00372P-Gd
 for linux-riscv@desiato.infradead.org; Wed, 28 Apr 2021 08:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=BEIEqQltKGJ2T5aysBIQPHjzU36PvWqfEPDZRTORM5k=; b=fA7ygjV2msW8b6O5hwZ1+tzSH+
 PtGDecPxjaxoXOT2e7tNIWDrjwnHgAk2Z9c6iJ6Dq+BYwtP1Zr7AeQppF5+WIIuJP1vM3e+LnMCHV
 02TXu8Eu4mWSwOS/88/4elawhz/+OTMm+3SOlBPuWad1s3rU8mCZESS/K2llWLpxMofWuGz09KGmK
 KC4fCbdfnj3sNIat0i9TJYibZqM5Mxw8NRy7qp49pT+6y7mqW1T3m2Wp/2L2N9BgKWhfWORCXWaNz
 3287KTN8brqoo2RF2nxeyJVpK2pG/Z7j2YRmeVSGX7QvLoLVRWrMlOSRi+Aufr3/6x9t92S2rh89i
 0X9APENw==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbfWI-00HHeF-NN
 for linux-riscv@lists.infradead.org; Wed, 28 Apr 2021 08:26:08 +0000
X-Originating-IP: 2.7.49.219
Received: from [192.168.1.100] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 519A91C000E;
 Wed, 28 Apr 2021 08:25:55 +0000 (UTC)
Subject: Re: [PATCH] RISC-V: Always define XIP_FIXUP
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 akpm@linux-foundation.org, Atish Patra <Atish.Patra@wdc.com>,
 Anup Patel <Anup.Patel@wdc.com>, wangkefeng.wang@huawei.com,
 rppt@kernel.org, vitaly.wool@konsulko.com, greentime.hu@sifive.com,
 0x7f454c46@gmail.com, chenhuang5@huawei.com, linux-kernel@vger.kernel.org,
 kernel-team@android.com, Palmer Dabbelt <palmerdabbelt@google.com>,
 Guenter Roeck <linux@roeck-us.net>
References: <20210428033415.107756-1-palmer@dabbelt.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <b674bc91-8228-9236-f3ec-8f65bb5620c8@ghiti.fr>
Date: Wed, 28 Apr 2021 04:25:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210428033415.107756-1-palmer@dabbelt.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_012606_924726_C7751E19 
X-CRM114-Status: GOOD (  17.74  )
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

Le 4/27/21 =E0 11:34 PM, Palmer Dabbelt a =E9crit=A0:
> From: Palmer Dabbelt <palmerdabbelt@google.com>
> =

> XIP depends on MMU, but XIP_FIXUP is defined throughout the kernel in
> order to avoid excessive ifdefs.  This just makes sure to always define
> XIP_FIXIP, which will fix MMU=3Dn builds.

A small typo here.

> =

> Fixes: 44c922572952 ("RISC-V: enable XIP")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>   arch/riscv/include/asm/pgtable.h | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> =

> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pg=
table.h
> index 2f1384e14e31..fd749351f432 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -73,18 +73,6 @@
>   #endif
>   #define FIXADDR_START    (FIXADDR_TOP - FIXADDR_SIZE)
>   =

> -#ifdef CONFIG_XIP_KERNEL
> -#define XIP_OFFSET		SZ_8M
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
> @@ -101,6 +89,18 @@
>   #include <asm/pgtable-32.h>
>   #endif /* CONFIG_64BIT */
>   =

> +#ifdef CONFIG_XIP_KERNEL
> +#define XIP_OFFSET		SZ_8M


XIP_OFFSET is used in head.S and then this breaks XIP_KERNEL. XIP_OFFSET =

must live outside the ifndef __ASSEMBLY__.


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


Thank you for doing that!

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
