Return-Path: <SRS0=44w3=GO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDBA8C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 03:59:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BFF22245C
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 03:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BFF22245C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KvIsJYP3rYA6ma1FLsYJRAPA20YPAdBjn7DqwuVWii4=; b=1szuKQ5pSJlowdlbsE6o/mHv4
	veFO5VxcoBXuQBPXKiLLfMChuIN1ymWNdd+yD7rmeGvYDH+Xll/Ij0X+cewGEEzV8/mkz5exAEjuR
	logh9Dy8a3djHFiidBLwiZ6VtSkzGI2B7z7wEEpCQ7WeN86GoX5XuGjWXIwfU70C8aRMNy645fDBH
	apoAJZsvSvKal9yuCc92Qo3L//M7rQw+3oDt7aQE5RfTmgE0uf9eESBU70iBy46U3d/53evA3q8zo
	qUG7ikhmGn7qq6cd2uECrsLC8boYCvjbFZ6PfliVLtZ5Dm5VSRusjFOW4ZoVzZBeLbobt4JEdz/4z
	t/FlqVOlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyoMD-00023B-Cj; Mon, 11 Jan 2021 03:59:05 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyoMA-00021L-9A
 for linux-riscv@lists.infradead.org; Mon, 11 Jan 2021 03:59:03 +0000
Received: by mail-lj1-x22f.google.com with SMTP id y22so2016761ljn.9
 for <linux-riscv@lists.infradead.org>; Sun, 10 Jan 2021 19:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+cAZNgRoYkzoP/BhJ9P6BIGZW8pFnUjY93pDjiW7NME=;
 b=lPp5vs7bcac0seBLFXigYh8T8CRIzbqwfqeJQqIY8Zg3c3dsvEecwg3f5K9aG5frIc
 UgcK38xPhVYBfPmZzr0ilMolRlyXVmPChbHqJZUt5/3GQtCDzaMmbvDR9iUDrQPGnXAO
 OuDAUJl7+7PQQflYSTa3O9YrmOPFf4DzyL8eR8bF54jYz5dF2R3mMQm1fmzb/fLJ+1zb
 rU3q2KTVeueNbTnWT9KcA/yu8tSYxIvgMRJppmOuPDmOzxrq63b1sNkntRO2+a6ED3rX
 JGxs8GiyOADfzzc3FkcmwpHi2KJEJg8KLTeSutGPh6lISKHbqmwLi6qOx8MmA00cVGtR
 IKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+cAZNgRoYkzoP/BhJ9P6BIGZW8pFnUjY93pDjiW7NME=;
 b=h3OXrXGd05Tv1XO7FP3iwRO6TcE6nCccWTuClG6mIXHZdQt1bgFtm3NFgtia4WiA3t
 y3qV5nlR9D3b+HA/lh7DVoCAxlu2ewvLWO8g2rOM/I1H1e6IpICdIYuXa0m98ZKzE/w0
 vQt/B72S6UyyosWvZbcnnWP3tfEP+anUBv+Ia/uXWXojIUcRChOJzob8g/Vm/rT4h5q/
 x6NFXSG484sZds48WZwICwkTswfwPOUbpPaEjfzBDjyVRWJ6qH9gHuYjPatoL+7LR8wD
 omWtcyhJm1cYl/+DIypctxHGbuyhE5uPWPvtnpTRtJ77oyJ2+kAb93P2oXMcm0AH+yox
 Uw6w==
X-Gm-Message-State: AOAM533j1BQBdzl9qT3Uu7rsPLVV/Qx3eCEHBVTFX+SfE9vJX2/5qWlb
 yqwsIELH0GK6NLsSgL1pV9F5C28ZYro+rjbhUd4h1w==
X-Google-Smtp-Source: ABdhPJyjA7Xd2SY/nPT2Ibiuxa5VDtx2rZYvW6pqu5Woy+jyyau4j3Yb6SuGX8YGMnYm65G+vp62WShyrLs61GPCQsE=
X-Received: by 2002:a2e:8e98:: with SMTP id z24mr6326578ljk.83.1610337539722; 
 Sun, 10 Jan 2021 19:58:59 -0800 (PST)
MIME-Version: 1.0
References: <20210107092652.3438696-1-atish.patra@wdc.com>
 <20210107092652.3438696-3-atish.patra@wdc.com>
In-Reply-To: <20210107092652.3438696-3-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 Jan 2021 09:28:48 +0530
Message-ID: <CAAhSdy0AdK3YbnqmG_rBAneDSHBZwFSEr5+HkkUm-3SO_--zAQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] RISC-V: Set current memblock limit
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210110_225902_356505_8E9168C8 
X-CRM114-Status: GOOD (  23.20  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 7, 2021 at 2:57 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> Currently, linux kernel can not use last 4k bytes of addressable space because
> IS_ERR_VALUE macro treats those as an error. This will be an issue for RV32
> as any memblock allocator potentially allocate chunk of memory from the end
> of DRAM (2GB) leading bad address error even though the address was technically
> valid.
>
> Fix this issue by limiting the memblock if available memory spans the entire
> address space.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/mm/init.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index bf5379135e39..da53902ef0fc 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -157,9 +157,10 @@ static void __init setup_initrd(void)
>  void __init setup_bootmem(void)
>  {
>         phys_addr_t mem_start = 0;
> -       phys_addr_t start, end = 0;
> +       phys_addr_t start, dram_end, end = 0;
>         phys_addr_t vmlinux_end = __pa_symbol(&_end);
>         phys_addr_t vmlinux_start = __pa_symbol(&_start);
> +       phys_addr_t max_mapped_addr = __pa(PHYS_ADDR_MAX);

Using PHYS_ADDR_MAX as the max virtual address does not look right.

Better use __pa(~(ulong)0) here. Otherwise looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

>         u64 i;
>
>         /* Find the memory region containing the kernel */
> @@ -181,7 +182,18 @@ void __init setup_bootmem(void)
>         /* Reserve from the start of the kernel to the end of the kernel */
>         memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
>
> -       max_pfn = PFN_DOWN(memblock_end_of_DRAM());
> +       dram_end = memblock_end_of_DRAM();
> +
> +       /*
> +        * memblock allocator is not aware of the fact that last 4K bytes of
> +        * the addressable memory can not be mapped because of IS_ERR_VALUE
> +        * macro. Make sure that last 4k bytes are not usable by memblock
> +        * if end of dram is equal to maximum addressable memory.
> +        */
> +       if (max_mapped_addr == (dram_end - 1))
> +               memblock_set_current_limit(max_mapped_addr - 4096);
> +
> +       max_pfn = PFN_DOWN(dram_end);
>         max_low_pfn = max_pfn;
>         dma32_phys_limit = min(4UL * SZ_1G, (unsigned long)PFN_PHYS(max_low_pfn));
>         set_max_mapnr(max_low_pfn);
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
