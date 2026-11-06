Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB32C606A332
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 03:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YX+vR0ot;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=jv8ea/1t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vBfaAhnBC8DLX3RMJMw3hPZuud94Zlg0JY2GwM+Owdk=; b=YX+vR0otslzAy4YjitWRMVZLNt
	YNopWyXB45AAZHUrkpmEtvzG4sSWUXmqv63WGA5ad6HVa14TmtbgMqwKupBJgLSrqDy4gjZPKIyGZ
	wgmqlpWVGOd88NSsIxGock2hqfSvpqD4oc6Amet55mWqf9s//ge9DV9N5my5BC6f12SqopwUAE+vc
	DPV1H6Z4OsiKhEcvZzBGamKYKp8F7gfF4FXJYfh141fXfVGyiLZx/01Q7XUTW9yyWupDGnCS2niww
	ChfI61fTwDUJs5W5zspdmbImwVHcs5OFKZEOGZRuLYNKi3x0/wItG+dT/psC8hR8mIt1Nw41O+zlZ
	UiVn3P9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPAd8-0000000BA4R-2e5A;
	Fri, 06 Nov 2026 03:28:42 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPAd4-0000000BA3q-21nx
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 03:28:41 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yRj7ZrhzBHolO44PFJNnKugjKH5+LOHE1/UFniKyUQY=;
	b=jv8ea/1t+7GDxMkO/TG3/UWTtGPBNQ6ibf/JeZCMazQPymy7zcQ+TFP0KsiIdGIbY+tl/V9fQ
	8VKOrujrg2wjxM6/rmLzLaSK+nRRyaurlFFfBcE0vQwc524SBcqZ/B0LPMKdmC8HXyfJvsCDKfr
	iTrSpowedX9GssJxSSasRT0=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jLPlG0QVdz1T4gG;
	Fri,  6 Nov 2026 11:28:10 +0800 (CST)
Received: from dggpemr100013.china.huawei.com (unknown [7.185.36.198])
	by mail.maildlp.com (Postfix) with ESMTPS id 4532C4056E;
	Fri,  6 Nov 2026 11:28:32 +0800 (CST)
Received: from whupemq100006.china.huawei.com (7.152.184.206) by
 dggpemr100013.china.huawei.com (7.185.36.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 6 Nov 2026 11:28:32 +0800
Received: from [10.67.110.154] (10.67.110.154) by
 whupemq100006.china.huawei.com (7.152.184.206) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 6 Nov 2026 11:28:29 +0800
Message-ID: <ffc28af6-ab99-4006-a827-c3006dba096e@huawei.com>
Date: Fri, 6 Nov 2026 11:28:28 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 bpf-next 2/3] selftests/bpf: Enable private stack tests
 for riscv64
Content-Language: en-US
To: Chen Pei <cp0613@linux.alibaba.com>, <ast@kernel.org>,
	<daniel@iogearbox.net>, <andrii@kernel.org>, <memxor@gmail.com>,
	<bjorn@kernel.org>, <puranjay@kernel.org>
