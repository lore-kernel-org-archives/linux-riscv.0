Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E5BC41535
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 02:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jK9Dlr7B6gBv+GmSXnyiKSQ7uHaN3viR46J6/jSxouI=; b=HJUdhPgHYJIdtXNqvQUj4cbLYQ
	aFPB92hkCXtU01oMzx6H52JKt0d3/6fM/VUcoH9UAYUsJjxnmcZNpSVdn+wvUKjDf3lImNm66xbVl
	VgCJEj7QcE+6IrKJJkVt7AiJO+nfzKn4cZHMRNztBGbFa3U8O0njOJummv0XCLIpavYbu9roeE48s
	qFnnhfms0+ExEbO8FaXidVL8XjefHbLz2ylHWxPLFdFUC3MNo/MQUOhlZFpAYJR+NUpw7bNZy0Fr+
	lpm5sNoyQrACYuAp3NjdCYtjKYTg5ZHCEUNFe9zQwZGRbKpQHZ9dFtUJzQEJj0s6lhz/QMzmqkgka
	pX2Iy1kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEge5-00711g-0W;
	Sun, 17 Dec 2023 02:12:45 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEge2-00710y-1B
	for linux-riscv@lists.infradead.org;
	Sun, 17 Dec 2023 02:12:43 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6d855efb920so1713410a34.1
        for <linux-riscv@lists.infradead.org>; Sat, 16 Dec 2023 18:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702779161; x=1703383961; darn=lists.infradead.org;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=ZU4udhAe9yRwJhQWBqF+GjdBA5/uiRNgWqIJoHsE7co=;
        b=uedKDdOF2IYZx14/InTlF1F5BcHogKThfaA0uo/Wd2TLJLJeE5Q/CIWLyx3rNPMnyj
         cqynQCq+rYDrG8SsrpODk3IO5kUMYAEddKqbYgOtvh/1j7MSqBI3Pf20JAz+pwdTKagd
         YaURogllS5SzjDr9pbBsapYjp1LPRhWhBDsgufHsRp6TI5IsMgZaXQ28C2WmDJCQOAaG
         ewF73CejlkG1Zuj7hnx08elKSDSVz0Z30nMuVrh+ZZpICrwdBR53TSlBv2XO8xQywTmD
         Tc0FPMoa4l/yVMuGmNH5SKzQx4GM/Z6pb5Io+bGIQS8NMbp8yE5do28RHpCXr4kO2FRk
         63ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702779161; x=1703383961;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZU4udhAe9yRwJhQWBqF+GjdBA5/uiRNgWqIJoHsE7co=;
        b=PLatkaYGk+5rQql5JXHeMC/ObJTj6nL5NxqO7bIqrmDWSdrSfru2MFffX9Y25RZGkF
         S0tRe/yQuRh0oGj7ML8PFlTaUv0j+0eJ060bU+H5xgUG6UGD7eLdJqCvKmkBpjffrCkz
         /HWTmn7+BOdYiANe/VuZkEz7ZMtRYwDFU1UEXJL77j0FzulHrZ6Ofe/fWl3nMtPOSxii
         /wDCrk5FzIPYcq1Nd4n+xGoKcg/3BUGYB90n7MqRV59DPkKfAwvJVVpqXQ2wuJeRK3ON
         DGNNpz8FoBeUhJsffxpbDcBzEGcMQjwgbFJAVaqXevTa0qZf1OpFLcAkH1FWbSrjz5DM
         V1Xw==
X-Gm-Message-State: AOJu0YzYbsB3j9aV0SRe0OzP2RCNa0Z1MSS47aRT9RE/5tw8mBDvu6VH
	bzBsAtHqH4uMvB0L5RZZ1ZCFBQ==
X-Google-Smtp-Source: AGHT+IF6d0b9WINtfrmG2vZvKrSnvlJEjZ4mHUhu7B/LaY8JjOvAXCc/5DohR5MVIJGhP2NUssRkGA==
X-Received: by 2002:a05:6808:128b:b0:3b9:dd5e:86f2 with SMTP id a11-20020a056808128b00b003b9dd5e86f2mr19868232oiw.13.1702779160745;
        Sat, 16 Dec 2023 18:12:40 -0800 (PST)
Received: from localhost ([2804:14d:7e39:8470:a30f:cc0e:7239:16c3])
        by smtp.gmail.com with ESMTPSA id f10-20020a170902e98a00b001d39ac5cbf7sm1784886plb.201.2023.12.16.18.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 18:12:40 -0800 (PST)
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
 <20231122-arm64-gcs-v7-36-201c483bd775@kernel.org>
User-agent: mu4e 1.10.8; emacs 29.1
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Suzuki K
 Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, Oleg
 Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees
 Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, "Rick P.
 Edgecombe" <rick.p.edgecombe@intel.com>, Deepak Gupta
 <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, Szabolcs Nagy
 <Szabolcs.Nagy@arm.com>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Florian Weimer <fweimer@redhat.com>, Christian
 Brauner <brauner@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 36/39] selftests/arm64: Add GCS signal tests
In-reply-to: <20231122-arm64-gcs-v7-36-201c483bd775@kernel.org>
Date: Sat, 16 Dec 2023 23:12:37 -0300
Message-ID: <875y0x7f1m.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231216_181242_414650_24F3A1B1 
X-CRM114-Status: GOOD (  22.28  )
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


Mark Brown <broonie@kernel.org> writes:

