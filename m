Return-Path: <SRS0=pdFK=IN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91F7C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Mar 2021 18:13:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6725E64E28
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Mar 2021 18:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6725E64E28
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6D/zAQ+BeJyGJCFkfO2ouXf0tjOJctU1xCB5TGf4Ag8=; b=pwTREn764ERJkYdoiYk/DRFmN
	GLuY1pmJoMqrLmJiU3ql+AyGuKWMB3SUklSx3LC5dOzrKe2boRiYg8yU1kNv4hWXDPhbUPuzLE3DD
	S5E0hjwqvznaUZX+yNfx2fjXt92M/CErrapP6RQOIT62gDHWTc+JWERfOXhViYPfYwafRNLeGoj9J
	650rBTGNFQl5K0r2Zz6uGSCZr9IKfxE6/+cCmEemJPFyTSSDxu3+Q8RHqe/OSKc8CyHNmaAXomw0j
	PBpo1Dd7ww5KAcdyGqAtAfiZV3aYCzNPpBZdHMtxSpgSOIK3VdmS3gJ3stgzLY6rUhghprKchiycL
	ipCRqCX+A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLri8-00GeyZ-9P; Mon, 15 Mar 2021 18:13:00 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLrhu-00Gew1-NQ
 for linux-riscv@lists.infradead.org; Mon, 15 Mar 2021 18:12:50 +0000
Received: by mail-io1-xd2b.google.com with SMTP id n14so34429043iog.3
 for <linux-riscv@lists.infradead.org>; Mon, 15 Mar 2021 11:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7fKYmnTB6DXaLcQZf4n09mIgyLcDIP+NwqQZDD2xiRY=;
 b=ce0oxV3QtCW7e5n3oKOkctWUwAZKQevwIxOW/h/kU0WoYIW2/XQ6PCGFS+NG1N34Fi
 65SgsTOSg+4qxg6ex8lEBKFsaDq8mbL9+HeJuu6JqPXZCc3ujJFLQXeWgithGkGhoAzZ
 dNLkgFoEwWfjHdpEzglI+MTmtoG35bSrt9Z4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7fKYmnTB6DXaLcQZf4n09mIgyLcDIP+NwqQZDD2xiRY=;
 b=kiPQ3Y5upovHoQw7frnulvDKJ7mth4spqeflfReOGNzlqVtEDcpvFSF79V7Udxq0vJ
 k9SRld57j/sNBa3cq2KB5YS182NG6yw0cwGxdS5huvCuTjGtYcg1uN/SjZ4QzeD5TTbd
 w08Z7o3EFxKKEQeZXRPy1kwt2jyfUuUsB9rtJqlhXsmZseVkVXEKeo/hny003EbvLgY4
 tj+yFkf8yrGSpk7qrD5w8YhaMgyvLAYKoVMhOUNZoxe24n91HATs33pNxdAE2tLPZMW8
 86mwenvzvwJbwMR/OHWR4XPVxelT3XJm/rIEdtKs7pNBXZwddqJ379nz0erFe8P4PMFB
 nSew==
X-Gm-Message-State: AOAM533oyecxI6LBzhXFOjIBnKHNUbjK29muy6hIVMRIaPjO5BEW9CD6
 W7gJQoJYjECuoZ6d9IBfmYp5gmewxoiV7XwxNQvG
X-Google-Smtp-Source: ABdhPJyRxPbGeTzjInwuEoXj/XmofRze7tZLVAUfwqTGtBYTfRhhRVaJarBzC5WQ1nXSPG4cQupDOuMNrgtMc6LOijA=
X-Received: by 2002:a05:6638:238c:: with SMTP id
 q12mr10833915jat.114.1615831965491; 
 Mon, 15 Mar 2021 11:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210312154634.3541844-1-geert@linux-m68k.org>
In-Reply-To: <20210312154634.3541844-1-geert@linux-m68k.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 15 Mar 2021 11:12:34 -0700
Message-ID: <CAOnJCULrkGjQgdUM+XTmSLfXmiioRDmBMb3p7rA06wHNTBcdGg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Fix out-of-bounds accesses in init_resources()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_181247_751753_1BB0BB2C 
X-CRM114-Status: GOOD (  24.42  )
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

On Fri, Mar 12, 2021 at 7:46 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> init_resources() allocates an array of resources, based on the current
> total number of memory regions and reserved memory regions.  However,
> allocating this array using memblock_alloc() might increase the number
> of reserved memory regions.  If that happens, populating the array later
> based on the new number of regions will cause out-of-bounds writes
> beyond the end of the allocated array.
>
> Fix this by allocating one more entry, which may or may not be used.
>
> Fixes: 797f0375dd2ef5cd ("RISC-V: Do not allocate memblock while iterating reserved memblocks")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Tested on vexriscv, which works now using L1_CACHE_SHIFT = 6, too.
>
> This issue may show up during early boot as:
>
>     Unable to handle kernel paging request at virtual address c8000008
>     Oops [#1]
>     CPU: 0 PID: 0 Comm: swapper Not tainted 5.11.0-orangecrab-00023-g7c4fc8e3e982-dirty #137
>     epc: c04d6660 ra : c04d6560 sp : c05ddf70
>      gp : c0678bc0 tp : c05e5b40 t0 : c8000000
>      t1 : 00030000 t2 : ffffffff s0 : c05ddfc0
>      s1 : c8000000 a0 : 00000000 a1 : c7ffffe0
>      a2 : 00000005 a3 : 00000001 a4 : 0000000c
>      a5 : 00000000 a6 : c04fe000 a7 : 0000000c
>      s2 : c04fe098 s3 : 000000a0 s4 : c7ffff60
>      s5 : c04fe0dc s6 : 80000200 s7 : c059f1d4
>      s8 : 81000200 s9 : c059f1f0 s10: 80000200
>      s11: c059f1d4 t3 : 405dbb60 t4 : c05e6f08
>      t5 : 81000200 t6 : 40501000
>     status: 00000100 badaddr: c8000008 cause: 0000000f
>     random: get_random_bytes called from print_oops_end_marker+0x38/0x7c with crng_init=0
>     ---[ end trace 0000000000000000 ]---
>
> or much later as:
>
>     Unable to handle kernel paging request at virtual address 69726573
> ---
>  arch/riscv/kernel/setup.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index e85bacff1b5075ee..f8f15332caa20263 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -147,7 +147,8 @@ static void __init init_resources(void)
>         bss_res.end = __pa_symbol(__bss_stop) - 1;
>         bss_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
>
> -       mem_res_sz = (memblock.memory.cnt + memblock.reserved.cnt) * sizeof(*mem_res);
> +       /* + 1 as memblock_alloc() might increase memblock.reserved.cnt */
> +       mem_res_sz = (memblock.memory.cnt + memblock.reserved.cnt + 1) * sizeof(*mem_res);
>         mem_res = memblock_alloc(mem_res_sz, SMP_CACHE_BYTES);
>         if (!mem_res)
>                 panic("%s: Failed to allocate %zu bytes\n", __func__, mem_res_sz);
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Thanks for catching the bug & fixing it.


Reviewed-by: Atish Patra <atish.patra@wdc.com>
-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
