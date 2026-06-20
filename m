Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B50CDB466
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jun 2026 09:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvh1CHOD4Zb0q3CR0839Nrb2nX0r4qkGs9oWxoTlZwQ=; b=l6Tu6SoKtuH5lu
	esSp5JPHPDcy0+sa46ENvmBEhEMpqB0UbxFUZQdJ7rtdLgjTiqr/DmiYOrZOncPd4TWE5yP4yyMQB
	oBWDBkspeRBR9vRvi60XYJEQsA1z8ducMvU1sgb38iqJpS/Pn/9B3kZe4PdvX+1YIMWZbptYgqE1X
	a/5XaHrexSYY1aH9ayMdtDD0xyzQgzv4nn0Af3F5SbOUFrgtpuF9MhQzaC/M1utGnp2PnJoo/pHG1
	kGcVt+8g4uF19FVhC3NM517qCL6woHEncW9Gpu8OuQoBbrIiapbJ0N33shXpOeN3xqmJz7U8OainY
	+npWZlVyjojbQuuaSxiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1warxI-00000003J1b-2WX5;
	Sat, 20 Jun 2026 09:25:36 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1warxE-00000003J1B-3AP4
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jun 2026 09:25:35 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9A25A3F1E4
	for <linux-riscv@lists.infradead.org>; Sat, 20 Jun 2026 09:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1781947527;
	bh=n5xFsXHiCYeSu+z4b8f1V8P0TsaKnuNIhP0Q1tsDFRE=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=BIN4jicVvZe+oxNbZ8MVO5udLecTZ6qN1z9h73fPv6Yl2HCIPajTYvqbIMggqfgkt
	 UB1rNMOm+qIdgxpY1YWPrSB74fx7R6hDIe+fiQI5SBQu8ZsD4DFxh3kGfx/yCrVPOr
	 KzZPr3TjjM0vQDNAJQXBu94B0wzHW96wgKP7nD6mrH9gRkc9az+4k+4eZMTEZBrrms
	 FjSIkpD1O90If7rdKPhUaAUttgZ1ctcHzRFXZFNDWONW1mBSzImniZcJmlLPIfjUQe
	 WRDi7TeMQT32HhDjP1LZScpvWyI9dlLV1dTSWXAScpXSsjTyyjILnhaqcTdt/fuKuc
	 ytyyeXDQiAqsYi5Aqofrv1fVt/vY/M2gP9oaycQFcY3TExQ8jSCot4KxQw9QMnx66Q
	 /q7aAHkhYRJ2qEhc3ZtIuxsxH0CSrvrlHBS4EuHET3aVYTaMJIklBd36uHjPD6pzAP
	 NB6OeHfdPSodK/51AxjsQeBK8w7J15RFoP4JZ5vZ1AmW2WURxeTJHx8DQck8TfkmjS
	 Utwg/q3x1JU5o2Rwo6HxT6xwJX1gUulGVF9OQHL8/KH6zMLio+8LeHwN5d5j0VhwB2
	 BsV5Z63AMLD/yjas9m+fcCCfXIaLqhKfdyAgbBAmyuGJRZoFWHmLAPqjj3rfMc8eA9
	 Wn+9uq6t4yAQJBRTvgMISwsI=
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6976b072689so830431a12.3
        for <linux-riscv@lists.infradead.org>; Sat, 20 Jun 2026 02:25:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781947527; cv=none;
        d=google.com; s=arc-20240605;
        b=QVi8Stvky7cZOndcI/lA6k5D8svM0ut//YfNMxbmz8Kuxhe3TJIU5So+j713EweB3E
         cgvNf0pkF/Fb7Q158kdyWh+9l33777ifNbQdDd7FfK7xHNLlfprlz7GpxLDAQ89RnY0/
         oCHC+kgUPfV3fucYq4Ps10/nBpB8+kxnchr5qqUC5Shm3WkY0q0OIM9mNjx0L+AwT0nH
         z6itQfcCZutKT5LQ0fXb+4CE1/PogKtGwgNwuCEFV95sRRGAflNNm/Mu5w7BwbEdDhTS
         JKxgBzBxhw3bmvT5GC9h3PKBDCPQBY12JLpzjVQoJ7/3TpSSOkSMiqF1wZXGg7wXnTIp
         T3cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version;
        bh=n5xFsXHiCYeSu+z4b8f1V8P0TsaKnuNIhP0Q1tsDFRE=;
        fh=se+SR+7LDMhYjt0XpUqoL0JVVkbMzMl2GAz6qc5fdZo=;
        b=BZWhqMSV0f2TwnvgrUniJ9b877EpJZ8X2+u88cK+Q8E9hPVkZeXpow2YHZ43q3mEyX
         ftjnyvILwUcIhOZV5heyN5PLz7UErkqYnannkft6ZRgIu0hP2fkTiU4lzH8MD9NuO6qC
         GWGgIaD7sLX5aCWR/+yCskoZCZWlAeRmUvMoRxn2Pc0RHbzfDEXfi1O+0pdxsAs92SxV
         ahpYDSD3coNefQZjA4rKg+Dk18GvLC+WdYg0hO2m2M0NhfMUDKDUuBI3S5e1mPjUKd5h
         FUzxEELIEG1vPMJ9mvMItDSybnFOZ53OmqA1/jQHefoBEM9arbOFJYla90uWkEYjBPCM
         NWlA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781947527; x=1782552327;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5xFsXHiCYeSu+z4b8f1V8P0TsaKnuNIhP0Q1tsDFRE=;
        b=mU5opDfNtPFc/ypxASBvHTIwta0ZgyI/xwf0vjc6C4Tuyms9L9W96CgUc6KU6Allwo
         Yn94EQ4KlL+7Yn120pvOTUXjq5LOOrSRSN/b6mHUYV3NoEAdAX0i9s44FnN0C51cwnBS
         mNbTWxpOc8FfXaGv9Ipxtyc4adqbTgxM75/IkJbqpVEUbRPBnO4kAO0VyPYIJc8QzSKr
         xiq//qN4ueH+pJcvG7ZSx8My9JVOhmrBbsAOsy/EIUR9A+2uTRHXS9aa3dmhBE40LChh
         2AIP50FEmCyXgipHVxRh6YfJgZRLCPAYv2KYtoQq7gvG/AYOQDj/gsRR35oAJ0cNy41h
         CAkA==
