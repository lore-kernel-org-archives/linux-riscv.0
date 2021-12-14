Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6645C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Dec 2021 16:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=rhHB6fKtEP0hJc9YOy69oWZp65Sj8Hd2Wln2Qd+CG5w=; b=PUSC5p5g4shL8sns7RIbdSeNOl
	KBeNCpOqypB37fdiHGDnXIl9xYQDgW5hQSalegTIqL/XSwfLns6vz6PwY5Jcyft+DH1BcQk7w844I
	h05t0dwkDgGwTj1nWgSHePjO3UiH7IqK6yusRYtvSbhHsb2g+Sv+GTVv9r3H92+16NV1w5/ClyW6Z
	x7KP5yARdVuMITh4unffPHVxYLo1af7s4piCig0nuwIRCkbe+xioUh6KXNGldPLYDS2pFb0vzG766
	yrAdRArJA5XTxI1RBhRK9XRhxDI+tWt20jQ1/k1Mp6rdikJSR/PP7v8VItBB/ydk3cRcFY0CStrje
	r8W+R7xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxAgo-00EsoZ-12; Tue, 14 Dec 2021 16:30:06 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxAgF-00EsNs-SH
 for linux-riscv@lists.infradead.org; Tue, 14 Dec 2021 16:29:33 +0000
Received: by mail-pf1-x432.google.com with SMTP id z6so18269327pfe.7
 for <linux-riscv@lists.infradead.org>; Tue, 14 Dec 2021 08:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=V+ydo3gew2SKxvpZ3hxRhW+QZ1Gz2SK9X1d8Iz9cNxo=;
 b=R00rhPSQX8t8g4zJf1i1Il6quwQB+ml3G14WFmUpwHwFfoyrSR9upCnwgrVingJr+R
 hEPSQv2Q8W9CMjQ/NglGNJIF8IO6zsakR2AB4z5QeEvDD8p8YroTGrFI0gfG7nGVWN77
 biP52ICj9SCqUOTn7WxsL7tEuTzHU/lBb6rwuQgCLeeW8lyy8VhKVEuL4j0vwDPpVZLi
 yKeD1nG3olaKzCBtwZvBoV1hsMy2AUCzEW6eN8LU/HFtcvFK9xAeND6NqLEehcom3jHL
 37bKgpw0sHtsI1ZrjrW0+S9M+45CRsQAEHPCeazKdnoigJscg6pGD/Cdh+fmJqWyGLGg
 D0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=V+ydo3gew2SKxvpZ3hxRhW+QZ1Gz2SK9X1d8Iz9cNxo=;
 b=vz3Y2DlJ+6o2MEUp4XtUmcyfsJxD4S0D3tp22fE71XGIHoZpuGxW5AGPWfkshzVpMG
 72RQE7hz/UatXSlvp/5mLLXM+Qum3V35gYTHnJv/5v48wJCocglDBrW/RGIfdMFMA6El
 TNOafZrKqEJKxrsQj6Nd+eYpP9jlD6k4o+h0G2sZ2WGQyeud4PZXbX2n5sxF2gZAT45g
 vhorb1/cmyjLNUFEbsOAOdolOZMGtkroGzZYPJZ184dduPDc1xMGAxnUrl9Flwclsts4
 Pfi+WPWhV0UXsGHhTY6l8ZGGrNWo4pwwWknt2DXhidmRjZ69/AnRy/Kau7r/oHOFs767
 IHrg==
X-Gm-Message-State: AOAM533wtahI0FVKapTUwdKGeCvpmKguTFydMaMlPb4ZI+JGMna2STqG
 Wh0a1A1lkz27cqRW4b97nsypGA==
X-Google-Smtp-Source: ABdhPJyYKf1iQgpEISETh/1o3WuN6++61aQmoVgMfqwklhdicGoc4eqPhD8/epozrfONZ7jod4JW+w==
X-Received: by 2002:a65:4941:: with SMTP id q1mr4513985pgs.123.1639499368927; 
 Tue, 14 Dec 2021 08:29:28 -0800 (PST)
