Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E07CD128A
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 00:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MkelS5TFlanHvnkiT3MGcVYvfKPP73tuO5tYpj4wCKI=; b=jk4rCrnN3cLils
	VAlkQ1jobEWa3Y1gbQKmUqZq79bdfnWCRFZNIk5Uiz+Ug/DDN/qm8kjh9eWqxHSchPdyITpEPHv5M
	yyf/BmntGxz3yGnXSZu/zL8jBbMVOZvqEUP6ErjP6um0P3F8idOdf25WugmZ8z4B7mc4uW1hQlDHQ
	xAbQc8rp32VkrpQNeivVnNHaXqvk82rLapcoqxX8NM5nsmvM5oW2AyCbSMYyygQ1AmkfJXjK+J4f5
	X4aUHlh3mnqSy4iDYXiR12JKweijSwK+1h27VEkJk/S0ky2PDWR32X7yjXVIrbKSVBTPQJrPB9IoJ
	uSuBwy3V36cRlzTBQlDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAwz-00000000lbT-217S;
	Thu, 04 Apr 2024 00:27:29 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAwx-00000000lZz-0VqM
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 00:27:29 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6e6ca2ac094so422623b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 17:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712190445; x=1712795245; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ulNjjnGHacupkL1wK4ADZTn/tTEYJEcOSwDzhvF8wnk=;
        b=B5R4vgf2WyjGZDSV+3z40FOCoFZ4hB8JXiZyNdmu7AL/PK4YJKkC2egEjJEmf9UzE9
         6dT9s/C55NFYGdsLuv02AaiSulB7zPy1N4EfrTuFWxLoTCLNpwivzVRiUrudhijD9cz3
         BpX4B/rVo2CGS8JLTPT1CZUmuW1aqBXPbokFJxC85iZ7jdXxuokr5PpNCUI0DlGV81+C
         JGjlNzmwE/GBr3iSEZW/jDXNA4HVnQ4u0iK8ROnOWC2eRY+CsTfXSwe7a15P7SVF9iTv
         zkkq2JVoeTBK6mLoytHz0WoNYPC0iabLGXJqT2kHfSvrQu17tm4sbjY0rc8kBj3qZ7hD
         eOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712190445; x=1712795245;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ulNjjnGHacupkL1wK4ADZTn/tTEYJEcOSwDzhvF8wnk=;
        b=GKQU64XJb2bVCSzodGQybAfHNuA7FxH2MsSnQHr3fNIrXYI5aEzbTSS1IBHrZPnYGv
         HQjBDeEmeZ3Z73JnIe0jBHexXQMnFJDDL7bgcC6qUWbV4dla+jBJZ6G8XYT+XniAi/XG
         73E1mHDEGTZok0Zdt040EFX1cCJIRISLvpt4k9pAf4mreW6HG6PGyDsFU5UVk1dNgKOw
         BEku5CpDPEHzsahs0Tb7KiKrg4p8vJJZS2olRekaXqvJ4VgZTZllMuq89ecfBs+r3Nei
         1zUtCsF02IudtH8LEBIwcKb5CGI9CgxOnbuXC4IEw+gOyn+chaAnEnLEyDglLZm6i7FD
         pjiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnuEgWCi2gUILiPyJXkv52uNh5Z5JmBtVlPIZu6RkQog36nwz/P2lQI5tkIIwq6GGkGAvBD5qIasODxg3DE6c6+zEZir2ilufGoiJBn46J
X-Gm-Message-State: AOJu0YwtrUdLSbg7h/S+jifDhsRZU/eyobA6jhceO8/l/EcQi8JcQcvO
	7K0Qq5rtNenps+TN68Lrnl8pv7Uoi9fUNaJKBY/j8/FYS1ZxpqlcvbmZGS89Ews=
X-Google-Smtp-Source: AGHT+IFHYuFf4798AwOR1iHBDx2IxXYtUAW7d845lRV4JHj0meMCcPt6hv0exjv65S7XmTxWfZPjqg==
X-Received: by 2002:a05:6a00:908d:b0:6ea:d10d:c96d with SMTP id jo13-20020a056a00908d00b006ead10dc96dmr1366514pfb.19.1712190445206;
        Wed, 03 Apr 2024 17:27:25 -0700 (PDT)
Received: from [10.0.16.165] ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id j15-20020aa7928f000000b006ea7d877191sm12440141pfa.2.2024.04.03.17.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 17:27:24 -0700 (PDT)
Message-ID: <56863fe7-4d82-4f37-a518-2acf368c3ea6@rivosinc.com>
Date: Wed, 3 Apr 2024 17:27:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: selftests: Add signal handling vector tests
To: Charlie Jenkins <charlie@rivosinc.com>, Shuah Khan <shuah@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andy Chiu <andy.chiu@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20240403-vector_sigreturn_tests-v1-1-2e68b7a3b8d7@rivosinc.com>
Content-Language: en-US
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <20240403-vector_sigreturn_tests-v1-1-2e68b7a3b8d7@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_172727_273134_AF35F1ED 
X-CRM114-Status: GOOD (  23.92  )
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

On 4/3/24 16:50, Charlie Jenkins wrote:
> Add two tests to check vector save/restore when a signal is received
> during a vector routine. One test ensures that a value is not clobbered
> during signal handling. The other verifies that vector registers
> modified in the signal handler are properly reflected when the signal
> handling is complete.

Hmm, isn't this testing two contradictory things ?

We do want V regs to be not clobbered across a handled signal, o/w V
enabled code would just not work at all.
That implies that anything done by signal handler should just be
discarded - no ?

Am I missing something.

-Vineet

>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
> These tests came about to highlight the bug fixed in
> https://lore.kernel.org/lkml/20240403072638.567446-1-bjorn@kernel.org/
> and will only pass with that fix applied.
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