X-Forwarded-Encrypted: i=1; AFNElJ8zfxrfpR3l3DWlpjcMmDgp05Bj8xJi2nyNsRFAJaXAgYPcm0n3K4JRzLbFLH8kB5EgSZtrCALhUrW9tw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe0h8K+G5CzbDk5ZydKruTL9Epr6k/MPQ4hfEwXCib3+Fm/Ocl
	uobh+ZydgLsqxpgsTlX0y+WPuT1tyPcoJVLPxGK1aU9+zXAbAEBrRFjuthhZMUnVEqbUKpwuZQa
	20yCL8c03nAvN8pUQGwg7EWVCV3qPz9TeqDkY7VJ++yR2us9klZ6zK1JiilQnqIWKTK2YiIrEC1
	/BDqxHPy9Pmb2nqFPPfzDpKToQOWqAS9afq4YhI6FS5Ld7DQX8o5TFjZ6uTAuc
X-Gm-Gg: AfdE7ck/lbf98vH1W1CIFj4yH+/lFqBS3VYVfM5vBpxm0Sl2F6QH07OgYvTCEbZGeKX
	anh6SQhPP1TQRWhzPW8bOLFD2NfQXeY4p5DkLEKY3jtkQTYyBNQQHzD1CkBSuKnLx97QLMy3en5
	tRkA1J7alnmsELxM69jRx74oRYQKR8fq8LakJ+Ejxv5CYRI5f9OkteXqUg722rWyxmHA==
X-Received: by 2002:a17:907:a0a:b0:c05:7524:884d with SMTP id a640c23a62f3a-c097ccc63bdmr365481266b.37.1781947527102;
        Sat, 20 Jun 2026 02:25:27 -0700 (PDT)
X-Received: by 2002:a17:907:a0a:b0:c05:7524:884d with SMTP id
 a640c23a62f3a-c097ccc63bdmr365479066b.37.1781947526610; Sat, 20 Jun 2026
 02:25:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 20 Jun 2026 05:25:25 -0400
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 20 Jun 2026 05:25:25 -0400
MIME-Version: 1.0
In-Reply-To: <ajQPAk_ALP-84obp@MacBook-0RXW5>
References: <ab2yd35rm6OgZUmb@gpd4> <20260320222916.19987-1-boqun@kernel.org>
 <CAJM55Z-hiNDuu5UwoBe7m0wq+_WJrRY0cwopALUgpG+r3ixj8g@mail.gmail.com> <ajQPAk_ALP-84obp@MacBook-0RXW5>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Sat, 20 Jun 2026 05:25:25 -0400
X-Gm-Features: AVVi8CePAmtWU1wCLksbKKPXzz3ljeQkbOuCVyrO0kjLNvUr7HtE5CfeHsWd_MY
Message-ID: <CAJM55Z_15U7GssTOims1=J34CYSj=8CDE_di1kJYs5hE3=J53w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260620_022533_284694_B17BFF23 
X-CRM114-Status: GOOD (  21.83  )
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

