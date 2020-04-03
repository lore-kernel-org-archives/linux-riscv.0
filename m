Return-Path: <SRS0=G4ZZ=5T=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F58C2BA15
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2020 09:05:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A95020678
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2020 09:05:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sVw7P2SE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="cGHwfv2D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A95020678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k3k/FHfRrWrYtfi+UJknDJkxs4/RbdowOhFZ8Z2iWdM=; b=sVw7P2SE33UDtQS07MfvqaC/X
	i5egrDuZ8zKFPtYwH4lB841EzCJamE9XEkDuO/SsPq5WfONJcgpEU4jDh2H1658pyRzDZC8gdIgrk
	g7edDdA5gObBW2eeLhzRCUUvjHNKAwhNZVCFxY/pcXsOO9Rg00DY6AdLfNY5RjLG5cTOrF7oAXWp7
	hpRvk8XwI6tCojiUFMCSDJ+zwWoXO3XM7SAI8LtzAHiCQXru8lAM9hnlTrNgFYNGdqpr8N3bihxzd
	jvJAVhbXxy6g55G4FzsXSvrXsiDcBTT13IFGiyr63UaAUiB76apBy+HD6lnoGkc70A8BpOjrCG//z
	2NHAz7gHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKIGQ-0001Jh-Pp; Fri, 03 Apr 2020 09:05:22 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKIGA-00076z-01
 for linux-riscv@lists.infradead.org; Fri, 03 Apr 2020 09:05:11 +0000
Received: by mail-oi1-x241.google.com with SMTP id d3so5532701oic.1
 for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2020 02:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k3k/FHfRrWrYtfi+UJknDJkxs4/RbdowOhFZ8Z2iWdM=;
 b=cGHwfv2DRr36j1c2rTxyvR/MF3X2vakyJoCIVMx8L1kaZ4RlB6abpoa7W57bNztggz
 lgHpay/LPc54nWXoD03Wa2l3QIxm0xDS7zrWfRLnKCB8r5aj3/4HRam8GxCxnP6cIdzD
 HVkXi84hVEERv7nK7ttIFp/xLCTRWbfg0c7z3gdqMyb8r1Wa9yCMp8JyXLDZsMsflUJr
 urBA40BCxuFoQn9IAEwYrt7AWUpb78QdyoYTGri24sF0lRBmNajO2+4DFiGhfs1GjeNz
 tl6CqDDFNs9mdIF3RIvg7+qax2xWXiZV2tIj5gneVVEdI9xLMw4LRA1Mw/YlDy0A4SPT
 hAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k3k/FHfRrWrYtfi+UJknDJkxs4/RbdowOhFZ8Z2iWdM=;
 b=NXGSeC6p5+O+ICTvVmxvsuOLSIVLFZjhTxjNRYBPqsswKE2qBDRsb7/FgZwleJkkN2
 3lEdSzScGsixFqP4uciLYJcXwg3San8oW6MQYWw4/mW1UAJJZhitzLayOipTP7luiMdH
 8pd/OOj7B5ayLonAaoYJ/6p5cQ2a8ygS2YrlK4RxTn80Q2sYsec8Azox/vTGxwCx8t13
 Ly3gGpdldZCZS7UeOtfKI4n60TGZVUpomH9s+2/y7+BB1NkMPjDJxJQWbfzu2UZ0Shsh
 ssLbdns9gt6GsZHwS1BJOhh0iYkhjqGqMWCmmIx714RM1V7dhkvplFcqOZ+QlFo3io7j
 u/Ig==
X-Gm-Message-State: AGi0Pub3Yg0bPJtdHXSh2I2Yi2MK+1MHKpaesDx185D6o+tcBvK7xVjp
 bqK7hz7M6MLEGw1QqXPDQhFSNbXBDeu9wAlw3Xnd4g==
X-Google-Smtp-Source: APiQypLJkK1zH27grwowlEcFnZKIjtrS5UOymajuwVuRhdv8zbBnEYOztvC6rsjZ5gT1NfB3qFwWbdVa5VF0A8thQ9w=
X-Received: by 2002:a05:6808:56:: with SMTP id
 v22mr2110639oic.116.1585904701421; 
 Fri, 03 Apr 2020 02:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1583772574.git.zong.li@sifive.com>
 <d27d9e68491e1df67dbee6c22df6a72ff95bab18.1583772574.git.zong.li@sifive.com>
 <20200401003233.17fe4b6f7075e5b8f0ed5114@kernel.org>
 <CANXhq0ra3o+mgenbYLq_q0eZY2KiXNpWmo2V0amD0cFDqCQkXw@mail.gmail.com>
 <20200402101733.1ef240faeaeada6e4d38ae80@kernel.org>
