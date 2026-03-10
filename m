Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C81CFCC9A2
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 01:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yBWVB2hPDQRPkm6ArLn4v8JbR3DzbQ5ESeGugJ5yy9Y=; b=tAUj4rKzxqE0K/
	WEZjNgaHHEb+68ryD/arRZEdBcqm8ByVyL5puA/ON2qAM5SZguptFFiD8KreoOKjhKhRZ+/1gqDKx
	s6eorHfJfjchJnxFPb66i4XSUW0J/K6iGiCiREF1lPDBGl269QAWFIj5YMl/JgJ+CJsBX2ALnAu9q
	5oQcSEN7bNKOYp+zX686bM0AhACQUVw/NpDrrxmqp9S1a3lPIrlHP/FVkXbnIj8Xm79My9DN4wFKm
	p9zHtb/DjB2sIXcwz3+sa99DpVJ/zE2wIeFWvnEDbGq73KAH9P9EJ5vvdr49RVhnuory3+B7xTji/
	fleXY1p/6i0nmeAoAJ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzmAZ-00000008VC0-1bh8;
	Tue, 10 Mar 2026 01:45:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzmAX-00000008VBu-20Wd
	for linux-riscv@bombadil.infradead.org;
	Tue, 10 Mar 2026 01:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sas/jGM9/gBj/qBL5u5kVfFi+K6+9Elbw68TaVWyj4k=; b=maadWTmkpNjmzERW6O+ZY09ADq
	8wV64INo8sAgVsBmoO0AsqV8hYjoC8rcluxVdixcjwoQ3lulqVV14ckCt8B/Ka24W1oDI99LM9i75
	2pHV+29E/Wq7FCMV/H2xTVZK4xbLTTs2sKv5g9GqpHbjnK6hJ0zqjmpNatJ8c7uxJzpE3ONWVyXHv
	GBsT3McuRyvtGzjcB7Sf40FxQiec0QXtA2Z/wXnJrSZGIva3iAs8twD4QOcAjJmfNliNkZOzOzMyv
	pYjNdAzLXwD80KHVXCuqLfWrrz3pFhhSw7GyJGoNcHrvR6OosiHMnNJHFQai43z/mCuOK/j/pOP+4
	mQscrA8w==;
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzmAT-0000000DVLv-2ba2
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 01:45:56 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-1273349c56bso14921178c88.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 18:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773107151; x=1773711951; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sas/jGM9/gBj/qBL5u5kVfFi+K6+9Elbw68TaVWyj4k=;
        b=Sjlv65OxDXozPyeSGmlBM8jhU44qUJG+u6rAz2ZxHd29x6TpWUNr6wrJ4ST5Hpa/FF
         yPj9+yDniCVQsP0drUgQENiN7I1WE1arHyC20zyRuJl3Ib5sJY9pjLrC8wlB/qjyecOZ
         Of8stM97Z2e3MpuEaBz1PK3GvEVhsqZU8oOXYqWBYdBvfZgPavVJQjHswmSamCvUIuXV
         pFpIy2O6twZva4LwF7Zzie5bckyfDJKWC75iBEgjEriCkQbSbtI8oiTQE9TP7PP8QDf7
         CLR4Xqbq2sF8OhUdtk1wZ+/CF1HG5gsjdhvnN/TpwGAB1ffShPnWkWH4IYZyryQozXZL
         /Rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773107151; x=1773711951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sas/jGM9/gBj/qBL5u5kVfFi+K6+9Elbw68TaVWyj4k=;
        b=qf5Uk35024ln5g/4BtFig3IA2nK6QatXwEbYaPosjDD96hZz7nz51PLvFzS4ItFDDd
         H17TW1EEB/S4JdGTq9RZFmqwG/xUbs/aJ49E6/ycjy0ZItRBOymF+8X0llLc7X3xHFt6
         tDQ6XL85yzEhH5RWFdM4TxodHfDlckT6qKpE+y1k2d7TfqKf8NxeD+2/s3pEuVdI/Vbu
         mNqgXrdLTMV7KglvVQLGHe201RgaC9TR5ZtzhDC9ukGL+3yl7HgbM1ucFUJyDGMuoht6
         Zdb6ciZ6nCZ8ScRH0pnJOjgQcA9MEDlzpqNvyhKmpJrkEXl7Y9Fq7DaD9wf2dXE3MIQg
         oukA==
X-Forwarded-Encrypted: i=1; AJvYcCV325lJyGRiWxxwzUFBney9FmcQhQIQ1eL6lGh+PmMxglSLweP5FyEWGLMHviAs5dERIHT8Y/GfHQoUJg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw44H5tr1eEFFl6ZtgM9s/bT9jkBLgpzLFM/v7hFLO3wnfSeY6T
	9M0NNCvji5zUU/+5BUsJH7AQ/WjPREd4C25JMOJnJvrrzC9BiPSKlHpJ
