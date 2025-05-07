Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE93C3ABBE
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 02:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DrBpfzTIYS9lMJ7o+kefySdBHuLUE/fT1bmpQrBvodQ=; b=g6luXstkftz0Lk
	rUHQqQsdV0+V3ZLNb+fWhLruJuOB+r8n8nccOJ5fHtoZ9AhR+CdJCi3MbWgoC8sXxEfcz0UVXu3H0
	tXaJJgKcTQlpMaqM/xevisCrVre/ZH7K5TugsOMMrL+q43vEwsMezg9L8RDh2CNIqH5c+/B4W+Xzl
	+/09GPGSX6jeuGb/s5LUyVkRSkIUWsxMn1TmVaZx/veV9QIB0L/lKQd8KvKjZ3+yXSkjR6arM0W2s
	fMXwmPUq23QUMCn7imndWScjhxwCQSXAjjgcJWXug3K/nAHx8SRQY4tdhca+MYIQ7mt4bsM8ETOTN
	ttZFj3j+1lJQfPJhGVXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUd9-0000000Dz2A-2i3B;
	Wed, 07 May 2025 02:35:31 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCSZD-0000000Dn05-2afg
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 00:23:20 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22e42641d7cso96455ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 May 2025 17:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746577399; x=1747182199; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sI1txssI9jFxvw1ed/mZEava9GNou9j0LjvsUinfGHw=;
        b=EDhcciFECkrK4ZNAgPNJ14g6unloY9RYRl4q/4iA9vKSy7wDz/98ootC7NJqz7MZqI
         VZWtz6OSAFi2OW9gYhVESjpUnujc/c0bVdt82PTUAHqIuTd9jHmGtwmfMdzFc1I7M6YH
         gK3ZT1l6IBveLvzoKWtezwbj35AELLdCNcwvmpirCRIffQAIlfQTejk4FJ/WQUWh3EiD
         x/w4Whb3KSsbKi4hQCeE4wqu0ePf0kCThj6WV+ykbtizgYuFblAF3f7Rxjk6Ls9nLFOE
         vjvac0UTlSdM3s2wIkOp2cfzqD4tYnbkoGS9k3WxwyxwnhlK75nda1MtB9Xq0jLs0AEV
         1lzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746577399; x=1747182199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sI1txssI9jFxvw1ed/mZEava9GNou9j0LjvsUinfGHw=;
        b=N3E+0HwjdSnQ5v5QhGygXjciSioSjIOOpraX+g4BPY+EiTY5mw2UrgYpzhxlqqhOKn
         WDuGVJXFlmZ7XInCfrQEXRChTOkJRDME3lRggqPDjT5zbeMlhs9ls9ACzmdtyx5chzcz
         6vFXQGgmovv3gsLKQaRpi2CNoDnhBhpLyJCTwXoaOmcQY7qiIZvr+LrZ4QvZjH36Vrti
         ZJPMVOoCfqb4Eh8HNW28maFSheFVSJJhjMaMXaG+gZ9lSZQvisUEvC1V/TivrbvQjnAb
         qA8SQop+evPOCwqS0tOwLmfChfeAr4w5+VW+v2bJ8/DfLgxLrnD3R1hbe7VYAXGlKWLZ
         NVSg==
X-Forwarded-Encrypted: i=1; AJvYcCXJTOiJ1OUbpIzSPhR9hQDph1JrpvPqFp3qSQYzgVpGK+r0YBn/tMVA95olHEQ2ceUz+uR3rACo6tTjwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ0RW+CnpnLnup0LdjqNDBXB1/yPp3Gyhcw0iAeS/i3Fp2uMyJ
	lqilGPhgg7AJtkuPLFsHLLWUsf+YWk0PvdOVn00cOOASBqeukMBkFp8QaABACQ==
X-Gm-Gg: ASbGncsBVdEXpFa2Mr+kQ0Y5Ist2TqD0QAZTBO88xPWzvPU6jst7dmd2G47AYKbRqm3
	+KOsNUl8tH4SP65gtMDkCSEjcXjF/zrXzzPQYuPJ7oWefQ8/exIdWZX0TqM7ptOKym0pEcDQk3X
	vrX7IAPHmn1CshsTxyfKJTKFC4m2FH9blOu7a+89nV6UbjSGK9Vd0jBmwmsr9MNSLBWKLt7dZ4w
	cfb3cEgL6HZwBshAs/O3kusGY7S5QmVIVuyuwsPgTt8gwXZWyeXz6SZeugqDpY6BeJXXhj01fhq
	2KXMV/SROMzhUFAC2n5shvIyKmMJTcLVB1YeBieWPvc00WUQldi5LdWLAG3Cw8KTlNeWMctoNoN
	XqUW5Zg==
