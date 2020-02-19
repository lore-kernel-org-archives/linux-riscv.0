Return-Path: <SRS0=GYez=4H=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD53C34056
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2020 17:53:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22B3824656
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2020 17:53:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uAKi5mja"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22B3824656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hrMXRIYB5vaIFBvDMwX3+VnOinMv8hSkpYZ59IVu3TA=; b=uAKi5mjaTLLY4h
	ocSh0Kuxnyfy2M/a7mPUy4L4DJ3/lXfYfq649auopz7e0vGOFb9UGiFy007e34zdLolSDqrqzDDsB
	EowKjxQUujct3IsPyyJJBEZIHz1yIJcnjFdsdyMZk6jxc7056asJDCzgMYSFu7rshud84lzEBcA5z
	zXgUb/UWp+vbWmsQ7xsxhm9CnqtWzqE+xoZ6/9q7e9ligMaD92P/gq/uqEfAGZDWOorExqW+uHOfE
	2r2GHxmfrg/8MBdnKiRr9tL22tkLasfnhwhTxwtJWdMXzDUXD3WvK3o37lKkFCrnBagkkQMXTIZQ1
	r/8ND/byRe1eI5g4IJtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4TX7-0002Gm-Fm; Wed, 19 Feb 2020 17:53:13 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4TWy-0002G0-CG
 for linux-riscv@lists.infradead.org; Wed, 19 Feb 2020 17:53:12 +0000
X-Originating-IP: 79.86.19.127
Received: from [192.168.0.12] (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 43FC460002;
 Wed, 19 Feb 2020 17:52:52 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH 1/2] riscv: avoid the PIC offset of static percpu data in
 module beyond 2G limits
To: Vincent Chen <vincent.chen@sifive.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com
References: <1582097304-5547-1-git-send-email-vincent.chen@sifive.com>
 <1582097304-5547-2-git-send-email-vincent.chen@sifive.com>
Message-ID: <b58183d5-a7db-3902-100f-8f4f0d06c148@ghiti.fr>
Date: Wed, 19 Feb 2020 12:52:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1582097304-5547-2-git-send-email-vincent.chen@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_095310_643222_F245CB0A 
X-CRM114-Status: GOOD (  20.45  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, deanbo422@gmail.com
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Vincent,

On 2/19/20 8:28 AM, Vincent Chen wrote:
> The compiler uses the PIC-relative method to access static variables
> instead of GOT when the code model is PIC. Therefore, the limitation of
> the access range from the instruction to the symbol address is +-2GB.
> Under this circumstance, the kernel cannot load a kernel module if this
> module has static per-CPU symbols declared by DEFINE_PER_CPU(). The reason
> is that kernel relocates the .data..percpu section of the kernel module to
> the end of kernel's .data..percpu. Hence, the distance between the per-CPU
> symbols and the instruction will exceed the 2GB limits. To solve this
> problem, the kernel should place the loaded module in the memory area
> [&_end-2G, VMALLOC_END].
> 
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Suggested-by: Alex Ghiti <alex@ghiti.fr>
> Suggested-by: Anup Patel <anup@brainfault.org>
> 
> ---
>   arch/riscv/kernel/module.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index b7401858d872..c498beb82369 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -8,6 +8,10 @@
>   #include <linux/err.h>
>   #include <linux/errno.h>
>   #include <linux/moduleloader.h>
> +#include <linux/vmalloc.h>
> +#include <linux/sizes.h>
> +#include <asm/pgtable.h>
> +#include <asm/sections.h>
>   
>   static int apply_r_riscv_32_rela(struct module *me, u32 *location, Elf_Addr v)
>   {
> @@ -386,3 +390,17 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>   
>   	return 0;
>   }
> +#if defined(CONFIG_MMU) && defined(CONFIG_64BIT)
> +#ifdef CONFIG_MAXPHYSMEM_2GB
> +#define VMALLOC_MODULE_START \
> +	max(PFN_ALIGN((unsigned long)&_end - SZ_2G), VMALLOC_START)
> +#else
> +#define VMALLOC_MODULE_START PFN_ALIGN((unsigned long)&_end - SZ_2G)
> +#endif

I would use the same definition for both cases:

#define VMALLOC_MODULE_START \
	max(PFN_ALIGN((unsigned long)&_end - SZ_2G), VMALLOC_START)

as it avoids ifdefs and amounts to the same. And maybe you can avoid the 
definition of VMALLOC_MODULE_START at the same time.

> +void *module_alloc(unsigned long size)
> +{
> +	return __vmalloc_node_range(size, 1, VMALLOC_MODULE_START,
> +	VMALLOC_END, GFP_KERNEL, PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
> +	__builtin_return_address(0));
> +}
> +#endif
> 

It's weird checkpatch does not complain about the alignment of those lines.

Otherwise, I have just tested it and it works, so you can add:

Tested-by: Alexandre Ghiti <alex@ghiti.fr>

Thanks,

Alex

