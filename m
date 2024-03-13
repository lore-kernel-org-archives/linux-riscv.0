Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9571C54E5D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 02:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bf1zac6TWDiXzmXnzXG6XM3foWtRNZlqygKG5z/5dCY=; b=AhVKLMmCFS/0GL
	mAwAJf59E77k+KXoB6OebM1EzqqFRnD4rqrDQLFXRq7wBdzF0rB00T+tYu1gXoeOREEk/l1W4mrt1
	0X+9Pr2yJkIy1oikiIhqh2dkIR8F9rxsPRPUk0PWOZyPmAc3xYRIDSqz7bcfZsHGoEK3ac0lcYvI1
	KnX1/jK2n0KICb5muQAb6MdfkrFOm+mvtyBnL2dr5ktOL6BBNrn+YzwNmZJfiDa9lvsGp0mJEx8Ym
	H2Zsmyg1dhJZfa8f7kCqKI3X9mif3jav+I9X0tKewyHotr8+SEQdns3JCQIN7otqDIpTfiBm1kUBv
	jCEVuyC08Y9qWYSlxkNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkEkX-00000008afP-2A8q;
	Wed, 13 Mar 2024 02:53:49 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkEkT-00000008adR-21Md
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 02:53:47 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1dd955753edso27304625ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 19:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710298424; x=1710903224; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nm82SO2BpNSLFwSI+4lS3PD4XXk2jhZjxDf4bI5jTqc=;
        b=O/MhYiOwtNFpt4cgzM1AU2xacJEhZbRUh1bL4tSiANKSkhlDZOL+CxP9y3gsgLNmeg
         OPz0c/3b+P98WcIn0sdwgPJHq+to0GlqdUg9hx7MJvHwFwOBV7brqEy1aAQS4XcK87yT
         ptvPMd5cjLNypKK9NdK/kNUz+vdoitDG+56hQvjPqfYbgZkE+QpC/H6yGUlX++YlEk8R
         8dUcozfu6KoII2zqss8WJfjWHiudc1XedD1VrhAWHVdmJFYdjhfc3S3EAi+djwFr1fHF
         M+YEa4i+9bC97oy4h2PWl1p5E9iHpug5ZFGmx/97nVB4m//84QRyWVHmPkjabvGhJWXB
         Wt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710298424; x=1710903224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nm82SO2BpNSLFwSI+4lS3PD4XXk2jhZjxDf4bI5jTqc=;
        b=EugJheokTWLbH0r4BBPnKf78zJcSb7JM1ERX9ls/ElIrvXNYukZL2BCp1sV5ZHewQH
         SzaqLUTGOtRBBNrwbxDtEdDCUfieRy6Kca0jyZY2KzABfLZGxWWclfJuGlPLxYkDCCZV
         UxENWp3HRGCha0NH06BG5hkB+TQs8UKpDF+56KN9gZbV9Dv3xHAGQ2JZKk6FngdR5Z37
         WcPlLaJx0njco+AGog6at4svqPqYz0KnOdDcgsv1rQr/2UDInVylCq1+5NZysee17cWV
         tsiaXTLt1wr0thUdIe+bcw/G0detAvzFiHdmbKTaIAOuTOxgEbDlzFaRzcQiUfPSYYU2
         ydUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzUYrZgRiV/zGAAGjuQw3FUHJVm9q5sj75zDkxFH7SdE2PTcO8eJV/qZGP+Whi81E6S8K8w9k18ZWwMuSOE8IyoveG/k7nzapTKSIzDvYX
X-Gm-Message-State: AOJu0YwrhZ3bOgApT16HSotTWPbN+NIKfMBPYIn7KRqtYlEGsLty+tT2
	DPgsQPEXztPq5vJ7H5IK+Ooaf3in0Yt07Y8EcQOqhYihdZh83qdqahiXlqd+ZpM=
