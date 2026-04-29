Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52553FF8875
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 13:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6iyNlGHt19j8qDRFn1mHPvauFvn+mbAs1RtQ1fZR50=; b=xIUFWSPivb2fHbJLuNhPgNb62l
	hYzvbLs38a0wN9/I1vILmC0P5Z9nwtY+AjjpmZjQQsmKGsPEkU5n0vccCu45KwwlapMThdeeVoGfy
	8qrG1cOaYooG931uid/Gq7ghLNAkGayAITpW2iXvSniR5fEibiwr25CQjAFJvtfhKpTNrC+dVAmx5
	jw64yiRuKq0hDuhS7gEjauqbSMktT53RaTTpmzYCnSAdkch4c7Ll/NkrxmVsv7jhlJGr95w8JbXRH
	xq58WI6mvS3e9bZF+8ac+PgIBMM9hvQBRdTsiebetbliO9mGA+MCLj0u/T1Ha376dwADV3t4qbnjv
	Iyzj8Fww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4jN-00000003e6k-14Jk;
	Wed, 29 Apr 2026 13:13:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4jK-00000003e5Z-0yG4
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 13:13:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BCBC1443C6;
	Wed, 29 Apr 2026 13:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 484A0C19425;
	Wed, 29 Apr 2026 13:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777468409;
	bh=Y2qL98TARnuiC1jVU3x3sOclRr22lCOklsNDxNc9vdc=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=D6Ch2JGWVZ8Tft5JXU6C0bsMDvui3u9jUGBh3FSF/mpKbQ1xO3oNnLRq9Rux7gRhC
	 Ya0b/wjD0BcMKeafB1wmHtPfO9EXd4NDnCuD/jSDSawdJNvRaJ+wrAFpl1/XGxQmW5
	 oe5QdKAOJ/Vrn2oGA0H1smNUY0xX4RFsrqVzaB46Khfz3v8GFHaZ0ivxcgDBq2apR9
	 dq7lmEngs2tq5tCzkauG1CuDZ421+B7KAPdJwuRD7/7k5z38suTqd9Dj0mrbZl9RS9
	 j5suNipYUjUwlIn3KaeSufi9e0L1M/9LmPHh2tU4wHLxvdhOMDUnUvctFywTDb1cPo
	 QBn1a2EMO7q9g==
Content-Type: multipart/mixed; boundary="===============3577337078344571119=="
MIME-Version: 1.0
Message-Id: <6e8e7111d2d5abc2947cda9233d9fea7399a89bf1ab0ba3ae14724bb8b71a1d8@mail.kernel.org>
In-Reply-To: <20260429123513.3477780-4-visitorckw@gmail.com>
References: <20260429123513.3477780-4-visitorckw@gmail.com>
Subject: Re: [PATCH bpf-next 3/3] riscv, bpf: Add 32 bit atomic operations to RV32 JIT
From: bot+bpf-ci@kernel.org
To: visitorckw@gmail.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,eddyz87@gmail.com,memxor@gmail.com,luke.r.nels@gmail.com,xi.wang@gmail.com,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu
Cc: martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,alex@ghiti.fr,jserv@ccns.ncku.edu.tw,eleanor15x@gmail.com,marscheng@google.com,bpf@vger.kernel.org,linux-riscv@lists.infradead.org,linux-kernel@vger.kernel.org,visitorckw@gmail.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Wed, 29 Apr 2026 13:13:29 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_061330_315393_FA5365AB 
X-CRM114-Status: GOOD (  11.08  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3577337078344571119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/riscv/net/bpf_jit_comp32.c b/arch/riscv/net/bpf_jit_comp32.c
> index f8509950fed4..710c56b20f98 100644
> --- a/arch/riscv/net/bpf_jit_comp32.c
> +++ b/arch/riscv/net/bpf_jit_comp32.c

[ ... ]

> @@ -902,11 +902,40 @@ static int emit_store_r64(const s8 *dst, const s8 *src, s16 off,
>  		case BPF_MEM:
>  			emit(rv_sw(RV_REG_T0, 0, lo(rs)), ctx);
>  			break;
> -		case BPF_ATOMIC: /* Only BPF_ADD supported */
> -			emit(rv_amoadd_w(RV_REG_ZERO, lo(rs), RV_REG_T0, 0, 0),
> -			     ctx);
> +		case BPF_ATOMIC:
> +		{
> +			s8 fetch_reg = (imm & BPF_FETCH) ? lo(rs) : RV_REG_ZERO;
> +
> +			switch (imm) {
> +			case BPF_ADD:
> +			case BPF_ADD | BPF_FETCH:
> +				emit(rv_amoadd_w(fetch_reg, lo(rs), RV_REG_T0, 0, 0), ctx);
> +				break;
> +			case BPF_AND:
> +			case BPF_AND | BPF_FETCH:
> +				emit(rv_amoand_w(fetch_reg, lo(rs), RV_REG_T0, 0, 0), ctx);
> +				break;
> +			case BPF_OR:
> +			case BPF_OR | BPF_FETCH:
> +				emit(rv_amoor_w(fetch_reg, lo(rs), RV_REG_T0, 0, 0), ctx);
> +				break;
> +			case BPF_XOR:
> +			case BPF_XOR | BPF_FETCH:
> +				emit(rv_amoxor_w(fetch_reg, lo(rs), RV_REG_T0, 0, 0), ctx);
> +				break;
> +			case BPF_XCHG:
> +				emit(rv_amoswap_w(fetch_reg, lo(rs), RV_REG_T0, 0, 0), ctx);
> +				break;

Do the aq=0, rl=0 arguments provide the correct memory ordering for the
FETCH variants and XCHG?

Looking at the BPF specification in include/linux/filter.h, these BPF
atomic operations map to Linux kernel atomic_fetch_* and atomic_xchg
primitives, which require full memory ordering.

The RV64 BPF JIT in arch/riscv/net/bpf_jit_comp64.c emits these same
operations with aq=1, rl=1 for FETCH variants and XCHG:

  case BPF_ADD | BPF_FETCH:
      emit(is64 ? rv_amoadd_d(rs, rs, rd, 1, 1) :
           rv_amoadd_w(rs, rs, rd, 1, 1), ctx);

  case BPF_XCHG:
      emit(is64 ? rv_amoswap_d(rs, rs, rd, 1, 1) :
           rv_amoswap_w(rs, rs, rd, 1, 1), ctx);

The kernel's arch_atomic_fetch_add in arch/riscv/include/asm/atomic.h also
uses amoadd.w.aqrl (which corresponds to aq=1, rl=1).

With aq=0, rl=0, the atomic operations use relaxed memory ordering, which
could allow loads and stores to move across the atomic. Could this cause
BPF programs using atomic_fetch_*/atomic_xchg on RV32 to observe
memory-ordering violations that wouldn't occur on other architectures?

Note: For the non-FETCH variants of BPF_ADD/AND/OR/XOR (the return-void
operations), aq=0, rl=0 appears correct since those map to relaxed
atomic primitives.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/25109627626
--===============3577337078344571119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3577337078344571119==--

