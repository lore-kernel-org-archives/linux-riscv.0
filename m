Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5751FEE209D
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 12:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZwaUmXSvyKWtoOSJIdR9Zd4/uBJSw5SyAK1d3uDFqk=; b=oH82iziMHSqgcEZ8pBV1iZ+XBD
	eJyPIc7t9BR0NB9uwIWQjWP605ILL9jlsK5Vgn7aWPORduQsjV8I2o4TDIpqx7YmY9b2XcQIBNgR9
	JvK3AUeg6xN4gw0fVezAYLCDkUNI60+KJpnOmYTISRX3G8sKC9+GzyMXlIZNeXzSYVuDNaoGsrb55
	GuLCfoUWoRoZuHsEBdRQTdOk+Kpopkm6Pd4yKj4V1KVbrPsuLXFUVNaX7vVTv1/zqYHO5xNtgxGCp
	oE88gTB6bpNQ0ZFZULbxz5TgzLMvD934e5sJpwG1IcJbYKGsOX0vUHh2yuFLQU4l+Fd9zlLpPk3kN
	nZrV4lTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voLJH-0000000BKD5-1pYP;
	Fri, 06 Feb 2026 12:51:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voLJE-0000000BKCZ-4Br7
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 12:51:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 53ECF419BC;
	Fri,  6 Feb 2026 12:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02F4C116C6;
	Fri,  6 Feb 2026 12:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770382297;
	bh=PJCZdzpr3NavBlBPuv0+ES9dELxv1rsduvAcfJuPO08=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=VMWdBh+ud1PH6yem4zpvSyp2ung1EZrZRF8HbgGB10yBKHiYer42VtpTSJifMMVAK
	 QDut8rfkRmk5o5/2Pr8W0rWku9z3t6qolfgIgM0Pz0wy8mEY8jfjw4CCz/GHRyZcB+
	 /v7i/T6SSAvnwtQTWDlGgv6PVwF7u6oiVzenWF2xR4nrdzEmLUnzFFiRlYLj9NKOjw
	 EuW8n1rVbTmmjEsxX2FySRGaOMedwtIep9Vn1EiHCS0d7OQwwao+tIMqyeVg6KwpcN
	 XW6GmwJzRIBhk0RZ1dCjD0advqmY9ZfH4uJUzlDUDfRO12kyLM/jhJxe7m3zn5twsL
	 wFdBzH2mAdh3Q==
Content-Type: multipart/mixed; boundary="===============3134334814036554971=="
MIME-Version: 1.0
Message-Id: <444267200b59241e9da104eab8af2d7189aa401005887a2cd0128cd6aeda98e2@mail.kernel.org>
In-Reply-To: <20260206122002.1494125-3-dongml2@chinatelecom.cn>
References: <20260206122002.1494125-3-dongml2@chinatelecom.cn>
Subject: Re: [PATCH bpf-next v3 2/3] bpf, riscv: add fsession support for trampolines
From: bot+bpf-ci@kernel.org
To: menglong8.dong@gmail.com,ast@kernel.org,bjorn@kernel.org
Cc: daniel@iogearbox.net,andrii@kernel.org,martin.lau@linux.dev,eddyz87@gmail.com,song@kernel.org,yonghong.song@linux.dev,john.fastabend@gmail.com,kpsingh@kernel.org,sdf@fomichev.me,haoluo@google.com,jolsa@kernel.org,pulehui@huawei.com,puranjay@kernel.org,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu,alex@ghiti.fr,bpf@vger.kernel.org,linux-riscv@lists.infradead.org,linux-kernel@vger.kernel.org,jiang.biao@linux.dev,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Fri,  6 Feb 2026 12:51:36 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_045141_232608_35F3BA87 
X-CRM114-Status: GOOD (  11.09  )
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

--===============3134334814036554971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c

[ ... ]

> +static int invoke_bpf(struct bpf_tramp_links *tl, int args_off, int retval_off,
> +		      int run_ctx_off, int func_meta_off, bool save_ret, u64 func_meta,
> +		      int cookie_off, struct rv_jit_context *ctx)
> +{
> +	int i, cur_cookie = (cookie_off - args_off) / 8;
> +
> +	for (i = 0; i < tl->nr_links; i++) {
> +		int err;
> +
> +		if (bpf_prog_calls_session_cookie(&tl->links[i])) {
                                                ^^^^^^^^^^^^^^

Should this be tl->links[i] instead of &tl->links[i]?

The function bpf_prog_calls_session_cookie() expects a struct bpf_tramp_link
pointer, but tl->links is an array of pointers, so tl->links[i] is already
a struct bpf_tramp_link pointer. The extra & passes a pointer-to-pointer.

For comparison, arm64 uses:

    if (bpf_prog_calls_session_cookie(fentry->links[i]))

And include/linux/bpf.h uses:

    if (bpf_prog_calls_session_cookie(fentries.links[i]))

Both without the &.

> +			u64 meta = func_meta | ((u64)cur_cookie << BPF_TRAMP_COOKIE_INDEX_SHIFT);
> +
> +			emit_store_stack_imm64(RV_REG_T1, -func_meta_off, meta, ctx);
> +			cur_cookie--;
> +		}
> +		err = invoke_bpf_prog(tl->links[i], args_off, retval_off, run_ctx_off,
> +				      save_ret, ctx);

Note that invoke_bpf_prog() correctly uses tl->links[i] without the &.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/21750727924

AI-authorship-score: low
AI-authorship-explanation: The code follows kernel conventions and has been reviewed by maintainers with acked-by tags, indicating human authorship.
issues-found: 1
issue-severity-score: high
issue-severity-explanation: Wrong pointer type passed to bpf_prog_calls_session_cookie() will cause undefined behavior when accessing session cookie state, breaking fsession functionality on RISC-V.

--===============3134334814036554971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3134334814036554971==--

