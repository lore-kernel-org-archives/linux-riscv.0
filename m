Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAFDD12676
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2024 10:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKygrF34GiKdJyIy4KrCL1bnYzdqmD3RSg1HCsNyCxQ=; b=SgRVGVXGnAxSrf
	NR1cmANR4ZHv4F0zFjjSZbRWXK4GRZp7jwkRg2bxi9FLU6uCVyWMAfT4bxn7HqxnpPsN/namTfeYk
	VA9gqdSCGd9YDJqngiuycD3TrdnvvZeNyYF7bmnw97p1/KY7IlPzv6LyktF/HWMNTa3MU6J2/KBCH
	aoFqInMk9nwq47vL6gwIh2KjqkGuXm2X5j4wR+5/LErYSnIW5Sc6I0t7ApgTFmSlJb/5FsreWW5pb
	69vjhZJx+YLV8IvnNQOE6zhVEqJ6iWcrodCk77P1xJ/2FTmfiXIn5JQg+3MJyydzR6UP6l9wZU9VN
	CambEejnfwDFGDdpbz8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8GPo-0000000GcJu-12ir;
	Tue, 05 Nov 2024 10:04:00 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8GMA-0000000Gbfp-3iar
	for linux-riscv@lists.infradead.org;
	Tue, 05 Nov 2024 10:00:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EEB6E2000C;
	Tue,  5 Nov 2024 10:00:08 +0000 (UTC)
Message-ID: <e9aebe78-2e5b-43f3-bd96-45bd9f9e7269@ghiti.fr>
Date: Tue, 5 Nov 2024 11:00:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] riscv: mm: Deduplicate _PAGE_CHG_MASK definition
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20241102000843.1301099-1-samuel.holland@sifive.com>
 <20241102000843.1301099-5-samuel.holland@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241102000843.1301099-5-samuel.holland@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_020015_106165_1E2498E1 
X-CRM114-Status: GOOD (  13.32  )
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

On 02/11/2024 01:07, Samuel Holland wrote:
> The two existing definitions are equivalent because _PAGE_MTMASK is
> defined as 0 on riscv32.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
>   arch/riscv/include/asm/pgtable-32.h | 5 -----
>   arch/riscv/include/asm/pgtable-64.h | 7 -------
>   arch/riscv/include/asm/pgtable.h    | 6 ++++++
>   3 files changed, 6 insertions(+), 12 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
> index 23137347dc15..7dc0751d67dc 100644
> --- a/arch/riscv/include/asm/pgtable-32.h
> +++ b/arch/riscv/include/asm/pgtable-32.h
> @@ -28,11 +28,6 @@
>   #define _PAGE_IO		0
>   #define _PAGE_MTMASK		0
>   
> -/* Set of bits to preserve across pte_modify() */
> -#define _PAGE_CHG_MASK  (~(unsigned long)(_PAGE_PRESENT | _PAGE_READ |	\
> -					  _PAGE_WRITE | _PAGE_EXEC |	\
> -					  _PAGE_USER | _PAGE_GLOBAL))
> -
>   #define pud_pfn(pud)				(pmd_pfn((pmd_t){ pud }))
>   #define p4d_pfn(p4d)				(pud_pfn((pud_t){ p4d }))
>   #define pgd_pfn(pgd)				(p4d_pfn((p4d_t){ pgd }))
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> index 33e7ff049c4a..4ba88592b8d1 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -66,7 +66,6 @@ typedef struct {
>   
>   #define pmd_val(x)      ((x).pmd)
>   #define __pmd(x)        ((pmd_t) { (x) })
> -
>   #define PTRS_PER_PMD    (PAGE_SIZE / sizeof(pmd_t))
>   
>   /*
> @@ -166,12 +165,6 @@ static inline u64 riscv_page_io(void)
>   #define _PAGE_IO		riscv_page_io()
>   #define _PAGE_MTMASK		riscv_page_mtmask()
>   
> -/* Set of bits to preserve across pte_modify() */
> -#define _PAGE_CHG_MASK  (~(unsigned long)(_PAGE_PRESENT | _PAGE_READ |	\
> -					  _PAGE_WRITE | _PAGE_EXEC |	\
> -					  _PAGE_USER | _PAGE_GLOBAL |	\
> -					  _PAGE_MTMASK))
> -
>   static inline int pud_present(pud_t pud)
>   {
>   	return (pud_val(pud) & _PAGE_PRESENT);
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 3e0e1177107d..afa0b455eaa4 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -201,6 +201,12 @@ extern struct pt_alloc_ops pt_ops __meminitdata;
>   #define _PAGE_IOREMAP	((_PAGE_KERNEL & ~_PAGE_MTMASK) | _PAGE_IO)
>   #define PAGE_KERNEL_IO		__pgprot(_PAGE_IOREMAP)
>   
> +/* Set of bits to preserve across pte_modify() */
> +#define _PAGE_CHG_MASK  (~(unsigned long)(_PAGE_PRESENT | _PAGE_READ |	\
> +					  _PAGE_WRITE | _PAGE_EXEC |	\
> +					  _PAGE_USER | _PAGE_GLOBAL |	\
> +					  _PAGE_MTMASK))
> +
>   extern pgd_t swapper_pg_dir[];
>   extern pgd_t trampoline_pg_dir[];
>   extern pgd_t early_pg_dir[];

Nice clean up too, you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
