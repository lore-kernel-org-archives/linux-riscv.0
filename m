Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9FEC624DB
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2026 08:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3w+fEbPNnyQ1chV0gvWA89GggRdJnsZVZXEGt73Bhr8=; b=fkxL/KkNrSR2oj
	2GJbwp6Eg3eW/Ca6NzeYh/vJF7mURd2BHdDwuHQOxonHrcJxypNH4VggWIVYXjmUE09nwlfcL2Vc+
	/zA5BQ4w5Mbl10hK0AtNB35nNZDTA31ZA0qC5Q0vOKwz6HmSCEm5N+CFHWV/7lY5u+0EYS0l0hQ2h
	Ks1rOtCdcsCqArp5m05Gj9JWPMHSWY/1ev2y1Kf3r2b5d92ChEgwKM4Nq2PoWCm4wwH7vu6MqVwB2
	JuMn/FARmmDcpdhzEiGeATpAai51J+PrggWuZ61C4wqL9wFGI0sZY0Tv1N1okZNDsquY/3i6O4yV5
	u671Utucz0+xRTIYHJMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lPQ-00000003pnA-1A3q;
	Sat, 05 Sep 2026 08:05:56 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lPM-00000003pmk-29tZ
	for linux-riscv@lists.infradead.org;
	Sat, 05 Sep 2026 08:05:54 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hcQqH1sjhzYQv2n
	for <linux-riscv@lists.infradead.org>; Sat,  5 Sep 2026 16:04:59 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 3F4834057F
	for <linux-riscv@lists.infradead.org>; Sat,  5 Sep 2026 16:05:45 +0800 (CST)
Received: from [10.67.110.68] (unknown [10.67.110.68])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgDHKZdXzZtqAJxTAw--.64717S2;
	Sat, 05 Sep 2026 16:05:44 +0800 (CST)
Message-ID: <c379e0a9-191d-4d3c-9d92-837b58b29409@huaweicloud.com>
Date: Sat, 5 Sep 2026 16:05:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v4 3/3] selftests/bpf: Enable stack argument
 tests for RV64
Content-Language: en-US
To: bot+bpf-ci@kernel.org, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jiangfeng@kylinos.cn
Cc: bjorn@kernel.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
 puranjay@kernel.org, pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr,
 pulehui@huawei.com, martin.lau@kernel.org, mason@kernel.org
References: <20260905070409.4141522-4-pulehui@huaweicloud.com>
 <5e50a375b8cc6ff27c370db71783041b6ceebdf6a014a008bb2ecbfb2dca88ca@mail.kernel.org>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <5e50a375b8cc6ff27c370db71783041b6ceebdf6a014a008bb2ecbfb2dca88ca@mail.kernel.org>
X-CM-TRANSID: gCh0CgDHKZdXzZtqAJxTAw--.64717S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFyUZF1kKrW8GrykuryUWrg_yoW5CF4Upa
	1kCF1akrWvvw4jqry29rn0gr45Wan5JryUGr1DXw1rZFy5K3WkGr4fKay7Aa4DWry3ua4D
	Zrs0vrnagw4kAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU0
	s2-5UUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_010552_913874_AEA9DD90 
X-CRM114-Status: GOOD (  16.52  )
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


On 2026/9/5 15:45, bot+bpf-ci@kernel.org wrote:
>> Enable the stack argument selftests for RV64. The riscv guard is
>> restricted to __riscv_xlen == 64 since stack arguments are only
>> supported by the RV64 JIT.
>>
>> Keep the __BPF_FEATURE_STACK_ARGUMENT gate, defined by clang with
>> BPF stack argument support [1].
>>
>> [1] https://github.com/llvm/llvm-project/pull/189060
>>
>> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
> 
> The changelog says "Enable the stack argument selftests for RV64", but
> one arch-gated stack-argument test remains on x86_64/arm64 only.
> 
> Exhaustive list of every arch-gated stack-argument test in
> tools/testing/selftests/bpf:
> 
>    progs/btf__stack_arg_precision.c        updated by this patch
>    progs/btf__verifier_stack_arg_order.c   updated by this patch
>    progs/stack_arg.c                       updated by this patch
>    progs/stack_arg_kfunc.c                 updated by this patch
>    progs/stack_arg_precision.c             updated by this patch
>    progs/verifier_stack_arg.c              updated by this patch
>    progs/verifier_stack_arg_order.c        updated by this patch
>    progs/stack_arg_fail.c                  no arch gate - already runs
>    progs/exceptions.c:383                  intentionally left alone
>    progs/arena_kfunc.c:219-230             not updated, not explained
> 
> progs/exceptions.c is correctly left alone: DENYLIST.riscv64 lists
> 'exceptions' with the comment "JIT does not support exceptions", and
> arch/riscv/net/ implements no bpf_jit_supports_exceptions().
> 
> progs/arena_kfunc.c is not explained. It gates its stack-argument test
> with test_loader arch annotations rather than a preprocessor guard:
> 
>    #if defined(__BPF_FEATURE_ADDR_SPACE_CAST) && \
>            defined(__BPF_FEATURE_STACK_ARGUMENT)
>    SEC("syscall")
>    __arch_x86_64
>    __arch_arm64
>    __failure __msg("arena pointer cannot be a stack argument")
>    int arena_arg_stack(void *ctx)
> 
> test_loader.c skips any test whose arch mask does not contain the running
> arch, so arena_arg_stack stays skipped on RV64 after this patch.
> 
> Does anything block it from running on RV64?  bpf_jit_supports_arena()
> returns true on riscv64, DENYLIST.riscv64 contains only 'exceptions', and
> arena_arg_stack is a __failure test so it only needs the verifier to reach
> the "arena pointer cannot be a stack argument" check - which now happens
> on RV64 because the preceding commit makes bpf_jit_supports_stack_args()
> return true.
> 
> Should __arch_riscv64 be added to progs/arena_kfunc.c's arena_arg_stack
> (and the #else dummy_test, which carries the same two annotations), or is
> there a reason it should stay on x86_64/arm64 only?

not yet support bpf_jit_supports_arena_args and Kumar have been worked 
on this [0].

[0] https://lore.kernel.org/bpf/20260821233516.3426127-4-memxor@gmail.com/

> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/33952202002


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
