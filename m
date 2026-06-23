Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F74CDB46F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 09:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/HCLLhe2h3o14zRz+iF8rjIsm+ks4Vp5kZqr12aXRLg=; b=C5BcJUx8lpdSsi
	2iroWIaxR5hf1hbpDaeKzuNIAh7TdBy/yHImEdIDeZAHDBtoolcgqccyLcuMrg+zLqsp6iCqjsihK
	lnoEU7sQDkoOCQefkMqqCw2jEVcQgZMuPS6N5C8ebaS+WDdfcYIosHGKbnw5Y/hW0NIG9xuagMRSh
	3jbIGDo5pKE0l3T1j+RUm9CvnIMyam+R3byctkmw/rAhI/VJ+wl1G1V8iCT1/O88MncG2jzIeRs/C
	s4K9JYhbQN3+iJxixobXQYpTyb+/MC32kj/e/hNB4eNKZiJGoY0QDoUgdi57NZSE+S+XMOCTIXqpb
	/csVmMUewQWmcwqGKe4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbxWW-000000061Bi-46Sb;
	Tue, 23 Jun 2026 09:34:28 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbxWT-000000061Ax-0Blj
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jun 2026 09:34:27 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3FE583F4CA
	for <linux-riscv@lists.infradead.org>; Tue, 23 Jun 2026 09:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1782207260;
	bh=k/jZC0jxAqjvGzOmb9VX8r5AMgUUP3sAniVJUnbB+gc=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=L/Rioj0aQTXCV2YHcwsK9Av5v2oNc0vkUfDrKXxSAFA9mp198ZZW5vdNEl8BgRzl9
	 O/ylHHIsLRB6ph7jdEwlPuWz68atQewVf7Pzd4S6LraFXgQoB4dIuZD76/hwNdkgNJ
	 TLlXjbcGMpriNtILGzXPGZ26wE4M3pFueGrntCnihF6+Xv1zYXNj4xGw6tLTwH8GQF
	 z031DnTmdwa1hPsIBivZQTwP8Tj8E0R7LbfAc0U1Qa+FQEnxuvXFTX110HG6JmDTWi
	 YRqCrxTwec2v683ZxSJq7Iaz2LKFyNyzcNm37KUvV7XuKSUJ2IBekFt6fBtbqI+tys
	 xOG30fmYivv9obQw8Cxc13Jn/Od34moUVjv8XGTIZ30xOHaUJf3qOvWSkD87PYIf2m
	 zq7fWMszXSx1eSeaUx+7u9kjH4lZS9u87+mrX1jLrocYpi5g1J872H2bkIy4IdHmjV
	 /wAa3L/ITMO90wOQ2Ny39x8DVteZJ3ATT/p8UzzgemWAb+8Z9RryaMFEjshmxHZ9yq
	 Y+NHR0NaaHURymXzcLnO8kU6TeNNpLrKa29CHXmXXTza/Ke2UxWhxw1NWO9gtfNRpN
	 V4E+szcXUiVdX/nPB1/Ngi5W2HphJ3A9xg0KBW4zIOH0nlaXSV2BG4whxJ0dAB+xog
	 n9CKSSMOenIGGWhj2Q/DWkaI=
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c0cd278cd17so320090166b.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jun 2026 02:34:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782207260; cv=none;
        d=google.com; s=arc-20240605;
        b=BcqkURwbzzCrj/vpEpAHCxXc63WVVM6n9pZzfYA3vcxKx9yiGYnOu2+0ijjJvatbvb
         qHQNseZfeClUHhA+XFGXRlwK7LrGf/tCvnoV04pbFY4wtSTFXCD4RlGLyqibx67NN5tR
         4u9EMd+rputop/TC7b9kA+ENfKu8s0N9YLsNlY61BNupR4mPuGUn0CBlszGoxqs8PYbo
         lF8MtHafkTSWDeQvD5N1LV/cuZWeDoacnXEaa1tWoKcVL/4ZNQKZvDAu7vwq853N3qX4
         Xa4ej0O5q77J1pQ5CpQgTxPvUptPJM84xJwJymOjtpQuAsdbTm1KxdpOlB3wFc4RsNiZ
         qYUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version;
        bh=k/jZC0jxAqjvGzOmb9VX8r5AMgUUP3sAniVJUnbB+gc=;
        fh=pTGAPihcyp46P12n3zcwSrdJEwPv+1eooslkruQ97gM=;
        b=X5nEsbv4ENhZzbOjcNEnC4IYtdcOaFDjxtD/cbTCioDu2l0jxYgr428nyUd1FavxYw
         faJ+pNOKWp1EYnQPOM9vlUcribFZVB4mc+sQj5+sCMpC/TRbRqf/v1Cf3za6hOFlLMcG
         I1kuEzXRf/1H0x0SLbgFwwroBRa2HCoXnGlGsKzn5ERJQ8/coG3H1+5cb8tJV/OQ4OOo
         qCYfODfnM0G5DfCbwh1HSwXjorVVFaBYoS631lme/vAb1ZXCVDRLXhqU3NsCljEtPBST
         kEdAVzghqsjy8AUo7nGdmj7IGxANl6SVFea0i5/DZWIV0Mzj7+Y4fUTyrMnmBGgLZa8M
         U4yg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782207260; x=1782812060;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/jZC0jxAqjvGzOmb9VX8r5AMgUUP3sAniVJUnbB+gc=;
        b=AHb8PikK3STeakZzwW3eg0uCsefBZ6EvVlB4j+8NjAa26cjQmUT+AVVKL2d2UNeBbh
         hAAII57B1WJM6H/1/ml/FiA1VmsMVjk/mRonBjDjRn6HdGlLVa+b5ub5QEHiTIllwVNn
         omIyRQhHU0fJEbiTyM5/JKLp8qYP7kcXv/zEWdSBMOe7Rbdi+YnQEDjkxYfFMLE8rH5G
         89Qc4svmsBog8i6AI6hIwzuURWgJvCt7VhfyjZEkWfwAVRqF215ibNqUnEN0cX1ccF/S
         8wZKTXo2kFXQCzBRJRLEMDfbwCfhe35XGhj7fhPjkDoV2EO9vN4i9731MRjdmSQi0Zsn
         ztRA==
