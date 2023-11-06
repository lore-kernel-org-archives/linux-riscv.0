Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD78C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 08:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18C0BoRzoEIUBy8kmnUP/gb9dIkRPRxqqAiRJ8UvYKk=; b=IzAsCJQSOWuMAu
	Zgy2hqXg2H3l3jy281GY4J9snZGOc9VRE/nugMsjIYzBcSaTp2OjyiMkB6hhymHZGCxx7t5Ma8eE4
	vdYnXjB83K6iQVhPob9CAOmfid4ENggHRsyGTNxQVx9tAuVhi5KEhe2EQxGzKbM1KBCq4/ajsCyPy
	L51SqB8nPk6WscLMvCIu7r5l4+IJRfVLW1ukrpZY3eAdiaBctUffQPIG2dNSiAzRsQPI2gO8plZgH
	5UjhLZtdUKP84YfkQmhxjmLsodNDvrs9C5DBo+OVBCOs0DKWFE6p2FGv/7gNTzzpe8I9qaVLTWNeA
	civpTPkNcr3BsBQlpWdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzvMi-00G6gr-0s;
	Mon, 06 Nov 2023 08:53:48 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzvMe-00G6gG-31
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 08:53:46 +0000
Date: Mon, 6 Nov 2023 09:53:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1699260815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qeolRfHxzVklj0vs005zoOB8DEV5jtwoFLjH3ATnFx8=;
	b=sfVFnwpwWDVd8z1krMqD+Y54uY1gd1ckp0Ykbhf1lEMNq8SfYcv34BAx1p0C/iwOcuCs/L
	vEU/4cJQf3h4x7hhjrP1ZMXRctQy0Pfy2xobUtHl8Gxw8++L9f1r321pJntTxKa8I9Z8Kn
	JJ/qjaPKyYBCXA3e7iunUZFb6KXHKx6uUdTCCjjhdGPg64PyWdsofu0928xJlkL8iu5mYt
	HMWWAr5ZUqsNuVrmhxJ3LdoOPBC0csDzxOQDc5P32ooBEhGnrZVFCCtBMjlYhunTvjnvMs
	g0jJYqCkQwP6SdOHjNMUQIS3KOyJR2eBdvE13TEixeeDhLzsnP7nxhD5fxCyCg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1699260815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qeolRfHxzVklj0vs005zoOB8DEV5jtwoFLjH3ATnFx8=;
	b=nNH6yX4o3xG4avhxNTJRX/1uTb60sYc2jypSEZEwehLvMuRPCqKXiKSNH0/0iafSiq9BXz
	7UI5/3r5epxn4uAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Evan Green <evan@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	tobias.schaffner@siemens.com, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RT v2 0/3] riscv: add PREEMPT_RT support
Message-ID: <20231106085333.AkU2s0m-@linutronix.de>
References: <ZUEiCUxcd11inlRP@xhacker>
 <20231031164411.9YRGasL-@linutronix.de>
 <ZUI5h6eIhTlPAmGh@xhacker>
 <20231102-spearman-overcrowd-a86bfb958609@wendy>
 <20231102155423.SyuAibSe@linutronix.de>
 <20231103-army-gloater-af710df04628@spud>
 <20231103082411.f_ZU1E7V@linutronix.de>
 <CALs-HstDSr6arKw+b-HWbEQAgQCNbicJv4H-UKAooa8VxcpnMw@mail.gmail.com>
 <20231103173936.OHevJ107@linutronix.de>
 <CALs-Hsun_6SfdWXHPx-D4djhrKTfwCSm4rkMpt68i+djyDb+RQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALs-Hsun_6SfdWXHPx-D4djhrKTfwCSm4rkMpt68i+djyDb+RQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_005345_138959_972015EA 
X-CRM114-Status: GOOD (  26.34  )
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

On 2023-11-03 11:22:40 [-0700], Evan Green wrote:
> > I don't know what it does and how often it needs to be done. The
> > question is would it be okay to do once on system boot or does it need
> > to be done each time the CPU goes up? Is it required to be the first
> > thing it does or can it be delayed to slightly later point in time?
> 
> It's essentially a characterization we do on each CPU to figure out if
> misaligned word accesses are fast or slow. This info is reported to
> usermode, and potentially has kernel consumers as well (Charlie's ip
> checksumming series wants to flip a static branch based on it).

So you need to do this on each CPU? And there may be differences between
CPU0 and CPU1? On x86 for instance all CPUs within one socket behave the
same. I'm not aware that different CPUs on sockets within a system are
supported.

> In a sense I barely need the buffer, the buffer is just a runway I use
> to do dummy memcpys across. I need to do it once on boot for each CPU,
> and for any additional CPUs that show up via hotplug. It does not need
> to be done across suspend/resume.
> 
> The patch in question was an attempt to move this work to be done in
> parallel, since on systems with lots of CPUs, doing it serially in
> smp_callin() was causing boot time regressions.
> 
> For boot, I think the plan I outlined should work: allocate all pages
> in the initcall before calling on_each_cpu(). For hotplug, I'll have
> to find a spot to allocate a buffer before the CPU comes up, so it can
> use it in smp_callin().

My question still remains: Is this needed to be done on each CPU in the
system or would one CPU, the boot CPU, be sufficient? The static branch
you mentioned is not per-CPU basis this is per system. If you hook
this check to CPU-hotplug, then this will happen for instance during
suspend/ resume (of if triggered manually) and the CPU "feature" will
likely not change.

As naive as I am, I would assume that doing this on the boot CPU should
be enough.

> -Evan

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
