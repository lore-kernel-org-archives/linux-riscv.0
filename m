Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34335C4829A
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 19:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:From:In-Reply-To:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7Ep56AHkJK0gFOqbc72R9CnhVCyDM6FkO3zGuoIhe4=; b=ELYN0tr1UN2sP9
	Gz4dgAX+jmv9YPZOyZ2FIH1jcPkkUqBn/WhXD79XF3fAENqXNbIQu2kW470K1hOudREhvIxFLlXOc
	MQDJVKAzsrekAhWzdr0g3cbUEdB/DpIUz6t9SRa3H9wbzGXCtHdtcOkoZl4OjPAIsrvD7bxaE4B5q
	S08MeEW0rUyZ+ECZJlT35Np8YUJe34mhopckbLiaRSpO+5htYJVgG01grA3NTCi5FwQzaPFazWSxv
	Wiu5RDVnk4QbXCJ/DtC49xFPehE7AAJw57yaXBcuGztBk/EIDqO7CbumVlWRmIEPkb8PPzrT+nZWJ
	401G5lJWasy9uR54IzXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZyfe-0000000AW8e-2Kod;
	Tue, 13 Feb 2024 19:42:22 +0000
Received: from mta-04.yadro.com ([89.207.88.248])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZyfb-0000000AW6x-1aTB
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 19:42:21 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com CA0D2C0003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1707853330; bh=rZ5MF2fO1HqNFxjtMuE0B4X0JNOf9SQSa1ISUOkaJeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=pWmhc9UwXcbKgs21Y/G84OEAL0JQQzOvRM8Eqbaqx2u78Zjp73z3DEZHCPaej+gta
	 3JZ6DxVv7Uc9pbzjSSfYrkud49hDCBb+en0/i6DmW6YyNEZFiNwMPeUB+EtNFxNM1B
	 Y5Hmta5LNE0SQIexjiX0zQ3sU2fjJgBG/ZrWRBQW5FSBLocaH1v8NIotsyUQqJmE+E
	 x/DbqljJ0DfbNkEpKaMd0isEX1VnxSGWcK0qQNKLYbPlbGFGNo1d19WQHw/UHrMp/P
	 6fAvINvJUQi1YYAo6vvPwnw1CMJsagQcRXj7U6/yvezwamqIgwq9teSG1eWOj5LutI
	 O7Ny5pKQ1kicg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1707853330; bh=rZ5MF2fO1HqNFxjtMuE0B4X0JNOf9SQSa1ISUOkaJeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=JgqLztf2AxMX3VzYNgGeQ6CJ4SPzal2CL9IU29KDwOAKlnC50aP9/zSgRbuMwMsZH
	 DGzOaEMxiPB5nK4bhkHaLZ1E1g9W6+K7QJ85sY/qHNNOl3uLYmCPzh5sngjbxbXwLs
	 zymlRQ642sM3uSH9UEtqa7re/Pa1mLJKl3bUDWyFVeB8QFYB1PaToyDjFQFh/OLoic
	 al3mzjlsg6/my69Dw9rERztknQzt1kDFck75m9PvFps4AfySy6yAUu1uAHJcAeWzFt
	 yGhbVxg5Y2K5g3KmSg6Afk0vUJ0bBoqFMMk0BUWosnHjkoLMvKN3ptuGfVVVfg5jan
	 lYTCoO/KMQuoA==
Message-ID: <4fe4567b-96be-4102-952b-7d39109b2186@yadro.com>
Date: Tue, 13 Feb 2024 22:42:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 riscv/for-next 0/5] Enable ftrace with kernel
 preemption for RISC-V
Content-Language: en-US
To: Andy Chiu <andy.chiu@sifive.com>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, <rostedt@goodmis.org>,
	<mingo@redhat.com>, <peterz@infradead.org>, <jpoimboe@kernel.org>,
	<jbaron@akamai.com>, <ardb@kernel.org>
CC: <greentime.hu@sifive.com>, <zong.li@sifive.com>, <guoren@kernel.org>,
	Jessica Clarke <jrtc27@jrtc27.com>, <kernel@esmil.dk>,
	<linux-riscv@lists.infradead.org>, <linux@yadro.com>
References: <20220913094252.3555240-1-andy.chiu@sifive.com>
In-Reply-To: <20220913094252.3555240-1-andy.chiu@sifive.com>
From: Evgenii Shatokhin <e.shatokhin@yadro.com>
X-ClientProxiedBy: T-EXCH-06.corp.yadro.com (172.17.10.110) To
 T-EXCH-10.corp.yadro.com (172.17.11.60)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_114220_324405_043B498A 
X-CRM114-Status: GOOD (  28.44  )
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