X-Google-Smtp-Source: AGHT+IEzK5qlbI0uu6IJ+MI/sf09eqJCBljxYneKmD8E0EnlSPJPFhlneErsLBo7GPHLcOUfATUmBg==
X-Received: by 2002:a17:902:cccf:b0:216:27f5:9dd7 with SMTP id d9443c01a7336-22e62a0496cmr777455ad.11.1746577398520;
        Tue, 06 May 2025 17:23:18 -0700 (PDT)
Received: from google.com (202.108.125.34.bc.googleusercontent.com. [34.125.108.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fb61sm80215915ad.144.2025.05.06.17.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 17:23:18 -0700 (PDT)
Date: Wed, 7 May 2025 00:23:12 +0000
From: Peilin Ye <yepeilin@google.com>
To: Pu Lehui <pulehui@huawei.com>
Cc: bpf@vger.kernel.org, Andrea Parri <parri.andrea@gmail.com>,
	linux-riscv@lists.infradead.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>,
	Neel Natu <neelnatu@google.com>,
	Benjamin Segall <bsegall@google.com>
Subject: Re: [PATCH bpf-next 3/8] bpf, riscv64: Support load-acquire and
 store-release instructions
Message-ID: <aBqn8C6Iz3tk6dAk@google.com>
References: <cover.1745970908.git.yepeilin@google.com>
 <248aa4b0ef7e439e0446d25732af7246d119c6a9.1745970908.git.yepeilin@google.com>
 <a50a1c64-683b-4356-99ec-103017f7a6be@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a50a1c64-683b-4356-99ec-103017f7a6be@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_172319_655507_F2C889A4 
X-CRM114-Status: GOOD (  11.54  )
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

On Tue, May 06, 2025 at 10:20:04PM +0800, Pu Lehui wrote:
> On 2025/4/30 8:50, Peilin Ye wrote:
> > @@ -1259,7 +1318,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
> >   {
> >   	bool is64 = BPF_CLASS(insn->code) == BPF_ALU64 ||
> >   		    BPF_CLASS(insn->code) == BPF_JMP;
> > -	int s, e, rvoff, ret, i = insn - ctx->prog->insnsi;
> > +	int s, e, rvoff, ret = 0, i = insn - ctx->prog->insnsi;
> >   	struct bpf_prog_aux *aux = ctx->prog->aux;
> >   	u8 rd = -1, rs = -1, code = insn->code;
> >   	s16 off = insn->off;
> > @@ -1962,10 +2021,14 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
> >   	case BPF_STX | BPF_MEM | BPF_DW:
> >   		emit_store_64(rd, off, rs, ctx);
> >   		break;
> > +	case BPF_STX | BPF_ATOMIC | BPF_B:
> > +	case BPF_STX | BPF_ATOMIC | BPF_H:
> >   	case BPF_STX | BPF_ATOMIC | BPF_W:
> >   	case BPF_STX | BPF_ATOMIC | BPF_DW:
> > -		emit_atomic(rd, rs, off, imm,
> > -			    BPF_SIZE(code) == BPF_DW, ctx);
> > +		if (bpf_atomic_is_load_store(insn))
> > +			ret = emit_atomic_ld_st(rd, rs, off, imm, code, ctx);
> > +		else
> > +			ret = emit_atomic_rmw(rd, rs, off, imm, code, ctx);
> >   		break;
> >   	case BPF_STX | BPF_PROBE_MEM32 | BPF_B:
> > @@ -2050,7 +2113,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
> >   		return -EINVAL;
> >   	}
> > -	return 0;
> > +	return ret;
> 
> `ret` may be a value greater than zero, which will potentially cause
> build_body to skip the next instruction. Let's `return 0` here, and `return
> ret` if the above fails.

Sure, I'll change this in v2.

Thanks,
Peilin Ye


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
