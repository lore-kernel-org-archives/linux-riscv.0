Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFD1EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 09:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kLGFRr0eZf0sibQVzuRnncV/7cdnP4SQvwP03mKa1+c=; b=q8Dq+fv7Im8INW
	gtPYyAvZHEDSW9rkqt6YXhbZcxXgyNhjo6LXIUz0ey0ISEU51Sotbr49NxpDWE5gMlCLXvS7TQusV
	sfbYCE6WJSFb2I/tqkuu74p0B9kfKhNbPAWE0ZkYpymbu1gI8kxcPmOTQxhuGLv9g5+OyGJ9S8SwE
	otAXdY8JVe1WRoCqY1W6hnuXssq4vSq4TVgleNR8hRJvG6LnONgkvZqMHEtiNQWROzsQfQFKP8Rbt
	F5umJcmecsun7q6bQ67AFbsnOZF4Cbzwx9fQgzWM2uEoIQDrvM5MYPjkIPLlD5bnYhEoX+Y7pLTfE
	Jp7heghExLbitY2s4Zdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLKCf-003Xzn-18;
	Mon, 17 Jul 2023 09:07:37 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLKCa-003XuA-0P
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 09:07:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9DA961C0012;
	Mon, 17 Jul 2023 09:07:13 +0000 (UTC)
Message-ID: <bb296a8e-4f84-f45d-8f46-5acfa73022d9@ghiti.fr>
Date: Mon, 17 Jul 2023 11:07:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] riscv: Add HAVE_IOREMAP_PROT support
To: guoren@kernel.org, palmer@rivosinc.com, paul.walmsley@sifive.com,
 falcon@tinylab.org, bjorn@kernel.org, conor.dooley@microchip.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
References: <20230716152033.3713581-1-guoren@kernel.org>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230716152033.3713581-1-guoren@kernel.org>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_020732_317208_82A0CCF8 
X-CRM114-Status: GOOD (  17.25  )
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

Hi Guo,

On 16/07/2023 17:20, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Add pte_pgprot macro, then riscv could have HAVE_IOREMAP_PROT,
> which will enable generic_access_phys() code, it is useful for
> debug, eg, gdb.


I don't understand, we already have the generic ioremap_prot() 
implementation since we select GENERIC_IOREMAP: shouldn't 
HAVE_IOREMAP_PROT imply that we have our own implementation?

Thanks,

Alex


> Because generic_access_phys() would call ioremap_prot()->
> pgprot_nx() to disable excutable attribute, add definition
> of pgprot_nx() for riscv.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>   .../features/vm/ioremap_prot/arch-support.txt     |  2 +-
>   arch/riscv/Kconfig                                |  1 +
>   arch/riscv/include/asm/pgtable.h                  | 15 +++++++++++++++
>   3 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/features/vm/ioremap_prot/arch-support.txt b/Documentation/features/vm/ioremap_prot/arch-support.txt
> index a24149e59d73..ea8c8a361455 100644
> --- a/Documentation/features/vm/ioremap_prot/arch-support.txt
> +++ b/Documentation/features/vm/ioremap_prot/arch-support.txt
> @@ -21,7 +21,7 @@
>       |    openrisc: | TODO |
>       |      parisc: | TODO |
>       |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>       |        s390: |  ok  |
>       |          sh: |  ok  |
>       |       sparc: | TODO |
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 4c07b9189c86..15900fa20797 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -117,6 +117,7 @@ config RISCV
>   	select HAVE_FUNCTION_ERROR_INJECTION
>   	select HAVE_GCC_PLUGINS
>   	select HAVE_GENERIC_VDSO if MMU && 64BIT
> +	select HAVE_IOREMAP_PROT
>   	select HAVE_IRQ_TIME_ACCOUNTING
>   	select HAVE_KPROBES if !XIP_KERNEL
>   	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 75970ee2bda2..c9552a161f90 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -415,6 +415,11 @@ static inline pte_t pte_mkhuge(pte_t pte)
>   	return pte;
>   }
>   
> +static inline pgprot_t pte_pgprot(pte_t pte)
> +{
> +	return __pgprot(pte_val(pte) & ~_PAGE_PFN_MASK);
> +}
> +
>   #ifdef CONFIG_NUMA_BALANCING
>   /*
>    * See the comment in include/asm-generic/pgtable.h
> @@ -573,6 +578,16 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
>   	return ptep_test_and_clear_young(vma, address, ptep);
>   }
>   
> +#define pgprot_nx pgprot_nx
> +static inline pgprot_t pgprot_nx(pgprot_t _prot)
> +{
> +	unsigned long prot = pgprot_val(_prot);
> +
> +	prot &= ~_PAGE_EXEC;
> +
> +	return __pgprot(prot);
> +}
> +
>   #define pgprot_noncached pgprot_noncached
>   static inline pgprot_t pgprot_noncached(pgprot_t _prot)
>   {

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
