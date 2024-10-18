Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A77D3E18A
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2024 19:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=mP35TmEv7I3hDNIVDbmYTTbBJ1auRwAbD8JewWV8Hnk=; b=qZhp7pbbmKepg6bRwHCKayZY/J
	+vu2OUtgKsCHPxi0aLyROZZT6oI1ru5kipBjgcvb7Bq1yj1w5iguyKF24PUXDsIYZO0dbsC6Qd0Qw
	qFjPMSxH+mrv8ATVeOkanQkXz/h+RNlylS9aGaZT/hstFCj56xNe0FcprRk1q20MF6NSe9NsEd6xF
	n3aRqnEFFZW/mr/C9ChPO8LrHTQiq6YZa7CO8biNVBscnuxcDVj8qsU75PKg3Ykll2ZshKIz3DhhT
	QtcimE+QlviX3/0m7JxejxmLKY+KYXl8N9IlR95BITfrBl8noo6tlo5ddWcUm3pLyyzd4rWdrbM2t
	+7LfGPSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1svT-00000001qsC-0KSq;
	Fri, 18 Oct 2024 19:46:19 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1soQ-00000001pDK-0LHh
	for linux-riscv@lists.infradead.org;
	Fri, 18 Oct 2024 19:39:04 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-71e52582d0bso1938433b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 18 Oct 2024 12:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1729280341; x=1729885141; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiT5fWlA/ERvmoNoGd6vO/wEcabREvD5vErT274A8nM=;
        b=HBz1KXdrpsfqH+71MlGOD34k1kwYMh1wk/uSe+cv3IeeS5xDzX8b8A05r2mGBHfFsI
         pgnusZXtFQ9bSR/k/MfYyMf4b4r+hDBN1SsPzz3PDEgXqn4+UhEplkkSpACC3++2R+D/
         KUrs/GyyVIYXL5nvxvwJe8tAAb1ni9QNmXEYwwRjAiPp42p1dSskoL9Hp7oX1IWJv+0w
         g2zQ9iTjEG1jfi4DroDWfUZON2DscuUy7ynYyso9DLnpvXqKpbY9BzQDhox1sJ/4OPOI
         GH3jD/KLglwASGGo0iWhkihKo6y7yNPpyQAYoliF9zSxm76gZHcR9il3d+HLXnRR/5zl
         mrGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729280341; x=1729885141;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FiT5fWlA/ERvmoNoGd6vO/wEcabREvD5vErT274A8nM=;
        b=Y+kXVlrJ/dia6tUFTdo/nrSRieuyEQE7g8OG9MUGWBDmFUkOwE/HPSXft/kPFbOpJI
         PJTDn1vVXfYGkzJQbPsBUCLsMIBhfldYLb++uUAO0AyxOBNbNR3XOROkZGrri/qGX+mg
         sRmpGM6ezh3mX5O8yoAIE0O+3wdQA2vn7Zk001eghwgD6BpHAr3SHjbQjnwsijXWtlKJ
         xjaJxTjSDBtO3uALCynf1w8bRk8//hwkgyMYsFuYv53tpqgxDNXb/td8MryuF7PDMOi1
         fDl0Yx3VHk6o0nKP7702/zb3tjJStM8S9XQWTxz+ThieK+yspFecbhDIyS3Q3GMgWjML
         /Lxw==
X-Forwarded-Encrypted: i=1; AJvYcCWb/nXAPzR1JpeXw/98/LULJzEOd8kq9WO2cog/gtyR6bVjhcCqOtKF+OXrjfsYkma4P31bj8QS8HVSxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfKr3XgPhLicty3k2CXXL2plb7staDnGTeFbXlQ0Hb1VlfzYew
	SB4LeyOuyY/Mmy+VkNK868mDYxK3PxMH0NUlagMbc5nKNFVLyOAxVGm0/55kdBc=
X-Google-Smtp-Source: AGHT+IEaz8xK2W5RjSu2Q9b6C4y0O26xQFCdJyP2lVmFbBHXT7gzr62PkAtdtybkW4AY+Kl/19589g==
X-Received: by 2002:a05:6a00:1989:b0:70d:14d1:1bb7 with SMTP id d2e1a72fcca58-71ea331c750mr4761453b3a.28.1729280340869;
        Fri, 18 Oct 2024 12:39:00 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea33663e1sm1837071b3a.89.2024.10.18.12.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:39:00 -0700 (PDT)
