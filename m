Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A956AC25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 16:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=2WQwYqhS1WwjsWczNbCRyrv/EZBP0B1tKDd3XwWECZY=; b=WcNXyXt5J3hdpL+YX8eNShZiEm
	x/gl85Rk/XexMVxW7Mo4cwHnh+ys00RkdCUaz7vhOFxE7ehKu1eEkvtKNg2aUdputqcnywwKzBCX3
	vdy009Y/KtDJ+WCNwKzDFMAsOdFsa7vr3w8W+JimumKmyAI7vFSnntX5IuhG4hlDn7YeG93ZlvUyQ
	dFwa2EGGMZh/TLihAKaeFXQa1kdNKC/VccQD4ZClL6YoQ3nUOh9EP1p3pIVS0hJ20mYrNPOaRycI/
	xilhEqjmyuIZh1PNnaYiOiuTMfQiLw1sVGN3haHbnzpjbN0UnZnIMyH7OdyeYiP+WMOcXxeuCPJ2f
	rn7DlakA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9p14-00000003YWh-23b3;
	Wed, 22 May 2024 16:40:38 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9p0z-00000003YVl-1bUK
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 16:40:36 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1f335e8d493so1597365ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 09:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1716396032; x=1717000832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nh2hEBp7C+i2NTaEC7uyemcMKD8WTFnEb/ThoPY8mY0=;
        b=fZB5IeMtzuBlNzyk6o+j8GgdK4UbtyWZLSpfEsb5wSbAQe4hnW1koRBne8gkuHfuSz
         2nTcrC1ZgJY9jVcSNwOxu4MLLhhLAoNS+8ZC2pJfpC1cqNbelQPztH5B6Jk5gsXSg/xY
         NLGp9lxix21SuthL3zCS5yh+KYwLuEe0CUSMSoFyPbk5uB8+URqIAGqnMfzWReURzLiA
         rbpEI8b08syfe2Xj2/nY/1xAptqL5Ls1th3C4gI8HBmRGkmU1mvNdFiIqFoYFG24ELU+
         WB/AlOYbZb7pZJZZAc+gHGhb/aBySlkb7jC5Y/sm/txcQh5OFP7gSymNNRKPC7+1bNjQ
         yTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716396032; x=1717000832;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nh2hEBp7C+i2NTaEC7uyemcMKD8WTFnEb/ThoPY8mY0=;
        b=kp65NHmXKAYt0QZsSJoRdqnG33o6ma6BklmSKvJz9qCrt7OrPQz5cVMXAz6wCFGK3+
         A0hBnK+iKo+pdz65AUH8R8L1RZGb1tlo6p8JzgSoc8Tix2uYq6J6oeXTRFV3x10LYZwx
         q04GIV1ICvUDzsaSndnJhfXCskFdzA6ebKTSlQFMy4NT8u1b4o8G2qRx+Fh/YkR0mqbd
         d5SnekZsZkmcMnS0m8wFZNGwfU9CQW1+l4bTP5U4NdKqaquT9petoB6fxJ6ZfM01kg5W
         5CFOuaZOJ5CAWpJcoUzO/bJq+4lA3Q0MCdvzQBbxjZ2k+p91HTB5N9c/q19IXrx7Et33
         jAwA==
X-Forwarded-Encrypted: i=1; AJvYcCXbgzlAtKLHVoF8J3AOPKp2HN4YdRw6gP4w0qXD57vSBR1MZpiZTBx0szQgtVcQMTDrEuYp0OoSgJE4wbLvPcuhH9P5TGDIoPsWEE+q1BlR
X-Gm-Message-State: AOJu0Ywt9MTmeieGa/FBShdLP4AMJTpaHoadZbzWxsq60ENO/5cIm0c/
	/8tm5y+GHSn+H5kKPk+8e9nfFmcDSvjsKZjiRlc7aOIeLOEm/z042cLfol/Zo/w=
X-Google-Smtp-Source: AGHT+IHTgDEZ1Rdi9Tw0QmvSjoSsko/OAJhdhHxBLtqT7rpxgRJiixbvhXF7RsPN5V9wFt21tEw6+Q==
X-Received: by 2002:a17:902:9895:b0:1f2:efdf:a410 with SMTP id d9443c01a7336-1f31c97be08mr23788185ad.15.1716396031849;
        Wed, 22 May 2024 09:40:31 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bad7eb8sm241308015ad.90.2024.05.22.09.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 09:40:31 -0700 (PDT)
Date: Wed, 22 May 2024 09:40:31 -0700 (PDT)
X-Google-Original-Date: Wed, 22 May 2024 09:40:20 PDT (-0700)
Subject: Re: [PATCH] riscv: selftests: Add signal handling vector tests
In-Reply-To: <20240403-vector_sigreturn_tests-v1-1-2e68b7a3b8d7@rivosinc.com>
CC: shuah@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, andy.chiu@sifive.com, bjorn@kernel.org, Vineet Gupta <vineetg@rivosinc.com>,
  linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
  Charlie Jenkins <charlie@rivosinc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Message-ID: <mhng-50849ea8-b103-43af-aef4-073aff99ae61@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_094035_091540_1CAE4A81 
