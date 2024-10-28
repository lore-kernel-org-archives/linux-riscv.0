Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D55D13588
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 09:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UJISxSkqwJ4l9KZjQXFFAhiQ1aia72C5uP69W6FaDog=; b=Dn622IV0lH7g5T
	rlnG7Olp+0J4x5rDFcM70nG5gJDeOJJkOzpOE4lNZSmc84ZBoJScWCyZniJZoUTeFO/KyjiMdPi64
	GzT4gPqG+YamHC/nr2NyA5T01ksN9FJsQyfJL7VJZITcExg1YCW8kH7xRai2ZauaGaLTx24GOAZ/x
	mADJb+e3ExlhUC+Qh0amfjG2OOzp8Ry0Vhf0MpOYESSkEikene95iSlr6PNr9Qc0Gt0T/+03IDntL
	u4EEhwI3UGlPpXFvI7zFw4wKtG4ZP7XxBPUJHi6YpeiD8BcsPPODY/XgjBgKc2Gv8U1dom7mxrtra
	BjsBRdwhDUri3zQM0I8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MWo-0000000AKE5-3WMy;
	Mon, 28 Oct 2024 09:59:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MJD-0000000AHQN-3s0L
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 09:45:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E2C105C4C17;
	Mon, 28 Oct 2024 09:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313F1C4CEC3;
	Mon, 28 Oct 2024 09:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730108710;
	bh=CZVjrLe6GkPeTjP9p6IM60BaHFbsS+yZRoS0y2bNcZY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=u3wIy3ymToY+1PiSdOFhjUpnlDSk7OhjkPU07qdOpvfzCg9V4oTM07nQp5sIsHpyz
	 wgauHD8AvPi4SeXkZyzIkl1yikG/728W+gDYMNPeNnLe1njNcayN61O5aF6g8yCsXL
	 iLoWEAkjEr43JmExmPbIBRxMm96He24ZdinR83Dkif9mGfgI1BmYPhpLsQadHHt7zO
	 qZ5JYt8o/cNSnjHKlbWNzLz5C4majC3wTtUkcqhSISBY2z74iPX5CiZuVwdl743GWG
	 JzVxR81e5/osrPeW/g5u0y8drD+cz/VEy2zbvBSTmO4Zv0n+CnifxxoVL4eW4xagBW
	 TfdhTgpI/h4kw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Celeste Liu
 <coelacanthushex@gmail.com>, Celeste Liu via B4 Relay
 <devnull+CoelacanthusHex.gmail.com@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>,
 "Dmitry V. Levin" <ldv@strace.io>, Andrea Bolognani <abologna@redhat.com>,
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>,
 Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>, Yao Zi
 <ziyao@disroot.org>, Han Gao <gaohan@iscas.ac.cn>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] riscv/entry: get correct syscall number from
 syscall_get_nr()
In-Reply-To: <87ldya4nv0.ffs@tglx>
References: <87ldya4nv0.ffs@tglx>
Date: Mon, 28 Oct 2024 02:45:07 -0700
Message-ID: <87sesgftng.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_024512_038134_E3CE71C8 
X-CRM114-Status: GOOD (  13.73  )
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

Thanks for helping out to dissect this! Much appreciated!

Thomas Gleixner <tglx@linutronix.de> writes:

> Let me look at your failure analysis from your first reply:
>
>>  1. strace "tracing": Requires that regs->a0 is not tampered with prior
>>     ptrace notification
>> 
>>     E.g.:
>>     | # ./strace /
>>     | execve("/", ["/"], 0x7ffffaac3890 /* 21 vars */) = -1 EACCES (Permission denied)
>>     | ./strace: exec: Permission denied
>>     | +++ exited with 1 +++
>>     | # ./disable_ptrace_get_syscall_info ./strace /
>>     | execve(0xffffffffffffffda, ["/"], 0x7fffd893ce10 /* 21 vars */) = -1 EACCES (Permission denied)
>>     | ./strace: exec: Permission denied
>>     | +++ exited with 1 +++
>> 
>>     In the second case, arg0 is prematurely set to -ENOSYS
>>     (0xffffffffffffffda).
>
> That's expected if ptrace_get_syscall_info() is not used. Plain dumping
> registers will give you the current value on all architectures.
> ptrace_get_syscall_info() exist exactly for that reason.

Noted! So this shouldn't be considered as a regression. IOW, the
existing upstream code is OK for this scenario.

>>  2. strace "syscall tampering": Requires that ENOSYS is returned for
>>     syscall(-1), and not skipped w/o a proper return value.
>> 
>>     E.g.:
>>     | ./strace -a0 -ewrite -einject=write:error=enospc echo helloject=write:error=enospc echo hello   
>> 
>>     Here, strace expects that injecting -1, would result in a ENOSYS.
>
> No. It expects ENOSPC with the above command line. man strace:
>
>        If :error=errno option is specified, a fault is injected into a
>        syscall invocation: the syscall number is replaced by -1 which
>        corresponds to an invalid syscall (unless a syscall is specified
>        with :syscall= option), and the error code is specified using a
>        symbolic errno value like ENOSYS or a numeric value within
>        1..4095 range.
>
> Similar for -einject:retval=$N
>
> So you cannot overwrite a0 with ENOSYS if the syscall needs to be
> skipped.

ACK!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
