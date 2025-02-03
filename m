Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF0FC02197
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 19:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b8toXd5Ojtit7GjWhSO3ualTHRutb9AI6t244H4pI0E=; b=wkrHmxB7EQCx24
	OPVjapXmAIYu3FwFc2QuwixMuHugBXzQdGAENMIUi3QHv8Z6eRies5DSaLjkP4tbvNc2iHtJt+W+h
	zAHNmIABQUDVs+7mZTbmRbmphpb7QidEANg4C8je2W5Dbs1FTigZrIqLRQyZQP9R+IYzJDilt8Kut
	j3vNAcejC7+9vtKisIoRfv67Usuo11NssiaviakBFCOjsL4n6t8eUKImb+Ks0fxrRsygsbGq998lW
	uUF7F/hBzM4x7nHzrWJ6CjngKqJRCL6ecLlDmVH29dtKJ7qsJgGpN0zwmvmXcqkUa52ec8ssbvpI+
	H8Xru59Fi+zn9sGHazgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1lU-0000000GP5I-0Db2;
	Mon, 03 Feb 2025 19:05:48 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1i8-0000000GO9m-28Kw
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 19:02:22 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2166360285dso78865715ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 11:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738609340; x=1739214140; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6+cVOS5FJmIAsNqPulg8a9PrdBe6p9kJKl40HshGULo=;
        b=TIfPIE2YfeYfV8JnLEhKRBsL8ZEEUzBkGJi0EP1nLzg4LIv++esPrYVWmPrpJj3A/z
         /63JfNeXsiEIpSX6S8NV0yNiek0BmdSlGjzH63rRXwP/se5xcnz8k5yEh8CyOKViuIKN
         ClbJsrU1Kqvlyw3g9xHvdMCVHQfLmHAkrPEtq9CSfrq2FxmM4DQnE+h7b+54yj27qH0V
         VKNkL2jrB8+cfy87B8DgcrDt0rqZOTOFQ1DFh2+3U29pph8LCbJikALu5mE3Tte7dYX0
         WiBOR6XtvNtFOyW2FsTktPTKbCs8kJU0E67vR5xqA7M1QFDtMXSoIfSNEwXICidEGr3u
         9y+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738609340; x=1739214140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+cVOS5FJmIAsNqPulg8a9PrdBe6p9kJKl40HshGULo=;
        b=KwS8JvBhOjQwU67d/j5qI8gjS/Ml9hcuURcB1rkOULB0q2oso2NvHbiVhcWsidxcft
         ulTUO7Z77u5aMoALlDSSC2u6TrgyZTVohYQ61MGPThBzBYwd4HES+wKWtT29RGUwrFRk
         0yMJVTxjPG3oDo2VyPOzzPadIoSrECBBpgO8aX+2sM++WejopuHrEkyBRY+d69dBS4Zo
         kx/g2Iizbmz/dIWDdwIdzS1iT4MleN/GVKm3KRD8YPG9KWBRklAtuUYt8lwUCW0+wQxI
         7ua7WfwBVEdtJGsF2JfNn3M74k0x1hpvSwD5QX5QVx04Pzr5s/5LRxlk7lRqaxSZH9mB
         fuOw==
X-Forwarded-Encrypted: i=1; AJvYcCWFj/AzOkVjY1LiXvpxHHIsXhOJfl7B9atHPe695slGZfT1L4GeK4TUZFWgx5G/XeTTisjVbzZvOXMpHA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yysv47UpAxQvEeRrg7/Wo0cAfRXEFcNvShbcJo9p1UnBuvRv/IB
	rUdhGeJ/3Dh9ZrA/E9oYsDzL0xcmjxod+tUDOef+Sf64QUHaLNvDGAdxNXLfTDw=
X-Gm-Gg: ASbGnct2lwRsONa5Oxz3vPd6WDBwN/cNd2ZqQShswGh3AdQQnS9KR9Hn8PdirtemPwZ
	7hZzxaDB/DTuLJ57xioVdRZdZsZItu7SrhtBPEm24w+cEheiStJ2OYfqSF9P7NdOq3gU1OWKx38
	qg9Z9Ij7zc9BNzbLwT3nEuMxc7DKMBXLoVSLXVIIdcjH+uvglmburBiezuycy4kaj/fzEpCL+xY
	BNTAHWc/FBzITpKOlP+PUzO/Y40elQCbn8vWl6xnSgK93TdKJN5y4gUkrbVkKJwSZMLpgFJL7R5
	O9Ieo/ZtnSA=