> diff --git a/tools/testing/selftests/arm64/signal/testcases/gcs_exception_fault.c b/tools/testing/selftests/arm64/signal/testcases/gcs_exception_fault.c
> new file mode 100644
> index 000000000000..532d533592a1
> --- /dev/null
> +++ b/tools/testing/selftests/arm64/signal/testcases/gcs_exception_fault.c
> @@ -0,0 +1,59 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 ARM Limited
> + */
> +
> +#include <errno.h>
> +#include <signal.h>
> +#include <unistd.h>
> +
> +#include <sys/mman.h>
> +#include <sys/prctl.h>
> +
> +#include "test_signals_utils.h"
> +#include "testcases.h"
> +
> +/* This should be includable from some standard header, but which? */
> +#ifndef SEGV_CPERR
> +#define SEGV_CPERR 10
> +#endif

One suggestion is include/uapi/asm-generic/siginfo.h. It already has
SEGV_MTEAERR and SEGV_MTESERR, as well as si_codes specific to other
arches.

From there, it should find its way to glibc's
sysdeps/unix/sysv/linux/bits/siginfo-consts.h.

> +static int gcs_regs(struct tdescr *td, siginfo_t *si, ucontext_t *uc)
> +{
> +	size_t offset;
> +	struct _aarch64_ctx *head = GET_BUF_RESV_HEAD(context);
> +	struct gcs_context *gcs;
> +	unsigned long expected, gcspr;
> +	int ret;
> +
> +	ret = prctl(PR_GET_SHADOW_STACK_STATUS, &expected, 0, 0, 0);
> +	if (ret != 0) {
> +		fprintf(stderr, "Unable to query GCS status\n");
> +		return 1;
> +	}
> +
> +	/* We expect a cap to be added to the GCS in the signal frame */
> +	gcspr = get_gcspr_el0();
> +	gcspr -= 8;
> +	fprintf(stderr, "Expecting GCSPR_EL0 %lx\n", gcspr);
> +
> +	if (!get_current_context(td, &context.uc, sizeof(context))) {
> +		fprintf(stderr, "Failed getting context\n");
> +		return 1;
> +	}

At this point, before any function call is made, can the test check that
*(gcspr + 8) == 0? This would detect the issue I mentioned in
patch 24 of gcs_restore_signal() not zeroing the location of the cap.

> +	fprintf(stderr, "Got context\n");
> +
> +	head = get_header(head, GCS_MAGIC, GET_BUF_RESV_SIZE(context),
> +			  &offset);
> +	if (!head) {
> +		fprintf(stderr, "No GCS context\n");
> +		return 1;
> +	}
> +
> +	gcs = (struct gcs_context *)head;
> +
> +	/* Basic size validation is done in get_current_context() */
> +
> +	if (gcs->features_enabled != expected) {
> +		fprintf(stderr, "Features enabled %llx but expected %lx\n",
> +			gcs->features_enabled, expected);
> +		return 1;
> +	}
> +
> +	if (gcs->gcspr != gcspr) {
> +		fprintf(stderr, "Got GCSPR %llx but expected %lx\n",
> +			gcs->gcspr, gcspr);
> +		return 1;
> +	}

I suggest adding a new check here to ensure that gcs->reserved == 0.

> +	fprintf(stderr, "GCS context validated\n");
> +	td->pass = 1;
> +
> +	return 0;
> +}
> +
> +struct tdescr tde = {
> +	.name = "GCS basics",
> +	.descr = "Validate a GCS signal context",
> +	.feats_required = FEAT_GCS,
> +	.timeout = 3,
> +	.run = gcs_regs,
> +};
> diff --git a/tools/testing/selftests/arm64/signal/testcases/gcs_write_fault.c b/tools/testing/selftests/arm64/signal/testcases/gcs_write_fault.c
> new file mode 100644
> index 000000000000..126b1a294a29
> --- /dev/null
> +++ b/tools/testing/selftests/arm64/signal/testcases/gcs_write_fault.c
> @@ -0,0 +1,67 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 ARM Limited
> + */
> +
> +#include <errno.h>
> +#include <signal.h>
> +#include <unistd.h>
> +
> +#include <sys/mman.h>
> +#include <sys/prctl.h>
> +
> +#include "test_signals_utils.h"
> +#include "testcases.h"
> +
> +static uint64_t *gcs_page;
> +
> +#ifndef __NR_map_shadow_stack
> +#define __NR_map_shadow_stack 452
> +#endif
> +
> +static bool alloc_gcs(struct tdescr *td)
> +{
> +	long page_size = sysconf(_SC_PAGE_SIZE);
> +
> +	gcs_page = (void *)syscall(__NR_map_shadow_stack, 0,
> +				   page_size, 0);
> +	if (gcs_page == MAP_FAILED) {
> +		fprintf(stderr, "Failed to map %ld byte GCS: %d\n",
> +			page_size, errno);

This call is failing with EINVAL for me:

# timeout set to 45
# selftests: arm64/signal: gcs_write_fault
# # GCS write fault :: Normal writes to a GCS segfault
# Registered handlers for all signals.
# Detected MINSTKSIGSZ:4720
# Required Features: [ GCS ] supported
# Incompatible Features: [] absent
# Failed to map 4096 byte GCS: 22
# FAILED Testcase initialization.
# ==>> completed. FAIL(0)
not ok 11 selftests: arm64/signal: gcs_write_fault # exit=1

> +		return false;
> +	}
> +
> +	return true;
> +}

-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
