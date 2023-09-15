Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6557BEED60B
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 15:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0kFhlI+DR7WsTGLTLJPRl9rZojFDMMDikXcz6+wc4as=; b=BShpORf4reWC4G
	gAKOXK7jHhkEyUZHGR1wNLWh4aID1/5KlLgGGUHffJNPaz8wYmBjAJWefqculiEdWgZqhUckY5OpZ
	43O2XUo/PgaaPa7pZWRltYOW+D37nRaYl+cVmEFEVIJCSl/khlUTMniAAoorWbnIuFsZJt+UInADM
	vahGMiundieFfmXXcaNJoksnfv8dbSGoXjqnKyQl1DmmMhlE53PR7v6vEfeZFK8mKEJcG1eXC8rY5
	vSkHSiLWTCgzvixHmRZLwqRFclpoowCeXh0G8LPpA0Sh8hTZc4UKPsYkTacnJdvu//VTVKpcBUSiX
	Hs+54x47IkK25l/VBt4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAf8-00AyN9-0o;
	Fri, 15 Sep 2023 15:23:18 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAf4-00AyL1-3A
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 15:23:16 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-69042d398b1so910094b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 08:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694791389; x=1695396189; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JzUny5ZDY3B8dwGvMbx7t3ZOXwBY6DGZ8A+gn9ETcXA=;
        b=W/9mfRANi0lmk66S/ZLMD7QeFBnxx7p+DDrDm0/KNrMCR45U6BSZRImjX1beJ9GiSC
         7wAgxSDQvF+t8LrwJOVJdMsl9Uge4oaquc5dY47iq3bgHDMRZVvhlNOj/aAV9I6JXVbA
         jkRcd0lBjesQpA+AcHqgyrjZmJwOJMgOG6uAUrih06e33ueXNvTFJ7tf8/t+IR6tGP1o
         aXt5h8tQCEOtD7D/dslZGbSRzfR/or6UywqwZCOX0xtqdOfybPd+bkXVbDJ017zceHYz
         EitbTZtka1UpWgavjnxx5fkTL8v+gnC6dPy3LPOH7fa6tcwmVEpnNDRQzVq+5Q+LCsFH
         21cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694791389; x=1695396189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzUny5ZDY3B8dwGvMbx7t3ZOXwBY6DGZ8A+gn9ETcXA=;
        b=s8/Mqt83c6uokZfhUqb9eoD02JsClBF2SLUzuVKCdP/izxtWE78Kjx0i8bBBmMg7Wl
         YTfehJ5GuXk7S5KzpPvy8BN0Afk+B/fjBSyFeh1+aSkKUbUimEb7T2xVx8/WY8zBMpZF
         sipRgoUfP3LijQIH9e+UXOZFiWnJSdPcheMBUBBufPA+pe6/SLXxyzPA9T4CbvuaTa2X
         2ovcC/4q62FRealVaovWJgFnSJHAQGEXQ9FHnQoPGpT6HsUe24gPG4o/YwbdLpbxUvbC
         DfAjLqm1KNpX6UUyWii4ZtssIaBU+h9TQc5m/DdyJrKnUDVwdIkmXkqgC0YOTgeVerRo
         2mSw==
X-Gm-Message-State: AOJu0YwOvQUKY41/Oyh0UWZdiPvgfEIVOEVEYi+XDMs0c80NGu93j7KP
	QDz7ZF69BfuG334P72/dkSLCyg==
X-Google-Smtp-Source: AGHT+IElDW4bTTqtNEHxEJSI2zqsGM7eb0Y6Wp/U3CPQiwi0iSahU1mcqFPPoZA/wBkxBNyUQ3xnlg==
X-Received: by 2002:a05:6a00:3186:b0:690:1857:3349 with SMTP id bj6-20020a056a00318600b0069018573349mr1453397pfb.25.1694791389091;
        Fri, 15 Sep 2023 08:23:09 -0700 (PDT)
Received: from ghost ([50.168.177.76])
        by smtp.gmail.com with ESMTPSA id c15-20020aa78c0f000000b0068fb5e44827sm3087719pfd.67.2023.09.15.08.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 08:23:08 -0700 (PDT)
Date: Fri, 15 Sep 2023 11:23:05 -0400
From: Charlie Jenkins <charlie@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes] riscv: kselftests: Fix mm build by removing
 testcases subdirectory
Message-ID: <ZQR22QUisvS2CPQS@ghost>
References: <20230915100113.13131-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915100113.13131-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_082315_024008_B30298B9 
X-CRM114-Status: GOOD (  16.77  )
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

