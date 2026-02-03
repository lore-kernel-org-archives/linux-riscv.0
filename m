Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324A3E83057
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 06:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1GdTR1jddz4DRnNOueGq0d0f40eX20xe5j3cTwu9dV8=; b=bnGtHQEtXU4bdC
	r7upC9ZyEbN56wFDnTd9HwdxLYeshiCKxiSJx/o3yUQFXG3Tizs2KuaHomHYL9zPhCUCa0kbbjqcy
	cQ4WPRLQxClRFsnXWWdgTbUC7ZheRuVpb3AyltYwU5UO7Hzepamjz+Dv9j86rSk+8shTLWLn7VRZV
	kq7KXh+TBsHnGgbLno0Q93eEpbHTcQ9GElyJ4urqTpBlqDOQFtW2IPV8VvJR4rWFSSXoDOnrF7C1W
	BcmzldTvNe6mwrqP/FUoMRgN8L52biqQUg4puX4nfF1eCRM0p3ENYKlMlcs6lO/pa1Up4zaa1LzGg
	yfszzRhdicqCRv87++yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9r3-00000006BSk-1740;
	Tue, 03 Feb 2026 06:25:41 +0000
Received: from out-170.mta0.migadu.com ([91.218.175.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9r0-00000006BRM-3D73
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 06:25:40 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770099934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GP4jT81bCyCse8hAXM6mqfIRRJS6v9r9wXT/E3N6fTs=;
	b=oyNIRaN5j1n+TiMs9eUX93212JIMDuAZe0eaUpyUHIKLvZhnBl9wOj232mR1HuEXdKinUp
	b530f2o5uHrzXsvR5jXgHWnbCMvUaaHC1ObzIkYhQvxhklPzrxr7WQ6MHP0xlg668fLl48
	oPhnxrzaQUltZifxRmX7acpqVrD5C9c=
From: Menglong Dong <menglong.dong@linux.dev>
To: Menglong Dong <menglong8.dong@gmail.com>, ast@kernel.org,
 Leon Hwang <leon.hwang@linux.dev>
Cc: daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, bjorn@kernel.org, pulehui@huawei.com,
 puranjay@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, jiang.biao@linux.dev,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next 2/3] bpf,
 riscv: add fsession support for trampolines
Date: Tue, 03 Feb 2026 14:25:12 +0800
Message-ID: <2816538.mvXUDI8C0e@7940hx>
In-Reply-To: <98aef740-fcbe-4d0d-905e-37a7addd5b32@linux.dev>
References: <20260203055231.1088479-1-dongml2@chinatelecom.cn>
 <20260203055231.1088479-3-dongml2@chinatelecom.cn>
 <98aef740-fcbe-4d0d-905e-37a7addd5b32@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_222538_967010_BA65A430 
X-CRM114-Status: GOOD (  23.14  )
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

On 2026/2/3 14:20 Leon Hwang <leon.hwang@linux.dev> write:
> 
> On 3/2/26 13:52, Menglong Dong wrote:
> > Implement BPF_TRACE_FSESSION support in the RISC-V trampoline JIT. The
> > logic here is similar to what we did in x86_64.
> > 
> > In order to simply the logic, we factor out the function invoke_bpf() for
> > fentry and fexit.
> > 
> > Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
> > ---
> >  arch/riscv/net/bpf_jit_comp64.c | 74 ++++++++++++++++++++++++++++-----
> >  1 file changed, 64 insertions(+), 10 deletions(-)
> > 
> > diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> > index e4f45e2e7e2f..f10418ff6a9b 100644
> > --- a/arch/riscv/net/bpf_jit_comp64.c
> > +++ b/arch/riscv/net/bpf_jit_comp64.c
> > @@ -996,6 +996,29 @@ static int invoke_bpf_prog(struct bpf_tramp_link *l, int args_off, int retval_of
> >  	return ret;
> >  }
> >  
> > +static int invoke_bpf(struct bpf_tramp_links *tl, int args_off, int retval_off,
> > +		      int run_ctx_off, int func_meta_off, bool save_ret, u64 func_meta,
> > +		      int cookie_off, struct rv_jit_context *ctx)
> > +{
> > +	int i, cur_cookie = (cookie_off - args_off) / 8;
> > +
> > +	for (i = 0; i < tl->nr_links; i++) {
> > +		int err;
> > +
> > +		if (tl->links[i]->link.prog->call_session_cookie) {
> 
> NIT: we have helper bpf_prog_calls_session_cookie() to read
> call_session_cookie.

Ah, right, I forget that helper. I'll update it and send the V2 after
getting more feedback.

Thanks!
Menglong Dong

> 
> Thanks,
> Leon
> 
> > +			u64 meta = func_meta | ((u64)cur_cookie << BPF_TRAMP_COOKIE_INDEX_SHIFT);
> > +
> > +			emit_store_stack_imm64(RV_REG_T1, -func_meta_off, meta, ctx);
> > +			cur_cookie--;
> > +		}
> > +		err = invoke_bpf_prog(tl->links[i], args_off, retval_off, run_ctx_off,
> > +				      save_ret, ctx);
> > +		if (err)
> > +			return err;
> > +	}
> > +	return 0;
> > +}
> > +
> >  static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
> >  					 const struct btf_func_model *m,
> >  					 struct bpf_tramp_links *tlinks,
> > @@ -1005,13 +1028,15 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
> >  	int i, ret, offset;
> >  	int *branches_off = NULL;
> >  	int stack_size = 0, nr_arg_slots = 0;
> > -	int retval_off, args_off, nregs_off, ip_off, run_ctx_off, sreg_off, stk_arg_off;
> > +	int retval_off, args_off, func_meta_off, ip_off, run_ctx_off, sreg_off, stk_arg_off;
> > +	int cookie_off, cookie_cnt;
> >  	struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
> >  	struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
> >  	struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
> >  	bool is_struct_ops = flags & BPF_TRAMP_F_INDIRECT;
> >  	void *orig_call = func_addr;
> >  	bool save_ret;
> > +	u64 func_meta;
> >  	u32 insn;
> >  
> >  	/* Two types of generated trampoline stack layout:
> > @@ -1042,10 +1067,14 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
> >  	 *                  [ ...               ]
> >  	 * FP - args_off    [ arg1              ]
> >  	 *
> > -	 * FP - nregs_off   [ regs count        ]
> > +	 * FP - func_meta_off [ regs count, etc ]  always
> >  	 *
> >  	 * FP - ip_off      [ traced func	] BPF_TRAMP_F_IP_ARG
> >  	 *
> > +	 *                  [ stack cookie N    ]
> > +	 *                  [ ...               ]
> > +	 * FP - cookie_off  [ stack cookie 1    ]
> > +	 *
> >  	 * FP - run_ctx_off [ bpf_tramp_run_ctx ]
> >  	 *
> >  	 * FP - sreg_off    [ callee saved reg	]
> > @@ -1077,14 +1106,20 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
> >  	stack_size += nr_arg_slots * 8;
> >  	args_off = stack_size;
> >  
> > +	/* function metadata, such as regs count */
> >  	stack_size += 8;
> > -	nregs_off = stack_size;
> > +	func_meta_off = stack_size;
> >  
> >  	if (flags & BPF_TRAMP_F_IP_ARG) {
> >  		stack_size += 8;
> >  		ip_off = stack_size;
> >  	}
> >  
> > +	cookie_cnt = bpf_fsession_cookie_cnt(tlinks);
> > +	/* room for session cookies */
> > +	stack_size += cookie_cnt * 8;
> > +	cookie_off = stack_size;
> > +
> >  	stack_size += round_up(sizeof(struct bpf_tramp_run_ctx), 8);
> >  	run_ctx_off = stack_size;
> >  
> > @@ -1132,10 +1167,19 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
> >  	if (flags & BPF_TRAMP_F_IP_ARG)
> >  		emit_store_stack_imm64(RV_REG_T1, -ip_off, (u64)func_addr, ctx);
> >  
> > -	emit_store_stack_imm64(RV_REG_T1, -nregs_off, nr_arg_slots, ctx);
> > +	func_meta = nr_arg_slots;
> > +	emit_store_stack_imm64(RV_REG_T1, -func_meta_off, func_meta, ctx);
> >  
> >  	store_args(nr_arg_slots, args_off, ctx);
> >  
> > +	if (bpf_fsession_cnt(tlinks)) {
> > +		/* clear all session cookies' value */
> > +		for (i = 0; i < cookie_cnt; i++)
> > +			emit_sd(RV_REG_FP, -cookie_off + 8 * i, RV_REG_ZERO, ctx);
> > +		/* clear return value to make sure fentry always get 0 */
> > +		emit_sd(RV_REG_FP, -retval_off, RV_REG_ZERO, ctx);
> > +	}
> > +
> >  	if (flags & BPF_TRAMP_F_CALL_ORIG) {
> >  		emit_imm(RV_REG_A0, ctx->insns ? (const s64)im : RV_MAX_COUNT_IMM, ctx);
> >  		ret = emit_call((const u64)__bpf_tramp_enter, true, ctx);
> > @@ -1143,9 +1187,9 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
> >  			return ret;
> >  	}
> >  
> > -	for (i = 0; i < fentry->nr_links; i++) {
> > -		ret = invoke_bpf_prog(fentry->links[i], args_off, retval_off, run_ctx_off,
> > -				      flags & BPF_TRAMP_F_RET_FENTRY_RET, ctx);
> > +	if (fentry->nr_links) {
> > +		ret = invoke_bpf(fentry, args_off, retval_off, run_ctx_off, func_meta_off,
> > +				 flags & BPF_TRAMP_F_RET_FENTRY_RET, func_meta, cookie_off, ctx);
> >  		if (ret)
> >  			return ret;
> >  	}
> > @@ -1192,9 +1236,14 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
> >  		*(u32 *)(ctx->insns + branches_off[i]) = insn;
> >  	}
> >  
> > -	for (i = 0; i < fexit->nr_links; i++) {
> > -		ret = invoke_bpf_prog(fexit->links[i], args_off, retval_off,
> > -				      run_ctx_off, false, ctx);
> > +	/* set "is_return" flag for fsession */
> > +	func_meta |= (1ULL << BPF_TRAMP_IS_RETURN_SHIFT);
> > +	if (bpf_fsession_cnt(tlinks))
> > +		emit_store_stack_imm64(RV_REG_T1, -func_meta_off, func_meta, ctx);
> > +
> > +	if (fexit->nr_links) {
> > +		ret = invoke_bpf(fexit, args_off, retval_off, run_ctx_off, func_meta_off,
> > +				 false, func_meta, cookie_off, ctx);
> >  		if (ret)
> >  			goto out;
> >  	}
> > @@ -2094,3 +2143,8 @@ bool bpf_jit_inlines_helper_call(s32 imm)
> >  		return false;
> >  	}
> >  }
> > +
> > +bool bpf_jit_supports_fsession(void)
> > +{
> > +	return true;
> > +}
> 
> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
