Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F98C3DA59
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 22:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SnVAtGyeARSix0o8hGP8d3jPdnFoy067IcW6Im7v4r4=; b=G4bra7ewdhmYuI
	5HzNS+puw7LXd2YieD2zFN7MkkF7qd2zrSCTC77uBbzbnz3C5WofvRgmP9Cxw806vT3DzBxCujzG8
	ipAz1UKQ5GT8hqZmP4gVGSDMv4cYfjtaakhD3yOfIyA0VjQvL9CE9Jms4JzhjsKswS01GI6fpEPj4
	KwI9l/ock0ZWqagjU+VE3Ixyq1+dvs50qLQ7+ewaANUEK2QsgmGXBf0Jk4EhbcEzSJezKCs6bJv5k
	/5zJ+3oIc7B8+MnflNngYS+KqLediYao5KbYhUottLqEgyxP5hJ4eiiGvkB5uQMpfN3darYkBxZ5r
	Ad3SqRNhIlynsllGIGdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW1Id-0000000Aipq-2OHF;
	Mon, 22 Jul 2024 22:14:31 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW1Ib-0000000Aip9-15BC
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 22:14:31 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2cb5243766dso2835769a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 15:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721686468; x=1722291268; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rnI7oybV/HUbAbtJY8v1K+OhuBn76sevmv9uupEuIgE=;
        b=DXF3y+50Pxzjqvm2lT/tpkz5q78vjvEWLO8IV+nNkU1JRV2f9L6l/x+xwtjQOVFtI5
         InvfWh04+jDn3brgkce7Aj1WZjMwMLyA75WRIkcqcph/c3P2yzmtCiKeXHk8NU949HPn
         SsHRIsiLTc1dB91kJ/SibfN++iIt/Ah8JMyyR1SL7BRMj0p8BmbgDQhWJs08sFZALNYs
         2FgypVQol+7+5bOjS3WHtUZCGQfBBbxE1eQiwrof1pyr9yM0pk7aW5fA2CXPOVovgTGl
         8QAciQ9H12KjJHQri6zk64DiHeE1pfDQoM91DZI8LZ6p8atWQGzLfpE7RHRA74SIcQ9q
         8bbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721686468; x=1722291268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnI7oybV/HUbAbtJY8v1K+OhuBn76sevmv9uupEuIgE=;
        b=udFGExfNr0fF7K+4HYzlacAGWqf6G9A1ccJiILNykm4BBAUyZ1eREmftAybbBB/6yW
         ChBUho51eswsU9lvWEJoa6HTuKUrhzXgW+CHQPcsdWsmza2BU5nEERx1Sh/HZac30Yh6
         dFUPMBe0MfCbv+1E22WUmZ/iUKANjoOnqt8zboZbWZDHOa8lkhwkemNFKKV4oPudpxc2
         0SOjRSdKSzveAk+7Lr4WSJidG/nwIBN6XFOeNVNQscWB4D9X4LlyMy80E23jKDCVvbD8
         StDeETeb+xoMet0MS6ji9+rKzO47NESnHVhy0EOn+WurWaqpr3Lx+u7HD/2K/xr6fi3z
         uVrA==
X-Forwarded-Encrypted: i=1; AJvYcCWJHi87c0fGY1x+Wdo2yYbWb5+oBEYp6Vt+BssLZkDckaZ2m9O1GZHsDV58zQ3n/3hcMdfOay71xSCG2G0D8PHFL5thiDJSMBhxa5f5R4zq
X-Gm-Message-State: AOJu0YyyBy+LSCgHDO9E9BAM0jPY6UXov9hEd459OvOan7gDhdZcN/vj
	DtsFqEOPljHPJtEN19EKPcCt0C0xAJ64TiCClmqKqzoqPlld7ewnaWLpuyftv5c=
X-Google-Smtp-Source: AGHT+IGbj7DZDu9xdtM7I7b4ely54D1XMYZd7nuHar0IVRmTLnQwyoFRYH9nBIDP0Zw2wpAFGDB+eA==
X-Received: by 2002:a17:90a:d584:b0:2c9:8189:9cc1 with SMTP id 98e67ed59e1d1-2cd85d19266mr971305a91.21.1721686468300;
        Mon, 22 Jul 2024 15:14:28 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f31bb49sm60018365ad.131.2024.07.22.15.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 15:14:27 -0700 (PDT)
