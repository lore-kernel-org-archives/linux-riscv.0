Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66C3C47DD9
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2024 18:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mMYzltqip+qFCxn7aDI3hon6P8hbGwldabUEW82U9Tg=; b=vDMOMp9iycYdch
	jLD4Rk2rumGEl4UBn0dSsHUDdBMYD1B6YFtl22SW6ra02/BFjEWjTs1+lMPrmOM8ymXwu8bL6fNaP
	7YJ5ktHgaZzB4rhQlH5vJymVhISGVo/l9F+TSOD/NEfhXL8btyv7PZ+OM5lWEux/gAnmMO7/5tPcz
	PoreKo3Ap4889QFOkTvW5t28M7UMJpxRx20A0x2f+kNDotaFVoApIAn1xdbKmofqst72/nZql686p
	LwgbJQy6I0DorwaKsvZltrAcgd3MUbvjKflYkl6EKHqbn+LSoIiLCHNMWDCvE5GBAV5JssthVAx3Q
	tHCqlfBGXLRWNLFo136g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roSYX-0000000DCEG-2ahP;
	Sun, 24 Mar 2024 18:26:53 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roSYU-0000000DCD7-0Xzj
	for linux-riscv@lists.infradead.org;
	Sun, 24 Mar 2024 18:26:51 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-33ddd1624beso2233293f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 24 Mar 2024 11:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711304805; x=1711909605; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=u+Ls1dKkFPNQiQ9nFIFn5kDnUmZHvTMoqpHKOkVOgt0=;
        b=PYB4majFyvVQx/g4PRyu2BFJqmc8724n02BXFT3lkB0WFWRAY6h99BdK/iddROu+Ag
         k2QcrZEqi/bvoyBCQax4ZW8wBoejGpQ3wZ5Oo7ksYlyci05fPFsSKQAmgKUF965xCZBw
         wG9kNogyRgpBGYQiRMBaKJi3vna4T65iPfWbSbI2yJxMp2JOWFjpmRUvLkJhnNXGkPEo
         rWhCDfSEAMw7GUsTP9XY484wc7H2ot4qoUQwWPROzlkmBed21vRDPXJtnM0AKV/3ztiu
         E7y2PdBbWd/FRMPIKYxbFBLbVbZUK7xy2B5VARgLfTqGwXewX9+ctxE0F9r6OKPPtUxq
         m23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711304805; x=1711909605;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u+Ls1dKkFPNQiQ9nFIFn5kDnUmZHvTMoqpHKOkVOgt0=;
        b=cpkzSY+GWb8Lpss/WtXhru4+V0VB6IjVLnVdydAg9PQbYkR4RwNKjxs2WxIb4EBnkc
         x6NYnUqpQ99G2ar2VYfjAeMkhpsLDs5tmVBo7ljVb541fTw3jhlnnlQssdvFBpacD66V
         IkMOAdIYTJjAEHtzuvEEXT875YOWnROI0NJKg/rXop5yYTpbMcaA+11iZRnkGzCzZaDV
         eZO2HJbimaDZw7Vd1vzxEPz32xWp6XxM0mB/aLnOu/+tDnuHBe8I7V8GRHcL10trZsVj
         SmG1gDElD/Io3dzUylh7ojqbURfQHOgyXDMv3lpLxWre/c2evHd24vSz7pLx/nVIFDLS
         lryQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsxogANVkqJOXYhgKH8vsKxHQdxnbeuKXJBvu9BHUKqWLfpL/rS4JCFfRceWz7jagWb8x4Ao7XWcD+HK5p9PSnfbtCBI+KSbVellG2Eh3l
X-Gm-Message-State: AOJu0Yxh2uwRFzkIoQhInyWmZjh3wsgNm5rNmNmeVkDRYFaqo7OPbJ5D
	XZUyD0NlVbCog2/y5/zo4HgGT1W1VUWIkerhrjo8q0j/FKzJ3ud4
