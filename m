Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F433C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jan 2022 00:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=byWaDlDelwUyd6u0Xyk9BR82lGekIw0mRiL5LFbU5Co=; b=FwimihSXxZC95a
	QETY1/WgMEujtJlA9v6vBJyKeCp4UMbbSKfdFo1yFANd89f61fOynDA+dDWphaJKj/LS/WJTrMFwK
	0aNZP8WrjXBymeymxT4i2QsP3/Wq96L4UFl3WmJGJGfNF+ihPvjYjs0suniCAURw1cFKGLH2+t+TI
	Du+0ZNlmaI3/1avAKzHiEsEPb0pl567mGixUb0wf3XgfeOqJ9RTXSxIeGbDlGmEl7p6DMrvhmOadJ
	57p3CvYsVrUiBwvAB5x5bJBQvvX7w++5sJ0ycNNQ4zCy3urmzxZ9Oo1kk1N7Qxmq/PoqMW7QPbgKC
	Vu9M7EuT3bhe8xGvmXaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9cRu-00GgmO-Ss; Tue, 18 Jan 2022 00:34:10 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9cRr-00Ggly-Tb
 for linux-riscv@lists.infradead.org; Tue, 18 Jan 2022 00:34:09 +0000
Received: by mail-il1-x132.google.com with SMTP id z17so14188263ilm.3
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jan 2022 16:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hiCarz0cMwcn3gGhpOB8wK0i7iIt37eOvxUrlShGcD8=;
 b=QVpNI/MBrtcSNbx8awrmyZobTGrN6X531lw1/YoInOrMRrWVItUJnvbM5WkEPClXpo
 lMq4kwXYR01HhIDOXjKZogtlW9Vt1SNr/yUP1sKWLCqsOK5qpIfwuKI0SowNOIoKEQAZ
 s0oKnqPtbIy9DWfwVJ4FSWl0lk3B0muzIr0VutNhEsJPKTZjx70+EG5z69p5E50uwJy9
 fQUxAKUAU0zx4uYmUZv8+ggqZp5dmiHwTIbtAgJPYVAqVqLRJ/4s2J8UUnFDavk2B6MU
 7pGlDpC0D7Zjyz2CVi7Z1oS+pNNEn8uKhmw+q7pTzVZONaMGZngcefvVLAD73bok44zx
 BAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hiCarz0cMwcn3gGhpOB8wK0i7iIt37eOvxUrlShGcD8=;
 b=hiQme6o13xE724VR86xPdqd2kpGpS5z2b0gePe4NwaevOqtGQxdpNT5DZYSAg5DQod
 cefVx/ZRvECfiuDdAh88uY+1semn2xBnwmdmzi+2GzlAGj76HYq8aF5W71Ja0BIfq5va
 do0D8/y+T2tBBgup/NJxo0CB1U3tYvVWpW1cccbPs8Ekv4Ujr5C4QzYlV+g1+POABW7R
 fAcqMP7UDZ6nuXjwz4aRTnqASPzQTr6O4k1nbXY4RP7HjtiDLvzj753+qd1LOH24FzY4
 /ozqNnSVPr9PtJSYXdjSAPwW/9aE9F6C//jnV4pnDbw+pQfBeE81f1L7gc7VxAHk/U7t
 0yRQ==
X-Gm-Message-State: AOAM533AjiwvqnUBdprSuW3RJHIrTknjFFfag/RPKm+WTTMjLEZWtPM+
 elKMurPwadG2OCwsXCe1ruo=
X-Google-Smtp-Source: ABdhPJw5BGWY4lycbu3sm8fIdaWfcDzY0KE8kTjvrjpiXUbR6dVQ2jXRjUkGHHN8Foq4ArNlS451fA==
X-Received: by 2002:a05:6e02:1c4c:: with SMTP id
 d12mr4326236ilg.241.1642466045631; 
 Mon, 17 Jan 2022 16:34:05 -0800 (PST)
