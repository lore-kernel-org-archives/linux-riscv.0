Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1EAAC10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 21:06:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B234620835
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 21:06:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mk2yL1Yu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="RKLxNmld"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B234620835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=BH9DXYOBe/QQfBfGdTBS5WdLnZJ9A6SYNhV15s3Aj4o=; b=Mk2yL1YudCLZVa/ILdkU1dg5S
	jsgSBjKPm6xDlbGtQQgyrIlpO1jV4GzPCJkWoUkPECIt+s3j7C9zJ/g+6UOkVroQs0d3wGRvwH3Q8
	vAccdn7ezZmyLvvlO96fAdOSIDHsCSfyKqvDXQ9CbuEWsEgKdsBP7qg3WDcpnD/0dDnkhbjDZswDK
	g57cyv997DpxJfKp7N3vjUwTn4C0s/mBJ6+fHXxUEp+QE4bcxGnj1zDBS2+MLSTMkBOvC3MOXqLXL
	nQifBbItjVks2RPE24dmbcsB1XKyss2XTNxzZWd3Jgt8kFdw+hrNEaY4TCXqNvMGBLLtqhEpvnJtf
	8rLVS/uAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJP6T-0004if-Qb; Wed, 24 Apr 2019 21:06:53 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJP6Q-0004hy-DX
 for linux-riscv@lists.infradead.org; Wed, 24 Apr 2019 21:06:51 +0000
Received: by mail-pl1-x642.google.com with SMTP id z8so229504pln.4
 for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2019 14:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=bZkshglKcvBU+6PMpXuNp0wARaLPDffIq6iStMQ6XdQ=;
 b=RKLxNmldM2pr5BbxMF2oAFgODVC5qNpB3prnTXZLfC+J2jtRqMZTDJqQHDx3HM/Zfh
 vs+ujn3c2UjpEYsFATkXUSzIIAthnd8X+8e07S+SC9jdP8D9F5RAYDv+E32aM5YsQdPP
 N/Jf8BHBc9iThEZwJnJoN9+HKvltLKYUwiPuWo3Sti0JwhvqxoaTvi0lDbhLklOl3Ik6
 gR/jpw95F4L6O71W+G+D9cTfKcggHrois1GGfCf/Pc5zM9PrYC05BFFiguRKTW4lhmzt
 xYcVMG1o5qg0uNWVtE2d9myCNk7X/QhtnR6pW/wXBN575Q9XRDZN6uGSSYpmwp4jnAom
 TKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=bZkshglKcvBU+6PMpXuNp0wARaLPDffIq6iStMQ6XdQ=;
 b=BwXSTIUwGuWPI8azrTBzZmk1W/qofMQ8YRLBSDFx/WbjkTgDfhQVh8q43m0LB9IowP
 gq6gCf1tw4LvU/ibnT2+UfRM5bFUf+3KPzKJY3VZG34HYgos96YalJLIIp2fKddM57aB
 vNIFvzuD/mgTOwgB9ajiBtoLONGgwuJ9BOY4tN5kiMVhEBOmWVkBxsf8Ky3m9t750exR
 756os4siAYx5p8Ih5Lul2wJKBRK1TKqiBSw88T2v75ofXU0O0QT0X6iuKW1Yu9sIfgky
 uEDtOtMQB+z9onBUShLybmJkBz/OatjYKEKqrJsPKO2qFRRPBsINGbh4vABUMgZVSP8/
 7KIQ==
X-Gm-Message-State: APjAAAXHrfxmpOb8Kp8YqUFbA4rejQN4XMnoIQvGVQx7ElBlL+vi/AfB
 8a3vgCaMwxD3JkhppYo17/O8fQ==
X-Google-Smtp-Source: APXvYqwiqgHS4Nde3OSvELilWPNt02aegb8UgiVyCbbNbUStwGwHbXrgdZe31DQr92zc4dWpW9rWDQ==
X-Received: by 2002:a17:902:2ae6:: with SMTP id
 j93mr35635251plb.18.1556140008705; 
 Wed, 24 Apr 2019 14:06:48 -0700 (PDT)
Received: from localhost ([134.134.139.92])
 by smtp.gmail.com with ESMTPSA id i24sm26639846pfo.85.2019.04.24.14.06.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Apr 2019 14:06:47 -0700 (PDT)
Date: Wed, 24 Apr 2019 14:06:47 -0700 (PDT)
X-Google-Original-Date: Wed, 24 Apr 2019 11:29:42 PDT (-0700)
Subject: Re: [PATCH v3 2/4] RISC-V: Fix memory reservation in setup_bootmem()
In-Reply-To: <20190325092234.5451-3-anup.patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Anup.Patel@wdc.com
Message-ID: <mhng-8cf03f23-1af7-48f0-8be8-60654bc09559@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_140650_520621_BF0BE624 
X-CRM114-Status: GOOD (  21.41  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, Anup.Patel@wdc.com, linux-kernel@vger.kernel.org,
 rppt@linux.ibm.com, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 25 Mar 2019 02:23:09 PDT (-0700), Anup.Patel@wdc.com wrote:
> Currently, the setup_bootmem() reserves memory from RAM start to the
> kernel end. This prevents us from exploring ways to use the RAM below
> (or before) the kernel start hence this patch updates setup_bootmem()
> to only reserve memory from the kernel start to the kernel end.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/mm/init.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 8cf9ff1f9058..3e66b7cb3a61 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -29,6 +29,8 @@ unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
>  							__page_aligned_bss;
>  EXPORT_SYMBOL(empty_zero_page);
>  
> +extern char _start[];
> +
>  static void __init zone_sizes_init(void)
>  {
>  	unsigned long max_zone_pfns[MAX_NR_ZONES] = { 0, };
> @@ -108,23 +110,21 @@ void __init setup_bootmem(void)
>  {
>  	struct memblock_region *reg;
>  	phys_addr_t mem_size = 0;
> +	phys_addr_t vmlinux_end = __pa(&_end);
> +	phys_addr_t vmlinux_start = __pa(&_start);
>  
>  	/* Find the memory region containing the kernel */
>  	for_each_memblock(memory, reg) {
> -		phys_addr_t vmlinux_end = __pa(_end);
>  		phys_addr_t end = reg->base + reg->size;
>  
> -		if (reg->base <= vmlinux_end && vmlinux_end <= end) {
> -			/*
> -			 * Reserve from the start of the region to the end of
> -			 * the kernel
> -			 */
> -			memblock_reserve(reg->base, vmlinux_end - reg->base);
> +		if (reg->base <= vmlinux_end && vmlinux_end <= end)
>  			mem_size = min(reg->size, (phys_addr_t)-PAGE_OFFSET);
> -		}
>  	}
>  	BUG_ON(mem_size == 0);
>  
> +	/* Reserve from the start of the kernel to the end of the kernel */
> +	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
> +
>  	set_max_mapnr(PFN_DOWN(mem_size));
>  	max_low_pfn = PFN_DOWN(memblock_end_of_DRAM());
>  
> @@ -196,7 +196,6 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
>   */
>  asmlinkage void __init setup_vm(void)
>  {
> -	extern char _start;
>  	uintptr_t i;
>  	uintptr_t pa = (uintptr_t) &_start;
>  	pgprot_t prot = __pgprot(pgprot_val(PAGE_KERNEL) | _PAGE_EXEC);
> -- 
> 2.17.1

I've already merged your first patch for 5.1, but I'm going through and
collecting 5.2 patches now and it appears this has a conflict.  Do you mind
re-submitting the patch set against rc6?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