In-Reply-To: <20200402101733.1ef240faeaeada6e4d38ae80@kernel.org>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 3 Apr 2020 17:04:51 +0800
Message-ID: <CANXhq0rMbkNxQ3_qqYEKe8DSbL-vfQku6V9a81Hy9cxW4LaW9g@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] riscv: introduce interfaces to patch kernel code
To: Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_020506_756747_7A268D8D 
X-CRM114-Status: GOOD (  21.49  )
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

On Thu, Apr 2, 2020 at 9:17 AM Masami Hiramatsu <mhiramat@kernel.org> wrote:
>
> Hi,
>
> On Wed, 1 Apr 2020 15:42:30 +0800
> Zong Li <zong.li@sifive.com> wrote:
>
> > > > +
> > > > +static int __kprobes riscv_insn_write(void *addr, const void *insn, size_t len)
> > >
> > > Why would you add "riscv_" prefix for those functions? It seems a bit odd.
> >
> > There is no particular reason, I just was used to adding a prefix for
> > arch-related stuff. I have no preference here, it's OK to me to remove
> > the prefix of these functions, do you think we need to remove them?
>
> Yeah, it will be better, unless it can mixed up with arch-independent
> functions.

OK. I'll remove it and use NOKPROBE_SYMBOL() instead of __kprobes annotation.

>
> > > > +{
> > > > +     void *waddr = addr;
> > > > +     bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
> > > > +     unsigned long flags = 0;
> > > > +     int ret;
> > > > +
> > > > +     raw_spin_lock_irqsave(&patch_lock, flags);
> > >
> > > This looks a bit odd since stop_machine() is protected by its own mutex,
> > > and also the irq is already disabled here.
> >
> > We need it because we don't always enter the riscv_patch_text_nosync()
> > through stop_machine mechanism. If we call the
> > riscv_patch_text_nosync() directly, we need a lock to protect the
> > page.
>
> Oh, OK, but it leads another question. Is that safe to patch the
> text without sync? Would you use it for UP system?
> I think it is better to clarify "in what case user can call _nosync()"
> and add a comment on it.

The ftrace is one of the cases, as documentation of ftrace said, when
dynamic ftrace is initialized, it calls kstop_machine to make the
machine act like a uniprocessor so that it can freely modify code
without worrying about other processors executing that same code. So
the ftrace called the _nosync interface here directly.

>
> Thank you,
>
> >
> > >
> > > Thank you,
> > >
> > > > +
> > > > +     if (across_pages)
> > > > +             patch_map(addr + len, FIX_TEXT_POKE1);
> > > > +
> > > > +     waddr = patch_map(addr, FIX_TEXT_POKE0);
> > > > +
> > > > +     ret = probe_kernel_write(waddr, insn, len);
> > > > +
> > > > +     patch_unmap(FIX_TEXT_POKE0);
> > > > +
> > > > +     if (across_pages)
> > > > +             patch_unmap(FIX_TEXT_POKE1);
> > > > +
> > > > +     raw_spin_unlock_irqrestore(&patch_lock, flags);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +#else
> > > > +static int __kprobes riscv_insn_write(void *addr, const void *insn, size_t len)
> > > > +{
> > > > +     return probe_kernel_write(addr, insn, len);
> > > > +}
> > > > +#endif /* CONFIG_MMU */
> > > > +
> > > > +int __kprobes riscv_patch_text_nosync(void *addr, const void *insns, size_t len)
> > > > +{
> > > > +     u32 *tp = addr;
> > > > +     int ret;
> > > > +
> > > > +     ret = riscv_insn_write(tp, insns, len);
> > > > +
> > > > +     if (!ret)
> > > > +             flush_icache_range((uintptr_t) tp, (uintptr_t) tp + len);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static int __kprobes riscv_patch_text_cb(void *data)
> > > > +{
> > > > +     struct riscv_insn_patch *patch = data;
> > > > +     int ret = 0;
> > > > +
> > > > +     if (atomic_inc_return(&patch->cpu_count) == 1) {
> > > > +             ret =
> > > > +                 riscv_patch_text_nosync(patch->addr, &patch->insn,
> > > > +                                         GET_INSN_LENGTH(patch->insn));
> > > > +             atomic_inc(&patch->cpu_count);
> > > > +     } else {
> > > > +             while (atomic_read(&patch->cpu_count) <= num_online_cpus())
> > > > +                     cpu_relax();
> > > > +             smp_mb();
> > > > +     }
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +int __kprobes riscv_patch_text(void *addr, u32 insn)
> > > > +{
> > > > +     struct riscv_insn_patch patch = {
> > > > +             .addr = addr,
> > > > +             .insn = insn,
> > > > +             .cpu_count = ATOMIC_INIT(0),
> > > > +     };
> > > > +
> > > > +     return stop_machine_cpuslocked(riscv_patch_text_cb,
> > > > +                                    &patch, cpu_online_mask);
> > > > +}
> > > > --
> > > > 2.25.1
> > > >
> > >
> > >
> > > --
> > > Masami Hiramatsu <mhiramat@kernel.org>
>
>
> --
> Masami Hiramatsu <mhiramat@kernel.org>

