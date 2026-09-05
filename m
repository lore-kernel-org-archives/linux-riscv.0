Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6581C624D3
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2026 09:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hAP3QvFVBokvXefXWgAJRT02QJSXZqGLD4nkUDQWA8g=; b=EU/ct6uyj0T1+LA+zyAoyhteXA
	6Rl3gHiE6ovzc5beAp4b8w6JP5r9oT1MQ0G7PwzSvXsi/6+15t3ln5YGrbl9X4ayhu+wb5bOnpbXC
	6oj2MQR1+4TQXL7TkANQVMjTUItkGHyXSaetBLaR2RI+1agpSCdey6bT8k60FAZmnSYOSiUIitcDw
	dwU37DuiUu0Tkr/eTIS68lVyONvvjRNI6s4ZiU4LdICzz9O4d4rfhzdgmsApaZAOF362HL41dzPJp
	CnTsOfqzW1xYblH51TSPY4jLxPUwT+BYufHqt8PX9e/WibKBhwnYAMMz1lI/TX8hcpWRoo92ZcFr1
	hWA+hsig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mum-00000003vgB-12Nd;
	Sat, 05 Sep 2026 09:42:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mul-00000003vfz-2Xdl
	for linux-riscv@lists.infradead.org;
	Sat, 05 Sep 2026 09:42:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B57F41681;
	Sat,  5 Sep 2026 09:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0C01F00A3D;
	Sat,  5 Sep 2026 09:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788601342;
	bh=B8Y2rAUG7l88XaslxhRTBj2YtQofEUkAHS4QEmuoXbc=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=Ldkq4WDV7VFFYgBjpbKOcYBa81/2J1vPsZrFNIS2clOIS1owNFWpc9CbTS4O4BCjq
	 JhtbC/L2toaKKvBDeEGLKj8KN3TL1lN24GigBpE5lLJobU8sgd++n0fIQxzGVInlM+
	 /mN4FgIA8C+FhePSUlJ/X+o89u5Bl5676bLiOjo/h9DP4lHPM7w7GiJfr6+8AU+eP6
	 AmvSzJeyqLiVSaJpoMZwL6Rz+6WqRFBtbCFBgcfKr8ZNjw7PdFsK9L+rnkYfNoRscw
	 y06PsAbJlQDEv0HeMrmDgSCnMDpaz1DFah71bMv3fVPKgSz5nHjG0p2AeAuSVJR2n5
	 5vvWoSSXJeFSQ==
Content-Type: multipart/mixed; boundary="===============7321251172833199913=="
MIME-Version: 1.0
Message-Id: <f7ac0b75cec70f36753ef48c97ffdca950d7c92632a74aa24187b9c076b7f115@mail.kernel.org>
In-Reply-To: <20260905085857.14143-2-pulehui@huaweicloud.com>
References: <20260905085857.14143-2-pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf-next v5 1/3] riscv, bpf: Remap BPF_REG_0 and RV_REG_TCC
From: bot+bpf-ci@kernel.org
To: pulehui@huaweicloud.com,bpf@vger.kernel.org,linux-riscv@lists.infradead.org,linux-kernel@vger.kernel.org,jiangfeng@kylinos.cn
Cc: bjorn@kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,eddyz87@gmail.com,memxor@gmail.com,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,emil@etsalapatis.com,ihor.solodrai@linux.dev,puranjay@kernel.org,pjw@kernel.org,palmer@dabbelt.com,alex@ghiti.fr,pulehui@huawei.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Sat,  5 Sep 2026 09:42:20 +0000 (UTC)
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

--===============7321251172833199913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index e7378be171a9..fc1c8c5480b6 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -23,11 +23,11 @@
>  /* fentry and TCC init insns will be skipped on tailcall */
>  #define RV_TAILCALL_OFFSET ((RV_FENTRY_NINSNS + 1) * 4)
>
> -#define RV_REG_TCC RV_REG_A6
> +#define RV_REG_TCC RV_REG_T5
>  #define RV_REG_ARENA RV_REG_S7 /* For storing arena_vm_start */
>
>  static const int regmap[] = {
> -	[BPF_REG_0] =	RV_REG_A5,
> +	[BPF_REG_0] =	RV_REG_T6,
>  	[BPF_REG_1] =	RV_REG_A0,
>  	[BPF_REG_2] =	RV_REG_A1,
>  	[BPF_REG_3] =	RV_REG_A2,

This isn't a bug, but does moving BPF_REG_0 to t6 affect code density?
arch/riscv/net/bpf_jit.h:is_creg() only accepts fp, s1, and a0-a5 for
RVC-compressible forms. With CONFIG_RISCV_ISA_C, every emitter that gates
on is_creg() now falls back to 4-byte instructions whenever BPF R0 is the
destination or base register. Since R0 holds return values and helper
results, could this measurably grow JIT image size for R0-heavy code?

The changelog explains why a5 and a6 needed to be freed, but it doesn't
mention why t6 and t5 were chosen. Could a sentence be added about the
register selection rationale, particularly since t4 appears unused by
the JIT?

> @@ -47,13 +47,13 @@ static const int pt_regmap[] = {
>  	[RV_REG_A2] = offsetof(struct pt_regs, a2),
>  	[RV_REG_A3] = offsetof(struct pt_regs, a3),
>  	[RV_REG_A4] = offsetof(struct pt_regs, a4),
> -	[RV_REG_A5] = offsetof(struct pt_regs, a5),
>  	[RV_REG_S1] = offsetof(struct pt_regs, s1),
>  	[RV_REG_S2] = offsetof(struct pt_regs, s2),
>  	[RV_REG_S3] = offsetof(struct pt_regs, s3),
>  	[RV_REG_S4] = offsetof(struct pt_regs, s4),
>  	[RV_REG_S5] = offsetof(struct pt_regs, s5),
>  	[RV_REG_T0] = offsetof(struct pt_regs, t0),
> +	[RV_REG_T6] = offsetof(struct pt_regs, t6),
>  };

[ ... ]


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/33956847598
--===============7321251172833199913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7321251172833199913==--

