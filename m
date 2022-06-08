Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8FEC43334
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 16:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0MReCJRaXGlXav8t68+rPAZ+WRrLe0ZwMYXCFs9zyxE=; b=djRaB0H6PxWDpD
	0KSQu8inpe9g2yKO8WXlk01z4dUmphd3qULIqHnRfyygL3ktKuUEbT8LKHl7WyijTT3OaxblalZXf
	Nznpats+7TETRICuw5i+mzXoKx2nxfBT243vXLQv3PBVOPKX6NRgtcWIulSX+YzV7tLH3Cha/Uo+R
	tgCq6yImvazF38ZcpUaaEvV9lMUusAGJUGMB2AN4WTVlOTtENk1drJPYnfebyUZsCOgvcs+6tGWi9
	iNYlnIHzbi8/f1SY5A2L1BfR3Anidos21xo9PH3fMC+i6FXNDladb9hDEcxLuUDSuAOWm0nIGWVBD
	Sl7ITJ2c9gOUwRn5ssJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyyUj-00EI98-CT; Wed, 08 Jun 2022 16:25:21 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyyUX-00EI4w-Qe; Wed, 08 Jun 2022 16:25:11 +0000
Received: from pwmachine.home (154.pool92-186-13.dynamic.orange.es [92.186.13.154])
	by linux.microsoft.com (Postfix) with ESMTPSA id CF4D620BE61B;
	Wed,  8 Jun 2022 09:25:01 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CF4D620BE61B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1654705506;
	bh=ew5GzO4FE+U+0SWUgqG4Xavp3v72gNEOJF0LnOkp+rw=;
	h=From:To:Cc:Subject:Date:From;
	b=Fd3VFGu9AwImhcqGxwixF/Ih8YO5xFjwkPRdgo/nzbzT+c7gxHGAWKvdcoG68zMBf
	 R8LQMhgA/iStrvVoqt+B3eafaBIS4wMAhU23QY++PkFhMBGge194PNWzfgRjaXQKgZ
	 SqfNtFkJ8k9ZfBwctAkBG/1sB6uqewzgB3RIi1yM=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: linux-trace-devel@vger.kernel.org
Cc: James Morse <james.morse@arm.com>,
	Daniel Kiss <daniel.kiss@arm.com>,
	Francis Laniel <flaniel@linux.microsoft.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Mark Brown <broonie@kernel.org>,
	Peter Collingbourne <pcc@google.com>,
	Kees Cook <keescook@chromium.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/1] Remove forget_syscall() from start_thread_common()
Date: Wed,  8 Jun 2022 17:24:45 +0100
Message-Id: <20220608162447.666494-1-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_092509_980222_6E843626 
X-CRM114-Status: GOOD (  11.49  )
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

Hi.


First, I hope you are fine and the same for your relatives.

With this contribution, I enabled using syscalls:sys_exit_execve and
syscalls:sys_exit_execveat as tracepoints on arm64.
Indeed, before this contribution, the above tracepoint would not print their
information as syscall number was set to -1 by calling forget_syscall().

I tested it by compiling a kernel for arm64 and running it within a VM:
# Perf was compiled with linux kernel source.
root@vm-arm64:~# perf record -ag -e 'syscalls:sys_exit_execve' -e 'syscalls:sys_enter_execve' &
[1] 263
root@vm-arm64:~# ls
perf.data  share
root@vm-arm64:~# fg
perf record -ag -e 'syscalls:sys_exit_execve' -e 'syscalls:sys_enter_execve'
^C[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 0.061 MB perf.data (2 samples) ]
root@vm-arm64:~# perf script
bash   264 [000]    66.220187: syscalls:sys_enter_execve: filename: 0xaaab05d9d
...
# Below line does not appear without this patch.
ls   264 [000]    66.226848:  syscalls:sys_exit_execve: 0x0
...

Forgetting the syscall number before starting a new thread was confirmed to be
a bug [1].
Particularly, the following architectures do not forget the syscall number
before starting a new thread:
* arm (32 bits) EABI: start_thread() sets r7 to previous r7 for ELF FDPIC  and
to 0 for other binfmts [2].
* arm (32 bits) OABI: syscall number is set to -1 if
ptrace_report_syscall_entry() failed [3].
* mips: start_thread() does not modify current_thread_info->syscall which is
taken directly from v0 [4, 5].
* riscv: start_thread() does not modify a7 [6].
* x86_64: start_thread_common() does not touch orig_ax which seems to contain
the syscall number [7].

If you see any way to improve this contribution, feel free to share!

Change since:
v1:
 * Remove call to forget_syscall() and store previous syscall number in
 regs->syscallno unconditionnaly.

Francis Laniel (1):
  arm64: Do not forget syscall when starting a new thread.

 arch/arm64/include/asm/processor.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)


Best regards and thank you in advance.
---
[1] https://lore.kernel.org/linux-arm-kernel/YoT1iLPEbteRTQGZ@arm.com/
[2] https://elixir.bootlin.com/linux/v5.18-rc6/source/arch/arm/include/asm/
processor.h#L52
[3] https://elixir.bootlin.com/linux/v5.18-rc6/source/arch/arm/kernel/
ptrace.c#L847
[4] https://elixir.bootlin.com/linux/v5.18-rc6/source/arch/mips/kernel/
process.c#L52
[5] https://elixir.bootlin.com/linux/v5.18-rc6/source/arch/mips/kernel/
scall64-n64.S#L85
[6] https://elixir.bootlin.com/linux/v5.18-rc6/source/arch/riscv/kernel/
process.c#L87
[7] https://elixir.bootlin.com/linux/v5.18-rc6/source/arch/x86/kernel/
process_64.c#L505
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
