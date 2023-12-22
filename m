Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53964C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 05:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yCPJENNXOvLa2gj6SeRh1uJmm8XQUvcspfaXuXmjx8A=; b=ygJdsynjqNgbBf
	p9Zy/dBf7PCD+tfb9jU/NEIRgSD1fVi5lQwqTJrVzVnlsFczF5VOTa9xSJUQc3PXs1/S7RhaFc7iJ
	cL2G1aMKDnHldjAOixvBWgvdYKaLN3LvxBYMaEubOQ1s61kOa1vap3QMdZAhd9FiYMm6+pQhUs4I1
	ie11zalNeoHo1Ngr0EHsGzX1sMIm0IQgTiJn//mCyiagOVL1lG/GrL0cD9Ws8ewQO4Rh/Lz+kT1BZ
	ODjOFVOVpMnrvs+ewFq9kGqMKpLyBR65cBUnWXCN92ySbccjdmVf3mlkry42HOF09E5f3scntRtd2
	JkWGwkgp7ht/8f2naY1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGYCA-004zry-0z;
	Fri, 22 Dec 2023 05:35:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGYC6-004zpR-2y
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 05:35:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 66FDCCE2144;
	Fri, 22 Dec 2023 05:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93215C433C7;
	Fri, 22 Dec 2023 05:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703223325;
	bh=vboYWa8IcLdU/KZCHXDXuRY/OVBiF8/Wmh+i279Iwls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Brv9rJ107PsGTsNZ/uGhtErK5jg7FeGbabI1HDzVbIoqYcxRHmrhCClxCO14V6grr
	 ZNJhheB5dPeDHu5gPLGUrz5vSnLxk8y98wqz41o1GigOilWZPWWBIDdw6z27K85lJ0
	 +loHQyXmKtM7dSkC9WS1/+gvwAa/nkQo3ianadQ7bzW2sZFLnMPlRsO8Cdm5j4vTNO
	 vZ9CY2ZT7agd4vAVrqRedFlJeGzHoNtX1/vM0nSmedSQLw9+yVASeTLnkgzOlODNeb
	 pVb4WmVHD2GI5/QR13OPT74yQgVbYWCXMi/vV6UP6WDEEhoTnHLQnU/Xd5Fv+QUZER
	 EtNXaWfgSDWRw==
Date: Thu, 21 Dec 2023 23:35:19 -0600
From: Eric Biggers <ebiggers@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, bjorn@kernel.org, charlie@rivosinc.com,
	ardb@kernel.org, arnd@arndb.de, peterz@infradead.org,
	tglx@linutronix.de, Albert Ou <aou@eecs.berkeley.edu>,
	Vincent Chen <vincent.chen@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [v7, 02/10] riscv: vector: make Vector always available for
 softirq context
Message-ID: <20231222053519.GD52600@quark.localdomain>
References: <20231221134318.28105-1-andy.chiu@sifive.com>
 <20231221134318.28105-3-andy.chiu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231221134318.28105-3-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_213535_185803_FADDB59D 
X-CRM114-Status: GOOD (  16.50  )
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

On Thu, Dec 21, 2023 at 01:43:09PM +0000, Andy Chiu wrote:
> By disabling bottom halves in active kerne-mode Vector, softirq will not
> be able to nest on top of any kernel-mode Vector.

kerne => kernel

> 
> After this patch, Vector context cannot start with irqs disabled.
> Otherwise local_bh_enable() may run in a wrong context.
> 
> Disabling bh is not enough for RT-kernel to prevent preeemption. So
> we must disable preemption, which also implies disabling bh on RT.

The body of the commit message should explicitly mention the goal of the patch
(support kernel vector in softirq context) and why this is a desirable goal
(e.g., make it so that some of the crypto algorithms won't need fallbacks).

> diff --git a/arch/riscv/include/asm/simd.h b/arch/riscv/include/asm/simd.h
> index 3b603e47c5d8..7df5a976a80a 100644
> --- a/arch/riscv/include/asm/simd.h
> +++ b/arch/riscv/include/asm/simd.h
> @@ -28,8 +28,12 @@ static __must_check inline bool may_use_simd(void)
>  	/*
>  	 * RISCV_KERNEL_MODE_V is only set while preemption is disabled,
>  	 * and is clear whenever preemption is enabled.
> +	 *
> +	 * Kernel-mode Vector temperarily disables bh. So we must not return
> +	 * true on irq_disabled(). Otherwise we would fail the lockdep check
> +	 * calling local_bh_enable()

temperarily => temporarily

> diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
> index 105147c7d2da..db0cf06f2abf 100644
> --- a/arch/riscv/kernel/kernel_mode_vector.c
> +++ b/arch/riscv/kernel/kernel_mode_vector.c
> @@ -23,7 +23,10 @@
>   */
>  void get_cpu_vector_context(void)
>  {
> -	preempt_disable();
> +	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
> +		local_bh_disable();
> +	else
> +		preempt_disable();

Maybe leave a comment here explaining why softirqs are being disabled?

Otherwise this patch looks good, thanks!

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
