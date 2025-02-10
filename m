Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB3FC02198
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 23:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EBDjS0vSSvAgtPy7d5Elwm8AojHBLcOVMsGqRttWqBY=; b=gS9kuPwgBHcJ7u
	LBCI/4/QhKU5+09LqwiD+l7IBs5AjV56OEB2EUcUj/2O4JWfXK9aYT8k/xegKNGBnxtzLThb5P0Nc
	YQ0O25hkmcjMOaoaNH89sUrVAf/k34nkl0rfFpdUQ+L+uF+Lc+MFUrkFoPxRGuDjFBd2zhlMFm++b
	zorG/78SOPdFQOUCxy/JR4aSpK3PPnPeVJS5NZqOZ3UwooxP/z9Aqrgde39tvuHEGC6f415GOUNdO
	8lzagDso67791fXTI7gX22j5TQ9gZg6T4GG7hrxF8jLz14C9RSxGS3g1Tr7E+1Cye72ghmij/MmBx
	nmSij/TitL22fQAlecRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdXQ-00000001taX-0ham;
	Mon, 10 Feb 2025 23:50:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thdW4-00000001tUe-1c8j
	for linux-riscv@bombadil.infradead.org;
	Mon, 10 Feb 2025 23:48:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4hUbHvJc96V/cck7neSAdutap4ydIBlL7Lt+WobzOv4=; b=R2OGwzzMKeroppZeaNvKLqK1uh
	yF1x5Olt7ylkM/9nINuibucEZpcDD5FQJIG44mxz6Bd+KgP6ek0TXF5hu3siMK6b6j1i02jic2mw0
	oe17CwkuL1ihGiAgcKgRwdTG9B2RcMXzRdvm9plxs7fPI7Ulhv2AE8a0hYFRHM0+tb3hI8yat3RvA
	/5DJ+/IPRFjls0p2sW2PH+kJyUhA4QaGpdPL7w9WIH6McruisPUdr46OOqEH3iThezxURbkq2XhW7
	8mJwOG6xaomLk6VbfSfmuvK+W8fCpqM0YdSSMIuO1/weJmgdq5CGODpYWYpnMxPI4pOWfBhkXxKNG
	ViUh3huw==;
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thdVy-00000000NIJ-1tCH
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 23:48:38 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e545c1e8a15so4412979276.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 15:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739231311; x=1739836111; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4hUbHvJc96V/cck7neSAdutap4ydIBlL7Lt+WobzOv4=;
        b=YvSNl7MUiAOF0Q3ODgsNBRp1cwRRvT8RJcv+kZE7BS5qv0rU0k2UmbUDk/SbErQz5q
         ouFfhH8aDo8xqGTL9XYpz1S38Zl6UhSyVPBlBzgCfxKkgLANfDv+hL+ugr5RaRJXPVlI
         MoIc/zPglRTSI7+zRxpQUP376bLCGBuBhfu2ocJ99xWMPpzS+z3YwdJGlFdVlseGPOqj
         pge4coWrIlu2pj+vl8H+secfZx+B8+d6bmOcNfBftXAvGLkjk+Xtm0u0oqq28BPCovev
         siG3yJv6ULM0c8j2m1aBYbf6G5pOZCHI2fqDNTQLCbF26WKtABjwUq8MBTTF8/GkOmCn
         cE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739231311; x=1739836111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hUbHvJc96V/cck7neSAdutap4ydIBlL7Lt+WobzOv4=;
        b=WaURYO1h1a29BnegL9Oc2/aujvP7/KORa05Pcnpkun+8OwOLerh2vnuqVTXMKakcbw
         1b+9ia0WTQfa3my9O1arkrpAfvv5PKGxuvcu/Ei2oIdhUATGOr3Fz9R49XHkSCoXEbrx
         JmhiiByr6XUWlI/sUBMk2fl4QWaX3texeq3NhtA0309kuCqkeVEAMumolqE3g1tNhAaB
         NCAJIIrgIMCNC30dd5bIaHTyO+aQL3eGnOZS0uhzqQcYkSrDnH8Lo+y58ouQX/eK1ve9
         ZsX5uHXTlcKmH/1S0wqXRnRf0oS7LCrBHF2vQSwDEOIi0kbAbY6CVuwOFdRq3uXD1Tym
         2FSw==
