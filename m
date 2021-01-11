Return-Path: <SRS0=44w3=GO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E53C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 19:20:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1AF422CA1
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 19:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1AF422CA1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qNBfVCxp0bvSoWw8mo5donsJqtY0aVOJD8rlkm2/0z0=; b=WWD/k0YJ9b2JLCOlaAdTYqZw4
	lQQjGNVTEJZtNZrhz0jkYrF7MHvwvFGk2eUlKomHCm46wo+4rz2RpcKXO8DYNpDMHX9vyIT9RO+aA
	6YHBsCYqCJB3xlXvDPHY9XqS6rCLjBJWSOTBZGwhGCsLzdePQiHsfCGXU1lNG/5qy+ZZH9sVYIXmq
	XNr9KdT5jw1t2zyZqsH8aPjHTLvzGIZlRh+M1n1+WgwR71kBuo27WEp58Kcbn+AUQ+0jFuSKwpS/W
	wrPRNUbjGlrh3//frKSeU6RE1RGRlnPENx+moBkOh6fLg3N+Ux8rZvWSfndyl/tQliMPGKHxWtrCm
	6qwCZS8pA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz2jq-0007IT-Dz; Mon, 11 Jan 2021 19:20:26 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz2ji-0007BZ-24
 for linux-riscv@lists.infradead.org; Mon, 11 Jan 2021 19:20:22 +0000
Received: by mail-il1-x12c.google.com with SMTP id v3so260354ilo.5
 for <linux-riscv@lists.infradead.org>; Mon, 11 Jan 2021 11:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nDbikhMgQRIBAGWvHhwnSOWp+tYdIa1L7HqD2Fuhn5o=;
 b=TNk8AsQklmM1D18YtjeuP5msks8k476ei5PZfBL/rN+WUCBbkWH5tSwvzzd5cdrK3z
 Au896fIPreNaHrPS29rJmrmXO89zRZN+HdhQ2txPclH9RI2uPkuron3RBWCrewyB6oiV
 7GbGoIPTWXbxsHAf/Y1gReu0BWWttvce4AbBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nDbikhMgQRIBAGWvHhwnSOWp+tYdIa1L7HqD2Fuhn5o=;
 b=ec3l8OL0Kzl/BT8RxnV1OLlo9nZox4cHbs5JR4H6L/QsQfVRCudHAsxjipMYy63F9g
 eevDvIpbPi48bA+uaJUTYmROnHWFFe+sgL5jpVQl9+OTJ3wOIedchjEQdItJUUo/sgxZ
 fweEi5euChbNl8W9RYvctqnq0RPzhuByEZv1M85OhgTG6a2WEI4WGmESLVnprH16WPnl
 hOEfRXtPoWNTdo9KxugBK/a6LpT4/pAQ/JdYyMWxjsAaPjW+hL2cc96Ey2DWkFB8Ou+9
 lA5LMnBOV8SOWIXMPTwvKYRJ5a8J+E08fQ7W7N0PJHp9+skTCIU6ebCUaOCCC9dpPwco
 /Z2w==
X-Gm-Message-State: AOAM531ef9YbCBghxQCu+cqKUKn9Mt+eMOBqX56RHMFgZs4lGiHIufF2
 k/JSi2etnSmbtodIiJZOrsfgFiHAFY0zdLDtcEZR
X-Google-Smtp-Source: ABdhPJzkn7BbM4YArCF4jyHvJMfbgs77ibK0XTF30AzoxUE582rYgBVYQd58Gi8jMJG7GedknFeRdUTeZMhJ8kG+JtQ=
X-Received: by 2002:a92:512:: with SMTP id q18mr590913ile.147.1610392813919;
 Mon, 11 Jan 2021 11:20:13 -0800 (PST)
MIME-Version: 1.0
References: <20210107092652.3438696-1-atish.patra@wdc.com>
 <20210107092652.3438696-3-atish.patra@wdc.com>
 <CAAhSdy0AdK3YbnqmG_rBAneDSHBZwFSEr5+HkkUm-3SO_--zAQ@mail.gmail.com>
In-Reply-To: <CAAhSdy0AdK3YbnqmG_rBAneDSHBZwFSEr5+HkkUm-3SO_--zAQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 11 Jan 2021 11:20:03 -0800
Message-ID: <CAOnJCUJNC3UzNapLG9yXKF6areRZaN5UvPJOX_YsNk+PY2TFUw@mail.gmail.com>
Subject: Re: [PATCH 2/4] RISC-V: Set current memblock limit
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_142018_272430_4364EC62 
X-CRM114-Status: GOOD (  26.77  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Ard Biesheuvel <ardb@kernel.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Jan 10, 2021 at 7:59 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Thu, Jan 7, 2021 at 2:57 PM Atish Patra <atish.patra@wdc.com> wrote:
> >
> > Currently, linux kernel can not use last 4k bytes of addressable space because
> > IS_ERR_VALUE macro treats those as an error. This will be an issue for RV32
> > as any memblock allocator potentially allocate chunk of memory from the end
> > of DRAM (2GB) leading bad address error even though the address was technically
> > valid.
> >
> > Fix this issue by limiting the memblock if available memory spans the entire
> > address space.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  arch/riscv/mm/init.c | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index bf5379135e39..da53902ef0fc 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -157,9 +157,10 @@ static void __init setup_initrd(void)
> >  void __init setup_bootmem(void)
> >  {
> >         phys_addr_t mem_start = 0;
> > -       phys_addr_t start, end = 0;
> > +       phys_addr_t start, dram_end, end = 0;
> >         phys_addr_t vmlinux_end = __pa_symbol(&_end);
> >         phys_addr_t vmlinux_start = __pa_symbol(&_start);
> > +       phys_addr_t max_mapped_addr = __pa(PHYS_ADDR_MAX);
>
> Using PHYS_ADDR_MAX as the max virtual address does not look right.
>
> Better use __pa(~(ulong)0) here. Otherwise looks good to me.
>

ok will change it. Thanks for the review.

> Reviewed-by: Anup Patel <anup@brainfault.org>
>
> >         u64 i;
> >
> >         /* Find the memory region containing the kernel */
> > @@ -181,7 +182,18 @@ void __init setup_bootmem(void)
> >         /* Reserve from the start of the kernel to the end of the kernel */
> >         memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
> >
> > -       max_pfn = PFN_DOWN(memblock_end_of_DRAM());
> > +       dram_end = memblock_end_of_DRAM();
> > +
> > +       /*
> > +        * memblock allocator is not aware of the fact that last 4K bytes of
> > +        * the addressable memory can not be mapped because of IS_ERR_VALUE
> > +        * macro. Make sure that last 4k bytes are not usable by memblock
> > +        * if end of dram is equal to maximum addressable memory.
> > +        */
> > +       if (max_mapped_addr == (dram_end - 1))
> > +               memblock_set_current_limit(max_mapped_addr - 4096);
> > +
> > +       max_pfn = PFN_DOWN(dram_end);
> >         max_low_pfn = max_pfn;
> >         dma32_phys_limit = min(4UL * SZ_1G, (unsigned long)PFN_PHYS(max_low_pfn));
> >         set_max_mapnr(max_low_pfn);
> > --
> > 2.25.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> Regards,
> Anup
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
