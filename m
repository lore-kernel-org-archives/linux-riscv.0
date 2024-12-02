Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF232D10DB5
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 07:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6VJOZ7ov6x52CZgYLxpdDvr+usN8s9d+iFnNwEgv90=; b=XUSRYt+113k89l
	jSJtyQNUE1PY9unLoUAzh155rLxD1TIu1SXlWpb8oQ9H3qGRkoC1bNklMyG+4Qp4SB+gcSYjFG0YQ
	Mv0HgYe8m1GBDWioZRfo9Lc1NFwGzYWWpRPVJWNpi2KI30u/Rm4xuooqDD63/zWlzFYKcad3ltRwv
	YMYWqTRQu4k74IKU7V0NKOMRCugsFlsU8JwTT5bKYmhibHSLF1D4LIl/nEIg4xv+CpUxt02PAhW7P
	Q5pnN1nM7KB4otTq54FapTw/pifCXz1BCEQXWZzM07Y/pMLlatsNBKhYHiDZCc8WmFbjkIhW3oMzx
	1yeUm/FDkqo4adFHXWMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI1Ke-00000005MD8-2hjU;
	Mon, 02 Dec 2024 07:59:00 +0000
Received: from mta-03.yadro.com ([89.207.88.253])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI1Kb-00000005MCP-0zA9
	for linux-riscv@lists.infradead.org;
	Mon, 02 Dec 2024 07:58:59 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-03.yadro.com 618B8E0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1733126334; bh=FtA8nfMAc5D3CTIG0uNX1jurEbsjQmlpZP0LYJNrYJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=oqIUdBdD+IE9izN16sbYuKngFHY+B4IaNnQxY2W/hp7Edh5fehT/QYXgE1K9rJ0nv
	 pwchwPh1STprgpXMw60f7WTs/Ur2hhi6TYFzy5uFhjAcJi3+F389uTqGa/as8/u84J
	 PJe2ufKbtw7ZkYNV5ygIc77+BWUcJKPi4k1X+EE1JYzcNwTajkhukFgO/qS/OvwDoU
	 nIqeLIwhSotPAgeRujwPCkvb29PkuJNmt3BkZ/erLVRkSxpmDbhsHSOMXxvP7lteXg
	 1JyQeOzg8Xrqijc8kCawIIGwtqvJvzQ471IOGYTOfarN3ty/mZzpEnk6KQFiV/HNYb
	 U5gGzm9c9wZuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1733126334; bh=FtA8nfMAc5D3CTIG0uNX1jurEbsjQmlpZP0LYJNrYJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=HGQs4v4Z5Rs9dryTvbgzi7WFSzX1HI+vdZCx2vFydmE05azEugTTrlAEkOhYjhz2o
	 hdlV6C/Q4E4nB/IYwbHfzaxDZa7cWU4c84ErXlQ8dPPS9fYk3NGtGh2zplSDnd1DtC
	 gVeKi9ZumoJUQcMrugR9ilegDW+6wZmUAYZK60MfHY8tM6+cxXqDzPA04TAYiKPx+u
	 oaYgylq804G8cygCQB6iB0USueKAwDF/N4muvvFBm11XBqC6t6zXZsftxslCkhc90c
	 WQuiQ89ENaGGLabVDY89y7j70htR7sCcvK6ttF3qCDgJJ71Xo7u8Ntfs5jd1do4muL
	 rWlX98fEk1PMQ==
Message-ID: <62f06687-a20d-4f55-b22d-52af707b528a@yadro.com>
Date: Mon, 2 Dec 2024 10:58:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] riscv: ftrace: atmoic patching and preempt
 improvements
To: Andy Chiu <andybnac@gmail.com>
CC: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor
	<nathan@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<llvm@lists.linux.dev>, <bjorn@rivosinc.com>, <puranjay12@gmail.com>,
	<alexghiti@rivosinc.com>, <yongxuan.wang@sifive.com>,
	<greentime.hu@sifive.com>, <nick.hu@sifive.com>, <nylon.chen@sifive.com>,
	<tommy.wu@sifive.com>, <eric.lin@sifive.com>, <viccent.chen@sifive.com>,
	<zong.li@sifive.com>, <samuel.holland@sifive.com>, <linux@yadro.com>
References: <20241127172908.17149-1-andybnac@gmail.com>
Content-Language: en-US
From: Evgenii Shatokhin <e.shatokhin@yadro.com>
In-Reply-To: <20241127172908.17149-1-andybnac@gmail.com>
X-ClientProxiedBy: T-EXCH-07.corp.yadro.com (172.17.11.57) To
 T-EXCH-10.corp.yadro.com (172.17.11.60)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_235858_113726_D318BA2B 
X-CRM114-Status: GOOD (  31.96  )
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

Hi,