Received: from mail.google.com ([207.246.89.135])
 by smtp.gmail.com with ESMTPSA id x11sm4617710ill.78.2022.01.17.16.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 16:34:05 -0800 (PST)
Date: Tue, 18 Jan 2022 08:33:58 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Changbin Du <changbin.du@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH] sysrq: do not omit current cpu when showing backtrace of
 all active CPUs
Message-ID: <20220118003358.6pcowtbds44dntls@mail.google.com>
References: <20220117154300.2808-1-changbin.du@gmail.com>
 <YeWQPVy30EFTQaoq@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YeWQPVy30EFTQaoq@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_163408_025900_0B849610 
X-CRM114-Status: GOOD (  29.26  )
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

Hi, Greg,
On Mon, Jan 17, 2022 at 04:50:21PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Jan 17, 2022 at 11:43:00PM +0800, Changbin Du wrote:
> > The backtrace of current CPU also should be printed as it is active. This
> > change add stack trace for current CPU and print a hint for idle CPU for
> > the generic workqueue based printing. (x86 already does this)
> 
> How does x86 already do this?  What processors do not currently do this?
>

The default hevaiour on x86 is as below:
  1) The current CPU (active) is printed.
  2) There is a hint for idle cpu. This is helpful for me to distingusih whether
     the not printed cpu is in idle or a problem of stacktrace itself (which
     really happed on me).

