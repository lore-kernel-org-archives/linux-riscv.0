Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E28CA0EE0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 05:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CuHfSg6Gk/5bRsG7/CuFv7bU1gxWR4Ng14sAeiQE2ug=; b=vuxW2MwkPoBzcl
	zWbG6wu/bisW2ObdgaBoXhC4rzu539u6pX3A+B6NsQYVm/nSGEP/QdC3srT+s0lrljyr1YDv1xzx3
	IHj8vGsDF2KdRRpjORNy0tBVyrZ8axHx9zthiR8K0ShCF1EPCB7HoNl9kmu5TwUD/cHqQy+vK/Bg9
	5sYmUcLmpdvhmMTp+Sv3spqMpbeGOncMBs3rrULIaWuGyTcZBGw2JNzawdTZJlGgABWkw+w9x15Km
	2AdZ+T8Y6OV7i+MpRl4ynsci3xavX8823Zt0P8EdKrVlWevBFvrYwp6zgzStArNkrHabHSAKvZzC+
	vub5JOKZ9W8KE4tE5SEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umnCz-00000001Xp0-1wEA;
	Fri, 15 Aug 2025 05:42:33 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umnCw-00000001Xoa-16EN
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 05:42:31 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-afcb732eee6so294401666b.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 22:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1755236548; x=1755841348; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ao0nHqySVR1z1mkQWgkIv+zrEyClYUPdZ2AVw92mKw4=;
        b=gw4jXx24wzGJ4o9ivEFNwmHiPvIAurWWxhdLRavgQRs17z5Q6CxJcbIw2ZL/zCLQ21
         +tBFzzioXL7DShMnzelz5WYU1ngMKzgPIX4zKuV1G3ILf8OVHvyVxC/r48Gd2JpcKzLt
         VZSIzZyrpjYsWSru/YZ7Hrpdf0xQsleO6X/OE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755236548; x=1755841348;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ao0nHqySVR1z1mkQWgkIv+zrEyClYUPdZ2AVw92mKw4=;
        b=AKX/CLKGLIbR30kgygLQTQIhu09ZRD7AXZHXVPuNTVR0hfztlOaiDizWth0I0j7Gc+
         PG4Ip9Z2bBpw+id0OTay5Es0T8a5mfuAeHx5nI40JP21nmPaekNrPBPXJwHHNc13Ua4o
         +DU2we0HOGUzVchB5gGp+sGHiBqY6ZeLorVpeDjDNx4E1DhyoGyRgS72aeb97vVuOr8d
         Ify7fqEbQ6PyYDfeIrMMYVq3ebRdXLe3Svu7qpINVbji2NZ+i4vUUIXO84Ay7ck2Zqmp
         sCIfUxvmyDAlDR4e9+nR+fj9JKWCI2P4HlOn7d7Jw9aRQIe2zSpQqZ/KMOukZvqp7jAe
         853Q==
X-Gm-Message-State: AOJu0YxHi3WNb40bRgH1RmM8o/pJpZFLtnYsOtUxJ3/ZLjzu/0LTu9Ff
	4L8Myh63ih0ZYD4O2KDbF/qZEYYvge72r5S4vojcLeqAdXeRA7bYl76nXIwL6c99kwWgj6NqQ8N
	Mdpeg/R5X1VY900TyJsMH2FnUQS5ZHDc=
X-Gm-Gg: ASbGncvZwS+wZuYr6sGrXqnZWM/bF4sKSGYAwCFRKamyMTXMJvjycLWgd1D6OHPfpGb
	mIKzV7DA9yPGIkXhN9BNYITCf89HZqPTgta4VTLO28kn5vuL0/m5Aw/HSFxXRObA2CT3vjwdh9s
	U8z9Rwe+v5Jsu9m0RHnave7aHhC6fVmr33AspBvHn+dKpfK1LKUEKwJyPfxjFdKELhHooRrrNTB
	Ztw1tetqum/2h58REgaIkfhe5n3AHMcX/8=
