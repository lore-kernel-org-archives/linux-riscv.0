Return-Path: <SRS0=yFtJ=KH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAECC433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 12 May 2021 15:04:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AC3A6188B
	for <linux-riscv@archiver.kernel.org>; Wed, 12 May 2021 15:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AC3A6188B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EI/oC6WMTm/yk+LvWUf2cCk8QDRzJU/dUuE85+Njff0=; b=P7KO70KyWamvF4yNeYtVM7QHP
	2b+B6AY5hySi/+K2A37aYcpAq/+F2BoSq6NJA9xzN0xX+cW8DTT6LvNUJHLa+IEyTkV0bmtLl/7wO
	TPM9WxxetPVtoQUq5SyPY4mMMHatmRyhgei0o6GyQilHsM6s9jrpeL19ScslNOlbsfPC6e2vZWVHG
	CwFjvc1x5QhvIpd9MI7cNUo56F1YCW/Wkdfz7bFzjgVbdY7uBv7cPcXeMe8FEf9ACanst4w3lzfVt
	9hg8Wa/MCG2nb0x8AaOBMT6+aBjyBMEM3pFWc5HUIq84t5dxh7XEuOzclTt8hn6+t7US+oRo7uky/
	mgHPANlqQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgqOu-0036mu-Kf; Wed, 12 May 2021 15:03:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgqOr-0036lx-O3
 for linux-riscv@desiato.infradead.org; Wed, 12 May 2021 15:03:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=l7RZxnql5klUqc/JYLPFMAZ9vl2oURQedfQ8t+ojKTY=; b=4o98EDpbkq1o+jFNSBsbMK1Juz
 eqpmRjDA16UlBx+gEbDwndovYm4icJELynvb7adJoGybkYgWSRYxUe443nCSQfYaMcZLKKR589s7p
 TSYnTv+qcEHp7FWSOLn70kxf8DPx2VmaCcAFSefBMhT+k/ar4Olb0htYDr+jfwAO1zOBf9LvJu1vS
 SQI4pxQ3BN6N6nOHM5s4xhvMn7nUTesDN7aLFcUGkU0/SA3ggnrPu40KNDWC3M33Kz3IknOAt1hDp
 km3bPZTWZ07Lhce3ExYclioXdPcP7xp8Gj2kdxmWDgXXzVhsB/xuhbXig6ifpzreL7bG/d+sFfM2v
 +Kqpb9hQ==;
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lgqOn-00ATsW-E6
 for linux-riscv@lists.infradead.org; Wed, 12 May 2021 15:03:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=l7RZxnql5klUqc/JYLPFMAZ9vl2oURQedf
 Q8t+ojKTY=; b=PNo7qZlmMkXossjSSO6zH2PM1hK5dCmHh8Wc9+XB466E8cHbPG
 xPyXcqEbQ3Gu6re/GQnWh6VzDfBm8TqxiiEmgKVN6hxedJnmnu+IM0+Py35cTZsW
 Yw6easWjIPCalX0IwMyG1vSBpFaLVzJ2or6L2OSp7TR51nBxdtjTjW6oM=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygDn7Z1F7ptgzS_JAA--.64496S2; 
 Wed, 12 May 2021 23:03:34 +0800 (CST)
Date: Wed, 12 May 2021 22:58:19 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Masami Hiramatsu
 <mhiramat@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: kprobes: Remove redundant kprobe_step_ctx
Message-ID: <20210512225819.6756c0b0@xhacker>
In-Reply-To: <20210419002919.1a0a539d@xhacker>
References: <20210419002919.1a0a539d@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygDn7Z1F7ptgzS_JAA--.64496S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuryfJr1kZFy8tFW3Ar1DWrg_yoWrKw1kpF
 ZIk3W3KrZ5Jas5uFy2yw4UZr1Svr48ZrW2kry8C34ftw1ayr13JF1xW3yjyrn8Gr95Kw1a
 yFy7trW8J3s7AFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUy2b7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s02
 6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
 I_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
 6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj4
 0_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
 Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jnNVgUUUUU=
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_080347_101255_A261AB70 
X-CRM114-Status: GOOD (  22.04  )
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

On Mon, 19 Apr 2021 00:29:19 +0800
Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:

> From: Jisheng Zhang <jszhang@kernel.org>
> 
> Inspired by commit ba090f9cafd5 ("arm64: kprobes: Remove redundant
> kprobe_step_ctx"), the ss_pending and match_addr of kprobe_step_ctx
> are redundant because those can be replaced by KPROBE_HIT_SS and
> &cur_kprobe->ainsn.api.insn[0] + GET_INSN_LENGTH(cur->opcode)
> respectively.
> 
> Remove the kprobe_step_ctx to simplify the code.

Hi all,

This patch can still be applied to 5.13-rc1, could you please review? Let me
know if a rebase on 5.13-rc1 is needed.

Thanks

> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/kprobes.h   |  7 ------
>  arch/riscv/kernel/probes/kprobes.c | 40 +++++++-----------------------
>  2 files changed, 9 insertions(+), 38 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kprobes.h b/arch/riscv/include/asm/kprobes.h
> index 4647d38018f6..9ea9b5ec3113 100644
> --- a/arch/riscv/include/asm/kprobes.h
> +++ b/arch/riscv/include/asm/kprobes.h
> @@ -29,18 +29,11 @@ struct prev_kprobe {
>  	unsigned int status;
>  };
>  
> -/* Single step context for kprobe */
> -struct kprobe_step_ctx {
> -	unsigned long ss_pending;
> -	unsigned long match_addr;
> -};
> -
>  /* per-cpu kprobe control block */
>  struct kprobe_ctlblk {
>  	unsigned int kprobe_status;
>  	unsigned long saved_status;
>  	struct prev_kprobe prev_kprobe;
> -	struct kprobe_step_ctx ss_ctx;
>  };
>  
>  void arch_remove_kprobe(struct kprobe *p);
> diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
> index 8c1f7a30aeed..4c1ad5536748 100644
> --- a/arch/riscv/kernel/probes/kprobes.c
> +++ b/arch/riscv/kernel/probes/kprobes.c
> @@ -17,7 +17,7 @@ DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
>  DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
>  
>  static void __kprobes
> -post_kprobe_handler(struct kprobe_ctlblk *, struct pt_regs *);
> +post_kprobe_handler(struct kprobe *, struct kprobe_ctlblk *, struct pt_regs *);
>  
>  static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
>  {
> @@ -43,7 +43,7 @@ static void __kprobes arch_simulate_insn(struct kprobe *p, struct pt_regs *regs)
>  		p->ainsn.api.handler((u32)p->opcode,
>  					(unsigned long)p->addr, regs);
>  
> -	post_kprobe_handler(kcb, regs);
> +	post_kprobe_handler(p, kcb, regs);
>  }
>  
>  int __kprobes arch_prepare_kprobe(struct kprobe *p)
> @@ -149,21 +149,6 @@ static void __kprobes kprobes_restore_local_irqflag(struct kprobe_ctlblk *kcb,
>  	regs->status = kcb->saved_status;
>  }
>  
> -static void __kprobes
> -set_ss_context(struct kprobe_ctlblk *kcb, unsigned long addr, struct kprobe *p)
> -{
> -	unsigned long offset = GET_INSN_LENGTH(p->opcode);
> -
> -	kcb->ss_ctx.ss_pending = true;
> -	kcb->ss_ctx.match_addr = addr + offset;
> -}
> -
> -static void __kprobes clear_ss_context(struct kprobe_ctlblk *kcb)
> -{
> -	kcb->ss_ctx.ss_pending = false;
> -	kcb->ss_ctx.match_addr = 0;
> -}
> -
>  static void __kprobes setup_singlestep(struct kprobe *p,
>  				       struct pt_regs *regs,
>  				       struct kprobe_ctlblk *kcb, int reenter)
> @@ -182,8 +167,6 @@ static void __kprobes setup_singlestep(struct kprobe *p,
>  		/* prepare for single stepping */
>  		slot = (unsigned long)p->ainsn.api.insn;
>  
> -		set_ss_context(kcb, slot, p);	/* mark pending ss */
> -
>  		/* IRQs and single stepping do not mix well. */
>  		kprobes_save_local_irqflag(kcb, regs);
>  
> @@ -219,13 +202,8 @@ static int __kprobes reenter_kprobe(struct kprobe *p,
>  }
>  
>  static void __kprobes
> -post_kprobe_handler(struct kprobe_ctlblk *kcb, struct pt_regs *regs)
> +post_kprobe_handler(struct kprobe *cur, struct kprobe_ctlblk *kcb, struct pt_regs *regs)
>  {
> -	struct kprobe *cur = kprobe_running();
> -
> -	if (!cur)
> -		return;
> -
>  	/* return addr restore if non-branching insn */
>  	if (cur->ainsn.api.restore != 0)
>  		regs->epc = cur->ainsn.api.restore;
> @@ -355,16 +333,16 @@ bool __kprobes
>  kprobe_single_step_handler(struct pt_regs *regs)
>  {
>  	struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
> +	unsigned long addr = instruction_pointer(regs);
> +	struct kprobe *cur = kprobe_running();
>  
> -	if ((kcb->ss_ctx.ss_pending)
> -	    && (kcb->ss_ctx.match_addr == instruction_pointer(regs))) {
> -		clear_ss_context(kcb);	/* clear pending ss */
> -
> +	if (cur && (kcb->kprobe_status & (KPROBE_HIT_SS | KPROBE_REENTER)) &&
> +	    ((unsigned long)&cur->ainsn.api.insn[0] + GET_INSN_LENGTH(cur->opcode) == addr)) {
>  		kprobes_restore_local_irqflag(kcb, regs);
> -
> -		post_kprobe_handler(kcb, regs);
> +		post_kprobe_handler(cur, kcb, regs);
>  		return true;
>  	}
> +	/* not ours, kprobes should ignore it */
>  	return false;
>  }
>  



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
