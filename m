Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31351C531CB
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 10:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mm6w7mKxxJxyaaiFKe/aXRsbNgh7djgL/Vfg5+jgmvw=; b=M8T/DWooJGdBOl
	BKOHoDxhQJT6I/ucScaDPts0yvjMGIHeZanCeau8881oc1Vd6zoAeBiWYhp8pNuwVkopFtMEfPP+W
	AavtFVOZJ4pJXlGjBteBsJZFBeT1pTUHv0cAC5jKbybTpIZTy71IYYRJ+8h9aCvyMRfG/hETypeij
	6SXn4R0IoYTb9pYZDzTckRHl/tRWbNmXHyn6vPQUi/YRxvP0iL/Uug6h+RiT9VOesCr1+UlfoM8g4
	1YrOr0FVAJudIZw6zgPXu7PUJiyyfY9j9dECsJhZDlHcDqnTgH/ZdepJsnVZZvh1YIQIT/5MvEk3A
	hgOk+d02DM6bgIQFnyPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqTN-0000000E042-49gG;
	Thu, 23 Jul 2026 10:16:14 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqTL-0000000E03Q-0hcB
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jul 2026 10:16:12 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0Lx29bS/id5M40lC5Ms2Nz6QTU5j+T7B90l5cEGBQg8=;
	b=JoceHL4TrRdiJOabL+cHZgWH0jOwmNyNUYVBkVyDbum5Pm1Y1oY6ccctIR37YMtai3s0+Tq7s
	PhxjNBW9Ec/hEydxaaeCS5a6+w7wAXZ+lwLQnstos7PDQL1ceepeqJCS+5JpNCTarLwp/EwPEBi
	lyCIl2IvTl9Uqu7170BaMN8=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4h5Rbt2JNXz1cyvK;
	Thu, 23 Jul 2026 18:06:34 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 3154F40563;
	Thu, 23 Jul 2026 18:15:56 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 23 Jul
 2026 18:15:55 +0800
Message-ID: <15ceb481-ae3e-4c51-aeb7-513a3d213959@huawei.com>
Date: Thu, 23 Jul 2026 18:15:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v5 3/3] selftests/bpf: enable timed may_goto
 tests for riscv64
Content-Language: en-US
To: Feng Jiang <jiangfeng@kylinos.cn>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi
	<memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
	<song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
	<jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Luke Nelson
	<luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Puranjay Mohan
	<puranjay@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Shuah Khan <shuah@kernel.org>, Ihor Solodrai
	<ihor.solodrai@linux.dev>
CC: <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <20260723-riscv-bpf-timed-may-goto-v5-0-86acb54e5642@kylinos.cn>
 <20260723-riscv-bpf-timed-may-goto-v5-3-86acb54e5642@kylinos.cn>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260723-riscv-bpf-timed-may-goto-v5-3-86acb54e5642@kylinos.cn>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_031611_546023_C0F43163 
X-CRM114-Status: GOOD (  12.79  )
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


On 2026/7/23 13:41, Feng Jiang wrote:
> Enable verifier_may_goto_1 (raw instruction tests), stream_cond_break
> (250ms timeout path), and the may_goto_interaction fastcall test on
> riscv64 now that the JIT supports timed may_goto.
> 
> Reviewed-by: Pu Lehui <pulehui@huawei.com>
> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
> ---
>   tools/testing/selftests/bpf/progs/stream.c                | 1 +
>   tools/testing/selftests/bpf/progs/verifier_bpf_fastcall.c | 3 ++-
>   tools/testing/selftests/bpf/progs/verifier_may_goto_1.c   | 4 ++++
>   3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/bpf/progs/stream.c b/tools/testing/selftests/bpf/progs/stream.c
> index 92ba1d72e0ec..8d8e53d37266 100644
> --- a/tools/testing/selftests/bpf/progs/stream.c
> +++ b/tools/testing/selftests/bpf/progs/stream.c
> @@ -64,6 +64,7 @@ SEC("syscall")
>   __arch_x86_64
>   __arch_arm64
>   __arch_s390x
> +__arch_riscv64
>   __success __retval(0)
>   __stderr("ERROR: Timeout detected for may_goto instruction")


This test fails because it relies on arch_bpf_stack_walk to fetch the 
prog. It's fine to leave it on though, since support is on the way.

https://lore.kernel.org/bpf/20260722140015.1982158-1-varunrmallya@gmail.com/


>   __stderr("CPU: {{[0-9]+}} UID: 0 PID: {{[0-9]+}} Comm: {{.*}}")
> diff --git a/tools/testing/selftests/bpf/progs/verifier_bpf_fastcall.c b/tools/testing/selftests/bpf/progs/verifier_bpf_fastcall.c
> index 8d7ff38e4c06..83707faea049 100644
> --- a/tools/testing/selftests/bpf/progs/verifier_bpf_fastcall.c
> +++ b/tools/testing/selftests/bpf/progs/verifier_bpf_fastcall.c
> @@ -660,6 +660,7 @@ __naked void may_goto_interaction_x86_64(void)
>   
>   SEC("raw_tp")
>   __arch_arm64
> +__arch_riscv64
>   __log_level(4) __msg("stack depth 24")
>   /* may_goto counter at -24 */
>   __xlated("0: *(u64 *)(r10 -24) =")
> @@ -679,7 +680,7 @@ __xlated("10: *(u64 *)(r10 -24) = r12")
>   __xlated("11: *(u64 *)(r10 -8) = r1")
>   __xlated("12: exit")
>   __success
> -__naked void may_goto_interaction_arm64(void)
> +__naked void may_goto_interaction(void)
>   {
>   	asm volatile (
>   	"r1 = 1;"
> diff --git a/tools/testing/selftests/bpf/progs/verifier_may_goto_1.c b/tools/testing/selftests/bpf/progs/verifier_may_goto_1.c
> index cb1ce4d13cfc..0e211f030d0d 100644
> --- a/tools/testing/selftests/bpf/progs/verifier_may_goto_1.c
> +++ b/tools/testing/selftests/bpf/progs/verifier_may_goto_1.c
> @@ -11,6 +11,7 @@ __description("may_goto 0")
>   __arch_x86_64
>   __arch_s390x
>   __arch_arm64
> +__arch_riscv64
>   __xlated("0: r0 = 1")
>   __xlated("1: exit")
>   __success
> @@ -31,6 +32,7 @@ __description("batch 2 of may_goto 0")
>   __arch_x86_64
>   __arch_s390x
>   __arch_arm64
> +__arch_riscv64
>   __xlated("0: r0 = 1")
>   __xlated("1: exit")
>   __success
> @@ -53,6 +55,7 @@ __description("may_goto batch with offsets 2/1/0")
>   __arch_x86_64
>   __arch_s390x
>   __arch_arm64
> +__arch_riscv64
>   __xlated("0: r0 = 1")
>   __xlated("1: exit")
>   __success
> @@ -79,6 +82,7 @@ __description("may_goto batch with offsets 2/0")
>   __arch_x86_64
>   __arch_s390x
>   __arch_arm64
> +__arch_riscv64
>   __xlated("0: *(u64 *)(r10 -16) = 65535")
>   __xlated("1: *(u64 *)(r10 -8) = 0")
>   __xlated("2: r12 = *(u64 *)(r10 -16)")
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
