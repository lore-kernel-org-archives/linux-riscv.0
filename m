Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021BDC54E71
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 19:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JiXC1gfj7yNoEHVO+9KjyY9shNejyHmaixtuegzX4H4=; b=Wkts3HyxNNXnRybmzs1JJVf1mS
	TxxqCxLY9pJMv48Q6WhlsRUVJc5GtoEGQtMINhWFLjM/1WEo+PHn4tUNO+oTElZzMLmDauyh+uUE5
	cTQa/a+Qav/mo9PVDSy4aCSgHnhIzPt/r5RHF6jikEpZ2iFwAd5XWewD2vsR3fRjcMYW+NGHOYdkv
	1Xh3dD7zRw5WEvqJNT3lqhz9S0wnWDWUH+jWpGEzjeEsjfs74aW76Z9p1HofFMy6yOjnjfMrLv4D0
	YqY5xH0sKwX7M4vHLy2xoNDsmJtS/qxY95S/uSqyRAmKgVo+1DpiazddjlQxNAnhqShLHzP6q731L
	oz6cIuxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnkCy-00000008Rj9-2hd3;
	Fri, 22 Mar 2024 19:05:40 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnkCv-00000008Rht-1QZ6
	for linux-riscv@lists.infradead.org;
	Fri, 22 Mar 2024 19:05:39 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6962950c6bfso22465416d6.2
        for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2024 12:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711134331; x=1711739131; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a6WGCJ5v+lTsE9g6YW58u86G+mWvoH1YiexQxNMU+bg=;
        b=jU/5kOtYMbqYy/fJbcPbYInckLis9FvuI407TMDxQlqoWMDezlp4lVkzJIISbcbx2Z
         2qN+iFMX3mGgkxR+l7BTRXMFplLi032NnkhEp89/CIISsJbk31cmuPm+wfZXAlHrewAu
         cilbG1K1SHCHmCHltDqaPisn3oyjQSLFmgpC8nrRZKDPTLHgha05BHh0GvIzyUEDhUtX
         AWUiYH4nQEJU2Z28VI9Kjo0X6OERbZ1I0EPFW+n7PQpxohIKb9ANvaKhXcicb11dyAmD
         vUiME+xMSyig6F4zJ5LNBpho2lnbM8cpRHxU+n/QCjgz8IhsnGZVIwvRXc06j2uJG95L
         8qyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711134331; x=1711739131;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a6WGCJ5v+lTsE9g6YW58u86G+mWvoH1YiexQxNMU+bg=;
        b=T7JQU1NGHKJEEbZqbbVbrj2rxXEnn6C+EU7B53ta6uAk+s1qebsZgKR4vD0keDRVuC
         Bn9xlg39vSrcxADpTwvaKvmqBPsGE0kr29aGof1Mv3zb9u/4FFM/ZmUsbasFxtUco2cY
         lg0QFv+Rxf6j3PG0eLhM/FhsWXSpPpX+lI7dfwdpcuMepiOJvkC3niCCRJhi0m9ggmxF
         b7VBKnUa+ubQMTfVgP50pMIEjZpfALRWIldEPOkctr2NblBcizmTuLPKglgotuUkyCSs
         hHCp6DsXCTa3Rv8effU2AeaBy33nUecHCr1sKq0S/Y7uY8S6rHyIm5rGb3YnIyezUbwn
         W+uA==
X-Forwarded-Encrypted: i=1; AJvYcCUooMxj9D5UmZtWWLEwI0oO6r2sjD6vjdDLQYqxeW3YmptEserDJISmpjuQtKZAydhBKsVK9YCvueypno22DTQaxSV29cMVA5BI9R/FCTLe
X-Gm-Message-State: AOJu0YxpoLc+udl3KB9gJEYbP6kjfNWuuQFyozJl5R4LrL5/ntaUaJIg
	wMkmPKoy4sHAxIJrV2SgZL85J/Px3QSusfUQuhXmx5i6QT3YkNG/fezZVci5Gv4YEYPbDrIcVtB
	R
X-Google-Smtp-Source: AGHT+IHQ5pFluRwp1jRQRBP0ScYuJl5DTFe5SBvmWRgRQLHsh0hGtceYDz92r8gVhFBKjlTPlcOqOw==
X-Received: by 2002:a05:6a21:2786:b0:1a3:6bd8:f487 with SMTP id rn6-20020a056a21278600b001a36bd8f487mr516475pzb.51.1711133871755;
        Fri, 22 Mar 2024 11:57:51 -0700 (PDT)
Received: from ?IPV6:2601:647:4180:9630::546? ([2601:647:4180:9630::546])
        by smtp.gmail.com with ESMTPSA id f8-20020a170902684800b001dee9d80bdcsm70160pln.107.2024.03.22.11.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 11:57:51 -0700 (PDT)