X-Google-Smtp-Source: AGHT+IGcN0Vo5CKWdsr1pwOo6noYRq4z5e3fkA1+iadto7tAVdbWOLyGP+oftVvWDTpnF5AAlr0ojg==
X-Received: by 2002:a17:902:db02:b0:216:69ca:7714 with SMTP id d9443c01a7336-21dd7c46297mr353702245ad.11.1738609339800;
        Mon, 03 Feb 2025 11:02:19 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:4f63:f9d5:2cbd:2947])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31fcd3esm79813435ad.104.2025.02.03.11.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 11:02:19 -0800 (PST)
Date: Mon, 3 Feb 2025 11:02:14 -0800
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
Subject: Re: [PATCH v1 0/7] perf: Support multiple system call tables in the
 build
Message-ID: <Z6EStkn-YZ8zaO7u@ghost>
References: <20250201071455.718247-1-irogers@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250201071455.718247-1-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_110220_583080_725EA54B 
X-CRM114-Status: GOOD (  21.08  )
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

On Fri, Jan 31, 2025 at 11:14:48PM -0800, Ian Rogers wrote:
> This work builds on the clean up of system call tables and removal of
> libaudit by Charlie Jenkins <charlie@rivosinc.com>.
> 
> The system call table in perf trace is used to map system call numbers
> to names and vice versa. Prior to these changes, a single table
> matching the perf binary's build was present. The table would be
> incorrect if tracing say a 32-bit binary from a 64-bit version of
> perf, the names and numbers wouldn't match.
> 
> Change the build so that a single system call file is built and the
> potentially multiple tables are identifiable from the ELF machine type
> of the process being examined. To determine the ELF machine type, the
> executable's header is read from /proc/pid/exe with fallbacks to using
> the perf's binary type when unknown.
> 
> Remove some runtime types used by the system call tables and make
> equivalents generated at build time.

Our approaches are very different but I sent out a patch to do this a
couple of weeks ago [1].

Did you look at that and decide you didn't like the approach?

- Charlie

