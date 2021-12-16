Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739ACC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 11:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nFe1ZsTXPBUXewHOZZi3/VVQCEv4pjtGMmas0uIni5I=; b=autFtHZQLsEeki
	Rz9vXtFUJG9wTGJX5ycYw7+dNz6d2IhPYMOej98HTjyLAr8ABWeeb2fWRW1KaYySQWWRqHCT+isqr
	C/odh2kp8E2W72/E7tsk8dP5YwV8uRyRNKtz7Q/HI+YNbM5jol8pzT1z2pepKhSvRwt86uKc7Ox/F
	ScQnimhMhNxL5Dez9hv16FNijvAmQ9L/wTQ5ygeoosMvl1tO85MvnGFW5c7j0OBVblEgJHiUMiJ+Y
	+k2CkpiAFjLM3fkaEm7RNPmxCfk1cKvwabk1Gfvl/HekACEmOXBN1rt20yq4ngIYHHXTeEf2s9eX+
	BV9UocyVb4zqKMUAcV1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxoe5-0053sk-Ra; Thu, 16 Dec 2021 11:09:57 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxoe3-0053pW-0D
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 11:09:56 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 05FD820000E;
 Thu, 16 Dec 2021 11:09:50 +0000 (UTC)
Message-ID: <3387fdfb-a82f-6842-5442-c4bc98b745b6@ghiti.fr>
Date: Thu, 16 Dec 2021 12:09:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 3/5] riscv: mm: init: remove _pt_ops and use pt_ops
 directly
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211206150353.731-1-jszhang@kernel.org>
 <20211206150353.731-4-jszhang@kernel.org>
From: Alexandre ghiti <alex@ghiti.fr>
In-Reply-To: <20211206150353.731-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_030955_215261_076F5D14 
X-CRM114-Status: GOOD (  14.93  )
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

On 12/6/21 16:03, Jisheng Zhang wrote:
> Except "pt_ops", other global vars when CONFIG_XIP_KERNEL=y is defined
> as below:
>
> |foo_type foo;
> |#ifdef CONFIG_XIP_KERNEL
> |#define foo	(*(foo_type *)XIP_FIXUP(&foo))
> |#endif
>
> Follow the same way for pt_ops to unify the style and to simplify code.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   arch/riscv/mm/init.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 4edf5600bea9..9c5816971f40 100644
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


I tried to compile a XIP kernel with success and I noticed we can go 
even further by removing the ifdef CONFIG_XIP_KERNEL since XIP_FIXUP is 
the identity for normal kernels.

Anyway, I'll do that later:

Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>

Thanks,

Alex


>   
>   unsigned long riscv_pfn_base __ro_after_init;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
