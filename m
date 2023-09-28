Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7A2CE7B05
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 08:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSX+ZZVia0A+LuEXyl8c2C1PiD4WZUy7hRpmj2GCMdw=; b=HzSunsJfvg+gYJSH7JjlBsno4s
	xztWuZ4sZ5ZCsHtsKcL2lTredu83/Hoyb8bdysKKaIjSbnj37hFbInVmGO/BUiy7OWa+ntDOUFAEc
	y+smclBFZGLLHrsvSMsgxKlpPX/XD6QOpXz1RLLGcgrQMNqXTfxXeMLC2t+58Xw9B28sFEyL3yKJw
	PYs5ykvb+cuNS200OHnN2KEWRaBHHtLzEk9qFnsIHhgjse+V453mawqKAQZSCKRnoCMNakYpr66s3
	YO5xOnVLxz4dDsnRtkHQKRMQAyJlN4DAMKVjVPestmdUkCByyq9v+2/E2ZBVh+36uTo7cRSGGEyX8
	FRJ2YudA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlm96-002azS-2i;
	Thu, 28 Sep 2023 08:13:16 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlm93-002axn-0r
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 08:13:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D52DD240005;
	Thu, 28 Sep 2023 08:13:04 +0000 (UTC)
Message-ID: <564b73e9-f686-f808-a9f4-208d9523406e@ghiti.fr>
Date: Thu, 28 Sep 2023 10:13:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 1/2] RISC-V: Provide pgtable_l5_enabled on rv32
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
References: <20230925152409.29057-1-palmer@rivosinc.com>
 <20230925152409.29057-2-palmer@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230925152409.29057-2-palmer@rivosinc.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_011313_473277_1B0BEE0A 
X-CRM114-Status: GOOD (  14.87  )
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

Hi Palmer,

On 25/09/2023 17:22, Palmer Dabbelt wrote:
> A few of the other page table level helpers are defined on rv32, but not
> pgtable_l5_enabled.  This adds the definition as a constant and converts
> pgtable_l4_enabled to a constant as well.
>
> Link: https://lore.kernel.org/r/20230830044129.11481-2-palmer@rivosinc.com
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>   arch/riscv/include/asm/pgtable-32.h | 3 +++
>   arch/riscv/include/asm/pgtable.h    | 1 -
>   arch/riscv/mm/init.c                | 2 ++
>   3 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
> index 59ba1fbaf784..00f3369570a8 100644
> --- a/arch/riscv/include/asm/pgtable-32.h
> +++ b/arch/riscv/include/asm/pgtable-32.h
> @@ -33,4 +33,7 @@
>   					  _PAGE_WRITE | _PAGE_EXEC |	\
>   					  _PAGE_USER | _PAGE_GLOBAL))
>   
> +static const __maybe_unused int pgtable_l4_enabled;
> +static const __maybe_unused int pgtable_l5_enabled;


pgtable_l4_enabled and pgtable_l5_enabled are boolean, not int.


> +
>   #endif /* _ASM_RISCV_PGTABLE_32_H */
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index b2ba3f79cfe9..e05e5c8f6526 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -914,7 +914,6 @@ extern uintptr_t _dtb_early_pa;
>   #define dtb_early_pa	_dtb_early_pa
>   #endif /* CONFIG_XIP_KERNEL */
>   extern u64 satp_mode;
> -extern bool pgtable_l4_enabled;


Isn't it easier to add pgtable_l5_enabled here ^


>   
>   void paging_init(void);
>   void misc_mem_init(void);
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 0798bd861dcb..eed1758720c9 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -49,10 +49,12 @@ u64 satp_mode __ro_after_init = SATP_MODE_32;
>   #endif
>   EXPORT_SYMBOL(satp_mode);
>   
> +#ifdef CONFIG_64BIT
>   bool pgtable_l4_enabled = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KERNEL);
>   bool pgtable_l5_enabled = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KERNEL);
>   EXPORT_SYMBOL(pgtable_l4_enabled);
>   EXPORT_SYMBOL(pgtable_l5_enabled);
> +#endif
>   


And remove the #ifdef?


>   phys_addr_t phys_ram_base __ro_after_init;
>   EXPORT_SYMBOL(phys_ram_base);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
