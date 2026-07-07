Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE4AC43602
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 02:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8JNTpR3EqyUDi8G9JbDTRIHrNQSb2qCMHAaNOeCEi38=; b=vJ3XU2v0QfWvto
	47SYQ040rTiHMNZ/Qesqaz5GzvlIHDj47SDT3CpnS+d8RVk6P3Q5FF4DJEhqltVF7wiBbqtSJjpra
	UkDcWvD8YCnltbXL4nl3lr+PWG5RzIciVfZN7llVeqGUtydYuqRJYqSbVwn06gtZ7/13UU/hSV6aq
	jArDhpvhRlos4tWarw8AwrwKp9BTw5ocMzFvcGMvztx1HMeUeRKHrxXNuFms5niAKvAbWH+RsZ6KY
	YkOxCYTDb/X2juCFRj5PFc5nuzyylwqC52FiO3KwhAGvV479slNRGzllUsV9zEKt2aL8W5cP51Yn4
	pviOKqfI4rgVaWfpHjcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgvRq-0000000DvmW-28h6;
	Tue, 07 Jul 2026 02:22:10 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgvRn-0000000Dvkp-17DP
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 02:22:09 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=1+B6eVS3lS4biayl/G73KUccdaeP7ipijwhDj8mVJNo=;
	b=aakhfOllkZdnwaPhMzIhcvWV+gdiZYN1YxKGj9wODnuMXXFW6sDqrue2A8CSLduPt+WLw++KL
	/rKMwhcRxp9/lddh3/PstZT4z+3ZRKRb76astZc8VzYEwtPey+tgyOyaPmEAOkDuWDACvxCGbmQ
	UjYPEKi6hVpblspqV6y62OA=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4gvPrV23GczRhWC;
	Tue,  7 Jul 2026 10:12:42 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 3915840579;
	Tue,  7 Jul 2026 10:21:54 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 7 Jul
 2026 10:21:53 +0800
Message-ID: <c9603890-a58f-425d-9f48-7c980e7309b8@huawei.com>
Date: Tue, 7 Jul 2026 10:21:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 1/3] riscv, bpf: Add support for BPF_SDIV and
 BPF_SMOD in RV32 JIT
Content-Language: en-US
To: Kuan-Wei Chiu <visitorckw@gmail.com>, <ast@kernel.org>,
	<daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
	<memxor@gmail.com>, <luke.r.nels@gmail.com>, <xi.wang@gmail.com>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
	<jolsa@kernel.org>, <emil@etsalapatis.com>, <alex@ghiti.fr>,
	<jserv@ccns.ncku.edu.tw>, <eleanor15x@gmail.com>, <marscheng@google.com>,
	<bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260706172846.3876436-1-visitorckw@gmail.com>
 <20260706172846.3876436-2-visitorckw@gmail.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260706172846.3876436-2-visitorckw@gmail.com>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_192207_965760_163C5647 
X-CRM114-Status: GOOD (  15.38  )
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


