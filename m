Return-Path: <SRS0=Z8g5=BE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E00C433E1
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2020 05:12:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AB372074A
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2020 05:12:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KQE8qPMw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="XekTCJaA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AB372074A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=39LdfWlz/fyGoKLTFdZVAM0z+DyPrcnLJCQdLRq+DKI=; b=KQE8qPMw6x/03pza+BYINyPeB
	eeTNqoZIQpa8miloVRUUxdv0ps45cAfZegkTyd6Nz6uUMgQ4ClDpkIRNdEmai+n5bxCwU/I0mhYfm
	nzQwu0DosffoImhc7mjoyzWL3gMN4UqrIu18sTO26shWnAN4WBRhmfwxZTfWsKzk8SWf/M0U0zIpI
	8RpgXDHlB+ueM9oWL19R9dwtPJSARhIHCzDvlv89joL8vReyFERy6en+1bSBx4hRKklrVRRJG8kQs
	c1+qgUmz5gL/Pk7Kzqj1ePBWfnLmThpHBbbMY8v5fnMmV7bN33qKn7cb0/TyzkTQnqeyHiJJxHyqt
	w+oU1bAgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzCUI-0005Dt-VK; Sat, 25 Jul 2020 05:12:47 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzCUF-0005CE-Q9
 for linux-riscv@lists.infradead.org; Sat, 25 Jul 2020 05:12:44 +0000
Received: by mail-pf1-x443.google.com with SMTP id t11so6354481pfq.11
 for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2020 22:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=kOPPuWlVHyyfzF11390Fpz2zidkHqu8nIIZggO9E2Qw=;
 b=XekTCJaA1u6Vu2uYjKpjFF03jpNaU3Ohspp+WB2uUchHTwwY8EPX1+ehEmmGYMMF0M
 8OFur5aqo4Cp2a2sgAhteKj3mzlFclLu8l62MZ2358b8GSaFo4ZPd/fZC3juTWcxIlOd
 MhxH1kO6JUewARAyoq5PT40gzrUYSrdTzCzVMUYNk/1Z2u477AzaSOaS+WZTfUx66jFQ
 PDEhcTL7Bqv1hOtTf3Plvf61XtfK7FdUORo99OB2CC6NdlJfn3QKRgzCrcZant8QwIOx
 KGk9xUuwWQm0kgRNFiyRtXPDLgeDdBjorZF8lRFNDSQCOZVcdbX2gSrH1Hi1SDYqlFzm
 vTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=kOPPuWlVHyyfzF11390Fpz2zidkHqu8nIIZggO9E2Qw=;
 b=FR6RB1PF++bJ+tD3lnNWUle3N4lX+VrLp91q/KcAhS76hq//ymm3AhoTkmDvKAoIsg
 Vc9AeIBFz2ZTYt3/XPP8V+CzrhiEYniiyUT1Cn+nX/dUKKxTLH82LTnm6mLYgjB7JAFP
 E3XlxGVfKIH0TOkOwU6mAfItcmv9SPtdeX6dXluSE0DcGJBEqHSnvhj+X8hDhTgzX7LA
 FDoM3LB9k0x/IOGdq6OcqwEoTqv9bGxnbUdzas7CErFH07pvNl2MrP0P4MgKgWPo0d11
 FlZpszouUfPlhITZweo5uQlweh8K9A1q9DmehMIz4qyEmNxi1KlNzwVOFVWlzuA2JQhX
 Sarg==
X-Gm-Message-State: AOAM5326zuK7STT90cTcl64Zb62uF3LTvF5/UWzfi5V9+XPkRcESpSlF
 SbZZTNQFwLHVkgkQS5MZExnmDw==
X-Google-Smtp-Source: ABdhPJyb7LkncfmV8eU5KLB/nojTUKjhnaxJ1MOXGp+mJpQOWTgcuyfqGf5jRHnACpU7ztFX45gd+A==
X-Received: by 2002:a63:6cd:: with SMTP id 196mr11269117pgg.169.1595653961764; 
 Fri, 24 Jul 2020 22:12:41 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id h9sm7749457pfk.155.2020.07.24.22.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 22:12:41 -0700 (PDT)
Date: Fri, 24 Jul 2020 22:12:41 -0700 (PDT)
X-Google-Original-Date: Fri, 24 Jul 2020 21:24:41 PDT (-0700)
Subject: Re: [PATCH 3/4] RISC-V: Do not rely on initrd_start/end computed
 during early dt parsing
