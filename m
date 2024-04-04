Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98FBCD1284
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 07:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eExX5DK8tVouciNzgGrEbSNjimgYkJfUYVPQeCvYWHw=; b=lhi+AOPbCxz75s
	aC9Fmn2iCeeiRYo68Jorv2VQw+WhKokXpMqfQkYDrIBZOzCrJHMr/6yTNX6P0giXIXLN6tXffGeLf
	DNwhY2RnX1PCgO3bx/nbO14iSlLzP3F5LdUGr9nZ5Zf367uOSMYF5OzvlL9w3co/quYi4Sg/iRtrj
	ecWVVDTU9hvpxmiMWlW594J91spWPNn6KLXysSg+mwIYfSTLrT/PyXrU1IGFTFQjC34ZA9KxRXRUY
	Nhm7X1uuYG1Z3RYHOmKXifDN8yrB0j7GWhOgd87W79l87YsW/cCguXgyrcbdKyXZ8sm2qirK9gw7P
	nQ0H4AGsCkKJbLtqvTFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsHbS-00000001edD-2tDS;
	Thu, 04 Apr 2024 07:33:42 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsHbO-00000001ebg-38dS
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 07:33:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3AC8D240006;
	Thu,  4 Apr 2024 07:33:29 +0000 (UTC)
Message-ID: <61d289cb-115d-4e94-bdc9-787738b2f42d@ghiti.fr>
Date: Thu, 4 Apr 2024 09:33:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] riscv: Remove PGDIR_SIZE_L3 and TASK_SIZE_MIN
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
 David Laight <David.Laight@ACULAB.COM>, Arnd Bergmann <arnd@arndb.de>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20240327143858.711792-1-samuel.holland@sifive.com>
 <20240327143858.711792-2-samuel.holland@sifive.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240327143858.711792-2-samuel.holland@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_003339_068974_D34F77E1 
X-CRM114-Status: GOOD (  14.37  )
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

Hi Samuel,

On 27/03/2024 15:38, Samuel Holland wrote:
> TASK_SIZE_MIN is unused since commit 085e2ff9aeb0 ("efi: libstub: Drop
> randomization of runtime memory map"). PGDIR_SIZE_L3 is only used in the
> definition of TASK_SIZE_MIN.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
> Changes in v2:
>   - New patch for v2
>
>   arch/riscv/include/asm/pgtable-64.h | 2 --
>   arch/riscv/include/asm/pgtable.h    | 2 --
>   2 files changed, 4 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> index 221a5c1ee287..8c36a8818432 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -16,8 +16,6 @@ extern bool pgtable_l5_enabled;
>   #define PGDIR_SHIFT_L3  30
>   #define PGDIR_SHIFT_L4  39
>   #define PGDIR_SHIFT_L5  48
> -#define PGDIR_SIZE_L3   (_AC(1, UL) << PGDIR_SHIFT_L3)
> -
>   #define PGDIR_SHIFT     (pgtable_l5_enabled ? PGDIR_SHIFT_L5 : \
>   		(pgtable_l4_enabled ? PGDIR_SHIFT_L4 : PGDIR_SHIFT_L3))
>   /* Size of region mapped by a page global directory */
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 97fcde30e247..f5cc8bcc7f8d 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -870,7 +870,6 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>    */
>   #ifdef CONFIG_64BIT
>   #define TASK_SIZE_64	(PGDIR_SIZE * PTRS_PER_PGD / 2)
> -#define TASK_SIZE_MIN	(PGDIR_SIZE_L3 * PTRS_PER_PGD / 2)
>   
>   #ifdef CONFIG_COMPAT
>   #define TASK_SIZE_32	(_AC(0x80000000, UL) - PAGE_SIZE)
> @@ -882,7 +881,6 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>   
>   #else
>   #define TASK_SIZE	FIXADDR_START
> -#define TASK_SIZE_MIN	TASK_SIZE
>   #endif
>   
>   #else /* CONFIG_MMU */


I noticed loongarch still had this definition, but up to you to remove 
it too :)

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