root@ubuntu:~# echo l > /proc/sysrq-trigger
[   34.622117] sysrq: Show backtrace of all active CPUs
[   34.622573] NMI backtrace for cpu 0
[   34.622576] CPU: 0 PID: 1145 Comm: bash Not tainted 5.16.0+ #120 8a8a684efa076f0b679fc9dbfc6ff35722bf429e
[   34.622579] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.15.0-0-g2dd4b9b3f840-prebuilt.qemu.org 04/01/2014
[   34.622584] Call Trace:
[   34.622588]  <TASK>
[   34.622589]  dump_stack_lvl+0x45/0x59
[   34.622598]  nmi_cpu_backtrace.cold+0x30/0x76
[   34.622600]  ? lapic_can_unplug_cpu+0x80/0x80
[   34.622605]  nmi_trigger_cpumask_backtrace+0x104/0x130
[   34.622610]  __handle_sysrq.cold+0x43/0x129
[   34.622614]  write_sysrq_trigger+0x3f/0x50
[   34.622618]  proc_reg_write+0x55/0xa0
[   34.622622]  vfs_write+0xe4/0x320
[   34.622627]  ksys_write+0x68/0xe0
[   34.622631]  do_syscall_64+0x3b/0xc0
[   34.622634]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[   34.622637] RIP: 0033:0x7f51db009c27
[   34.622640] Code: 0d 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 284
[   34.622641] RSP: 002b:00007ffcef29e828 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
[   34.622644] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007f51db009c27
[   34.622646] RDX: 0000000000000002 RSI: 00005556146896f0 RDI: 0000000000000001
[   34.622647] RBP: 00005556146896f0 R08: 000000000000000a R09: 0000000000000000
[   34.622648] R10: 00007f51db0a7040 R11: 0000000000000246 R12: 0000000000000002
[   34.622649] R13: 00007f51db0e36c0 R14: 00007f51db0e44a0 R15: 00007f51db0e38a0
[   34.622657]  </TASK>
[   34.622658] Sending NMI from CPU 0 to CPUs 1-7:
[   34.622676] NMI backtrace for cpu 7
[   34.622678] CPU: 7 PID: 1187 Comm: unattended-upgr Not tainted 5.16.0+ #120 8a8a684efa076f0b679fc9dbfc6ff35722bf429e
[   34.622681] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.15.0-0-g2dd4b9b3f840-prebuilt.qemu.org 04/01/2014
[   34.622682] RIP: 0010:kmem_cache_free+0x27b/0x480
[   34.622685] Code: 01 59 01 4c 8d 34 10 48 8b 35 a1 01 59 01 49 c1 ee 0c 49 c1 e6 06 49 01 f6 49 8b 46 08 48 8d 50 ff a8 01 4c 0f 45 f2 49 8b 06 <f6> c4 02 0f 84 20 01 00 00 4d 85 f6 0f8
[   34.622687] RSP: 0018:ffffc90000e2bdc0 EFLAGS: 00000202
[   34.622689] RAX: 000fffffc0010200 RBX: ffff888009754000 RCX: 0000000000000000
[   34.622690] RDX: ffffea000025d400 RSI: ffffea0000000000 RDI: ffff888009754000
[   34.622691] RBP: ffffc90000e2be08 R08: 000000080fac04bd R09: 0000000000000000
[   34.622692] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff81436575
[   34.622694] R13: ffff888005479100 R14: ffffea000025d400 R15: 0000000000000000
[   34.622695] FS:  00007fc9e5b1c740(0000) GS:ffff88807dc00000(0000) knlGS:0000000000000000
[   34.622696] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   34.622697] CR2: 00007fc9dba14024 CR3: 0000000028f04002 CR4: 0000000000370ee0
[   34.622699] Call Trace:
[   34.622700]  <TASK>
[   34.622702]  user_path_at_empty+0x45/0x50
[   34.622705]  vfs_statx+0x74/0x130
[   34.622708]  __do_sys_newfstatat+0x31/0x70
[   34.622710]  ? lock_release+0x148/0x430
[   34.622714]  ? syscall_enter_from_user_mode+0x17/0x60
[   34.622716]  ? trace_hardirqs_on+0x2b/0xe0
[   34.622719]  ? syscall_enter_from_user_mode+0x17/0x60
[   34.622720]  do_syscall_64+0x3b/0xc0
[   34.622722]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[   34.622724] RIP: 0033:0x7fc9e5c260ae
[   34.622726] Code: 48 89 f2 b9 00 01 00 00 48 89 fe bf 9c ff ff ff e9 07 00 00 00 0f 1f 80 00 00 00 00 f3 0f 1e fa 41 89 ca b8 06 01 00 00 0f 05 <3d> 00 f0 ff ff 77 0b 31 c0 c3 0f 1f 841
[   34.622727] RSP: 002b:00007ffed7182998 EFLAGS: 00000246 ORIG_RAX: 0000000000000106
[   34.622729] RAX: ffffffffffffffda RBX: 00000000021f8ab0 RCX: 00007fc9e5c260ae
[   34.622730] RDX: 00007ffed71829a0 RSI: 0000000001d90230 RDI: 00000000ffffff9c
[   34.622731] RBP: 00007ffed7182ad0 R08: 0000000001d90230 R09: 0000000000000064
[   34.622732] R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffed7182ae0
[   34.622733] R13: 00007ffed7182ac0 R14: 00007ffed7182b50 R15: 00000000ffffff00
[   34.622736]  </TASK>
[   34.622736] NMI backtrace for cpu 5 skipped: idling at default_idle+0x10/0x20
[   34.622743] NMI backtrace for cpu 4 skipped: idling at default_idle+0x10/0x20
[   34.622746] NMI backtrace for cpu 6 skipped: idling at default_idle+0x10/0x20
[   34.622751] NMI backtrace for cpu 3 skipped: idling at default_idle+0x10/0x20
[   34.622756] NMI backtrace for cpu 2 skipped: idling at default_idle+0x10/0x20
[   34.622762] NMI backtrace for cpu 1 skipped: idling at default_idle+0x10/0x20