In-Reply-To: <20200715233009.27183-4-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-cb081342-c17d-40ed-8ecb-b58fe259af2c@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200725_011243_884867_5C04115D 
X-CRM114-Status: GOOD (  28.34  )
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
Cc: aou@eecs.berkeley.edu, vincent.chen@sifive.com,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 sudeep.holla@arm.com, Atish Patra <Atish.Patra@wdc.com>, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 15 Jul 2020 16:30:08 PDT (-0700), Atish Patra wrote:
> Currently, initrd_start/end are computed during early_init_dt_scan
> but used during arch_setup. We will get the following panic if initrd is used
> and CONFIG_DEBUG_VIRTUAL is turned on.
>
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] kernel BUG at arch/riscv/mm/physaddr.c:33!
> [    0.000000] Kernel BUG [#1]
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-rc4-00015-ged0b226fed02 #886
> [    0.000000] epc: ffffffe0002058d2 ra : ffffffe0000053f0 sp : ffffffe001001f40
> [    0.000000]  gp : ffffffe00106e250 tp : ffffffe001009d40 t0 : ffffffe00107ee28
> [    0.000000]  t1 : 0000000000000000 t2 : ffffffe000a2e880 s0 : ffffffe001001f50
> [    0.000000]  s1 : ffffffe0001383e8 a0 : ffffffe00c087e00 a1 : 0000000080200000
> [    0.000000]  a2 : 00000000010bf000 a3 : ffffffe00106f3c8 a4 : ffffffe0010bf000
> [    0.000000]  a5 : ffffffe000000000 a6 : 0000000000000006 a7 : 0000000000000001
> [    0.000000]  s2 : ffffffe00106f068 s3 : ffffffe00106f070 s4 : 0000000080200000
> [    0.000000]  s5 : 0000000082200000 s6 : 0000000000000000 s7 : 0000000000000000
> [    0.000000]  s8 : 0000000080011010 s9 : 0000000080012700 s10: 0000000000000000
> [    0.000000]  s11: 0000000000000000 t3 : 000000000001fe30 t4 : 000000000001fe30
> [    0.000000]  t5 : 0000000000000000 t6 : ffffffe00107c471
> [    0.000000] status: 0000000000000100 badaddr: 0000000000000000 cause: 0000000000000003
> [    0.000000] random: get_random_bytes called from print_oops_end_marker+0x22/0x46 with crng_init=0
>
> To avoid the error, initrd_start/end can be computed from phys_initrd_start/size
> in setup itself. It also improves the initrd placement by aligning the start
> and size with the page size.
>
> Fixes: 6435f773d81f (riscv: mm: add support for CONFIG_DEBUG_VIRTUAL)
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/mm/init.c | 33 +++++++++++++++++++++++++++------
>  1 file changed, 27 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 8d22973bde40..f818a47a72d1 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -95,19 +95,40 @@ void __init mem_init(void)
>  #ifdef CONFIG_BLK_DEV_INITRD
>  static void __init setup_initrd(void)
>  {
> +	phys_addr_t start;
>  	unsigned long size;
>
> -	if (initrd_start >= initrd_end) {
> -		pr_info("initrd not found or empty");
> +	/* Ignore the virtul address computed during device tree parsing */
> +	initrd_start = initrd_end = 0;
> +
> +	if (!phys_initrd_size)
> +		return;
> +	/*
> +	 * Round the memory region to page boundaries as per free_initrd_mem()
> +	 * This allows us to detect whether the pages overlapping the initrd
> +	 * are in use, but more importantly, reserves the entire set of pages
> +	 * as we don't want these pages allocated for other purposes.
> +	 */
> +	start = round_down(phys_initrd_start, PAGE_SIZE);
> +	size = phys_initrd_size + (phys_initrd_start - start);
> +	size = round_up(size, PAGE_SIZE);
> +
> +	if (!memblock_is_region_memory(start, size)) {
> +		pr_err("INITRD: 0x%08llx+0x%08lx is not a memory region",
> +		       (u64)start, size);
>  		goto disable;
>  	}
> -	if (__pa_symbol(initrd_end) > PFN_PHYS(max_low_pfn)) {
> -		pr_err("initrd extends beyond end of memory");
> +
> +	if (memblock_is_region_reserved(start, size)) {
> +		pr_err("INITRD: 0x%08llx+0x%08lx overlaps in-use memory region\n",
> +		       (u64)start, size);
>  		goto disable;
>  	}
>
> -	size = initrd_end - initrd_start;
> -	memblock_reserve(__pa_symbol(initrd_start), size);
> +	memblock_reserve(start, size);
> +	/* Now convert initrd to virtual addresses */
> +	initrd_start = (unsigned long)__va(phys_initrd_start);
> +	initrd_end = initrd_start + phys_initrd_size;
>  	initrd_below_start_ok = 1;
>
>  	pr_info("Initial ramdisk at: 0x%p (%lu bytes)\n",

I'm going to put this one on fixes, but I don't think that's the right:
DEBUG_VIRTUAL just catches the bug, but as far as I can tell it's been there
since the beginning.  I'm going to replace this with

Fixes: 76d2a0493a17 ("RISC-V: Init and Halt Code")

It's not going to apply back that far, but we can always backport it where it
fails.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
