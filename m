Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388A9C5DF7D
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 14:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVEK7QhAbyNG7aBrHs43LNJLbINJDuJe8871A8bjtj4=; b=NyFue9QxNDETsT
	E0yUOiIlRY4ITumxrFdhT04sZw/b8xzzlsi3R+i+ZZk1vj36lx2paXl6qIC8luISkxZvbKJbzBDZf
	VpBCtr8nxOFhgZvu5iU+r9MJNhGeFazQFpeQV6alrERVOrx+1+jw6iK3bNX+NiTycRkQBNB1RDcCw
	iUBIwrdJ5P9k6zVwOdVdHDmQ9fBxUfgP4ojQvRwh7oOV9tNK838FiHsgSlaW84bbxqI9b1vAONn/5
	mNpuzdCOztpIvT0tCcqDiFJDIYdOs52UQp5Sz9aO6kdruf9FAe2SE4OmEU3YpA1Is2kXNnwzml/8E
	sZEpLcQHOtHmvuhyXzfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKnR-00000008AQt-03eu;
	Tue, 18 Aug 2026 14:28:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKnP-00000008AQg-44dJ
	for linux-riscv@bombadil.infradead.org;
	Tue, 18 Aug 2026 14:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Tdxqggf1hro1Pv7ntd9QLCSlna75ZP2bccaIl3m9ALk=; b=arxvgfNJNhzTPBz1ikkkL7qZ6w
	S/G+/qepbZ5pR9kZWvQHDnj5Mwq8pOc1ydVreNNmgxaiubXq9lSyyQmIJX82heml40Z16TmyLLKWg
	irUe6hLM5oYpuqWoKq+szksPBgaedi92iGSoqYqO1oZ+BxkzOMpNOpGvQ8E7MUxh7m3DftxFdKUAS
	s0LUW+44NGa9Q7AHw0odPNahSHVI8KauFKNNplgkGJSaBDF5vd2mYT15XCbL8Xl+c/A6mTRra3Rhe
	wBJekuFaTkcjS93sWWd9OXseGlEzi15SdeD63Ub35rqA+kqoU9HKsAT8OWyPVG1hp7akZFK3Vz0kk
	BMvKrcMw==;
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wwKnL-00000001jrP-3svg
	for linux-riscv@lists.infradead.org;
	Tue, 18 Aug 2026 14:28:06 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Tdxqggf1hro1Pv7ntd9QLCSlna75ZP2bccaIl3m9ALk=;
	b=DleWKuskomEAg/rJgUuXJABJahz5xAmoScEUly4LU5VKXjZHfR2B3eXAEflW5KL67wN/SbAbd
	17LtmbexV61USAeqsLSJG/U8wezST5rPoxuWtuso/EY33cVKjXsoSUAM23NwQ6/acsC4VE6VKac
	KSxO6Y/WmPx/bK4NCoJLBZc=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hPWxN3crKz1T4MG;
	Tue, 18 Aug 2026 22:17:28 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id B0F284058C;
	Tue, 18 Aug 2026 22:27:27 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 18 Aug
 2026 22:27:26 +0800
Message-ID: <e6d593d6-ef57-440e-b624-a6ff4ad79744@huawei.com>
Date: Tue, 18 Aug 2026 22:27:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 2/2] selftests/bpf: Enable arena LDSX tests for
 riscv64
Content-Language: en-US
To: Chen Pei <cp0613@linux.alibaba.com>, <ast@kernel.org>,
	<daniel@iogearbox.net>, <andrii@kernel.org>, <memxor@gmail.com>,
	<bjorn@kernel.org>, <puranjay@kernel.org>
CC: <eddyz87@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
	<yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <shuah@kernel.org>,
	<guoren@kernel.org>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <cover.1786708960.git.cp0613@linux.alibaba.com>
 <913f4fd8b3d0b7470428d9e6f0ed64f3a89e8a98.1786708960.git.cp0613@linux.alibaba.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <913f4fd8b3d0b7470428d9e6f0ed64f3a89e8a98.1786708960.git.cp0613@linux.alibaba.com>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_152805_200332_BB61F2EC 
X-CRM114-Status: UNSURE (   9.10  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2026/8/17 15:24, Chen Pei wrote:
> Now that the riscv64 JIT supports signed arena loads
> (BPF_PROBE_MEM32SX), enable the arena LDSX tests on riscv64:
> add JIT disassembly assertions for arena_ldsx_disasm (arena base in
> s7, add into t2, sign-extending lw/lh/lb loads) and run
> arena_ldsx_exception and arena_ldsx_s8/s16/s32 on riscv64.
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
>   .../testing/selftests/bpf/progs/verifier_ldsx.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/tools/testing/selftests/bpf/progs/verifier_ldsx.c b/tools/testing/selftests/bpf/progs/verifier_ldsx.c
> index 41340877dc9d..ed0a0f159bc1 100644
> --- a/tools/testing/selftests/bpf/progs/verifier_ldsx.c
> +++ b/tools/testing/selftests/bpf/progs/verifier_ldsx.c
> @@ -286,6 +286,19 @@ __jited("add	x11, x0, x28")
>   __jited("ldrsh	x22, [x11, #0x18]")
>   __jited("add	x11, x0, x28")
>   __jited("ldrsb	x22, [x11, #0x20]")
> +__arch_riscv64
> +__jited("add	t2, a5, s7")
> +__jited("lw	s3, 0x10(t2)")
> +__jited("add	t2, a5, s7")
> +__jited("lh	s3, 0x18(t2)")
> +__jited("add	t2, a5, s7")
> +__jited("lb	s3, 0x20(t2)")
> +__jited("add	t2, a0, s7")
> +__jited("lw	s4, 0x10(t2)")
> +__jited("add	t2, a0, s7")
> +__jited("lh	s4, 0x18(t2)")
> +__jited("add	t2, a0, s7")
> +__jited("lb	s4, 0x20(t2)")
>   __naked void arena_ldsx_disasm(void *ctx)
>   {
>   	asm volatile (
> @@ -317,6 +330,7 @@ __description("Arena LDSX Exception")
>   __success __retval(0)
>   __arch_x86_64
>   __arch_arm64
> +__arch_riscv64
>   __naked void arena_ldsx_exception(void *ctx)
>   {
>   	asm volatile (
> @@ -338,6 +352,7 @@ __description("Arena LDSX, S8")
>   __success __retval(-1)
>   __arch_x86_64
>   __arch_arm64
> +__arch_riscv64
>   __naked void arena_ldsx_s8(void *ctx)
>   {
>   	asm volatile (
> @@ -369,6 +384,7 @@ __description("Arena LDSX, S16")
>   __success __retval(-1)
>   __arch_x86_64
>   __arch_arm64
> +__arch_riscv64
>   __naked void arena_ldsx_s16(void *ctx)
>   {
>   	asm volatile (
> @@ -400,6 +416,7 @@ __description("Arena LDSX, S32")
>   __success __retval(-1)
>   __arch_x86_64
>   __arch_arm64
> +__arch_riscv64
>   __naked void arena_ldsx_s32(void *ctx)
>   {
>   	asm volatile (

Reviewed-by: Pu Lehui <pulehui@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
