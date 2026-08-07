Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091B0C5AC81
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 03:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TjA8kn7NFY7Wli/NvARP7P2NlXCT2KxiAd1BDxDvUWY=; b=Cws+VLEDhS+sqV
	NuA0E/Vz+TOV3OfrYaasvZv0QTlZwuGoNUgn3+ShsDQsukwZp0C1jiA2SUG4aagBFkInVn0FY2AHm
	pBQEM38DFdZTdMJZIVqMij+LLQ2uY2dYLssPVgU7oGdcj8wS+5PSo1DZT6JVNHhKJycbTwPSMknDH
	M+tZXMaok2XA2ybZ2jYVmM2ZY2a0b5+8GBVgc/ZrZFfDUyFiRyYRWRZBH2h5fwvSOnxGKM9Noprsl
	LAFXQXm762xdoWyPfuNJZ1XFDb2bsoE1Hsau20Twkdw3Iwb84feUisLaEuWueaLzemQMgwxjCBLfE
	xhz1n8sNKXBmUoQPTXjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsB0p-000000071NW-1IJA;
	Fri, 07 Aug 2026 03:12:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsB0n-000000071NQ-3v0i
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 03:12:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CC6D360DB5;
	Fri,  7 Aug 2026 03:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D021F000E9;
	Fri,  7 Aug 2026 03:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786072364;
	bh=TKoPvYzwdFSDzD4WBzYKwi8zCPzsID1+6n1mKOfGKxM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=UfCLDSatgC+Gal0pnC++4G/vohSPoVyrDHj9mI24uL8sdbvpAbeh6vBHNx0vwcVw+
	 ccraV3stkWhj6v/40hsiKNI45YW+sjYnO71DWk1NihdzcToVced6+uB9vEMtA52m18
	 F3Vnk40Kww/voiX9HxW76BxJCR7rGyCiSyvtcurBUZ/JjvpHqqEzisgGkSBDsKzKzr
	 2ujLIilvhAbyrtxso/gMLmW0drQAAe302jWmHgLXl+f3bSo1qRTx0WPG+c63iRuJPH
	 PIBh8XCUVes9fyHvlqfN7XFss+Jcap9Vgi7lpIFPMLNZAm0wdeKvCv2ACp/bJyyJ12
	 APUP1u7+rv+GA==
Date: Thu, 6 Aug 2026 21:12:42 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, Andy Chiu <andybnac@gmail.com>, 
    =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, 
    Steven Rostedt <rostedt@goodmis.org>, 
    Masami Hiramatsu <mhiramat@kernel.org>, bpf@vger.kernel.org, 
    Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH] riscv: ftrace: Fix ftrace_modify_call failure on kprobed
 functions
In-Reply-To: <20260802094929.3978390-1-pulehui@huaweicloud.com>
Message-ID: <4a7ed7d1-9eda-3082-81cb-5375b7839f29@kernel.org>
References: <20260802094929.3978390-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
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

Hi,

On Sun, 2 Aug 2026, Pu Lehui wrote:

> From: Pu Lehui <pulehui@huawei.com>
> 
> We are frequently hitting the following splat during the riscv bpf
> selftests:
> 
> 00000000026dc75a: expected (7c3ff297) but got (00100073)
> ------------[ ftrace bug ]------------
> ftrace failed to modify
> [<ffffffff03c44c1c>] bpf_kfunc_common_test+0x4/0x20 [bpf_testmod]
>  actual:   e7:82:c2:ce
> Updating ftrace call site to call a different ftrace function
> ftrace record flags: 80100002
>  (2)
>  expected tramp: ffffffff80043904
> ------------[ cut here ]------------
> WARNING: kernel/trace/ftrace.c:2278 at ftrace_bug+0x46e/0x4b0, CPU#1: test_progs/98
> ...
> [<ffffffff80008f4e>] ftrace_bug+0x46e/0x4b0
> [<ffffffff803d3e86>] ftrace_replace_code+0x16e/0x170
> [<ffffffff803d42b6>] ftrace_modify_all_code+0x12e/0x1b8
> [<ffffffff800430f4>] arch_ftrace_update_code+0x14/0x28
> [<ffffffff803e0324>] ftrace_startup+0x14c/0x2a0
> [<ffffffff803e133c>] ftrace_startup_subops+0x584/0x1050
> [<ffffffff804500e6>] register_ftrace_graph+0x4e6/0x1018
> [<ffffffff804cf9f6>] register_fprobe_ips+0xc66/0x12f8
> [<ffffffff8049abe8>] bpf_kprobe_multi_link_attach+0x5d8/0xe68
> [<ffffffff8050fcaa>] __sys_bpf+0x3d5a/0x47f0
> [<ffffffff805107ee>] __riscv_sys_bpf+0xae/0x168
> [<ffffffff80034d78>] syscall_handler+0x60/0x100
> [<ffffffff8228b4f4>] do_trap_ecall_u+0x174/0x208
> [<ffffffff822b69c4>] handle_exception+0x16c/0x178
> 
> After debugging, it can be triggered by similar commands below:
> ```
> echo do_nanosleep > set_ftrace_filter
> echo function > current_tracer
> echo 'p do_nanosleep' > kprobe_events
> echo 1 > events/kprobes/enable
> echo 'f do_nanosleep' > dynamic_events

I guess you meant 

echo 'f do_nanosleep' >> dynamic_events

instead?

> echo 1 > events/fprobes/enable
> ```
> 
> The reason is that attaching a kprobe to an ftrace-traced function entry
> replaces its initial auipc insn with ebreak. When ftrace_modify_call
> later runs, it expects auipc insn, so verification fails and triggers
> ftrace_bug.
> 
> The expected auipc logic remains conceptually unchanged, and kprobe
> single-stepping ensures normal execution. Therefore, if the first insn
> is ebreak, bypassing the check to continue patching the jalr insn is
> safe and avoids ftrace failures.
> 
> Fixes: b2137c3b6d7a ("riscv: ftrace: prepare ftrace for atomic code patching")
> Signed-off-by: Pu Lehui <pulehui@huawei.com>

I queued the patch with the reproduction sequence updated as mentioned 
above for v7.2-rc.  Please let me know ASAP if you don't agree -


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
