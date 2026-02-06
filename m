Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED8AEE20A3
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 13:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V30PXqAXEJwI5GhwPBW/85KmdXGnEmJhEtaVX2QJ6Q4=; b=UAIoOiybA+QjBh
	NFL48CCmlnMQBmim2aTN2KZN7erT8yIx0fwcsy08SRRkWKHyHkSE8LrJeXmFGWcDeO7d0k5wd1VSd
	IJw9cD+68cnNbWNY5I6BBYrS+Wh8NLOTSkdXHeM5MpXWSBoJOw1+pWKXtbjZ/L13KpD6K/hixoUkk
	lcTnLsGuNes1ClTTFxjLeGHewKMnr8Q6TEt1uTf76znQCiwozB3z5pOA0/NuSG4zFMvSpKQOIcwTu
	nnqg2mMcLbOQTNlN179SurtPPhBsaOa1UuwF7+9FImH4Fu4efdxXOfG2o86CUBxtD3CyDcq+06sJA
	bGQbyTnUk7yAG1ywZMyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voM6X-0000000BNvv-0C2A;
	Fri, 06 Feb 2026 13:42:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voM6W-0000000BNvj-0Y1F
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 13:42:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F1A84600AD
	for <linux-riscv@lists.infradead.org>; Fri,  6 Feb 2026 13:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89FFC19424
	for <linux-riscv@lists.infradead.org>; Fri,  6 Feb 2026 13:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770385354;
	bh=rGBbb+cAh8cXdLw7bkpja62+z4B0+I2tQhqSEHc5exE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sKNPp4ASwuDJh6J3uuLKftMnuPZhlF/r3Ulpe7aRMkshyt1ktlpyMZNYTt+T80Us0
	 WTQ+WBoBRpD1zf/IerngC9z3FBikrNW6K9zdXm/jL6VAdJXbOvbagaLuSk8+uuS4C9
	 njZ7gdfpETVFid46/Ek04EzIuen+RT5TPXsyPB1vdyEMTsgtOcuEV4xn/xlLm4XceJ
	 +ZvAFaBLKlN+p8BsPJF3FSCHynOmAgvWAj9h+QEc+O9xttgjudNnldXaWPxlkGTMWi
	 DkTCEGrWXUEn6HtKV5w9oPNaXjVfRK8QWrycsK3ISCmdqHf/qiehllMzxq34L0G0mM
	 Y+GfytlkyVQzQ==
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8947e6ffd30so7793976d6.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Feb 2026 05:42:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXtahLQ2q2FMiNqwAWwyIzJK2IE0Hcg69dNY4jr8uKKKgzMVJrupSlANMNPwL5IfguUoKP21iK6OAnjDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxKRA/bHH2J5Qj1crqwzKCj3BHMxG37XCuHXz/YvIBG6y1y4rA
	WTFoecqieB6+KJGRqpLuyomwuygIMWK9gklq2gcIoL22RwyZW7xaQKuHEBDJYWufQTcoFzKYHU1
	DBkyNic8Pd17OWS6HPHtnLZyoHr4iweY=
X-Received: by 2002:ad4:596f:0:b0:88f:9670:d107 with SMTP id
 6a1803df08f44-8953cd9c4f3mr32553666d6.66.1770385353802; Fri, 06 Feb 2026
 05:42:33 -0800 (PST)
MIME-Version: 1.0
References: <20260206122002.1494125-3-dongml2@chinatelecom.cn> <444267200b59241e9da104eab8af2d7189aa401005887a2cd0128cd6aeda98e2@mail.kernel.org>
In-Reply-To: <444267200b59241e9da104eab8af2d7189aa401005887a2cd0128cd6aeda98e2@mail.kernel.org>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Fri, 6 Feb 2026 14:42:22 +0100
X-Gmail-Original-Message-ID: <CAJ+HfNj5JZJ-k5bJibSgLPD5xnTzf7kfvma4kJOBKoNTnSLLDg@mail.gmail.com>
X-Gm-Features: AZwV_Qgp30xu6TweGeMW0sgxJKdeBZnllbFPIwwNJDP6mSLbXtqNecZzsDiMGlk
Message-ID: <CAJ+HfNj5JZJ-k5bJibSgLPD5xnTzf7kfvma4kJOBKoNTnSLLDg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/3] bpf, riscv: add fsession support for trampolines
To: menglong8.dong@gmail.com
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, pulehui@huawei.com, 
	puranjay@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, bpf@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	jiang.biao@linux.dev, martin.lau@kernel.org, clm@meta.com, 
	ihor.solodrai@linux.dev
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

Menglong!

On Fri, 6 Feb 2026 at 13:51, <bot+bpf-ci@kernel.org> wrote:
>
> > diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> > --- a/arch/riscv/net/bpf_jit_comp64.c
> > +++ b/arch/riscv/net/bpf_jit_comp64.c
>
> [ ... ]
>
> > +static int invoke_bpf(struct bpf_tramp_links *tl, int args_off, int retval_off,
> > +                   int run_ctx_off, int func_meta_off, bool save_ret, u64 func_meta,
> > +                   int cookie_off, struct rv_jit_context *ctx)
> > +{
> > +     int i, cur_cookie = (cookie_off - args_off) / 8;
> > +
> > +     for (i = 0; i < tl->nr_links; i++) {
> > +             int err;
> > +
> > +             if (bpf_prog_calls_session_cookie(&tl->links[i])) {
>                                                 ^^^^^^^^^^^^^^
>
> Should this be tl->links[i] instead of &tl->links[i]?
>
> The function bpf_prog_calls_session_cookie() expects a struct bpf_tramp_link
> pointer, but tl->links is an array of pointers, so tl->links[i] is already
> a struct bpf_tramp_link pointer. The extra & passes a pointer-to-pointer.
>
> For comparison, arm64 uses:
>
>     if (bpf_prog_calls_session_cookie(fentry->links[i]))
>
> And include/linux/bpf.h uses:
>
>     if (bpf_prog_calls_session_cookie(fentries.links[i]))
>
> Both without the &.
>
> > +                     u64 meta = func_meta | ((u64)cur_cookie << BPF_TRAMP_COOKIE_INDEX_SHIFT);
> > +
> > +                     emit_store_stack_imm64(RV_REG_T1, -func_meta_off, meta, ctx);
> > +                     cur_cookie--;
> > +             }
> > +             err = invoke_bpf_prog(tl->links[i], args_off, retval_off, run_ctx_off,
> > +                                   save_ret, ctx);
>
> Note that invoke_bpf_prog() correctly uses tl->links[i] without the &.

Menglong, the v3 doesn't build. Please refrain from just stressing
versions out. For v4, make sure you properly build/test. On that note;
on what hardware/simulator did you perform the tests on?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