X-Forwarded-Encrypted: i=1; AJvYcCU//bsdPqVouuGFeq4qkBr4Yjwv8DW5MNmMCanBXJYlnFfLsvzsdVcQAqgyqR9lkbAqOM7/sPRA0OvJDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvOo0fRyejcm3plwmjozV+Vr1mS78ticovIELxqI+ZNJ4l+czj
	R9NenDhQ7C3WdCBjvjxCMKzm8dYcA+UVfrZIYQ6LmYTfmD+CdLsMXmDwjjRJOlClmND64Qo744v
	6SJJcwQ==
X-Gm-Gg: ASbGnctE0ARfdcGy9/gs56HvK1JEG8duMuy/aDiW+i38SmPj92epxucJxTOq11bl6wJ
	3eMRepD1efXVM++fqBiTef1rT3xeGq1hROOGpvVYtrdjk4sbE3eWCeq2PmLCuLTrlPowG2HuGDr
	OfDgGt/wbxvaggzy3klw4C/jdrDyg7ok6EkWMvqYS0r1gPr/xIhGvHyd+uG6fr1kdO3Kl9gniql
	O2CmY9aKZYycuuvKjwl0QTQ1jErSY9jwwz/nZe9W8xKMaJJ8I8z/yj5DdWwXFX0hH/AlahMtOOG
	dBs=
X-Google-Smtp-Source: AGHT+IESD4xAhKpt/pl94F/2JTELVhfRZrr4MEz5jFM5hVpih0Ce3o8BYnuqyUwCOqcd7JcBXZF8hA==
X-Received: by 2002:a05:6902:1b03:b0:e5b:44f2:e2c2 with SMTP id 3f1490d57ef6-e5b461c59e5mr12913135276.25.1739231310645;
        Mon, 10 Feb 2025 15:48:30 -0800 (PST)
Received: from ghost ([50.146.0.9])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b3a45dd7esm2895010276.39.2025.02.10.15.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 15:48:29 -0800 (PST)
Date: Mon, 10 Feb 2025 15:48:28 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>,
	Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/7] perf syscalltble: Remove syscall_table.h
Message-ID: <Z6qQTL7k8VmAM_nD@ghost>
References: <20250210165108.95894-1-irogers@google.com>
 <20250210165108.95894-2-irogers@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250210165108.95894-2-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_234834_760217_C8173CA0 
X-CRM114-Status: GOOD (  22.88  )
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

On Mon, Feb 10, 2025 at 08:51:02AM -0800, Ian Rogers wrote:
> The definition of "static const char *const syscalltbl[] = {" is done
> in a generated syscalls_32.h or syscalls_64.h that is architecture
> dependent. In order to include the appropriate file a syscall_table.h
> is found via the perf include path and it includes the syscalls_32.h
> or syscalls_64.h as appropriate.
> 
> To support having multiple syscall tables, one for 32-bit and one for
> 64-bit, or for different architectures, an include path cannot be
> used. Remove syscall_table.h because of this and inline what it does
> into syscalltbl.c.
> 
> For architectures without a syscall_table.h this will cause a failure
> to include either syscalls_32.h or syscalls_64.h rather than a failure
> to include syscall_table.h. For architectures that only included one
> or other, the behavior matches BITS_PER_LONG as previously done on
> architectures supporting both syscalls_32.h and syscalls_64.h.

