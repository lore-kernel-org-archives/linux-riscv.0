Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C61C3ABBE
	for <linux-riscv@archiver.kernel.org>; Tue,  6 May 2025 18:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6qXWSyUttp7RxLcwbBeGn8L4zhlUIgqGprxTwus5IU0=; b=Ga4wpODSCST8B4
	31y8m3RF6NVxcF0MC9d+skpBdibhoWt/JAltR0vq+FAqf7sLz5RpGvFZ48WoaoNL6EH/rUfWldK//
	RMMS5atAVk9evPzg0QT4E71uglHgDK11eAZ60VufDqYk9+WldXRu++mXAxt3pVo8cqFxYtoC4QuH1
	my1cVavel/lQ1rM7QBGyR1u3le+u6DNneGZ1fzpGfJZ+9dyLQTpG0wa/Wj/NrFsSI7jl1FH7/QP2p
	ev0XC4pto4mFtEiVlVQuou2VFQc8DYOta+MTwXMNJc2I4E/7Q7tLhKEDIP/HbJstf0SO0jeJZVmSI
	zPHf4PQN1ddN4hM+bmKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCMsV-0000000CxTn-44qA;
	Tue, 06 May 2025 18:18:51 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJCI-0000000CIkV-2Ks0
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 14:23:04 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ZsLDY29N5znfZy;
	Tue,  6 May 2025 22:21:33 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id BFBD11800B1;
	Tue,  6 May 2025 22:22:51 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 6 May 2025 22:22:50 +0800
Message-ID: <6d9f8333-a14a-468a-83ef-4562e54eb60e@huawei.com>
Date: Tue, 6 May 2025 22:22:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 5/8] selftests/bpf: Use
 CAN_USE_LOAD_ACQ_STORE_REL when appropriate
Content-Language: en-US
To: Peilin Ye <yepeilin@google.com>, <bpf@vger.kernel.org>
CC: <linux-riscv@lists.infradead.org>, Andrea Parri <parri.andrea@gmail.com>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Puranjay Mohan
	<puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
	<martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Song Liu <song@kernel.org>, Yonghong Song
	<yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Luke Nelson
	<luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Mykola Lysenko
	<mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, Josh Don
	<joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu
	<neelnatu@google.com>, Benjamin Segall <bsegall@google.com>
References: <cover.1745970908.git.yepeilin@google.com>
 <ca441a13f5ad4a34ddb622cb5b2616b309d59694.1745970908.git.yepeilin@google.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <ca441a13f5ad4a34ddb622cb5b2616b309d59694.1745970908.git.yepeilin@google.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_072302_915381_3AB79C0C 
X-CRM114-Status: GOOD (  11.67  )
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



On 2025/4/30 8:51, Peilin Ye wrote:
> Instead of open-coding the conditions, use
> '#ifdef CAN_USE_LOAD_ACQ_STORE_REL' to guard the following tests:
> 
>    verifier_precision/bpf_load_acquire
>    verifier_precision/bpf_store_release
>    verifier_store_release/*
> 
> Note that, for the first two tests in verifier_precision.c, switching to
> '#ifdef CAN_USE_LOAD_ACQ_STORE_REL' means also checking if
> '__clang_major__ >= 18', which has already been guaranteed by the outer
> '#if' check.
> 
> Signed-off-by: Peilin Ye <yepeilin@google.com>
> ---
>   tools/testing/selftests/bpf/progs/verifier_precision.c     | 5 ++---
>   tools/testing/selftests/bpf/progs/verifier_store_release.c | 7 +++----
>   2 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/progs/verifier_precision.c b/tools/testing/selftests/bpf/progs/verifier_precision.c
> index 6662d4b39969..2dd0d15c2678 100644
> --- a/tools/testing/selftests/bpf/progs/verifier_precision.c
> +++ b/tools/testing/selftests/bpf/progs/verifier_precision.c
> @@ -91,8 +91,7 @@ __naked int bpf_end_bswap(void)
>   		::: __clobber_all);
>   }
>   
> -#if defined(ENABLE_ATOMICS_TESTS) && \
> -	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86))
> +#ifdef CAN_USE_LOAD_ACQ_STORE_REL
>   
>   SEC("?raw_tp")
>   __success __log_level(2)
> @@ -138,7 +137,7 @@ __naked int bpf_store_release(void)
>   	: __clobber_all);
>   }
>   
> -#endif /* load-acquire, store-release */
> +#endif /* CAN_USE_LOAD_ACQ_STORE_REL */
>   #endif /* v4 instruction */
>   
>   SEC("?raw_tp")
> diff --git a/tools/testing/selftests/bpf/progs/verifier_store_release.c b/tools/testing/selftests/bpf/progs/verifier_store_release.c
> index c0442d5bb049..7e456e2861b4 100644
> --- a/tools/testing/selftests/bpf/progs/verifier_store_release.c
> +++ b/tools/testing/selftests/bpf/progs/verifier_store_release.c
> @@ -6,8 +6,7 @@
>   #include "../../../include/linux/filter.h"
>   #include "bpf_misc.h"
>   
> -#if __clang_major__ >= 18 && defined(ENABLE_ATOMICS_TESTS) && \
> -	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86))
> +#ifdef CAN_USE_LOAD_ACQ_STORE_REL
>   
>   SEC("socket")
>   __description("store-release, 8-bit")
> @@ -271,7 +270,7 @@ __naked void store_release_with_invalid_reg(void)
>   	: __clobber_all);
>   }
>   
> -#else
> +#else /* CAN_USE_LOAD_ACQ_STORE_REL */
>   
>   SEC("socket")
>   __description("Clang version < 18, ENABLE_ATOMICS_TESTS not defined, and/or JIT doesn't support store-release, use a dummy test")
> @@ -281,6 +280,6 @@ int dummy_test(void)
>   	return 0;
>   }
>   
> -#endif
> +#endif /* CAN_USE_LOAD_ACQ_STORE_REL */
>   
>   char _license[] SEC("license") = "GPL";
Reviewed-by: Pu Lehui <pulehui@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
