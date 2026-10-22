Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497D6606A319
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 22:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ddm0hfqU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=AUoZs6Vd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FdeYYsxpbNdS6I3u3LG63euC0EKnl77uNOXU23f+QK4=; b=Ddm0hfqUdBqmaXL8+v3L9Ss0Sb
	59GpX/Qhk8FSwpqdRRkd3Fu+jMpiLb98SZ3/GAapFvooJAqen4mFrPYFLNx/EMvY5KDuSfcdbYqem
	OOh7RcwLelBWcu7FNa7oVIpsM71nSuP0F0C+d+DDiGfcA/MQreH12CcFOD21osMZG9ukzBCNiigrp
	PNPsUN0oiPgO72KP9gs7OxkAHIzRfzummvWCj+lknQFL9Q4NRxcMSd7gNCdO4JXM4kJVc+0fg/6eI
	vDCfYLsb6zU9EQikwLHjJhKFr1c/qPKgyV1imfVrFmFt1TIhrtCzWhtxRCkPlH7sIdtXRtDsjRaj0
	VrnFttqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK17u-0000000F4Xq-1TzN;
	Thu, 22 Oct 2026 22:19:10 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK17p-0000000F4XQ-1Fvg
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 22:19:08 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-6ddef424972so177736eaf.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2026 15:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792707543; x=1793312343; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U+fNGXuTxSBSDzV/8UaJRSMWMc2y739xNcnwuXMGhOM=;
        b=AUoZs6VdhT+NSHFTvCUjOoEAtYhl+RW+n9QCu7YLJ9qPIY0T6FXIaC1UWTFHFqcE8K
         nJlLHK90btTmteLF65cNxVyQTv/bws5MVOOm9EqhPTz85R+BacOGgv1k3DYmTff3VCgq
         lHAHDJW6P4WbXoMKwoQspO8medmPGtKM32GJaCbTa21krf/OrudN2A/Lmv33pSGdVq1D
         vuqgD0ghd1cfVfHM11kXVbeAuN4xHQksspj0MoqKfZE5rc1nphMuA6ptNWbTKyXsWOYO
         3XWqrdVWqL3U+TqcCt9LGsi5xPubex18tmqej5g6nWjHUquTvYyYWgQMzvoj0KVIYiFb
         R6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792707543; x=1793312343;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+fNGXuTxSBSDzV/8UaJRSMWMc2y739xNcnwuXMGhOM=;
        b=T0AqVD0UbmhMreT54Akg5/zIAjdex3t0CDfgoKsG4LKUoE7rBBYS0B5gBd/bxGP7vS
         8RW/OYLOPPgbd0lZ215qTMKEa78kITFoqGAV8pv7tI1stEsUlo9mnhPCs5PdCwYLEpNg
         ijHGAdKNi0dtqtQgBEB64jqU0CWjNnzcmbHugQE5e7kxuIkIxT+fDRIouKjj5MdMShfj
         aO8UpHTLW405dSCDIRE0b9tFIS6n92xNNThbbjReI8lJIk7AMG3vpp2eCUDJ7KVqw/Fp
         H5VNQ841c07vEcfAa5saMF3GQo8BFW4aMsncL02aTSKogETCRKDoXnsKH9szrFJrqYwp
         RNnw==
X-Forwarded-Encrypted: i=1; AKwUvByXL0aMIYHUCWF5lZ68xLzhFzSyz4e6KSMis4C8EPuOwCwiHCqleeh/54R6yl+Qak61PzaW6UdonGq4rw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLNZSABy1IOM6+AAhlmpS70WYJNwBv8lowKJltNVC6dfADHfhb2
	/3E1ctpPkCh9C0h0bjYYZGH4bxriCwry5G1gTlFy4BdaF6CQEvREXZ7G6/Pv97pv9yjB4K/TP9Z
	QueJhhP0=
