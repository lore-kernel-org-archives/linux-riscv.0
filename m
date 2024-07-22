Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2995C3DA5D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 22:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZGKEQGIVXUzvgfy4Fjk8HaoVep4QGjyInfx/OWhyByU=; b=d9bo7HMKz1vlFK
	OyF4sPTY9JPDbsQ/xA5gyNMY8ZU2U5g5apvYx3qwJYg+8d4ItC8bdYdYVtAe5pwtTLnVnmM1aRHpS
	9Xdf1DAGJAzVMiE7LwIewXYo1zwgjM9jr8WySyXu+N0tSBwocsDGYBjgPXwXHyJ6xS4iUbYGSKCs8
	B0Q7p+lYeeDs/Zs7bZnbYqMAHJ72Wxa5VwA3dluYbN2ULsPpFIJYmvvlx+co1b9U/j1qGrBgKP8EQ
	lZUCXywrmRl1JliexpHdZtQ7U7ZoNcfmTBSfj53mLbUS1U6mH2kIK9cF97hD8GoWvqs39qZgqWU0p
	oO4YSi1nexr7l/Vb9dlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW1Cm-0000000AiB1-2Ynu;
	Mon, 22 Jul 2024 22:08:28 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW1Cj-0000000AiAa-21Dk
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 22:08:26 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6b797fb1c4aso37795506d6.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 15:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721686104; x=1722290904; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LWkf3HH1tp0DsKyJLpS4yaHfwlf3QF0BPJJ770sq1hg=;
        b=ppcS6Kls22o9tT3bgul8rIwlY49TQLub0BwQ6Zo8YYZaHudQV3FEZWT6G9ygEbQPSW
         kKOC1j2r2YwrpdSGgB4r7J9utx1xnin7dAE/78wDrFp/XA4nnHXddyRtxTvotGQori+6
         5EGw0v9UIK/9SXovApOoZfHE7xONTCI2jtUBo5uRD9nOGpta4LkDoqpvtzjCS/zVAHdK
         gImFhJm7ZXddBQXw6fMXGO9H1gXN50n5rf47IImWHQIWW/KcgvgH+vtCaBKID58Zt7AA
         3ZBmKGRu6NeK4fqTMb+TAke5zHNCQBxZqLuFjegA4iYO86ROZgDpODTBcguQmqEuFdvh
         4z1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721686104; x=1722290904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWkf3HH1tp0DsKyJLpS4yaHfwlf3QF0BPJJ770sq1hg=;
        b=WrvsOH1c3kidIrdETVHZLrGM5cQDIt05bFsa+T8liWk/UKXzi0S456dkhQNHn5DVtQ
         hWAWXCkxu05QdrqRajMGIojU+iWkV0WdYaPuFEScqmpvjrL1bEcdJmCtx16NQLsYLxq/
         LYWU+ITHd3NtzaDY1KS9B1F3ipWcMIr/88hRAtkcbC4q67NR8Z0Vq3Q9NsqHRdfF1tQg
         LjoU+NYAQF9yvdGu+Cs3j2SpxeQ22APbNMsyNcUrejcEsOnH5X5jsgZWXHTkPQvyDkuZ
         Gqb+18TnC8o7ZHfpoq4Jpr2jeijAciIWsNEDK5LRula30V2WesP0i1tCPOt/O324FWZM
         njXw==
X-Forwarded-Encrypted: i=1; AJvYcCVqNPVPlm4GtQw9cNJabLkKVoKJOIYjJILKvFW5oYuC4gwBsfe0HXvarXOsegKuEILWY9zfg7MJ6UKQ2GCIBRRwzTxub5vDx28NP9ejoBIP
X-Gm-Message-State: AOJu0Ywvl8ZzAcZg2o0tgqyy5OKgUTIa8J6vroTyPMve5vvcQIf1HaJM
	tuwf1GT9lKvZpucrnJeSQTyyfiBEOEnVJWwcHgC7RAxl9HqmVG4Oc9bRaNEYleU=
X-Google-Smtp-Source: AGHT+IGHLCwp0hGqtqL1q8f5M6PmDSweCC+kXH8yPvsoAi0ErhWstRGT1kYEy1C5OxbQyy+l7RVM0w==
X-Received: by 2002:a05:6214:767:b0:6b5:4865:948e with SMTP id 6a1803df08f44-6b95a3a2195mr93587836d6.32.1721686103802;
        Mon, 22 Jul 2024 15:08:23 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f9cd040easm37577341cf.30.2024.07.22.15.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 15:08:23 -0700 (PDT)
