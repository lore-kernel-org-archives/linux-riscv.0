Return-Path: <SRS0=zqna=AV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDBAC433E4
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 13:50:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E01E206A5
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 13:50:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MzNq4QBL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pr0Ks08N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E01E206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xwLH2sK2k19KQoqT29ip1DdL/zlZZGGfA3ebwWh95lY=; b=MzNq4QBLMpIydPA8+Xt0UWXNb
	acYmQTFAlAiwq9a3YtZhbP6/TU1AHv0ALEwQWVqsMhhl+6HFX9Y2XVeRJlMFVJVgYLwY1/spBkq0X
	pxBz7jTdpWBAMj7SNEnL3CuHJzeZcH3J0kyV+5Y13Bqu2frsmIb5L+o4QMkjJXPHZNWUXqHZtgwsb
	GsxPRxWCRwMEaIWvpZeih2DmNM/VSsv5r2ZbvUYgHQu2myLB3rXTCCrKjeZzsU6TphPBiAVBltC7f
	cd3vpD7eAi0MF0HMR4rsxuDWMxxXtUZnqEp5WDLToo+qQqIbhkHqCvgQR3WYNeBIucsaWmVbsidIa
	CSbVqj+NQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jttQ3-000301-8Y; Fri, 10 Jul 2020 13:50:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jttPz-0002yg-1T
 for linux-riscv@lists.infradead.org; Fri, 10 Jul 2020 13:50:24 +0000
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 075632064B;
 Fri, 10 Jul 2020 13:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594389022;
 bh=In0YOJkA3w7O35oZQkhR6Xs3Z6653LLM+6Ev004T7dg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pr0Ks08N4TqEHRkkVNv/YzDtzu1bHPCyMMe1BkNX3T+JxjVueFzwsIadyMRsA8U/d
 sgDd2o4xNZqOv3gYmuYMo4SPJt82ZnVZJ6xXAb7qU0opCl6xhYh0FsRxwQ0hyAtW18
 RljlWhtXhPIjUATorUHl1BRmj0VrBlnSUTJXJicI=
Date: Fri, 10 Jul 2020 22:50:17 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: guoren@kernel.org
Subject: Re: [PATCH v2 6/6] riscv: Add KPROBES_ON_FTRACE supported
Message-Id: <20200710225017.5ce329485e911f99e17cd483@kernel.org>
In-Reply-To: <1594261154-69745-7-git-send-email-guoren@kernel.org>
References: <1594261154-69745-1-git-send-email-guoren@kernel.org>
 <1594261154-69745-7-git-send-email-guoren@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_095023_229425_942072BA 
X-CRM114-Status: GOOD (  15.10  )
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
Cc: me@packi.ch, Guo Ren <guoren@linux.alibaba.com>, anup@brainfault.org,
 palmerdabbelt@google.com, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, penberg@kernel.org, atish.patra@wdc.com,
 zong.li@sifive.com, paul.walmsley@sifive.com, greentime.hu@sifive.com,
 linux-riscv@lists.infradead.org, bjorn.topel@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Guo,

On Thu,  9 Jul 2020 02:19:14 +0000
guoren@kernel.org wrote:

> +/* Ftrace callback handler for kprobes -- called under preepmt disabed */
> +void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
> +			   struct ftrace_ops *ops, struct pt_regs *regs)
> +{
> +	struct kprobe *p;
> +	struct kprobe_ctlblk *kcb;
> +
> +	p = get_kprobe((kprobe_opcode_t *)ip);
> +	if (unlikely(!p) || kprobe_disabled(p))
> +		return;
> +
> +	kcb = get_kprobe_ctlblk();
> +	if (kprobe_running()) {
> +		kprobes_inc_nmissed_count(p);
> +	} else {
> +		/*
> +		 * The regs->epc hasn't been saved by SAVE_ALL in mcount-dyn.S
> +		 * So no need to resume it, just for kprobe handler.
> +		 */
> +		instruction_pointer_set(regs, ip);
> +		__this_cpu_write(current_kprobe, p);
> +		kcb->kprobe_status = KPROBE_HIT_ACTIVE;
> +		if (!p->pre_handler || !p->pre_handler(p, regs)) {
> +			/*
> +			 * Emulate singlestep (and also recover regs->pc)
> +			 * as if there is a nop
> +			 */
> +			instruction_pointer_set(regs,
> +				(unsigned long)p->addr + MCOUNT_INSN_SIZE);
> +			if (unlikely(p->post_handler)) {
> +				kcb->kprobe_status = KPROBE_HIT_SSDONE;
> +				p->post_handler(p, regs, 0);
> +			}

Hmm, don't you need restoring the previous instruction pointer here?
If you don't support modifying the instruction pointer in the handler,
it must not be compatible with kprobes.

Now BPF function override and function error injection depends on
this behevior, so could you consider to support it in the "ftrace"
implementation at first? (And if it is enabled, you can enable the
livepatch on RISCV too)

Thank you,

> +		}
> +
> +		/*
> +		 * If pre_handler returns !0, it changes regs->pc. We have to
> +		 * skip emulating post_handler.
> +		 */
> +		__this_cpu_write(current_kprobe, NULL);
> +	}
> +}
> +NOKPROBE_SYMBOL(kprobe_ftrace_handler);
> +
> +int arch_prepare_kprobe_ftrace(struct kprobe *p)
> +{
> +	p->ainsn.api.insn = NULL;
> +	return 0;
> +}
> -- 
> 2.7.4
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
