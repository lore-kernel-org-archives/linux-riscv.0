Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943F0E64A85
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 12:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gfJR9aIigcHrWbMdxqgEIrndxTQbjwgZPRTWQWJ0CaU=; b=cX1IszBIzhEd+S
	RTwAyYceBosboNhN/CpWaDHJYDzesjbaPMrZxk/uWwBueeMV1U4PFTtlHZISUUp4OyPl2eualJ1QL
	OssPrkjxjmEQR5hvYjgLKN5qL4cB+ngIzFOVUFh1405vh2dOqwHv2dmG53ApQPMwJ/BQ9wHMYO+K2
	yBk4n312aDP8uQELG7Sjr+7kDOFcnbc+wlRueWDFS1tVl84CvVtsah0LDH1XxY8wPIALzFE5EHQUW
	pr2DdtDejoAt6h/3bwMXOaYkbZpqkObFy1cx7mBCYUADEI3DJA5fCxWzf1nE5oi8z9P8hsG99sS8S
	5KwSQ5n49twd6nSuN8HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRza-00000009QT1-10A9;
	Tue, 03 Dec 2024 12:27:02 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRse-00000009P7f-3EkB
	for linux-riscv@lists.infradead.org;
	Tue, 03 Dec 2024 12:19:54 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id F264772C97D;
	Tue,  3 Dec 2024 15:19:48 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id E68127CCB3A; Tue,  3 Dec 2024 14:19:48 +0200 (IST)
Date: Tue, 3 Dec 2024 14:19:48 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Celeste Liu <uwu@coelacanthus.name>, Oleg Nesterov <oleg@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrea Bolognani <abologna@redhat.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ron Economos <re@w6rz.net>,
	Felix Yan <felixonmars@archlinux.org>,
	Ruizhe Pan <c141028@gmail.com>,
	Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>,
	Yao Zi <ziyao@disroot.org>, Han Gao <gaohan@iscas.ac.cn>,
	Quan Zhou <zhouquan@iscas.ac.cn>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] riscv/ptrace: add new regset to get original a0 register
Message-ID: <20241203121948.GA18179@strace.io>
References: <20241201-riscv-new-regset-v1-1-c83c58abcc7b@coelacanthus.name>
 <Z06ZAP-_4J4-6aK_@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z06ZAP-_4J4-6aK_@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_041952_971381_6FD92AD1 
X-CRM114-Status: GOOD (  17.34  )
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

On Mon, Dec 02, 2024 at 09:37:04PM -0800, Charlie Jenkins wrote:
[...]
> +static void ptrace_test(int opt, int *result)
> +{
> +	int status;
> +	pid_t pid;
> +	struct user_regs_struct regs;
> +	struct iovec iov = {
> +		.iov_base = &regs,
> +		.iov_len = sizeof(regs),
> +	};
> +
> +	unsigned long orig_a0;
> +	struct iovec a0_iov = {
> +		.iov_base = &orig_a0,
> +		.iov_len = sizeof(orig_a0),
> +	};
> +
> +	pid = fork();
> +	if (pid == 0) {
> +		/* Mark oneself being traced */
> +		long val = ptrace(PTRACE_TRACEME, 0, 0, 0);
> +		if (val)
> +			perr_and_exit("failed to request for tracer to trace me: %ld\n", val);
> +
> +		kill(getpid(), SIGSTOP);
> +
> +		/* Perform exit syscall that will be intercepted */
> +		exit(A0_OLD);
> +	}
> +
> +	if (pid < 0)
> +		exit(1);
> +
> +	if (waitpid(pid, &status, 0) != pid)
> +		perr_and_exit("failed to wait for the tracee %d\n", pid);
> +
> +	/* Stop at the entry point of the syscall */
> +	resume_and_wait_tracee(pid, PTRACE_SYSCALL);
> +
> +	/* Check tracee regs before the syscall */
> +	if (ptrace(PTRACE_GETREGSET, pid, NT_PRSTATUS, &iov))
> +		perr_and_exit("failed to get tracee registers\n");
> +	if (ptrace(PTRACE_GETREGSET, pid, NT_RISCV_ORIG_A0, &a0_iov))
> +		perr_and_exit("failed to get tracee registers\n");
> +	if (orig_a0 != A0_OLD)
> +		perr_and_exit("unexpected orig_a0: 0x%lx\n", orig_a0);
> +
> +	/* Modify a0/orig_a0 for the syscall */
> +	switch (opt) {
> +	case A0_MODIFY:
> +		regs.a0 = A0_NEW;
> +		break;

Did you mean applying the modified user_regs_struct using PTRACE_SETREGSET?
If yes, then there should be an appropriate PTRACE_SETREGSET NT_PRSTATUS call.
If no, then regs is ignored, so why would you change it in the first place?

> +	case ORIG_A0_MODIFY:
> +		orig_a0 = A0_NEW;
> +		break;
> +	}
> +
> +	if (ptrace(PTRACE_SETREGSET, pid, NT_RISCV_ORIG_A0, &a0_iov))
> +		perr_and_exit("failed to set tracee registers\n");
> +
> +	/* Resume the tracee */
> +	ptrace(PTRACE_CONT, pid, 0, 0);
> +	if (waitpid(pid, &status, 0) != pid)
> +		perr_and_exit("failed to wait for the tracee\n");
> +
> +	*result = WEXITSTATUS(status);
> +}

-- 
ldv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
