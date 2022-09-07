Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04CBC38145
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Sep 2022 22:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tc0dPvfpcellLNX6RjOHNDSGedpM6fq3tSKN+OX+VZ8=; b=MtzwrnobZVJnnW
	39O8D2mSV89AefUeor0AtG2L/s/8xeBO0Ziz29My+rit36M9e4CfIrKb7CjDQNm7MYQ7drqRkdZq7
	p02AEJj/HEESl89yx9Ll0HR4V9CA7YnST2hkuGso8L44WP59PIGzLUuO9SwROUixyD9yA7cR520zy
	1PUnIdfao8YYLi1V2wf3KIZcdxAa6IaEK5yAZ6JMqKOFDw5Cx/8WB1CbMR2o8NqQkbb3JrsYrKso1
	uyu4qn+VEFryvCkSIc50EpKYKJ1x9lw4Gtjr58n5Iw9N1Zu6cfHgV55AN3DyEf7jTTWPS8lQwJctW
	1ZGu6bak5tfQ/n5pmLwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW3XK-00AcwY-U6; Wed, 07 Sep 2022 22:28:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW3XH-00AcqZ-Fj
	for linux-riscv@lists.infradead.org; Wed, 07 Sep 2022 22:28:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B94DDB81EF6;
	Wed,  7 Sep 2022 22:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68270C433D6;
	Wed,  7 Sep 2022 22:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662589720;
	bh=pJsmgTbGHNW/yAcK2hWWKM88ZL8a30t4f/K7+7+aV6o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=o9wKUbADFIRtWiT/CEd6HReWuUu0oRHglS/gghzyUOFyc7H89qQkrJIVxCIVTcp/l
	 8gG2O+dB5t9/6YOgxNqUVmWPMGqfQwwghxJuPLXLWRRwDUPs4fdFTA6MoaXjLxsrNq
	 RGMjDppnaqq2sxjU58qy4PakQJaCXml30mL8Sj/utjBMRbxUaRXMr2+cKP9adwIw5V
	 yVO3iQ+8QMor+VDKrsBwWT7yiJrg6k043hDhVHAOPtFwdUKlrXxWY7aYnkLSmc4kbG
	 6+36FrlWY5jKorE7eMdaEmSkVYHwuGO4Tt0q4i7v1VbNa4Pz/ozgQTGqC+5k/dHjAm
	 FMrgS7e303ddQ==
Date: Thu, 8 Sep 2022 07:28:36 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Liao Chang <liaochang1@huawei.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, mhiramat@kernel.org,
 rostedt@goodmis.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/kprobe: Optimize the performance of patching
 instruction slot
Message-Id: <20220908072836.0e9e0833ddfa4d413a2254be@kernel.org>
In-Reply-To: <YxjTF2FlIJbbKq0p@xhacker>
References: <20220907023327.85630-1-liaochang1@huawei.com>
	<YxjTF2FlIJbbKq0p@xhacker>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_152843_757044_47424115 
X-CRM114-Status: GOOD (  20.14  )
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

On Thu, 8 Sep 2022 01:21:27 +0800
Jisheng Zhang <jszhang@kernel.org> wrote:

> On Wed, Sep 07, 2022 at 10:33:27AM +0800, Liao Chang wrote:
> > Since no race condition occurs on each instruction slot, hence it is
> > safe to patch instruction slot without stopping machine.
> 
> hmm, IMHO there's race when arming kprobe under SMP, so stopping
> machine is necessary here. Maybe I misundertand something.

Yeah, usually the self modifying code needs stop other CPUs some known
points so that other CPUs does not execute the instruction which will
be modified.
Even if a chip ensures that, is that safe for other implementations?
(Does RISC-V specification guarantee this behavior?)

Thank you,

> 
> > 
> > Signed-off-by: Liao Chang <liaochang1@huawei.com>
> > ---
> >  arch/riscv/kernel/probes/kprobes.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
> > index e6e950b7cf32..eff7d7fab535 100644
> > --- a/arch/riscv/kernel/probes/kprobes.c
> > +++ b/arch/riscv/kernel/probes/kprobes.c
> > @@ -24,12 +24,14 @@ post_kprobe_handler(struct kprobe *, struct kprobe_ctlblk *, struct pt_regs *);
> >  static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
> >  {
> >  	unsigned long offset = GET_INSN_LENGTH(p->opcode);
> > +	const kprobe_opcode_t brk_insn = __BUG_INSN_32;
> > +	kprobe_opcode_t slot[MAX_INSN_SIZE];
> >  
> >  	p->ainsn.api.restore = (unsigned long)p->addr + offset;
> >  
> > -	patch_text(p->ainsn.api.insn, p->opcode);
> > -	patch_text((void *)((unsigned long)(p->ainsn.api.insn) + offset),
> > -		   __BUG_INSN_32);
> > +	memcpy(slot, &p->opcode, offset);
> > +	memcpy((void *)((unsigned long)slot + offset), &brk_insn, 4);
> > +	patch_text_nosync(p->ainsn.api.insn, slot, offset + 4);
> >  }
> >  
> >  static void __kprobes arch_prepare_simulate(struct kprobe *p)
> > -- 
> > 2.17.1
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
