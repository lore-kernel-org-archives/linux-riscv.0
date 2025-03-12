Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3192C28B28
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 23:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E9Cc1MEWCowdM8qUitulNCI78AG+tnzifOBLuCxMgq0=; b=FZ/lMHcv6G4Ycr
	zv7Ho9iwG/7JC94SuM1aFNEAzqx7nXCMPYBSuLGckdfHvJXYKJ92RHQHpOHjpXFVaHTyn3JQSWKo6
	397nxqQVp35M80OGd2CiIWk3wZ1KoahvAWdanx9+/QEQe4ltvXR2dm1Do9+pCQzOrV+rSVbFJdiPN
	xXUAIhvAnsDizDazP2OZJ/vOmGZukHWlFXIHKMvmXpTHhzAXY7YAw0h/mt0brkzVctJfL7isvuJq0
	y9Mq25ZSOXDINbrSa1xuH4f6mCqKzqi+dNiRiGKiPYshxPgHuUaW284FV5KTftZI0sKUoilfcGb6Z
	3jaOsv6GW1UIoj++HGGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsVeN-00000009jFh-2NwG;
	Wed, 12 Mar 2025 23:38:11 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsVeL-00000009jFG-0HLd
	for linux-riscv@lists.infradead.org;
	Wed, 12 Mar 2025 23:38:10 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-219f8263ae0so7451005ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Mar 2025 16:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741822688; x=1742427488; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Iv9X1O+iJ055EOoqMTSQh8pZkA9omS3qAlLfPhpnypc=;
        b=ISYEx+cebhaCQwtr0hful9dAyxmEsbpeP4cnSwWeNdj442BPE++6CWKj0DMscN/F5C
         FYQSophUEezQxjn9q2Nvg2lq2smsOhN7IYyMBRH2m+CiLATWLA2fGa+El4h+Xa9T5XVZ
         m3lecOfkoEy2vduFM11Rs2hnvm1M6T6DI0B/yYnX0Kbj0SHMuf+bkB5Pm0Q6XLaeS6Mz
         5xKUz77pPwb2rkTSAPpAsNHxGnvWYKnHPm6h/6Yse6Z/qB4V9Z5OmkBUAlSS2KseztL/
         9DoxIGI39luJ7dcJNnKgrJ5UHr/eofbtBlSJ+m9jbcxNlG3phbI8eIUY3eXFU0cMhHMf
         PCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741822688; x=1742427488;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iv9X1O+iJ055EOoqMTSQh8pZkA9omS3qAlLfPhpnypc=;
        b=B7tTzl7Jg7Qok6WeR0KgW1D0oSLuWIZrdSnk/fl4ONRuObx5nvL77glB8IqgXlg6/F
         /z9MYPPsXBm2MCgFNCuqGiQK0RiHw7jOl9VS9QNp1JZMYAt7HtSh3UZzMNK9a7mpIE6H
         eynoVnSLkDcQULJL3aODHPTmFpcR4KYbacjLOW/a3F4dMAJh2Eq3NdIZXABXjdHStxud
         SdJdyA36A4TAKqpLcoXDc3ujAyW7+vADHKtW7ehoN8u3nP57SLtQKVj/sAPloNLq+GKf
         cmJDgpazuE4YO77hU93L8zpwP5r32KOMhXPUf5P2FBuPjhEepF0mT9eAGJ1BAey6e0MX
         N2FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjQ2yqzmyWvrCtxDgugoyu3z+MbzPb+lrPlpnHl26dy5gho41zMxegVnHdpqQLqutwtSLO255XTd37wQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0FaTwDrW1slBt21oJB2UQoUpPnYL3m5/2vKs8djaFdQYWDrOc
	mfhNXlK+eZFMswMjtkOp22xwEK7xmzt3RCeOzOWeVvmMc2aM3E5N
