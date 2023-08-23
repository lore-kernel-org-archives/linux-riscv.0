Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711AEC3DA66
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 17:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gaf6EOBeHq5/1f30tEBMPkhMrDAbXktaxX7sJkEus5w=; b=A8Yv3IS+QOtVvh
	IC9ofNnfP74fQ4VHywMb/d9thywpd41Ua30anJ4avrsBdVWMEiG6rB1yoC9Yj7rUC8nk1LGZOFD3f
	D7TV2mBJt5tVroucwBWrjlVv6Z26rKIBuvIq1NwiKvj5Ddhgs6gsb2aRpL+FOSiGfZIaTT4Q9rub+
	qzbpBesYgoemfV/wd7wMv6HCvJ6RojE5pZHhEi3MSDA+Ml1E+h6R8i2/HaEolyPMt8wctmU+J+ER+
	Q/K16CNdJUGTPaikNqWUDa3e/cnsHDKMCijJJzY5IG651/cONS6UpOQ8a46o4iHKI7OntSzhTK+XD
	NJ2Gkk+bSvebwJNZiRgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYrkm-001EEn-0n;
	Wed, 23 Aug 2023 17:34:48 +0000
Received: from out-21.mta0.migadu.com ([2001:41d0:1004:224b::15])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYrki-001ECe-2j
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 17:34:47 +0000
Message-ID: <d2687e08-8c67-8eb9-9764-8fcc014d8de4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1692812076; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W6y2PSpf0KklCK/x1vlL2IxP2CNYUVfAedkT44SDp2U=;
	b=OI7gMP12Vgp+jaCERsVFW05Bk8n4xKzIocqn+mVIZV43JGFqZ1uZjEZ6auM1z1sEz8jbgs
	uE08blO7QM4iRX6l9ye2D9APeH0hLjBtqd08DQLabTrBwse8Ory3qgCm+aqDOCue+YjNKn
	POW9OcUCmO+eHOtBNYey9ogRU+R758g=
Date: Wed, 23 Aug 2023 10:34:28 -0700
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next 7/7] selftests/bpf: Enable cpu v4 tests for RV64
Content-Language: en-US
To: Pu Lehui <pulehui@huaweicloud.com>, linux-riscv@lists.infradead.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Yonghong Song <yhs@fb.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Xu Kuohai <xukuohai@huawei.com>, Puranjay Mohan <puranjay12@gmail.com>,
 Pu Lehui <pulehui@huawei.com>
References: <20230823231059.3363698-1-pulehui@huaweicloud.com>
 <20230823231059.3363698-8-pulehui@huaweicloud.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20230823231059.3363698-8-pulehui@huaweicloud.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_103445_038155_8230A75E 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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
Reply-To: yonghong.song@linux.dev
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 8/23/23 4:10 PM, Pu Lehui wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> Enable cpu v4 tests for RV64, and the relevant tests have passed.
> 
> Signed-off-by: Pu Lehui <pulehui@huawei.com>

Thanks for working on this!

Acked-by: Yonghong Song <yonghong.song@linux.dev>

> ---
>   tools/testing/selftests/bpf/progs/test_ldsx_insn.c | 3 ++-
>   tools/testing/selftests/bpf/progs/verifier_bswap.c | 3 ++-
>   tools/testing/selftests/bpf/progs/verifier_gotol.c | 3 ++-
>   tools/testing/selftests/bpf/progs/verifier_ldsx.c  | 3 ++-
>   tools/testing/selftests/bpf/progs/verifier_movsx.c | 3 ++-
>   tools/testing/selftests/bpf/progs/verifier_sdiv.c  | 3 ++-
>   6 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/progs/test_ldsx_insn.c b/tools/testing/selftests/bpf/progs/test_ldsx_insn.c
> index 916d9435f12c..67c14ba1e87b 100644
> --- a/tools/testing/selftests/bpf/progs/test_ldsx_insn.c
> +++ b/tools/testing/selftests/bpf/progs/test_ldsx_insn.c
> @@ -5,7 +5,8 @@
>   #include <bpf/bpf_helpers.h>
>   #include <bpf/bpf_tracing.h>
>   
> -#if (defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86)) && __clang_major__ >= 18
> +#if (defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86) || \
> +     (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64)) && __clang_major__ >= 18
>   const volatile int skip = 0;
>   #else
>   const volatile int skip = 1;
[...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
