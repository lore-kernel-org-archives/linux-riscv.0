Return-Path: <SRS0=+l7Y=HK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE859C433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 22:03:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3465364E66
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 22:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3465364E66
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VySkHRfEFEYEgbwuqT2J8RDhJ9V/2CHVVBLzfps0hTU=; b=RZ1qZCWMvptjYpXaaPpQWbV69
	VZh1OyJnJbntZV0HdUptGCwQxAV16VrTFZjUW+FThhTv8CbntoAnadxbJK+1taCKiLQmCsslo2E/8
	uNz2NQYUb1wIC/IGyH+m2HJKOTGfVQL7GTsYmpl7iCUA6wI4Nr1D2eFOh0mcAW4d+Qau089JvQdDi
	gxt5ZpSz+x8fuP6idyino97I4eYjxBNA9wPc8rOVnyetMuSxVzl839bVhSTc5Ibsdj1AMwA8frkFQ
	B9CHTdKiUg/9h33uQB2dJEy+4UoWazzyMHelGayJGMg318Lu3Yfcl78X3MctvZmgmk5zbGsofxypB
	UG+yPThXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Ect-0004Ps-Oj; Mon, 08 Feb 2021 22:03:23 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Ecr-0004PK-Ti
 for linux-riscv@lists.infradead.org; Mon, 08 Feb 2021 22:03:23 +0000
Received: by mail-il1-x12c.google.com with SMTP id q5so14251137ilc.10
 for <linux-riscv@lists.infradead.org>; Mon, 08 Feb 2021 14:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yXLdvMagnUfIHghSWkAg8rwd0Hp48eAodLJV9XqTjdk=;
 b=YShO9gX0pJ2mcuc8+YQevBvKYlVZ2n7C4sj+jyl7T7Wgzfo/2OH4WkNy4Mpox+hgOF
 p4UCalHiY9uDepVnYtw0Yk1BuQgVERBIq/Q1nHyN/P0NA6sbBYxDsd3tydIrHh+kcSgw
 WFG39AHZG7rZuyAJeIpwlZKQh/oXNhzPrjkzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yXLdvMagnUfIHghSWkAg8rwd0Hp48eAodLJV9XqTjdk=;
 b=k0VCHZJnI0AoRFRHv3Q/MjKqZoY8b8wOyCvgfFUScQc+CeH4rPy4p2cRyJ8Iv4O8p7
 8vnUGvu9OR2KkmF8uFBdZm2Uxq4+LvS4t6X5DDg8Ov0GtYlTCUQrO7uhMG+bUbG3hGrT
 2tu337qWhTtlCk39HKj5Jmzk6wUHv21s7mWTz+8an262synT0EmEmBOnz+ywPJW7m9ne
 89AGqZggdLEgAkqJCoEbwQsDpdGuT2iMI4mz0cZgSc01/OODxPFJmFtSNoARyO9HBBDY
 kHJQT42zJFWzPTeOR1qe1eAB3jtNjsgfvxQhmjd3g88ruWt5xa/I4kDf8U8VeUS2e2CN
 AazQ==
X-Gm-Message-State: AOAM532ytc1kdaGkrZsLAXfKtsVfmicPIi/QBokoXb/uKybhLGaPPijV
 d5zzOEaczWtDrlCLFrBpZMOyQideJxWUf3iYgpDn
X-Google-Smtp-Source: ABdhPJyJ0c0Xj6LBESGFc4/QrqkXgFNZczTSS7vyrNSnUDqMG//LdcgaOMHn5aPRzxw08FaYl1o6X5OnDIp5LTvkXi4=
X-Received: by 2002:a92:ce50:: with SMTP id a16mr17598051ilr.219.1612821800061; 
 Mon, 08 Feb 2021 14:03:20 -0800 (PST)
MIME-Version: 1.0
References: <20210207123856.141737-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20210207123856.141737-1-wangkefeng.wang@huawei.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 8 Feb 2021 14:03:09 -0800
Message-ID: <CAOnJCUKdabPhU-xm4eHsG-nS5WYREkE6gG39PgdyknT=HTgeRg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Cleanup setup_bootmem()
To: Kefeng Wang <wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_170322_021958_9ED4E6E8 
X-CRM114-Status: GOOD (  21.02  )
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
Cc: Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Feb 7, 2021 at 4:35 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> After the following patches,
>
>   commit de043da0b9e7 ("RISC-V: Fix usage of memblock_enforce_memory_limit")
>   commit 1bd14a66ee52 ("RISC-V: Remove any memblock representing unusable memory area")
>   commit b10d6bca8720 ("arch, drivers: replace for_each_membock() with for_each_mem_range()")
>
> some logical is useless, kill the mem_start/start/end and unneed code.
>

/s/logical/logic
/s/unneed/uneeded
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/mm/init.c | 21 ++-------------------
>  1 file changed, 2 insertions(+), 19 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 0b86a1a12da2..241f22348403 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -108,34 +108,17 @@ void __init mem_init(void)
>
>  void __init setup_bootmem(void)
>  {
> -       phys_addr_t mem_start = 0;
> -       phys_addr_t start, dram_end, end = 0;
>         phys_addr_t vmlinux_end = __pa_symbol(&_end);
>         phys_addr_t vmlinux_start = __pa_symbol(&_start);
> +       phys_addr_t dram_end = memblock_end_of_DRAM();
>         phys_addr_t max_mapped_addr = __pa(~(ulong)0);
> -       u64 i;
> -
> -       /* Find the memory region containing the kernel */
> -       for_each_mem_range(i, &start, &end) {
> -               phys_addr_t size = end - start;
> -               if (!mem_start)
> -                       mem_start = start;
> -               if (start <= vmlinux_start && vmlinux_end <= end)
> -                       BUG_ON(size == 0);
> -       }
>
> -       /*
> -        * The maximal physical memory size is -PAGE_OFFSET.
> -        * Make sure that any memory beyond mem_start + (-PAGE_OFFSET) is removed
> -        * as it is unusable by kernel.
> -        */
> +       /* The maximal physical memory size is -PAGE_OFFSET. */
>         memblock_enforce_memory_limit(-PAGE_OFFSET);
>
>         /* Reserve from the start of the kernel to the end of the kernel */
>         memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
>
> -       dram_end = memblock_end_of_DRAM();
> -
>         /*
>          * memblock allocator is not aware of the fact that last 4K bytes of
>          * the addressable memory can not be mapped because of IS_ERR_VALUE
> --
> 2.26.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Thanks for the fix. Other than the nits,
Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