X-Gm-Gg: ASbGncvBCQjeQSOM0RgARg8JJdxCfNwbnyagprQ1f84EmY2hDofSSIWFLdiqaJenM5c
	BAv7TFN/36OrbUOEyU51KFRKm6FGpE9WPzkXempIyNRUlgkjJdUylVYvGOg7PwLyLQZILNKksrF
	TZC1ZqipdDQDCGMMXNGz889AZvlAGAr3XOU0n3dpeoNzPjQDVe27QvmLBwQyNuN6N4rzd3HnYDg
	Flna/dFXew9OPay2jQGroR+K9jnLXTAPDan7jIRjFQN1rd3GwlaDrB1om+O87GAcbC6ctnMSOTk
	fjnqGkKMuj2Pwsq3kG0ElM89qlF5JGv/vWWinLs3ASnm
X-Google-Smtp-Source: AGHT+IG5xBWHcUI1ZiPr4lIPXq2LhR2k/iVfRjmn8GAY/lSsqcezJg1grQWMvGOFPF2cHAToz5e+tw==
X-Received: by 2002:a17:902:f54f:b0:223:58ff:c722 with SMTP id d9443c01a7336-22592e44a1fmr156857395ad.28.1741822687725;
        Wed, 12 Mar 2025 16:38:07 -0700 (PDT)
Received: from localhost ([216.228.125.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68883d0sm1323525ad.10.2025.03.12.16.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 16:38:06 -0700 (PDT)
Date: Wed, 12 Mar 2025 19:38:04 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Ignacio Encinas <ignacio@iencinas.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: fix test_and_{set,clear}_bit ordering
 documentation
Message-ID: <Z9Ia3AMqFpNj6fUb@thinkpad>
References: <20250311-riscv-fix-test-and-set-bit-comment-v1-1-8d2598e1e43b@iencinas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250311-riscv-fix-test-and-set-bit-comment-v1-1-8d2598e1e43b@iencinas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_163809_109088_E4A38B79 
X-CRM114-Status: GOOD (  21.23  )
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

On Tue, Mar 11, 2025 at 06:20:22PM +0100, Ignacio Encinas wrote:
> test_and_{set,clear}_bit are fully ordered as specified in
> Documentation/atomic_bitops.txt. Fix incorrect comment stating otherwise.
> 
> Note that the implementation is correct since commit
> 9347ce54cd69 ("RISC-V: __test_and_op_bit_ord should be strongly ordered")
> was introduced.
> 
> Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>

Applied in bitmap-for-next.

Thanks,
Yury

> ---
> This seems to be a leftover comment from the initial implementation
> which assumed these operations were relaxed.
> 
> Documentation/atomic_bitops.txt states:
> 
>   [...]
>   RMW atomic operations with return value:
>   
>     test_and_{set,clear,change}_bit()
>     test_and_set_bit_lock()
>   [...]
> 
>    - RMW operations that have a return value are fully ordered.
> 
> Similar comments can be found in
> include/asm-generic/bitops/instrumented-atomic.h,
> include/linux/atomic/atomic-long.h, etc...
> ---
>  arch/riscv/include/asm/bitops.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
> index c6bd3d8354a96b4e7bbef0e98a201da412301b57..49a0f48d93df5be4d38fe25b437378467e4ca433 100644
> --- a/arch/riscv/include/asm/bitops.h
> +++ b/arch/riscv/include/asm/bitops.h
> @@ -226,7 +226,7 @@ static __always_inline int variable_fls(unsigned int x)
>   * @nr: Bit to set
>   * @addr: Address to count from
>   *
> - * This operation may be reordered on other architectures than x86.
> + * This is an atomic fully-ordered operation (implied full memory barrier).
>   */
>  static __always_inline int arch_test_and_set_bit(int nr, volatile unsigned long *addr)
>  {
> @@ -238,7 +238,7 @@ static __always_inline int arch_test_and_set_bit(int nr, volatile unsigned long
>   * @nr: Bit to clear
>   * @addr: Address to count from
>   *
> - * This operation can be reordered on other architectures other than x86.
> + * This is an atomic fully-ordered operation (implied full memory barrier).
>   */
>  static __always_inline int arch_test_and_clear_bit(int nr, volatile unsigned long *addr)
>  {
> 
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250311-riscv-fix-test-and-set-bit-comment-aa9081a27d61
> 
> Best regards,
> -- 
> Ignacio Encinas <ignacio@iencinas.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
