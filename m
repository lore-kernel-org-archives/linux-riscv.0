Return-Path: <SRS0=q1JI=AW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62990C433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2020 01:32:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B74A2075F
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2020 01:32:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DJZiejK4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bMfSdxB7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B74A2075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4zFWFbkiMb8qzNNTrKVqCIua3t8F8kZdSzXXwqEa410=; b=DJZiejK4/yFEZpynzYuc/7Lvw
	WKD6ktlp/AdyVGjrIB16ld0RI5P09COTOvXLiXbbp071D5c0IZxIuH4jCI+gm+FNeNMLTCI/Fc2bu
	iRXcKfVBqNKa1UJp7vqDWMtvBIGCA3JxQN11MdPLviUdI4Eqq64zK8gAig34tksE9hnRxF6qiMlu4
	6ZZkgKzcxtRv7rpZSvOYZsqPMJLH60vvMLtWZxybJjU5J0Rwv3W0J9WhTuGRtCYpPj4rPDX8Vkoud
	B9wbYTMbQMiY4z4l7+IKJtJO+GM9DYZ6bT8j15N8b8Iy7HyLYrRX1u9FzIQEYQkOQZUy621ucAyly
	q5ok4YnIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ju4NH-0005Sq-Fq; Sat, 11 Jul 2020 01:32:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ju4NE-0005SG-86
 for linux-riscv@lists.infradead.org; Sat, 11 Jul 2020 01:32:17 +0000
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DB22B2075F
 for <linux-riscv@lists.infradead.org>; Sat, 11 Jul 2020 01:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594431135;
 bh=JHAq849TrDR2TO0YVgHnBwsgpBJXggDvOdSCDOO9Mhg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bMfSdxB7MrcYqYQa7ldPOwQ86Zvf7PpQlWpXfKwWn1cLEuXE64jZUFUYBu6rYOzyI
 iW9WNDqwkrk0sgSJttDTT1OJ/ku53mvBNojP8dEQQR8KaZXPa7y6EUoPqUh/FVz9eG
 YFLH08D+jTSwcQCN2Sb1ues3kIAJ8EMD9qUmzR5A=
Received: by mail-lj1-f169.google.com with SMTP id q4so8455724lji.2
 for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2020 18:32:14 -0700 (PDT)
X-Gm-Message-State: AOAM532Exi973FSKcq+orVXlBSCTv6R4nAAjN4VERI39Dlg83a2h/dE8
 nr4RQoiqNZ9IlcDouvgsTO7iVyZuQ50sxbQed5Y=
X-Google-Smtp-Source: ABdhPJyp9YYFId4+bHFEau35i4Dd+Jo03McSql50a82wua8FHQxiDnZqzZ8IFMQAFMi/x1kxYJ6SWwlxiHASFRW9a30=
X-Received: by 2002:a2e:b0ed:: with SMTP id h13mr31505047ljl.250.1594431133218; 
 Fri, 10 Jul 2020 18:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <1594261154-69745-1-git-send-email-guoren@kernel.org>
 <1594261154-69745-7-git-send-email-guoren@kernel.org>
 <20200710225017.5ce329485e911f99e17cd483@kernel.org>
In-Reply-To: <20200710225017.5ce329485e911f99e17cd483@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 11 Jul 2020 09:32:01 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSfFY6qf7gZ9t80P-3cACWi3oEe4X8ek+_1nQZZT3Uk5w@mail.gmail.com>
Message-ID: <CAJF2gTSfFY6qf7gZ9t80P-3cACWi3oEe4X8ek+_1nQZZT3Uk5w@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] riscv: Add KPROBES_ON_FTRACE supported
To: Masami Hiramatsu <mhiramat@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_213216_744859_F8ACA4E8 
X-CRM114-Status: GOOD (  19.01  )
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
Cc: =?UTF-8?Q?Patrick_St=C3=A4hlin?= <me@packi.ch>,
 Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, penberg@kernel.org,
 Atish Patra <atish.patra@wdc.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Thx Masami,

On Fri, Jul 10, 2020 at 9:50 PM Masami Hiramatsu <mhiramat@kernel.org> wrote:
>
> Hi Guo,
>
> On Thu,  9 Jul 2020 02:19:14 +0000
> guoren@kernel.org wrote:
>
> > +/* Ftrace callback handler for kprobes -- called under preepmt disabed */
> > +void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
> > +                        struct ftrace_ops *ops, struct pt_regs *regs)
> > +{
> > +     struct kprobe *p;
> > +     struct kprobe_ctlblk *kcb;
> > +
> > +     p = get_kprobe((kprobe_opcode_t *)ip);
> > +     if (unlikely(!p) || kprobe_disabled(p))
> > +             return;
> > +
> > +     kcb = get_kprobe_ctlblk();
> > +     if (kprobe_running()) {
> > +             kprobes_inc_nmissed_count(p);
> > +     } else {
> > +             /*
> > +              * The regs->epc hasn't been saved by SAVE_ALL in mcount-dyn.S
> > +              * So no need to resume it, just for kprobe handler.
> > +              */
> > +             instruction_pointer_set(regs, ip);
> > +             __this_cpu_write(current_kprobe, p);
> > +             kcb->kprobe_status = KPROBE_HIT_ACTIVE;
> > +             if (!p->pre_handler || !p->pre_handler(p, regs)) {
> > +                     /*
> > +                      * Emulate singlestep (and also recover regs->pc)
> > +                      * as if there is a nop
> > +                      */
> > +                     instruction_pointer_set(regs,
> > +                             (unsigned long)p->addr + MCOUNT_INSN_SIZE);
> > +                     if (unlikely(p->post_handler)) {
> > +                             kcb->kprobe_status = KPROBE_HIT_SSDONE;
> > +                             p->post_handler(p, regs, 0);
> > +                     }
>
> Hmm, don't you need restoring the previous instruction pointer here?
look at  riscv mcount-dyn.S SAVE_ALL function, sp frame lay out like this:
-----------------------
| return address |
-----------------------
| frame pointer   |
-----------------------
| pt_regs x1-x31|
-----------------------
It's not a complete pt_regs for the handler, so modifing regs->ip is no use.

> If you don't support modifying the instruction pointer in the handler,
We can modify ip like this if necessary:
*(unsigned long *)((unsigned long)regs + sizeof(struct pt_regs) + 8) = xxx;

> it must not be compatible with kprobes.
Why, can you show related codes? thank you very much.

>
> Now BPF function override and function error injection depends on
> this behevior, so could you consider to support it in the "ftrace"
> implementation at first? (And if it is enabled, you can enable the
> livepatch on RISCV too)
Great message!

But can you show me codes that bpf and err-jnject using the behavior? Thx

I'll try to fix up it :)

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
