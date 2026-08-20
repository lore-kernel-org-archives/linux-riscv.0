Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999A3C5DF87
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 04:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SWtgE14bWea0iKB/oCN7JglDP4ry5uFwuU6FFBKfBy4=; b=kVcBl7zY16vQx9
	oEmNsLTfiLoXpWXqlEetWbr0LRi55nVzaP5gFNsiEvesGD3lTC06x4foXQzSFF2tN/92KUmuU34dg
	L0ols6nGG20Zc3wBDH+vhYkHtHait03IHZsWR+l/I2K0/OOAlbllaIP8n7e1UHeABexOfxEXmdpbE
	MExxh8s1KUJUFyxGqijwtaR6NV4GT7BcqnNdkRiuLarGbbtgEwcVLz8XmfaDViYqfHCDkacBw6vkJ
	YAgQ1qxSfpE3O3ysEw9dOIumJRrV0jXqLdqXsz6HyE10CtyViaKTvxfgsql808phnog42+OL+kraj
	ezQ4Zu2irmlMjt3Cb4hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwu8k-0000000Anpf-3nbL;
	Thu, 20 Aug 2026 04:12:30 +0000
Received: from [113.46.200.220] (helo=canpmsgout05.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwu8h-0000000AnnK-3lP6
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 04:12:29 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=C2UVYU8EnWG2+bWacBuEvh5oiuNPv4fmf2gWJFql9MI=;
	b=XEBX6BNp6GkzfJ3nnaNPsv+uYf2n1fWJrMOsWXw+gnlzaDzZlGwAkYAQp0dJ9nko5djwQto/C
	gaFzgPTKY3fwJaSjAD/1tD2LTGQgE7DuansFdTanUcq3MOFyK2VKKXfH48yjByVw4qWpdayOomb
	8BZQuBfX1+bLOQCJ0XsTonQ=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4hQVBD60Xrz12LDV;
	Thu, 20 Aug 2026 12:01:56 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 7D46140561;
	Thu, 20 Aug 2026 12:12:17 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 20 Aug
 2026 12:12:16 +0800
Message-ID: <0f57cace-5588-4f34-bd3e-1e737b8d0d7f@huawei.com>
Date: Thu, 20 Aug 2026 12:12:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 2/2] selftests/bpf: Enable arena LDSX tests
 for riscv64
Content-Language: en-US
To: Chen Pei <cp0613@linux.alibaba.com>, <ast@kernel.org>,
	<daniel@iogearbox.net>, <andrii@kernel.org>, <memxor@gmail.com>,
	<bjorn@kernel.org>, <puranjay@kernel.org>
CC: <ihor.solodrai@linux.dev>, <eddyz87@gmail.com>, <martin.lau@linux.dev>,
	<song@kernel.org>, <yonghong.song@linux.dev>, <jolsa@kernel.org>,
	<emil@etsalapatis.com>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<shuah@kernel.org>, <guoren@kernel.org>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <cover.1787140923.git.cp0613@linux.alibaba.com>
 <1bab696ec36f196fa6ec74a0f056030b39730da7.1787140923.git.cp0613@linux.alibaba.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <1bab696ec36f196fa6ec74a0f056030b39730da7.1787140923.git.cp0613@linux.alibaba.com>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_211228_276318_0699C572 
X-CRM114-Status: UNSURE (   9.38  )
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



On 2026/8/19 20:09, Chen Pei wrote:
> Now that the riscv64 JIT supports signed arena loads
> (BPF_PROBE_MEM32SX), enable the arena LDSX tests on riscv64:
> add JIT disassembly assertions for arena_ldsx_disasm (arena base in
> s7, add into t2, sign-extending lw/lh/lb loads) and run
> arena_ldsx_exception and arena_ldsx_s8/s16/s32 on riscv64.
> 
> Reviewed-by: Pu Lehui <pulehui@huawei.com>
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

Tested-by: Pu Lehui <pulehui@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
