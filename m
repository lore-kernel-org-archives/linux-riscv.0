Return-Path: <SRS0=CVuh=5S=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BA1C43331
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2020 01:17:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DFC02063A
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2020 01:17:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FTY7ODK+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXLmX4yB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DFC02063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j9fxC3r+CVcfPmz8GHLS3dkdHyD3XMYwR/QFMk//Q/c=; b=FTY7ODK+AYrMVF
	Me22FrhhFsAE+FSVInzII5HXZrJogT5eBjYgILL3p6vRgdv8gnmnnxB6a7GAolZdmUbAAXU7FOA1j
	GuDrXHeN8pc4E4N+I1HZlNLtWewSeLwFRiJurSs/nF2FDvYpFsJsJkgqfMyhpflhR2+4INrO1QQ2j
	ih/ZH0ZqrGikRTsvMTxaTSa0jLLwVCc1UHvQEDAPnfT6/sYyRbQHypY/Ji7f/6NC4KtqdILZ/H9E6
	C6Nhv3DVsoJ1rmS6/pOSu6t82oQWSKSOvyInSDm1SQBrrb1nV+/GXMYPXKLFVaD+Ub703e2ddOO9L
	/yv66wZCVhQaNKcvIcxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJoUJ-0004Ym-0b; Thu, 02 Apr 2020 01:17:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJoUF-0004Xq-79
 for linux-riscv@lists.infradead.org; Thu, 02 Apr 2020 01:17:40 +0000
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 30A682063A;
 Thu,  2 Apr 2020 01:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585790257;
 bh=NwyxAywyRAHMLyNX2R4M8OfPL+9m80oHZLb3bOz9a3Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fXLmX4yBuQcG7ErSOdj+FN7GmJXBDP+Cqc9WXJSQaLmmm9F8o8ceCxne8xgFrrZju
 UHgO0MlWHDJvrUCRfHJfUIqwZcu150nMF6KgjBUApUzvUzz/zm9getHULcZqLOn1Hw
 I/h3wxOHTVl0zcciJGbtL4RmLVgAbZmvyck5rDXI=
Date: Thu, 2 Apr 2020 10:17:33 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v3 8/9] riscv: introduce interfaces to patch kernel code
Message-Id: <20200402101733.1ef240faeaeada6e4d38ae80@kernel.org>
In-Reply-To: <CANXhq0ra3o+mgenbYLq_q0eZY2KiXNpWmo2V0amD0cFDqCQkXw@mail.gmail.com>
References: <cover.1583772574.git.zong.li@sifive.com>
 <d27d9e68491e1df67dbee6c22df6a72ff95bab18.1583772574.git.zong.li@sifive.com>
 <20200401003233.17fe4b6f7075e5b8f0ed5114@kernel.org>
 <CANXhq0ra3o+mgenbYLq_q0eZY2KiXNpWmo2V0amD0cFDqCQkXw@mail.gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200401_181739_298599_7B04A12B 
X-CRM114-Status: GOOD (  19.00  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, 1 Apr 2020 15:42:30 +0800
Zong Li <zong.li@sifive.com> wrote:

> > > +
> > > +static int __kprobes riscv_insn_write(void *addr, const void *insn, size_t len)
> >
> > Why would you add "riscv_" prefix for those functions? It seems a bit odd.
> 
> There is no particular reason, I just was used to adding a prefix for
> arch-related stuff. I have no preference here, it's OK to me to remove
> the prefix of these functions, do you think we need to remove them?

Yeah, it will be better, unless it can mixed up with arch-independent
functions.

> > > +{
> > > +     void *waddr = addr;
> > > +     bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
> > > +     unsigned long flags = 0;
> > > +     int ret;
> > > +
> > > +     raw_spin_lock_irqsave(&patch_lock, flags);
> >
> > This looks a bit odd since stop_machine() is protected by its own mutex,
> > and also the irq is already disabled here.
> 
> We need it because we don't always enter the riscv_patch_text_nosync()
> through stop_machine mechanism. If we call the
> riscv_patch_text_nosync() directly, we need a lock to protect the
> page.

Oh, OK, but it leads another question. Is that safe to patch the
text without sync? Would you use it for UP system?
I think it is better to clarify "in what case user can call _nosync()"
and add a comment on it.

Thank you,

> 
> >
> > Thank you,
> >
> > > +
> > > +     if (across_pages)
> > > +             patch_map(addr + len, FIX_TEXT_POKE1);
> > > +
> > > +     waddr = patch_map(addr, FIX_TEXT_POKE0);
> > > +
> > > +     ret = probe_kernel_write(waddr, insn, len);
> > > +
> > > +     patch_unmap(FIX_TEXT_POKE0);
> > > +
> > > +     if (across_pages)
> > > +             patch_unmap(FIX_TEXT_POKE1);
> > > +
> > > +     raw_spin_unlock_irqrestore(&patch_lock, flags);
> > > +
> > > +     return ret;
> > > +}
> > > +#else
> > > +static int __kprobes riscv_insn_write(void *addr, const void *insn, size_t len)
> > > +{
> > > +     return probe_kernel_write(addr, insn, len);
> > > +}
> > > +#endif /* CONFIG_MMU */
> > > +
> > > +int __kprobes riscv_patch_text_nosync(void *addr, const void *insns, size_t len)
> > > +{
> > > +     u32 *tp = addr;
> > > +     int ret;
> > > +
> > > +     ret = riscv_insn_write(tp, insns, len);
> > > +
> > > +     if (!ret)
> > > +             flush_icache_range((uintptr_t) tp, (uintptr_t) tp + len);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static int __kprobes riscv_patch_text_cb(void *data)
> > > +{
> > > +     struct riscv_insn_patch *patch = data;
> > > +     int ret = 0;
> > > +
> > > +     if (atomic_inc_return(&patch->cpu_count) == 1) {
> > > +             ret =
> > > +                 riscv_patch_text_nosync(patch->addr, &patch->insn,
> > > +                                         GET_INSN_LENGTH(patch->insn));
> > > +             atomic_inc(&patch->cpu_count);
> > > +     } else {
> > > +             while (atomic_read(&patch->cpu_count) <= num_online_cpus())
> > > +                     cpu_relax();
> > > +             smp_mb();
> > > +     }
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +int __kprobes riscv_patch_text(void *addr, u32 insn)
> > > +{
> > > +     struct riscv_insn_patch patch = {
> > > +             .addr = addr,
> > > +             .insn = insn,
> > > +             .cpu_count = ATOMIC_INIT(0),
> > > +     };
> > > +
> > > +     return stop_machine_cpuslocked(riscv_patch_text_cb,
> > > +                                    &patch, cpu_online_mask);
> > > +}
> > > --
> > > 2.25.1
> > >
> >
> >
> > --
> > Masami Hiramatsu <mhiramat@kernel.org>


-- 
Masami Hiramatsu <mhiramat@kernel.org>