X-CRM114-Status: GOOD (  30.12  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 03 Apr 2024 16:50:29 PDT (-0700), Charlie Jenkins wrote:
> Add two tests to check vector save/restore when a signal is received
> during a vector routine. One test ensures that a value is not clobbered
> during signal handling. The other verifies that vector registers
> modified in the signal handler are properly reflected when the signal
> handling is complete.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
> These tests came about to highlight the bug fixed in
> https://lore.kernel.org/lkml/20240403072638.567446-1-bjorn@kernel.org/
> and will only pass with that fix applied.

Thaks.  I'm just staging this, I have a testcase too that I keep 
forgetting to post because I haven't gotten in into the selftests sanely 
yet...

    #include "../../kselftest.h"
    #include <signal.h>
    #include <stdlib.h>
    #include <asm/ptrace.h>
    #include <stdint.h>
    
    #define ITERATIONS     (1 << 24)
    #define RISCV_V_MAGIC  0x53465457
    
    struct __riscv_ctx_hdr {
            __u32 magic;
            __u32 size;
    };
    
    struct __riscv_extra_ext_header {
            __u32 __padding[129] __attribute__((aligned(16)));
            /*
             * Reserved for expansion of sigcontext structure.  Currently zeroed
             * upon signal, and must be zero upon sigreturn.
             */
            __u32 reserved;
            struct __riscv_ctx_hdr hdr;
    };
    
    
    struct __riscv_v_ext_state {
            unsigned long vstart;
            unsigned long vl;
            unsigned long vtype;
            unsigned long vcsr;
            unsigned long vlenb;
            void *datap;
            /*
             * In signal handler, datap will be set a correct user stack offset
             * and vector registers will be copied to the address of datap
             * pointer.
             */
    };
    
    /* The beginning of the actual state. */
    int count;
    
    void handler(int, siginfo_t *si, void *ucontext_void)
    {
    	ucontext_t *ucontext = ucontext_void;
    
    	/* Skip over the SEGV by just jumping to a0. */
    	ucontext->uc_mcontext.__gregs[REG_PC] = ucontext->uc_mcontext.__gregs[REG_A0];
    
    	/* Increment the first element of v0. */
    	{
    		struct __riscv_extra_ext_header *ext;
    		struct __riscv_v_ext_state *v_ext_state;
    		uint32_t val;
    
    		/* Find the vector context. */
    		ext = (void *)(&ucontext->uc_mcontext.__fpregs);
    		if (ext->hdr.magic != RISCV_V_MAGIC) {
    			fprintf(stderr, "bad vector magic: %x\n", ext->hdr.magic);
    			abort();
    		}
    
    		v_ext_state = (void *)((char *)(ext) + sizeof(*ext));
    
    		/* Actually do the increment. */
    		memcpy(&val, v_ext_state->datap, sizeof(val));
    		val++;
    		memcpy(v_ext_state->datap, &val, sizeof(val));
    	}
    
    	/* Count the delivered signal, to make sure we don't miss any. */
    	count++;
    }
    
    void sigill(int, siginfo_t *si, void *ucontext_void)
    {
    	fprintf(stderr, "SIGILL after %d iterations\n", count);
    	abort();
    }
    
    void check_signal(void)
    {
    	int check = rand();
    	int out;
    
    	__asm__ volatile (
    		"vsetvli a0, %2, e32, ta, ma\n\t"
    		"vmv.s.x v0, %1\n\t"
    		"la a0, 1f\n\t"
    		"lw t0, 0(x0)\n\t"
    		"1:\n\t"
    		"vmv.x.s %0, v0"
    		: "=&r"(out)
    		: "r"(check-1), "r"(1)
    		: "a0"
    #ifdef __riscv_vector
    		  , "v0"
    #endif
    	);
    
    	if (out != check) {
    		fprintf(stderr, "out: %d\ncheck: %d\n", out, check);
    		abort();
    	}
    }
    
    int main(void)
    {
    	struct sigaction sa_segv, sa_ill;
    
    	memset(&sa_segv, 0, sizeof(sa_segv));
    	sa_segv.sa_sigaction = &handler;
    	sa_segv.sa_flags     = SA_SIGINFO;
    	sigaction(SIGSEGV, &sa_segv, NULL);
    
    	memset(&sa_ill, 0, sizeof(sa_ill));
    	sa_ill.sa_sigaction = &sigill;
    	sa_ill.sa_flags     = SA_SIGINFO;
    	sigaction(SIGILL, &sa_ill, NULL);
    
    	count = 0;
    	for (int i = 0; i < ITERATIONS; ++i)
    		check_signal();
    
    	if (count != ITERATIONS) {
    		fprintf(stderr, "count: %d\n", count);
    		abort();
    	}
    
    	return 0;
    }

> ---
>  tools/testing/selftests/riscv/Makefile             |  2 +-
>  tools/testing/selftests/riscv/sigreturn/.gitignore |  1 +
>  tools/testing/selftests/riscv/sigreturn/Makefile   | 12 ++++
>  .../testing/selftests/riscv/sigreturn/sigreturn.c  | 82 ++++++++++++++++++++++
>  4 files changed, 96 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/riscv/Makefile b/tools/testing/selftests/riscv/Makefile
> index 4a9ff515a3a0..7ce03d832b64 100644
> --- a/tools/testing/selftests/riscv/Makefile
> +++ b/tools/testing/selftests/riscv/Makefile
> @@ -5,7 +5,7 @@
>  ARCH ?= $(shell uname -m 2>/dev/null || echo not)
>
>  ifneq (,$(filter $(ARCH),riscv))
> -RISCV_SUBTARGETS ?= hwprobe vector mm
> +RISCV_SUBTARGETS ?= hwprobe vector mm sigreturn
>  else
>  RISCV_SUBTARGETS :=
>  endif
> diff --git a/tools/testing/selftests/riscv/sigreturn/.gitignore b/tools/testing/selftests/riscv/sigreturn/.gitignore
> new file mode 100644
> index 000000000000..35002b8ae780
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/sigreturn/.gitignore
> @@ -0,0 +1 @@
> +sigreturn
> diff --git a/tools/testing/selftests/riscv/sigreturn/Makefile b/tools/testing/selftests/riscv/sigreturn/Makefile
> new file mode 100644
> index 000000000000..eb8bac9279a8
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/sigreturn/Makefile
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (C) 2021 ARM Limited
> +# Originally tools/testing/arm64/abi/Makefile
> +
> +CFLAGS += -I$(top_srcdir)/tools/include
> +
> +TEST_GEN_PROGS := sigreturn
> +
> +include ../../lib.mk
> +
> +$(OUTPUT)/sigreturn: sigreturn.c
> +	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> diff --git a/tools/testing/selftests/riscv/sigreturn/sigreturn.c b/tools/testing/selftests/riscv/sigreturn/sigreturn.c
> new file mode 100644
> index 000000000000..62397d5934f1
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/sigreturn/sigreturn.c
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <signal.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <ucontext.h>
> +#include <linux/ptrace.h>
> +#include "../../kselftest_harness.h"
> +
> +#define RISCV_V_MAGIC		0x53465457
> +#define DEFAULT_VALUE		2
> +#define SIGNAL_HANDLER_OVERRIDE	3
> +
> +static void simple_handle(int sig_no, siginfo_t *info, void *vcontext)
> +{
> +	ucontext_t *context = vcontext;
> +
> +	context->uc_mcontext.__gregs[REG_PC] = context->uc_mcontext.__gregs[REG_PC] + 4;
> +}
> +
> +static void vector_override(int sig_no, siginfo_t *info, void *vcontext)
> +{
> +	ucontext_t *context = vcontext;
> +
> +	// vector state
> +	struct __riscv_extra_ext_header *ext;
> +	struct __riscv_v_ext_state *v_ext_state;
> +
> +	/* Find the vector context. */
> +	ext = (void *)(&context->uc_mcontext.__fpregs);
> +	if (ext->hdr.magic != RISCV_V_MAGIC) {
> +		fprintf(stderr, "bad vector magic: %x\n", ext->hdr.magic);
> +		abort();
> +	}
> +
> +	v_ext_state = (void *)((char *)(ext) + sizeof(*ext));
> +
> +	*(int *)v_ext_state->datap = SIGNAL_HANDLER_OVERRIDE;
> +
> +	context->uc_mcontext.__gregs[REG_PC] = context->uc_mcontext.__gregs[REG_PC] + 4;
> +}
> +
> +static int vector_sigreturn(int data, void (*handler)(int, siginfo_t *, void *))
> +{
> +	int after_sigreturn;
> +	struct sigaction sig_action = {
> +		.sa_sigaction = handler,
> +		.sa_flags = SA_SIGINFO
> +	};
> +
> +	sigaction(SIGSEGV, &sig_action, 0);
> +
> +	asm(".option push				\n\
> +		.option		arch, +v		\n\
> +		vsetivli	x0, 1, e32, ta, ma	\n\
> +		vmv.s.x		v0, %1			\n\
> +		# Generate SIGSEGV			\n\
> +		lw		a0, 0(x0)		\n\
> +		vmv.x.s		%0, v0			\n\
> +		.option pop" : "=r" (after_sigreturn) : "r" (data));
> +
> +	return after_sigreturn;
> +}
> +
> +TEST(vector_restore)
> +{
> +	int result;
> +
> +	result = vector_sigreturn(DEFAULT_VALUE, &simple_handle);
> +
> +	EXPECT_EQ(DEFAULT_VALUE, result);
> +}
> +
> +TEST(vector_restore_signal_handler_override)
> +{
> +	int result;
> +
> +	result = vector_sigreturn(DEFAULT_VALUE, &vector_override);
> +
> +	EXPECT_EQ(SIGNAL_HANDLER_OVERRIDE, result);
> +}
> +
> +TEST_HARNESS_MAIN
>
> ---
> base-commit: 4cece764965020c22cff7665b18a012006359095
> change-id: 20240403-vector_sigreturn_tests-8118f0ac54fa

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
