Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD840C46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 18:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hIbGKpBr6T+vIV97iYRCYbF4mC93qWaBGKUX8tPecoY=; b=sX+bnVR0IHMbVw
	23mHMrjdcoeb1ZqB5XVU/+Z5WZUWeHNpmmrVc4tE3pUDVUzxy8tCuXud0MTHCN7MVw8TNLf2guKtc
	pqUvOc8Tnvj4jiYGEVk1XmYh3xBWfJD9UJPn43AbvUxTlJ4bYyAMG10d3qxBs6wd64zEmkplJndjW
	GYboW3zuJVl/6yHuKVU5JxiFUbFp5cMqpPVDHdBEjUM0Ij7/vWqyUPrgSY4CFSsajwT4L7ym+WWi+
	AJz2JsriFBrw/9fuqy6Sw7r/iiinSJpuUPNSwZeYirQM7XNBcQ4p8Dea2KAHctzcMoB5DFUspyyso
	e9e0UpdGyt0AwCsbFy7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSi6L-004iOl-1T;
	Wed, 24 Jan 2024 18:35:53 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSi6I-004iNY-2R
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 18:35:52 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3bda741ad7dso4505188b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 10:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706121347; x=1706726147; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BSDyjeT+sWx4a7+HucQkDxlfBX8Yu1AlwACyEiZHipQ=;
        b=1yuNLGqc+Y30ldAQfIlbsiM0QG0kcngnLiLAIMuPaSEQRnp0y97IBHGHnc2DE110wN
         8C42J2RpgJBT06vg3SDsDqFW9wQR/v+1QCHsWZa7We5mFvUAaQF32poP4LbLXTgcGnC3
         RnypTShclJ8LBOEfw9TJcG3p6o7YjXJJWm6NY+stouTxfAmFwRjRNgyeVnCpElrbCp5U
         leOMlfht8Cj6X1Cc3a1RXPxBeBG0MRI9a1YYquPlKUzcoRP77EkGKeGtAFOEiobylTAY
         GhfSVs3AguzTSPIe5LXnreIeXIbt8ihF7n3xf7oPxRMbH7cTm0x2aqgO9LBCFkTNQiTR
         AMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706121347; x=1706726147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSDyjeT+sWx4a7+HucQkDxlfBX8Yu1AlwACyEiZHipQ=;
        b=ccZgqZkZHBlMEYP2/ct38eHHpR5Hi+6i2WKmwbH/S5usydmaPp4++ilDU6F2f2wE1L
         jK9e9btiWF7UI9VP9EXANz6YvLEYh8aa9IteKYYYnDHwWf5jVI81cgjB9mLEgKaRdvNZ
         EqSCtFwHk+ARye+RZODOeY1OHEV/F2a6niL9aTKPvRvz/q2q2wSCnSCDylnHJKEq+/8e
         vcyT0EhALRCrYtKlHdt0Sa1GM/0mkRQb8XVsiCB/0ANDnVJghubvEnX9giSkbsTytqR+
         bpVvNQ1uLI7+SGU5zgatDFHm9CKgotn7U3PQzd1spUNQOLbu5WXzqsh+6Gy045jqLujO
         gOUA==
X-Gm-Message-State: AOJu0YypoE2fzZawCXZnsFiGCbmG6PS2NxqwC65gdDlHsBpgPV+Bo3D6
	qFKl+maizl3A9uR7hlsF8mOV/FnopvjXB3iqixv1RCiwkl73bFKPT8xIwNA2k1g=
X-Google-Smtp-Source: AGHT+IG1yY+FPPP5M4yQmH3acC0a0/2mcx5E1lUmj9dQ7hZv1pU3OA5oy37S1GCeQohq0/uOBCuQyA==
X-Received: by 2002:a05:6871:581e:b0:210:9e85:edc3 with SMTP id oj30-20020a056871581e00b002109e85edc3mr4154038oac.18.1706121347349;
        Wed, 24 Jan 2024 10:35:47 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id t8-20020a63dd08000000b005cf450e91d2sm12079197pgg.52.2024.01.24.10.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 10:35:47 -0800 (PST)
Date: Wed, 24 Jan 2024 10:35:43 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: guoren@kernel.org
Cc: linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, alexghiti@rivosinc.com, xiao.w.wang@intel.com,
	david@redhat.com, panqinglin2020@iscas.ac.cn,
	rick.p.edgecombe@intel.com, willy@infradead.org, bjorn@rivosinc.com,
	conor.dooley@microchip.com, cleger@rivosinc.com, leobras@redhat.com,
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V3 3/4] riscv: mm: Remove unused TASK_SIZE_MIN
Message-ID: <ZbFYf+TDKhPQIpVR@ghost>
References: <20231222115703.2404036-1-guoren@kernel.org>
 <20231222115703.2404036-4-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231222115703.2404036-4-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_103550_791103_09FD7D39 
X-CRM114-Status: GOOD (  12.19  )
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

On Fri, Dec 22, 2023 at 06:57:02AM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Remove TASK_SIZE_MIN because it's not used anymore.
> 
> Reviewed-by: Leonardo Bras <leobras@redhat.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/include/asm/pgtable.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 74ffb2178f54..e415582276ec 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -878,7 +878,6 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>   */
>  #ifdef CONFIG_64BIT
>  #define TASK_SIZE_64	(PGDIR_SIZE * PTRS_PER_PGD / 2)
> -#define TASK_SIZE_MIN	(PGDIR_SIZE_L3 * PTRS_PER_PGD / 2)
>  
>  #ifdef CONFIG_COMPAT
>  #define TASK_SIZE_32	(_AC(0x80000000, UL))
> @@ -890,7 +889,6 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
>  
>  #else
>  #define TASK_SIZE	FIXADDR_START
> -#define TASK_SIZE_MIN	TASK_SIZE
>  #endif
>  
>  #else /* CONFIG_MMU */
> -- 
> 2.40.1
> 

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