On 27.11.2024 20:29, Andy Chiu wrote:
> This series makes atmoic code patching possible in riscv ftrace. A
> direct benefit of this is that we can get rid of stop_machine() when
> patching function entries. This also makes it possible to run ftrace
> with full kernel preemption. Before this series, the kernel initializes
> patchable function entries to NOP4 + NOP4. To start tracing, it updates
> entries to AUIPC + JALR while holding other cores in stop_machine.
> stop_machine() is required because it is impossible to update 2
> instructions, and be seen atomically. And preemption must have to be
> prevented, as kernel preemption allows process to be scheduled out while
> executing on one of these instruction pairs.
> 
> This series addresses the problem by initializing the first NOP4 to
> AUIPC. So, atmoic patching is possible because the kernel only has to
> update one instruction. As long as the instruction is naturally aligned,
> then it is expected to be updated atomically.
> 
> However, the address range of the ftrace trampoline is limited to +-2K
> from ftrace_caller after appplying this series. This issue is expected
> to be solved by Puranjay's CALL_OPS, where it adds 8B naturally align
> data in front of pacthable functions and can  use it to direct execution
> out to any custom trampolines.
> 
> The series is composed by three parts. The first part cleans up the
> existing issues when the kernel is compiled with clang.The second part
> modifies the ftrace code patching mechanism (2-4) as mentioned above.
> Then prepare ftrace to be able to run with kernel preemption (5,6)
> 
> An ongoing fix:
> 
> Since there is no room for marking *kernel_text_address as notrace[1] at
> source code level, there is a significant performance regression when
> using function_graph with TRACE_IRQFLAGS enabled. There can be as much as
> 8 graph handler being called in each function-entry. The current
> workaround requires us echo "*kernel_text_address" into
> set_ftrace_notrace before starting the trace. However, we observed that
> the kernel still enables the patch site in some cases even with
> *kernel_text_address properly added in the file While the root cause is
> still under investagtion, we consider that it should not be the reason
> for holding back the code patching, in order to unblock the call_ops
> part.
> 
> [1]: https://lore.kernel.org/linux-riscv/20240613093233.0b349ed0@rorschach.local.home/
> 
> Changes in v3:
> - Add a fix tag for patch 1
> - Add a data fence before sending out remote fence.i (6)
> - Link to v2: https://lore.kernel.org/all/20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com/
> 
> Changes in v2:
> - Drop patch 1 as it is merged through fixes.
> - Drop patch 2, which converts kernel_text_address into notrace. As
>    users can prevent tracing it by configuring the tracefs.
> - Use a more generic way in kconfig to align functions.
> - Link to v1: https://lore.kernel.org/r/20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com
> 
> 
> Andy Chiu (7):
>    riscv: ftrace: support fastcc in Clang for WITH_ARGS
>    riscv: ftrace: align patchable functions to 4 Byte boundary
>    riscv: ftrace: prepare ftrace for atomic code patching
>    riscv: ftrace: do not use stop_machine to update code
>    riscv: vector: Support calling schedule() for preemptible Vector
>    riscv: add a data fence for CMODX in the kernel mode
>    riscv: ftrace: support PREEMPT
> 
>   arch/riscv/Kconfig                 |   4 +-
>   arch/riscv/include/asm/ftrace.h    |  11 +++
>   arch/riscv/include/asm/processor.h |   5 ++
>   arch/riscv/include/asm/vector.h    |  22 ++++-
>   arch/riscv/kernel/asm-offsets.c    |   7 ++
>   arch/riscv/kernel/ftrace.c         | 133 ++++++++++++-----------------
>   arch/riscv/kernel/mcount-dyn.S     |  25 ++++--
>   arch/riscv/mm/cacheflush.c         |  15 +++-
>   8 files changed, 135 insertions(+), 87 deletions(-)
> ---
> base-commit: 0eb512779d642b21ced83778287a0f7a3ca8f2a1
> --
> 2.39.3 (Apple Git-145)

I have tested this series in a QEMU VM (-machine virt) with the 
preemptible kernels, CONFIG_PREEMPT=y.

No issues have been revealed so far.

One of the kernels was built by GCC 13.2.0 (with the patch for minimum 
alignment added on top of it), the other - with LLVM 17.0.6.

In both cases, the basic boottime tests for Ftrace passed.

Switching tracers between nop, function, function_graph and blk in a 
loop in parallel with stress-ng and with network load for several hours 
did not reveal any problems either. Kernel crashes happened in this 
scenario a year ago, but now it runs clean, good!

Function redirection via Ftrace seems to work OK too.

The size of .text section increased slightly after this series, by 0.35% 
- 0.38%, probably because of function alignment:
* 12075 KB => 12121 KB (GCC)
* 12167 KB => 12209 KB (LLVM/clang)

Not sure, how to test the vector-related part though, "[PATCH v3 5/7] 
riscv: vector: Support calling schedule() for preemptible Vector"

For all other patches in the series:
Tested-by: Evgenii Shatokhin <e.shatokhin@yadro.com>

Regards,
Evgenii

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
