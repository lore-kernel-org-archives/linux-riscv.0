Return-Path: <SRS0=9tbA=M6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0509ECDE43
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Oct 2018 17:03:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 506C021476
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Oct 2018 17:03:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sMw/HBOo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sIMO6XG6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="QROPxOhC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 506C021476
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=H4gkGvcfbtI4IHd+Ox42wc3qvvRf2e1skXl9cJuu6u8=; b=sMw/HBOo23quWijcgvSSQjGVH
	BCotkUvyWIhyKK8qFxFSBAP2YfY+8XJyrvUv2T1uJTe7psU6v5OXK6Yw9uKJD/DwBAaChSoiSPopy
	V8PvWIfIfyWWPIZpgdKpStuo/QaWQc/VQUOPy5QHkgElNbwyUf92HAOer8kYSQAhvePwAktiwyVau
	tDF9wPncgvqAZlxC+dVnLbBWtQS1k95ZNmpDS3rfUrPyWx0YYahqPZwQT5uKaj3hef6gbkm1bVMI6
	8MUNn/9Ai6hx7hzjbtOJekid2LJ2fkkDzqFd+gmvw48Nt6HptNuPe7fuzQ93kEBSdV0ddIU7oUqzE
	PXd6XRZlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gDBho-0008Hf-Cn; Thu, 18 Oct 2018 17:03:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDBhi-00082o-UU
 for linux-riscv@bombadil.infradead.org; Thu, 18 Oct 2018 17:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rgYOT6GjbNPV4qai0i/YvFQNFkRvo9GaW3Q6biJzdaY=; b=sIMO6XG6FAISiobvA6l97vhXfv
 VMLXspLH7QnUgg+My+2jUArVOi4gD1pXVSnXk78Js+cmP0jucHvxJpZkJhMLtG55oxlYK5RRs5obh
 jLoidcZRlpkSo3DRP47I9odyFVBnV6RI5Nfhgv+FjOyLMnfxDAcEMMhvhySTIIVdH/rfkUpCkFSti
 /4SbdrxpPLq6QCXTiuoy/XSkRdI3JwrLylYBGIBQEgJkYGqs84vb/B9tag+bUaWF1XKIm1C23Ls3K
 N+5tT3zm3zsgtFWzM+/E6Ae7EXtNO3HVE64mZD9WoGO920vJaB3RngqcZdFSn48YsTYx5xlh42l/X
 zGWc/Jug==;
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDBa4-0000dM-1j
 for linux-riscv@lists.infradead.org; Thu, 18 Oct 2018 16:55:29 +0000
Received: by mail-pg1-x542.google.com with SMTP id c10-v6so14464966pgq.4
 for <linux-riscv@lists.infradead.org>; Thu, 18 Oct 2018 09:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=rgYOT6GjbNPV4qai0i/YvFQNFkRvo9GaW3Q6biJzdaY=;
 b=QROPxOhC8/oNzDV0A1cV+4lPgB4xq68ujfDBLzqcDwQqEnt93PsrlKn+4rI9d8PNB5
 lgYPRqZhIncwkSaYEBszPXpi7Mf/xKEjpQ/nE+Fi+TuAzDka6tldNW1DALIkukDoDU8L
 qeULyldlzqLKZnc9DrYICSwAsus6lJR+SNbpzlA6ISdr5Uz7ZKWxOYgG2bF/JHUBSxtb
 2lUlD1hM6DptFEJszEl2Gsx7A0qSQTZU7ROdYP5NKAixcEJ2UC8Eyo6xv2KBTlhj/n1U
 35AkI9nZMFn3c/2cnGbvOJAXSmMd+2iHr627NueQhJCTPqa1TkGQq/Ce8x9h+lzQa9DW
 wRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=rgYOT6GjbNPV4qai0i/YvFQNFkRvo9GaW3Q6biJzdaY=;
 b=RR1HZqr6mT1A9M4I0zkY7pmLZm1UglyOz4YBfcwg+kGz4pWVZfUAnnp55jVYZ9/oEq
 iyI0SA8fGWw3qAKDzjNr+j1H3ys4arr89NCR8Mvgzkl6XCPqIxOc+NuYxSe2+W25JLM8
 eniha1c6oluNp3gxABbOs4N8MijrnXw2A0N/tpxx+XO3WqcZY0ub4Sl1h09UJM+Hqgdh
 hNERabV16OGgchn8+U7cm6/nQG3zKSjP+BX4VjH/3L6Mcr1DHeyafh7DvB1DV/fjHOrN
 HzH6Qc+lSTG/etZdZTP4544ddsKWfdYH0VMRAY9apkwa2OouPI+0FA5oHTKTZc12O0ZX
 cwtA==
X-Gm-Message-State: ABuFfoh6Os1e83o2M8Tam86GEg0qBeui46m0UM0yrg+AbCOfLCdAfECd
 Y68mrizE+bH4qVDiy5zmnK2Olt++rIs=
X-Google-Smtp-Source: ACcGV61EOnjC6PS3sJWWznW7QlJ2qqXNa84uIDc7fgnlDlryFhEy4CoxMF42+GwBnO0BEbZwvC1ATA==
X-Received: by 2002:a62:6801:: with SMTP id d1-v6mr31194178pfc.7.1539881715676; 
 Thu, 18 Oct 2018 09:55:15 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id i2-v6sm20287716pgq.35.2018.10.18.09.55.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Oct 2018 09:55:14 -0700 (PDT)
