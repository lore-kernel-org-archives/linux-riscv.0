Return-Path: <SRS0=oSsB=2J=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B634AC43603
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2019 22:04:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DB2A24679
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2019 22:04:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pBc3vGHl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="j80Cr9GQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DB2A24679
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:References:
	In-Reply-To:To:Subject:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bKgL4pbQfM0dd1alcLrMBhWA81SjBoUW0YMvB1m0mhs=; b=pBc3vGHlTaSDQt
	WkRTgnniDhBVSG3lkncPyiRorpWtnFny8Y7V8Z2WUX+3tjA2c2WKMC3LxYFhJlacsE6yXF+ICj0Hs
	1YSPKIgYnZzYJufdBZw5lWJQoRWUL92Vq2p7ZBvBvYrPr+6Rll9zUNdQNQhL303bYDw3jImjzvras
	P5oWIfya+2M62vkKzcQl7yK9bolpvWdETWGjS04XwsRE1kD4J5UUDfA2udVeqhYMpl6sQzF1126Vb
	1XoUeYR3zwpPYfL/J3evTfQPLIK5tftJfua31BiaQ2z2HQT5OUwHkUHI0bSbQCIs9g7NxJvS3gV0E
	uAuAOmyVQG8en4MsJeUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ii3tt-0002sK-Mu; Thu, 19 Dec 2019 22:04:05 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ii3s4-0007ov-D2
 for linux-riscv@lists.infradead.org; Thu, 19 Dec 2019 22:02:13 +0000
Received: by mail-pl1-x641.google.com with SMTP id y8so3170831pll.13
 for <linux-riscv@lists.infradead.org>; Thu, 19 Dec 2019 14:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=bKgL4pbQfM0dd1alcLrMBhWA81SjBoUW0YMvB1m0mhs=;
 b=j80Cr9GQ6ON9PDKtp65tjd/eOCPtISiuD/UTjntHh/Dob6GWBmSxAljmxz12FN4AeN
 3dP31I7iCbTfgCcsnON8wRJlyjotc7hr6uiyrQz8/97tqBh05t1LXTK7HLhUJYjxymn9
 beVazQudecgQ+SeTM8eSwbc89PNgxJW4j7wXk5Wm6g4O0tImEZOTJ51+5z7KVEshON+d
 Rv1ikEKezLiY7RqCUvYAi8vfdq6Zbj1RBL9YSN08m5AmWCmC2xCDUr5JGd++K8ie7DN2
 XKue4dlmOlmubTer2+Mc1zMdCD1P6WWyCnFRwgyfuvhpoxzZWTpl4742i5/2fDYiPVOe
 I9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=bKgL4pbQfM0dd1alcLrMBhWA81SjBoUW0YMvB1m0mhs=;
 b=A8WZbHsA1oaNbTCfadaoGmc7gJTSirFJ7+oCCmm7U1qeYtN2ukbQEoSbgAs5eukUlq
 ZTSpgF7omG/Fxc8aXf5EFK87eHUEx/BSvqkn/gMvNolpQNhM2sfutMGaXPiSMqifO7XT
 xNUmK+tR0eJmjAghsNeExv+pSdQ7/GaU+oIY7ECDJt6k1FsgiwUIqqAiKrfHAoUD2IgK
 pXXNLVzk1SN701P+Yt33khGIUYYIfkLB6lD6GPVTXGyJ+mWjECU+5iJnxHgEq+aIoJ+V
 YX3kIWLN3/g8mamksArYzDM7r+UHaQHsE/H8jp1YKF4ZInle2qheYNmDuLkDqI3EjxsY
 8dBw==
X-Gm-Message-State: APjAAAXLQ+E5O5MMmpHwHUiuBQ/gup6Zh0r3OkXLYLmxk89nztZxLG3M
 uqgeR/iJ3a6jaj2XmMNSy8ca6w==