Date: Fri, 18 Oct 2024 12:39:00 -0700 (PDT)
X-Google-Original-Date: Fri, 18 Oct 2024 12:38:57 PDT (-0700)
Subject: Re: [PATCH v3 14/20] perf riscv: Remove dwarf-regs.c and add dwarf-regs-table.h
In-Reply-To: <20241017002520.59124-15-irogers@google.com>
CC: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
  Mark Rutland <mark.rutland@arm.com>, alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
  adrian.hunter@intel.com, kan.liang@linux.intel.com, john.g.garry@oracle.com,
  Will Deacon <will@kernel.org>, james.clark@linaro.org, mike.leach@linaro.org, leo.yan@linux.dev,
  guoren@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  terrelln@fb.com, mhiramat@kernel.org, changbin.du@huawei.com, amadio@gentoo.org,
  yangjihong@bytedance.com, adityag@linux.ibm.com, atrajeev@linux.vnet.ibm.com, masahiroy@kernel.org,
  maobibo@loongson.cn, chenhuacai@kernel.org, kjain@linux.ibm.com, Atish Patra <atishp@rivosinc.com>,
  liangshenlin@eswincomputing.com, anup@brainfault.org, oliver.upton@linux.dev, sesse@google.com,
  linux@treblig.org, cp0613@linux.alibaba.com, dima@secretsauce.net, przemyslaw.kitszel@intel.com,
  davem@davemloft.net, aleksander.lobakin@intel.com, linux-kernel@vger.kernel.org,
  linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: irogers@google.com
Message-ID: <mhng-77fefb3c-c270-471c-b71b-ef3ab65d8b79@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_123902_416854_58E069E1 
X-CRM114-Status: GOOD (  24.39  )
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

