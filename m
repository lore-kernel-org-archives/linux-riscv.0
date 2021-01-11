Return-Path: <SRS0=44w3=GO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4636C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 03:55:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F1372245C
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 03:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F1372245C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+VZT5GIvElMQHwyCYn+w9Gric019Cyes2X/4DBBdFPI=; b=W49HL2berj1Du7Qm9A6tVeY9J
	HWau8ibyrEwgvTh9Ti0TeLAUcfTBTvccBTFtae6aJ14AblM0tfhOtnr3gDProyXcRZgFDNX1FKknG
	WtRVT6wei4Mb+7QFZPDGQCSr4Id2xXPBCL6hQmfSZinKOCeExJOskpo13cr4oPxUvv15rKPNwlzcv
	UyzovUNjBTWvpo5CF66vnLDH62UCKQNTKDmOY1+CsipBUxOF1miLfCCnY4OZZEc37RiCwbQUYN4Xa
	wEo7qEKt3H8f52oSpu4U2Lo3J2JxzR4KN1ddGkReyYAJ/7vnU3z+fs/PXNMIdmfy202VqPodAPn7m
	MlTxVGwbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyoIS-0000uy-11; Mon, 11 Jan 2021 03:55:12 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyoIO-0000sb-I5
 for linux-riscv@lists.infradead.org; Mon, 11 Jan 2021 03:55:10 +0000
Received: by mail-lf1-x12d.google.com with SMTP id m25so35703326lfc.11
 for <linux-riscv@lists.infradead.org>; Sun, 10 Jan 2021 19:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sr+DncRAcarFLKh+c+QBPllXcM43qLzk8obliPGN9Yw=;
 b=D9J3THCj5CqRjAq44aFvUouVNflCAlU6BtEqn9WlmQJdBqibVt4+C1olA6K1Hx+oYJ
 MxyqZKzagqRPw6w4zr+dYjFjMG9u90U75FQec6J9WTDjDMXzZCJv5LDT1QE2gRNKQj6G
 31jfKQS5Crz8lkofGpdlY7GyrI5yMxVpS7rOA0PQbHi6PgtLqBT/JvLLcdkIVieX7MQW
 I5GzmOhbaaF5FQ9IvAAoL83TQBdwKH6/+++4gqH4y2vWp1Fx+UFTZpVmcmrM0H9strQh
 g4j04MaExqNuNETyzynJ/K+81zakwGhxeEMd78Y6FqP+DQkhO+OVcOoiinLPH4lLPgMA
 zTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sr+DncRAcarFLKh+c+QBPllXcM43qLzk8obliPGN9Yw=;
 b=kkcrcDkoLp7Vs82wTO2w+aIi3u31dGJBT9vW2mGdjOJbdgGpzH9YPgYpPapqt2zFVb
 fWfUd2vwgD6wQiYbJpEl61+/IYfOy3czpH9WdyXaMELVlKVRIR+uvrPedefimqMPBbiY
 vLg1MErhfiOtO0RphRTsE6moNKM5JGwsAHfsT18p32fRj2j0NpYlH86ELyay5IGjbm0G
 GOkQgSsJrVySMhFkKJX0Bsy2kdchV8oW3R0h69Lm0Et1UK7ieX8i39D11KrqWzASlz+Y
 9mxoTWzfU2Mgcppg1iNFfwyaL7ngCIg9LJbH7JFkZPDsN6BwJDzeUY9v4cBeukIAG87m
 GWTw==
X-Gm-Message-State: AOAM532XkxGQVGsEEneStoAYSHh+ViBpmb/g5cCgZDbLaEUQHVoDIuSm
 c4zY2D1ppwUzgCOtCVUn4j2A3QCPsRDNuX4Q7wcXBQ==
X-Google-Smtp-Source: ABdhPJwSTCYozEDXX/n9jG6dUUyxKByayKPK2cjAmLTDI35N2IEkJUHSvfV/zxQ6DiYjOCAZazMut9CGI1Wj6X+013U=
X-Received: by 2002:a05:6512:34c5:: with SMTP id
 w5mr6213401lfr.214.1610337304823; 
 Sun, 10 Jan 2021 19:55:04 -0800 (PST)
MIME-Version: 1.0
References: <20210107092652.3438696-1-atish.patra@wdc.com>
 <20210107092652.3438696-2-atish.patra@wdc.com>
