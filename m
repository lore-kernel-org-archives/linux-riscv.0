Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DC9CD1288
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 00:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T8kXepli+pXFBDD/53eCb+rbk39dSI2gOcZzq8gSqEQ=; b=TP1o/dB1ey+trM
	7uAcqGvtLJg5764lIolPvLlTlPqbVye01wv7oWI7p31RX6EjAo4fS1i4W4WUREAlun/9GO6zFp4kV
	6DPU6wMYYQg6QcLlNtrWkpk8zAvIJ/xks9FCJz7HlsOd8wZmS1G7iAVajO5uu3c3vh2rkZFsZ27Wy
	x1rtipBHgyyk0mNYEt7D+00U9mSTShMcUI12kqriYloy5FP9UHGbyEOGzJd4FEWct+H0L6j6WaKJA
	LvfX6SsBwn5q1KEiTSlzBZsZrqCxBXmDE/1XdeYEwqFB/xIHXYwivMems1p/kwcTUEX7w7z1/3L23
	Yoe2FCyjUENQjXBCLsww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsBCv-00000000nif-3UBC;
	Thu, 04 Apr 2024 00:43:57 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsBCs-00000000nhJ-1LlE
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 00:43:56 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1e0f3052145so3873955ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 17:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712191433; x=1712796233; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NPAkNpwkOcE2aj5H76UIs4DtdZThjvuKeLHUXLWOipM=;
        b=nBFDPw6R/Df7zPc7UFIMmB3QQr7hB1W0Z9fEZhQxZNzz4L3meLi6oiBHqfiTd7mFZD
         kksauhNDQVXf7UkYvC9tKr9wt9YpZYJE+WwbRDwcVsMgE4uePrwUJu5NxOQKMY8EFmHy
         Tdm7CE0gj6vfd99TdtjhvEOb3b0n8KTCOaB2CgonmGVx/nOV2GsCy60PjC2U0tJHgPEb
         4Hl5vxGSoOjZkDSuoqxoOEimd5vJIZk1Vez2lsK8SrCAKFh5Y3jbqmH281prnsb0Kh1I
         Ayg9tdAQ4ORgF+D9Du5aeZcgJa1t2MBx2sVAi7k8tr4Iwepe27hqMoLVmRXpJOzBfxgg
         UlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712191433; x=1712796233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPAkNpwkOcE2aj5H76UIs4DtdZThjvuKeLHUXLWOipM=;
        b=l7AMADyS2ZEoAJ4pYizpDL162Wb/wnkPZF9lcfaw0G1WR10jQ98b/jbHyi3+9HUQCd
         +zbhgovct/zoTDiCCxR4LvWTxiXA9hWoeMscvZhEZKf9PWdpsYMUW/pGt51RNvz5o0aE
         pAduP9B1xgqrDipOEldn3NUPuFxjWyNfikMi69lsZeeMWyh3UAYFIqkcY9K1sPc70GhN
         +dwE3zAZqWZKOSYoCXSrzqNMXOj076ryI7kK/aaLimVNeI9c9sh9mHni2VAHDEQkg61v
         bxT00sIg+7GnvFzwZt94+1rbDKVGFExnHn7XInnUMRyCcn2ZARXMV7CFynZE7VfLwaig
         KePw==
X-Forwarded-Encrypted: i=1; AJvYcCWMii4acbaN1x8/08kYCxMDNRuFUU2xeotWtblX0AqJJK3xWIITf6hmATqx0QNwQtuw6as8uRYmor9EsVRUuv/gSBp+bv/FwZ4FcTCagbO6
X-Gm-Message-State: AOJu0YyYyWzCudchYAPDwfuiPSql4rOQaCIlKOC36CxGESWsiv8UiuWc
	fZ92a+TgRDuoinyLUwof6G8gjEJ4H+kd4UBbceUsBDuolT6MXzM4gYXYlFKZVTo=
X-Google-Smtp-Source: AGHT+IHnuXNye/1qJaXWs5vSMSc0DTbHIYysP8Hv++UrbD3hU/8w6vGpoI5sVVOGEgQrqnzTMEj70w==
X-Received: by 2002:a17:90a:8d01:b0:2a2:b5db:79cf with SMTP id c1-20020a17090a8d0100b002a2b5db79cfmr1155132pjo.21.1712191433057;
        Wed, 03 Apr 2024 17:43:53 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:b005:9197:83df:91f1])
        by smtp.gmail.com with ESMTPSA id t15-20020a17090a0d0f00b002a24886fa5asm358052pja.36.2024.04.03.17.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 17:43:52 -0700 (PDT)