CC: <eddyz87@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
	<yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
	<ihor.solodrai@linux.dev>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <luke.r.nels@gmail.com>,
	<xi.wang@gmail.com>, <shuah@kernel.org>, <rgbi3307@gmail.com>,
	<guoren@kernel.org>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261104100411.997-1-cp0613@linux.alibaba.com>
 <20261104100411.997-3-cp0613@linux.alibaba.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20261104100411.997-3-cp0613@linux.alibaba.com>
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 whupemq100006.china.huawei.com (7.152.184.206)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_192839_133736_EDCB3C92 
X-CRM114-Status: GOOD (  10.41  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 2026/11/4 18:04, Chen Pei wrote:
> The RV64 JIT now supports the private stack. Allow the existing
> verifier and struct_ops private-stack tests to run on riscv64 and add
> the expected RV64 JITed instruction patterns.
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
>   .../bpf/prog_tests/struct_ops_private_stack.c |  3 +-
>   .../bpf/progs/verifier_private_stack.c        | 41 ++++++++++++++++++-
>   2 files changed, 42 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/prog_tests/struct_ops_private_stack.c b/tools/testing/selftests/bpf/prog_tests/struct_ops_private_stack.c
> index 2b3ec2b79091..103179ff8733 100644
> --- a/tools/testing/selftests/bpf/prog_tests/struct_ops_private_stack.c
> +++ b/tools/testing/selftests/bpf/prog_tests/struct_ops_private_stack.c
> @@ -6,7 +6,8 @@
>   #include "struct_ops_private_stack_recur.skel.h"
>   #include "struct_ops_private_stack_large.skel.h"
>   
> -#if defined(__x86_64__) || defined(__aarch64__) || defined(__powerpc64__)
> +#if defined(__x86_64__) || defined(__aarch64__) || defined(__powerpc64__) || \
> +	(defined(__riscv) && __riscv_xlen == 64)
>   static void test_private_stack(void)
>   {
>   	struct struct_ops_private_stack *skel;
> diff --git a/tools/testing/selftests/bpf/progs/verifier_private_stack.c b/tools/testing/selftests/bpf/progs/verifier_private_stack.c
> index bbc09f516d92..4df06a82dd04 100644
> --- a/tools/testing/selftests/bpf/progs/verifier_private_stack.c
> +++ b/tools/testing/selftests/bpf/progs/verifier_private_stack.c
> @@ -8,7 +8,8 @@
>   /* From include/linux/filter.h */
>   #define MAX_BPF_STACK    512
>   
> -#if defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)
> +#if defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64) || \
> +	(defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64)
>   
>   struct elem {
>   	struct bpf_timer t;
> @@ -42,6 +43,14 @@ __jited("	mov	x0, #0x2a")
>   __jited("	str	x0, [x27]")
>   __jited("...")
>   __jited("	ldp	x25, x27, [sp], {{.*}}")
> +__arch_riscv64
> +__jited("	addi	sp, sp, -0x20")
> +__jited("...")
> +__jited("	sd	s5, 0x10(sp)")
> +__jited("...")
> +__jited("	sd	a0, -0x100(s5)")
> +__jited("...")
> +__jited("	ld	s5, 0x10(sp)")
>   __naked void private_stack_single_prog(void)
>   {
>   	asm volatile ("			\
> @@ -60,6 +69,10 @@ __jited("	subq	$0x8, %rsp")
>   __arch_arm64
>   __jited("	mov	x25, sp")
>   __jited("	sub	sp, sp, #0x10")
> +__arch_riscv64
> +__jited("	addi	sp, sp, -0x30")
> +__jited("...")
> +__jited("	addi	s5, sp, 0x10")
>   __naked void no_private_stack_nested(void)
>   {
>   	asm volatile ("			\
> @@ -113,6 +126,14 @@ __jited("	str	x0, [x27]")
>   __jited("	bl	{{.*}}")
>   __jited("...")
>   __jited("	ldp	x25, x27, [sp], {{.*}}")
> +__arch_riscv64
> +__jited("	addi	sp, sp, -0x20")
> +__jited("...")
> +__jited("	sd	s5, 0x8(sp)")
> +__jited("...")
> +__jited("	sd	a0, -0x200(s5)")
> +__jited("...")
> +__jited("	ld	s5, 0x8(sp)")
>   __naked void private_stack_nested_1(void)
>   {
>   	asm volatile ("				\
> @@ -183,6 +204,16 @@ __jited("	bl	0x{{.*}}")
>   __jited("	mov	x8, x0")
>   __jited("	mov	x8, #0x0")
>   __jited("	ldp	x25, x27, [sp], {{.*}}")
> +__arch_riscv64
> +__jited("func #1")
> +__jited("...")
> +__jited("	addi	sp, sp, -0x20")
> +__jited("...")
> +__jited("	sd	s5, 0x8(sp)")
> +__jited("...")
> +__jited("	sd	a0, -0x200(s5)")
> +__jited("...")
> +__jited("	ld	s5, 0x8(sp)")
>   __naked void private_stack_callback(void)
>   {
>   	asm volatile ("			\
> @@ -412,6 +443,10 @@ __arch_arm64
>   __jited("	mrs	x10, TPIDR_EL{{[0-1]}}")
>   __jited("	add	x27, x27, x10")
>   __jited("	add	x25, x27, {{.*}}")
> +__arch_riscv64
> +__jited("	addi	sp, sp, -0x20")
> +__jited("...")
> +__jited("	sd	s5, 0x8(sp)")
>   int private_stack_async_callback_1(void)
>   {
>   	struct bpf_timer *arr_timer;
> @@ -441,6 +476,10 @@ __arch_x86_64
>   __jited("	subq	$0x100, %rsp")
>   __arch_arm64
>   __jited("	sub	sp, sp, #0x100")
> +__arch_riscv64
> +__jited("	addi	sp, sp, -0x120")
> +__jited("...")
> +__jited("	addi	s5, sp, 0x100")
>   int private_stack_async_callback_2(void)
>   {
>   	struct bpf_timer *arr_timer;

Apart from not yet supporting exception handling, everything else is fine.

Reviewed-by: Pu Lehui <pulehui@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
