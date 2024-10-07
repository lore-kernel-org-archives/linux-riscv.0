Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5343CFB440
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 08:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b3XBOke9SNlV/PZajCcTO2foziIVgspwDZzWtD3hNJw=; b=ab/MuSu38rxHRw
	0J8QMIH9ZuU+/vrKarkCaTwzr3Bfofy2bs4N53FPu+o1R7JyZuHbCQrncv+370+rT+Whn4s8uJrMN
	AAnjd1HDO0MpvXikBuMY7nqjIoiTJym61Zrf598c/1KIaXX9VJ5btJ8rs8TWSMIgnVtNODF7SVnDa
	Z4WrajxvR+I5ui36O07RY5mGxWnCcpwVSOQ4RQzkGEpuxHL6ScDIxpXUWEU3G4cpLHClhO/7iacKk
	4MjsIZMq2lB7ACXYNhiqm/J4JiW0dLB8ysuBxlSs9ckkiHsS7/T69vqZO9jLpDSdAqM/1Ql53+SYe
	7tRU9lPgoNQxhzQF8jKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxjF8-00000001n5X-41Bc;
	Mon, 07 Oct 2024 08:37:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxjCs-00000001mlV-0XD9;
	Mon, 07 Oct 2024 08:35:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 10DD05C5992;
	Mon,  7 Oct 2024 08:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C92C4CEC6;
	Mon,  7 Oct 2024 08:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728290104;
	bh=btmSv8f1vrIOAD0Hc5VYRph80OAmBMiwkMpLFOZtl2c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nfyj0Mep+EDOymL8OWUWcw8TAXyUSNz85kVSi7xeizSCl5LUmheZKiVImZYuXeTAx
	 bpoXEm6yBkDZ+wnqIxBBntK7qVgNhXaKJaXxfWgQ4XGk+ldcUK14ftL7+EoBI1G/XP
	 mguGM0EQ9tEyx50ICIfQkZ7WTtoazHzXXHhuOSWKPuqy/hfkxVkDW6A7TiXGW/JeVJ
	 w6zutx3xU6eBWSLnShqu1XVu/MnvlnLvhRNs5cJXsI13UP27t7Uu3UrmwNivrNMWee
	 CeQmjzeU2n5M8jujWfUPRpsuDrL1fIcseUxbur0Ar9bcPwgalQ3WYSVkLNrDB8utl0
	 FP2IhF9SuTgBg==
Date: Mon, 7 Oct 2024 17:34:53 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim
 <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa
 <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Kan Liang
 <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, Will
 Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, Mike Leach
 <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren
 <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Nick
 Terrell <terrelln@fb.com>, "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 Guilherme Amadio <amadio@gentoo.org>, Changbin Du <changbin.du@huawei.com>,
 Daniel Bristot de Oliveira <bristot@kernel.org>, Daniel Wagner
 <dwagner@suse.de>, Aditya Gupta <adityag@linux.ibm.com>, Athira Rajeev
 <atrajeev@linux.vnet.ibm.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Kajol Jain <kjain@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, Bibo
 Mao <maobibo@loongson.cn>, Anup Patel <anup@brainfault.org>, Atish Patra
 <atishp@rivosinc.com>, Shenlin Liang <liangshenlin@eswincomputing.com>,
 Oliver Upton <oliver.upton@linux.dev>, "Steinar H. Gunderson"
 <sesse@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, Chen Pei
 <cp0613@linux.alibaba.com>, Dima Kogan <dima@secretsauce.net>, Yury Norov
 <yury.norov@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 18/31] perf dwarf-regs: Move x86 dwarf-regs out of
 arch
Message-Id: <20241007173453.288ec1580855c29af0863d89@kernel.org>
In-Reply-To: <20241005195541.380070-19-irogers@google.com>
References: <20241005195541.380070-1-irogers@google.com>
	<20241005195541.380070-19-irogers@google.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_013506_293318_EEC27887 
X-CRM114-Status: GOOD (  27.94  )
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