X-Forwarded-Encrypted: i=1; AFNElJ9vWqJDrK3tqgIvjWKQHyVK7cDiQxoEA3ZUzkm0K63DhtEHj1f4UyLwb+3av4rojjlReeeZhzf87K9rbA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxkc3BNLplOfjmx0smnE2GVuju7c7h8AnVmrtOKMSn3d7MCaUCF
	cTlARQnpqO8BcTBnPgtJZ+GATLzHbi+/k1LyqFk4m20rVG65lDVRpQQq2iUFL1P2xUb4c8Y9/c4
	YYIY1uwRE2Zvf9+MdXYtSkHaidqGSEyOa4ZogoBo3dxp5bR+aVoTKRvjzjsyWL6JVa0IKGIyddp
	eRynKYoKdv6Olo2UYuWXlEAlzXlVKA7qCt3Ajen4KZDfkgfKRN2FQHGSEaWK8p
X-Gm-Gg: AfdE7cmvPTRYCM6CHsZIs9krpGPLNGdJWJdPTvZlL6zDL8UDxDFcPeJ6U8pGLMxbNBP
	O6+ifLryqfLWJobAO/UGPtmOoOqgdEJnmfJvVqllAFa2uIhH6Bh4sK1rUNR1axouKKppZHp9eeR
	pKenKfUmN0Jx/zZSwFb94nBku7OmmlwBSda0uWUS+LFF3gdPEKzixl/JljIMOhVilAPg==
X-Received: by 2002:a17:906:ef06:b0:c0f:c475:6bd6 with SMTP id a640c23a62f3a-c108db17c0cmr92555566b.13.1782207259735;
        Tue, 23 Jun 2026 02:34:19 -0700 (PDT)