On Fri, Sep 15, 2023 at 12:01:13PM +0200, Alexandre Ghiti wrote:
> kselftests fails to build because the mm/testcases subdirectory is not
> created and then the compiler fails to output the binary there.
> 
> So fix this by simply removing this subdirectory which is not very
> useful.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  tools/testing/selftests/riscv/mm/Makefile                   | 6 +++---
>  .../selftests/riscv/mm/{testcases => }/mmap_bottomup.c      | 2 +-
>  .../selftests/riscv/mm/{testcases => }/mmap_default.c       | 2 +-
>  .../testing/selftests/riscv/mm/{testcases => }/mmap_test.h  | 0
>  .../testing/selftests/riscv/mm/{testcases => }/run_mmap.sh  | 0
>  5 files changed, 5 insertions(+), 5 deletions(-)
>  rename tools/testing/selftests/riscv/mm/{testcases => }/mmap_bottomup.c (97%)
>  rename tools/testing/selftests/riscv/mm/{testcases => }/mmap_default.c (97%)
>  rename tools/testing/selftests/riscv/mm/{testcases => }/mmap_test.h (100%)
>  rename tools/testing/selftests/riscv/mm/{testcases => }/run_mmap.sh (100%)
> 
> diff --git a/tools/testing/selftests/riscv/mm/Makefile b/tools/testing/selftests/riscv/mm/Makefile
> index 11e0f0568923..c333263f2b27 100644
> --- a/tools/testing/selftests/riscv/mm/Makefile
> +++ b/tools/testing/selftests/riscv/mm/Makefile
> @@ -5,11 +5,11 @@
>  # Additional include paths needed by kselftest.h and local headers
>  CFLAGS += -D_GNU_SOURCE -std=gnu99 -I.
>  
> -TEST_GEN_FILES := testcases/mmap_default testcases/mmap_bottomup
> +TEST_GEN_FILES := mmap_default mmap_bottomup
>  
> -TEST_PROGS := testcases/run_mmap.sh
> +TEST_PROGS := run_mmap.sh
>  
>  include ../../lib.mk
>  
> -$(OUTPUT)/mm: testcases/mmap_default.c testcases/mmap_bottomup.c testcases/mmap_tests.h
> +$(OUTPUT)/mm: mmap_default.c mmap_bottomup.c mmap_tests.h
>  	$(CC) -o$@ $(CFLAGS) $(LDFLAGS) $^
> diff --git a/tools/testing/selftests/riscv/mm/testcases/mmap_bottomup.c b/tools/testing/selftests/riscv/mm/mmap_bottomup.c
> similarity index 97%
> rename from tools/testing/selftests/riscv/mm/testcases/mmap_bottomup.c
> rename to tools/testing/selftests/riscv/mm/mmap_bottomup.c
> index b29379f7e478..1757d19ca89b 100644
> --- a/tools/testing/selftests/riscv/mm/testcases/mmap_bottomup.c
> +++ b/tools/testing/selftests/riscv/mm/mmap_bottomup.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  #include <sys/mman.h>
> -#include <testcases/mmap_test.h>
> +#include <mmap_test.h>
>  
>  #include "../../kselftest_harness.h"
>  
> diff --git a/tools/testing/selftests/riscv/mm/testcases/mmap_default.c b/tools/testing/selftests/riscv/mm/mmap_default.c
> similarity index 97%
> rename from tools/testing/selftests/riscv/mm/testcases/mmap_default.c
> rename to tools/testing/selftests/riscv/mm/mmap_default.c
> index d1accb91b726..c63c60b9397e 100644
> --- a/tools/testing/selftests/riscv/mm/testcases/mmap_default.c
> +++ b/tools/testing/selftests/riscv/mm/mmap_default.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  #include <sys/mman.h>
> -#include <testcases/mmap_test.h>
> +#include <mmap_test.h>
>  
>  #include "../../kselftest_harness.h"
>  
> diff --git a/tools/testing/selftests/riscv/mm/testcases/mmap_test.h b/tools/testing/selftests/riscv/mm/mmap_test.h
> similarity index 100%
> rename from tools/testing/selftests/riscv/mm/testcases/mmap_test.h
> rename to tools/testing/selftests/riscv/mm/mmap_test.h
> diff --git a/tools/testing/selftests/riscv/mm/testcases/run_mmap.sh b/tools/testing/selftests/riscv/mm/run_mmap.sh
> similarity index 100%
> rename from tools/testing/selftests/riscv/mm/testcases/run_mmap.sh
> rename to tools/testing/selftests/riscv/mm/run_mmap.sh
> -- 
> 2.39.2
> 
Fixes the problem.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

- Charlie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
