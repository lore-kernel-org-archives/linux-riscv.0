Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5850CCD98ED
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 07:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RaX6eSQaZaGYZ4uJZvWXtsBHFky0ck1Yg9lak0DkCEI=; b=dXPk+SgVVOtA+C
	KaPhEaUizsfLubZBZBZCHDGqjkkQJgystyslF2RY9M6NvhIoSHI5ys67tJYfLARIMc4sDI0HZwg5w
	otfVzY3S70dy2RRisyeroXe5oN4gQte6boeEHVDtEYotgbMC3dBduUrfR07oI8vbaLmh2WT+cgnec
	Itx8bD4XcAKHRUgqDYmbSw3hhGeDHkxOEZj74lIskpOF/MkO+ymXVvY680QS/woulLH9FgMnyXJym
	/uAQAu5ZPqVGy4ojdz2+J0Cu0SE3STt5FgIOscIS6qr2OpIkpgNvi5I9dcWxb2vb6n4mseR1WfFWK
	Ut3cmr8U95WWy+TDqeEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkj2-0000000GpT8-3xoy;
	Wed, 17 Jun 2026 07:30:16 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkiy-0000000GpS8-2kmp
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jun 2026 07:30:15 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=r72SZ0T5nPg5YOaeX9GzZ5PhvkCNhJKsFZeacJsMyXc=;
	b=Vl7t1HdCfBihnCzda/CLpC1pp2eNZcxuD23b1uR5Y7zyk7M1RyBoP8rd1LN1f4kvUCj/YhkQC
	oWIuSQxui3bJlsK+KE2UT600MzS7vG735SE+8HzvU0okVGvzp2KlqgwYzQrWz+b27ONc0oFvDST
	Bxz8Tm3GjUyLPKqZVg01Dfg=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4ggFfm2DdNz1cypx;
	Wed, 17 Jun 2026 15:22:08 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 8C04D4056C;
	Wed, 17 Jun 2026 15:30:05 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 17 Jun
 2026 15:30:04 +0800
Message-ID: <2ca2a85a-d4a9-4459-a534-6159de6e5890@huawei.com>
Date: Wed, 17 Jun 2026 15:30:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 2/3] riscv, bpf: Fix support for BPF_MOVSX in
 RV32 JIT
Content-Language: en-US
To: Kuan-Wei Chiu <visitorckw@gmail.com>, <ast@kernel.org>,
	<daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
	<memxor@gmail.com>, <luke.r.nels@gmail.com>, <xi.wang@gmail.com>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
	<jolsa@kernel.org>, <alex@ghiti.fr>, <jserv@ccns.ncku.edu.tw>,
	<eleanor15x@gmail.com>, <marscheng@google.com>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260511221648.3251464-1-visitorckw@gmail.com>
 <20260511221648.3251464-3-visitorckw@gmail.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260511221648.3251464-3-visitorckw@gmail.com>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_003013_330282_1A75D1D3 
X-CRM114-Status: GOOD (  14.27  )
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



