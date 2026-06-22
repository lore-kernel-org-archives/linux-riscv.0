Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C483CD98E4
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 02:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Message-Id:To:In-Reply-To:
	Mime-Version:Date:Subject:From:Cc:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vNDkK0Qa63xEaiH69v+m1Dg+joaYK6E3ky2bm99lAvY=; b=XABsRyeOTP4h7+
	fM/bN2UJjra6Zk1/QjhlBwCmsj8S3PNTrKUkC9P7Z4JUZEOWoWskF9ElV3QaHXsd1JYRyXy/yxaTX
	0wiv9pWmnjCtEpABNsnRhCIUAXQM7lc+TxRvdAznVHzq7960JIw6KxsRaEFfH/5sSMo9P8pGCvYpm
	UIlUybB+rGyFs2rpqev//yCUgNCoMOcY8AyclMTdlM2yzN/op7nkZEgfWwtaGw7JoRKUiJ1Ct9ihl
	4IXu0gHEcrU7x8OeDVm+VipR31D14gD/O3wI8zBl7ghz6AQmY5hOgJY+Y8BMFA67ZZGW2WCmMVixx
	2i4H6kl7NryZ5pqxu38w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbUoH-00000004KSZ-29Fz;
	Mon, 22 Jun 2026 02:54:53 +0000
Received: from va-1-111.ptr.blmpb.com ([209.127.230.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbUoE-00000004KS1-005E
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 02:54:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1782096880; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=MVFhmxXtrbmG+CWiqbe7ir8ZqzPje6y+FF2v778FjIw=;
 b=qqxW/40QBaj1qPvisEQmOMt+Oz5z9cdyOljS+b+bIW/0E6rdWdOREcg8vKpatUVJUREOKb
 FbRLjsD/OwL3dlS/c7Fasqgvz4qZpQlQCr8+xDCAXwdo+CWvj6U1al/AG+6XCYUrYhkKro
 3sJIiROenFZSoDwt2mrknSMlK8Irmv/tSNRULn6+jhEcrLQSii8B3v3UYWxKVkQQwaFNFz
 lCMvuUhZVdPM+hUxtytfhbe+y6ocJj+UI/Q3Ghzm51TnDojYHcTEAurI7kRc4YYpINI1U4
 H4ZfJun+4g51TEs5tZ+Q8JASkCY/cdpjAMTsVJ0ETAFqT67f/dGUstM/pnRG2Q==
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Rui Qi" <qirui.001@bytedance.com>
Subject: Re: [PATCH] riscv: fix frame pointer in call_on_irq_stack for RV32
X-Original-From: Rui Qi <qirui.001@bytedance.com>
Date: Mon, 22 Jun 2026 10:54:25 +0800
Mime-Version: 1.0
In-Reply-To: <20260603035305.564823-1-qirui.001@bytedance.com>
User-Agent: Mozilla Thunderbird
To: <palmer@dabbelt.com>, <pjw@kernel.org>, <aou@eecs.berkeley.edu>, 
	<alex@ghiti.fr>, "Conor Dooley" <conor@kernel.org>
X-Lms-Return-Path: <lba+26a38a3ee+9955dd+lists.infradead.org+qirui.001@bytedance.com>
Message-Id: <d3aeae54-9b87-4a9c-b8a6-9769a858ff63@bytedance.com>
References: <20260603035305.564823-1-qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_195450_290473_21193A8A 
X-CRM114-Status: GOOD (  19.58  )
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

Hi Palmer, Paul, Albert, Alexandre,

Gentle ping on this patch. It has been posted for over two weeks
now and I would appreciate any feedback.

This fixes a frame pointer bug in call_on_irq_stack on RV32 where
the unwinder reads from the alignment padding instead of the
actual saved fp/ra, causing broken stack traces on 32-bit RISC-V.

Please let me know if there are any concerns or if further changes
are needed.

+Cc: Conor Dooley -- adding RISC-V subsystem reviewer.


On 6/3/26 11:53 AM, Rui Qi wrote:
> The frame pointer (s0/fp) in call_on_irq_stack is set using
> STACKFRAME_SIZE_ON_STACK, which equals ALIGN(sizeof(struct stackframe),
> STACK_ALIGN). On RV64, sizeof(struct stackframe) is 16 and the aligned
> size is also 16, so there is no difference. However, on RV32,
> sizeof(struct stackframe) is 8 while STACKFRAME_SIZE_ON_STACK is 16 due
> to 8 bytes of alignment padding.
> 
> The stack unwinder does 'frame = (struct stackframe *)fp - 1', which
> reads from 'fp - sizeof(struct stackframe)'. On RV32, with fp set to
> sp + STACKFRAME_SIZE_ON_STACK (sp + 16), the unwinder reads from
> sp + 8, which falls in the alignment padding rather than where the
> saved fp/ra are actually stored (sp + 0 and sp + 4).
> 
> Fix this by introducing STACKFRAME_SIZE (the unaligned sizeof) and using
> it for frame pointer setup and restoration, while keeping
> STACKFRAME_SIZE_ON_STACK for the stack pointer allocation/deallocation
> which must remain 16-byte aligned.
> 
> Signed-off-by: Rui Qi <qirui.001@bytedance.com>
> ---
>  arch/riscv/kernel/asm-offsets.c | 1 +
>  arch/riscv/kernel/entry.S       | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index af827448a609..c1b5f7eb03fd 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -500,6 +500,7 @@ void asm_offsets(void)
>  	OFFSET(SBI_HART_BOOT_TASK_PTR_OFFSET, sbi_hart_boot_data, task_ptr);
>  	OFFSET(SBI_HART_BOOT_STACK_PTR_OFFSET, sbi_hart_boot_data, stack_ptr);
>  
> +	DEFINE(STACKFRAME_SIZE, sizeof(struct stackframe));
>  	DEFINE(STACKFRAME_SIZE_ON_STACK, ALIGN(sizeof(struct stackframe), STACK_ALIGN));
>  	OFFSET(STACKFRAME_FP, stackframe, fp);
>  	OFFSET(STACKFRAME_RA, stackframe, ra);
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index d011fb51c59a..e8b654e2b7b5 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -383,7 +383,7 @@ SYM_FUNC_START(call_on_irq_stack)
>  	addi	sp, sp, -STACKFRAME_SIZE_ON_STACK
>  	REG_S	ra, STACKFRAME_RA(sp)
>  	REG_S	s0, STACKFRAME_FP(sp)
> -	addi	s0, sp, STACKFRAME_SIZE_ON_STACK
> +	addi	s0, sp, STACKFRAME_SIZE
>  
>  	/* Switch to the per-CPU shadow call stack */
>  	scs_save_current
> @@ -399,7 +399,7 @@ SYM_FUNC_START(call_on_irq_stack)
>  	scs_load_current
>  
>  	/* Switch back to the thread stack and restore ra and s0 */
> -	addi	sp, s0, -STACKFRAME_SIZE_ON_STACK
> +	addi	sp, s0, -STACKFRAME_SIZE
>  	REG_L	ra, STACKFRAME_RA(sp)
>  	REG_L	s0, STACKFRAME_FP(sp)
>  	addi	sp, sp, STACKFRAME_SIZE_ON_STACK

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