Quoting Boqun Feng (2026-06-18 17:30:10)
> On Thu, Jun 18, 2026 at 08:11:36AM -0500, Emil Renner Berthing wrote:
> > Quoting Boqun Feng (2026-03-20 23:29:16)
> > > Since commit c27cea4416a3 ("rcu: Re-implement RCU Tasks Trace in terms
> > > of SRCU-fast") we switched to SRCU in BPF. However as BPF instrument can
> > > happen basically everywhere (including where a scheduler lock is held),
> > > call_srcu() now needs to avoid acquiring scheduler lock because
> > > otherwise it could cause deadlock [1]. Fix this by following what the
> > > previous RCU Tasks Trace did: using an irq_work to delay the queuing of
> > > the work to start process_srcu().
> > >
> > > [boqun: Apply Joel's feedback]
> > > [boqun: Apply Andrea's test feedback]
> > >
> > > Reported-by: Andrea Righi <arighi@nvidia.com>
> > > Closes: https://lore.kernel.org/all/abjzvz_tL_siV17s@gpd4/
> > > Fixes: commit c27cea4416a3 ("rcu: Re-implement RCU Tasks Trace in terms of SRCU-fast")
> > > Link: https://lore.kernel.org/rcu/3c4c5a29-24ea-492d-aeee-e0d9605b4183@nvidia.com/ [1]
> > > Suggested-by: Zqiang <qiang.zhang@linux.dev>
> > > Tested-by: Andrea Righi <arighi@nvidia.com>
> > > Signed-off-by: Boqun Feng <boqun@kernel.org>
> >
> > Thanks for the patch, which is now upstream as
> > 7c405fb3279b ("rcu: Use an intermediate irq_work to start process_srcu()")
> >
> > Unfortunately it seems to halt booting on the Allwinner D1 single-core RISC-V
> > SoC both on the 7.0 and 7.1 kernels:
> >
>
> By "single-core", is it only one CPU in that system?
>
> > https://esmil.dk/d1-7.0.txt
> > https://esmil.dk/d1-7.1.txt
> >

Yes, the SoC only has one CPU core capable of running Linux at least.

> From the callstack,
>
> [  243.002818] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [  243.010681] task:kworker/0:0     state:D stack:0     pid:9     tgid:9     ppid:2      task_flags:0x4208060 flags:0x00000000
> [  243.021858] Workqueue: device_link_wq device_link_release_fn
> [  243.027587] Call Trace:
> [  243.030079] [<ffffffff80745b66>] __schedule+0x232/0x530
> [  243.035365] [<ffffffff80745e82>] schedule+0x1e/0x94
> [  243.040298] [<ffffffff8074aa7a>] schedule_timeout+0x6e/0xa8
> [  243.045929] [<ffffffff8004d6a0>] wakeup_preempt+0x8c/0x98
> [  243.051380] [<ffffffff80746aee>] wait_for_completion+0x3a/0xb0
> [  243.057267] [<ffffffff80087226>] __synchronize_srcu.part.0+0x4e/0x60
> [  243.063712] [<ffffffff80084414>] rcu_tasks_get_gp_data+0xc/0x10
> [  243.069699] [<ffffffff80490898>] device_link_release_fn+0x14/0x80
> [  243.075850] [<ffffffff8003dbd0>] process_one_work+0xf8/0x1c8
> [  243.081583] [<ffffffff8003e282>] worker_thread+0x11a/0x254
> [  243.087127] [<ffffffff8003e164>] rescuer_thread+0x3a0/0x3a4
> [  243.092755] [<ffffffff8003e164>] rescuer_thread+0x3a0/0x3a4
> [  243.098381] [<ffffffff8004499e>] kthread+0xbe/0xe4
> [  243.103231] [<ffffffff8001349e>] ret_from_fork_kernel+0x6/0xd0
> [  243.109127] [<ffffffff800517a8>] schedule_tail+0x8/0xac
> [  243.114410] [<ffffffff800448dc>] kthreads_online_cpu+0x0/0x4
> [  243.120121] [<ffffffff8074be0a>] ret_from_fork_kernel_asm+0x12/0x18
>
> I will guess for some reasons the irq_work was missed or the IPI never
> happened. Is it possible for you to enable trace points ipi_send_cpu and
> ipi_entry to get more information?

I have to admit I've not used tracepoints before, but it seems like only
ipi_send_cpu and ipi_send_cpumask is available on RISC-V.
I've now added trace_event=ipi:* and tp_printk to the command line, and this
is what I get:
https://esmil.dk/d1-7.0-2.txt

Let me know if there is something I'm missing or something else I can do to help
find the bug.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