On Wed, 16 Oct 2024 17:25:14 PDT (-0700), irogers@google.com wrote:
> The file just provides the function get_arch_regstr, however, if in
> the only caller get_dwarf_regstr EM_HOST is used for the EM_NONE case,
> and the register table is provided in a header file, the function can
> never be called. So remove as dead code. Tidy up the EM_NONE cases for
> riscv in dwarf-regs.c.
>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  .../dwarf-regs-table.h}                       | 32 ++++---------------
>  tools/perf/arch/riscv/util/Build              |  1 -
>  tools/perf/util/dwarf-regs.c                  |  7 ++--
>  tools/perf/util/include/dwarf-regs.h          |  2 +-
>  4 files changed, 12 insertions(+), 30 deletions(-)
>  rename tools/perf/arch/riscv/{util/dwarf-regs.c => include/dwarf-regs-table.h} (56%)
>
> diff --git a/tools/perf/arch/riscv/util/dwarf-regs.c b/tools/perf/arch/riscv/include/dwarf-regs-table.h
> similarity index 56%
> rename from tools/perf/arch/riscv/util/dwarf-regs.c
> rename to tools/perf/arch/riscv/include/dwarf-regs-table.h
> index a9c4402ae57e..a45b63a6d5a8 100644
> --- a/tools/perf/arch/riscv/util/dwarf-regs.c
> +++ b/tools/perf/arch/riscv/include/dwarf-regs-table.h
> @@ -1,23 +1,10 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * Copyright (C) 2019 Hangzhou C-SKY Microsystems co.,ltd.
> - * Mapping of DWARF debug register numbers into register names.
> - */
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifdef DEFINE_DWARF_REGSTR_TABLE
> +/* This is included in perf/util/dwarf-regs.c */
>
> -#include <stddef.h>
> -#include <errno.h> /* for EINVAL */
> -#include <string.h> /* for strcmp */
> -#include <dwarf-regs.h>
> +#define REG_DWARFNUM_NAME(reg, idx)	[idx] = "%" #reg
>
> -struct regs_dwarfnum {
> -	const char *name;
> -	unsigned int dwarfnum;
> -};
> -
> -#define REG_DWARFNUM_NAME(r, num) {.name = r, .dwarfnum = num}
> -#define REG_DWARFNUM_END {.name = NULL, .dwarfnum = 0}
> -
> -struct regs_dwarfnum riscv_dwarf_regs_table[] = {
> +static const char * const riscv_regstr_tbl[] = {
>  	REG_DWARFNUM_NAME("%zero", 0),
>  	REG_DWARFNUM_NAME("%ra", 1),
>  	REG_DWARFNUM_NAME("%sp", 2),
> @@ -50,13 +37,6 @@ struct regs_dwarfnum riscv_dwarf_regs_table[] = {
>  	REG_DWARFNUM_NAME("%t4", 29),
>  	REG_DWARFNUM_NAME("%t5", 30),
>  	REG_DWARFNUM_NAME("%t6", 31),
> -	REG_DWARFNUM_END,
>  };
>
> -#define RISCV_MAX_REGS ((sizeof(riscv_dwarf_regs_table) / \
> -		 sizeof(riscv_dwarf_regs_table[0])) - 1)
> -
> -const char *get_arch_regstr(unsigned int n)
> -{
> -	return (n < RISCV_MAX_REGS) ? riscv_dwarf_regs_table[n].name : NULL;
> -}
> +#endif
> diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
> index 8f93091b8345..58a672246024 100644
> --- a/tools/perf/arch/riscv/util/Build
> +++ b/tools/perf/arch/riscv/util/Build
> @@ -2,5 +2,4 @@ perf-util-y += perf_regs.o
>  perf-util-y += header.o
>
>  perf-util-$(CONFIG_LIBTRACEEVENT) += kvm-stat.o
> -perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
>  perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
> diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
> index 3d98c2bf6035..2c6b197556dd 100644
> --- a/tools/perf/util/dwarf-regs.c
> +++ b/tools/perf/util/dwarf-regs.c
> @@ -20,6 +20,7 @@
>  #include "../arch/arm64/include/dwarf-regs-table.h"
>  #include "../arch/sh/include/dwarf-regs-table.h"
>  #include "../arch/powerpc/include/dwarf-regs-table.h"
> +#include "../arch/riscv/include/dwarf-regs-table.h"
>  #include "../arch/s390/include/dwarf-regs-table.h"
>  #include "../arch/sparc/include/dwarf-regs-table.h"
>  #include "../arch/xtensa/include/dwarf-regs-table.h"
> @@ -33,7 +34,7 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int
>  {
>  #if EM_HOST == EM_X86_64 || EM_HOST == EM_386 || EM_HOST == EM_AARCH64 || EM_HOST == EM_ARM \
>      || EM_HOST == EM_CSKY || EM_HOST == EM_LOONGARCH || EM_HOST == EM_MIPS || EM_HOST == EM_PPC \
> -    || EM_HOST == EM_PPC64
> +    || EM_HOST == EM_PPC64 || EM_HOST == EM_RISCV
>  	if (machine == EM_NONE) {
>  		/* Generic arch - use host arch */
>  		machine = EM_HOST;
> @@ -42,7 +43,7 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int
>  	switch (machine) {
>  #if EM_HOST != EM_X86_64 && EM_HOST != EM_386 && EM_HOST != EM_AARCH64 && EM_HOST != EM_ARM \
>      && EM_HOST != EM_CSKY && EM_HOST != EM_LOONGARCH && EM_HOST != EM_MIPS && EM_HOST != EM_PPC \
> -    && EM_HOST != EM_PPC64
> +    && EM_HOST != EM_PPC64 && EM_HOST != EM_RISCV
>  	case EM_NONE:	/* Generic arch - use host arch */
>  		return get_arch_regstr(n);
>  #endif
> @@ -63,6 +64,8 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int
>  	case EM_PPC:
>  	case EM_PPC64:
>  		return __get_dwarf_regstr(powerpc_regstr_tbl, n);
> +	case EM_RISCV:
> +		return __get_dwarf_regstr(riscv_regstr_tbl, n);
>  	case EM_SPARC:
>  	case EM_SPARCV9:
>  		return __get_dwarf_regstr(sparc_regstr_tbl, n);
> diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
> index 1763280855ce..35f4f33205da 100644
> --- a/tools/perf/util/include/dwarf-regs.h
> +++ b/tools/perf/util/include/dwarf-regs.h
> @@ -81,7 +81,7 @@
>  #ifdef HAVE_LIBDW_SUPPORT
>  #if !defined(__x86_64__) && !defined(__i386__) && !defined(__aarch64__) && !defined(__arm__) \
>      && !defined(__loongarch__) && !defined(__mips__) && !defined(__powerpc__) \
> -    && !defined(__powerpc64__)
> +    && !defined(__powerpc64__) && !defined(__riscv__)
>  const char *get_arch_regstr(unsigned int n);
>  #endif

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