X-Received: by 2002:a17:906:ef06:b0:c0f:c475:6bd6 with SMTP id
 a640c23a62f3a-c108db17c0cmr92552666b.13.1782207259313; Tue, 23 Jun 2026
 02:34:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 05:34:18 -0400
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 05:34:18 -0400
MIME-Version: 1.0
In-Reply-To: <ajlW4oSzEqav6gxc@MacBook-0RXW5>
References: <ab2yd35rm6OgZUmb@gpd4> <20260320222916.19987-1-boqun@kernel.org>
 <CAJM55Z-hiNDuu5UwoBe7m0wq+_WJrRY0cwopALUgpG+r3ixj8g@mail.gmail.com>
 <ajQPAk_ALP-84obp@MacBook-0RXW5> <CAJM55Z_15U7GssTOims1=J34CYSj=8CDE_di1kJYs5hE3=J53w@mail.gmail.com>
 <ajlW4oSzEqav6gxc@MacBook-0RXW5>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Tue, 23 Jun 2026 05:34:18 -0400
X-Gm-Features: AVVi8CdojB9okAozVltix1WQqZPQNDUlWinUTJkCeQ22W9Cw9M6UJGdyZafHpRM
Message-ID: <CAJM55Z_7N40ARWGoZg04p-NnAy-w10v4=Em-e4Bx4+oNYMGBLg@mail.gmail.com>
Subject: Re: [PATCH v2] rcu: Use an intermediate irq_work to start process_srcu()
To: Boqun Feng <boqun@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, frederic@kernel.org, 
	neeraj.iitr10@gmail.com, urezki@gmail.com, boqun.feng@gmail.com, 
	rcu@vger.kernel.org, Tejun Heo <tj@kernel.org>, bpf@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrea Righi <arighi@nvidia.com>, 
	Zqiang <qiang.zhang@linux.dev>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-riscv@lists.infradead.org, Sarah Emery <sarah.emery@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_023425_492242_2015CD68 
X-CRM114-Status: GOOD (  36.22  )
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