X-Google-Smtp-Source: AGHT+IGD+HLUBULsf54WlTfOv9yJoIGNmUIUl90i/TbwD7oaZnasbzE1t6knA4CbSmr+lj8G1d0lfQ==
X-Received: by 2002:adf:e348:0:b0:33d:8c9d:419 with SMTP id n8-20020adfe348000000b0033d8c9d0419mr3168883wrj.24.1711304804896;
        Sun, 24 Mar 2024 11:26:44 -0700 (PDT)
Received: from localhost (54-240-197-231.amazon.com. [54.240.197.231])
        by smtp.gmail.com with ESMTPSA id n7-20020a5d4847000000b0033ec9b26b7asm7259940wrs.25.2024.03.24.11.26.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 24 Mar 2024 11:26:44 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Luke Nelson <luke.r.nels@gmail.com>, Pu Lehui
 <pulehui@huawei.com>, Pu Lehui <pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf] riscv, bpf: Fix kfunc parameters incompatibility
 between bpf and riscv abi
In-Reply-To: <20240324103306.2202954-1-pulehui@huaweicloud.com>
References: <20240324103306.2202954-1-pulehui@huaweicloud.com>
Date: Sun, 24 Mar 2024 18:26:42 +0000
Message-ID: <mb61pfrwf7afx.fsf@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_112650_385020_B6FAB65B 
X-CRM114-Status: GOOD (  22.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Pu Lehui <pulehui@huaweicloud.com> writes:

> From: Pu Lehui <pulehui@huawei.com>
>
> We encountered a failing case when running selftest in no_alu32 mode:
>
> The failure case is `kfunc_call/kfunc_call_test4` and its source code is
> like bellow:
> ```
> long bpf_kfunc_call_test4(signed char a, short b, int c, long d) __ksym;
> int kfunc_call_test4(struct __sk_buff *skb)
> {
> 	...
> 	tmp = bpf_kfunc_call_test4(-3, -30, -200, -1000);
> 	...
> }
> ```
>
> And its corresponding asm code is:
> ```
> 0: r1 = -3
> 1: r2 = -30
> 2: r3 = 0xffffff38 # opcode: 18 03 00 00 38 ff ff ff 00 00 00 00 00 00 00 00
> 4: r4 = -1000
> 5: call bpf_kfunc_call_test4
> ```
>
> insn 2 is parsed to ld_imm64 insn to emit 0x00000000ffffff38 imm, and
> converted to int type and then send to bpf_kfunc_call_test4. But since
> it is zero-extended in the bpf calling convention, riscv jit will
> directly treat it as an unsigned 32-bit int value, and then fails with
> the message "actual 4294966063 != expected -1234".
>
> The reason is the incompatibility between bpf and riscv abi, that is,
> bpf will do zero-extension on uint, but riscv64 requires sign-extension
> on int or uint. We can solve this problem by sign extending the 32-bit
> parameters in kfunc.
>
> The issue is related to [0], and thanks to Yonghong and Alexei.
>
> Link: https://github.com/llvm/llvm-project/pull/84874 [0]
> Fixes: d40c3847b485 ("riscv, bpf: Add kfunc support for RV64")
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---
>  arch/riscv/net/bpf_jit_comp64.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index 869e4282a2c4..e3fc39370f7d 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -1454,6 +1454,22 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>  		if (ret < 0)
>  			return ret;
>  
> +		if (insn->src_reg == BPF_PSEUDO_KFUNC_CALL) {
> +			const struct btf_func_model *fm;
> +			int idx;
> +
> +			fm = bpf_jit_find_kfunc_model(ctx->prog, insn);
> +			if (!fm)
> +				return -EINVAL;
> +
> +			for (idx = 0; idx < fm->nr_args; idx++) {
> +				u8 reg = bpf_to_rv_reg(BPF_REG_1 + idx, ctx);
> +
> +				if (fm->arg_size[idx] == sizeof(int))
> +					emit_sextw(reg, reg, ctx);
> +			}
> +		}
> +
>  		ret = emit_call(addr, fixed_addr, ctx);
>  		if (ret)
>  			return ret;
> -- 
> 2.34.1

Thanks for doing this, it fixes the issue I was seeing with arena_htab
selftest after enabling arena on RISCV.

Tested-by: Puranjay Mohan <puranjay12@gmail.com>
Reviewed-by: Puranjay Mohan <puranjay12@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
