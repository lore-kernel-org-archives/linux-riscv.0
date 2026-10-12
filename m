Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF33CA9EDD
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 08:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yS+A2xv9vy56sVRmrhpsya5RcUiWUT6OncCrbOYik+Y=; b=0jUBp234NArFDf
	41V8G1imF1XwCj3crDqyW3mUn4mTg8qQW8cOhqxA7v5rwlrVOja36cl4GZ9LR5gPlJLJYrb+PtTMI
	f7pe1g0XdFMIUL0k2p4PjholcasQ2OuvGcF0uy5s4qrRU8X41Ht6/79+ITrh9enVl8f0aB47+Xuag
	JQ/tj0Zph0AO6a6VVsrmbNlAATeft6oFB+A00St8fBofeLShA/HJBdSN+vNXdn9iYRQWbpBqlM/JF
	iZYLtXi8RqfP9DxDX8qTcpW7k5Zl0m1flifcwNJ+WZB7uxiIq8Lb4EQVZWLr5KV8IdkX83oJ1uwbw
	myXyMYltEXBKVCjAo3Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGB5H-00000009tzU-0vFs;
	Mon, 12 Oct 2026 08:08:35 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGB5D-00000009typ-2r3K
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 08:08:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791792501; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=D6ifv6a4KKoIiKYJezBRkAhE1P/vLkjB6GL3KBtF0js=;
	b=mZ8EDH6ExRTQlj0doL310Y3O/P4xf/wSDKmU/zPgELMKsUqALWer7jOu5K/6bAgHa0Ro8qu+MiWpb7Gt8LtufiHg0q18nixbxhSoa90mk1u46Ro9Tcci58SyX+UYIegrbr/hk1vDkBNE7+7pMLU8/cmkK1Fg89k8v+CrDU3TZxs=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R561e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=19;SR=0;TI=SMTPD_---0XCd0ksa_1791792496;
Received: from 30.246.160.148(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0XCd0ksa_1791792496 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 12 Oct 2026 16:08:17 +0800
Message-ID: <882701c0-9016-4fe3-93d0-40853f34f19d@linux.alibaba.com>
Date: Mon, 12 Oct 2026 16:08:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: stacktrace: do not report the walker's own
 frame from arch_stack_walk()
To: Karl Mehltretter <kmehltretter@gmail.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Changbin Du <changbin.du@intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Mark Rutland <mark.rutland@arm.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>,
 Rae Moar <raemoar63@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
References: <20261010132712.46931-1-kmehltretter@gmail.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20261010132712.46931-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_010832_577009_82B1DE72 
X-CRM114-Status: GOOD (  19.17  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 10/10/26 9:27 PM, Karl Mehltretter wrote:
> stack_trace_save() uses skipnr + 1 because arch_stack_walk() is expected
> to first report the return into stack_trace_save(). With FRAME_POINTER,
> the RISC-V arch_stack_walk() calls walk_stackframe(), which starts from
> its own frame and first reports the return into arch_stack_walk().
> stack_trace_save() therefore starts one frame too early. For example,
> page_owner records begin at __set_page_owner() instead of the allocation
> site.
> 
> Move the walker into an always-inlined helper and call it directly from
> arch_stack_walk(). Keep walk_stackframe() as a wrapper for its existing
> callers.
> 
> return_address() skips level + 3 entries, while the arm64 implementation
> skips level + 2. After removing the extra frame, use level + 2 so
> ftrace_return_address() and CALLER_ADDR results do not shift by one caller.
> 
> Fixes: 6a00ef449370 ("riscv: eliminate unreliable __builtin_frame_address(1)")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---

Hi, Karl,

> Tested with the KUnit suite from patch 2 on QEMU's virt machine, clang 22
> (LLVM=1), on af32da41b032:
> 
>    mainline                        stack_trace_save 0/3, return_address 2/2
>    stacktrace.c change alone       stack_trace_save 3/3, return_address 0/2
>    this patch                      stack_trace_save 3/3, return_address 2/2
> 
> A BeagleV Ahead (TH1520) booted with this patch passes all five cases.
> The stack_trace_save() result on mainline (0/3) was also reproduced with
> GCC 15.2 and QEMU 10.2.1.
> 
> Without CONFIG_FRAME_POINTER the walker scans the stack for anything that
> looks like a text address and its start frame is not exact before or
> after this patch. What return_address() returns there is unchanged: the
> walk loses one leading entry and the skip count goes down by one.


Hi Karl,

As promised in the other thread, here are test results for this series.

Short version: the fix is correct, the KUnit suite reproduces the bug
precisely, and the whole series passes here.

Testing
-------

Your numbers were collected with clang 22, plus the mainline
reproduction with GCC 15.2 you noted in the commit message, so I
re-ran the full matrix with gcc: riscv64 cross-gcc 16.2.0 for the
first three configurations below and a native gcc 14.3 for the last
one, all under QEMU (qemu-system-riscv64 11.1.1, -machine virt,
-cpu rv64) on top of your base af32da41b032.

A. base + 2/2 only (tests, no fix): pass:2 fail:3, i.e. exactly the
    "stack_trace_save 0/3, return_address 2/2" you reported for
    mainline.  The failures show the off-by-one shift nicely; with
    skip = 0 the first recorded symbol is the walker itself:

        # riscv_stacktrace_skip_zero: skip=0 first=stack_trace_save count=11
        #     symbol == "stack_trace_save"
        #     expected[skip] == "riscv_stacktrace_leaf"

    The two return_address() cases still pass on unpatched mainline,
    which is consistent with the analysis: the current "level + 3" is
    calibrated for the buggy frame layout, so ftrace_return_address()
    keeps working while stack_trace_save() - and everything built on
    top of it - records one bogus leading entry.

B. base + 1/2 + 2/2: pass:5 fail:0.

C. My v6 reliable stack unwinding series [1] + your 2/2, with the
    level constant in return_address.c adjusted to the same
    unconditional "level + 2" as in your 1/2: pass:5 fail:0, with
    per-case results identical to B (skip=0/1/2 first =
    leaf/middle/outer, count = 10/9/8).

D. Cross-toolchain check: I rebuilt the C tree with a native riscv64
    gcc 14.3 inside an Anolis OS 23.4 riscv64 guest - no cross
    toolchain involved at any step - using the same Kconfig options,
    and booted the resulting Image under the same QEMU: pass:5 fail:0
    again, identical output.  The result does not depend on one
    particular compiler's frame layout.

Please feel free to add

     Tested-by: Shuai Xue <xueshuai@linux.alibaba.com>
     Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

Thanks.
Shuai

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
