Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6122C624D6
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2026 03:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPrWrWJim42u/8MUtzZDBxwTwwjwVZhzhT2bBtXw1pE=; b=4Gzm4TlODaexih
	DpOXUNcHcPqsn0yXRvMjnok8iIIkme6oTLymFAZL2sBp+H5lFSsnz3kk7Up7KNdoznstu9riq7YVD
	zhfz8FYUFdhqZfluxxHG13FHUSOGrPlS4HBz8AByL9LXSWAcqipuTPoI4egizx4jFA8gheZpU+gOA
	KhpPbqdougdbebWnwj3UNidZnLr3a1uCiW1M09CJT1v9IIXNvgh1Xc6g3ksP7anGE+0SZIAqE7UMZ
	oz2oiTNFr07QTFJaadSOuzLcdt2Jt7mCjcr7LjZMJMdTiLZPs+vJtmrdkY6bF9Bd4YKniXnfaRdk7
	VEl4M+Sd0MB0/ABplQRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2hKb-00000003eJ9-0Biz;
	Sat, 05 Sep 2026 03:44:41 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2hKV-00000003eIg-1XXS
	for linux-riscv@lists.infradead.org;
	Sat, 05 Sep 2026 03:44:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Wp8B10J8KdXX1ICuZjCb5MGZd4JK6ZEKI5ReZhq+g4I=;
	b=Ehcwnko2Vb9qOtg+1UmGVeyXzxq46q9jfDNH07nTQRZXRZSokJdIoiDr0+bjiVtdKFTWmSunl
	vGPexvkmmBGBApKXAHoRiENF5Zbe2zAIJ4RNXBW5xhAIBQYLxa5NO247RXAEFsYt+XoZuAER5nr
	YnbWasldB983YP6uFpE5n90=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4hcJnQ36SMzpSvB;
	Sat,  5 Sep 2026 11:32:58 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 16D3A4056D;
	Sat,  5 Sep 2026 11:44:24 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 5 Sep
 2026 11:44:23 +0800
Message-ID: <7fbae9ac-44e4-4607-8aba-15db9779f80d@huawei.com>
Date: Sat, 5 Sep 2026 11:44:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next] bpf, riscv: Register extable entries at probe
 insn call sites
Content-Language: en-US
To: Chen Pei <cp0613@linux.alibaba.com>, <ast@kernel.org>,
	<daniel@iogearbox.net>, <andrii@kernel.org>, <memxor@gmail.com>,
	<bjorn@kernel.org>, <puranjay@kernel.org>
CC: <ihor.solodrai@linux.dev>, <eddyz87@gmail.com>, <martin.lau@linux.dev>,
	<song@kernel.org>, <yonghong.song@linux.dev>, <jolsa@kernel.org>,
	<emil@etsalapatis.com>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<shuah@kernel.org>, <guoren@kernel.org>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260901120013.16104-1-cp0613@linux.alibaba.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260901120013.16104-1-cp0613@linux.alibaba.com>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_204436_095219_EF716DEF 
X-CRM114-Status: GOOD (  21.82  )
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