Date: Wed, 3 Apr 2024 17:43:50 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andy.chiu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: selftests: Add signal handling vector tests
Message-ID: <Zg33xhwOe6Zwi23A@ghost>
References: <20240403-vector_sigreturn_tests-v1-1-2e68b7a3b8d7@rivosinc.com>
 <56863fe7-4d82-4f37-a518-2acf368c3ea6@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56863fe7-4d82-4f37-a518-2acf368c3ea6@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_174354_614740_9B82C1BD 
X-CRM114-Status: GOOD (  32.96  )
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

On Wed, Apr 03, 2024 at 05:27:23PM -0700, Vineet Gupta wrote:
> On 4/3/24 16:50, Charlie Jenkins wrote:
> > Add two tests to check vector save/restore when a signal is received
> > during a vector routine. One test ensures that a value is not clobbered
> > during signal handling. The other verifies that vector registers
> > modified in the signal handler are properly reflected when the signal
> > handling is complete.
> 
> Hmm, isn't this testing two contradictory things ?
> 
> We do want V regs to be not clobbered across a handled signal, o/w V
> enabled code would just not work at all.
> That implies that anything done by signal handler should just be
> discarded - no ?
> 
> Am I missing something.
> 
> -Vineet

This is referring to the user-implemented signal handler. The test in
question is testing the ability of the user-implemented signal handler
to be able to modify the vector registers. In the test:

static void vector_override(int sig_no, siginfo_t *info, void *vcontext)
{ ...

	*(int *)v_ext_state->datap = SIGNAL_HANDLER_OVERRIDE;

	...  }

This line is changing the saved state of the user program's vector
registers.

When the signal handling concludes and the original user program resumes
execution, the content of the user-context registers that were modified
by the signal handler should be restored into the hardware registers.
Hence the test case checks that the v0 register contains the value
SIGNAL_HANDLER_OVERRIDE.

EXPECT_EQ(SIGNAL_HANDLER_OVERRIDE, result);

- Charlie

