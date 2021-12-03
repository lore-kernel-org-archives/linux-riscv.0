Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3A6C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 08:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qedaql2Sl1qeKTTwOFF8WZlmVMP/HucRnD4Pu5akxBs=; b=Ru9E4cij0xgWhb
	nNjhJ0bZneZjkwBts0uJUk5iHJs4mIQuETtL+e74vZoMVjNSUqm+Avi4WokxAlWSW9R13+ndpHM1B
	+wNrtT6zQ8qRKBSmcDwhaAb6LZxC5qiyaM24mIXIZbmGbfF02ZxCttJKv4oxHmzyRHu77y3mwSAU4
	aPIG5kwj2NFfSbJ3w7CYluSDP0QQOaFFA7JtcEgA/VvJ3GvUrEEdlId3VN4onZyouNeAwTf+qfPnI
	hKL+HYRcMANBoKpEXj7rYBzbxHVIfG8jk3/2FGOg1rlhFjI7CVU4xfWLDxS3z+ITYMiqnCCztQTQR
	WlBXWgOntrubasDQt3Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt4Nz-00EuZC-Q4; Fri, 03 Dec 2021 08:57:43 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt4Nw-00EuXL-Sg
 for linux-riscv@lists.infradead.org; Fri, 03 Dec 2021 08:57:42 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2B4DDFF80F;
 Fri,  3 Dec 2021 08:57:35 +0000 (UTC)
Message-ID: <bdb6b231-2b1d-61c9-35a6-d5545bd667c6@ghiti.fr>
Date: Fri, 3 Dec 2021 09:57:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 3/5] riscv: mm: init: remove _pt_ops and use pt_ops
 directly
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211203050317.2102-1-jszhang@kernel.org>
 <20211203050317.2102-4-jszhang@kernel.org>
From: Alexandre ghiti <alex@ghiti.fr>
In-Reply-To: <20211203050317.2102-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_005741_100284_B0CBBE0C 
X-CRM114-Status: GOOD (  15.44  )
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

On 12/3/21 06:03, Jisheng Zhang wrote:
> Except "pt_ops", other global vars when CONFIG_XIP_KERNEL=y is defined
> as below:
>
> |foo_type foo;
> |#ifdef CONFIG_XIP_KERNEL
> |#define foo	(*(foo_type *)XIP_FIXUP(&foo))
> |#endif
>
> Follow the same way for pt_ops to unify the style and to simplify code.


_dtb_early_pa and _dtb_early_va have the same 'issue' too. I thought 
there was a reason for those variables to be declared this way but I 
can't find it :)


>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   arch/riscv/mm/init.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index bd445ac778a8..4d4fcd7ef1a9 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -227,12 +227,10 @@ static void __init setup_bootmem(void)
>   }
>   
>   #ifdef CONFIG_MMU
> -static struct pt_alloc_ops _pt_ops __initdata;
> +static struct pt_alloc_ops pt_ops __initdata;
>   
>   #ifdef CONFIG_XIP_KERNEL
> -#define pt_ops (*(struct pt_alloc_ops *)XIP_FIXUP(&_pt_ops))
> -#else
> -#define pt_ops _pt_ops
> +#define pt_ops (*(struct pt_alloc_ops *)XIP_FIXUP(&pt_ops))
>   #endif
>   
>   unsigned long riscv_pfn_base __ro_after_init;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
