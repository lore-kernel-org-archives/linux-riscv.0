Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E82C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 07:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+e9zSd4nFk0xCouxy89iExaOArf7ewkjuuZ87SCuAK0=; b=dMwTb9LzDDpUVO
	wV+Gzuv5b1sfQDlAegS7s0F0s+HzAoq0nJwvbG4NzxriswLsCFbnf6xabJhV3Sucqd2Cw1LxURzt8
	AkNNB/kAqXbaYshqOShzxm+zILU/1lv1MVTxvPOnMsG8KMsCXAfQ8dncKlKq5E1b5qDPkcJW8wA3R
	LeOovhbzMhWDaPft/BDlCdrMtKLMLWHIUCH8bTMN9pdvt/KuRmwZJVjAa8/8vcfuYabyQ5C7bKJ+Y
	ACWOR8hQuJC5w7LqsOuiuHMGzLS/ksM8NPUR5A6YsY5UgmrhuAaz4oH6+MsG7KtX1MRZBvDJRuNea
	vjJQnoBqtEQxZvFacACg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEn1q-000cte-6X; Fri, 22 Jul 2022 07:24:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEn1n-000crm-Sl
	for linux-riscv@lists.infradead.org; Fri, 22 Jul 2022 07:24:53 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oEn1h-0005HS-AH; Fri, 22 Jul 2022 09:24:45 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, anup@brainfault.org, guoren@kernel.org, mick@ics.forth.gr, alexandre.ghiti@canonical.com, Xianting Tian <xianting.tian@linux.alibaba.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, crash-utility@redhat.com, huanyi.xj@alibaba-inc.com, heinrich.schuchardt@canonical.com, k-hagio-ab@nec.com, hschauhan@nulltrace.org, Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: Re: [PATCH 4/5] riscv: Add modules to virtual kernel memory layout dump
Date: Fri, 22 Jul 2022 09:24:44 +0200
Message-ID: <7405851.EvYhyI6sBW@diego>
In-Reply-To: <20220717101323.370245-5-xianting.tian@linux.alibaba.com>
References: <20220717101323.370245-1-xianting.tian@linux.alibaba.com> <20220717101323.370245-5-xianting.tian@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_002451_957445_7423E273 
X-CRM114-Status: GOOD (  18.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Sonntag, 17. Juli 2022, 12:13:22 CEST schrieb Xianting Tian:
> Modules always live before the kernel, MODULES_END is fixed but
> MODULES_VADDR isn't fixed, it depends on the kernel size.
> Let's add it to virtual kernel memory layout dump.
> 
> As MODULES is only defined for CONFIG_64BIT, so we dump it when
> CONFIG_64BIT=y.
> 
> eg,
> MODULES_VADDR - MODULES_END
> 0xffffffff01133000 - 0xffffffff80000000
> 
> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>

I'm still not sure if it would be better to define MODULES_* constants
even on 32bit (with their VMALLOC_START etc values) and prevent
needing the CONFIG_64BIT ifdef, but that's for others to decide :-)

The below also looks good, so
Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  arch/riscv/mm/init.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index d466ec670e1f..2c4a64e97aec 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -135,6 +135,10 @@ static void __init print_vm_layout(void)
>  		(unsigned long)VMEMMAP_END);
>  	print_ml("vmalloc", (unsigned long)VMALLOC_START,
>  		(unsigned long)VMALLOC_END);
> +#ifdef CONFIG_64BIT
> +	print_ml("modules", (unsigned long)MODULES_VADDR,
> +		(unsigned long)MODULES_END);
> +#endif
>  	print_ml("lowmem", (unsigned long)PAGE_OFFSET,
>  		(unsigned long)high_memory);
>  	if (IS_ENABLED(CONFIG_64BIT)) {
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
