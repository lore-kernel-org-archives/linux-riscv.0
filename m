Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AD3E7719A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 02:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l3xvFA8emCU6lEabcpNY5lrhkcYrJfrMrLJtRiCZLy0=; b=XUBwZZA66XNIOm
	ILmHvMDWmG5Ciay81h7TBNbIesFLPKrC0bMH9hz0H1JIL4jP3+h4fNjwlNnvTQiwyfIElyYJew5Qf
	c+JIMHhYd4QmobzXI1q+YtJc5Mtiaqj3Pb1jsMtFxL2g8nXNSeZAzxUjCnqD1iBLlfGgBFaH1Z9JP
	MLpUurl7mn2Wc7XbaoGcMaCtr1Cj03rWAEa9GQJKDhGrs9c2ThpbpMyqFugxWfl24qEbQ9c8c0jLS
	G/QTkkBDN28ifgR9MjoNbp1fo8qzFmdJORkmxYFkjch96VjXptZV9Lvr8j1jsS0/TUNbJ8x3hAIR0
	qTtmkoH6mrT0UAnnYbiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW4lo-0000000DpkC-47bJ;
	Fri, 10 Jan 2025 02:29:08 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW4ll-0000000DpjK-1Fn7
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 02:29:07 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2163dc5155fso27451915ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jan 2025 18:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736476144; x=1737080944; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8uKw2ypbHF5i7qZwaig7Kl4LaoMnJ49oOkiXeVny0o0=;
        b=uzn230n1LdDuf6UpkgPU5w+jvYYzJftwgeUry4/qL95PxJkpMxJ/q1pBFNc5v+Tuw+
         a/WEX6uIkzCaWSxgA8epfVahgYpZapHC4xeRWJQ2gDNn9Faez6klQQYpxKrTVSmG71U8
         mRj+AH0dUGWE/XztM0J7eMOdC8JUVqcG47j3oCiUIumLuDFLQ4saZYe6txrhiovxB039
         VWH8TDyGUuMxyz2xC4jgf5tN+83g+tl0QdJ1sJSCGC9Pq1vyruTbu1dPqJQdZDaySflP
         UAnmWTLOdiI1JdyaEz4rdxlz5tlWfBiGPDW6kpZ6dWjm/YjdB7Dd1Ap4McrQClQak6yT
         iQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736476144; x=1737080944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uKw2ypbHF5i7qZwaig7Kl4LaoMnJ49oOkiXeVny0o0=;
        b=Y1MZ78VgpFfiuqUER0nQyhEEQueK1NsFESevfzDabsYlEXT9DlcuDJUFHHLh9+HcM9
         7A+8vT6QNOq/HdRFJlBOXTQ/nd5enqgZuBjcFaNtdvdNiSFJ8crDELU0tukk+sqVY7GQ
         a781oOLk7GZFOiSqImwwzb0uknM+YMHpEBQfQbQ2FWIMXve4vIca3dImCRHRo2DAZ2JB
         wGIwDyIGcpVujJ76J9x5M40r2Wc4uNv3Edir4ihNrrvfz+PPOMbV8rq/W0Kr2T0ALeKZ
         ZIsRYTbyEGbaThOlg8w5E1mhbfcYkbCM4ybFG7fKtKuVzqM4KrMBKjIRUDuXvoOm92H3
         LLOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTq4/Vxz3hgDZs80XLGeGtFlTGGg+s/tS9d7OM4t9gdHdvaSvRigNMlfuIfwWn2NjXfUpfoyEGMjpWXg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0XAzUndaUXiyiuY2IviNCiQ7RCx2P/JCs5ALSB0ROPd3U6mkE
	3XLkNBCgm0VY5JtNEPZfNbJc2t9TwXIWJRWCEjkyzo3Of9Rqc076w10AIy+vNuM=
X-Gm-Gg: ASbGncsha8mYRjAYbA2RKtzr8Pmmfh3i6jlP6hYP9VzXVu0LFPgLga/DQCoS57CmN+s
	5eEcYugwuXZlGASmZypivt5eJaYJY+7+R0zq9NSNlBCwpaAa1+gK73fy0HVwczdOx1fnJLDmjUu
	uZ/168KvibVxNb5Uw4Uzb+/SpTH8MYl5MYz4XBbwgIXPprTrevxyODYWWSRnN7if0O2nG8hI8q6
	D6GgeXui8/0YobuEXYwhHZNLZljqK65+7VhIy7HXt4xhSvmE/D0
X-Google-Smtp-Source: AGHT+IHrKeVYa5o7IHDpdaSUF8BXSqbcoJI/r1FJmD+YU3SJipUjrwV88LTYTCzioCu2qn/Z+ob8mw==
X-Received: by 2002:a17:902:f68b:b0:216:2a5a:89d3 with SMTP id d9443c01a7336-21a83f70d13mr121213805ad.25.1736476144200;
        Thu, 09 Jan 2025 18:29:04 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:691c:638a:ff10:3765])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f217565sm4478495ad.125.2025.01.09.18.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 18:29:03 -0800 (PST)
