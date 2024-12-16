Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E2DE7717F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 15:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eOKUqqKFh1Qo3QEv82jZjOvJH3QBvb4yHgghpCe3fUg=; b=kOS33SaZdsrBv4
	leIzElHHam+C4x/ZwKWGyp9FMBQc6/BZpzF3TRXd7YbRtGccCK66MQJoo5rH+hqHyXa9gr0b/6Uh6
	dRiIAtSMVpF/A8KfkWlE43IgCzItVIuJ30kCzhHWT6H7BWbx3QZ0KC0L29aQTrbddozFtnkFzdgeP
	kDJWogB6il1Ih2eeC4/8t/6hmPcpkai/oIM7GbZ9zTJkZFPyvNKVEGEmQQr3ic10UdMGf0jJbQA6v
	ISxiy4cfHWscz5ggVl82GEcZait57IkD3Fomco/CDRLfHSPNTvm+Gv6yTqFREUuL/S1HMMQX1G1JX
	ojYMSMHn2Bq2PT6HO6YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDJq-0000000AT3R-3gQb;
	Mon, 16 Dec 2024 15:47:38 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDFE-0000000ASEq-1TXq
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 15:42:53 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so41872825e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Dec 2024 07:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734363770; x=1734968570; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mRPpIX6x1X6PfLdkN5XTWPSEZi3D2nzydsb0ntGYnfo=;
        b=gKcrQBPsEhT2Fp9MaVZ/ILn0TjwOYwTlfN6gdgrtXUyyroOyLonmhnq8tYgXip8bk2
         6tyQQcWvRWjdyNjCSOS8nMrfzOQtkjxTfHipzlNV2kC0A1+3peZ5E5T2b28Usg+cNi6P
         EAJVzbHzWysPKAJxMNkWnWOQ9mRqyAQ++ekBSJFL4iXRqCe2WROZLIHtIXvrTFKW3/M3
         EFs8CTl/1W6aRJZklZxIAZL/C5p0K0jFJDRsZrDEBpKY8ce6TOQhPNCA+3v/M40+Ism5
         Ek+NfG9QZWk5sGofBsu3w0Oh3Db1Lox6VbLdSIlzu2p4KW3KG5w5r4Z4jVKyBBP//sRZ
         Nr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734363770; x=1734968570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRPpIX6x1X6PfLdkN5XTWPSEZi3D2nzydsb0ntGYnfo=;
        b=oJUlqNULsUni5hQmbVB0tcblWb6Gbh2BLS0BiaHGLTU7IfOuKbQdHoFVupqsm658gz
         38vAbO0Ja9qPtPXExA9PghMgSmSBR2IvqmbifUEjn7eumDqg3JM/7Moz71ipn/C6qqFr
         iQIYnMb5VAzbIDhRmOpaPebwKfHTgtXgBdY7qzrxTpwkxPby95Fs0wLFYeeYArMQhPp7
         udzVFkmuCGw+1kDmeWejlKn0QAyzH2IYOYbE7RrFiJGQX78lfWOp/ALjyslmeuII5JdO
         Z6mgHy7xiZbWEUPq26rmy9mDqkZaelG1bKyaTbodXERy24KJgmxipQNWyUhmmHB4wgMA
         U7lg==
X-Forwarded-Encrypted: i=1; AJvYcCVtrClwgBTQC5L276JjMKhgIgnOfFYhoIyVrhOI5bnWlM/h6d1DyCefs2mtEEYmWNTY0O/5kS5cchXZyw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy92SaP/KuiCgrvjFI1E9igs45yJxYRuEe5qxA38ooeENBbiaMZ
	sELlR6GJfUR9n9PSVmqjJ3gO4db5ouWA2B4pj88WZIv2i1RVRjT19gYqKHEHJKc=
X-Gm-Gg: ASbGncuxmrcCnBwrMijL5LqECGK479ksl1WTqY5TX4dOyoIZkXtgulcQspXLG7PrtYC
	v8G4+R3O7zsPPEoQ7UK1tIvVFjwA3TTqROWCZ0RQs6uqX9RxsJFuHNxBlQHfLx2Huv+uR5F9H7r
	6OcrP4xv03fqDrYPKtZ34JQwEINAocu1bnOtaGP/5r0C+VjG+B/HwlkKBlsoGcGV9yReJuEb6yh
	QlwpOUjY5288hCu+5JzijtwW40/rHPhJIB5x/OHvBjYlQk+bxVVAbI363BTOOPXbN3+IkzIgxse
	2/4s4doY9A==
