Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C39C3ABC5
	for <linux-riscv@archiver.kernel.org>; Tue,  6 May 2025 18:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/6xw9PxjGXKky+yDhehGBE4+jp53hR9TpBeaHDnW9OQ=; b=c06+ishx9Xg1Dp
	KE75mOfdywcG5lD98i3TcxEuvtQfubaTeOP7PtcertaZSf+AaOlnT0/HUUT1rSNuebwlmP0/MVOyQ
	8y+aNICBcN4bkMvpc/0v2y1ZDmcSid86/kehrmHPedkgeO8jc+l4mrYt2GchaRklRAswmfzJtEEZZ
	DnDD4olxAvin2OGSRu6VBIVOYPvbZwZzADZLjodzAVG5txpB0LB2ODoAACYf0LBBEiOqqqctom1rU
	80NG8Juv7+ElNVUVwZbUoBTSAX9RIV7BuXi1l9+CLPPYN/sE0f0jhPM7VPtj4Tm6RNrwg1sXjMH/Q
	JyFulPwM7VIi45cVwISw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCMsX-0000000CxUM-0ryf;
	Tue, 06 May 2025 18:18:53 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJCg-0000000CIpn-0ed1
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 14:23:27 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZsL9l39XDzyTwG;
	Tue,  6 May 2025 22:19:07 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 78010140132;
	Tue,  6 May 2025 22:23:22 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 6 May 2025 22:23:21 +0800
Message-ID: <25395de2-6bb7-42b7-bb42-698af2a8d87b@huawei.com>
Date: Tue, 6 May 2025 22:23:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 7/8] selftests/bpf: Verify zero-extension
 behavior in load-acquire tests
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
 <9bab433f2b7e48519b26c1b8f2004635f6c179d2.1745970908.git.yepeilin@google.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <9bab433f2b7e48519b26c1b8f2004635f6c179d2.1745970908.git.yepeilin@google.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_072326_555091_7E9020C5 
X-CRM114-Status: GOOD (  10.49  )
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
> Verify that 8-, 16- and 32-bit load-acquires are zero-extending by using
> immediate values with their highest bit set.  Do the same for the 64-bit
> variant to keep the style consistent.
> 
> Signed-off-by: Peilin Ye <yepeilin@google.com>
> ---
>   tools/testing/selftests/bpf/progs/verifier_load_acquire.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/progs/verifier_load_acquire.c b/tools/testing/selftests/bpf/progs/verifier_load_acquire.c
> index a696ab84bfd6..74f4f19c10b8 100644
> --- a/tools/testing/selftests/bpf/progs/verifier_load_acquire.c
> +++ b/tools/testing/selftests/bpf/progs/verifier_load_acquire.c
> @@ -15,7 +15,7 @@ __naked void load_acquire_8(void)
>   {
>   	asm volatile (
>   	"r0 = 0;"
> -	"w1 = 0x12;"
> +	"w1 = 0xfe;"
>   	"*(u8 *)(r10 - 1) = w1;"
>   	".8byte %[load_acquire_insn];" // w2 = load_acquire((u8 *)(r10 - 1));
>   	"if r2 == r1 goto 1f;"
> @@ -35,7 +35,7 @@ __naked void load_acquire_16(void)
>   {
>   	asm volatile (
>   	"r0 = 0;"
> -	"w1 = 0x1234;"
> +	"w1 = 0xfedc;"
>   	"*(u16 *)(r10 - 2) = w1;"
>   	".8byte %[load_acquire_insn];" // w2 = load_acquire((u16 *)(r10 - 2));
>   	"if r2 == r1 goto 1f;"
> @@ -55,7 +55,7 @@ __naked void load_acquire_32(void)
>   {
>   	asm volatile (
>   	"r0 = 0;"
> -	"w1 = 0x12345678;"
> +	"w1 = 0xfedcba09;"
>   	"*(u32 *)(r10 - 4) = w1;"
>   	".8byte %[load_acquire_insn];" // w2 = load_acquire((u32 *)(r10 - 4));
>   	"if r2 == r1 goto 1f;"
> @@ -75,7 +75,7 @@ __naked void load_acquire_64(void)
>   {
>   	asm volatile (
>   	"r0 = 0;"
> -	"r1 = 0x1234567890abcdef ll;"
> +	"r1 = 0xfedcba0987654321 ll;"
>   	"*(u64 *)(r10 - 8) = r1;"
>   	".8byte %[load_acquire_insn];" // r2 = load_acquire((u64 *)(r10 - 8));
>   	"if r2 == r1 goto 1f;"
Reviewed-by: Pu Lehui <pulehui@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