On 2026/9/1 20:00, Chen Pei wrote:
> add_exception_handler() filters insns by matching BPF_MODE() against
> the probe mode values. These values occupy unused opcode slots and
> collide with legitimate encodings: BPF_PROBE_MEM32SX (0xc0) shares
> its mode value with BPF_ATOMIC. Relying on the mode alone therefore
> risks registering exception table entries for the wrong instructions,
> as would happen for plain atomics without the LDX class check.
> 
> Make the decision explicit at the call sites instead: register an
> entry only when emitting a probe load, a PROBE_MEM32 store, or a
> PROBE_ATOMIC atomic, and drop the fragile mode gate from
> add_exception_handler() along with the now unused insn argument. No
> functional change intended.
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
> base-commit: d761934c9483ecde93fe99d8705282f716dfee50
> 
>   arch/riscv/net/bpf_jit_comp64.c | 50 ++++++++++++++++++---------------
>   1 file changed, 28 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index e7378be171a9..726c0169fc60 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -731,9 +731,8 @@ bool ex_handler_bpf(const struct exception_table_entry *ex,
>   	return true;
>   }
>   
> -/* For accesses to BTF pointers, add an entry to the exception table */
> -static int add_exception_handler(const struct bpf_insn *insn, int dst_reg,
> -				 struct rv_jit_context *ctx)
> +/* Add an entry to the exception table for a faulting probe insn */
> +static int add_exception_handler(int dst_reg, struct rv_jit_context *ctx)
>   {
>   	struct exception_table_entry *ex;
>   	unsigned long pc;
> @@ -744,14 +743,6 @@ static int add_exception_handler(const struct bpf_insn *insn, int dst_reg,
>   	    ctx->ex_insn_off <= 0 || ctx->ex_jmp_off <= 0)
>   		return 0;
>   
> -	if (BPF_MODE(insn->code) != BPF_PROBE_MEM &&
> -	    BPF_MODE(insn->code) != BPF_PROBE_MEMSX &&
> -	    BPF_MODE(insn->code) != BPF_PROBE_MEM32 &&
> -	    !(BPF_MODE(insn->code) == BPF_PROBE_MEM32SX &&
> -	      BPF_CLASS(insn->code) == BPF_LDX) &&
> -	    BPF_MODE(insn->code) != BPF_PROBE_ATOMIC)
> -		return 0;

Hi Pei,

This patch looks fine, but I still tend not to introduce these changes. 
I think the function itself should handle its own defensive checks, and 
we should also avoid "shotgun surgery".

> -
>   	if (WARN_ON_ONCE(ctx->nexentries >= ctx->prog->aux->num_exentries))
>   		return -EINVAL;
>   
> @@ -1360,6 +1351,15 @@ int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *ro_image,
>   	return ret < 0 ? ret : size;
>   }
>   
> +/* Probe loads fault on unmapped memory and need an exception table entry */
> +static bool insn_is_probe_ldx(const struct bpf_insn *insn)
> +{
> +	return BPF_MODE(insn->code) == BPF_PROBE_MEM ||
> +	       BPF_MODE(insn->code) == BPF_PROBE_MEMSX ||
> +	       BPF_MODE(insn->code) == BPF_PROBE_MEM32 ||
> +	       BPF_MODE(insn->code) == BPF_PROBE_MEM32SX;
> +}
> +
>   int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   		      bool extra_pass)
>   {
> @@ -1929,9 +1929,11 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   
>   		emit_ldx(rd, off, rs, BPF_SIZE(code), sign_ext, ctx);
>   
> -		ret = add_exception_handler(insn, rd, ctx);
> -		if (ret)
> -			return ret;
> +		if (insn_is_probe_ldx(insn)) {
> +			ret = add_exception_handler(rd, ctx);
> +			if (ret)
> +				return ret;
> +		}
>   
>   		if (BPF_SIZE(code) != BPF_DW && insn_is_zext(&insn[1]))
>   			return 1;
> @@ -1959,9 +1961,11 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   
>   		emit_st(rd, off, imm, BPF_SIZE(code), ctx);
>   
> -		ret = add_exception_handler(insn, REG_DONT_CLEAR_MARKER, ctx);
> -		if (ret)
> -			return ret;
> +		if (BPF_MODE(insn->code) == BPF_PROBE_MEM32) {
> +			ret = add_exception_handler(REG_DONT_CLEAR_MARKER, ctx);
> +			if (ret)
> +				return ret;
> +		}
>   		break;
>   
>   	/* STX: *(size *)(dst + off) = src */
> @@ -1981,9 +1985,11 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   
>   		emit_stx(rd, off, rs, BPF_SIZE(code), ctx);
>   
> -		ret = add_exception_handler(insn, REG_DONT_CLEAR_MARKER, ctx);
> -		if (ret)
> -			return ret;
> +		if (BPF_MODE(insn->code) == BPF_PROBE_MEM32) {
> +			ret = add_exception_handler(REG_DONT_CLEAR_MARKER, ctx);
> +			if (ret)
> +				return ret;
> +		}
>   		break;
>   
>   	/* Atomics */
> @@ -2001,7 +2007,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   			ret = emit_atomic_rmw(rd, rs, insn, ctx);
>   
>   		/* ret can be 1 (skip-zext); extable entry still needs to be added */
> -		if (ret >= 0) {
> +		if (ret >= 0 && BPF_MODE(insn->code) == BPF_PROBE_ATOMIC) {
>   			/*
>   			 * A load-acquire reads into dst_reg, and a read-modify-write
>   			 * carrying BPF_FETCH reads the old value into src_reg, or into
> @@ -2010,7 +2016,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   			 */
>   			int load_reg = bpf_atomic_load_reg(insn);
>   
> -			ret = add_exception_handler(insn, load_reg < 0 ?
> +			ret = add_exception_handler(load_reg < 0 ?
>   					REG_DONT_CLEAR_MARKER : regmap[load_reg],
>   					ctx) ?: ret;
>   		}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
