Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7E0CDB47F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 08:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mXjzs5eUEiGHyQiBr0yLg2bw+Hc19GszuBoHXgXJQO8=; b=dwuyoFkN7dApyv
	EteAMduKx/lwcdD3mkvItJjm9C4y+GZ5ajvCX/87E9MqIripPTYokpkOCC6odHoYVIYeUJvuNA4GX
	uODlF9guEqvOvA1aX8M7mIi/lKxkqnQlEr/RZk5tFRS2+swbGte/7/qZzW1WLXiTV1RD4YWZp8nT6
	o/zdCp6aautcyuADWrwC3RtNkJrwv1g1g63eLPZaqGVJNMEN5K07on3y06LocdlAwlFISYAnC5SSj
	Rl/3KX2ntKIX1UEiMKhL011TqftcsdFxLS8faTiupfwH+remGiMQ7GljXuEwDYPdgSyasLF30+7l8
	Ll27+9wbr/zPpeJ0j9IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcf5r-00000008oR1-259N;
	Thu, 25 Jun 2026 08:05:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcf5q-00000008oQf-1ok6
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 08:05:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DAF066021C;
	Thu, 25 Jun 2026 08:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B8E1F000E9;
	Thu, 25 Jun 2026 08:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782374749;
	bh=krKHM/FV67ws6/ZOk4rbhPsfA4EtxEQr+AriIUnSv80=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=oaku39iAUlLn4ZNbxfq2ADy9/AZOaE3l1OpxGOrg0nPi56kz4ES2T+yFtKH9begHh
	 YNaPJtHfpjGaQVabiemCinVtwCGrodA1ZOK30EA3lYoB5vXUGwTVjh55Ifb9mbi6DW
	 USE0ocFDegGIBzyICUGMc4/wUYk0xdwmCKR3BvdGg8EN3+f7/owm8Ro8g205lvbzIs
	 qq0R1KrW97NSbO5gJnyjQxtTTyVshvdmO5AaYxEF5c7kML4TY4xZKr/uqlAqrkFvGw
	 9ZkiEVQ07Zd3YDo5E6lOGjI4nqEhfzGuE6Tzmu7Bdca3seQrMpgtrocQ5OGFvmChhr
	 IclRQlbR76q2A==
Message-ID: <2e47388a-8883-4b44-b440-a00b8e622733@kernel.org>
Date: Thu, 25 Jun 2026 18:05:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Fix 32-bit call_on_irq_stack() frame pointer ABI
To: Rui Qi <qirui.001@bytedance.com>, palmer@dabbelt.com, pjw@kernel.org,
 aou@eecs.berkeley.edu, alex@ghiti.fr, conor@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 samuel.holland@sifive.com, namcao@linutronix.de
References: <20260624113148.3723541-1-qirui.001@bytedance.com>
Content-Language: en-US
From: Michael Ellerman <mpe@kernel.org>
In-Reply-To: <20260624113148.3723541-1-qirui.001@bytedance.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 24/6/26 9:31 pm, Rui Qi wrote:
> From: Samuel Holland <samuel.holland@sifive.com>
> 
> call_on_irq_stack() uses struct member offsets to set up its link in the
> frame record list. On riscv32, struct stackframe is the wrong size to
> maintain stack pointer alignment, so STACKFRAME_SIZE_ON_STACK includes
> padding. However, the ABI requires the frame record to be placed
> immediately below the address stored in s0, so the padding must come
> before the struct members.
> 
> Fix the layout by making STACKFRAME_FP and STACKFRAME_RA the negative
> offsets from s0, instead of the positive offsets from sp.

The fact that all uses of the defines need to add back STACKFRAME_SIZE_ON_STACK
makes me think the defines don't have the most useful values.

If the values were offset + padding then the uses could be left unchanged.

> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index af827448a609..a75f0cfea1e9 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -501,8 +501,8 @@ void asm_offsets(void)
>   	OFFSET(SBI_HART_BOOT_STACK_PTR_OFFSET, sbi_hart_boot_data, stack_ptr);
>   
>   	DEFINE(STACKFRAME_SIZE_ON_STACK, ALIGN(sizeof(struct stackframe), STACK_ALIGN));
> -	OFFSET(STACKFRAME_FP, stackframe, fp);
> -	OFFSET(STACKFRAME_RA, stackframe, ra);
> +	DEFINE(STACKFRAME_FP, offsetof(struct stackframe, fp) - sizeof(struct stackframe));
> +	DEFINE(STACKFRAME_RA, offsetof(struct stackframe, ra) - sizeof(struct stackframe));

ie. if they were defined as:

         DEFINE(STACKFRAME_FP, ALIGN(sizeof(struct stackframe), STACK_ALIGN) -
                               sizeof(struct stackframe) + offsetof(struct stackframe, fp));
         DEFINE(STACKFRAME_RA, ALIGN(sizeof(struct stackframe), STACK_ALIGN) -
                               sizeof(struct stackframe) + offsetof(struct stackframe, ra));

STACKFRAME_SIZE_ON_STACK - sizeof(stackframe) computes the size of the padding,
and then plus the offset gets you the right location.

That would allow the call sites to still use STACKFRAME_RA(sp).

I would probably also rename them to ON_STACK_RA or something, to make it clear
they are not offsets into struct stackframe any more, but maybe that's bike shedding :)

cheers

>   #ifdef CONFIG_FUNCTION_TRACER
>   	DEFINE(FTRACE_OPS_FUNC,		offsetof(struct ftrace_ops, func));
>   #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index c6988983cdf7..08df724e13b9 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -386,8 +386,8 @@ SYM_CODE_END(ret_from_fork_user_asm)
>   SYM_FUNC_START(call_on_irq_stack)
>   	/* Create a frame record to save ra and s0 (fp) */
>   	addi	sp, sp, -STACKFRAME_SIZE_ON_STACK
> -	REG_S	ra, STACKFRAME_RA(sp)
> -	REG_S	s0, STACKFRAME_FP(sp)
> +	REG_S	ra, (STACKFRAME_SIZE_ON_STACK + STACKFRAME_RA)(sp)
> +	REG_S	s0, (STACKFRAME_SIZE_ON_STACK + STACKFRAME_FP)(sp)
>   	addi	s0, sp, STACKFRAME_SIZE_ON_STACK
>   
>   	/* Switch to the per-CPU shadow call stack */
> @@ -405,8 +405,8 @@ SYM_FUNC_START(call_on_irq_stack)
>   
>   	/* Switch back to the thread stack and restore ra and s0 */
>   	addi	sp, s0, -STACKFRAME_SIZE_ON_STACK
> -	REG_L	ra, STACKFRAME_RA(sp)
> -	REG_L	s0, STACKFRAME_FP(sp)
> +	REG_L	ra, (STACKFRAME_SIZE_ON_STACK + STACKFRAME_RA)(sp)
> +	REG_L	s0, (STACKFRAME_SIZE_ON_STACK + STACKFRAME_FP)(sp)
>   	addi	sp, sp, STACKFRAME_SIZE_ON_STACK
>   
>   	ret

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