X-Google-Smtp-Source: AGHT+IGHTCJNG0wofm8YQHMVhU6jNcr410dOUPkItU01CIE2mfswJ1fwu09e8a9C94aWhKnGcE9L0g==
X-Received: by 2002:a5d:6da4:0:b0:385:fa33:29ed with SMTP id ffacd0b85a97d-3888e0f4553mr10445190f8f.47.1734363769937;
        Mon, 16 Dec 2024 07:42:49 -0800 (PST)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801b9ebsm8461313f8f.63.2024.12.16.07.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 07:42:49 -0800 (PST)
Date: Mon, 16 Dec 2024 16:42:48 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: guoren@kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, bjorn@rivosinc.com, 
	conor@kernel.org, leobras@redhat.com, alexghiti@rivosinc.com, 
	christoph.muellner@vrull.eu, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	parri.andrea@gmail.com, ericchancf@google.com, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: Implement smp_cond_load8/16() with Zawrs
Message-ID: <20241216-2d9b35cb1911106971a54356@orel>
References: <20241216032253.685728-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241216032253.685728-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_074252_395097_923D6169 
X-CRM114-Status: GOOD (  16.75  )
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

On Sun, Dec 15, 2024 at 10:22:53PM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> RISC-V code uses the queued spinlock implementation, which calls
> the macros smp_cond_load_acquire for one byte. So, complement the
> implementation of byte and halfword versions.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/include/asm/cmpxchg.h | 38 +++++++++++++++++++++++++++++---
>  1 file changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 4cadc56220fe..2bd42a11ff8f 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -365,16 +365,48 @@ static __always_inline void __cmpwait(volatile void *ptr,
>  {
>  	unsigned long tmp;
>  
> +	u32 *__ptr32b;
> +	ulong __s, __val, __mask;
> +
>  	asm goto(ALTERNATIVE("j %l[no_zawrs]", "nop",
>  			     0, RISCV_ISA_EXT_ZAWRS, 1)
>  		 : : : : no_zawrs);
>  
>  	switch (size) {
>  	case 1:
> -		fallthrough;
> +		__ptr32b = (u32 *)((ulong)(ptr) & ~0x3);
> +		__s = ((ulong)(ptr) & 0x3) * BITS_PER_BYTE;
> +		__val = val << __s;
> +		__mask = 0xf << __s;

This mask should be 0xff and the mask below should be 0xffff.

> +
> +		asm volatile(
> +		"	lr.w	%0, %1\n"
> +		"	and	%0, %0, %3\n"
> +		"	xor	%0, %0, %2\n"
> +		"	bnez	%0, 1f\n"
> +			ZAWRS_WRS_NTO "\n"
> +		"1:"
> +		: "=&r" (tmp), "+A" (*(__ptr32b))
> +		: "r" (__val), "r" (__mask)
> +		: "memory");
> +		break;
>  	case 2:
> -		/* RISC-V doesn't have lr instructions on byte and half-word. */
> -		goto no_zawrs;
> +		__ptr32b = (u32 *)((ulong)(ptr) & ~0x3);
> +		__s = ((ulong)(ptr) & 0x2) * BITS_PER_BYTE;
> +		__val = val << __s;
> +		__mask = 0xff << __s;
> +
> +		asm volatile(
> +		"	lr.w	%0, %1\n"
> +		"	and	%0, %0, %3\n"
> +		"	xor	%0, %0, %2\n"
> +		"	bnez	%0, 1f\n"
> +			ZAWRS_WRS_NTO "\n"
> +		"1:"
> +		: "=&r" (tmp), "+A" (*(__ptr32b))
> +		: "r" (__val), "r" (__mask)
> +		: "memory");
> +		break;
>  	case 4:
>  		asm volatile(
>  		"	lr.w	%0, %1\n"
> -- 
> 2.40.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
