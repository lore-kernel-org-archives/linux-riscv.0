Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45517C433C1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 09:34:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A456D61606
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 09:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A456D61606
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7ZywY94o3lEcwcbodtsWb+9MnlYlAIoMJtwauOwD+AM=; b=hBjEZDU/ejul+1HZo7jbhq0Tk
	f37m6xOUtWJmB3jFngSOCU8jGStSsjlfnX5p8gCLXc/TTODFZYhnCdIcIL8OOiIZIwyCjvCcRDgUa
	GqyOG+eRvZoSwIhyMaB18+IlFrBJqQT6UH6SlWVNS0lruahNAcW0rgce5NEH3Ejn7/xxvwtv85NbF
	6Qg4GusT0bAVIUXi3RSQOOdw6H13YuE2O0OPEH91IhrIrWkBummwB4q/W/TJPg09fZtWPQzgigChi
	ddY1L2ccRWkWwGPshJeVSwycmHGPZqk7JBUbo6zhmCBr9gyb+L8EkV+TCZ3+VzGD/+xOtgadgWGgZ
	UQJYc9oMA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRAks-003EDL-OR; Tue, 30 Mar 2021 09:33:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRAkn-003EBX-7e
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 09:33:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E69F06196A;
 Tue, 30 Mar 2021 09:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617096819;
 bh=dYLugLc2SuF0iK6NmBheI9/uixh1V9koKnsv2y5J0l0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HZt6JV/OAnSHC4xC5UNG10NWYm4QK27EYcF4BJQorN2o003E6NyJRWEJgh/fa0Xv2
 UdSOg440QgXpJ+Xk1NztoAJLtbCxlKWaJM9hIMdDpoVNju6yrGOH7xkt6Gnjova+3j
 7i7IbLl2HN0+sV3x8kBDQltM4Zz1K67xS94YZyiJgcCXqTqDddD76QKTFLlRg7BvAj
 SST8ZD0LpKc/15Ts4NFbLiDvdy8/8TGLk8eVEtHcr2EwVG7UUwyWgUHkvMGMRTmDyf
 jbj8tPMUQOywNpe0/UWONHbKbr8uh+SIQz6nQx/LIRYF7q+264hpm8n/VWzopoW4Cv
 nFKyJSp//52+w==
Date: Tue, 30 Mar 2021 18:33:16 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
 <guoren@linux.alibaba.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: keep interrupts disabled for BREAKPOINT exception
Message-Id: <20210330183316.942215efe8e6e8455ad14113@kernel.org>
In-Reply-To: <20210330021624.2b776386@xhacker>
References: <20210330021624.2b776386@xhacker>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_103341_611652_4C7BB648 
X-CRM114-Status: GOOD (  12.99  )
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

Hi Jisheng,

On Tue, 30 Mar 2021 02:16:24 +0800
Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:

> From: Jisheng Zhang <jszhang@kernel.org>
> 
> Current riscv's kprobe handlers are run with both preemption and
> interrupt enabled, this violates kprobe requirements. Fix this issue
> by keeping interrupts disabled for BREAKPOINT exception.

Not only while the breakpoint exception but also until the end of
the single step (maybe you are using __BUG_INSN_32 ??) need to be
disable interrupts. Can this do that?

Thank you,

> 
> Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/entry.S | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 744f3209c48d..4114b65698ec 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -130,6 +130,8 @@ skip_context_tracking:
>  	 */
>  	andi t0, s1, SR_PIE
>  	beqz t0, 1f
> +	li t0, EXC_BREAKPOINT
> +	beq s4, t0, 1f
>  #ifdef CONFIG_TRACE_IRQFLAGS
>  	call trace_hardirqs_on
>  #endif
> -- 
> 2.31.0
> 
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
