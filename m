Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8E1C54EE9
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 02:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p3nLYRN9pNfo2sjKlUBP6VL8patmrC9PFGJjdf3+4Mc=; b=s7VY7M+Eprh2Xm
	hn2eB80kWF5TAaWsVg5SW1j+El5fwS10pQ8NsB+OnnliE7JfCFNW+1s1+sawSdUjuLp0MeosWwqQI
	ikIJF01cG4cseO7M6n9DrrF06ohiWz2xI5n0QbN7xiTtpgXLCONyHAGkek3HF4xXHHjKCzTWsb1/W
	ukNSI24jjvKjUvtUxsnjc1xH4JnAeLVsA8rWtaRlXAQa20JQj0z730bvemd4n98G/5FctcoxZ4vgR
	t3+l3MCm6xW3c8YH3WETWPWl8AwzUhpu2PpeMgETC4QW+dDO6Fe1j1sElhqueajhkEOWMkrRid3Uf
	9zatmIkf6jXLifmVVoAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oapFi-008DDL-Ii; Wed, 21 Sep 2022 02:14:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oapFe-008D8V-Pr
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 02:14:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7AAD762EDA
	for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 02:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E37BCC433D6
	for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 02:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663726452;
	bh=qI7h/5oDIg8KfeFQUixqYzNKwl6VFPqXAJjhtSbuMi4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RCWADFT0FYCuKHjJOaL1bTscBnD+CJHvzrIflu0vrtjEq+XDtYR6luTG0RrfCVKXT
	 zqeADrU7M0ulVNWynrS3swEBDzod6A3vsWB4CrJfg0Yox8J4b1C3NutSRePRbwANnN
	 g3/V50iOphmleNsFLtDPf1Wnz0+4If40uRG6f/wzF82kKJukOAt68ALyK+hGChw3rF
	 56lNNI5bO4Q2sLr/kEiK6544PdAuv/w8HqNCWTBJrxAPzBsNJiSSix3RnsOMvnMtIc
	 EANrNFVKE2XpYalKJhOjDHJ/zOoi31UhRRLYG3rJwcByuo1lQPx2LEipklt0eOk1QH
	 2nwhGmzlhyoOQ==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-12b542cb1d3so7010511fac.13
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 19:14:12 -0700 (PDT)
X-Gm-Message-State: ACrzQf2Xhe4cw+iANQ7eO7JJpHsjp0bcs3iYhs9Y6kD17jYPHKOr4fyO
	EuGX/CPQY0aSE9cYfY8RaHCO1Lyzx1Cl8PuDhQs=
X-Google-Smtp-Source: AMsMyM6IwqZwyLI7janQ1zDjXRLjdc4ym5Cy+EMmk9dbqWgfBFb8S6xJgFzOVD03EiTmLaz3UFMA/qSfiCqmy97Kl/E=
X-Received: by 2002:a05:6870:a78e:b0:12b:542b:e5b2 with SMTP id
 x14-20020a056870a78e00b0012b542be5b2mr3833650oao.112.1663726451988; Tue, 20
 Sep 2022 19:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220920151202.180057-1-chenzhongjin@huawei.com> <20220920151202.180057-4-chenzhongjin@huawei.com>
In-Reply-To: <20220920151202.180057-4-chenzhongjin@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 21 Sep 2022 10:13:57 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS1=xSrsaABLzbRwq2V=Wj3_SyHtooXosfY7L9zAwf=NA@mail.gmail.com>
Message-ID: <CAJF2gTS1=xSrsaABLzbRwq2V=Wj3_SyHtooXosfY7L9zAwf=NA@mail.gmail.com>
Subject: Re: [PATCH -next 3/7] riscv: stacktrace: Save pt_regs in encoded fp
 on irq entry
To: Chen Zhongjin <chenzhongjin@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, peterz@infradead.org, 
	mingo@redhat.com, acme@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, namhyung@kernel.org, jolsa@kernel.org, 
	nsaenzju@redhat.com, frederic@kernel.org, changbin.du@intel.com, 
	vincent.chen@sifive.com, ardb@kernel.org, mhiramat@kernel.org, 
	rostedt@goodmis.org, keescook@chromium.org, catalin.marinas@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_191414_940856_BE5FA2FA 
