Return-Path: <SRS0=Z8g5=BE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F77BC43446
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2020 05:12:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1C44206F6
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2020 05:12:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EpthaRBd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="ETKHiK8n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1C44206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=5xxYXIBBxnq3hkIl3MjicAbTR9DogYqfNhVD1L46GBg=; b=EpthaRBd4CTfLk8zOk55CI1wS
	8VxhXnKcxhcQK8E7AZLALnqAaAbPnvbIqOb8rwkm2SEyGyik48f7LVW/x+2YMg51RtGqW2pMiuqjZ
	zxrOfjQTrx/JjjrwcTKHYcM1jTwzT0F9MrxW1JQED1RSu14kZ2qzXddhkUGGS7u5D2CiMPs69TShH
	MmFYkZfy66lLkmjJ5I0WZYTADvMv+Hgj/LJhG/gLjlHVrIC4grxWtX6QzXDM4ji5qTsR+MQ6bHCFP
	l3KvOk4gpZq17Mm1HQ+I9dPzHwCJKrqhDR65Oe1ZNF7zju4fpBpOqQItxFkmz3A/AMQePjUD9mgeo
	3kBLb7/RA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzCUL-0005Ey-Ts; Sat, 25 Jul 2020 05:12:49 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzCUH-0005Cl-9Z
 for linux-riscv@lists.infradead.org; Sat, 25 Jul 2020 05:12:46 +0000
Received: by mail-pj1-x1041.google.com with SMTP id a9so6460347pjd.3
 for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2020 22:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=DrFSqlp6N5hVS2J5LBpv5q3jiLHrhXO1dKkZQLcwDsA=;
 b=ETKHiK8nr+iV+B62aVfQqRgoTi6y+8Nsvrymauknp+n3HnLTwS+VKgHGHraHbeVx4m
 0rWCXMn0/E+pyv74rE29/PmaGadbtm1+iCgkOFxW/rfdg5SBLA1Q9yUjg1VbL42DDvtD
 H07m44nsy9AmpsOQpHrPMlzNxEUizgdmfjGZK3xKPa70ompTgOhdpNSFywA00iHdt6gN
 FK9QYJ5Rtg+5drnkPizzhIVsPJDXLoUrGee01RRmz5+kKMJCB5n/sWsvCb0XmOpU7iME
 ACosYF00v1HkwxsZYCaztK5QbANtyoXntqGZg/4COPjOkzMBo0ecF45fubJaq2+gFECi
 DydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=DrFSqlp6N5hVS2J5LBpv5q3jiLHrhXO1dKkZQLcwDsA=;
 b=rZsKtm8gp+qbjPPor+7oST6FduqwxVBujShgF9efgCHPKWWLXR9kYesvfqw7ri4gGr
 GmUsziylcxPmahd3gaxTTZ3KebY6jvRZGVqfzZk9gAs/Gju9vjqimcl5qCLwvbJjX6jC
 J2c06nOUuzA74fPbkEEIqfj4X3hrU6mGSYWKK/4EVC+ehqy5NdwpYE3XLiRKPzAEPFT+
 tFgaBU4nSjPnKB3TJ9a+wIG85pD+iEGNV7xn+HKYJwitxX7OW+MsJ7psAkJCWQvsUhsH
 Or4gpbdxcG/EnD8dRvTBfUWVfiLXlWKYlK1bADggtgiM2XUUE2lQj3DX4hyUCnpvO6Lp
 b6eA==
X-Gm-Message-State: AOAM5301hCZYVjCRYL1WwpBSTd0NdzMBlwFcHyR/mJyZNNwe6Z9j20it
 qijlPnAvHXDoCHExNabKoijMZw==
X-Google-Smtp-Source: ABdhPJyXmUxeH1ONAeqCmQMGdvJCGS+jcxFlXcVe7yZ/XLfUb+q1nuecmx1rA+GGh534a1pzJFs5Sw==
X-Received: by 2002:a17:90a:ce02:: with SMTP id
 f2mr9091398pju.159.1595653963045; 
 Fri, 24 Jul 2020 22:12:43 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z2sm7972048pfq.67.2020.07.24.22.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 22:12:42 -0700 (PDT)
Date: Fri, 24 Jul 2020 22:12:42 -0700 (PDT)
X-Google-Original-Date: Fri, 24 Jul 2020 22:08:22 PDT (-0700)
Subject: Re: [PATCH 4/4] riscv: Parse all memory blocks to remove unusable
 memory
In-Reply-To: <20200715233009.27183-5-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-ab4785af-26a2-4494-81f7-b0c206711515@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200725_011245_341221_D98C8670 
X-CRM114-Status: GOOD (  22.72  )
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

On Wed, 15 Jul 2020 16:30:09 PDT (-0700), Atish Patra wrote:
> Currently, maximum physical memory allowed is equal to -PAGE_OFFSET.
> That's why we remove any memory blocks spanning beyond that size. However,
> it is done only for memblock containing linux kernel which will not work
> if there are multiple memblocks.
>
> Process all memory blocks to figure out how much memory needs to be removed
> and remove at the end instead of updating the memblock list in place.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/mm/init.c | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index f818a47a72d1..79e9d55bdf1a 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -147,26 +147,29 @@ void __init setup_bootmem(void)
>  {
>  	struct memblock_region *reg;
>  	phys_addr_t mem_size = 0;
> +	phys_addr_t total_mem = 0;
> +	phys_addr_t mem_start, end = 0;
>  	phys_addr_t vmlinux_end = __pa_symbol(&_end);
>  	phys_addr_t vmlinux_start = __pa_symbol(&_start);
>
>  	/* Find the memory region containing the kernel */
>  	for_each_memblock(memory, reg) {
> -		phys_addr_t end = reg->base + reg->size;
> -
> -		if (reg->base <= vmlinux_start && vmlinux_end <= end) {
> -			mem_size = min(reg->size, (phys_addr_t)-PAGE_OFFSET);
> -
> -			/*
> -			 * Remove memblock from the end of usable area to the
> -			 * end of region
> -			 */
> -			if (reg->base + mem_size < end)
> -				memblock_remove(reg->base + mem_size,
> -						end - reg->base - mem_size);
> -		}
> +		end = reg->base + reg->size;
> +		if (!total_mem)
> +			mem_start = reg->base;
> +		if (reg->base <= vmlinux_start && vmlinux_end <= end)
> +			BUG_ON(reg->size == 0);
> +		total_mem = total_mem + reg->size;
>  	}
> -	BUG_ON(mem_size == 0);
> +
> +	/*
> +	 * Remove memblock from the end of usable area to the
> +	 * end of region
> +	 */
> +	mem_size = min(total_mem, (phys_addr_t)-PAGE_OFFSET);
> +	if (mem_start + mem_size < end)
> +		memblock_remove(mem_start + mem_size,
> +				end - mem_start - mem_size);
>
>  	/* Reserve from the start of the kernel to the end of the kernel */
>  	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);

Thanks, this one is also on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
