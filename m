Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CD1C54ED0
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 03:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sgRv5R68g0k3DOCyFfyq74DYIXOPy6mcxb8YghbFGw4=; b=gZrih4Qn3GjEz4
	oEUhzkVZ/BH5aOB+Qt7ctxvAVM+gBUiE5PQnht442rPwiKxZVlASzf14W5knQuueWkr4cn7LkoLKb
	oqQl5s5lrWkKaOro9Ep/JC0W4Vxm07F2xnMX5fLx/PpH/bMTeWj55mkxYDzDRWiS4K7bXWj/xB/MX
	BwfkUpoW1IWsVK6GpHT9rCuXxXXcEG8x07SI6OFZO4mvNPOfJprkELUnww7eS0eIG5VtsGZb/qrZs
	CnAcwWFGvr9V9p/k5XIygdwrzRPsroINDqQUPAOAkv6zVG3kYpugMTVIYj0BMiPFqDNaxWlL23iXl
	QPjilg88XllwHnBJHOSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIIse-00000002nih-3xWB;
	Fri, 23 May 2025 03:15:32 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIIsc-00000002nhf-0uOj
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 03:15:31 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-30e9e81d517so5200813a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 20:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747970129; x=1748574929; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zf4cQwVYXNPOaen5hCKSUgiQvAl4J3+F/oWEnqL3rNw=;
        b=QxfBPxdSz7BXPGCb2j87TAU0qZLcG2tinxkj26MFqHE8+sCqxZRamw6bRoHYxvUHbT
         o9iZ9f3fASr24sEWVXqtvZp2/8u+4LvtDNr0vMxp9haR5cJt74C2zmsKc3bQdPtsq3TS
         Yb0gs7ChJ24LCbn7kvwDPJyBGTaKAjeVRmd3AmDYYkzgNtDBEs9mtqASXS/mR0EQ64qm
         QCVz8KoC/0PBXhHCqdK+tVVIUtelXQxQZNCXSWtKy48xPy1WH5/2Pcvzv/EPD05kCeUW
         T8wFLjEsNtnzi/mk8ZBV/dTRN7Z/Qo1cgtHm9RJ6tradmsTHoKocYyWftEUKa6IsyU0a
         T1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747970129; x=1748574929;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zf4cQwVYXNPOaen5hCKSUgiQvAl4J3+F/oWEnqL3rNw=;
        b=XZKupRyiiLx1bHHFGn6HXJgaltA/bMHcgZFaYr4chziiL6VwEFQTu8Hg7280VC3D4Y
         a5a65JtQBQFAvgzr0xVNKAZYf7H38/mhmlNeRfUai6T8eBjn3ElSfCDySpXbJehfWvnm
         PLnwLONzn1+Tjtiygi0jgclFkef3rAPd7+igXn0sk2X/P8vQUN9oJTDh5ts3OJcv3GSl
         lLjNoZ3yoAea/ZMVwmq9vfBM59VhL+YkVBkFO06WLmEHIR3PxnFeTzFLdtCmoBGHKpQA
         0C7hzgKxPdNJYihYzncaeuNSBr2g3cEB+Xb3rWYHcd7xZgAVEeHcgzhp+jhxqFU7diPJ
         VO+w==
X-Gm-Message-State: AOJu0Yx8sLxkaUOyz2m4ZsilyHyT/hGPN01h97/Et5ct9Fa8D3XDGStJ
	J+ozzokiOmjM1AhMAmK9pDk0wzbapR7pMlizPFgyV04W3MhFnHs9mqTluACml2VBzk8=
X-Gm-Gg: ASbGncv50mm2NFyPBicwx3+RnpZoKAeMAsMGAG/gVxRroRKosB5QNnvd48+NV8MSYUJ
	6iSUsWVH30M9E9R7R0uPuy7hF5uhFAQwobm2s87eQEjV4zzwKPd5/MJoHePSimcuV6DMrMlHS18
	aXveInpZi95xVc8BUFoo5qmil8Jv+BPl/G53mxDvlHPlCEr40B4J38UtAnw+cuY1BbD9tctPLfF
	1kkPaTTkNJAOvMbsuejcQemmmwz/XZeTwIye6fWVxhPYn9a0lSZzEciWpeceZugobRSZVZV3CqT
	e+LHb2qIOnOu7Q3lfnYE7cJ0TTvQrqeq2lVhk86sI/Slb2Q=
X-Google-Smtp-Source: AGHT+IH9g1UYXJOSTj47YTF5i+3BMDAkYSeXiUVwIW9JAnWRQLqmnr8cIxWa5eVMHVjEfljqT4Hirg==
X-Received: by 2002:a17:90b:4a50:b0:2fa:157e:c790 with SMTP id 98e67ed59e1d1-30e7d4fe8c3mr36468278a91.5.1747970128754;
        Thu, 22 May 2025 20:15:28 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:45bc:d2a6:c583:3b04])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365f7a27sm6292567a91.48.2025.05.22.20.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 20:15:27 -0700 (PDT)
Date: Thu, 22 May 2025 20:15:25 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Han Gao <rabenda.cn@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jesse Taube <jesse@rivosinc.com>, Andy Chiu <andybnac@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: vector: fix xtheadvector save/restore
Message-ID: <aC_oTWjLMUfgKeIK@ghost>
References: <c221c98dc2369ea691e3eb664bf084dc909496f6.1747934680.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c221c98dc2369ea691e3eb664bf084dc909496f6.1747934680.git.rabenda.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_201530_521080_67973533 
X-CRM114-Status: GOOD (  12.77  )
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

On Fri, May 23, 2025 at 01:27:01AM +0800, Han Gao wrote:
> Fix [1] save/restore vector register error
> 
> Link: https://lore.kernel.org/all/20241113-xtheadvector-v11-9-236c22791ef9@rivosinc.com/ [1]
> 
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>

Thank you!

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
>  arch/riscv/include/asm/vector.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index e8a83f55be2b..7df6355023a3 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -200,11 +200,11 @@ static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
>  			THEAD_VSETVLI_T4X0E8M8D1
>  			THEAD_VSB_V_V0T0
>  			"add		t0, t0, t4\n\t"
> -			THEAD_VSB_V_V0T0
> +			THEAD_VSB_V_V8T0
>  			"add		t0, t0, t4\n\t"
> -			THEAD_VSB_V_V0T0
> +			THEAD_VSB_V_V16T0
>  			"add		t0, t0, t4\n\t"
> -			THEAD_VSB_V_V0T0
> +			THEAD_VSB_V_V24T0
>  			: : "r" (datap) : "memory", "t0", "t4");
>  	} else {
>  		asm volatile (
> @@ -236,11 +236,11 @@ static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_
>  			THEAD_VSETVLI_T4X0E8M8D1
>  			THEAD_VLB_V_V0T0
>  			"add		t0, t0, t4\n\t"
> -			THEAD_VLB_V_V0T0
> +			THEAD_VLB_V_V8T0
>  			"add		t0, t0, t4\n\t"
> -			THEAD_VLB_V_V0T0
> +			THEAD_VLB_V_V16T0
>  			"add		t0, t0, t4\n\t"
> -			THEAD_VLB_V_V0T0
> +			THEAD_VLB_V_V24T0
>  			: : "r" (datap) : "memory", "t0", "t4");
>  	} else {
>  		asm volatile (
> -- 
> 2.47.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