Date: Mon, 22 Jul 2024 17:08:22 -0500
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
Message-ID: <20240722-86a2b1fa474d71c4dbc557c7@orel>
References: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
 <20240719-xtheadvector-v5-12-4b485fc7d55f@rivosinc.com>
 <20240722-0940cd64c0d8bb03f2427022@orel>
 <Zp7LxAWkDQMQhVLq@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zp7LxAWkDQMQhVLq@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_150825_551282_7B641900 
X-CRM114-Status: GOOD (  45.15  )
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

On Mon, Jul 22, 2024 at 02:14:44PM GMT, Charlie Jenkins wrote:
> On Mon, Jul 22, 2024 at 01:47:29PM -0500, Andrew Jones wrote:
> > On Fri, Jul 19, 2024 at 09:19:07AM GMT, Charlie Jenkins wrote:
> > > Overhaul the riscv vector tests to use kselftest_harness to help the
> > > test cases correctly report the results and decouple the individual test
> > > cases from each other. With this refactoring, only run the test cases is
> > > vector is reported and properly report the test case as skipped
> > > otherwise. The v_initval_nolibc test was previously not checking if
> > > vector was supported and used a function (malloc) which invalidates
> > > the state of the vector registers.
> > > 
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > ---
> > >  tools/testing/selftests/riscv/abi/ptrace           | Bin 0 -> 759368 bytes
> > >  tools/testing/selftests/riscv/vector/.gitignore    |   3 +-
> > >  tools/testing/selftests/riscv/vector/Makefile      |  17 +-
> > >  .../selftests/riscv/vector/v_exec_initval_nolibc.c |  84 +++++++
> > >  tools/testing/selftests/riscv/vector/v_helpers.c   |  56 +++++
> > >  tools/testing/selftests/riscv/vector/v_helpers.h   |   5 +
> > >  tools/testing/selftests/riscv/vector/v_initval.c   |  16 ++
> > >  .../selftests/riscv/vector/v_initval_nolibc.c      |  68 ------
> > >  .../testing/selftests/riscv/vector/vstate_prctl.c  | 266 ++++++++++++---------
> > >  9 files changed, 324 insertions(+), 191 deletions(-)
> > > 
> > > diff --git a/tools/testing/selftests/riscv/abi/ptrace b/tools/testing/selftests/riscv/abi/ptrace
> > > new file mode 100755
> > > index 000000000000..2b03e77b4dcf
> > > Binary files /dev/null and b/tools/testing/selftests/riscv/abi/ptrace differ
> > > diff --git a/tools/testing/selftests/riscv/vector/.gitignore b/tools/testing/selftests/riscv/vector/.gitignore
> > > index 9ae7964491d5..7d9c87cd0649 100644
> > > --- a/tools/testing/selftests/riscv/vector/.gitignore
> > > +++ b/tools/testing/selftests/riscv/vector/.gitignore
> > > @@ -1,3 +1,4 @@
> > >  vstate_exec_nolibc
> > >  vstate_prctl
> > > -v_initval_nolibc
> > > +v_initval
> > > +v_exec_initval_nolibc
> > > diff --git a/tools/testing/selftests/riscv/vector/Makefile b/tools/testing/selftests/riscv/vector/Makefile
> > > index bfff0ff4f3be..995746359477 100644
> > > --- a/tools/testing/selftests/riscv/vector/Makefile
> > > +++ b/tools/testing/selftests/riscv/vector/Makefile
> > > @@ -2,18 +2,27 @@
> > >  # Copyright (C) 2021 ARM Limited
> > >  # Originally tools/testing/arm64/abi/Makefile
> > >  
> > > -TEST_GEN_PROGS := vstate_prctl v_initval_nolibc
> > > -TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc
> > > +TEST_GEN_PROGS := v_initval vstate_prctl
> > > +TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc v_exec_initval_nolibc sys_hwprobe.o v_helpers.o
> > >  
> > >  include ../../lib.mk
> > >  
> > > -$(OUTPUT)/vstate_prctl: vstate_prctl.c ../hwprobe/sys_hwprobe.S
> > > +$(OUTPUT)/sys_hwprobe.o: ../hwprobe/sys_hwprobe.S
> > > +	$(CC) -static -c -o$@ $(CFLAGS) $^
> > > +
> > > +$(OUTPUT)/v_helpers.o: v_helpers.c
> > > +	$(CC) -static -c -o$@ $(CFLAGS) $^
> > > +
> > > +$(OUTPUT)/vstate_prctl: vstate_prctl.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
> > >  	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> > >  
> > >  $(OUTPUT)/vstate_exec_nolibc: vstate_exec_nolibc.c
> > >  	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
> > >  		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
> > >  
> > > -$(OUTPUT)/v_initval_nolibc: v_initval_nolibc.c
> > > +$(OUTPUT)/v_initval: v_initval.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
> > > +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> > > +
> > > +$(OUTPUT)/v_exec_initval_nolibc: v_exec_initval_nolibc.c
> > >  	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
> > >  		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
> > > diff --git a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> > > new file mode 100644
> > > index 000000000000..74b13806baf0
> > > --- /dev/null
> > > +++ b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> > > @@ -0,0 +1,84 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Get values of vector registers as soon as the program starts to test if
> > > + * is properly cleaning the values before starting a new program. Vector
> > > + * registers are caller saved, so no function calls may happen before reading
> > > + * the values. To further ensure consistency, this file is compiled without
> > > + * libc and without auto-vectorization.
> > > + *
> > > + * To be "clean" all values must be either all ones or all zeroes.
> > > + */
> > > +
> > > +#define __stringify_1(x...)	#x
> > > +#define __stringify(x...)	__stringify_1(x)
> > > +
> > > +int main(int argc, char **argv)
> > > +{
> > > +	char prev_value = 0, value;
> > > +	unsigned long vl;
> > > +	int first = 1;
> > > +
> > > +	asm volatile (
> > > +		".option push\n\t"
> > > +		".option arch, +v\n\t"
> > > +		"vsetvli	%[vl], x0, e8, m1, ta, ma\n\t"
> > > +		".option pop\n\t"
> > > +		: [vl] "=r" (vl)
> > > +	);
> > > +
> > > +#define CHECK_VECTOR_REGISTER(register) ({					\
> > > +	for (int i = 0; i < vl; i++) {						\
> > > +		asm volatile (							\
> > > +			".option push\n\t"					\
> > > +			".option arch, +v\n\t"					\
> > > +			"vmv.x.s %0, " __stringify(register) "\n\t"		\
> > > +			"vsrl.vi " __stringify(register) ", " __stringify(register) ", 8\n\t" \
> > > +			".option pop\n\t"					\
> > > +			: "=r" (value));					\
> > > +		if (first) {							\
> > > +			first = 0;						\
> > > +		} else if (value != prev_value || !(value == 0x00 || value == 0xff)) { \
> > > +			printf("Register " __stringify(register) " values not clean! value: %u\n", value);	\
> > > +			exit(-1);						\
> > 
> > I think we should ensure all tests in tools/testing/selftests/riscv/ use
> > TAP output, exiting with ksft_finished(), or at least exit with 0 for
> > success. For example, vstate_exec_nolibc exits with 2 for success since
> > it exits with the return value of prctl(PR_RISCV_V_GET_CONTROL). And
> > vstate_prctl.c exits with several different negative values, which means
> > it'll exit with several different values around 255. To figure what went
> > wrong, one will have to convert those exit codes to the original negative
> > values in order to look them up. Having these types of inconsistent exit
> > values complicates QA.
> > 
> > Thanks,
> > drew
> 
> I do not follow. I am using the kselftest_harness
> (tools/testing/selftests/kselftest_harness.h) that does output using the
> TAP format. vstate_exec_nolibc is not a test in itself but is a helper.

Ah, this was my misunderstanding, as I'm used to all files with main()
being independent tests and I only grepped exit codes. I'll have to look
to see how this all fits together.

> The Makefile for the vector tests describes this as:
> 
> TEST_GEN_PROGS := v_initval vstate_prctl
> 
> If you run the riscv collection of tests with:
> 
> $ ./run_kselftest.sh --collection riscv

I'll look later, but I hope those tests can also be run standalone and
still get TAP output.

Thanks,
drew

> 
> You will see that the only vector test cases are v_initval and
> vstate_prctl, which both output as expected in TAP format.
> 
> I do see that I messed up the return type of the is_vector_supported()
> function, I had meant to change that to a bool from an int since
> RISCV_HWPROBE_EXT_ZVE32X is greater than 32 bits. I will send a new
> version.
> 
> - Charlie
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
