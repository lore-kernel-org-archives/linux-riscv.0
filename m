Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3EDECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 09:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pFWdfMSQR8KMsALom0ogk71v8rhe+P/vpoYFZcsTkvc=; b=rNAr0Wn8eDgjmj
	GfCjrePwFUyqEsGH6k4abOAOEe29RR0bBLw8d+gORSkXTHUdNKXmnNI4Yh5p7U9eVA1rKP3MFxrnL
	hMM79y49IynfBQOowRtS7ojInJDwZ0i5FiIrmKXbOySHBLglboQl73ELlYnVD/fVmJP1hr77Ex1yK
	vMDvPsHZl0tgrPC6+vDP4gHyBjXqMG2PpAmYqfFRuRAGRdV33mSpCCvpQ4jGuCNle6gQ8D3v+YQJf
	p1HWZ0ai5uyj0poS0T2UrbG/HFgtpPMZxg3CXGNxNrd/bGlyNrkhhPRnhUENvW/lBCbrKg3N57lzi
	1B2lJExBCOdiAaDHKmgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU2x7-002bjg-K0; Fri, 02 Sep 2022 09:27:05 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU2t0-002Xyv-Oo
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 09:22:52 +0000
Received: by mail-wm1-x336.google.com with SMTP id ay12so905675wmb.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Sep 2022 02:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=/C7RwhByTdUP1+TnbaoYX2Ts5Wnty/4rGeK1KUWN06M=;
        b=lh3d+no8joYHCHPHo+Gc5tbpyQ0MTyMJY4Ej08d5sJocxi5X7/d2G6IRrkWL4czNhU
         /Mmfe6+5KGf9SgHQ0bLRteA4BUiVAhlnUbd1aOEvk2VNA/5OSr8lPiYqNG3RSBpfIKdq
         wJ9QgnxvnS8288gT7VNCbD9SI6PFVHtQee95bXsGgU/4ZGkRJxKYPjMFiiO8e7ZH3+OE
         kCusFNP8rYvFsHCAzhUMX0MwvS/5KFlQEoHrlTS02Ux5YbveXp1FgsngNRJi2+Vtc059
         OWZak6VVknNWTEfQwkeBmu3oMjFjFYEOD/jBPxWM2Vl+4Ajwixb7DgG1VttsVo5lcrKe
         h5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=/C7RwhByTdUP1+TnbaoYX2Ts5Wnty/4rGeK1KUWN06M=;
        b=PgyJd/YYYSLcEnPWH3fb5akttOt6uiicXA7VTv+5PFMrpel980S0eVczVykJ8jxCcy
         TzC2UnfQS14HxC3eNYVJOJ3Q5ssEf6KyobJl0Ln4NnHQ2nUK3C155zlJC2U3sPw8OIuX
         c2TE7mJlP1BuYT9T49evu+70cud+ZyXmcrZde8pvQvpd13Vq5vxIr/RgJn2S3wzGEs/2
         tBMpnEILpYIgu36D0CwICHAibH1/5EIORTk+aFJc9Srq7YiVkhjQPMRPLhvUvGGCddYK
         jZxzKhaDv8UIu2xiSsc6pfyQAeuf3wvS5/EaBCOPPvgUXLMaopFQe4VPS5UjXv6K4hg/
         4tBg==
X-Gm-Message-State: ACgBeo0wPyv8oHhbd1XAy4OKlDDAKd6rBF035XbAPX9VQ3NhacoY0ZWH
	Ilj3JAxLbd2XZ0N/yzML7+5RFg==
X-Google-Smtp-Source: AA6agR5FjFJhvxzRFHHVTDqYt7V8n6WL9uP4+1ZPwqFi1jH92Af7U+J1YF+j6Z9mYqxWiQyWuk1pWQ==
X-Received: by 2002:a1c:7214:0:b0:3a5:ea1c:c55b with SMTP id n20-20020a1c7214000000b003a5ea1cc55bmr2219205wmc.190.1662110567142;
        Fri, 02 Sep 2022 02:22:47 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id h2-20020a5d4302000000b0021e51c039c5sm1037769wrq.80.2022.09.02.02.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 02:22:46 -0700 (PDT)
Date: Fri, 2 Sep 2022 11:22:45 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-riscv@lists.infradead.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: fix a nasty sigreturn bug...
Message-ID: <20220902092245.ande6fvievnbn35h@kamzik>
References: <YU0wDzeS/jXwkAca@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YU0wDzeS/jXwkAca@zeniv-ca.linux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_022250_869038_07982C29 
X-CRM114-Status: GOOD (  19.46  )
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

On Fri, Sep 24, 2021 at 01:55:27AM +0000, Al Viro wrote:
> riscv has an equivalent of arm bug fixed by 653d48b22166; if signal
> gets caught by an interrupt that hits when we have the right value
> in a0 (-513), *and* another signal gets delivered upon sigreturn()
> (e.g. included into the blocked mask for the first signal and posted
> while the handler had been running), the syscall restart logics will
> see regs->cause equal to EXC_SYSCALL (we are in a syscall, after all)
> and a0 already restored to its original value (-513, which happens to
> be -ERESTARTNOINTR) and assume that we need to apply the usual
> syscall restart logics.
>     
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index c2d5ecbe55264..f8fb85dc94b7a 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -121,6 +121,8 @@ SYSCALL_DEFINE0(rt_sigreturn)
>  	if (restore_altstack(&frame->uc.uc_stack))
>  		goto badframe;
>  
> +	regs->cause = -1UL;
> +
>  	return regs->a0;
>  
>  badframe:
>

This looks good to me based on what other architectures do.

For example, arm64 does

  rt_sigreturn
    restore_sigframe
      forget_syscall
        regs->syscallno = NO_SYSCALL

  which results in do_signal avoiding syscall restarting

And x86 does

  rt_sigreturn
    restore_sigcontext
      regs->orig_ax = -1

  where its handle_signal only restarts syscalls when regs->orig_ax != -1

So, for riscv, where in do_signal and handle_signal syscall restarting
is avoided when regs->cause != EXC_SYSCALL and it's common to set cause
to -1 to avoid it, then it makes sense to set regs->cause != EXEC_SYSCALL
in rt_sigreturn or in restore_sigcontext, which rt_sigreturn calls, as
well.

So the only question I have is whether or not the cause assignment
is better in restore_sigcontext() like other architectures? At least,
since rt_sigreturn is the only caller of restore_sigcontext, it can't
break anything putting it there atm...

Anyway,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

BTW, I ran the testcase from 653d48b22166 with the asm modified for
riscv for a while over QEMU. It didn't reproduce, but I suppose that
doesn't mean much.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
