Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E489606A319
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 11:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=abGq9jMt;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S38n80tY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GiZFf6KsNlVJKCCFcIlihQ6bh29Geogzq0mXM9qJC6s=; b=abGq9jMtP4eaY+U7GE+Z6LqtG7
	DOfRF9rG4ttd112OaCzqFXwugt3K6AdEEfhXR/VTYj6biq/C8lXDLGo+h1QDLAs1DoX8aPguZzHGq
	Z6qPcAJMBpt25pWVvGHUsqoWzd/XUWMMgx9sx2fJVVFZJ8+ClxQXpBvV8L6A/+1Ae+6fEpiT5SdgK
	60J79+lCFxISYBaxjEgyJETF+RdBPs651VpPlJVua3Tf8rCZvRZZavkpPs7VpT+k05XwT+Itwt+Xy
	dLiFUbgNl9hkYwJK5C+zBPT4nkzJXVO43PKDJlXrZlKPhQ4NMO5LSRW85oBOKuJYHwxHLWD8DWxtY
	TNaRfnvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqyX-0000000E0ht-0G2w;
	Thu, 22 Oct 2026 11:28:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqyV-0000000E0hm-3ByG
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 11:28:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E265F60018;
	Thu, 22 Oct 2026 11:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47EC1F000C1;
	Thu, 22 Oct 2026 11:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792668526;
	bh=X+uTy5UwL80tB9FDgwbsYL1qPK+BRoTAXASC5ApenoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S38n80tY6Zrqc+C9bHVJ6Ov279IARItkHIQj/Zk/GYPSvNq5C8kw4gabZ4bOZEdv7
	 eKEHVedT5vIAGy8q6jBPXZDXjHu7D/pWSEP4sFSOTiLb0tXHnufGwiR2iFKsVe+7UE
	 CaH9fdTd9FFx/rwsyxBB1vvVB11mUbka2K3KOapYFWycnBrmlKV4bNr4OA0zA1d7gU
	 ohZgRH0M54Uf6pTWwtRZIMYxbZdzKWrUz71GQlPjTDGaRXM4LzhTk4aucyAtgbgDqM
	 6kF0y9A3vdY8raLvFPKJ+aZ4thNMglMmo4yt94EkSSwwnJ/EVE1z66y1M9cbKgiM1c
	 g6p8725Z/ZMmQ==
Date: Thu, 22 Oct 2026 19:08:39 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, zong.li@sifive.com, wangruikang@iscas.ac.cn,
	debug@rivosinc.com, qirui.001@bytedance.com, guoziyi114@gmail.com,
	samuel.holland@sifive.com, ben.dooks@codethink.co.uk,
	cyrilbur@tenstorrent.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] riscv: Fix SR_SUM leakage across context switches
Message-ID: <atnut7gKRKzDoqBf@xhacker>
References: <20261022083212.84721-1-cuiyunhui@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022083212.84721-1-cuiyunhui@bytedance.com>
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
> 
> Fixes: 788aa64c01f1 ("riscv: save the SR_SUM status over switches")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
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
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