X-CRM114-Status: GOOD (  28.43  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

ENCODE fp with BIT[0] is okay.

On Tue, Sep 20, 2022 at 11:15 PM Chen Zhongjin <chenzhongjin@huawei.com> wrote:
>
> To support stack unwinding at irq entry, the position of pt_regs saved
> on stack is nessesary. Because for some functions, compiler only push
> s0/fp on stack without ra.
>
> As the situation described in
> commit f766f77a74f5("riscv/stacktrace: Fix stack output without ra on the stack top")
>
> When irq happens there, the the function frame looks like:
>
> prev function   |       ...       |
>                 |                 |
> normal function +-----------------+
>                 | ra to prev      |
>                 | s0 of prev      |
>                 |       ...       |<-+
> leaf function   +-----------------+  |
>                 | s0 of normal    |  |
>                 | empty slot      |  |
> irq pt_regs     +-----------------+  |
>                 | epc (ra to leaf)|  |
>                 | ra  (ra to norm)|  |
>                 | ...             |  |
>                 | s0 of leaf      |--+
>                 | ...             |
>                 +-----------------+
>
> If the position of register in pt_regs is {epc, s0}, we can easily
> unwind from irq frame to leaf function, as normal functions do.
>
> However when unwinding from unwinding from leaf to normal, beacause
> (ra to norm) is saved in pt_regs, but not stackframe of leaf, we
> have to get pt_regs for that.
>
> To get pt_regs position on stack, we can save the encoded *pt_regs
> in s0, as x86 architecture did. Then we can get s0, epc and ra
> easily.
>
> Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
> ---
>  arch/riscv/include/asm/frame.h | 45 ++++++++++++++++++++++++++++++++++
>  arch/riscv/kernel/entry.S      |  3 +++
>  2 files changed, 48 insertions(+)
>  create mode 100644 arch/riscv/include/asm/frame.h
>
> diff --git a/arch/riscv/include/asm/frame.h b/arch/riscv/include/asm/frame.h
> new file mode 100644
> index 000000000000..2a1f45cf3a4e
> --- /dev/null
> +++ b/arch/riscv/include/asm/frame.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_RISCV_FRAME_H
> +#define _ASM_RISCV_FRAME_H
> +
> +#include <asm/asm.h>
> +
> +#ifdef CONFIG_FRAME_POINTER
> +
> +#ifdef __ASSEMBLY__
> +
> +/*
> + * This is a sneaky trick to help the unwinder find pt_regs on the stack.  The
> + * frame pointer is replaced with an encoded pointer to pt_regs.  The encoding
> + * is just setting the LSB, which makes it an invalid stack address and is also
> + * a signal to the unwinder that it's a pt_regs pointer in disguise.
> + *
> + * This macro must be used when sp point to pt_regs
> + */
> +.macro ENCODE_FRAME_POINTER
> +       add s0, sp, 0x1
> +.endm
> +
> +#else /* !__ASSEMBLY__ */
> +
> +#define ENCODE_FRAME_POINTER                   \
> +       "add s0, sp, 0x1\n\t"
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#else /* !CONFIG_FRAME_POINTER */
> +
> +#ifdef __ASSEMBLY__
> +
> +.macro ENCODE_FRAME_POINTER ptregs_offset=0
> +.endm
> +
> +#else /* !__ASSEMBLY */
> +
> +#define ENCODE_FRAME_POINTER
> +
> +#endif /* !__ASSEMBLY */
> +
> +#endif /* CONFIG_FRAME_POINTER */
> +
> +#endif /* _ASM_RISCV_FRAME_H */
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index b9eda3fcbd6d..ecb15c7430b4 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -13,6 +13,7 @@
>  #include <asm/thread_info.h>
>  #include <asm/asm-offsets.h>
>  #include <asm/errata_list.h>
> +#include <asm/frame.h>
>
>  #if !IS_ENABLED(CONFIG_PREEMPTION)
>  .set resume_kernel, restore_all
> @@ -95,6 +96,8 @@ _save_context:
>         REG_S s4, PT_CAUSE(sp)
>         REG_S s5, PT_TP(sp)
>
> +       ENCODE_FRAME_POINTER
> +
>         /*
>          * Set the scratch register to 0, so that if a recursive exception
>          * occurs, the exception vector knows it came from the kernel
> --
> 2.17.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
