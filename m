Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E54C5DF81
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 04:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vYfZhGTi4toKzznGVh1ThdD2Zws9IUPNAnHXug1PdKY=; b=WsBBRa5RPAk11+
	ZGkCDN/FXNQQC63IAg1XhgNP0EFXxbQxu+BH+LFkxEyqgVIPD3flAYkrVapvtc4MTrnu6UV/UH+Sg
	xBl7GUtIXxsNQGru5VS7oeznWcIoRafezgj2FP2n8a2KXdoPOBU8e3tIx7ZUYgSOws9sIH8bvuIHj
	2xZQiEJUjMQjjHRGDtqbd4FWGAZ2koa12gWireqPRsQfKl/e0HBqrnWHuoz4can20uEkBkwJVlxGQ
	gsIis9NMMQ5BbIw7Z4jDz2EQzDujlGnnPSkXlKqtpiZaqYdGEZIvm9fnmKi/4fBrMnHm46mQnampj
	lUkMisGg61egzNHjGnhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwu8l-0000000Anpj-06aE;
	Thu, 20 Aug 2026 04:12:31 +0000
Received: from [113.46.200.227] (helo=canpmsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwu8h-0000000Ann1-3pvI
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 04:12:29 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Wj6aI8sCMr/ayoDuGnce4gweZGzZgQpUacHTKZeft6I=;
	b=GLeMssTF0KR+dj5hVHlK7JyNVD0lCo9uLLklNHiWrjzEHdA8DFPfHATa3XC/O+JQt5XYH0LMc
	eAPBtzBq2N0RpO5IONVCy69Qq1dEJD96inAMFaWuwLW0z33aMg/FMassW8EKNGZaNAsvi5MDgin
	0vOMid57voUOhpqNYejdYx8=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hQV9z5k9jznTVd;
	Thu, 20 Aug 2026 12:01:43 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id CAE7A40565;
	Thu, 20 Aug 2026 12:12:01 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 20 Aug
 2026 12:12:00 +0800
Message-ID: <f8721d92-c07a-46ca-a1f3-6720aec01628@huawei.com>
Date: Thu, 20 Aug 2026 12:12:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 1/2] bpf, riscv: Add support for signed arena
 loads
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
 <67422a421852c3eed2269c6def7b5569e727617f.1787140923.git.cp0613@linux.alibaba.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <67422a421852c3eed2269c6def7b5569e727617f.1787140923.git.cp0613@linux.alibaba.com>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_211228_267016_F89BB51F 
X-CRM114-Status: GOOD (  19.42  )
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
> Signed loads from arena memory are currently rejected on riscv64, as
> bpf_jit_supports_insn() refuses BPF_MEMSX loads when in_arena is set,
> while x86 and arm64 gained support for them in v6.18. Compilers such
> as GCC-14 are free to generate signed loads into arena memory, which
> breaks loading of otherwise valid BPF programs on riscv64.
> 
> Implement BPF_PROBE_MEM32SX support in the RV64 JIT by reusing the
> existing arena handling: the arena base (RV_REG_ARENA) is added to
> the source register and the load is emitted with sign extension
> (lb/lh/lw). Add BPF_PROBE_MEM32SX to the add_exception_handler()
> mode gate so that faulting loads get an exception table entry which
> clears the destination register and resumes execution. Since
> BPF_PROBE_MEM32SX shares its mode value (0xc0) with BPF_ATOMIC, the
> gate accepts it only for LDX class instructions so that plain atomic
> instructions do not register exception table entries.
> 
> Verified by running the arena LDSX selftests (arena_ldsx_disasm,
> arena_ldsx_exception, arena_ldsx_s8/s16/s32) and the full
> arena_atomics test suite on riscv64 QEMU, all passing.
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
> 
> Changes in v3:
> - Restore the pseudo-code form of the PROBE_MEM32SX case comment.
> 
> Changes in v2:
> - Fix extable entry overflow breaking arena_atomics load
> 
>   arch/riscv/net/bpf_jit_comp64.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index f9d5347ba966..64ebd262c498 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -777,6 +777,8 @@ static int add_exception_handler(const struct bpf_insn *insn, int dst_reg,
>   	if (BPF_MODE(insn->code) != BPF_PROBE_MEM &&
>   	    BPF_MODE(insn->code) != BPF_PROBE_MEMSX &&
>   	    BPF_MODE(insn->code) != BPF_PROBE_MEM32 &&
> +	    !(BPF_MODE(insn->code) == BPF_PROBE_MEM32SX &&
> +	      BPF_CLASS(insn->code) == BPF_LDX) &&
>   	    BPF_MODE(insn->code) != BPF_PROBE_ATOMIC)
>   		return 0;
>   
> @@ -1902,13 +1904,19 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   	case BPF_LDX | BPF_PROBE_MEM32 | BPF_H:
>   	case BPF_LDX | BPF_PROBE_MEM32 | BPF_W:
>   	case BPF_LDX | BPF_PROBE_MEM32 | BPF_DW:
> +	/* LDX | PROBE_MEM32SX: dst = *(signed size *)(src + RV_REG_ARENA + off) */
> +	case BPF_LDX | BPF_PROBE_MEM32SX | BPF_B:
> +	case BPF_LDX | BPF_PROBE_MEM32SX | BPF_H:
> +	case BPF_LDX | BPF_PROBE_MEM32SX | BPF_W:
>   	{
>   		bool sign_ext;
>   
>   		sign_ext = BPF_MODE(insn->code) == BPF_MEMSX ||
> -			   BPF_MODE(insn->code) == BPF_PROBE_MEMSX;
> +			   BPF_MODE(insn->code) == BPF_PROBE_MEMSX ||
> +			   BPF_MODE(insn->code) == BPF_PROBE_MEM32SX;
>   
> -		if (BPF_MODE(insn->code) == BPF_PROBE_MEM32) {
> +		if (BPF_MODE(insn->code) == BPF_PROBE_MEM32 ||
> +		    BPF_MODE(insn->code) == BPF_PROBE_MEM32SX) {
>   			emit_add(RV_REG_T2, rs, RV_REG_ARENA, ctx);
>   			rs = RV_REG_T2;
>   		}
> @@ -2126,10 +2134,6 @@ bool bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena)
>   			if (insn->imm == BPF_CMPXCHG)
>   				return rv_ext_enabled(ZACAS);
>   			break;
> -		case BPF_LDX | BPF_MEMSX | BPF_B:
> -		case BPF_LDX | BPF_MEMSX | BPF_H:
> -		case BPF_LDX | BPF_MEMSX | BPF_W:
> -			return false;
>   		}
>   	}
>   

Reviewed-by: Pu Lehui <pulehui@huawei.com>
Tested-by: Pu Lehui <pulehui@huawei.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
