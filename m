Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD26DC636CC
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 15:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r+gkavF0BiULyvD3qFaOUPaSY+Tz6Hdz2wJq9rK150g=; b=qn5+FZbR41HMi6
	2IwKtL/GORNKylWlpaS6ZCiIiG/AnHmx/m5SnBeI/AkfHijstcZgFy124QgR98rWI5MtJO8lCcmXc
	TF8h6vMk8nDVN30Ay46miLOgRVH1yHtxzjZNEw9sx5aXdDMSh9z5VrIEPME2yTaLTsADrPTcj41M3
	ip0/BZOsQ/DmlW/T5nuk6CpYhFIeqk5x1ttRA+ef6/GAVOlhrBLQrQeFdmiqZqMVX3VGhu9DB9FyZ
	AubHU/cruuvW3XCd+9ieumq+9yj4uFUalw7fB3rGdyS0cbdtVS2/TVwGwH0MDI2ivbesjlVDVhXyP
	HVWiE7KpZeZ8GEa6/4QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSgPC-00AwZa-FE; Thu, 16 Feb 2023 15:42:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSgP8-00AwYS-Qm
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 15:42:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6374361843;
	Thu, 16 Feb 2023 15:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA81C4339C;
	Thu, 16 Feb 2023 15:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676562158;
	bh=JYk/endDShTG37Jctnr/vqjuecsJ99nFH6xFQSWOsd4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QKuMBwREDFYGGNUtf00KirkTJKGRbSR7nMlJQlXT1aKUc63KXV4bBaMnRWZZpxPBY
	 qExZlooQVCHZoSC3PSyFq9xnygWq1uPmredFQvWjqG/YAQbWaTfhMCSPlOhubo5xd8
	 uxAszFOwsteA/YFHBIQIV/LE2o5yDK7uD3kHBNuboK9h2ok+U3pVvYTXqPlZgo8qKA
	 AmlKUhp7Ni/DUo2lNcreUfOXmaSDH8NLmML9aD54eUqvDsb1+C0YoFFo4AaUFyKycr
	 2UTR2aiGwC7RzvisovXeZOfJQYSWE6KWdIlQ5U9k3y21PQcj4yV7GGoAywl+tTMmGA
	 UBxxgeePD85nw==
Date: Fri, 17 Feb 2023 00:42:34 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: guoren@kernel.org
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com,
 conor.dooley@microchip.com, penberg@kernel.org, mark.rutland@arm.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Guo Ren
 <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: kprobe: Optimize kprobe with accurate atomicity
Message-Id: <20230217004234.dbf3159e821e6581a62374b1@kernel.org>
In-Reply-To: <20230126161559.1467374-1-guoren@kernel.org>
References: <20230126161559.1467374-1-guoren@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_074238_982520_52B3C005 
X-CRM114-Status: GOOD (  30.05  )
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

On Thu, 26 Jan 2023 11:15:59 -0500
guoren@kernel.org wrote:

> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The previous implementation was based on the stop_matchine mechanism,
> which reduced the speed of arm/disarm_kprobe. Using minimum ebreak
> instruction would get accurate atomicity.
> 
> This patch removes the patch_text of riscv, which is based on
> stop_machine. Then riscv only reserved patch_text_nosync, and developers
> need to be more careful in dealing with patch_text atomicity.
> 
> When CONFIG_RISCV_ISA_C=n, the ebreak could replace the whole
> instruction. When CONFIG_RISCV_ISA_C=y, the patch uses 16-bit length
> c.ebreak instruction, which may occupy the first part of the 32-bit
> instruction and leave half the rest of the broken instruction. Because
> ebreak could detour the flow to skip it, leaving it in the kernel text
> memory is okay.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>

I'm not sure how the RISCV specification ensures this type of self
code modification. But if you think calling the stop_machine() for
*each* probe arm/disarm is slow, there may be another way to avoid
ot by introducing a batch arming interface too. (reserve-commit way)

BTW, for the BPF usecase which is usually only for function
entry/exit, we will use Fprobes. Since that will use ftrace batch
text patching, I think we already avoid such slowdown.

FYI, for ftrace dynamic event usecase, there is another reason to slow
down the enable/disable dynamic event itself (to sync up the event
enabled status to ensure all event handler has been done, it waits
for rcu-sync for each operation.)

Thank you,

