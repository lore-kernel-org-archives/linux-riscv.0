Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B018FC19F32
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 22:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GoOTWy3FM2zxRnfYE5zOmj3FyncIigr/UdH/qyIzYCY=; b=ko2JuvEJrz5cOA
	TAFssf/g9kqk5BDFJk+suYQc4skfMVqRupS1kb8FLvhe+1VyyduGlvd1E/N4u9wzhdUcXwSRrXD5Z
	NEEWLUYHmLfrCYpO5Yo06z9G1em/5mLwE/fXdU6tgJR6MSqy0/61G+DpG7LSBTGUXKddQI2ymlpqI
	Qz7roA5hych/PHVdx/JxjLQs+kvNm6LUl0160B3QW5D+HeZtM8IqLyn07Rqx957tKoQZCSf8HxN7e
	fK/kvzV2OgXxJFE2BlnQS5JmqEbXVoMdEAGQ9iXMPkapR7yvc5KrOG9WgzuGSZLKHvncVVWxxD6wH
	pJhh+srtN7eeSWTIGs6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwwt-00000009Rpp-3ZXA;
	Wed, 05 Mar 2025 22:10:43 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwc6-00000009PMH-1NKg
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 21:49:16 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-223594b3c6dso129682355ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Mar 2025 13:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741211353; x=1741816153; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kjoSc6E8cjM2Yo8eK5HFN8pI09NM2S8qt1nM/UlA0TU=;
        b=MY+mMj9/iMLj9fAOPSYXtdS27t06kCPtYqBOjaf7J+/NThDW6kDPPNbDFC13866sTg
         C5+ldhIxKnqVcTdMK9Vvd+vTz3/m89KBm+Zdy69/eF6pPAXXJATD8U2lbJY5KKFFckJB
         6knjXvp3xgf2O+muJ7qHfy8WkibknyQeJAMVJI9Dg7s5q3/JxIZsPnuY2lf/hEy6E53x
         Wh2LzbcqeWi00zcS8DvghrmANd+nBe1Hn+BxMpIsF82832C5EaCij4Dt3HCozmiY7v+t
         qZDKDAwlPff6ZFC9isa9AFWwr2xaNkPHnuPIR4Zm8IkALdr8TYJQqzqb+smtW+oukwVh
         KNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211353; x=1741816153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjoSc6E8cjM2Yo8eK5HFN8pI09NM2S8qt1nM/UlA0TU=;
        b=Iiij+liVVPXN+EFPLKGoFKm0yLSqnNv+8JEtQ0EfkjB9lix9jB3Jh35e9A5oRDoZpM
         dsklnnciJ4C/5XBq5Gzgg6JCEMpwVY0U38/8i3/tme+LI02Pq3Nkjdji8o1o1WqmXpUz
         YjJpKM8Df/uDxrLd1QbNbTiLOnAqrKlax2x4ofQb76b9cNrDm/ov4xYO5eAbWy2ZJNml
         NK4TJ5kmzkESuNJWI7zHJWOmW7ClZC3vWlrUL/czy61JGNA6UYplZ4evnX2eW5f8BxFc
         5LqCdAL6mc7tF7jYqfgdFwgoXxzw8HMXzjw3qngTau3vwyKjqfE1PHw+o8Wcv1KxyXaD
         /wmg==
X-Forwarded-Encrypted: i=1; AJvYcCW10bYao4CMgWw+6pL5oB1NZCmtuONC7t5r5NIwmMvc8MyXKAbbehDVH7Y+uYv1wdaW+W1aQLQgc8oo6g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgU3yTO7DLpQfPMgs9ScuEf54PQqyIhC6+hdTsUWTtMakrBy6s
	5wbGlm74vYws4Ks+CIr/37Qz8/Dp1lkGbx/4pkjWykJGu4dslb7ytWxfGK2KqNY=