On 2026/5/12 6:16, Kuan-Wei Chiu wrote:
> The current rv32 bpf jit compiler incorrectly treats BPF_MOVSX as a
> standard zero-extended move operation. The bpf instruction set allows
> sign-extension moves by reusing the BPF_MOV opcode with the instruction
> offset set to 8, 16, or 32.
> 
> Update the bpf_jit_emit_insn() function to check the offset field for
> both ALU and ALU64 MOV operations. If the offset is non-zero, emit the
> correct slli and srai instructions to perform the sign extension.
> 
> Before this patch:
> [   19.549705] test_bpf: #82 ALU_MOVSX | BPF_B jited:1 ret 2 != 1 (0x2 != 0x1)FAIL (1 times)
> [   19.551354] test_bpf: #83 ALU_MOVSX | BPF_H jited:1 ret 2 != 1 (0x2 != 0x1)FAIL (1 times)
> [   19.552576] test_bpf: #84 ALU64_MOVSX | BPF_B jited:1 ret 2 != 1 (0x2 != 0x1)FAIL (1 times)
> [   19.553542] test_bpf: #85 ALU64_MOVSX | BPF_H jited:1 ret 2 != 1 (0x2 != 0x1)FAIL (1 times)
> [   19.554807] test_bpf: #86 ALU64_MOVSX | BPF_W jited:1 ret 2 != 1 (0x2 != 0x1)FAIL (1 times)
> 
> After this patch:
> [   17.931172] test_bpf: #82 ALU_MOVSX | BPF_B jited:1 125 PASS
> [   17.932198] test_bpf: #83 ALU_MOVSX | BPF_H jited:1 124 PASS
> [   17.933039] test_bpf: #84 ALU64_MOVSX | BPF_B jited:1 124 PASS
> [   17.933918] test_bpf: #85 ALU64_MOVSX | BPF_H jited:1 124 PASS
> [   17.934751] test_bpf: #86 ALU64_MOVSX | BPF_W jited:1 122 PASS
> 
> Fixes: 8100928c8814 ("bpf: Support new sign-extension mov insns")

not a fix, the fixes tag should remove. And the title should `Add 
support for xxx`

others lgtm,

Reviewed-by: Pu Lehui <pulehui@huawei.com>

> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>   arch/riscv/net/bpf_jit_comp32.c | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/arch/riscv/net/bpf_jit_comp32.c b/arch/riscv/net/bpf_jit_comp32.c
> index 7396899ea276..f8509950fed4 100644
> --- a/arch/riscv/net/bpf_jit_comp32.c
> +++ b/arch/riscv/net/bpf_jit_comp32.c
> @@ -974,6 +974,24 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   
>   	switch (code) {
>   	case BPF_ALU64 | BPF_MOV | BPF_X:
> +		if (insn->off != 0) {
> +			const s8 *rd = bpf_get_reg64(dst, tmp1, ctx);
> +			const s8 *rs = bpf_get_reg64(src, tmp2, ctx);
> +
> +			if (insn->off == 8) {
> +				emit(rv_slli(lo(rd), lo(rs), 24), ctx);
> +				emit(rv_srai(lo(rd), lo(rd), 24), ctx);
> +			} else if (insn->off == 16) {
> +				emit(rv_slli(lo(rd), lo(rs), 16), ctx);
> +				emit(rv_srai(lo(rd), lo(rd), 16), ctx);
> +			} else {
> +				emit(rv_addi(lo(rd), lo(rs), 0), ctx);
> +			}
> +			emit(rv_srai(hi(rd), lo(rd), 31), ctx);
> +			bpf_put_reg64(dst, rd, ctx);
> +			break;
> +		}
> +		fallthrough;
>   
>   	case BPF_ALU64 | BPF_ADD | BPF_X:
>   	case BPF_ALU64 | BPF_ADD | BPF_K:
> @@ -1024,6 +1042,20 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   			emit_zext64(dst, ctx);
>   			break;
>   		}
> +		if (insn->off != 0) {
> +			const s8 *rd = bpf_get_reg32(dst, tmp1, ctx);
> +			const s8 *rs = bpf_get_reg32(src, tmp2, ctx);
> +
> +			if (insn->off == 8) {
> +				emit(rv_slli(lo(rd), lo(rs), 24), ctx);
> +				emit(rv_srai(lo(rd), lo(rd), 24), ctx);
> +			} else if (insn->off == 16) {
> +				emit(rv_slli(lo(rd), lo(rs), 16), ctx);
> +				emit(rv_srai(lo(rd), lo(rd), 16), ctx);
> +			}
> +			bpf_put_reg32(dst, rd, ctx);
> +			break;
> +		}
>   		fallthrough;
>   
>   	case BPF_ALU | BPF_ADD | BPF_X:

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