Quoting Boqun Feng (2026-06-22 17:38:10)
> On Sat, Jun 20, 2026 at 05:25:25AM -0400, Emil Renner Berthing wrote:
> > Quoting Boqun Feng (2026-06-18 17:30:10)
> > > On Thu, Jun 18, 2026 at 08:11:36AM -0500, Emil Renner Berthing wrote:
> > > > Quoting Boqun Feng (2026-03-20 23:29:16)
> > > > > Since commit c27cea4416a3 ("rcu: Re-implement RCU Tasks Trace in terms
> > > > > of SRCU-fast") we switched to SRCU in BPF. However as BPF instrument can
> > > > > happen basically everywhere (including where a scheduler lock is held),
> > > > > call_srcu() now needs to avoid acquiring scheduler lock because
> > > > > otherwise it could cause deadlock [1]. Fix this by following what the
> > > > > previous RCU Tasks Trace did: using an irq_work to delay the queuing of
> > > > > the work to start process_srcu().
> > > > >
> > > > > [boqun: Apply Joel's feedback]
> > > > > [boqun: Apply Andrea's test feedback]
> > > > >
> > > > > Reported-by: Andrea Righi <arighi@nvidia.com>
> > > > > Closes: https://lore.kernel.org/all/abjzvz_tL_siV17s@gpd4/
> > > > > Fixes: commit c27cea4416a3 ("rcu: Re-implement RCU Tasks Trace in terms of SRCU-fast")
> > > > > Link: https://lore.kernel.org/rcu/3c4c5a29-24ea-492d-aeee-e0d9605b4183@nvidia.com/ [1]
> > > > > Suggested-by: Zqiang <qiang.zhang@linux.dev>
> > > > > Tested-by: Andrea Righi <arighi@nvidia.com>
> > > > > Signed-off-by: Boqun Feng <boqun@kernel.org>
> > > >
> > > > Thanks for the patch, which is now upstream as
> > > > 7c405fb3279b ("rcu: Use an intermediate irq_work to start process_srcu()")
> > > >
> > > > Unfortunately it seems to halt booting on the Allwinner D1 single-core RISC-V
> > > > SoC both on the 7.0 and 7.1 kernels:
> > > >
> > >
> > > By "single-core", is it only one CPU in that system?
> > >
> > > > https://esmil.dk/d1-7.0.txt
> > > > https://esmil.dk/d1-7.1.txt
> > > >
> >
> > Yes, the SoC only has one CPU core capable of running Linux at least.
> >
> > > From the callstack,
> > >
> > > [  243.002818] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > > [  243.010681] task:kworker/0:0     state:D stack:0     pid:9     tgid:9     ppid:2      task_flags:0x4208060 flags:0x00000000
> > > [  243.021858] Workqueue: device_link_wq device_link_release_fn
> > > [  243.027587] Call Trace:
> > > [  243.030079] [<ffffffff80745b66>] __schedule+0x232/0x530
> > > [  243.035365] [<ffffffff80745e82>] schedule+0x1e/0x94
> > > [  243.040298] [<ffffffff8074aa7a>] schedule_timeout+0x6e/0xa8
> > > [  243.045929] [<ffffffff8004d6a0>] wakeup_preempt+0x8c/0x98
> > > [  243.051380] [<ffffffff80746aee>] wait_for_completion+0x3a/0xb0
> > > [  243.057267] [<ffffffff80087226>] __synchronize_srcu.part.0+0x4e/0x60
> > > [  243.063712] [<ffffffff80084414>] rcu_tasks_get_gp_data+0xc/0x10
> > > [  243.069699] [<ffffffff80490898>] device_link_release_fn+0x14/0x80
> > > [  243.075850] [<ffffffff8003dbd0>] process_one_work+0xf8/0x1c8
> > > [  243.081583] [<ffffffff8003e282>] worker_thread+0x11a/0x254
> > > [  243.087127] [<ffffffff8003e164>] rescuer_thread+0x3a0/0x3a4
> > > [  243.092755] [<ffffffff8003e164>] rescuer_thread+0x3a0/0x3a4
> > > [  243.098381] [<ffffffff8004499e>] kthread+0xbe/0xe4
> > > [  243.103231] [<ffffffff8001349e>] ret_from_fork_kernel+0x6/0xd0
> > > [  243.109127] [<ffffffff800517a8>] schedule_tail+0x8/0xac
> > > [  243.114410] [<ffffffff800448dc>] kthreads_online_cpu+0x0/0x4
> > > [  243.120121] [<ffffffff8074be0a>] ret_from_fork_kernel_asm+0x12/0x18
> > >
> > > I will guess for some reasons the irq_work was missed or the IPI never
> > > happened. Is it possible for you to enable trace points ipi_send_cpu and
> > > ipi_entry to get more information?
> >
> > I have to admit I've not used tracepoints before, but it seems like only
> > ipi_send_cpu and ipi_send_cpumask is available on RISC-V.
> > I've now added trace_event=ipi:* and tp_printk to the command line, and this
>
> Thank you! Yeah, this is what I meant ;-)
>
> > is what I get:
> > https://esmil.dk/d1-7.0-2.txt
> >
>
>
> [    0.071132] rcu:     Max phase no-delay instances is 1000.
> [    0.077837] ipi_send_cpu: cpu=0 callsite=irq_work_queue+0x22/0x4c callback=srcu_irq_work+0x0/0x58
>
> Is this the last line you can see from your (serial?) console, or we are
> missing a few more lines? Maybe it'll should the same hung task
> messages?

Yes, sorry for not being clear about that. This is the exact same binary booted
without the two extra command line parametrs:
https://esmil.dk/d1-7.0-3.txt

But with the two parameters added the board reboots before getting to the hung
task messages. The bootloader enables the watchdog, so I think what happens is
that the kernel halts earlier with the tracepoints enabled, and doesn't get to
load the watchdog driver to keep the machine from rebooting.

The same happens with just trace_event=ipi:* added, just without the last
message above.

>
> The ipi_send_cpu message means RCU was able to send an IPI, now if there
> is no ipi_handler between the send and the hung task, that would mean
> the IPI was missed.
>
> Regards,
> Boqun
>
> > Let me know if there is something I'm missing or something else I can do to help
> > find the bug.
> >
> > /Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
