Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA23C02188
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 01:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zSLPkN/FjqJ8TQBiHUgbaVzoa9FKuoBV8yeJ22ussCU=; b=j3dLqI2zSFoMFW
	Lm6Hc1JXbM0lvNpKFyUaV4LFwpW3Di1ZI5uYHG2U8aqzXSQwE6xfvDaCG3iK8q75SDoy307AKp+cv
	gFZc+opXbe6gtn+JLqZYHl9zE2q2BmabJBiTDb63yPMo4XoKoKQbp/KA2va9hk2BdTC+l73GPqdDS
	ZLNlqIO1esWG/Kf5e3TxSSv9WA93sIP6dVIYeLvnPktY898xfpM/a8a9cqtBFiK2mLYlwl9o9nosZ
	R/rP3sVw4ZGfdJ2WAnb25v2vdGYeEugoEcHDHQKi5eDobAqe8oEuYwcEsZH+SPJEuk1ewPFHjOMmA
	lOHwN1hmML6/dA4bUpnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcZyl-00000003s95-2Jde;
	Tue, 28 Jan 2025 01:01:23 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcZyi-00000003s8i-2HpH
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 01:01:22 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2161eb95317so89567345ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 17:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738026079; x=1738630879; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AdvXF/06rw3JWajKJVdjaObpAq/QOTiiqtQg8F4NUu4=;
        b=Wu/KoYF8C8hthH8fk85nxMFLX75Xz2NhrHT6GMYtqGqoBVVTyqM7hfb1Xk+2lUWwDS
         sBvAoPxVkcREstqzNV4fslURLWipH+u6VRl9k7o/cgZiyOQ1rdijrTlafKGHUVD49iK0
         IkTvt1BldXWWxEgna3zPQ6o+5/CF43DwuUzcl788njTkFQ3xHYhntYI+EDGijs/QYO/S
         Ul41lWzHtJU+MthkKw6vrA8tYTtFZTPycloFdEbxpGOQPFAVbVpw50r+JoBlV3KGXE31
         f2zn8yrmj1IoDuPyFgNZFBo5DNEKPqstW3SWf5ZlctGRsfmSIoor/EkLGQGO/vuCt4DQ
         H1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738026079; x=1738630879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdvXF/06rw3JWajKJVdjaObpAq/QOTiiqtQg8F4NUu4=;
        b=hAzUx3QjsGceI1pj4GWq7eKPovB7+PWCPtw2kV298JEBbAkRdNh9H0WodnLzDnzAXa
         NpImhLncfjS0gvJAj5U2w/SuJU4GKI4t7XiaLHHiXgnZcjE2sjcS96fGGQ8hHAIR8M8Y
         zdIovJDQi4UhCcff+HmT8dK3YbJUIrkZh2NVo5KhPnsHi5xkFn88PdtsD4Fbw8J9TSpM
         C/pFdiCv3P+rcla0NX1LQ6SwmtUwxzjmwrapxhwXJpWvW6JbP17W63FBdePbdwFBgOIj
         6EpS3GSqdxgxI7654Rvg7NkzF1VC4J6Xm3/KIUmTQj0Ii7L9X1lqyjsv0OM/D5ga312u
         6Dsg==
X-Forwarded-Encrypted: i=1; AJvYcCV+u4hoIL2xFCQrswgjVUeo5AWv/hKX24+PdZXAJMCyuEFvU8DcSPW67H46w2A5aNtDaoUdl9Fswbw3KQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxcaws7jqrIcmQhPl+VsPmDSKGVntdJ3q1lylkdAQU2ZJdjb+cX
	pv13so1ELNbsudIMFknadw3Kjs4n5U3bm/rZ280dD2DSRIrC68Gmp8kd7Nd9S50=
X-Gm-Gg: ASbGncsUeqBQCF3+MC5NJFfwIacyrYaSag8hp/GuXWB4OSIs26x43NKnfOJEv3Wj3X1
	IH9DeSDwVoysxh+m2mLqW4uuBEf5ZJX9g3gSXz6W2ma3dTZ5B9kuUjsPffmI70+OfkJdX21qca0
	oSeGQOA78a/x2wv/h15tO7hRiU4sn0iiUYzkz3er8hULlXsyR4SZ1C7uHWEamlGb7xfTrJKXX+i
	QIfFLXo8KSxSJqujS0/va3a5gn+OfrHEWuGUvGrGnqUD4M77uX2HSTJpbsGi605jiuEByg=
X-Google-Smtp-Source: AGHT+IFVBFMzrPOfRNaXKJOAOYsihakJV6+gPXdJMfZPhkNAiNfA3ERRtj7JvV6+qKvCboufH+rwGQ==
X-Received: by 2002:a17:902:e802:b0:215:827e:3a6 with SMTP id d9443c01a7336-21c355ba38amr728789655ad.40.1738026079567;
        Mon, 27 Jan 2025 17:01:19 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da414142asm70229695ad.148.2025.01.27.17.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 17:01:18 -0800 (PST)
Date: Mon, 27 Jan 2025 17:01:16 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alexghiti@rivosinc.com, puranjay@kernel.org,
	zhangchunyan@iscas.ac.cn, cuiyunhui@bytedance.com,
	guoren@kernel.org, bjorn@rivosinc.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Remove unused TASK_TI_FLAGS
Message-ID: <Z5gsXJSmpOL4KEKU@ghost>
References: <20241109014605.2801492-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241109014605.2801492-1-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_170120_852512_6AE94B25 
X-CRM114-Status: GOOD (  15.43  )
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

On Sat, Nov 09, 2024 at 09:46:05AM +0800, Jinjie Ruan wrote:
> Since commit f0bddf50586d ("riscv: entry: Convert to generic
> entry"), TASK_TI_FLAGS is not used any more, so remove it.
> 
> Fixes: f0bddf50586d ("riscv: entry: Convert to generic entry")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
>  arch/riscv/kernel/asm-offsets.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index c2f3129a8e5c..d3ad87fcf1ef 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -36,7 +36,6 @@ void asm_offsets(void)
>  	OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
>  
>  	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
> -	OFFSET(TASK_TI_FLAGS, task_struct, thread_info.flags);
>  	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
>  	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
>  	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
> -- 
> 2.34.1
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