> > Now it looks like below:
> > [  279.401567] sysrq: Show backtrace of all active CPUs
> > [  279.407234] sysrq: CPU5:
> > [  279.407505] Call Trace:
> > [  279.408789] [<ffffffff8000606c>] dump_backtrace+0x2c/0x3a
> > [  279.411698] [<ffffffff800060ac>] show_stack+0x32/0x3e
> > [  279.411809] [<ffffffff80542258>] sysrq_handle_showallcpus+0x4c/0xc6
> > [  279.411929] [<ffffffff80542f16>] __handle_sysrq+0x106/0x26c
> > [  279.412034] [<ffffffff805436a8>] write_sysrq_trigger+0x64/0x74
> > [  279.412139] [<ffffffff8029cd48>] proc_reg_write+0x8e/0xe2
> > [  279.412252] [<ffffffff8021a8f8>] vfs_write+0x90/0x2be
> > [  279.412362] [<ffffffff8021acd2>] ksys_write+0xa6/0xce
> > [  279.412467] [<ffffffff8021ad24>] sys_write+0x2a/0x38
> > [  279.412689] [<ffffffff80003ff8>] ret_from_syscall+0x0/0x2
> > [  279.417173] sysrq: CPU6: backtrace skipped as idling
> > [  279.417185] sysrq: CPU4: backtrace skipped as idling
> > [  279.417187] sysrq: CPU0: backtrace skipped as idling
> > [  279.417181] sysrq: CPU7: backtrace skipped as idling
> > [  279.417190] sysrq: CPU1: backtrace skipped as idling
> > [  279.417193] sysrq: CPU3: backtrace skipped as idling
> > [  279.417219] sysrq: CPU2:
> > [  279.419179] Call Trace:
> > [  279.419440] [<ffffffff8000606c>] dump_backtrace+0x2c/0x3a
> > [  279.419782] [<ffffffff800060ac>] show_stack+0x32/0x3e
> > [  279.420015] [<ffffffff80542b30>] showacpu+0x5c/0x96
> > [  279.420317] [<ffffffff800ba71c>] flush_smp_call_function_queue+0xd6/0x218
> > [  279.420569] [<ffffffff800bb438>] generic_smp_call_function_single_interrupt+0x14/0x1c
> > [  279.420798] [<ffffffff800079ae>] handle_IPI+0xaa/0x13a
> > [  279.421024] [<ffffffff804dcb92>] riscv_intc_irq+0x56/0x70
> > [  279.421274] [<ffffffff80a05b70>] generic_handle_arch_irq+0x6a/0xfa
> > [  279.421518] [<ffffffff80004006>] ret_from_exception+0x0/0x10
> > [  279.421750] [<ffffffff80096492>] rcu_idle_enter+0x16/0x1e
> > 
> > Signed-off-by: Changbin Du <changbin.du@gmail.com>
> > ---
> >  drivers/tty/sysrq.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
> > index bbfd004449b5..34cfdda4aff5 100644
> > --- a/drivers/tty/sysrq.c
> > +++ b/drivers/tty/sysrq.c
> > @@ -232,8 +232,10 @@ static void showacpu(void *dummy)
> >  	unsigned long flags;
> >  
> >  	/* Idle CPUs have no interesting backtrace. */
> > -	if (idle_cpu(smp_processor_id()))
> > +	if (idle_cpu(smp_processor_id())) {
> > +		pr_info("CPU%d: backtrace skipped as idling\n", smp_processor_id());
> >  		return;
> > +	}
> 
> Why do you need to see the skipped processor?  Can't you just infer this
> from a lack of calltrace on the other cpus?  What needs to see this
> information?
> 
> >  
> >  	raw_spin_lock_irqsave(&show_lock, flags);
> >  	pr_info("CPU%d:\n", smp_processor_id());
> > @@ -260,10 +262,13 @@ static void sysrq_handle_showallcpus(int key)
> >  
> >  		if (in_hardirq())
> >  			regs = get_irq_regs();
> > -		if (regs) {
> > -			pr_info("CPU%d:\n", smp_processor_id());
> > +
> > +		pr_info("CPU%d:\n", smp_processor_id());
> > +		if (regs)
> >  			show_regs(regs);
> > -		}
> > +		else
> > +			show_stack(NULL, NULL, KERN_INFO);
> > +
> 
> Why is this change needed as well?
> 
On the contrary, I wonder why the current cpu is skipped? Isn't it active?


> thanks,
> 
> greg k-h

-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