In-Reply-To: <20210107092652.3438696-2-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 Jan 2021 09:24:52 +0530
Message-ID: <CAAhSdy1h3ALfg5VVC8_Tq24mji=4Ds9DByqwmE2A3b_Kq2ZphQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] RISC-V: Do not allocate memblock while iterating
 reserved memblocks
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210110_225508_849661_63FDD57E 
X-CRM114-Status: GOOD (  25.36  )
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
> Currently, resource tree allocates memory blocks while iterating on the
> list. It leads to following kernel warning because memblock allocation
> also invokes memory block reservation API.
>
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] WARNING: CPU: 0 PID: 0 at kernel/resource.c:795
> __insert_resource+0x8e/0xd0
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted
> 5.10.0-00022-ge20097fb37e2-dirty #549
> [    0.000000] epc: c00125c2 ra : c001262c sp : c1c01f50
> [    0.000000]  gp : c1d456e0 tp : c1c0a980 t0 : ffffcf20
> [    0.000000]  t1 : 00000000 t2 : 00000000 s0 : c1c01f60
> [    0.000000]  s1 : ffffcf00 a0 : ffffff00 a1 : c1c0c0c4
> [    0.000000]  a2 : 80c12b15 a3 : 80402000 a4 : 80402000
> [    0.000000]  a5 : c1c0c0c4 a6 : 80c12b15 a7 : f5faf600
> [    0.000000]  s2 : c1c0c0c4 s3 : c1c0e000 s4 : c1009a80
> [    0.000000]  s5 : c1c0c000 s6 : c1d48000 s7 : c1613b4c
> [    0.000000]  s8 : 00000fff s9 : 80000200 s10: c1613b40
> [    0.000000]  s11: 00000000 t3 : c1d4a000 t4 : ffffffff
>
> This is also unnecessary as we can pre-compute the total memblocks required
> for each memory region and allocate it before the loop. It save precious
> boot time not going through memblock allocation code every time.
>
> Fixes: 00ab027a3b82 ("RISC-V: Add kernel image sections to the resource tree")
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

> ---
>  arch/riscv/kernel/setup.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 1d85e9bf783c..3fa3f26dde85 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -127,7 +127,9 @@ static void __init init_resources(void)
>  {
>         struct memblock_region *region = NULL;
>         struct resource *res = NULL;
> -       int ret = 0;
> +       struct resource *mem_res = NULL;
> +       size_t mem_res_sz = 0;
> +       int ret = 0, i = 0;
>
>         code_res.start = __pa_symbol(_text);
>         code_res.end = __pa_symbol(_etext) - 1;
> @@ -145,16 +147,17 @@ static void __init init_resources(void)
>         bss_res.end = __pa_symbol(__bss_stop) - 1;
>         bss_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
>
> +       mem_res_sz = (memblock.memory.cnt + memblock.reserved.cnt) * sizeof(*mem_res);
> +       mem_res = memblock_alloc(mem_res_sz, SMP_CACHE_BYTES);
> +       if (!mem_res)
> +               panic("%s: Failed to allocate %zu bytes\n", __func__, mem_res_sz);
>         /*
>          * Start by adding the reserved regions, if they overlap
>          * with /memory regions, insert_resource later on will take
>          * care of it.
>          */
>         for_each_reserved_mem_region(region) {
> -               res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
> -               if (!res)
> -                       panic("%s: Failed to allocate %zu bytes\n", __func__,
> -                             sizeof(struct resource));
> +               res = &mem_res[i++];
>
>                 res->name = "Reserved";
>                 res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
> @@ -171,8 +174,10 @@ static void __init init_resources(void)
>                  * Ignore any other reserved regions within
>                  * system memory.
>                  */
> -               if (memblock_is_memory(res->start))
> +               if (memblock_is_memory(res->start)) {
> +                       memblock_free((phys_addr_t) res, sizeof(struct resource));
>                         continue;
> +               }
>
>                 ret = add_resource(&iomem_resource, res);
>                 if (ret < 0)
> @@ -181,10 +186,7 @@ static void __init init_resources(void)
>
>         /* Add /memory regions to the resource tree */
>         for_each_mem_region(region) {
> -               res = memblock_alloc(sizeof(struct resource), SMP_CACHE_BYTES);
> -               if (!res)
> -                       panic("%s: Failed to allocate %zu bytes\n", __func__,
> -                             sizeof(struct resource));
> +               res = &mem_res[i++];
>
>                 if (unlikely(memblock_is_nomap(region))) {
>                         res->name = "Reserved";
> @@ -205,9 +207,9 @@ static void __init init_resources(void)
>         return;
>
>   error:
> -       memblock_free((phys_addr_t) res, sizeof(struct resource));
>         /* Better an empty resource tree than an inconsistent one */
>         release_child_resources(&iomem_resource);
> +       memblock_free((phys_addr_t) mem_res, mem_res_sz);
>  }
>
>
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