This is a great way of doing this, thank you.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> Reviewed-by: Howard Chu <howardchu95@gmail.com>
> ---
>  tools/perf/arch/alpha/include/syscall_table.h     | 2 --
>  tools/perf/arch/arc/include/syscall_table.h       | 2 --
>  tools/perf/arch/arm/include/syscall_table.h       | 2 --
>  tools/perf/arch/arm64/include/syscall_table.h     | 8 --------
>  tools/perf/arch/csky/include/syscall_table.h      | 2 --
>  tools/perf/arch/loongarch/include/syscall_table.h | 2 --
>  tools/perf/arch/mips/include/syscall_table.h      | 2 --
>  tools/perf/arch/parisc/include/syscall_table.h    | 8 --------
>  tools/perf/arch/powerpc/include/syscall_table.h   | 8 --------
>  tools/perf/arch/riscv/include/syscall_table.h     | 8 --------
>  tools/perf/arch/s390/include/syscall_table.h      | 2 --
>  tools/perf/arch/sh/include/syscall_table.h        | 2 --
>  tools/perf/arch/sparc/include/syscall_table.h     | 8 --------
>  tools/perf/arch/x86/include/syscall_table.h       | 8 --------
>  tools/perf/arch/xtensa/include/syscall_table.h    | 2 --
>  tools/perf/util/syscalltbl.c                      | 8 +++++++-
>  16 files changed, 7 insertions(+), 67 deletions(-)
>  delete mode 100644 tools/perf/arch/alpha/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/arc/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/arm/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/arm64/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/csky/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/loongarch/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/mips/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/parisc/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/powerpc/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/riscv/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/s390/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/sh/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/sparc/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/x86/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/xtensa/include/syscall_table.h
> 
> diff --git a/tools/perf/arch/alpha/include/syscall_table.h b/tools/perf/arch/alpha/include/syscall_table.h
> deleted file mode 100644
> index b53e31c15805..000000000000
> --- a/tools/perf/arch/alpha/include/syscall_table.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/syscalls_64.h>
> diff --git a/tools/perf/arch/arc/include/syscall_table.h b/tools/perf/arch/arc/include/syscall_table.h
> deleted file mode 100644
> index 4c942821662d..000000000000
> --- a/tools/perf/arch/arc/include/syscall_table.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/syscalls_32.h>
> diff --git a/tools/perf/arch/arm/include/syscall_table.h b/tools/perf/arch/arm/include/syscall_table.h
> deleted file mode 100644
> index 4c942821662d..000000000000
> --- a/tools/perf/arch/arm/include/syscall_table.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/syscalls_32.h>
> diff --git a/tools/perf/arch/arm64/include/syscall_table.h b/tools/perf/arch/arm64/include/syscall_table.h
> deleted file mode 100644
> index 7ff51b783000..000000000000
> --- a/tools/perf/arch/arm64/include/syscall_table.h
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/bitsperlong.h>
> -
> -#if __BITS_PER_LONG == 64
> -#include <asm/syscalls_64.h>
> -#else
> -#include <asm/syscalls_32.h>
> -#endif
> diff --git a/tools/perf/arch/csky/include/syscall_table.h b/tools/perf/arch/csky/include/syscall_table.h
> deleted file mode 100644
> index 4c942821662d..000000000000
> --- a/tools/perf/arch/csky/include/syscall_table.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/syscalls_32.h>
> diff --git a/tools/perf/arch/loongarch/include/syscall_table.h b/tools/perf/arch/loongarch/include/syscall_table.h
> deleted file mode 100644
> index 9d0646d3455c..000000000000
> --- a/tools/perf/arch/loongarch/include/syscall_table.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/syscall_table_64.h>
> diff --git a/tools/perf/arch/mips/include/syscall_table.h b/tools/perf/arch/mips/include/syscall_table.h
> deleted file mode 100644
> index b53e31c15805..000000000000
> --- a/tools/perf/arch/mips/include/syscall_table.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/syscalls_64.h>
> diff --git a/tools/perf/arch/parisc/include/syscall_table.h b/tools/perf/arch/parisc/include/syscall_table.h
> deleted file mode 100644
> index 7ff51b783000..000000000000
> --- a/tools/perf/arch/parisc/include/syscall_table.h
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/bitsperlong.h>
> -
> -#if __BITS_PER_LONG == 64
> -#include <asm/syscalls_64.h>
> -#else
> -#include <asm/syscalls_32.h>
> -#endif
> diff --git a/tools/perf/arch/powerpc/include/syscall_table.h b/tools/perf/arch/powerpc/include/syscall_table.h
> deleted file mode 100644
> index 7ff51b783000..000000000000
> --- a/tools/perf/arch/powerpc/include/syscall_table.h
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/bitsperlong.h>
> -
> -#if __BITS_PER_LONG == 64
> -#include <asm/syscalls_64.h>
> -#else
> -#include <asm/syscalls_32.h>
> -#endif
> diff --git a/tools/perf/arch/riscv/include/syscall_table.h b/tools/perf/arch/riscv/include/syscall_table.h
> deleted file mode 100644
> index 7ff51b783000..000000000000
> --- a/tools/perf/arch/riscv/include/syscall_table.h
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/bitsperlong.h>
> -
> -#if __BITS_PER_LONG == 64
> -#include <asm/syscalls_64.h>
> -#else
> -#include <asm/syscalls_32.h>
> -#endif
> diff --git a/tools/perf/arch/s390/include/syscall_table.h b/tools/perf/arch/s390/include/syscall_table.h
> deleted file mode 100644
> index b53e31c15805..000000000000
> --- a/tools/perf/arch/s390/include/syscall_table.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/syscalls_64.h>
> diff --git a/tools/perf/arch/sh/include/syscall_table.h b/tools/perf/arch/sh/include/syscall_table.h
> deleted file mode 100644
> index 4c942821662d..000000000000
> --- a/tools/perf/arch/sh/include/syscall_table.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/syscalls_32.h>
> diff --git a/tools/perf/arch/sparc/include/syscall_table.h b/tools/perf/arch/sparc/include/syscall_table.h
> deleted file mode 100644
> index 7ff51b783000..000000000000
> --- a/tools/perf/arch/sparc/include/syscall_table.h
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/bitsperlong.h>
> -
> -#if __BITS_PER_LONG == 64
> -#include <asm/syscalls_64.h>
> -#else
> -#include <asm/syscalls_32.h>
> -#endif
> diff --git a/tools/perf/arch/x86/include/syscall_table.h b/tools/perf/arch/x86/include/syscall_table.h
> deleted file mode 100644
> index 7ff51b783000..000000000000
> --- a/tools/perf/arch/x86/include/syscall_table.h
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/bitsperlong.h>
> -
> -#if __BITS_PER_LONG == 64
> -#include <asm/syscalls_64.h>
> -#else
> -#include <asm/syscalls_32.h>
> -#endif
> diff --git a/tools/perf/arch/xtensa/include/syscall_table.h b/tools/perf/arch/xtensa/include/syscall_table.h
> deleted file mode 100644
> index 4c942821662d..000000000000
> --- a/tools/perf/arch/xtensa/include/syscall_table.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#include <asm/syscalls_32.h>
> diff --git a/tools/perf/util/syscalltbl.c b/tools/perf/util/syscalltbl.c
> index 928aca4cd6e9..2f76241494c8 100644
> --- a/tools/perf/util/syscalltbl.c
> +++ b/tools/perf/util/syscalltbl.c
> @@ -7,13 +7,19 @@
>  
>  #include "syscalltbl.h"
>  #include <stdlib.h>
> +#include <asm/bitsperlong.h>
>  #include <linux/compiler.h>
>  #include <linux/zalloc.h>
>  
>  #include <string.h>
>  #include "string2.h"
>  
> -#include <syscall_table.h>
> +#if __BITS_PER_LONG == 64
> +  #include <asm/syscalls_64.h>
> +#else
> +  #include <asm/syscalls_32.h>
> +#endif
> +
>  const int syscalltbl_native_max_id = SYSCALLTBL_MAX_ID;
>  static const char *const *syscalltbl_native = syscalltbl;
>  
> -- 
> 2.48.1.502.g6dc24dfdaf-goog
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