X-Gm-Gg: ATEYQzz4qgz+X0i+YCPyOszj40YVLBcivY3rVndDq28POnv8019izP7AtdawJ8z5vaV
	l5+cqQa1PyCpXJdIKxEiOausI6YbRkZd2W55COCGMrg+vB2QY7I5SgA2V/Lk9t7w0aWCVA+b7mF
	3CLSLEoPFZd6fr+sB1dgfuoSHZWEAE3FgUACqraUPHS28x6ayWcH+TqjCw30/b3G6XaffKCx8VX
	TXCD7esqM5dapLSlnDE3xSizJZx9g2V6Z6yKGvhrUt1JMDwxEBJxgZeOXLPEgDthEfP7uo0NFWC
	Hmn4gm0a8W7tVdjYZQwYTJLqwCfmEzoJ8tdcLTK/I3DgJ5ddCMkSw+9A5G6g2WZJdq7HBS3geBY
	AM87WuEEK9Ot9B10ft/qElebQqeTi50H5WUk6HPyLaMlcMxdsic8IJfiJidWZkEzEiSfkBPFVA3
	hFmbAT8qm5x/8yTLkxC9YdIdd67tkILnjR
X-Received: by 2002:a05:7022:6b8e:b0:128:d375:f1d3 with SMTP id a92af1059eb24-128d375f681mr3154192c88.18.1773107150649;
        Mon, 09 Mar 2026 18:45:50 -0700 (PDT)
Received: from inky.localdomain ([2601:647:6700:64d0::5c10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128c3f433d2sm11321482c88.10.2026.03.09.18.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 18:45:50 -0700 (PDT)
Date: Mon, 9 Mar 2026 18:45:46 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] selftests: riscv: Fix compilation issues for
 v_ptrace and cfi
Message-ID: <20260310014546.GA17809@inky.localdomain>
References: <20260305-fix_selftests-v1-0-61b62d23500b@gmail.com>
 <aa85yl-c2suNF5LO@curiosity>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aa85yl-c2suNF5LO@curiosity>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_014554_190464_A2CB9F5C 
X-CRM114-Status: GOOD (  25.03  )
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

On Tue, Mar 10, 2026 at 12:21:14AM +0300, Sergey Matyukevich wrote:
> Hello Charlie,
> 
> On Thu, Mar 05, 2026 at 12:11:28AM -0800, Charlie Jenkins via B4 Relay wrote:
> > There are a couple of compilation issues of the riscv selftests.
> > Coincidentally two of the issues are independent problems with not
> > including the header that includes the BIT() macro and the other issue
> > is from checkpatch incorrectly suggesting to remove non-redundant
> > braces.
> > 
> > Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> > ---
> > Charlie Jenkins (4):
> >       selftests: riscv: Add definition of BIT() macro
> >       selftests: riscv: Add braces around EXPECT_EQ()
> >       riscv: ptrace: Fix BIT() compilation issues
> >       selftests: riscv: Add license to cfi selftest
> > 
> >  arch/riscv/include/uapi/asm/ptrace.h                     |  1 +
> >  tools/testing/selftests/riscv/cfi/Makefile               |  2 ++
> >  tools/testing/selftests/riscv/vector/Makefile            |  2 ++
> >  tools/testing/selftests/riscv/vector/validate_v_ptrace.c | 16 ++++++++++------
> >  4 files changed, 15 insertions(+), 6 deletions(-)
> > ---
> > base-commit: c107785c7e8dbabd1c18301a1c362544b5786282
> > change-id: 20260304-fix_selftests-c3f0ae46b3c7
> > 
> > Best regards,
> > -- 
> > Charlie Jenkins <thecharlesjenkins@gmail.com>
> 
> Thanks for catching this !
> 
> On rc3 I can also reproduce the issue reported by the kernel test robot
> for v_exec_initval_nolibc.c and vstate_exec_nolibc.c. The following
> addition to your fixes seems to resolve it:

I missed that locally since those file compilations were cached for me!

I think we want to keep those as nolibc so instead we can only add the
header to the CFLAGS for only the tests that want libc, I'll send out an
updated version.

- Charlie

> 
> diff --git a/tools/testing/selftests/riscv/vector/Makefile b/tools/testing/selftests/riscv/vector/Makefile
> index 92c4cfe5f34d..48d6cd5e72f6 100644
> --- a/tools/testing/selftests/riscv/vector/Makefile
> +++ b/tools/testing/selftests/riscv/vector/Makefile
> @@ -22,15 +22,13 @@ $(OUTPUT)/vstate_prctl: vstate_prctl.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpe
>  	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
>  
>  $(OUTPUT)/vstate_exec_nolibc: vstate_exec_nolibc.c
> -	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
> -		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
> +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
>  
>  $(OUTPUT)/v_initval: v_initval.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
>  	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
>  
>  $(OUTPUT)/v_exec_initval_nolibc: v_exec_initval_nolibc.c
> -	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
> -		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
> +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
>  
>  $(OUTPUT)/vstate_ptrace: vstate_ptrace.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
>  	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> diff --git a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> index 4dde05e45a04..e3f062c85452 100644
> --- a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> +++ b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> @@ -9,6 +9,10 @@
>   * To be "clean" all values must be all zeroes.
>   */
>  
> +#include <stdlib.h>
> +#include <string.h>
> +#include <stdio.h>
> +
>  #define __stringify_1(x...)	#x
>  #define __stringify(x...)	__stringify_1(x)
>  
> diff --git a/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c b/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
> index 12f1b1b1c7aa..ecd687bb8359 100644
> --- a/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
> +++ b/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
> @@ -1,6 +1,12 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  
> -#include <linux/wait.h>
> +#include <unistd.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <stdio.h>
> +
> +#include <sys/prctl.h>
> +#include <sys/wait.h>
>  
>  #define THIS_PROGRAM "./vstate_exec_nolibc"
> 
> 
> Regards,
> Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