Message-ID: <a4d340f0-960f-47bc-b45c-f89053526a22@rivosinc.com>
Date: Fri, 22 Mar 2024 11:57:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Improve sbi_ecall() code generation by reordering
 arguments
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240322112629.68170-1-alexghiti@rivosinc.com>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240322112629.68170-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_120537_531742_85FDFC89 
X-CRM114-Status: GOOD (  16.52  )
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

On 3/22/24 04:26, Alexandre Ghiti wrote:
> The sbi_ecall() function arguments are not in the same order as the
> ecall arguments, so we end up re-ordering the registers before the
> ecall which is useless and costly.
> 
> So simply reorder the arguments in the same way as expected by ecall.
> Instead of reordering directly the arguments of sbi_ecall(), use a proxy
> macro since the current ordering is more natural.
> 
> Before:
> 
> Dump of assembler code for function sbi_ecall:
>     0xffffffff800085e0 <+0>: add sp,sp,-32
>     0xffffffff800085e2 <+2>: sd s0,24(sp)
>     0xffffffff800085e4 <+4>: mv t1,a0
>     0xffffffff800085e6 <+6>: add s0,sp,32
>     0xffffffff800085e8 <+8>: mv t3,a1
>     0xffffffff800085ea <+10>: mv a0,a2
>     0xffffffff800085ec <+12>: mv a1,a3
>     0xffffffff800085ee <+14>: mv a2,a4
>     0xffffffff800085f0 <+16>: mv a3,a5
>     0xffffffff800085f2 <+18>: mv a4,a6
>     0xffffffff800085f4 <+20>: mv a5,a7
>     0xffffffff800085f6 <+22>: mv a6,t3
>     0xffffffff800085f8 <+24>: mv a7,t1
>     0xffffffff800085fa <+26>: ecall
>     0xffffffff800085fe <+30>: ld s0,24(sp)
>     0xffffffff80008600 <+32>: add sp,sp,32
>     0xffffffff80008602 <+34>: ret
> 
> After:
> 
> Dump of assembler code for function __sbi_ecall:
>     0xffffffff8000b6b2 <+0>:	add	sp,sp,-32
>     0xffffffff8000b6b4 <+2>:	sd	s0,24(sp)
>     0xffffffff8000b6b6 <+4>:	add	s0,sp,32
>     0xffffffff8000b6b8 <+6>:	ecall
>     0xffffffff8000b6bc <+10>:	ld	s0,24(sp)
>     0xffffffff8000b6be <+12>:	add	sp,sp,32
>     0xffffffff8000b6c0 <+14>:	ret
> 

Nice!

> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>   arch/riscv/include/asm/sbi.h | 10 ++++++----
>   arch/riscv/kernel/sbi.c      | 10 +++++-----
>   2 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 6e68f8dff76b..9041b009d3b5 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -292,10 +292,12 @@ struct sbiret {
>   };
>   
>   void sbi_init(void);
> -struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
> -			unsigned long arg1, unsigned long arg2,
> -			unsigned long arg3, unsigned long arg4,
> -			unsigned long arg5);
> +struct sbiret __sbi_ecall(unsigned long arg0, unsigned long arg1,
> +			  unsigned long arg2, unsigned long arg3,
> +			  unsigned long arg4, unsigned long arg5,
> +			  int fid, int ext);
> +#define sbi_ecall(e, f, a0, a1, a2, a3, a4, a5)	\
> +		__sbi_ecall(a0, a1, a2, a3, a4, a5, f, e)
>   
>   #ifdef CONFIG_RISCV_SBI_V01
>   void sbi_console_putchar(int ch);
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index e66e0999a800..5719fa03c3d1 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -24,10 +24,10 @@ static int (*__sbi_rfence)(int fid, const struct cpumask *cpu_mask,
>   			   unsigned long start, unsigned long size,
>   			   unsigned long arg4, unsigned long arg5) __ro_after_init;
>   
> -struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
> -			unsigned long arg1, unsigned long arg2,
> -			unsigned long arg3, unsigned long arg4,
> -			unsigned long arg5)
> +struct sbiret __sbi_ecall(unsigned long arg0, unsigned long arg1,
> +			  unsigned long arg2, unsigned long arg3,
> +			  unsigned long arg4, unsigned long arg5,
> +			  int fid, int ext)
>   {
>   	struct sbiret ret;
>   
> @@ -48,7 +48,7 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>   
>   	return ret;
>   }
> -EXPORT_SYMBOL(sbi_ecall);
> +EXPORT_SYMBOL(__sbi_ecall);
>   
>   int sbi_err_map_linux_errno(int err)
>   {

Reviewed-by: Atish Patra <atishp@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