> ---
>  arch/riscv/include/asm/patch.h     |  1 -
>  arch/riscv/kernel/patch.c          | 33 ------------------------------
>  arch/riscv/kernel/probes/kprobes.c | 29 ++++++++++++++++++--------
>  3 files changed, 21 insertions(+), 42 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/patch.h b/arch/riscv/include/asm/patch.h
> index 9a7d7346001e..2500782e6f5b 100644
> --- a/arch/riscv/include/asm/patch.h
> +++ b/arch/riscv/include/asm/patch.h
> @@ -7,6 +7,5 @@
>  #define _ASM_RISCV_PATCH_H
>  
>  int patch_text_nosync(void *addr, const void *insns, size_t len);
> -int patch_text(void *addr, u32 insn);
>  
>  #endif /* _ASM_RISCV_PATCH_H */
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 765004b60513..8bd51ed8b806 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -98,36 +98,3 @@ int patch_text_nosync(void *addr, const void *insns, size_t len)
>  	return ret;
>  }
>  NOKPROBE_SYMBOL(patch_text_nosync);
> -
> -static int patch_text_cb(void *data)
> -{
> -	struct patch_insn *patch = data;
> -	int ret = 0;
> -
> -	if (atomic_inc_return(&patch->cpu_count) == num_online_cpus()) {
> -		ret =
> -		    patch_text_nosync(patch->addr, &patch->insn,
> -					    GET_INSN_LENGTH(patch->insn));
> -		atomic_inc(&patch->cpu_count);
> -	} else {
> -		while (atomic_read(&patch->cpu_count) <= num_online_cpus())
> -			cpu_relax();
> -		smp_mb();
> -	}
> -
> -	return ret;
> -}
> -NOKPROBE_SYMBOL(patch_text_cb);
> -
> -int patch_text(void *addr, u32 insn)
> -{
> -	struct patch_insn patch = {
> -		.addr = addr,
> -		.insn = insn,
> -		.cpu_count = ATOMIC_INIT(0),
> -	};
> -
> -	return stop_machine_cpuslocked(patch_text_cb,
> -				       &patch, cpu_online_mask);
> -}
> -NOKPROBE_SYMBOL(patch_text);
> diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
> index 475989f06d6d..27f8960c321c 100644
> --- a/arch/riscv/kernel/probes/kprobes.c
> +++ b/arch/riscv/kernel/probes/kprobes.c
> @@ -24,12 +24,18 @@ post_kprobe_handler(struct kprobe *, struct kprobe_ctlblk *, struct pt_regs *);
>  static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
>  {
>  	unsigned long offset = GET_INSN_LENGTH(p->opcode);
> +#ifdef CONFIG_RISCV_ISA_C
> +	u32 opcode = __BUG_INSN_16;
> +#else
> +	u32 opcode = __BUG_INSN_32;
> +#endif
>  
>  	p->ainsn.api.restore = (unsigned long)p->addr + offset;
>  
> -	patch_text(p->ainsn.api.insn, p->opcode);
> -	patch_text((void *)((unsigned long)(p->ainsn.api.insn) + offset),
> -		   __BUG_INSN_32);
> +	patch_text_nosync(p->ainsn.api.insn, &p->opcode, offset);
> +	patch_text_nosync((void *)((unsigned long)(p->ainsn.api.insn) + offset),
> +			  &opcode, GET_INSN_LENGTH(opcode));
> +
>  }
>  
>  static void __kprobes arch_prepare_simulate(struct kprobe *p)
> @@ -114,16 +120,23 @@ void *alloc_insn_page(void)
>  /* install breakpoint in text */
>  void __kprobes arch_arm_kprobe(struct kprobe *p)
>  {
> -	if ((p->opcode & __INSN_LENGTH_MASK) == __INSN_LENGTH_32)
> -		patch_text(p->addr, __BUG_INSN_32);
> -	else
> -		patch_text(p->addr, __BUG_INSN_16);
> +#ifdef CONFIG_RISCV_ISA_C
> +	u32 opcode = __BUG_INSN_16;
> +#else
> +	u32 opcode = __BUG_INSN_32;
> +#endif
> +	patch_text_nosync(p->addr, &opcode, GET_INSN_LENGTH(opcode));
>  }
>  
>  /* remove breakpoint from text */
>  void __kprobes arch_disarm_kprobe(struct kprobe *p)
>  {
> -	patch_text(p->addr, p->opcode);
> +#ifdef CONFIG_RISCV_ISA_C
> +	u32 opcode = __BUG_INSN_16;
> +#else
> +	u32 opcode = __BUG_INSN_32;
> +#endif
> +	patch_text_nosync(p->addr, &p->opcode, GET_INSN_LENGTH(opcode));
>  }
>  
>  void __kprobes arch_remove_kprobe(struct kprobe *p)
> -- 
> 2.36.1
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
