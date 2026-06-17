Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F244CD98E2
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 07:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tFDzkR/sjN8tupStg3mQ2MNgkY9MI2vhnmogis/HtKw=; b=fFiB/9XbQxitUU
	9k6qek7e3NGhdLVq41AMP6/oGrA9BcNvUuNXhpzi2Zx9nHulOVT5EFgFo9KsP/vZXxLWhfkTdxeWF
	Vo12zw55pRh9QQW8PLmatiQye5Vrmy9U3WLxYjrsMbAWoemtTnE8KmSdUbzFSB6h4TgaVcFm3xWgy
	X0kwdM+ZHsIZATlP0mps4x6z9aR6VWjTRE2RDGIEJVppG4G5qDTsdwmVnjlT4+KAPylbHujAM/EaL
	YArLg1PoZnpAZo0q4TLQrjaRdZLm03KMTJY+khwVtt2MoPl+C4l08+gk7isnkY3p/a+6YE7EiExqk
	xybIDEnKIxqcmPPiKMWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZl6p-0000000GqW9-1LjX;
	Wed, 17 Jun 2026 07:54:51 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZl6l-0000000GqVi-3CPo
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jun 2026 07:54:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=IH4FW2TPZ4Er7fAhK83vzXMJ8oX/fMyQYbA3ZijxfjI=;
	b=Dur1cHTMxYR0uv79YuEfWGNqHU6Srk2bF8ub/C2clAXd2FNV1EfTD8Vj57AvhRak2UfYBx2kP
	p3nx/DrsjSyporBBHYgsjDxcxEogs58S5zY1ijP3pFSyPktA49qAxBi3pIld5zGA4v7THpCpgzF
	vw4mni9u5Vf8IR2paRE0wWw=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4ggGBy3WFwzKmWS;
	Wed, 17 Jun 2026 15:46:34 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 6F7B44055B;
	Wed, 17 Jun 2026 15:54:35 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 17 Jun
 2026 15:54:34 +0800
Message-ID: <1a44ce6d-58cd-4d0a-86bf-2670962e89f7@huawei.com>
Date: Wed, 17 Jun 2026 15:54:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 3/3] riscv, bpf: Add 32 bit atomic operations
 to RV32 JIT
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
 <20260511221648.3251464-4-visitorckw@gmail.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260511221648.3251464-4-visitorckw@gmail.com>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_005448_450272_3605AB2C 