> 
> Ian Rogers (7):
>   perf syscalltble: Remove syscall_table.h
>   perf trace: Reorganize syscalls
>   perf syscalltbl: Remove struct syscalltbl
>   perf thread: Add support for reading the e_machine type for a thread
>   perf trace beauty: Add syscalltbl.sh generating all system call tables
>   perf syscalltbl: Use lookup table containing multiple architectures
>   perf build: Remove Makefile.syscalls
> 
>  tools/perf/Makefile.perf                      |  10 +-
>  tools/perf/arch/alpha/entry/syscalls/Kbuild   |   2 -
>  .../alpha/entry/syscalls/Makefile.syscalls    |   5 -
>  tools/perf/arch/alpha/include/syscall_table.h |   2 -
>  tools/perf/arch/arc/entry/syscalls/Kbuild     |   2 -
>  .../arch/arc/entry/syscalls/Makefile.syscalls |   3 -
>  tools/perf/arch/arc/include/syscall_table.h   |   2 -
>  tools/perf/arch/arm/entry/syscalls/Kbuild     |   4 -
>  .../arch/arm/entry/syscalls/Makefile.syscalls |   2 -
>  tools/perf/arch/arm/include/syscall_table.h   |   2 -
>  tools/perf/arch/arm64/entry/syscalls/Kbuild   |   3 -
>  .../arm64/entry/syscalls/Makefile.syscalls    |   6 -
>  tools/perf/arch/arm64/include/syscall_table.h |   8 -
>  tools/perf/arch/csky/entry/syscalls/Kbuild    |   2 -
>  .../csky/entry/syscalls/Makefile.syscalls     |   3 -
>  tools/perf/arch/csky/include/syscall_table.h  |   2 -
>  .../perf/arch/loongarch/entry/syscalls/Kbuild |   2 -
>  .../entry/syscalls/Makefile.syscalls          |   3 -
>  .../arch/loongarch/include/syscall_table.h    |   2 -
>  tools/perf/arch/mips/entry/syscalls/Kbuild    |   2 -
>  .../mips/entry/syscalls/Makefile.syscalls     |   5 -
>  tools/perf/arch/mips/include/syscall_table.h  |   2 -
>  tools/perf/arch/parisc/entry/syscalls/Kbuild  |   3 -
>  .../parisc/entry/syscalls/Makefile.syscalls   |   6 -
>  .../perf/arch/parisc/include/syscall_table.h  |   8 -
>  tools/perf/arch/powerpc/entry/syscalls/Kbuild |   3 -
>  .../powerpc/entry/syscalls/Makefile.syscalls  |   6 -
>  .../perf/arch/powerpc/include/syscall_table.h |   8 -
>  tools/perf/arch/riscv/entry/syscalls/Kbuild   |   2 -
>  .../riscv/entry/syscalls/Makefile.syscalls    |   4 -
>  tools/perf/arch/riscv/include/syscall_table.h |   8 -
>  tools/perf/arch/s390/entry/syscalls/Kbuild    |   2 -
>  .../s390/entry/syscalls/Makefile.syscalls     |   5 -
>  tools/perf/arch/s390/include/syscall_table.h  |   2 -
>  tools/perf/arch/sh/entry/syscalls/Kbuild      |   2 -
>  .../arch/sh/entry/syscalls/Makefile.syscalls  |   4 -
>  tools/perf/arch/sh/include/syscall_table.h    |   2 -
>  tools/perf/arch/sparc/entry/syscalls/Kbuild   |   3 -
>  .../sparc/entry/syscalls/Makefile.syscalls    |   5 -
>  tools/perf/arch/sparc/include/syscall_table.h |   8 -
>  tools/perf/arch/x86/entry/syscalls/Kbuild     |   3 -
>  .../arch/x86/entry/syscalls/Makefile.syscalls |   6 -
>  tools/perf/arch/x86/include/syscall_table.h   |   8 -
>  tools/perf/arch/xtensa/entry/syscalls/Kbuild  |   2 -
>  .../xtensa/entry/syscalls/Makefile.syscalls   |   4 -
>  .../perf/arch/xtensa/include/syscall_table.h  |   2 -
>  tools/perf/builtin-trace.c                    | 275 +++++++++++-------
>  tools/perf/scripts/Makefile.syscalls          |  61 ----
>  tools/perf/scripts/syscalltbl.sh              |  86 ------
>  tools/perf/trace/beauty/syscalltbl.sh         | 274 +++++++++++++++++
>  tools/perf/util/syscalltbl.c                  | 142 ++++-----
>  tools/perf/util/syscalltbl.h                  |  22 +-
>  tools/perf/util/thread.c                      |  50 ++++
>  tools/perf/util/thread.h                      |  14 +-
>  54 files changed, 598 insertions(+), 506 deletions(-)
>  delete mode 100644 tools/perf/arch/alpha/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/alpha/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/alpha/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/arc/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/arc/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/arc/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/arm/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/arm/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/arm/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/arm64/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/arm64/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/arm64/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/csky/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/csky/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/csky/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/loongarch/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/loongarch/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/loongarch/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/mips/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/mips/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/mips/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/parisc/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/parisc/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/parisc/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/powerpc/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/powerpc/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/powerpc/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/riscv/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/riscv/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/riscv/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/s390/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/s390/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/s390/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/sh/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/sh/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/sh/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/sparc/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/sparc/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/sparc/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/x86/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/x86/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/x86/include/syscall_table.h
>  delete mode 100644 tools/perf/arch/xtensa/entry/syscalls/Kbuild
>  delete mode 100644 tools/perf/arch/xtensa/entry/syscalls/Makefile.syscalls
>  delete mode 100644 tools/perf/arch/xtensa/include/syscall_table.h
>  delete mode 100644 tools/perf/scripts/Makefile.syscalls
>  delete mode 100755 tools/perf/scripts/syscalltbl.sh
>  create mode 100755 tools/perf/trace/beauty/syscalltbl.sh
> 
> -- 
> 2.48.1.362.g079036d154-goog
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