Date: Mon, 22 Jul 2024 15:14:24 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 12/13] selftests: riscv: Fix vector tests
Message-ID: <Zp7ZwDzpFt7iJ6iT@ghost>
References: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
 <20240719-xtheadvector-v5-12-4b485fc7d55f@rivosinc.com>
 <20240722-0940cd64c0d8bb03f2427022@orel>
 <Zp7LxAWkDQMQhVLq@ghost>
 <20240722-86a2b1fa474d71c4dbc557c7@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240722-86a2b1fa474d71c4dbc557c7@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_151429_326501_D6510129 
X-CRM114-Status: GOOD (  47.63  )
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

On Mon, Jul 22, 2024 at 05:08:22PM -0500, Andrew Jones wrote:
> On Mon, Jul 22, 2024 at 02:14:44PM GMT, Charlie Jenkins wrote:
> > On Mon, Jul 22, 2024 at 01:47:29PM -0500, Andrew Jones wrote:
> > > On Fri, Jul 19, 2024 at 09:19:07AM GMT, Charlie Jenkins wrote:
> > > > Overhaul the riscv vector tests to use kselftest_harness to help the
> > > > test cases correctly report the results and decouple the individual test
> > > > cases from each other. With this refactoring, only run the test cases is
> > > > vector is reported and properly report the test case as skipped
> > > > otherwise. The v_initval_nolibc test was previously not checking if
> > > > vector was supported and used a function (malloc) which invalidates
> > > > the state of the vector registers.
> > > > 
> > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > ---
> > > >  tools/testing/selftests/riscv/abi/ptrace           | Bin 0 -> 759368 bytes
> > > >  tools/testing/selftests/riscv/vector/.gitignore    |   3 +-
> > > >  tools/testing/selftests/riscv/vector/Makefile      |  17 +-
> > > >  .../selftests/riscv/vector/v_exec_initval_nolibc.c |  84 +++++++
> > > >  tools/testing/selftests/riscv/vector/v_helpers.c   |  56 +++++
> > > >  tools/testing/selftests/riscv/vector/v_helpers.h   |   5 +
> > > >  tools/testing/selftests/riscv/vector/v_initval.c   |  16 ++
> > > >  .../selftests/riscv/vector/v_initval_nolibc.c      |  68 ------
> > > >  .../testing/selftests/riscv/vector/vstate_prctl.c  | 266 ++++++++++++---------
> > > >  9 files changed, 324 insertions(+), 191 deletions(-)
> > > > 
> > > > diff --git a/tools/testing/selftests/riscv/abi/ptrace b/tools/testing/selftests/riscv/abi/ptrace
> > > > new file mode 100755
> > > > index 000000000000..2b03e77b4dcf
> > > > Binary files /dev/null and b/tools/testing/selftests/riscv/abi/ptrace differ
> > > > diff --git a/tools/testing/selftests/riscv/vector/.gitignore b/tools/testing/selftests/riscv/vector/.gitignore
> > > > index 9ae7964491d5..7d9c87cd0649 100644
> > > > --- a/tools/testing/selftests/riscv/vector/.gitignore
> > > > +++ b/tools/testing/selftests/riscv/vector/.gitignore
> > > > @@ -1,3 +1,4 @@
> > > >  vstate_exec_nolibc
> > > >  vstate_prctl
> > > > -v_initval_nolibc
> > > > +v_initval
> > > > +v_exec_initval_nolibc
> > > > diff --git a/tools/testing/selftests/riscv/vector/Makefile b/tools/testing/selftests/riscv/vector/Makefile
> > > > index bfff0ff4f3be..995746359477 100644
> > > > --- a/tools/testing/selftests/riscv/vector/Makefile
> > > > +++ b/tools/testing/selftests/riscv/vector/Makefile
> > > > @@ -2,18 +2,27 @@
> > > >  # Copyright (C) 2021 ARM Limited
> > > >  # Originally tools/testing/arm64/abi/Makefile
> > > >  
> > > > -TEST_GEN_PROGS := vstate_prctl v_initval_nolibc
> > > > -TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc
> > > > +TEST_GEN_PROGS := v_initval vstate_prctl
> > > > +TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc v_exec_initval_nolibc sys_hwprobe.o v_helpers.o
> > > >  
> > > >  include ../../lib.mk
> > > >  
> > > > -$(OUTPUT)/vstate_prctl: vstate_prctl.c ../hwprobe/sys_hwprobe.S
> > > > +$(OUTPUT)/sys_hwprobe.o: ../hwprobe/sys_hwprobe.S
> > > > +	$(CC) -static -c -o$@ $(CFLAGS) $^
> > > > +
> > > > +$(OUTPUT)/v_helpers.o: v_helpers.c
> > > > +	$(CC) -static -c -o$@ $(CFLAGS) $^
> > > > +
> > > > +$(OUTPUT)/vstate_prctl: vstate_prctl.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
> > > >  	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> > > >  
> > > >  $(OUTPUT)/vstate_exec_nolibc: vstate_exec_nolibc.c
> > > >  	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
> > > >  		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
> > > >  
> > > > -$(OUTPUT)/v_initval_nolibc: v_initval_nolibc.c
> > > > +$(OUTPUT)/v_initval: v_initval.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
> > > > +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> > > > +
> > > > +$(OUTPUT)/v_exec_initval_nolibc: v_exec_initval_nolibc.c
> > > >  	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
> > > >  		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
> > > > diff --git a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> > > > new file mode 100644
> > > > index 000000000000..74b13806baf0
> > > > --- /dev/null
> > > > +++ b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> > > > @@ -0,0 +1,84 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * Get values of vector registers as soon as the program starts to test if
> > > > + * is properly cleaning the values before starting a new program. Vector
> > > > + * registers are caller saved, so no function calls may happen before reading
> > > > + * the values. To further ensure consistency, this file is compiled without
> > > > + * libc and without auto-vectorization.
> > > > + *
> > > > + * To be "clean" all values must be either all ones or all zeroes.
> > > > + */
> > > > +
> > > > +#define __stringify_1(x...)	#x
> > > > +#define __stringify(x...)	__stringify_1(x)
> > > > +
> > > > +int main(int argc, char **argv)
> > > > +{
> > > > +	char prev_value = 0, value;
> > > > +	unsigned long vl;
> > > > +	int first = 1;
> > > > +
> > > > +	asm volatile (
> > > > +		".option push\n\t"
> > > > +		".option arch, +v\n\t"
> > > > +		"vsetvli	%[vl], x0, e8, m1, ta, ma\n\t"
> > > > +		".option pop\n\t"
> > > > +		: [vl] "=r" (vl)
> > > > +	);
> > > > +
> > > > +#define CHECK_VECTOR_REGISTER(register) ({					\
> > > > +	for (int i = 0; i < vl; i++) {						\
> > > > +		asm volatile (							\
> > > > +			".option push\n\t"					\
> > > > +			".option arch, +v\n\t"					\
> > > > +			"vmv.x.s %0, " __stringify(register) "\n\t"		\
> > > > +			"vsrl.vi " __stringify(register) ", " __stringify(register) ", 8\n\t" \
> > > > +			".option pop\n\t"					\
> > > > +			: "=r" (value));					\
> > > > +		if (first) {							\
> > > > +			first = 0;						\
> > > > +		} else if (value != prev_value || !(value == 0x00 || value == 0xff)) { \
> > > > +			printf("Register " __stringify(register) " values not clean! value: %u\n", value);	\
> > > > +			exit(-1);						\
> > > 
> > > I think we should ensure all tests in tools/testing/selftests/riscv/ use
> > > TAP output, exiting with ksft_finished(), or at least exit with 0 for
> > > success. For example, vstate_exec_nolibc exits with 2 for success since
> > > it exits with the return value of prctl(PR_RISCV_V_GET_CONTROL). And
> > > vstate_prctl.c exits with several different negative values, which means
> > > it'll exit with several different values around 255. To figure what went
> > > wrong, one will have to convert those exit codes to the original negative
> > > values in order to look them up. Having these types of inconsistent exit
> > > values complicates QA.
> > > 
> > > Thanks,
> > > drew
> > 
> > I do not follow. I am using the kselftest_harness
> > (tools/testing/selftests/kselftest_harness.h) that does output using the
> > TAP format. vstate_exec_nolibc is not a test in itself but is a helper.
> 
> Ah, this was my misunderstanding, as I'm used to all files with main()
> being independent tests and I only grepped exit codes. I'll have to look
> to see how this all fits together.
> 
> > The Makefile for the vector tests describes this as:
> > 
> > TEST_GEN_PROGS := v_initval vstate_prctl
> > 
> > If you run the riscv collection of tests with:
> > 
> > $ ./run_kselftest.sh --collection riscv
> 
> I'll look later, but I hope those tests can also be run standalone and
> still get TAP output.
> 
> Thanks,
> drew

Yes, running v_initval and vstate_prctl standalone does provide TAP
output.

- Charlie

> 
> > 
> > You will see that the only vector test cases are v_initval and
> > vstate_prctl, which both output as expected in TAP format.
> > 
> > I do see that I messed up the return type of the is_vector_supported()
> > function, I had meant to change that to a bool from an int since
> > RISCV_HWPROBE_EXT_ZVE32X is greater than 32 bits. I will send a new
> > version.
> > 
> > - Charlie
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