On 2026/7/7 1:28, Kuan-Wei Chiu wrote:
> The current rv32 bpf jit compiler incorrectly treats BPF_SDIV and
> BPF_SMOD as unsigned operations. The BPF instruction set allows
> signed division and modulo by reusing the BPF_DIV and BPF_MOD opcodes
> with the instruction offset set to 1.
> 
> Update the emit_alu_r32() function to accept an 'is_sdiv' variable and
> emit the correct div and rem instructions when the offset is 1.
> 
> Before this patch:
> [   44.161771] test_bpf: #165 ALU_SDIV_X: -6 / 2 = -3 jited:1 ret 2147483645 != -3 (0x7ffffffd != 0xfffffffd)FAIL (1 times)
> [   44.167385] test_bpf: #166 ALU_SDIV_K: -6 / 2 = -3 jited:1 ret 2147483645 != -3 (0x7ffffffd != 0xfffffffd)FAIL (1 times)
> [   44.171053] test_bpf: #169 ALU_SMOD_X: -7 % 2 = -1 jited:1 ret 1 != -1 (0x1 != 0xffffffff)FAIL (1 times)
> [   44.172081] test_bpf: #170 ALU_SMOD_K: -7 % 2 = -1 jited:1 ret 1 != -1 (0x1 != 0xffffffff)FAIL (1 times)
> 
> After this patch:
> [   16.002192] test_bpf: #165 ALU_SDIV_X: -6 / 2 = -3 jited:1 95 PASS
> [   16.002983] test_bpf: #166 ALU_SDIV_K: -6 / 2 = -3 jited:1 1059 PASS
> [   16.017167] test_bpf: #169 ALU_SMOD_X: -7 % 2 = -1 jited:1 136 PASS
> [   16.023002] test_bpf: #170 ALU_SMOD_K: -7 % 2 = -1 jited:1 109 PASS
> 
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>   arch/riscv/net/bpf_jit_comp32.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/net/bpf_jit_comp32.c b/arch/riscv/net/bpf_jit_comp32.c
> index 592dd86fbf81..89153946a4e4 100644
> --- a/arch/riscv/net/bpf_jit_comp32.c
> +++ b/arch/riscv/net/bpf_jit_comp32.c
> @@ -509,12 +509,15 @@ static void emit_alu_r64(const s8 *dst, const s8 *src,
>   }
>   
>   static void emit_alu_r32(const s8 *dst, const s8 *src,
> -			 struct rv_jit_context *ctx, const u8 op)
> +			 struct rv_jit_context *ctx,
> +			 const struct bpf_insn *insn)
>   {
>   	const s8 *tmp1 = bpf2rv32[TMP_REG_1];
>   	const s8 *tmp2 = bpf2rv32[TMP_REG_2];
>   	const s8 *rd = bpf_get_reg32(dst, tmp1, ctx);
>   	const s8 *rs = bpf_get_reg32(src, tmp2, ctx);
> +	u8 op = BPF_OP(insn->code);
> +	bool is_signed = insn->off == 1;
>   
>   	switch (op) {
>   	case BPF_MOV:
> @@ -539,10 +542,12 @@ static void emit_alu_r32(const s8 *dst, const s8 *src,
>   		emit(rv_mul(lo(rd), lo(rd), lo(rs)), ctx);
>   		break;
>   	case BPF_DIV:
> -		emit(rv_divu(lo(rd), lo(rd), lo(rs)), ctx);
> +		emit(is_signed ? rv_div(lo(rd), lo(rd), lo(rs)) :
> +				 rv_divu(lo(rd), lo(rd), lo(rs)), ctx);
>   		break;
>   	case BPF_MOD:
> -		emit(rv_remu(lo(rd), lo(rd), lo(rs)), ctx);
> +		emit(is_signed ? rv_rem(lo(rd), lo(rd), lo(rs)) :
> +				 rv_remu(lo(rd), lo(rd), lo(rs)), ctx);
>   		break;
>   	case BPF_LSH:
>   		emit(rv_sll(lo(rd), lo(rd), lo(rs)), ctx);
> @@ -1041,7 +1046,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   			emit_imm32(tmp2, imm, ctx);
>   			src = tmp2;
>   		}
> -		emit_alu_r32(dst, src, ctx, BPF_OP(code));
> +		emit_alu_r32(dst, src, ctx, insn);
>   		break;
>   
>   	case BPF_ALU | BPF_MOV | BPF_K:
> @@ -1065,7 +1070,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   		 * src is ignored---choose tmp2 as a dummy register since it
>   		 * is not on the stack.
>   		 */
> -		emit_alu_r32(dst, tmp2, ctx, BPF_OP(code));
> +		emit_alu_r32(dst, tmp2, ctx, insn);
>   		break;
>   
>   	case BPF_ALU | BPF_END | BPF_FROM_LE:

lgtm, thanks

Reviewed-by: Pu Lehui <pulehui@huawei.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
