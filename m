Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDF2C44539
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 10:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c9U8KJWUzQx1hQdDRebnxbq2b5B3asynlCl/bRNjyd4=; b=gZLNq1C4FKLyUD
	aUtXdZKUiTQO/FFcYZgM9oGhs7/W4KBzO9hB2ken/Byz+kTJztNfVOq/hG5B4/+Tla5jHyoyAaPFz
	YULUSY0F8uWszJFHG5XcOVMCwcIFBOvkWysVrtolNeaFthUrmysjSzA1KPU5vysO+AhwBvWSZWz2t
	bCMxYDCXmbj2XhAJzbkdiDcGaXwShD37E1bVmVj9nZ0pzv618Eq+MYMCkXThDoM9PajwaXzMrCT22
	+ayLmuikeS+jTJow5y8cHk/XZ+KpVbgUQrLT24awmELQNAkiOMYaXUg10zQT6RrnNMZe8lpgVtktw
	h/o4cHAGXcLzjpcgxTgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUSU-0000000BaRG-3d78;
	Wed, 22 Jul 2026 10:45:50 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUSQ-0000000BaQS-37Vj
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 10:45:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7iEM1QaTzTnbo3gTMTPGpaYWVSySK6v4A6wXMiyoB/g=;
	b=5CZNXYyJWUSjc6cU1B9j8bq02Tr4midanFhF5EpKHmwGCeW0LQIUAUYAD1nZv6CtdeChNzjvF
	RwjkIDzwFFJrJySzU1zuJI+CIWfuqsReYKNhMaTKxLCTlKbcYzSS/vwTMJBOzVpPhy18U3t7wcF
	siA9L+kihJaiPv6pGRYf5X8=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4h4rJK73TtzcZyH;
	Wed, 22 Jul 2026 18:36:01 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id D542A40579;
	Wed, 22 Jul 2026 18:45:30 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 22 Jul
 2026 18:45:29 +0800
Message-ID: <21722add-9368-412d-9f93-897ff82f1542@huawei.com>
Date: Wed, 22 Jul 2026 18:45:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v4 3/3] selftests/bpf: enable timed may_goto
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
References: <20260722-riscv-bpf-timed-may-goto-v4-0-e117e6337bc7@kylinos.cn>
 <20260722-riscv-bpf-timed-may-goto-v4-3-e117e6337bc7@kylinos.cn>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260722-riscv-bpf-timed-may-goto-v4-3-e117e6337bc7@kylinos.cn>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_034547_420416_F8A1D07E 
X-CRM114-Status: GOOD (  11.66  )
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


On 2026/7/22 12:21, Feng Jiang wrote:
> Enable verifier_may_goto_1 (raw instruction tests), stream_cond_break
> (250ms timeout path), and the may_goto_interaction fastcall test on
> riscv64 now that the JIT supports timed may_goto.
> 
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
> index 98d59108d097..97129d2730a0 100644
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

Reviewed-by: Pu Lehui <pulehui@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