Date: Thu, 18 Oct 2018 09:55:14 -0700 (PDT)
X-Google-Original-Date: Thu, 18 Oct 2018 09:52:28 PDT (-0700)
Subject: Re: [PATCH, v2] RISC-V: Add FP register ptrace support for gdb.
In-Reply-To: <20181018005905.8100-1-jimw@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Jim Wilson <jimw@sifive.com>
Message-ID: <mhng-6049c845-7914-4ec8-8971-1d4ccd471b56@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181018_175528_111839_EBA86C7A 
X-CRM114-Status: GOOD (  26.53  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Jim Wilson <jimw@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181018165514.xf9Ils6d9cFB7PHzJloOjtLmQwPpkB8XnM8rYplJbno@z>

On Wed, 17 Oct 2018 17:59:05 PDT (-0700), Jim Wilson wrote:
> Add a variable and a macro to describe FP registers, assuming only D is
> supported.  FP code is conditional on CONFIG_FPU.  The FP regs and FCSR
> are copied separately to avoid copying struct padding.  Tested by hand and
> with the gdb testsuite.

IIRC, the "padding" field isn't really padding but is instead an extension field 
that we plan on using in the future to indicate the presence of additional 
stateful extensions (with the V extension being the only currently planned 
`one).  As such, we really want to check that the padding is 0 when setting 
state and set the padding to 0 when getting state -- otherwise userspace might 
jam something in there that causes trouble in the future.

Our glibc port enumerates this requirement as a comment 

    struct __riscv_mc_q_ext_state
      {
        unsigned long long int __f[64] __attribute__ ((__aligned__ (16)));
        unsigned int __fcsr;
        /* Reserved for expansion of sigcontext structure.  Currently zeroed
           upon signal, and must be zero upon sigreturn.  */
        unsigned int __glibc_reserved[3];
      };

but appears to not actually check for that behavior, which I would call a bug 
(and I remember having fixed, but maybe I'm just crazy).  Since this is better 
than nothing I've added it to for-next, you're welcome to either submit a 
replacement, submit a followup, or have me fix it :).

> Signed-off-by: Jim Wilson <jimw@sifive.com>

Thanks!

> ---
>  arch/riscv/include/uapi/asm/elf.h |  3 ++
>  arch/riscv/kernel/ptrace.c        | 52 +++++++++++++++++++++++++++++++
>  2 files changed, 55 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/elf.h b/arch/riscv/include/uapi/asm/elf.h
> index 1e0dfc36aab9..644a00ce6e2e 100644
> --- a/arch/riscv/include/uapi/asm/elf.h
> +++ b/arch/riscv/include/uapi/asm/elf.h
> @@ -19,7 +19,10 @@ typedef unsigned long elf_greg_t;
>  typedef struct user_regs_struct elf_gregset_t;
>  #define ELF_NGREG (sizeof(elf_gregset_t) / sizeof(elf_greg_t))
>
> +/* We don't support f without d, or q.  */
> +typedef __u64 elf_fpreg_t;
>  typedef union __riscv_fp_state elf_fpregset_t;
> +#define ELF_NFPREG (sizeof(struct __riscv_d_ext_state) / sizeof(elf_fpreg_t))
>
>  #if __riscv_xlen == 64
>  #define ELF_RISCV_R_SYM(r_info)		ELF64_R_SYM(r_info)
> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> index 9f82a7e34c64..60f1e02eed36 100644
> --- a/arch/riscv/kernel/ptrace.c
> +++ b/arch/riscv/kernel/ptrace.c
> @@ -28,6 +28,9 @@
>
>  enum riscv_regset {
>  	REGSET_X,
> +#ifdef CONFIG_FPU
> +	REGSET_F,
> +#endif
>  };
>
>  static int riscv_gpr_get(struct task_struct *target,
> @@ -54,6 +57,45 @@ static int riscv_gpr_set(struct task_struct *target,
>  	return ret;
>  }
>
> +#ifdef CONFIG_FPU
> +static int riscv_fpr_get(struct task_struct *target,
> +			 const struct user_regset *regset,
> +			 unsigned int pos, unsigned int count,
> +			 void *kbuf, void __user *ubuf)
> +{
> +	int ret;
> +	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
> +
> +	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, fstate, 0,
> +				  offsetof(struct __riscv_d_ext_state, fcsr));
> +	if (!ret) {
> +		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, fstate, 0,
> +					  offsetof(struct __riscv_d_ext_state, fcsr) +
> +					  sizeof(fstate->fcsr));
> +	}
> +
> +	return ret;
> +}
> +
> +static int riscv_fpr_set(struct task_struct *target,
> +			 const struct user_regset *regset,
> +			 unsigned int pos, unsigned int count,
> +			 const void *kbuf, const void __user *ubuf)
> +{
> +	int ret;
> +	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
> +
> +	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, fstate, 0,
> +				 offsetof(struct __riscv_d_ext_state, fcsr));
> +	if (!ret) {
> +		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, fstate, 0,
> +					 offsetof(struct __riscv_d_ext_state, fcsr) +
> +					 sizeof(fstate->fcsr));
> +	}
> +
> +	return ret;
> +}
> +#endif
>
>  static const struct user_regset riscv_user_regset[] = {
>  	[REGSET_X] = {
> @@ -64,6 +106,16 @@ static const struct user_regset riscv_user_regset[] = {
>  		.get = &riscv_gpr_get,
>  		.set = &riscv_gpr_set,
>  	},
> +#ifdef CONFIG_FPU
> +	[REGSET_F] = {
> +		.core_note_type = NT_PRFPREG,
> +		.n = ELF_NFPREG,
> +		.size = sizeof(elf_fpreg_t),
> +		.align = sizeof(elf_fpreg_t),
> +		.get = &riscv_fpr_get,
> +		.set = &riscv_fpr_set,
> +	},
> +#endif
>  };
>
>  static const struct user_regset_view riscv_user_native_view = {

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
