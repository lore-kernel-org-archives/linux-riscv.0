Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DCDC3DA5D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 21:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TcCD/uc11yKeWukouP9pSbOdNmkQEb5RDcA6Oz8puR8=; b=mlITDJ8eC3knqz
	5L2uPxE4JBPCjTyq0HL8T8uWyDj2gUXm+zR+fDTg/2hVswRaEr0sVw4P3Uddiv+bSBYXkLyx/WiDJ
	4inSIlJlrgj1CwyOqiNoC9c31VivZN04X7oVDKEaRrZ6Q9dytekAhQY4Q1k3ozxnGDjsoYRzQ6Z/9
	CJYyqvoN6XNoOFNgEREhAj9DAOepFtPxGxFhxn9oQqs4i+3HGE+tWCbQp6EG36mImD9sbdE5gvCkt
	G1ed+Y7fLqtKLbvKRtmq61MuRBkr3InA+TnRBASvE7vM67woeEUoECyC8X1e1pktQlrw2PIYafFIL
	wcM/jGjZ4MVIVyZQf4zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW0Mu-0000000AagA-1RSo;
	Mon, 22 Jul 2024 21:14:52 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW0Mr-0000000Aaeu-2yf5
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 21:14:51 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1fd90c2fc68so798665ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 14:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721682889; x=1722287689; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=re4a/549teXfpxRZzb1IT6fF6eSAFMvkPvsA5nTBSEI=;
        b=mKyjVKiqqIzarR29rrGtH81ex+mvKR0hlrVbqt13hFf2r7Z5I0TQmfL1uLs7n8UGtp
         VIQGXqtYmqJFvqtDN94Cd1Yun/K5KfKR97YmsE4PkMo/pNZBC9/t/5YpXqlorIrut+vC
         qtwe0Dq9VoplXogxHDymSGOdNwOwdOemuges8LUzIxan1m/Dhtw+RcpO5A5/H9S/u3GU
         8wg7RTe9cyZQqnpUo2u9q4GFTelNp3VlWCTTa5L5Dyd4qn3UooG6jo/eZUhIdywkicAh
         YsZY11tD+/eKrxDaBDPWutWI8oEx7djidhBc7jkc7zmjKW5lC8g/TpwOr9ykjPBiMp7V
         fKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721682889; x=1722287689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=re4a/549teXfpxRZzb1IT6fF6eSAFMvkPvsA5nTBSEI=;
        b=dD4a03bxgA/5dSifZqNESsNaQElnp1w2cFMsII1P6lwMAm4coXRltklpkVBQNFJUZU
         Rx3Z5KEKCZnUV3aMVtwjKo1emAt+h76jEOBY3erwwQIhOYQG4hw2qvWvstJ1BUP2gDCp
         7wefCR6WuCUvFsVlhYAmbAivn/DLCIaa/RElG3Xkn7wrEN6jspcBhJ/wSo5dtqkXmXAH
         pUm9CUrMG8wpsp8cMPdFsM1kKIDCdCj4Z0FrHQKM9QUUxCuLPiXXTQF0OQtnDYcPL3sY
         P5ARJ+0wYJLvhZnclxnXeDU8pUqCuq8b4wL/5R390T2K8VEwNN/TE3AXcvBWisBdZ2MW
         muOg==
X-Forwarded-Encrypted: i=1; AJvYcCUH6UuMLhvrAqcGrectoJygIdv4QDwEXfirp1PK68Dlrw7LsrrS34KsnDxB7dGxyPumdIa6gw185QMuKbNjxUrElIiEEzfOsHv8UhrFOMpn
X-Gm-Message-State: AOJu0YzrXz259EgmStE4Gd6P+lPfbnMjLEEE4ufVCjr/cyX7S+nghwhh
	GAtnqyecvU8OHzkOWK/uakTZ/8jTYLOFDe68txMDP96b6zZ7W0C231XumhLTmKU=
