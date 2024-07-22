Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BFFC3DA5D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 18:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lyuGYXWXA4lx4drsP/deKEQLwfw0fE94NUFvSnUIghg=; b=uJmhj8E/lzQF0Z
	YHFUc+Im7ATL2aj+WVRPYy5nueCo28be0TD0zNtp89u+Sk4hn81ilQuBavfi7iHNIGKIXdOO0a8Su
	CtlrSgswzAxgHGKk9/E1HxLdEdKxAAdyM7HmlLwgeoxq34RERI/R7Ri/e+u6Xuc3cgSDVwYXxoZ2C
	yAHNkM2ozh/yxjP4B9LpiSPkB7GOKkBUBIImDBCa5no3iV8C7hBdpiy4B+2LzXTPiL0eArL++eEkY
	09ko0eUOjIgvWIL+M311RQ6jWL6QQshRQSNBWZ0gXDJGN0l3NvlSWGBnnqhsvJrBJqpGPFytlw/0V
	fwTWecD17A2oEPx1r6SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVy4N-0000000AJpI-405v;
	Mon, 22 Jul 2024 18:47:35 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVy4K-0000000AJon-3oM1
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 18:47:34 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-7f70a708f8aso187096739f.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 11:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721674051; x=1722278851; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OzTRfDaexdJXU/NKu+dqGzHLJmOKAxsba4iUWApjtBs=;
        b=SGnhhhri1F1WlBeqB5bjT4My0dUS3hmavm4Eg/d4ic01Lg5NawX1Sr9HBlt6iG7PYb
         LrT+402+nZCDWTPJ94FXFRq/YdgWuWqWOdVo3VeVyWYpyXPmIh99XoMhJwpn0C8mz6Nl
         mkEOC01ADOp+DzYSt+1bvj4jRhxQ2ilMQWEg4WKt19Mm4hYb7lweihcF6ytl71YrO+Uy
         Er7rv/gXFmsSkiPwsR/GS7ZKcFOZ0ozxe7uJKGThuouGswoXOXJwaio3eGIXP/v4LC3G
         jNzX8PNnYMswew8+3RfObmCpgk6A8IpqynlPXGlWG6yHkrJ9SBhI+KhI8OvB0aekhKXD
         GvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721674051; x=1722278851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzTRfDaexdJXU/NKu+dqGzHLJmOKAxsba4iUWApjtBs=;
        b=Opl7tNWCLDfMTLkJ/CN4pUuQ2DZi99vBeM+aq1njjejNwwr3wgg7N9vSkulVrx6WkB
         k83YOD0bIAZQordtMp+up5U1lwlYGygOz9/zspuNP9iqrzkp5minJ3e5HNvpV+Im9eqr
         HqMU/0uSv3+z4yBhqucQKTgcLWwPAWMIoXfJp2u4QiX2RlLgUSWyhPnyQUK9BujuGkiH
         Flkx6TxQPpJuux3/p/5MqMlSnRh47pOztGulyc681ijFDaNHWvxSz+BxlQmzk98+CykR
         94QePb4xUJXZQFtt57sU/QrEAggqbhOUYBQhlNZ1XwY56j5rFb9oJ2z0ZAQ5mqQ9ASze
         zkiw==
X-Forwarded-Encrypted: i=1; AJvYcCVP2JWrmuHkYKLARCAQb1JiOco7CqOrfgGKsV6QYeKKvTg0J93fK7nZvT10fRW+8o0APWkXpPlYgTTNmc22QVbzrG7SapG4HhC634g0aL3a
X-Gm-Message-State: AOJu0YyV6wHXsqe+lfLoHXkCkDtE6oGF+p9BrHTLDPDfwYq7TaLBZwmk
	0tW61eWpGzTu+xqFrgSyMU5cInMkk6amKiRBeUoCjp0xFgjxmGCAqVTH6VNfLIU=
X-Google-Smtp-Source: AGHT+IFOuPIoea3HTs+tbRyLXH40CUhD1wo+gozLPHK8gHW5C0xpq+X2GQXcdlWAxPs41NzeH0m9PA==
X-Received: by 2002:a05:6602:48d:b0:804:2b28:75db with SMTP id ca18e2360f4ac-81ea3b3a2cfmr103988639f.10.1721674051211;
        Mon, 22 Jul 2024 11:47:31 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-819abb08682sm258753339f.1.2024.07.22.11.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 11:47:30 -0700 (PDT)
Date: Mon, 22 Jul 2024 13:47:29 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Jessica Clarke <jrtc27@jrtc27.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 12/13] selftests: riscv: Fix vector tests
Message-ID: <20240722-0940cd64c0d8bb03f2427022@orel>
References: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
 <20240719-xtheadvector-v5-12-4b485fc7d55f@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240719-xtheadvector-v5-12-4b485fc7d55f@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_114732_975172_5E5A1DA3 
X-CRM114-Status: GOOD (  28.93  )
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