On 13.09.2022 12:42, Andy Chiu wrote:
> This patch removes dependency of dynamic ftrace from calling
> stop_machine(), and makes it compatiable with kernel preemption.
> Originally, we ran into stack corruptions, or execution of partially
> updated instructions when starting or stopping ftrace on a fully
> preemptible kernel configuration. The reason is that kernel periodically
> calls rcu_momentary_dyntick_idle() on cores waiting for the code-patching
> core running in ftrace. Though rcu_momentary_dyntick_idle() itself is
> marked as notrace, it would call a bunch of tracable functions if we
> configured the kernel as preemptible. For example, these are some functions
> that happened to have a symbol and have not been marked as notrace on a
> RISC-V preemptible kernel compiled with GCC-11:
>   - __rcu_report_exp_rnp()
>   - rcu_report_exp_cpu_mult()
>   - rcu_preempt_deferred_qs()
>   - rcu_preempt_need_deferred_qs()
>   - rcu_preempt_deferred_qs_irqrestore()
> 
> Thus, this make it not ideal for us to rely on stop_machine() and
> handly marked "notrace"s to perform runtime code patching. To remove
> such dependency, we must make updates of code seemed atomic on running
> cores. This might not be obvious for RISC-V since it usaually uses a pair
> of AUIPC + JALR to perform a long jump, which cannot be modified and
> executed concurrently if we consider preemptions. As such, this patch
> proposed a way to make it possible. It embeds a 32-bit rel-address data
> into instructions of each ftrace prologue and jumps indirectly. In this
> way, we could store and load the address atomically so that the code
> patching core could run simutaneously with the rest of running cores.
> 
> After applying the patchset, we compiled a preemptible kernel with all
> tracers and ftrace-selftest enabled, and booted it on a 2-core QEMU virt
> machine. The kernel could boot up successfully, passing all ftrace
> testsuits. Besides, we ran a script that randomly pick a tracer on every
> 0~5 seconds. The kernel has sustained over 20K rounds of the test. In
> contrast, a preemptible kernel without our patch would panic in few
> rounds on the same machine.
> 
> Though we ran into errors when using hwlat or irqsoff tracers together
> with cpu-online stressor from stress-ng on a preemptible kernel. We
> believe the reason may be that  percpu workers of the tracers are being
> queued into unbounded workqueue when cpu get offlined and patches will go
> through tracing tree.
> 
> Additionally, we found patching of tracepoints unsafe since the
> instructions being patched are not naturally aligned. This may result in
> 2 half-word stores, which breaks atomicity, during the code patching.
> 
> changes in patch v2:
>   - Enforce alignments on all functions with a compiler workaround.
>   - Support 64bit addressing for ftrace targets if xlen == 64
>   - Initialize ftrace target addresses to avoid calling bad address in a
>     hypothesized case.
>   - Use LGPTR instead of SZPTR since .align is log-scaled for
>     mcount-dyn.S
>   - Require the nop instruction of all jump_labels aligns naturally on
>     4B.
> 
> Andy Chiu (5):
>    riscv: align ftrace to 4 Byte boundary and increase ftrace prologue
>      size
>    riscv: export patch_insn_write
>    riscv: ftrace: use indirect jump to work with kernel preemption
>    riscv: ftrace: do not use stop_machine to update code
>    riscv: align arch_static_branch function
> 
>   arch/riscv/Makefile                 |   2 +-
>   arch/riscv/include/asm/ftrace.h     |  24 ----
>   arch/riscv/include/asm/jump_label.h |   2 +
>   arch/riscv/include/asm/patch.h      |   1 +
>   arch/riscv/kernel/ftrace.c          | 179 ++++++++++++++++++++--------
>   arch/riscv/kernel/mcount-dyn.S      |  69 ++++++++---
>   arch/riscv/kernel/patch.c           |   4 +-
>   7 files changed, 188 insertions(+), 93 deletions(-)
> 

First of all, thank you for working on making dynamic Ftrace robust in 
preemptible kernels on RISC-V.
It is an important use case but, for now, dynamic Ftrace and related 
tracers cannot be safely used with such kernels.

Are there any updates on this series?
It needs a rebase, of course, but it looks doable.

If I understand the discussion correctly, the only blocker was that 
using "-falign-functions" was not enough to properly align cold 
functions and "-fno-guess-branch-probability" would likely have a 
performance cost.

It seems, GCC developers have recently provided a workaround for that 
(https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=0f5a9a00e3ab1fe96142f304cfbcf3f63b15f326, 
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88345#c24).

"-fmin-function-alignment" should help but, I do not know, which GCC 
versions have got that patch already. In the meantime, one could 
probably check if "-fmin-function-alignment" is supported by the 
compiler and use it, if it is.

Thoughts?

Regards,
Evgenii

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
