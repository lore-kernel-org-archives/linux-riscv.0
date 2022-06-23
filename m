Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE90C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jun 2022 14:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPoJj5Lsh0LLb3dg87J3heQpEt/P1iRS5Zio9D5tM4s=; b=p8EeJFlue7FI1h
	aPoU5jbmRcHqE/h9D9Al9esJvbyp91Dd5u1EOYZK9/5sZWK5SNmF4I40TXpTorwUjEi3/qZjIv1Sh
	nrF9Jn0MmRm0cD07GNUCGJ4VMrfkLHQYMjBHfVexRn1NREkzMEJi/VOIrwvD+XZsRIZBr5Xgye3Uj
	bQHrjzWVPXWEzFMxxsRBMjHfAt9t2pAqyFTxPIkoxI0GoxHrayrz7sKOkppWvk42LLxFMjZPs8yNQ
	YJtY7IpcZAdU38fJ5jnxcg4ZkF/G0Utwwx9NXAW2873OjeRCWlIJjDnhkX+TthKk2MW8DW1ZQw4bE
	2R4S5Z6poi2NCw91DQ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4NWN-00FTzF-1D; Thu, 23 Jun 2022 14:09:23 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4NWA-00FTtU-4H; Thu, 23 Jun 2022 14:09:11 +0000
Received: from pwmachine.localnet (lfbn-lyo-1-1062-211.w86-248.abo.wanadoo.fr [86.248.131.211])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8565520C7064;
	Thu, 23 Jun 2022 07:09:03 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8565520C7064
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1655993346;
	bh=LRpVeov3fFL6CWYvOD+HQ0kYTCxTXqw7Mo36h8/5pG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ar+l+hBnYQNHgReiMLu6jgCQm2vfeD5cacocn/0pOQhNSmwoxVnRedCclVbwxxKrJ
	 TDksNaQB7500x4ueuDlDgqOnrcx50e+N8g82ZcYLqFc/fGshsgBbfCoG9cSQc0Kr8z
	 Fp1kXz9TH1IlJg87u5HZCY6DJI9lw45SqGEI7Xos=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: linux-trace-devel@vger.kernel.org
Cc: James Morse <james.morse@arm.com>, Daniel Kiss <daniel.kiss@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Mark Brown <broonie@kernel.org>, Peter Collingbourne <pcc@google.com>, Kees Cook <keescook@chromium.org>, Mark Rutland <mark.rutland@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/1] Remove forget_syscall() from start_thread_common()
Date: Thu, 23 Jun 2022 16:09:01 +0200
Message-ID: <2635206.mvXUDI8C0e@pwmachine>
Organization: Microsoft
In-Reply-To: <20220608162447.666494-1-flaniel@linux.microsoft.com>
References: <20220608162447.666494-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_070910_269605_8D52C644 
X-CRM114-Status: GOOD (  20.53  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi.

Le mercredi 8 juin 2022, 18:24:45 CEST Francis Laniel a =E9crit :
> Hi.
> =

> =

> First, I hope you are fine and the same for your relatives.
> =

> With this contribution, I enabled using syscalls:sys_exit_execve and
> syscalls:sys_exit_execveat as tracepoints on arm64.
> Indeed, before this contribution, the above tracepoint would not print th=
eir
> information as syscall number was set to -1 by calling forget_syscall().
> =

> I tested it by compiling a kernel for arm64 and running it within a VM:
> # Perf was compiled with linux kernel source.
> root@vm-arm64:~# perf record -ag -e 'syscalls:sys_exit_execve' -e
> 'syscalls:sys_enter_execve' & [1] 263
> root@vm-arm64:~# ls
> perf.data  share
> root@vm-arm64:~# fg
> perf record -ag -e 'syscalls:sys_exit_execve' -e 'syscalls:sys_enter_exec=
ve'
> ^C[ perf record: Woken up 1 times to write data ]
> [ perf record: Captured and wrote 0.061 MB perf.data (2 samples) ]
> root@vm-arm64:~# perf script
> bash   264 [000]    66.220187: syscalls:sys_enter_execve: filename:
> 0xaaab05d9d ...
> # Below line does not appear without this patch.
> ls   264 [000]    66.226848:  syscalls:sys_exit_execve: 0x0
> ...
> =

> Forgetting the syscall number before starting a new thread was confirmed =
to
> be a bug [1].
> Particularly, the following architectures do not forget the syscall number
> before starting a new thread:
> * arm (32 bits) EABI: start_thread() sets r7 to previous r7 for ELF FDPIC =

> and to 0 for other binfmts [2].
> * arm (32 bits) OABI: syscall number is set to -1 if
> ptrace_report_syscall_entry() failed [3].
> * mips: start_thread() does not modify current_thread_info->syscall which=
 is
> taken directly from v0 [4, 5].
> * riscv: start_thread() does not modify a7 [6].
> * x86_64: start_thread_common() does not touch orig_ax which seems to
> contain the syscall number [7].
> =

> If you see any way to improve this contribution, feel free to share!
> =

> Change since:
> v1:
>  * Remove call to forget_syscall() and store previous syscall number in
>  regs->syscallno unconditionnaly.
> =

> Francis Laniel (1):
>   arm64: Do not forget syscall when starting a new thread.
> =

>  arch/arm64/include/asm/processor.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> =

> =

> Best regards and thank you in advance.
> ---
> [1] https://lore.kernel.org/linux-arm-kernel/YoT1iLPEbteRTQGZ@arm.com/
> [2] https://elixir.bootlin.com/linux/v5.18-rc6/source/arch/arm/include/as=
m/
> processor.h#L52
> [3] https://elixir.bootlin.com/linux/v5.18-rc6/source/arch/arm/kernel/
> ptrace.c#L847
> [4] https://elixir.bootlin.com/linux/v5.18-rc6/source/arch/mips/kernel/
> process.c#L52
> [5] https://elixir.bootlin.com/linux/v5.18-rc6/source/arch/mips/kernel/
> scall64-n64.S#L85
> [6] https://elixir.bootlin.com/linux/v5.18-rc6/source/arch/riscv/kernel/
> process.c#L87
> [7] https://elixir.bootlin.com/linux/v5.18-rc6/source/arch/x86/kernel/
> process_64.c#L505

Can someone please take a quick look at this patch?


Best regards and thank you in advance.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
