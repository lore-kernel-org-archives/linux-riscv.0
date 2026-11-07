Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE3C606A32C
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 01:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z9nUhlNf;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=J2F7P3Q8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pHzA7UF/20+RsQ38E9LWdb+PtANWixTHYCFo2gF67Ag=; b=Z9nUhlNfhEYnvb30jrv4tbx+3V
	cI+xdBDU9HG81F36tYQ3nzs/prX914Jj5IfeDU8j9CQKwTE7dQRaXLBmSAxSEutn5fdz65/XaT2vo
	18ZZQx8aaRfjAD71opC0fEwvu5QDxM+1qJovlWaSpU6+E7XnQvOHo6voMrCfB+t9906UV96pzoYqh
	2uLzznPnPeBm5aB/LLhIjQ9YosNCgGDA4Vr9lBdxnsXC1npBMQN8WnOGTDQOBlAZoVrvNL2AFypNG
	v8/7drzUHXqucoZZ6qiyzqXEHru1S2FjQ3nfHy5247eyhGvm06qNkrMDg7xdf0G/XOZABMgGzffkh
	zKSA6D0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPV4a-0000000Dzoy-2OPt;
	Sat, 07 Nov 2026 01:18:28 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPV2s-0000000Dzh3-3x61
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 01:18:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=09pdPTC0H3pX4QDaAkEJkvwP2Z2O6sdNBhQWaHjJtTk=;
	b=J2F7P3Q89MQRdCeGRgcWFeHu+EDvE216q7TDqn+24l8ihjJSIV1ZXv3ES9EjfdJ7DBiWLz0Cl
	WeLT/X3NubEtOCu9XYMZoNKS5G4EdgtFI229U9/NxApTWoJWaSEpgRy3N5sks5sJNWPN+dDJiUk
	Am0epWmj1C2LFbnx3HtxzZU=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jLylv6xSCzcZxr;
	Sat,  7 Nov 2026 09:15:39 +0800 (CST)
Received: from dggpemr500002.china.huawei.com (unknown [7.185.36.170])
	by mail.maildlp.com (Postfix) with ESMTPS id 9A5ED40561;
	Sat,  7 Nov 2026 09:16:11 +0800 (CST)
Received: from whupemq100006.china.huawei.com (7.152.184.206) by
 dggpemr500002.china.huawei.com (7.185.36.170) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sat, 7 Nov 2026 09:16:11 +0800
Received: from [10.67.110.154] (10.67.110.154) by
 whupemq100006.china.huawei.com (7.152.184.206) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sat, 7 Nov 2026 09:16:09 +0800
Message-ID: <d0647583-f51c-4a74-b71c-6088abffe502@huawei.com>
Date: Sat, 7 Nov 2026 09:16:08 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 bpf-next 3/3] selftests/bpf: Test a private stack
 together with stack arguments
Content-Language: en-US
To: Chen Pei <cp0613@linux.alibaba.com>, <ast@kernel.org>,
	<daniel@iogearbox.net>, <andrii@kernel.org>, <memxor@gmail.com>,
	<bjorn@kernel.org>, <puranjay@kernel.org>, <alexei.starovoitov@gmail.com>
CC: <eddyz87@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
	<yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
	<ihor.solodrai@linux.dev>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <luke.r.nels@gmail.com>,
	<xi.wang@gmail.com>, <shuah@kernel.org>, <rgbi3307@gmail.com>,
	<guoren@kernel.org>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261106181558.1564-1-cp0613@linux.alibaba.com>
 <20261106181558.1564-4-cp0613@linux.alibaba.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20261106181558.1564-4-cp0613@linux.alibaba.com>
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 whupemq100006.china.huawei.com (7.152.184.206)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_171641_337058_5E3AA855 
X-CRM114-Status: GOOD (  14.32  )
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



On 2026/11/7 2:15, Chen Pei wrote:
> Add two asm programs to verifier_stack_arg.c, inside the block that is
> already gated on x86, arm64 and riscv64. A raw_tp program with a 64 byte
> frame calls a ten-argument subprog with a 64 byte frame of its own, and
> BPF_PROG_TEST_RUN runs the pair without attaching it. Args 9 and 10 stay
> in the kernel frame and arg 10 points into the caller's frame, so the two
> have to agree on where the outgoing area is. The callee returns what the
> caller stored plus arg 9, so a wrong area shows up as a wrong retval
> rather than as a crash.
> 
> Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
>   .../selftests/bpf/progs/verifier_stack_arg.c  | 49 +++++++++++++++++++
>   1 file changed, 49 insertions(+)
> 
> diff --git a/tools/testing/selftests/bpf/progs/verifier_stack_arg.c b/tools/testing/selftests/bpf/progs/verifier_stack_arg.c
> index 146cdf81bbc4..e8108e768b89 100644
> --- a/tools/testing/selftests/bpf/progs/verifier_stack_arg.c
> +++ b/tools/testing/selftests/bpf/progs/verifier_stack_arg.c
> @@ -975,6 +975,55 @@ __naked void stack_arg_precision_fallback(void)
>   	);
>   }
>   
> +/* Writes both ends of its frame, then reads args 9, 10 and the frame of the caller. */
> +static __naked __noinline __used
> +long priv_stack_10args(long a, long b, long c, long d, long e, long f, long g, long h,
> +		       long i, long *j)
> +{
> +	asm volatile (
> +		"r1 = 0;"
> +		"*(u64 *)(r10 - 8) = r1;"
> +		"*(u64 *)(r10 - 64) = r1;"
> +		"r0 = *(u64 *)(r11 + 32);"
> +		"r1 = *(u64 *)(r11 + 40);"
> +		"r1 = *(u64 *)(r1 + 0);"
> +		"r0 += r1;"
> +		"exit;"
> +		::: __clobber_all
> +	);
> +}
> +
> +/*
> + * A frame of 64 bytes in a raw_tp prog goes to the private stack.
> + * arm64 and riscv64 pass args 9 and 10 on the kernel stack. On x86-64
> + * both frames stay there as well.
> + */
> +SEC("raw_tp")
> +__description("stack_arg: private stack in the caller and in the callee")
> +__success __retval(890)
> +__naked void stack_arg_priv_stack(void)
> +{
> +	asm volatile (
> +		"r1 = 800;"
> +		"*(u64 *)(r10 - 64) = r1;"
> +		"r1 = r10;"
> +		"r1 += -64;"
> +		"*(u64 *)(r11 - 40) = r1;"
> +		"*(u64 *)(r11 - 32) = 90;"
> +		"*(u64 *)(r11 - 24) = 8;"
> +		"*(u64 *)(r11 - 16) = 7;"
> +		"*(u64 *)(r11 - 8) = 6;"
> +		"r1 = 1;"
> +		"r2 = 2;"
> +		"r3 = 3;"
> +		"r4 = 4;"
> +		"r5 = 5;"
> +		"call priv_stack_10args;"
> +		"exit;"
> +		::: __clobber_all
> +	);
> +}
> +
>   #else
>   
>   /* No BTF tells about this store. The insn is what JIT has to deal with. */


Reviewed-by: Pu Lehui <pulehui@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
