Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75589C9830C
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 13:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RsMm9JY18V9PYFWc/e2Zek17GqE4U83moL9Jefyt1ew=; b=vox7KivOG4JNjwCR648Dl01uda
	nIXGL1ONVfx1UMNIwdHPkXU2CPvk+hEqdR67Vr/1KSuaznn1tRHSSrVS4F3n040WFB1tAgqG7P8Cq
	4FY/B410robA+vU4X2Re6Vva2ymt3DIaZRXRy+xIyQc7VtjpCiddZbN9IB/8pwzCll6P1wAAsjzXD
	uKvKkRblPfVmMl33UGdVS8yGqTDukoSjPp2pmm00cDh+2oS2torijBVlsxFcg0RHA2WUtJ71zi4xJ
	yuIK/oVY5ism4zMksY+adVd7Ug1Ee6FHt4iW2X+UAUP/xtHpCHZdV8pV5pSA+ouLQYWvSxq793gkq
	heFH9PDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9NSB-00000008T5n-32x8;
	Wed, 23 Sep 2026 13:56:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9NSA-00000008T5Y-0Qww
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 13:56:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 61C4C6020A;
	Wed, 23 Sep 2026 13:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1CFE1F008A0;
	Wed, 23 Sep 2026 13:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790171765;
	bh=/RkMoEre4s0cWwdK8pJI3qLzangpGPybRLGHnZa2kcY=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=bsXP6fbu3tADeWx3UZmNQmxUeu+hk9l2AVXYnpdgrU3Sq/eDl0cuboXcSTq4mhGNI
	 MOIzvLFdgmt9DrQVWJeKBqpO0moXOBvv0mGWYee61ztRmuhYkGEeJcVX6sU6DFdSYo
	 /V7BX2I9LFamNA3TSFBCplKficQd7ppVMaWcpGfzfWfbGzxy1tUMp+l9xrHgKIGNMh
	 ZJV+o5oZfHCuuFdogX6L0rLnOOJfn0g2Pkby6zAN1/yGOy5R5TWINFzYmlixcbOnYS
	 TSmaWvjVMHMPWjesbsstMqxKgUSSDAKBlC3HAyS1yinqrLA2fHVjqzkZYNYw5ewc68
	 6B2/b+tp6PHUw==
Content-Type: multipart/mixed; boundary="===============8758721912312969620=="
MIME-Version: 1.0
Message-Id: <d96c63f73df29f7a250296c2734afc94f516716f270e51e33e311691010c6a34@mail.kernel.org>
In-Reply-To: <20260923130856.1157-2-cp0613@linux.alibaba.com>
References: <20260923130856.1157-2-cp0613@linux.alibaba.com>
Subject: Re: [PATCH bpf-next 1/2] bpf, riscv: Add support for indirect jumps
From: bot+bpf-ci@kernel.org
To: cp0613@linux.alibaba.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,memxor@gmail.com,bjorn@kernel.org,puranjay@kernel.org
Cc: ihor.solodrai@linux.dev,eddyz87@gmail.com,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,emil@etsalapatis.com,pulehui@huawei.com,pjw@kernel.org,palmer@dabbelt.com,shuah@kernel.org,guoren@kernel.org,bpf@vger.kernel.org,linux-riscv@lists.infradead.org,linux-kernel@vger.kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Wed, 23 Sep 2026 13:56:02 +0000 (UTC)
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

--===============8758721912312969620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index ed0a6f871dea..9de3749fb268 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c

[ ... ]

> diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
> index 2fb0b4e198b9..15acf249fed4 100644
> --- a/arch/riscv/net/bpf_jit_core.c
> +++ b/arch/riscv/net/bpf_jit_core.c

[ ... ]

> @@ -176,6 +179,15 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
>  		for (i = 0; i < prog->len; i++)
>  			ctx->offset[i] = ninsns_rvoff(ctx->offset[i]);
>  		bpf_prog_fill_jited_linfo(prog, ctx->offset);
> +
> +		/*
> +		 * bpf_prog_update_insn_ptrs() wants the start of each insn, so
> +		 * shift the linfo array by one and get insn 0 from the prologue.
> +		 */
> +		for (i = prog->len - 1; i > 0; i--)
> +			ctx->offset[i] = ctx->offset[i - 1];
> +		ctx->offset[0] = ninsns_rvoff(ctx->prologue_len);
> +		bpf_prog_update_insn_ptrs(prog, ctx->offset, jit_data->ro_image);
>  out_offset:
>  		kvfree(ctx->offset);
>  		kfree(jit_data);

This isn't a bug, but could the comment say "shift ctx->offset[] by one"
rather than "shift the linfo array by one"? The jited_linfo was already
filled in by the bpf_prog_fill_jited_linfo() call above, and it is the
JIT's own offset table that is being rewritten here.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/35866214591
--===============8758721912312969620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8758721912312969620==--