X-Gm-Gg: AYBFou0hTr500Ws2YEBEqD4K1bW0LrxCWyU1l97k27gcqd1EjArkyo6ix4pHejBrvQE
	2pkvhuIqzxDTHIeqRw5rvxgEpwk0YuHZ10yAHDiz22n0WruKIIra6xCq2gp8CaZYgcGQTvwf5wY
	n2R98XL7m5fIwP3O/aaLWAHpPhI6KQ9Gar8Jt1vn+fNFvsHdQDcfLk178Z/2AlsD2uUslIRtuAM
	qJIUuXXIBYmjraFci/t4L+F5b/WbYc+NB/AGS3rT6BYAo2E7X5GyGq2m4sedugMtQYY6+Cf4W5a
	nirpbW4xcFXNhPwZuyRE5ib8EgRTS+RcGpxecg0G0u1mQVH3atL2UGSulTNlYWqV7jfQdvQRjfL
	Oh8vD7SmQUuzm9QY0ZQXSkiKBvW6hu/E49dCXkGk99VCUhzf+LFIYCEx2mjTIngmWxax4D5rIxi
	OLJEFLLPm9YfKCtF6B02qfuMhROEi0zMzeRPUxDy9RUT3UjLqFZz03lHdHqrs8bcBJzCmSKHOyX
	brMFAZj6wGwGFqu5Vy1rx85ndXifvpf7tCXe5U1/P28f5iv34h+cAUgW0BiMGdgREA=
X-Received: by 2002:a05:6820:221a:b0:6f5:eeee:b22 with SMTP id 006d021491bc7-70b88a52a06mr594387eaf.49.1792707543577;
        Thu, 22 Oct 2026 15:19:03 -0700 (PDT)
Received: from localhost ([68.203.12.10])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a82021ea20sm312316fac.0.2026.10.22.15.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:19:03 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:19:01 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, zong.li@sifive.com, wangruikang@iscas.ac.cn,
	debug@rivosinc.com, qirui.001@bytedance.com, guoziyi114@gmail.com,
	samuel.holland@sifive.com, ben.dooks@codethink.co.uk,
	cyrilbur@tenstorrent.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] riscv: Fix SR_SUM leakage across context switches
Message-ID: <atqL1ScMLUg2bM_E@Tao-Chiu's-Mac>
References: <20261022083212.84721-1-cuiyunhui@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022083212.84721-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_151906_371907_09C9890B 
X-CRM114-Status: GOOD (  26.25  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Yunhui,

On Thu, Oct 22, 2026 at 04:32:12PM +0800, Yunhui Cui wrote:
> __switch_to() saves the sstatus value of prev and restores the SR_SUM bit
> of next with csrs. However, csrs only sets bits. If prev has SR_SUM set
> and next has SR_SUM clear in its saved state, the old SR_SUM bit remains
> set in sstatus.
> 
> This lets next run with user memory access enabled even though its saved
> SR_SUM state is clear.
> 
> Use csrrc to save the sstatus value of prev and clear SR_SUM from the
> live CSR before restoring the saved SR_SUM state of next. This keeps
> prev's SR_SUM state intact, while preventing it from leaking to next.

Do you have a way to trigger this bug on existing code or is it the cae
where the bug could happen but we never experienced it in real life?

If I understand correctly, this can only happen when the user access
routing volutarily makes a schedule() call mid-flight, or a code fogets
to turn off SR_SUM right after an user access and has a live SR_SUM when
calling schedule some time after. Both case should be a bug as SR_SUM
shouldn't live in the kernel code that is not doing user access.

A trap-introduced context switch would interrupt a code that have SR_SUM
set. However, since the bit is cleared at every exception entry, the
context switch code would not see a live SR_SUM. Seeing the bit set in
this case means something is not turning SR_SUM off properly.

I aggree that this is the better way to handle SR_SUM in a context switch
but attaching a call trace or stating that "We have not caught this in
real world due to ..." in the commit message would be appreciated.

Cheers,
Andy

> 
> Fixes: 788aa64c01f1 ("riscv: save the SR_SUM status over switches")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/riscv/kernel/entry.S | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 61b7a77166971..628b85e3915a7 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -443,15 +443,15 @@ SYM_FUNC_START(__switch_to)
>  	REG_S s10, TASK_THREAD_S10_RA(a3)
>  	REG_S s11, TASK_THREAD_S11_RA(a3)
>  
> -	/* save the user space access flag */
> -	csrr  s0, CSR_STATUS
> +	/* Save and clear the user space access flag. */
> +	li    s1, SR_SUM
> +	csrrc s0, CSR_STATUS, s1
>  	REG_S s0, TASK_THREAD_SUM_RA(a3)
>  
>  	/* Save the kernel shadow call stack pointer */
>  	scs_save_current
>  	/* Restore context from next->thread */
>  	REG_L s0,  TASK_THREAD_SUM_RA(a4)
> -	li    s1,  SR_SUM
>  	and   s0,  s0, s1
>  	csrs  CSR_STATUS, s0
>  	REG_L ra,  TASK_THREAD_RA_RA(a4)
> -- 
> 2.39.5
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