On Sat,  5 Oct 2024 12:55:28 -0700
Ian Rogers <irogers@google.com> wrote:

> Move arch/x86/util/dwarf-regs.c to util/dwarf-regs-x86.c and compile
> in unconditionally. To avoid get_arch_regnum being duplicated, rename
> to get_x86_regnum and add to get_dwarf_regnum switch.
> 
> For get_arch_regstr, this was unused on x86 unless the machine type
> was EM_NONE. Map that case to EM_HOST and remove get_arch_regstr from
> dwarf-regs-x86.c.
> 

Hmm, I'm not sure this change. I feel like to keep the arch dependent
part under arch/ directory. But if this is just for reverse mapping of
regname -> regnum, since we already have regnum -> regname maps in the
header file, we can reimplement get_dwarf_regnum() as a generic function.
And that is what you does in this series, correct?

If so, can you make a generic get_dwarf_regnum() at first, and remove
the architecture dependent part which is not needed anymore.
That should be more simpler to review.

Thank you,
 

> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/arch/x86/util/Build                |  3 ---
>  tools/perf/util/Build                         |  1 +
>  .../dwarf-regs.c => util/dwarf-regs-x86.c}    | 24 +------------------
>  tools/perf/util/dwarf-regs.c                  | 17 +++++++++++++
>  tools/perf/util/include/dwarf-regs.h          |  8 +++++++
>  5 files changed, 27 insertions(+), 26 deletions(-)
>  rename tools/perf/{arch/x86/util/dwarf-regs.c => util/dwarf-regs-x86.c} (77%)
> 
> diff --git a/tools/perf/arch/x86/util/Build b/tools/perf/arch/x86/util/Build
> index 9705cda4f240..70af491a6dd7 100644
> --- a/tools/perf/arch/x86/util/Build
> +++ b/tools/perf/arch/x86/util/Build
> @@ -12,9 +12,6 @@ perf-util-y += evsel.o
>  perf-util-y += iostat.o
>  perf-util-y += env.o
>  
> -perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
> -perf-util-$(CONFIG_BPF_PROLOGUE) += dwarf-regs.o
> -
>  perf-util-$(CONFIG_LOCAL_LIBUNWIND)    += unwind-libunwind.o
>  perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
>  
> diff --git a/tools/perf/util/Build b/tools/perf/util/Build
> index 1d08608b7e1b..c2221ef431f3 100644
> --- a/tools/perf/util/Build
> +++ b/tools/perf/util/Build
> @@ -202,6 +202,7 @@ endif
>  perf-util-$(CONFIG_LIBDW) += probe-finder.o
>  perf-util-$(CONFIG_LIBDW) += dwarf-aux.o
>  perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
> +perf-util-$(CONFIG_LIBDW) += dwarf-regs-x86.o
>  perf-util-$(CONFIG_LIBDW) += debuginfo.o
>  perf-util-$(CONFIG_LIBDW) += annotate-data.o
>  
> diff --git a/tools/perf/arch/x86/util/dwarf-regs.c b/tools/perf/util/dwarf-regs-x86.c
> similarity index 77%
> rename from tools/perf/arch/x86/util/dwarf-regs.c
> rename to tools/perf/util/dwarf-regs-x86.c
> index 530905118cd4..7a55c65e8da6 100644
> --- a/tools/perf/arch/x86/util/dwarf-regs.c
> +++ b/tools/perf/util/dwarf-regs-x86.c
> @@ -11,28 +11,6 @@
>  #include <linux/kernel.h> /* for ARRAY_SIZE */
>  #include <dwarf-regs.h>
>  
> -#define DEFINE_DWARF_REGSTR_TABLE 1
> -#include "dwarf-regs-table.h"
> -
> -/* Return architecture dependent register string (for kprobe-tracer) */
> -const char *get_arch_regstr(unsigned int n)
> -{
> -#if defined(__i386__)
> -	size_t len = ARRAY_SIZE(x86_32_regstr_tbl);
> -#else
> -	size_t len = ARRAY_SIZE(x86_64_regstr_tbl);
> -#endif
> -
> -	if (n >= len)
> -		return NULL;
> -
> -#if defined(__i386__)
> -	return x86_32_regstr_tbl[n];
> -#else
> -	return x86_64_regstr_tbl[n];
> -#endif
> -}
> -
>  struct dwarf_regs_idx {
>  	const char *name;
>  	int idx;
> @@ -58,7 +36,7 @@ static const struct dwarf_regs_idx x86_regidx_table[] = {
>  	{ "rip", DWARF_REG_PC },
>  };
>  
> -int get_arch_regnum(const char *name)
> +int get_x86_regnum(const char *name)
>  {
>  	unsigned int i;
>  
> diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
> index 86b3ef638fbb..eac99a246737 100644
> --- a/tools/perf/util/dwarf-regs.c
> +++ b/tools/perf/util/dwarf-regs.c
> @@ -32,9 +32,17 @@
>  const char *get_dwarf_regstr(unsigned int n, unsigned int machine,
>  			     unsigned int flags __maybe_unused)
>  {
> +#if EM_HOST == EM_X86_64 || EM_HOST == EM_386
> +	if (machine == EM_NONE) {
> +		/* Generic arch - use host arch */
> +		machine = EM_HOST;
> +	}
> +#endif
>  	switch (machine) {
> +#if EM_HOST != EM_X86_64 && EM_HOST != EM_386
>  	case EM_NONE:	/* Generic arch - use host arch */
>  		return get_arch_regstr(n);
> +#endif
>  	case EM_386:
>  		return __get_dwarf_regstr(x86_32_regstr_tbl, n);
>  	case EM_X86_64:
> @@ -65,10 +73,12 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine,
>  	return NULL;
>  }
>  
> +#if EM_HOST != EM_X86_64 && EM_HOST != EM_386
>  __weak int get_arch_regnum(const char *name __maybe_unused)
>  {
>  	return -ENOTSUP;
>  }
> +#endif
>  
>  /* Return DWARF register number from architecture register name */
>  int get_dwarf_regnum(const char *name, unsigned int machine, unsigned int flags __maybe_unused)
> @@ -90,9 +100,16 @@ int get_dwarf_regnum(const char *name, unsigned int machine, unsigned int flags
>  		machine = EM_HOST;
>  	}
>  	switch (machine) {
> +#if EM_HOST != EM_X86_64 && EM_HOST != EM_386
>  	case EM_HOST:
>  		reg = get_arch_regnum(regname);
>  		break;
> +#endif
> +	case EM_X86_64:
> +		fallthrough;
> +	case EM_386:
> +		reg = get_x86_regnum(regname);
> +		break;
>  	default:
>  		pr_err("ELF MACHINE %x is not supported.\n", machine);
>  	}
> diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
> index 925525405e2d..062623aefd5a 100644
> --- a/tools/perf/util/include/dwarf-regs.h
> +++ b/tools/perf/util/include/dwarf-regs.h
> @@ -79,7 +79,10 @@
>  #define DWARF_REG_FB  0xd3affb /* random number */
>  
>  #ifdef HAVE_LIBDW_SUPPORT
> +#if !defined(__x86_64__) && !defined(__i386__)
>  const char *get_arch_regstr(unsigned int n);
> +#endif
> +
>  /**
>   * get_dwarf_regstr() - Returns ftrace register string from DWARF regnum.
>   * @n: DWARF register number.
> @@ -88,7 +91,12 @@ const char *get_arch_regstr(unsigned int n);
>   */
>  const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int flags);
>  
> +int get_x86_regnum(const char *name);
> +
> +#if !defined(__x86_64__) && !defined(__i386__)
>  int get_arch_regnum(const char *name);
> +#endif
> +
>  /*
>   * get_dwarf_regnum - Returns DWARF regnum from register name
>   * name: architecture register name
> -- 
> 2.47.0.rc0.187.ge670bccf7e-goog
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