X-Gm-Gg: ASbGnctQY13xhrvuCVjEvXUNjmiekpzUDT1uuXbTauoOlRxAk8CSewGcGtuPpfQm9vN
	daz5xKht1PWlkqnHON+8skZf4qN2nJqf4w40ns7T0sDGLDVpkSCc7uDjBc7QwI3duYFfNf34OtS
	xT9wf57yQI+ktasxquduCu982muPedeYsQddvnsbygYJsNIzZ2GVQXZpC79oLy4JvoNe0rVW/n2
	oaMpcSaZSrQZ49/Nz3LttJSAYIoVkgl9XrXENv6uWA0UIrj6U2Bj5XE2UI6VbaDSYcRcfB/VJgZ
	yJ09GRKeCAXrLp+wOf4Lc2gqa/8omxJ7fHuY/jOZ
X-Google-Smtp-Source: AGHT+IGiq/MXIy1PesAIjd/q+Uj1GRVM25G7HYgqYDLVTQNdRiqv0JEG2/8H91arLf8HKxgXjRaCBg==
X-Received: by 2002:a17:902:f693:b0:220:ca08:8986 with SMTP id d9443c01a7336-223f1cdae3dmr83408555ad.22.1741211353117;
        Wed, 05 Mar 2025 13:49:13 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:9b3c:3246:a388:fe44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8fdsm117591535ad.76.2025.03.05.13.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:49:12 -0800 (PST)
Date: Wed, 5 Mar 2025 13:49:09 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ignacio Encinas <ignacio@iencinas.com>
Cc: linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: riscv: fix v_exec_initval_nolibc.c
Message-ID: <Z8jG1ViOUbw79cEN@ghost>
References: <20250305-fix-v_exec_initval_nolibc-v1-1-b87b60e43002@iencinas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250305-fix-v_exec_initval_nolibc-v1-1-b87b60e43002@iencinas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_134914_627990_4E80F5F5 
X-CRM114-Status: GOOD (  24.92  )
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

On Wed, Mar 05, 2025 at 05:39:28PM +0100, Ignacio Encinas wrote:
> Vector registers are zero initialized by the kernel. Stop accepting
> "all ones" as a clean value.
> 
> Note that this was not working as expected given that
> 	value == 0xff
> can be assumed to be always false by the compiler as value's range is
> [-128, 127]. Both GCC (-Wtype-limits) and clang
> (-Wtautological-constant-out-of-range-compare) warn about this.

This check was included because the "dirty" value is an implementation
detail that I believe is not strongly defined in the ABI. Since linux
does always set this value to zero (currently) we can safely remove this
check. 

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> 
> Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
> ---
> I tried looking why "all ones" was previously deemed a "clean" value but
> couldn't find any information. It looks like the kernel always 
> zero-initializes the vector registers.
> 
> If "all ones" is still acceptable for any reason, my intention is to 
> spin a v2 changing the types of `value` and `prev_value` to unsigned 
> char.
> ---
>  tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> index 35c0812e32de0c82a54f84bd52c4272507121e35..b712c4d258a6cb045aa96de4a75299714866f5e6 100644
> --- a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> +++ b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> @@ -6,7 +6,7 @@
>   * the values. To further ensure consistency, this file is compiled without
>   * libc and without auto-vectorization.
>   *
> - * To be "clean" all values must be either all ones or all zeroes.
> + * To be "clean" all values must be all zeroes.
>   */
>  
>  #define __stringify_1(x...)	#x
> @@ -46,7 +46,7 @@ int main(int argc, char **argv)
>  			: "=r" (value));					\
>  		if (first) {							\
>  			first = 0;						\
> -		} else if (value != prev_value || !(value == 0x00 || value == 0xff)) { \
> +		} else if (value != prev_value || value != 0x00) {              \
>  			printf("Register " __stringify(register)		\
>  				" values not clean! value: %u\n", value);	\
>  			exit(-1);						\
> 
> ---
> base-commit: 03d38806a902b36bf364cae8de6f1183c0a35a67
> change-id: 20250301-fix-v_exec_initval_nolibc-498d976c372d
> 
> Best regards,
> -- 
> Ignacio Encinas <ignacio@iencinas.com>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
