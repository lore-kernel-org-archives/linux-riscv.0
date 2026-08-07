Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F92C2A09B
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 03:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ycpEKfNPJ4LrXEWmTxJGdKXDXnMHjvsUhUqk1DBgMgU=; b=BE4r4GfQPzagbm
	7UqsyvzpdZTqsClewB+9GEmDJmVzb1bZtbSLQZ2k6ZW8zjr7RBMCEeb0j0Bmj8OXLAC+UewyDWbYT
	eTsyy+yq9/CfZ0e1yyECYj5yExr845dDsamUK44jUM8yLzNZWy0a7HfS35vAKT+QoPcEMQxelsMFM
	Z0M9e2sPPOOm+iOuujU5kCdzlHPihD6B+eShNw3+iXqxUJsD1scwpSRArCcvxq5yk+rFHGhGwrPl3
	CwRiN7UHIqQx/sSCUQOMfowImfIhWmCWlUBcjtje5Kbu6/o5fbk1R7xn8Ct3bf5n+u5mO3Ncr0+OP
	/F4VYN65UqNEDwbp17dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsBT0-000000072mH-163Q;
	Fri, 07 Aug 2026 03:41:54 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsBSw-000000072lN-3yJi
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 03:41:53 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hGVKj4LjczYQtLG
	for <linux-riscv@lists.infradead.org>; Fri,  7 Aug 2026 11:40:41 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 706F24056E
	for <linux-riscv@lists.infradead.org>; Fri,  7 Aug 2026 11:41:37 +0800 (CST)
Received: from [10.67.110.68] (unknown [10.67.110.68])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgB3s0LwU3VqnLadBQ--.6311S2;
	Fri, 07 Aug 2026 11:41:37 +0800 (CST)
Message-ID: <f8359409-4450-4bad-934e-b7f880d2101b@huaweicloud.com>
Date: Fri, 7 Aug 2026 11:41:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: ftrace: Fix ftrace_modify_call failure on kprobed
 functions
Content-Language: en-US
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andy Chiu <andybnac@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, bpf@vger.kernel.org,
 Pu Lehui <pulehui@huawei.com>
References: <20260802094929.3978390-1-pulehui@huaweicloud.com>
 <4a7ed7d1-9eda-3082-81cb-5375b7839f29@kernel.org>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <4a7ed7d1-9eda-3082-81cb-5375b7839f29@kernel.org>
X-CM-TRANSID: _Ch0CgB3s0LwU3VqnLadBQ--.6311S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFyUtryUurW5Xw45Ww15urg_yoW5WF1Dpr
	yfKanI9F4FyanFqay2gr15Cr18tayDAa4UAr1xGw1fAa4qkr18tw1xtr48J3s8JrZ8Aryf
	Z3Wqyr4DWryUAr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUF1
	v3UUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_204151_364663_A6BD95F9 
X-CRM114-Status: GOOD (  11.87  )
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


On 2026/8/7 11:12, Paul Walmsley wrote:
> Hi,
> 
> On Sun, 2 Aug 2026, Pu Lehui wrote:
> 
>> From: Pu Lehui <pulehui@huawei.com>
>>
>> We are frequently hitting the following splat during the riscv bpf
>> selftests:
>>
>> 00000000026dc75a: expected (7c3ff297) but got (00100073)
>> ------------[ ftrace bug ]------------
>> ftrace failed to modify
>> [<ffffffff03c44c1c>] bpf_kfunc_common_test+0x4/0x20 [bpf_testmod]
>>   actual:   e7:82:c2:ce
>> Updating ftrace call site to call a different ftrace function
>> ftrace record flags: 80100002
>>   (2)
>>   expected tramp: ffffffff80043904
>> ------------[ cut here ]------------
>> WARNING: kernel/trace/ftrace.c:2278 at ftrace_bug+0x46e/0x4b0, CPU#1: test_progs/98
>> ...
>> [<ffffffff80008f4e>] ftrace_bug+0x46e/0x4b0
>> [<ffffffff803d3e86>] ftrace_replace_code+0x16e/0x170
>> [<ffffffff803d42b6>] ftrace_modify_all_code+0x12e/0x1b8
>> [<ffffffff800430f4>] arch_ftrace_update_code+0x14/0x28
>> [<ffffffff803e0324>] ftrace_startup+0x14c/0x2a0
>> [<ffffffff803e133c>] ftrace_startup_subops+0x584/0x1050
>> [<ffffffff804500e6>] register_ftrace_graph+0x4e6/0x1018
>> [<ffffffff804cf9f6>] register_fprobe_ips+0xc66/0x12f8
>> [<ffffffff8049abe8>] bpf_kprobe_multi_link_attach+0x5d8/0xe68
>> [<ffffffff8050fcaa>] __sys_bpf+0x3d5a/0x47f0
>> [<ffffffff805107ee>] __riscv_sys_bpf+0xae/0x168
>> [<ffffffff80034d78>] syscall_handler+0x60/0x100
>> [<ffffffff8228b4f4>] do_trap_ecall_u+0x174/0x208
>> [<ffffffff822b69c4>] handle_exception+0x16c/0x178
>>
>> After debugging, it can be triggered by similar commands below:
>> ```
>> echo do_nanosleep > set_ftrace_filter
>> echo function > current_tracer
>> echo 'p do_nanosleep' > kprobe_events
>> echo 1 > events/kprobes/enable
>> echo 'f do_nanosleep' > dynamic_events
> 
> I guess you meant
> 
> echo 'f do_nanosleep' >> dynamic_events
> 
> instead?
> 
>> echo 1 > events/fprobes/enable
>> ```
>>
>> The reason is that attaching a kprobe to an ftrace-traced function entry
>> replaces its initial auipc insn with ebreak. When ftrace_modify_call
>> later runs, it expects auipc insn, so verification fails and triggers
>> ftrace_bug.
>>
>> The expected auipc logic remains conceptually unchanged, and kprobe
>> single-stepping ensures normal execution. Therefore, if the first insn
>> is ebreak, bypassing the check to continue patching the jalr insn is
>> safe and avoids ftrace failures.
>>
>> Fixes: b2137c3b6d7a ("riscv: ftrace: prepare ftrace for atomic code patching")
>> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> 
> I queued the patch with the reproduction sequence updated as mentioned
> above for v7.2-rc.  Please let me know ASAP if you don't agree -

Thanks Paul, total agree to update.

> 
> 
> - Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