Date: Thu, 9 Jan 2025 18:29:01 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] rseq/selftests: Fix riscv rseq_offset_deref_addv inline
 asm
Message-ID: <Z4CF7a89_eCkAMNV@ghost>
References: <20250103040326.2603734-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250103040326.2603734-1-shorne@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_182905_512046_5F864515 
X-CRM114-Status: GOOD (  23.29  )
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

On Fri, Jan 03, 2025 at 04:03:26AM +0000, Stafford Horne wrote:
> When working on OpenRISC support for restartable sequences I noticed
> and fixed these two issues with the riscv support bits.
> 
>  1 The 'inc' argument to RSEQ_ASM_OP_R_DEREF_ADDV was being implicitly
>    passed to the macro.  Fix this by adding 'inc' to the list of macro
>    arguments.
>  2 The inline asm input constraints for 'inc' and 'off' use "er",  The
>    riscv gcc port does not have an "e" constraint, this looks to be
>    copied from the x86 port.  Fix this by just using an "r" constraint.
> 
> I have compile tested this only for riscv.  However, the same fixes I
> use in the OpenRISC rseq selftests and everything passes with no issues.

Thank you for these changes! I suppose these tests hadn't been ran on
riscv before... I ran the tests on QEMU and they all passed :)

Tested-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

This should also have a fixes tag:

Fixes: 171586a6ab66 ("selftests/rseq: riscv: Template memory ordering and percpu access mode")

> 
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
>  tools/testing/selftests/rseq/rseq-riscv-bits.h | 6 +++---
>  tools/testing/selftests/rseq/rseq-riscv.h      | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/rseq/rseq-riscv-bits.h b/tools/testing/selftests/rseq/rseq-riscv-bits.h
> index de31a0143139..f02f411d550d 100644
> --- a/tools/testing/selftests/rseq/rseq-riscv-bits.h
> +++ b/tools/testing/selftests/rseq/rseq-riscv-bits.h
> @@ -243,7 +243,7 @@ int RSEQ_TEMPLATE_IDENTIFIER(rseq_offset_deref_addv)(intptr_t *ptr, off_t off, i
>  #ifdef RSEQ_COMPARE_TWICE
>  				  RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
>  #endif
> -				  RSEQ_ASM_OP_R_DEREF_ADDV(ptr, off, 3)
> +				  RSEQ_ASM_OP_R_DEREF_ADDV(ptr, off, inc, 3)
>  				  RSEQ_INJECT_ASM(4)
>  				  RSEQ_ASM_DEFINE_ABORT(4, abort)
>  				  : /* gcc asm goto does not allow outputs */
> @@ -251,8 +251,8 @@ int RSEQ_TEMPLATE_IDENTIFIER(rseq_offset_deref_addv)(intptr_t *ptr, off_t off, i
>  				    [current_cpu_id]		"m" (rseq_get_abi()->RSEQ_TEMPLATE_CPU_ID_FIELD),
>  				    [rseq_cs]			"m" (rseq_get_abi()->rseq_cs.arch.ptr),
>  				    [ptr]			"r" (ptr),
> -				    [off]			"er" (off),
> -				    [inc]			"er" (inc)
> +				    [off]			"r" (off),
> +				    [inc]			"r" (inc)
>  				    RSEQ_INJECT_INPUT
>  				  : "memory", RSEQ_ASM_TMP_REG_1
>  				    RSEQ_INJECT_CLOBBER
> diff --git a/tools/testing/selftests/rseq/rseq-riscv.h b/tools/testing/selftests/rseq/rseq-riscv.h
> index 37e598d0a365..67d544aaa9a3 100644
> --- a/tools/testing/selftests/rseq/rseq-riscv.h
> +++ b/tools/testing/selftests/rseq/rseq-riscv.h
> @@ -158,7 +158,7 @@ do {									\
>  	"bnez	" RSEQ_ASM_TMP_REG_1 ", 222b\n"				\
>  	"333:\n"
>  
> -#define RSEQ_ASM_OP_R_DEREF_ADDV(ptr, off, post_commit_label)		\
> +#define RSEQ_ASM_OP_R_DEREF_ADDV(ptr, off, inc, post_commit_label)	\
>  	"mv	" RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(ptr) "]\n"	\
>  	RSEQ_ASM_OP_R_ADD(off)						\
>  	REG_L	  RSEQ_ASM_TMP_REG_1 ", 0(" RSEQ_ASM_TMP_REG_1 ")\n"	\
> -- 
> 2.47.0
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