X-Google-Smtp-Source: AGHT+IHNGpumvDD95UYgz2v1+PPZ4GlU1XFvLWIOWNaPJpQc9m08TfGb1igAHvmYgQ6MZbrThHXc8A==
X-Received: by 2002:a17:902:db02:b0:1fb:4b87:6e9d with SMTP id d9443c01a7336-1fdb5f6b95fmr9284455ad.42.1721682888632;
        Mon, 22 Jul 2024 14:14:48 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f485bd1sm59363665ad.275.2024.07.22.14.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 14:14:48 -0700 (PDT)
Date: Mon, 22 Jul 2024 14:14:44 -0700
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
Message-ID: <Zp7LxAWkDQMQhVLq@ghost>
References: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
 <20240719-xtheadvector-v5-12-4b485fc7d55f@rivosinc.com>
 <20240722-0940cd64c0d8bb03f2427022@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240722-0940cd64c0d8bb03f2427022@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_141449_777189_A8B25F2B 
X-CRM114-Status: GOOD (  37.08  )
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

On Mon, Jul 22, 2024 at 01:47:29PM -0500, Andrew Jones wrote:
> On Fri, Jul 19, 2024 at 09:19:07AM GMT, Charlie Jenkins wrote:
> > Overhaul the riscv vector tests to use kselftest_harness to help the
> > test cases correctly report the results and decouple the individual test
> > cases from each other. With this refactoring, only run the test cases is
> > vector is reported and properly report the test case as skipped
> > otherwise. The v_initval_nolibc test was previously not checking if
> > vector was supported and used a function (malloc) which invalidates
> > the state of the vector registers.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  tools/testing/selftests/riscv/abi/ptrace           | Bin 0 -> 759368 bytes
> >  tools/testing/selftests/riscv/vector/.gitignore    |   3 +-
> >  tools/testing/selftests/riscv/vector/Makefile      |  17 +-
> >  .../selftests/riscv/vector/v_exec_initval_nolibc.c |  84 +++++++
> >  tools/testing/selftests/riscv/vector/v_helpers.c   |  56 +++++
> >  tools/testing/selftests/riscv/vector/v_helpers.h   |   5 +
> >  tools/testing/selftests/riscv/vector/v_initval.c   |  16 ++
> >  .../selftests/riscv/vector/v_initval_nolibc.c      |  68 ------
> >  .../testing/selftests/riscv/vector/vstate_prctl.c  | 266 ++++++++++++---------
> >  9 files changed, 324 insertions(+), 191 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/riscv/abi/ptrace b/tools/testing/selftests/riscv/abi/ptrace
> > new file mode 100755
> > index 000000000000..2b03e77b4dcf
> > Binary files /dev/null and b/tools/testing/selftests/riscv/abi/ptrace differ
> > diff --git a/tools/testing/selftests/riscv/vector/.gitignore b/tools/testing/selftests/riscv/vector/.gitignore
> > index 9ae7964491d5..7d9c87cd0649 100644
> > --- a/tools/testing/selftests/riscv/vector/.gitignore
> > +++ b/tools/testing/selftests/riscv/vector/.gitignore
> > @@ -1,3 +1,4 @@
> >  vstate_exec_nolibc
> >  vstate_prctl
> > -v_initval_nolibc
> > +v_initval
> > +v_exec_initval_nolibc
> > diff --git a/tools/testing/selftests/riscv/vector/Makefile b/tools/testing/selftests/riscv/vector/Makefile
> > index bfff0ff4f3be..995746359477 100644
> > --- a/tools/testing/selftests/riscv/vector/Makefile
> > +++ b/tools/testing/selftests/riscv/vector/Makefile
> > @@ -2,18 +2,27 @@
> >  # Copyright (C) 2021 ARM Limited
> >  # Originally tools/testing/arm64/abi/Makefile
> >  
> > -TEST_GEN_PROGS := vstate_prctl v_initval_nolibc
> > -TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc
> > +TEST_GEN_PROGS := v_initval vstate_prctl
> > +TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc v_exec_initval_nolibc sys_hwprobe.o v_helpers.o
> >  
> >  include ../../lib.mk
> >  
> > -$(OUTPUT)/vstate_prctl: vstate_prctl.c ../hwprobe/sys_hwprobe.S
> > +$(OUTPUT)/sys_hwprobe.o: ../hwprobe/sys_hwprobe.S
> > +	$(CC) -static -c -o$@ $(CFLAGS) $^
> > +
> > +$(OUTPUT)/v_helpers.o: v_helpers.c
> > +	$(CC) -static -c -o$@ $(CFLAGS) $^
> > +
> > +$(OUTPUT)/vstate_prctl: vstate_prctl.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
> >  	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> >  
> >  $(OUTPUT)/vstate_exec_nolibc: vstate_exec_nolibc.c
> >  	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
> >  		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
> >  
> > -$(OUTPUT)/v_initval_nolibc: v_initval_nolibc.c
> > +$(OUTPUT)/v_initval: v_initval.c $(OUTPUT)/sys_hwprobe.o $(OUTPUT)/v_helpers.o
> > +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> > +
> > +$(OUTPUT)/v_exec_initval_nolibc: v_exec_initval_nolibc.c
> >  	$(CC) -nostdlib -static -include ../../../../include/nolibc/nolibc.h \
> >  		-Wall $(CFLAGS) $(LDFLAGS) $^ -o $@ -lgcc
> > diff --git a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> > new file mode 100644
> > index 000000000000..74b13806baf0
> > --- /dev/null
> > +++ b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> > @@ -0,0 +1,84 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Get values of vector registers as soon as the program starts to test if
> > + * is properly cleaning the values before starting a new program. Vector
> > + * registers are caller saved, so no function calls may happen before reading
> > + * the values. To further ensure consistency, this file is compiled without
> > + * libc and without auto-vectorization.
> > + *
> > + * To be "clean" all values must be either all ones or all zeroes.
> > + */
> > +
> > +#define __stringify_1(x...)	#x
> > +#define __stringify(x...)	__stringify_1(x)
> > +
> > +int main(int argc, char **argv)
> > +{
> > +	char prev_value = 0, value;
> > +	unsigned long vl;
> > +	int first = 1;
> > +
> > +	asm volatile (
> > +		".option push\n\t"
> > +		".option arch, +v\n\t"
> > +		"vsetvli	%[vl], x0, e8, m1, ta, ma\n\t"
> > +		".option pop\n\t"
> > +		: [vl] "=r" (vl)
> > +	);
> > +
> > +#define CHECK_VECTOR_REGISTER(register) ({					\
> > +	for (int i = 0; i < vl; i++) {						\
> > +		asm volatile (							\
> > +			".option push\n\t"					\
> > +			".option arch, +v\n\t"					\
> > +			"vmv.x.s %0, " __stringify(register) "\n\t"		\
> > +			"vsrl.vi " __stringify(register) ", " __stringify(register) ", 8\n\t" \
> > +			".option pop\n\t"					\
> > +			: "=r" (value));					\
> > +		if (first) {							\
> > +			first = 0;						\
> > +		} else if (value != prev_value || !(value == 0x00 || value == 0xff)) { \
> > +			printf("Register " __stringify(register) " values not clean! value: %u\n", value);	\
> > +			exit(-1);						\
> 
> I think we should ensure all tests in tools/testing/selftests/riscv/ use
> TAP output, exiting with ksft_finished(), or at least exit with 0 for
> success. For example, vstate_exec_nolibc exits with 2 for success since
> it exits with the return value of prctl(PR_RISCV_V_GET_CONTROL). And
> vstate_prctl.c exits with several different negative values, which means
> it'll exit with several different values around 255. To figure what went
> wrong, one will have to convert those exit codes to the original negative
> values in order to look them up. Having these types of inconsistent exit
> values complicates QA.
> 
> Thanks,
> drew

I do not follow. I am using the kselftest_harness
(tools/testing/selftests/kselftest_harness.h) that does output using the
TAP format. vstate_exec_nolibc is not a test in itself but is a helper.
The Makefile for the vector tests describes this as:

TEST_GEN_PROGS := v_initval vstate_prctl

If you run the riscv collection of tests with:

$ ./run_kselftest.sh --collection riscv

You will see that the only vector test cases are v_initval and
vstate_prctl, which both output as expected in TAP format.

I do see that I messed up the return type of the is_vector_supported()
function, I had meant to change that to a bool from an int since
RISCV_HWPROBE_EXT_ZVE32X is greater than 32 bits. I will send a new
version.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
