Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BE2C5DF85
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 09:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lIrk7imKDc128mlTESNNSWKqciXHjUqKq0iEBJ9YIE=; b=U55Y/8ZPvfB5FdLyWBaZNpW40D
	YI7uM+FMzhxiJvMcr6qH9NAeeXb7SjiZTWQgy/sM5Ef8l/7wag7YEos4YeJrvCAwMV0b51aN8+ljt
	r+XYup13MK9P/63UncvQKW8lCGGp8XtehbXyJy2d+hW9PIoX0VKqmLsRpMKNGVHC3dP2ikIrReOOV
	oBEQe/4F+7PZ0t/hViS7d8FNfEWRFC9dPv3KXToFFxNRVzgc2pSVN75xTYB1MP216UYpkuNyAKYYZ
	WoQQL/BoIUkiNWk0XYzWYdB1X7G+x88UUG72yzyZ0o8w0/8FUvyS6J3q4NgH0lL6oqkOpJIgr0nNt
	9ExQo/lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcjW-00000009QZ6-3EHs;
	Wed, 19 Aug 2026 09:37:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcjV-00000009QYT-0RZ0
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 09:37:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 19F614096E;
	Wed, 19 Aug 2026 09:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 801D21F000E9;
	Wed, 19 Aug 2026 09:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787132236;
	bh=fJyoGP3XrQkM2JSSX+2B6BjxD7+I7azMU6AfMEN4XO8=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=mZf4dKXt+JxLXKKzkZzp7KFmsjX4X0lXTiZ8DJZp9K5kxGopcmYfkd2ACAlqn29Yv
	 +Vm2WPhmpPrpqpBUT+YPULtrzu4/NfiCX7AdpRjGsBpr1CFHQWhOSSb4GF4X2WVaZI
	 XfYKDlojX8jExZ/v/QGLJF34VrrqbHiS7dDTCykg+JHkauna9rk1slBzOgpdj8xpfH
	 0n3hnpVy9l/TtndPBpOLBBNALw0C9IQUN6tssFnvD5OVQ4Wqs2K8qkexDP3gLiMFdo
	 npLytyEKw9mScsbXewMidpeZF8cguRilxIk4kC0RtobkSnzshHpUH6F+ciypCAoa9i
	 9sGNIIpd9rFNg==
Content-Type: multipart/mixed; boundary="===============7477287384193181481=="
MIME-Version: 1.0
Message-Id: <f6d031ece454ad8a2a3e09bbdf48d9030c74cb6741f76aabf58bf7af1931abfd@mail.kernel.org>
In-Reply-To: <a78cd29b238aa1aba87efeb2fc09d25a56c22f69.1787128322.git.cp0613@linux.alibaba.com>
References: <a78cd29b238aa1aba87efeb2fc09d25a56c22f69.1787128322.git.cp0613@linux.alibaba.com>
Subject: Re: [PATCH bpf-next v2 1/2] bpf, riscv: Add support for signed arena loads
From: bot+bpf-ci@kernel.org
To: cp0613@linux.alibaba.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,memxor@gmail.com,bjorn@kernel.org,puranjay@kernel.org
Cc: ihor.solodrai@linux.dev,eddyz87@gmail.com,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,emil@etsalapatis.com,pulehui@huawei.com,pjw@kernel.org,palmer@dabbelt.com,shuah@kernel.org,guoren@kernel.org,bpf@vger.kernel.org,linux-riscv@lists.infradead.org,linux-kselftest@vger.kernel.org,linux-kernel@vger.kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Wed, 19 Aug 2026 09:37:15 +0000 (UTC)
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

--===============7477287384193181481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index 74efe4b138d2..56196b001286 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c

[ ... ]

> @@ -1908,13 +1910,19 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>  	case BPF_LDX | BPF_PROBE_MEM32 | BPF_H:
>  	case BPF_LDX | BPF_PROBE_MEM32 | BPF_W:
>  	case BPF_LDX | BPF_PROBE_MEM32 | BPF_DW:
> +	/* LDX | PROBE_MEM32SX: sign-extending arena load */
> +	case BPF_LDX | BPF_PROBE_MEM32SX | BPF_B:
> +	case BPF_LDX | BPF_PROBE_MEM32SX | BPF_H:
> +	case BPF_LDX | BPF_PROBE_MEM32SX | BPF_W:
>  	{
>  		bool sign_ext;
>
>  		sign_ext = BPF_MODE(insn->code) == BPF_MEMSX ||
> -			   BPF_MODE(insn->code) == BPF_PROBE_MEMSX;
> +			   BPF_MODE(insn->code) == BPF_PROBE_MEMSX ||
> +			   BPF_MODE(insn->code) == BPF_PROBE_MEM32SX;
>
> -		if (BPF_MODE(insn->code) == BPF_PROBE_MEM32) {
> +		if (BPF_MODE(insn->code) == BPF_PROBE_MEM32 ||
> +		    BPF_MODE(insn->code) == BPF_PROBE_MEM32SX) {
>  			emit_add(RV_REG_T2, rs, RV_REG_ARENA, ctx);
>  			rs = RV_REG_T2;
>  		}

This isn't a bug, but would the comment fit the surrounding style better as
an expression? The neighbouring case-group comments all spell the access
out in pseudo-code form:

    /* LDX: dst = *(unsigned size *)(src + off) */
    /* LDSX: dst = *(signed size *)(src + off) */
    /* LDX | PROBE_MEM32: dst = *(unsigned size *)(src + RV_REG_ARENA + off) */
    /* ST | PROBE_MEM32: *(size *)(dst + RV_REG_ARENA + off) = imm */
    /* STX | PROBE_MEM32: *(size *)(dst + RV_REG_ARENA + off) = src */

Something like this would match the pattern:

    /* LDX | PROBE_MEM32SX: dst = *(signed size *)(src + RV_REG_ARENA + off) */


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/32235574103
--===============7477287384193181481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7477287384193181481==--

