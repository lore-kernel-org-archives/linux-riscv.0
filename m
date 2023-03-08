Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14073C64EC4
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 09:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=83LE3OMTOUyQkepKl7yzt5VUixcWITqU3kcT8xjcGcc=; b=iCJOeNmipKIlfj
	N8KnjRVcCDbEDUpypGuB7LAOImitWIPAsFzJR6f8szMGrnW1HjyiFEf32Xts7UY4q9uJ3Zf5R9Mai
	C7iniPdmQRfdLXUKJR+Zc8D672h4zPJHK+KOZw3ZUZz3GMrw1y1+TXQVUzLNKmAZzXDenlV9CnzV0
	c/1hH4/5oBw2drDL/r3xYok6BmpwVBAmKYYOVfcM8uqnnmduVsh/1N7f7mTCzaJQQlR28jD73EpJM
	R8D8q9gcFa6NWasiCd//e4ki3IfPUCv4Yb+8WjRUO3dK5zu2u9ufJHeimzETEgXRn5GWlUB8K99Hx
	htiwXRzHddgcZpdqsucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZqCf-004Dam-NH; Wed, 08 Mar 2023 09:35:21 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZqCc-004DZa-Hr
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 09:35:20 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net ([86.15.83.122] helo=[192.168.0.16])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1pZqCa-00FV2s-4q; Wed, 08 Mar 2023 09:35:16 +0000
Message-ID: <226aa2ae-dfa0-d947-0aaf-4407e0c0bc5b@codethink.co.uk>
Date: Wed, 8 Mar 2023 09:35:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] riscv: mm: add pgprot_dmacoherent for zicbom
Content-Language: en-GB
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, heiko.stuebner@vrull.eu,
 conor.dooley@microchip.com, ajones@ventanamicro.com
References: <20230307205834.1426289-1-ben.dooks@codethink.co.uk>
 <20230307205834.1426289-3-ben.dooks@codethink.co.uk>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20230307205834.1426289-3-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_013518_625637_6624562C 
X-CRM114-Status: GOOD (  21.23  )
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

On 07/03/2023 20:58, Ben Dooks wrote:
> If the system uses both ZICBOM and SVPBMT then currently SVPBMT will be
> used for DMA allocated memory even though ZICBOM gives us the cache ops
> to use cached memory and clean/flush them as needed by the DMA code.
> 
> Fix this by adding pgprot_dmacoherent() which is used by the allocator
> code to map the dma memory, thus allowing the return of suitably mapped
> memory for any use of dma_alloc_attrs() code. This s uses the added
> riscv_page_dmacoherent() which will work out the correct page flags to
> return using ALT_SVPBMT_ZICBOM() to runtime patch the right result.
> 
> Note, we can't just disable SVPBMT as it will be neede for things like
> ioremap() which don't have assoicated cache management operations.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>   arch/riscv/include/asm/errata_list.h | 16 ++++++++++++++++
>   arch/riscv/include/asm/pgtable-64.h  | 10 ++++++++++
>   2 files changed, 26 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index fb1a810f3d8c..49ed2e7984a7 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -62,6 +62,22 @@ asm(ALTERNATIVE_2("li %0, 0\t\nnop",					\
>   		  "I"(ALT_SVPBMT_SHIFT),				\
>   		  "I"(ALT_THEAD_PBMT_SHIFT))
>   
> +#define ALT_SVPBMT_ZICBOM(_val, prot)					\
> +asm(ALTERNATIVE_3("li %0, 0\t\nnop",					\
> +		  "li %0, %1\t\nslli %0,%0,%3", 0,			\
> +			RISCV_ISA_EXT_SVPBMT, CONFIG_RISCV_ISA_SVPBMT,	\
> +		  "li %0, 0\t\nnop", 0,					\
> +			RISCV_ISA_EXT_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,	\

so, I tink this needs to be selected on CONFIG_RISCV_DMA_NONCOHERENT
as just having ZICBOM in the ISA isn't enough to actually use it, you'll
need the dma-noncoherent.o being built to do the cache management.

> +		  "li %0, %2\t\nslli %0,%0,%4", THEAD_VENDOR_ID,	\
> +			ERRATA_THEAD_PBMT, CONFIG_ERRATA_THEAD_PBMT)	\
> +		: "=r"(_val)						\
> +		: "I"(prot##_SVPBMT >> ALT_SVPBMT_SHIFT),		\
> +		  "I"(prot##_THEAD >> ALT_THEAD_PBMT_SHIFT),		\
> +		  "I"(ALT_SVPBMT_SHIFT),				\
> +		  "I"(ALT_THEAD_PBMT_SHIFT))
> +
> +
> +
>   #ifdef CONFIG_ERRATA_THEAD_PBMT
>   /*
>    * IO/NOCACHE memory types are handled together with svpbmt,
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> index 42a042c0e13e..e0d2e5fda5a4 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -126,10 +126,20 @@ static inline u64 riscv_page_io(void)
>   	return val;
>   }
>   
> +static inline u64 riscv_page_dmacoherent(void)
> +{
> +	u64 val;
> +
> +	ALT_SVPBMT_ZICBOM(val, _PAGE_IO);
> +	return val;
> +}
> +
>   #define _PAGE_NOCACHE		riscv_page_nocache()
>   #define _PAGE_IO		riscv_page_io()
>   #define _PAGE_MTMASK		riscv_page_mtmask()
>   
> +#define pgprot_dmacoherent(__prot) __pgprot(pgprot_val(__prot) | riscv_page_dmacoherent())
> +
>   /* Set of bits to preserve across pte_modify() */
>   #define _PAGE_CHG_MASK  (~(unsigned long)(_PAGE_PRESENT | _PAGE_READ |	\
>   					  _PAGE_WRITE | _PAGE_EXEC |	\

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
