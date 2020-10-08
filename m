Return-Path: <SRS0=qek1=DP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73861C433E7
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2020 03:55:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10F0E2085B
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2020 03:55:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1ys3j29p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="gwk/NF2d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10F0E2085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=3ZNbfdcKlKXN6W/vedwdiRP2BVLi5LyuMp2iBNhapMo=; b=1ys3j29po+nD7mY/5WRRxnFTX
	mxvqlZgyy6G0ITM61QIgPSJHHzwJyorpAQrOZIgySeQYoXlfWkQUbFWjmrqqbGC3HTml+ytW097C1
	N/ZR0HLm1UPDR8sbnEqTYlcSI3X7Gtf7tUlLRnAnTFoKxvSLT209z8I6DyJFNiadtXIdOsMhIbgvu
	+NxuhGlK5J6uWyvH41NCmiHiv3oibGXJekAxcEaxu6EixsJr7JYuTNo9baB3bIBk3S2bKSYgJKwYk
	9TLICyzbHU05xI10okideW2cYtjiLQpCLj3rqAh+dP0K6pEC0Fi+l4+cElkiAog2Z8SilF7UHrZ5N
	v8IaVj4JA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQN11-00051I-A4; Thu, 08 Oct 2020 03:54:51 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQN0x-00050Y-HY
 for linux-riscv@lists.infradead.org; Thu, 08 Oct 2020 03:54:49 +0000
Received: by mail-pf1-x444.google.com with SMTP id g10so2865273pfc.8
 for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2020 20:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Q+c2MJYhELH98kr9lkjUCAnsZSZe5uNfKC1agYba9DQ=;
 b=gwk/NF2dinzLpw9FR5Bslo0btqWiij9ybZg/UvVmRrAnxH7ifStyzuISzmMUJbO3bO
 X3d8fdmqRB6KXwm90lZawW7QFP2l622Cl6z0y+NCR9h0jFtVvtr0GGVNqxkv0ZDjRp5W
 9oAttZrPASIeT1rf3V5HQkxgvOWAtk6IQwHTASv0jRMIBYlGEMj9JJk7E8lK9MipVKKT
 ahNi+zT9HZM9XwHg1a6+SXo3wVuE3rYBHWRn6BapMC0utK1csmZQ9eLiLEG4DSXAaCTO
 a/BDXJ5ia5C8vlgLPohUJp9DvdRhaBsqO+g6E1GJkwO/FbxaJGJFvyRMd+ErAcg1wm2s
 osfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Q+c2MJYhELH98kr9lkjUCAnsZSZe5uNfKC1agYba9DQ=;
 b=Z9o6IkOJvXEtsIgcRr2Fz683xUmnyefZ4nqfassiJrGtWVoYhvb3UPAFQJ4kMTAGYH
 2n/QPpHXzFTfHftqMwihsC2D3q5KXSNPSQQC9BWhSb622DG+N3hUOlLeW7mtegZXIL2a
 kNOLtaoHKS4nU4mT7jazXebS9RZBDj/RHjhzy0s8ntSPIQSQ9p1Btcb9bJNA9y8tMJWP
 H7ZS23dtU9989CDUIt/1woG7+Fd0xyYqI2OWEjqBh0KmvjzWBXGJkDKD5PrJpZCm4LU9
 Jwzy5/NxEJe+teP+INje3JrZpGBDgUTu1CARscHUjU8H8I8heJyM9/uVu0rVVoftsEv1
 1knQ==
X-Gm-Message-State: AOAM5309Sdsu0mV4OCCrqB3jYA5GU/aX7r6b68JkcT4jmZAepZKz9mnG
 Vp478zUFSYvT1EWErLWhhoMDp0FJCe645w==
X-Google-Smtp-Source: ABdhPJzKUM9qiDzRRwdWo1bPBY+3Rl7tDqYOZHkJB6/meotQwzCYmvdSoFfbOayJDJ5x7Y6ix7Farg==
X-Received: by 2002:a17:90a:5901:: with SMTP id
 k1mr5914200pji.33.1602129284695; 
 Wed, 07 Oct 2020 20:54:44 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q8sm5128753pfl.100.2020.10.07.20.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 20:54:44 -0700 (PDT)
Date: Wed, 07 Oct 2020 20:54:44 -0700 (PDT)
X-Google-Original-Date: Wed, 07 Oct 2020 20:54:42 PDT (-0700)
Subject: Re: [PATCH 2/2] riscv: Fixup static_obj() fail v2
In-Reply-To: <1602083313-19239-2-git-send-email-guoren@kernel.org>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: guoren@kernel.org
Message-ID: <mhng-81dee5c2-f8ee-4ab5-92d7-0e46dc952e87@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_235448_448243_32F929B0 
X-CRM114-Status: GOOD (  27.21  )
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
Cc: guoren@linux.alibaba.com, linux-kernel@vger.kernel.org,
 schwab@linux-m68k.org, atishp@atishpatra.org, linux-riscv@lists.infradead.org,
 aurelien@aurel32.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 07 Oct 2020 08:08:33 PDT (-0700), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> v1 is commit: 6184358da0004c8fd940afda6c0a0fa4027dc911 which has