X-Google-Smtp-Source: AGHT+IGWxCpTXsK47de51P3AiM9hzji/3eB3TD8nuRB8rKNVi8mjNxa71yE5XsNC9R6lpX1df1eX9w==
X-Received: by 2002:a17:902:d2c5:b0:1dd:9984:29d3 with SMTP id n5-20020a170902d2c500b001dd998429d3mr9473835plc.32.1710298424071;
        Tue, 12 Mar 2024 19:53:44 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:733c:479a:4b7b:f77b])
        by smtp.gmail.com with ESMTPSA id e15-20020a17090301cf00b001dd55ac5d78sm7442926plh.184.2024.03.12.19.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 19:53:43 -0700 (PDT)
Date: Tue, 12 Mar 2024 19:53:41 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] riscv: Fix spurious errors from __get/put_kernel_nofault
Message-ID: <ZfEVNbt9AMeVJS0k@ghost>
References: <20240312022030.320789-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240312022030.320789-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_195345_653750_B7C8683D 
X-CRM114-Status: GOOD (  24.40  )
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

On Mon, Mar 11, 2024 at 07:19:13PM -0700, Samuel Holland wrote:
> These macros did not initialize __kr_err, so they could fail even if
> the access did not fault.
> 
> Cc: stable@vger.kernel.org
> Fixes: d464118cdc41 ("riscv: implement __get_kernel_nofault and __put_user_nofault")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> Found while testing the unaligned access speed series[1]. The observed
> behavior was that with RISCV_EFFICIENT_UNALIGNED_ACCESS=y, the
> copy_from_kernel_nofault() in prepend_copy() failed every time when
> filling out /proc/self/mounts, so all of the mount points were "xxx".
> 
> I'm surprised this hasn't been seen before. For reference, I'm compiling
> with clang 18.
> 
> [1]: https://lore.kernel.org/linux-riscv/20240308-disable_misaligned_probe_config-v9-0-a388770ba0ce@rivosinc.com/
> 
>  arch/riscv/include/asm/uaccess.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index ec0cab9fbddd..72ec1d9bd3f3 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -319,7 +319,7 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
>  
>  #define __get_kernel_nofault(dst, src, type, err_label)			\
>  do {									\
> -	long __kr_err;							\
> +	long __kr_err = 0;						\
>  									\
>  	__get_user_nocheck(*((type *)(dst)), (type *)(src), __kr_err);	\
>  	if (unlikely(__kr_err))						\
> @@ -328,7 +328,7 @@ do {									\
>  
>  #define __put_kernel_nofault(dst, src, type, err_label)			\
>  do {									\
> -	long __kr_err;							\
> +	long __kr_err = 0;						\
>  									\
>  	__put_user_nocheck(*((type *)(src)), (type *)(dst), __kr_err);	\
>  	if (unlikely(__kr_err))						\
> -- 
> 2.43.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

I am not able to reproduce this using Clang 18 with
RISCV_EFFICIENT_UNALIGNED_ACCESS=y on 6.8. However I can see how this
could be an issue.

Going down the rabbit hold of macros here, I end up at
arch/riscv/include/asm/asm-extable.h where the register that hold 'err'
is written into the __ex_table section:

#define EX_DATA_REG(reg, gpr)						\
	"((.L__gpr_num_" #gpr ") << " __stringify(EX_DATA_REG_##reg##_SHIFT) ")"

#define _ASM_EXTABLE_UACCESS_ERR_ZERO(insn, fixup, err, zero)		\
	__DEFINE_ASM_GPR_NUMS						\
	__ASM_EXTABLE_RAW(#insn, #fixup, 				\
			  __stringify(EX_TYPE_UACCESS_ERR_ZERO),	\
			  "("						\
			    EX_DATA_REG(ERR, err) " | "			\
			    EX_DATA_REG(ZERO, zero)			\
			  ")")

I am wondering if setting this value to zero solves the problem by
hiding another issue. It seems like this shouldn't need to be
initialized to zero, however I am lost as to how this extable setup
works so perhaps this is the proper solution.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
