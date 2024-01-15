Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDDEC3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 09:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LjssxcVAEe7AeNzEmRlxqniBBiZNiVLfr+6zD1VJ7J8=; b=sbqJx0/6MhumJV
	XAxfGvC5B3Y/eNIgRumTJb+DooBMnJ8JZLitAhZMxhO+OSONn7JdLQwS0Eae+SulCN37pr2/FGymI
	GGwNL/3ET0lTfMK/wekkucfS6tHgSbFKSLLVKHuaeGG1zAyEZbNNNstRUlabtNMkch17fTq9Qdf5j
	Oj2PC3jADpXCBPEM8LqGqBb5ujiLGhmxGA2GUHI73yJpWrChKHsIKzMnW/1VrOK4gy0NvCFeP5fpS
	jF5ATcJezrNxR/Iw1SOmrEy35O5UPQh14yskgwoROGKiGEcaVMpOnO5kO7KLkFM8Y65gomtqYlMGy
	aFUPZX9unq9iDkdPk6oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJjY-008VAC-2G;
	Mon, 15 Jan 2024 09:58:20 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPJjT-008V9U-0N
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 09:58:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A684620010;
	Mon, 15 Jan 2024 09:58:10 +0000 (UTC)
Message-ID: <73f39533-9384-4067-bd81-1ddd56a16236@ghiti.fr>
Date: Mon, 15 Jan 2024 10:58:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: mm: implement pgprot_nx
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231121160637.3856-1-jszhang@kernel.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20231121160637.3856-1-jszhang@kernel.org>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_015815_301912_DD4DD6C6 
X-CRM114-Status: GOOD (  11.36  )
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

On 21/11/2023 17:06, Jisheng Zhang wrote:
> commit cca98e9f8b5e ("mm: enforce that vmap can't map pages
> executable") enforces the W^X protection by not allowing remapping
> existing pages as executable. Add riscv bits so that riscv can benefit
> the same protection.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   arch/riscv/include/asm/pgtable.h | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 294044429e8e..4fc6ee5226fb 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -608,6 +608,12 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
>   	return ptep_test_and_clear_young(vma, address, ptep);
>   }
>   
> +#define pgprot_nx pgprot_nx
> +static inline pgprot_t pgprot_nx(pgprot_t _prot)
> +{
> +	return __pgprot(pgprot_val(_prot) & ~_PAGE_EXEC);
> +}
> +
>   #define pgprot_noncached pgprot_noncached
>   static inline pgprot_t pgprot_noncached(pgprot_t _prot)
>   {


This one looks good too:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