> been reverted.
>
> When enable LOCKDEP, static_obj() will cause error:
>
> [    0.067192] INFO: trying to register non-static key.
> [    0.067325] the code is fine but needs lockdep annotation.
> [    0.067449] turning off the locking correctness validator.
> [    0.067718] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.7.0-rc7-dirty #44
> [    0.067945] Call Trace:
> [    0.068369] [<ffffffe00020323c>] walk_stackframe+0x0/0xa4
> [    0.068506] [<ffffffe000203422>] show_stack+0x2a/0x34
> [    0.068631] [<ffffffe000521e4e>] dump_stack+0x94/0xca
> [    0.068757] [<ffffffe000255a4e>] register_lock_class+0x5b8/0x5bc
> [    0.068969] [<ffffffe000255abe>] __lock_acquire+0x6c/0x1d5c
> [    0.069101] [<ffffffe0002550fe>] lock_acquire+0xae/0x312
> [    0.069228] [<ffffffe000989a8e>] _raw_spin_lock_irqsave+0x40/0x5a
> [    0.069357] [<ffffffe000247c64>] complete+0x1e/0x50
> [    0.069479] [<ffffffe000984c38>] rest_init+0x1b0/0x28a
> [    0.069660] [<ffffffe0000016a2>] 0xffffffe0000016a2
> [    0.069779] [<ffffffe000001b84>] 0xffffffe000001b84
> [    0.069953] [<ffffffe000001092>] 0xffffffe000001092
>
> Because some __initdata static variables is before _stext:
>
> static int static_obj(const void *obj)
> {
>         unsigned long start = (unsigned long) &_stext,
>                       end   = (unsigned long) &_end,
>                       addr  = (unsigned long) obj;
>
>         /*
>          * static variable?
>          */
>         if ((addr >= start) && (addr < end))
>                 return 1;
>
> 	if (arch_is_kernel_data(addr))
> 		return 1;
>
> We could implement arch_is_kernel_data to fixup it.
>
> Link: https://lore.kernel.org/linux-riscv/1593266228-61125-1-git-send-email-guoren@kernel.org/T/#t
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Reported-by: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Atish Patra <atishp@atishpatra.org>
> Cc: Andreas Schwab <schwab@linux-m68k.org>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  arch/riscv/include/asm/sections.h | 20 ++++++++++++++++++++
>  arch/riscv/kernel/setup.c         |  9 +++++++++
>  2 files changed, 29 insertions(+)
>  create mode 100644 arch/riscv/include/asm/sections.h
>
> diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
> new file mode 100644
> index 00000000..2317b9e
> --- /dev/null
> +++ b/arch/riscv/include/asm/sections.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef _ASM_RISCV_SECTIONS_H
> +#define _ASM_RISCV_SECTIONS_H
> +
> +#define arch_is_kernel_data arch_is_kernel_data
> +
> +#include <asm-generic/sections.h>
> +
> +extern bool init_mem_is_free;
> +
> +static inline int arch_is_kernel_data(unsigned long addr)
> +{
> +	if (init_mem_is_free)
> +		return 0;
> +
> +	return addr >= (unsigned long)__init_begin &&
> +		addr < (unsigned long)__init_end;
> +}
> +#endif /* _ASM_RISCV_SECTIONS_H */
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 2c6dd32..9ebd5eb4 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -17,6 +17,7 @@
>  #include <linux/sched/task.h>
>  #include <linux/swiotlb.h>
>  #include <linux/smp.h>
> +#include <linux/poison.h>
>
>  #include <asm/cpu_ops.h>
>  #include <asm/setup.h>
> @@ -112,3 +113,11 @@ static int __init topology_init(void)
>  	return 0;
>  }
>  subsys_initcall(topology_init);
> +
> +bool init_mem_is_free = false;
> +
> +void free_initmem(void)
> +{
> +	free_initmem_default(POISON_FREE_INITMEM);
> +	init_mem_is_free = true;
> +}

I'm a bit confused as to what you're trying to do here.  Yesterday I got
another version of this patch set that moves init data around, today a
different one.  Yesterday's is tested and simpler, and given it's so late in
the process I'm inclined to take that as I don't want to break anything.

Right now I have

84814460eef9 ("riscv: Fixup bootup failure with HARDENED_USERCOPY")
a78c6f5956a9 ("RISC-V: Make sure memblock reserves the memory containing DT")
549738f15da0 ("Linux 5.9-rc8")

Unless there's some functional bug, that's what I'm going to send out for 5.9
-- I'm not all that worried about lacking the ability to free init data.  The
above seems like fine 5.10 material.

Let me know if I'm missing something here.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