X-Google-Smtp-Source: AGHT+IHfJpD0Y3cKBjtoKB/TD0jiobIEw7Qext8zDoq1Qo4cR9mUtcGGxBbzZHvlUvY1u2ZejaJkKgOvEKCU+6YsJSs=
X-Received: by 2002:a17:906:6a0e:b0:afc:d209:37f2 with SMTP id
 a640c23a62f3a-afcdc359d12mr55071366b.61.1755236548083; Thu, 14 Aug 2025
 22:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250805193955.798277-1-jesse@rivosinc.com> <20250805193955.798277-9-jesse@rivosinc.com>
In-Reply-To: <20250805193955.798277-9-jesse@rivosinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 15 Aug 2025 15:42:16 +1000
X-Gm-Features: Ac12FXw8XUjBVkZPAHSLVno0uMPz2dM9vKDf4fisVFB6fiah4HK821c7ZHoR6ik
Message-ID: <CACPK8Xd2QfL460LY2T0ia7Akb79fEXKF2+=B27M8q5j7jUoouQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] selftests: riscv: Add test for hardware breakpoints
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_224230_495993_1E843654 
X-CRM114-Status: GOOD (  16.01  )
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

Hi Jesse,

We had a pretty huge cc list on the thread, I've trimmed it right
back. Feel free to add some people back but keep it focused.

On Wed, 6 Aug 2025 at 05:42, Jesse Taube <jesse@rivosinc.com> wrote:
>
> Add riscv specific selftest for hardhardware breakpoints.

nit: double hardware

> These tests are based on:
> tools/testing/selftests/breakpoints/breakpoint_test_arm64.c

The sefltest didn't build for me. There's a few suggested fixes below.

> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
> The selftest fails as register_user_hw_breakpoint seemingly does not
> call arch_install_hw_breakpoint. The test also seems to fail on arm64
> in the same way when I tested it.

Is this still a problem with your patchset?

Do you test in qemu? Can you share your version, command line, etc?

> --- /dev/null
> +++ b/tools/testing/selftests/riscv/breakpoints/Makefile
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (C) 2021 ARM Limited
> +# Originally tools/testing/arm64/abi/Makefile

CFLAGS += $(KHDR_INCLUDES)

This adds -isystem to include local headers for the up to date
ptrace.h and elf.h definitions.

 $ make headers
 $ make -C tools/testing/selftests CROSS_COMPILE=riscv64-linux-gnu-
ARCH=riscv TARGETS=riscv/breakpoints
     make: Entering directory 'tools/testing/selftests'
     riscv64-linux-gnu-gcc -static
-otools/testing/selftests/riscv/breakpoints/breakpoint_test
     -isystem usr/include -Itools/testing/selftests/../../../tools/include
     -D_GNU_SOURCE=   breakpoint_test.c

> +
> +CFLAGS += -I$(top_srcdir)/tools/include
> +
> +TEST_GEN_PROGS := breakpoint_test
> +
> +include ../../lib.mk
> +
> +$(OUTPUT)/breakpoint_test: breakpoint_test.c
> +       $(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
> diff --git a/tools/testing/selftests/riscv/breakpoints/breakpoint_test.c b/tools/testing/selftests/riscv/breakpoints/breakpoint_test.c
> new file mode 100644
> index 000000000000..faeecc72da12
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/breakpoints/breakpoint_test.c
> @@ -0,0 +1,246 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2016 Google, Inc.
> + *
> + * Original Code by Pavel Labath <labath@google.com>
> + *
> + * Code modified by Pratyush Anand <panand@redhat.com>
> + * for testing different byte select for each access size.
> + * Originally tools/testing/selftests/breakpoints/breakpoint_test_arm64.c
> + */
> +
> +#define _GNU_SOURCE
> +
> +#include <asm/ptrace.h>
> +#include <sys/types.h>
> +#include <sys/wait.h>
> +#include <sys/ptrace.h>
> +#include <sys/param.h>
> +#include <sys/uio.h>
> +#include <stdint.h>
> +#include <stdbool.h>
> +#include <stddef.h>
> +#include <string.h>
> +#include <stdio.h>
> +#include <unistd.h>
> +#include <elf.h>

This is the wrong elf.h, we want the one with NT_RISCV_HW_BREAK.

-#include <elf.h>
+#include <linux/elf.h>


> +#include <errno.h>
> +#include <signal.h>
> +
> +#include "../../kselftest.h"
> +
> +#define MAX_BP_SIZE 8
> +

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