X-Google-Smtp-Source: APXvYqw6QYUwunrlOw8RZix1Z5bsu3vtzr8xGUvVhBZcSQCIIhaB/YZ9hc4Yc5BJAwudduoI4UTepQ==
X-Received: by 2002:a17:90a:3aaf:: with SMTP id
 b44mr12372837pjc.9.1576792931450; 
 Thu, 19 Dec 2019 14:02:11 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id z10sm9494008pfa.184.2019.12.19.14.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 14:02:11 -0800 (PST)
Date: Thu, 19 Dec 2019 14:02:11 -0800 (PST)
X-Google-Original-Date: Thu, 19 Dec 2019 14:02:05 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH bpf-next v2 1/9] riscv, bpf: fix broken BPF tail calls
To: Björn Töpel <bjorn.topel@gmail.com>
In-Reply-To: <20191216091343.23260-2-bjorn.topel@gmail.com>
References: <20191216091343.23260-2-bjorn.topel@gmail.com>
 <20191216091343.23260-1-bjorn.topel@gmail.com>
Message-ID: <mhng-a8b020f4-3baf-41be-908b-1a843d659b1c@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_140212_498297_9A3AD1DA 
X-CRM114-Status: GOOD (  14.71  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: daniel@iogearbox.net, netdev@vger.kernel.org, ast@kernel.org, Björn Töpel <bjorn.topel@gmail.com>, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 16 Dec 2019 01:13:35 PST (-0800), Björn Töpel wrote:
> The BPF JIT incorrectly clobbered the a0 register, and did not flag
> usage of s5 register when BPF stack was being used.
>
> Fixes: 2353ecc6f91f ("bpf, riscv: add BPF JIT for RV64G")
> Signed-off-by: Björn Töpel <bjorn.topel@gmail.com>
> ---
>  arch/riscv/net/bpf_jit_comp.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/net/bpf_jit_comp.c b/arch/riscv/net/bpf_jit_comp.c
> index 5451ef3845f2..1606ebd49666 100644
> --- a/arch/riscv/net/bpf_jit_comp.c
> +++ b/arch/riscv/net/bpf_jit_comp.c
> @@ -120,6 +120,11 @@ static bool seen_reg(int reg, struct rv_jit_context *ctx)
>  	return false;
>  }
>
> +static void mark_fp(struct rv_jit_context *ctx)
> +{
> +	__set_bit(RV_CTX_F_SEEN_S5, &ctx->flags);
> +}
> +
>  static void mark_call(struct rv_jit_context *ctx)
>  {
>  	__set_bit(RV_CTX_F_SEEN_CALL, &ctx->flags);
> @@ -596,7 +601,8 @@ static void __build_epilogue(u8 reg, struct rv_jit_context *ctx)
>
>  	emit(rv_addi(RV_REG_SP, RV_REG_SP, stack_adjust), ctx);
>  	/* Set return value. */
> -	emit(rv_addi(RV_REG_A0, RV_REG_A5, 0), ctx);
> +	if (reg == RV_REG_RA)
> +		emit(rv_addi(RV_REG_A0, RV_REG_A5, 0), ctx);
>  	emit(rv_jalr(RV_REG_ZERO, reg, 0), ctx);
>  }
>
> @@ -1426,6 +1432,10 @@ static void build_prologue(struct rv_jit_context *ctx)
>  {
>  	int stack_adjust = 0, store_offset, bpf_stack_adjust;
>
> +	bpf_stack_adjust = round_up(ctx->prog->aux->stack_depth, 16);
> +	if (bpf_stack_adjust)
> +		mark_fp(ctx);
> +
>  	if (seen_reg(RV_REG_RA, ctx))
>  		stack_adjust += 8;
>  	stack_adjust += 8; /* RV_REG_FP */
> @@ -1443,7 +1453,6 @@ static void build_prologue(struct rv_jit_context *ctx)
>  		stack_adjust += 8;
>
>  	stack_adjust = round_up(stack_adjust, 16);
> -	bpf_stack_adjust = round_up(ctx->prog->aux->stack_depth, 16);
>  	stack_adjust += bpf_stack_adjust;
>
>  	store_offset = stack_adjust - 8;

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