> 
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> > These tests came about to highlight the bug fixed in
> > https://lore.kernel.org/lkml/20240403072638.567446-1-bjorn@kernel.org/
> > and will only pass with that fix applied.
> > ---
> >  tools/testing/selftests/riscv/Makefile             |  2 +-
> >  tools/testing/selftests/riscv/sigreturn/.gitignore |  1 +
> >  tools/testing/selftests/riscv/sigreturn/Makefile   | 12 ++++
> >  .../testing/selftests/riscv/sigreturn/sigreturn.c  | 82 ++++++++++++++++++++++
> >  4 files changed, 96 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/testing/selftests/riscv/Makefile b/tools/testing/selftests/riscv/Makefile
> > index 4a9ff515a3a0..7ce03d832b64 100644
> > --- a/tools/testing/selftests/riscv/Makefile
> > +++ b/tools/testing/selftests/riscv/Makefile
> > @@ -5,7 +5,7 @@
> >  ARCH ?= $(shell uname -m 2>/dev/null || echo not)
> >  
> >  ifneq (,$(filter $(ARCH),riscv))
> > -RISCV_SUBTARGETS ?= hwprobe vector mm
> > +RISCV_SUBTARGETS ?= hwprobe vector mm sigreturn
> >  else
> >  RISCV_SUBTARGETS :=
> >  endif
> > diff --git a/tools/testing/selftests/riscv/sigreturn/.gitignore b/tools/testing/selftests/riscv/sigreturn/.gitignore
> > new file mode 100644
> > index 000000000000..35002b8ae780
> > --- /dev/null
> > +++ b/tools/testing/selftests/riscv/sigreturn/.gitignore
> > @@ -0,0 +1 @@
> > +sigreturn
> > diff --git a/tools/testing/selftests/riscv/sigreturn/Makefile b/tools/testing/selftests/riscv/sigreturn/Makefile
> > new file mode 100644
> > index 000000000000..eb8bac9279a8
> > --- /dev/null
> > +++ b/tools/testing/selftests/riscv/sigreturn/Makefile
> > @@ -0,0 +1,12 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +# Copyright (C) 2021 ARM Limited
> > +# Originally tools/testing/arm64/abi/Makefile
> > +
> > +CFLAGS += -I$(top_srcdir)/tools/include
> > +
> > +TEST_GEN_PROGS := sigreturn
> > +
> > +include ../../lib.mk
> > +
> > +$(OUTPUT)/sigreturn: sigreturn.c
> > +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> > diff --git a/tools/testing/selftests/riscv/sigreturn/sigreturn.c b/tools/testing/selftests/riscv/sigreturn/sigreturn.c
> > new file mode 100644
> > index 000000000000..62397d5934f1
> > --- /dev/null
> > +++ b/tools/testing/selftests/riscv/sigreturn/sigreturn.c
> > @@ -0,0 +1,82 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +#include <signal.h>
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <ucontext.h>
> > +#include <linux/ptrace.h>
> > +#include "../../kselftest_harness.h"
> > +
> > +#define RISCV_V_MAGIC		0x53465457
> > +#define DEFAULT_VALUE		2
> > +#define SIGNAL_HANDLER_OVERRIDE	3
> > +
> > +static void simple_handle(int sig_no, siginfo_t *info, void *vcontext)
> > +{
> > +	ucontext_t *context = vcontext;
> > +
> > +	context->uc_mcontext.__gregs[REG_PC] = context->uc_mcontext.__gregs[REG_PC] + 4;
> > +}
> > +
> > +static void vector_override(int sig_no, siginfo_t *info, void *vcontext)
> > +{
> > +	ucontext_t *context = vcontext;
> > +
> > +	// vector state
> > +	struct __riscv_extra_ext_header *ext;
> > +	struct __riscv_v_ext_state *v_ext_state;
> > +
> > +	/* Find the vector context. */
> > +	ext = (void *)(&context->uc_mcontext.__fpregs);
> > +	if (ext->hdr.magic != RISCV_V_MAGIC) {
> > +		fprintf(stderr, "bad vector magic: %x\n", ext->hdr.magic);
> > +		abort();
> > +	}
> > +
> > +	v_ext_state = (void *)((char *)(ext) + sizeof(*ext));
> > +
> > +	*(int *)v_ext_state->datap = SIGNAL_HANDLER_OVERRIDE;
> > +
> > +	context->uc_mcontext.__gregs[REG_PC] = context->uc_mcontext.__gregs[REG_PC] + 4;
> > +}
> > +
> > +static int vector_sigreturn(int data, void (*handler)(int, siginfo_t *, void *))
> > +{
> > +	int after_sigreturn;
> > +	struct sigaction sig_action = {
> > +		.sa_sigaction = handler,
> > +		.sa_flags = SA_SIGINFO
> > +	};
> > +
> > +	sigaction(SIGSEGV, &sig_action, 0);
> > +
> > +	asm(".option push				\n\
> > +		.option		arch, +v		\n\
> > +		vsetivli	x0, 1, e32, ta, ma	\n\
> > +		vmv.s.x		v0, %1			\n\
> > +		# Generate SIGSEGV			\n\
> > +		lw		a0, 0(x0)		\n\
> > +		vmv.x.s		%0, v0			\n\
> > +		.option pop" : "=r" (after_sigreturn) : "r" (data));
> > +
> > +	return after_sigreturn;
> > +}
> > +
> > +TEST(vector_restore)
> > +{
> > +	int result;
> > +
> > +	result = vector_sigreturn(DEFAULT_VALUE, &simple_handle);
> > +
> > +	EXPECT_EQ(DEFAULT_VALUE, result);
> > +}
> > +
> > +TEST(vector_restore_signal_handler_override)
> > +{
> > +	int result;
> > +
> > +	result = vector_sigreturn(DEFAULT_VALUE, &vector_override);
> > +
> > +	EXPECT_EQ(SIGNAL_HANDLER_OVERRIDE, result);
> > +}
> > +
> > +TEST_HARNESS_MAIN
> >
> > ---
> > base-commit: 4cece764965020c22cff7665b18a012006359095
> > change-id: 20240403-vector_sigreturn_tests-8118f0ac54fa
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
