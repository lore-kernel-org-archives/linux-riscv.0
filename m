Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9168C4452B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 19:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lIHsWUAUDO5nX4gkTmYzY8EE/CwnFDXGCT5b3QK86pg=; b=NvqoZAR5R/wjXiYmZCINZVxu9d
	jzlk8VPPTQgCu+BRTMxB1Yf/elUjRFRxp9QnL7F4K5JQiqSP1IjUP0nNZklkC37JgdsgfVtXZ1F0a
	VV9LFjAjEDGuaq12YVlAm2u4+2hSRnVpyskwThRM2NOpw1n9ZupvDpvGCSE9b1fwYhQpSrf65WRI5
	Ke3tcThsKfhnsOZvNAOTuPWlC7TTR5xPxXfkVmNxZFfLUPq6XQB4MH7ZIqCXY8V695EVuxRB9ddju
	HXjzj0Jxfz+PCgskLl3fdBT5XGlnH3tV97wKFXLMj6ovGMK5ecILBVOw7gG2EBXYBpA8k+T7AeTwv
	/tTFpzHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmFoi-0000000AG1F-0BjY;
	Tue, 21 Jul 2026 19:07:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmFoe-0000000AG0Z-2lJ6
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 19:07:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A2E343EE8;
	Tue, 21 Jul 2026 19:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF631F00A3D;
	Tue, 21 Jul 2026 19:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784660864;
	bh=jO0/2cUFSfJfUInWRqnTQm+AnMMMe2mlsvbtLOiV2H8=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=AoW4YXVJ02vy+5ip6lVnZK+SxEM4rmbC7U/LNlCfV/Ru4FqkriBu4ADmsVeftBIFQ
	 7HYaBpI60RG6mVsCls8XTlQTyI/PVHT/j6+oStbYKm53tB6W7EPWJthJ+1HYyu0Rzj
	 FAppWci30c3pA7p76RpgrmzGmzG7FNvxwwfC8AcFl+8BjZsN0scUDjK3uz6NEI8NwE
	 j9E2Jdntv89xqNrkoKWeTF0iM/RHRbl+Bn6K0wPbKJlqLxCNW3hfN63yKnZi4gdvn5
	 hGy2KFwugwKn4hUX8x/8tDuB3uIC/LFos5y7gbLVGX51Pc5hromZyTxxPD9rSRVo5Q
	 4JAqmlg2noq2Q==
Content-Type: multipart/mixed; boundary="===============6575185754722284764=="
MIME-Version: 1.0
Message-Id: <1873dbb2968fcd362a2704fbd8ddda4c2240c8f6ab061cb6f1d352b7e657b74a@mail.kernel.org>
In-Reply-To: <20260715-riscv-bpf-timed-may-goto-v3-1-cf2a9c3d843f@kylinos.cn>
References: <20260715-riscv-bpf-timed-may-goto-v3-1-cf2a9c3d843f@kylinos.cn>
Subject: Re: [PATCH v3 1/2] bpf, riscv: add support for timed may_goto
From: bot+bpf-ci@kernel.org
To: jiangfeng@kylinos.cn,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,eddyz87@gmail.com,memxor@gmail.com,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,emil@etsalapatis.com,luke.r.nels@gmail.com,xi.wang@gmail.com,bjorn@kernel.org,pulehui@huawei.com,puranjay@kernel.org,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu,alex@ghiti.fr,shuah@kernel.org
Cc: bpf@vger.kernel.org,linux-riscv@lists.infradead.org,linux-kernel@vger.kernel.org,linux-kselftest@vger.kernel.org,jiangfeng@kylinos.cn,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Tue, 21 Jul 2026 19:07:43 +0000 (UTC)
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

--===============6575185754722284764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/riscv/net/Makefile b/arch/riscv/net/Makefile
> index 9a1e5f0a94e5..6458d4d51990 100644
> --- a/arch/riscv/net/Makefile
> +++ b/arch/riscv/net/Makefile

[ ... ]

> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index 2f1109dbf105..ca9d0e811aea 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -1834,7 +1834,13 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>  		if (ret)
>  			return ret;
>
> -		if (insn->src_reg != BPF_PSEUDO_CALL)
> +		/*
> +		 * arch_bpf_timed_may_goto() is emitted by the verifier and
> +		 * returns its result in BPF_REG_AX instead of BPF_REG_0, so
> +		 * skip the normal "move return register into R0".
> +		 */
> +		if (insn->src_reg != BPF_PSEUDO_CALL &&
> +		    addr != (u64)arch_bpf_timed_may_goto)
                    ^^^^

This isn't a bug, but could this fit on one line? The 100-character line
limit would allow the full condition without the break.

[ ... ]


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/29858413299
--===============6575185754722284764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6575185754722284764==--

