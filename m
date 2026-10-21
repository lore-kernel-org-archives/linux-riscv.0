Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA98606A319
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 06:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lhx7W9wB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZlpfCuDz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppQCCGHTnZ4HOHbPuwev5gO4Rf4TZQlKVQm9DktnZmI=; b=Lhx7W9wBmR+pNaLnl9Wt5LgkGP
	EN7eVsmGLRwDaNxbvCrwdZMC/BEoD+tetIgm/1Tiz3nfWSi3goHSV2ZkwaqZeHCiT5lND8bXioo4I
	CSLrJ5W2NHZsSu0a0gS3Qk4ooA09Zjc9AN8TyMA5Qn0gkbRjRLcQGTI2htzDwE1CRCrEgpaiZohy9
	a6jmwk83Icp10/P6gWWYuvPocv0LK+7Uh9wtynRtz1h5wpC9TGwwkwq46TykBQcVtz5ft0CS1nt94
	I3a2n4DHlVf/YFmz2xFgRjRF3KFTRjWmoiQuijg/xX+m8MNYufIYah9vCNha+sF4UoAK51TTqghOk
	/5YRoYAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPc6-0000000B9yB-1CT2;
	Wed, 21 Oct 2026 06:15:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPc4-0000000B9xx-0u7X;
	Wed, 21 Oct 2026 06:15:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A024F4382B;
	Wed, 21 Oct 2026 06:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36271F000C9;
	Wed, 21 Oct 2026 06:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792563347;
	bh=NE6FODam8Y7torIkBq54ShtdSgWpLFBkxmVPgOM97Y0=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=ZlpfCuDz9DktGxquPoD47fDuegagqTC+8TMUopcdjmjJoKn/9B9qXwlflzzjqXoui
	 TX+FEMbLmX7o1R4ezKKM8Eqj1Kq61xBv14gu3mA4o2KRLsYRQtgNvgh5QOkMq38dXp
	 9crrqBTNujdEaOj3GR+yYJdV6jMHqEvngqY0Dtk6dcclBTM6FpkHqOuw5j48GNTsxq
	 Roq4V5fFgCtxlBMqjogysyrThlB/dvisoCi6GDuGvH8S5mkGpjhXEekE5ICe6hpUBG
	 KfnKFZ+GmCyRwhW+QcdzPKr4tsZIbLNunaSkQV88kvTAgSc9XkhnXudfodi5mQCc0H
	 vphogldSkhgOQ==
Content-Type: multipart/mixed; boundary="===============8716026043077091956=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <ade7e1bd9d4c7a3975fed8e1bea08fd66cf1b03c9c7df26f4f9fe07d36187dfa@mail.kernel.org>
In-Reply-To: <20261021-bpf-hmul-v2-1-88e260099f7d@outlook.com>
References: <20261021-bpf-hmul-v2-1-88e260099f7d@outlook.com>
Subject: Re: [PATCH bpf-next v2 1/8] bpf: Add UHMUL and SHMUL instructions
From: bot+bpf-ci@kernel.org
To: tangyazhou@zju.edu.cn,bpf@vger.kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,eddyz87@gmail.com,memxor@gmail.com,void@manifault.com,bpf@ietf.org
Cc: john.fastabend@gmail.com,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,emil@etsalapatis.com,ihor.solodrai@linux.dev,qmo@kernel.org,puranjay@kernel.org,xukuohai@huaweicloud.com,bjorn@kernel.org,pulehui@huawei.com,catalin.marinas@arm.com,will@kernel.org,mark.rutland@arm.com,linux-arm-kernel@lists.infradead.org,linux-riscv@lists.infradead.org,list+bpf@vahedi.org,linux@armlinux.org.uk,yangtiezhu@loongson.cn,hengqi.chen@gmail.com,johan.almbladh@anyfinetworks.com,paulburton@kernel.org,James.Bottomley@HansenPartnership.com,deller@gmx.de,hbathini@linux.ibm.com,chleroy@kernel.org,naveen@kernel.org,luke.r.nels@gmail.com,xi.wang@gmail.com,iii@linux.ibm.com,hca@linux.ibm.com,gor@linux.ibm.com,davem@davemloft.net,udknight@gmail.com,kuba@kernel.org,corbet@lwn.net,linux-doc@vger.kernel.org,ziye@zju.edu.cn,tangyazhou518@outlook.com,shenghaoyuan0928@163.com,ast@kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,
 yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Wed, 21 Oct 2026 06:15:46 +0000 (UTC)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8716026043077091956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> bpf: Add UHMUL and SHMUL instructions

TL;DR: Verifier still rejects UHMUL/SHMUL (off 1/2), so the new interpreter
code is unreachable; once enabled, JITs and range tracking would silently use
low-half multiply. Should the UAPI wait for the full series?

> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> index f29b0aad440c..90c30e5d790b 100644
> --- a/include/uapi/linux/bpf.h
> +++ b/include/uapi/linux/bpf.h
> @@ -34,6 +34,12 @@
>  #define BPF_FROM_LE	BPF_TO_LE
>  #define BPF_FROM_BE	BPF_TO_BE
>
> +/* BPF_MUL off values for high-half multiplication; BPF_ALU64 only. */
> +enum bpf_mul_variant {
> +	BPF_UHMUL = 1,
> +	BPF_SHMUL = 2,
> +};
> +
>  /* jmp encodings */

Can a program that uses these new encodings be loaded at all with only this
patch applied?

check_alu_fields() in kernel/bpf/verifier.c is not touched, and it still
rejects any BPF_MUL with a non-zero off:

    case BPF_MUL:
    case BPF_DIV:
    case BPF_MOD:
        if (BPF_SRC(insn->code) == BPF_X) {
            if (insn->imm != 0 || (insn->off != 0 && insn->off != 1) ||
                (insn->off == 1 && opcode != BPF_MOD && opcode != BPF_DIV)) {
                verbose(env, "BPF_ALU uses reserved fields\n");
                return -EINVAL;
            }
        } else if (insn->src_reg != BPF_REG_0 ||
               (insn->off != 0 && insn->off != 1) ||
               (insn->off == 1 && opcode != BPF_MOD && opcode != BPF_DIV)) {

Both off == 1 (UHMUL) and off == 2 (SHMUL) fail with "BPF_ALU uses reserved
fields".

That means the UHMUL/SHMUL arms of ALU64_MUL_X and ALU64_MUL_K in
___bpf_prog_run() cannot run, and BPF_UHMUL/BPF_SHMUL describe encodings the
kernel refuses.  bpf_insn_is_hmul() in include/linux/filter.h has no callers
anywhere in the tree, and bpf_is_hmul_variant() is only called by it, so both
are currently dead code.

The commit message mentions interpreter support, but does not say that the
verifier change is left for later.

When the verifier is relaxed, the JITs and the range tracking will also need
attention.  The JITs ignore insn->off for BPF_MUL today; for example
arch/x86/net/bpf_jit_comp.c emits a plain imul for
"case BPF_ALU64 | BPF_MUL | BPF_K/X".  adjust_scalar_min_max_vals() models
BPF_MUL as a low-half multiply.  Without changes there, JITed programs would
silently compute the low half and the verifier's bounds would not match the
real result.

Should the UAPI constants and the divmul64v2 group wait until verifier, JIT
and selftest support land in the same series, or should the unused
bpf_insn_is_hmul() be dropped from this patch?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/39552088777
--===============8716026043077091956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8716026043077091956==--