On Fri, Jul 19, 2024 at 09:19:07AM GMT, Charlie Jenkins wrote:
> Overhaul the riscv vector tests to use kselftest_harness to help the
> test cases correctly report the results and decouple the individual test
> cases from each other. With this refactoring, only run the test cases is
> vector is reported and properly report the test case as skipped
> otherwise. The v_initval_nolibc test was previously not checking if
> vector was supported and used a function (malloc) which invalidates
> the state of the vector registers.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  tools/testing/selftests/riscv/abi/ptrace           | Bin 0 -> 759368 bytes
>  tools/testing/selftests/riscv/vector/.gitignore    |   3 +-
>  tools/testing/selftests/riscv/vector/Makefile      |  17 +-
>  .../selftests/riscv/vector/v_exec_initval_nolibc.c |  84 +++++++
>  tools/testing/selftests/riscv/vector/v_helpers.c   |  56 +++++
>  tools/testing/selftests/riscv/vector/v_helpers.h   |   5 +
>  tools/testing/selftests/riscv/vector/v_initval.c   |  16 ++
>  .../selftests/riscv/vector/v_initval_nolibc.c      |  68 ------
>  .../testing/selftests/riscv/vector/vstate_prctl.c  | 266 ++++++++++++---------
>  9 files changed, 324 insertions(+), 191 deletions(-)
> 
> diff --git a/tools/testing/selftests/riscv/abi/ptrace b/tools/testing/selftests/riscv/abi/ptrace
> new file mode 100755
> index 000000000000..2b03e77b4dcf
> Binary files /dev/null and b/tools/testing/selftests/riscv/abi/ptrace differ
> diff --git a/tools/testing/selftests/riscv/vector/.gitignore b/tools/testing/selftests/riscv/vector/.gitignore
> index 9ae7964491d5..7d9c87cd0649 100644
> --- a/tools/testing/selftests/riscv/vector/.gitignore
> +++ b/tools/testing/selftests/riscv/vector/.gitignore
> @@ -1,3 +1,4 @@
>  vstate_exec_nolibc
>  vstate_prctl
> -v_initval_nolibc
> +v_initval
> +v_exec_initval_nolibc
> diff --git a/tools/testing/selftests/riscv/vector/Makefile b/tools/testing/selftests/riscv/vector/Makefile
> index bfff0ff4f3be..995746359477 100644
> --- a/tools/testing/selftests/riscv/vector/Makefile
> +++ b/tools/testing/selftests/riscv/vector/Makefile
> @@ -2,18 +2,27 @@
>  # Copyright (C) 2021 ARM Limited
>  # Originally tools/testing/arm64/abi/Makefile
>  
> -TEST_GEN_PROGS := vstate_prctl v_initval_nolibc
> -TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc
> +TEST_GEN_PROGS := v_initval vstate_prctl
> +TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc v_exec_initval_nolibc sys_hwprobe.o v_helpers.o
>  
>  include ../../lib.mk
>  
> -$(OUTPUT)/vstate_prctl: vstate_prctl.c ../hwprobe/sys_hwprobe.S
> +$(OUTPUT)/sys_hwprobe.o: ../hwprobe/sys_hwprobe.S
> +	$(CC) -static -c -o$@ $(CFLAGS) $^
> +
> +$(OUTPUT)/v_helpers.o: v_helpers.c
> +	$(CC) -static -c -o$@ $(CFLAGS) $^
> +
> +$(OUTPUT)/vstate_prctl: vstate_prctl.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
>  	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
>  
>  $(OUTPUT)/vstate_exec_nolibc: vstate_exec_nolibc.c
>  	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
>  		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
>  
> -$(OUTPUT)/v_initval_nolibc: v_initval_nolibc.c
> +$(OUTPUT)/v_initval: v_initval.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
> +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> +
> +$(OUTPUT)/v_exec_initval_nolibc: v_exec_initval_nolibc.c
>  	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
>  		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
> diff --git a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> new file mode 100644
> index 000000000000..74b13806baf0
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Get values of vector registers as soon as the program starts to test if
> + * is properly cleaning the values before starting a new program. Vector
> + * registers are caller saved, so no function calls may happen before reading
> + * the values. To further ensure consistency, this file is compiled without
> + * libc and without auto-vectorization.
> + *
> + * To be "clean" all values must be either all ones or all zeroes.
> + */
> +
> +#define __stringify_1(x...)	#x
> +#define __stringify(x...)	__stringify_1(x)
> +
> +int main(int argc, char **argv)
> +{
> +	char prev_value = 0, value;
> +	unsigned long vl;
> +	int first = 1;
> +
> +	asm volatile (
> +		".option push\n\t"
> +		".option arch, +v\n\t"
> +		"vsetvli	%[vl], x0, e8, m1, ta, ma\n\t"
> +		".option pop\n\t"
> +		: [vl] "=r" (vl)
> +	);
> +
> +#define CHECK_VECTOR_REGISTER(register) ({					\
> +	for (int i = 0; i < vl; i++) {						\
> +		asm volatile (							\
> +			".option push\n\t"					\
> +			".option arch, +v\n\t"					\
> +			"vmv.x.s %0, " __stringify(register) "\n\t"		\
> +			"vsrl.vi " __stringify(register) ", " __stringify(register) ", 8\n\t" \
> +			".option pop\n\t"					\
> +			: "=r" (value));					\
> +		if (first) {							\
> +			first = 0;						\
> +		} else if (value != prev_value || !(value == 0x00 || value == 0xff)) { \
> +			printf("Register " __stringify(register) " values not clean! value: %u\n", value);	\
> +			exit(-1);						\

I think we should ensure all tests in tools/testing/selftests/riscv/ use
TAP output, exiting with ksft_finished(), or at least exit with 0 for
success. For example, vstate_exec_nolibc exits with 2 for success since
it exits with the return value of prctl(PR_RISCV_V_GET_CONTROL). And
vstate_prctl.c exits with several different negative values, which means
it'll exit with several different values around 255. To figure what went
wrong, one will have to convert those exit codes to the original negative
values in order to look them up. Having these types of inconsistent exit
values complicates QA.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