X-CRM114-Status: GOOD (  18.48  )
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
> The RV32 BPF JIT compiler currently only supports the BPF_ADD atomic
> operation. Other 32 bit atomic operations (and, or, xor, xchg) and
> their BPF_FETCH variants are not supported and gracefully fall back to
> the interpreter.
> 
> Since the RISC-V A extension is required for Linux on RV32, we can
> natively support these 32-bit BPF atomic operations by mapping them
> directly to the corresponding RISC-V amo*.w instructions.
> 
> Implement BPF_ADD, BPF_AND, BPF_OR, BPF_XOR, and BPF_XCHG with and
> without BPF_FETCH. BPF_CMPXCHG requires a more complex lr.w/sc.w
> loop and is left to fall back to the interpreter.
> 
> Before this patch:
> [  138.862161] test_bpf: Summary: 1054 PASSED, 0 FAILED, [843/1042 JIT'ed]
> 
> After this patch:
> [  157.024124] test_bpf: Summary: 1054 PASSED, 0 FAILED, [902/1042 JIT'ed]
> 
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>   arch/riscv/net/bpf_jit_comp32.c | 50 +++++++++++++++++++++++++--------
>   1 file changed, 39 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/riscv/net/bpf_jit_comp32.c b/arch/riscv/net/bpf_jit_comp32.c
> index f8509950fed4..7fd726a09b26 100644
> --- a/arch/riscv/net/bpf_jit_comp32.c
> +++ b/arch/riscv/net/bpf_jit_comp32.c
> @@ -877,7 +877,7 @@ static int emit_load_r64(const s8 *dst, const s8 *src, s16 off,
>   
>   static int emit_store_r64(const s8 *dst, const s8 *src, s16 off,
>   			  struct rv_jit_context *ctx, const u8 size,
> -			  const u8 mode)
> +			  const u8 mode, s32 imm)
>   {
>   	const s8 *tmp1 = bpf2rv32[TMP_REG_1];
>   	const s8 *tmp2 = bpf2rv32[TMP_REG_2];
> @@ -902,11 +902,43 @@ static int emit_store_r64(const s8 *dst, const s8 *src, s16 off,
>   		case BPF_MEM:
>   			emit(rv_sw(RV_REG_T0, 0, lo(rs)), ctx);
>   			break;
> -		case BPF_ATOMIC: /* Only BPF_ADD supported */
> -			emit(rv_amoadd_w(RV_REG_ZERO, lo(rs), RV_REG_T0, 0, 0),
> -			     ctx);
> +		case BPF_ATOMIC:
> +		{
> +			bool is_fetch = (imm & BPF_FETCH) || (imm == BPF_XCHG);
> +			s8 fetch_reg = is_fetch ? lo(rs) : RV_REG_ZERO;
> +			int aq = is_fetch ? 1 : 0;
> +			int rl = is_fetch ? 1 : 0;
> +
> +			switch (imm) {
> +			case BPF_ADD:
> +			case BPF_ADD | BPF_FETCH:
> +				emit(rv_amoadd_w(fetch_reg, lo(rs), RV_REG_T0, aq, rl), ctx);
> +				break;
> +			case BPF_AND:
> +			case BPF_AND | BPF_FETCH:
> +				emit(rv_amoand_w(fetch_reg, lo(rs), RV_REG_T0, aq, rl), ctx);
> +				break;
> +			case BPF_OR:
> +			case BPF_OR | BPF_FETCH:
> +				emit(rv_amoor_w(fetch_reg, lo(rs), RV_REG_T0, aq, rl), ctx);
> +				break;
> +			case BPF_XOR:
> +			case BPF_XOR | BPF_FETCH:
> +				emit(rv_amoxor_w(fetch_reg, lo(rs), RV_REG_T0, aq, rl), ctx);
> +				break;
> +			case BPF_XCHG:
> +				emit(rv_amoswap_w(fetch_reg, lo(rs), RV_REG_T0, aq, rl), ctx);
> +				break;
> +			default:
> +				return -1;
> +			}
> +			if (is_fetch) {
> +				emit(rv_addi(hi(rs), RV_REG_ZERO, 0), ctx);
> +				bpf_put_reg64(src, rs, ctx); > +			}
>   			break;

rv32 code looks elegant, let's factor out an atomic function

>   		}
> +		}
>   		break;
>   	case BPF_DW:
>   		emit(rv_sw(RV_REG_T0, 0, lo(rs)), ctx);
> @@ -1308,20 +1340,16 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   		}
>   
>   		if (emit_store_r64(dst, src, off, ctx, BPF_SIZE(code),
> -				   BPF_MODE(code)))
> +				   BPF_MODE(code), 0))
>   			return -1;
>   		break;
>   
>   	case BPF_STX | BPF_ATOMIC | BPF_W:
> -		if (insn->imm != BPF_ADD) {

just `insn->imm == BPF_CMPXCHG` here, and not miss the warning message.

> -			pr_info_once(
> -				"bpf-jit: not supported: atomic operation %02x ***\n",
> -				insn->imm);
> +		if (insn->imm == BPF_CMPXCHG)
>   			return -EFAULT;
> -		}
>   
>   		if (emit_store_r64(dst, src, off, ctx, BPF_SIZE(code),
> -				   BPF_MODE(code)))
> +				   BPF_MODE(code), insn->imm))
>   			return -1;
>   		break;
>   

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