Received: from localhost ([12.163.77.120])
 by smtp.gmail.com with ESMTPSA id v13sm368582pfu.38.2021.12.14.08.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 08:29:28 -0800 (PST)
Date: Tue, 14 Dec 2021 08:29:28 -0800 (PST)
X-Google-Original-Date: Mon, 13 Dec 2021 19:34:29 PST (-0800)
Subject: Re: [PATCH v9 07/17] riscv: Reset vector register
In-Reply-To: <8612e69a10235e67fac8a55864e77a4ab8f771ac.1636362169.git.greentime.hu@sifive.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: greentime.hu@sifive.com
Message-ID: <mhng-591e217f-9290-464e-ab17-91fd84bed22b@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_082931_957292_C0C136A0 
X-CRM114-Status: GOOD (  22.63  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 09 Nov 2021 01:48:19 PST (-0800), greentime.hu@sifive.com wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Reset vector registers at boot-time and disable vector instructions
> execution for kernel mode.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Co-developed-by: Han-Kuan Chen <hankuan.chen@sifive.com>
> Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
> Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  arch/riscv/kernel/entry.S |  6 +++---
>  arch/riscv/kernel/head.S  | 22 ++++++++++++++++++++--
>  2 files changed, 23 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 98f502654edd..ad0fa80ada81 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -77,10 +77,10 @@ _save_context:
>  	 * Disable user-mode memory access as it should only be set in the
>  	 * actual user copy routines.
>  	 *
> -	 * Disable the FPU to detect illegal usage of floating point in kernel
> -	 * space.
> +	 * Disable the FPU/Vector to detect illegal usage of floating point
> +	 * or vector in kernel space.
>  	 */
> -	li t0, SR_SUM | SR_FS
> +	li t0, SR_SUM | SR_FS | SR_VS
>
>  	REG_L s0, TASK_TI_USER_SP(tp)
>  	csrrc s1, CSR_STATUS, t0
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 52c5ff9804c5..551afe1de85e 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -242,10 +242,10 @@ pmp_done:
>  .option pop
>
>  	/*
> -	 * Disable FPU to detect illegal usage of
> +	 * Disable FPU & VECTOR to detect illegal usage of
>  	 * floating point in kernel space

Presumably that should be "floating point or vector", like the other 
one?

>  	 */
> -	li t0, SR_FS
> +	li t0, SR_FS | SR_VS
>  	csrc CSR_STATUS, t0
>
>  #ifdef CONFIG_SMP
> @@ -433,6 +433,24 @@ ENTRY(reset_regs)
>  	csrw	fcsr, 0
>  	/* note that the caller must clear SR_FS */
>  #endif /* CONFIG_FPU */
> +
> +#ifdef CONFIG_VECTOR
> +	csrr	t0, CSR_MISA
> +	li	t1, (COMPAT_HWCAP_ISA_V >> 16)
> +	slli	t1, t1, 16

Why?  Shouldn't the "li" pseudo handle generating that constant fine?  
It generates the expected lui for me.

> +	and	t0, t0, t1
> +	beqz	t0, .Lreset_regs_done
> +
> +	li	t1, SR_VS
> +	csrs	CSR_STATUS, t1
> +	vsetvli t1, x0, e8, m8
> +	vmv.v.i v0, 0
> +	vmv.v.i v8, 0
> +	vmv.v.i v16, 0
> +	vmv.v.i v24, 0

I don't see anything resetting vcsr here, which is explicitly required 
by ISA manual.

Otherwise this looks OK to me: I wasn't actually sure this was guaranteed 
to hit every bit in the vector register file, but IIUC it does -- VLMAX 
has a defined value, VLEN is a constant, and this form of vsetvli is 
defined to set vl to VLMAX.  Probably worth a comment, though.

> +	/* note that the caller must clear SR_VS */
> +#endif /* CONFIG_VECTOR */
> +
>  .Lreset_regs_done:
>  	ret
>  END(reset_regs)

With those minor bits fixed,

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
