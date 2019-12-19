Return-Path: <SRS0=oSsB=2J=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4109C43603
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2019 22:03:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73BEE24679
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2019 22:03:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iB3hvSqP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="usI1/nTX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73BEE24679
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:References:
	In-Reply-To:To:Subject:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Ehfo2bIiqQ+sIDTvyxCSm9TkTj7s8Fi170nwe2flnE=; b=iB3hvSqPocePRz
	d+zplSk1eEgZjYPfGfaXnnrgpO2OtonVAbGgkq/L+ThmZ611g25iFJ4H/tO+LLvWroVjMXjuCVU+2
	hTeHXT3hV8enuYHdHy2yYs7RBpk+9W+Vf/S8ZzqRGmxy721wvTwIGe1yQ0x7EkWWvZyFQRC5Zko5+
	rDD53Qh2DFn6uG3cUPvY8UDy7SAiPzk/Rn2rkTzJ8X0HNWBkJWYR72PXRJQN7+3qd9xtP/FWkV3cS
	iJR+7vXma1lyM1bSLrbmVUGvD8Sr9MsVxNR9zqPnHFXALiQEnuOB88SdpcViIgMwTzcb0+037Jwet
	eKdjz6ucmdXGLNdzg5Aw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ii3th-0002WC-Fp; Thu, 19 Dec 2019 22:03:53 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ii3pL-0001OM-78
 for linux-riscv@lists.infradead.org; Thu, 19 Dec 2019 21:59:24 +0000
Received: by mail-pg1-x541.google.com with SMTP id q127so3856625pga.4
 for <linux-riscv@lists.infradead.org>; Thu, 19 Dec 2019 13:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=6Ehfo2bIiqQ+sIDTvyxCSm9TkTj7s8Fi170nwe2flnE=;
 b=usI1/nTXIk8Z/gSwygrvaZBlgzgppv+K3Hz6NTS7ljeWRl0Xox2q386TddizyFxw4j
 K/WOP9/7IMpa4DbaQKNKFvlB4iwthHzszRVmnjSoAhHAYRu6MfsgjNeKFRfDzLuJo64d
 OMSybscVZmdIlroMzjigcDdMDb4V/BpV45IyaGJglkMPmGbph0F2sPf/zlKPO65bDHPC
 VrsoSTgXeKjp2DikIqzgVPkIAzJq12UTv0/mX31LeAhAn0Hd+W0PqCWr3hGCjjqm0Wa+
 cpiWYlXu+dWOCYaCXRjcbWxItlGEFtygNwpSfR7oy0BwfSBb6HTpcGGuMsSa/22TphXI
 jL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=6Ehfo2bIiqQ+sIDTvyxCSm9TkTj7s8Fi170nwe2flnE=;
 b=Pf+AVh6dFV2lF/OgDGxR756NiqGftqp84GcVkH8bbcXTt1qyFrOtVdJsGp6f8uJv/7
 iyFsDYGtVUqf/arwHGD+l3MzfCkl7obzgQghQVX/rn/6Dz8MXgqDTh1/fLcASrvrTbaM
 OhkJJAkY++VqI04ukgM6I6Q9Ao3SAkr1/5FCrvBzm/uyCCFr9+ouRPpmKtpjP2KevSg+
 p97pOIqH/9c1ZU301ZM3a70Pw4NKSOv15HXNgh34Kp0iC4ZmQKT5ztmBJ8CFuOiD+cWB
 6GQd5uZDMGGXVLF5w9DEryPv+2FkhtAkz+B3Tiy+ASdqbjkUfY0OVEP8S8j06w5FbgkE
 RlSg==
X-Gm-Message-State: APjAAAVZCvXYECJS44wTqLRlPoTrcKOdjGn+krfKCLfijJQPpXY4rTZH
 LAKWBBw/6wWDZc/dvxiWh7iT7g==
X-Google-Smtp-Source: APXvYqw96pcjWcaRBv5UVQ/YmpzGjtRFsYGAGBURRzHdWjAru25h6ZAeXguhwKHtgA6mCLGg9srY2w==
X-Received: by 2002:a63:28c7:: with SMTP id
 o190mr11008375pgo.394.1576792759540; 
 Thu, 19 Dec 2019 13:59:19 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id k4sm9325902pfk.11.2019.12.19.13.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 13:59:19 -0800 (PST)
Date: Thu, 19 Dec 2019 13:59:19 -0800 (PST)
X-Google-Original-Date: Thu, 19 Dec 2019 13:59:14 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH bpf-next 1/8] riscv, bpf: fix broken BPF tail calls
To: Björn Töpel <bjorn.topel@gmail.com>
In-Reply-To: <20191209173136.29615-2-bjorn.topel@gmail.com>
References: <20191209173136.29615-2-bjorn.topel@gmail.com>
 <20191209173136.29615-1-bjorn.topel@gmail.com>
Message-ID: <mhng-dcf9c2f9-7955-4645-a229-d31bbaf96127@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_135923_412856_127062C6 
X-CRM114-Status: GOOD (  15.17  )
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

On Mon, 09 Dec 2019 09:31:29 PST (-0800), Björn Töpel wrote:
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

and I'm assuming these are going in through a BPF tree, so also

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

but LMK if you want it through the RISC-V tree.

