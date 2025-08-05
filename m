Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB15C87FDA
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 19:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bUoMxMlGK74iJEMjcAHAzPifA/gZdVZeZIkkDgOA1+I=; b=JQZQoikeXBNeTQ
	HgombTDQPX4VerXkZT8jL6juAXoVtu63osRVR3dZS5xr4iRDYtnZLb4OJ4S3ukNs+2aDx8yzljuKF
	o9sW81TKiePPjdFRESS28/MHnHirNXBJIaNF4qjiPLOk8W5YF0LfcgeDOMcy3dZjxmtvJno+2wA+E
	vu6fntfgBV/nOWCCczc40KHcz7kprGdSl3B4rx/fq2XdJoQhnVzqQFO3+34NH49FTZk+v6w6bOXYl
	cVe1uFodqfESrF+/V9ZcDuCZ6Q1bJf2Y9b//6Tt4JcNoCFwAFj+pviFc6Ax3o6sL30sBWsDnT+YmR
	r2FiHWyRkAHTosgtkW0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujNVx-0000000DgUm-3mnF;
	Tue, 05 Aug 2025 19:40:01 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujNVv-0000000DgTQ-2Tbg
	for linux-riscv@lists.infradead.org;
	Tue, 05 Aug 2025 19:40:01 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7e806613af8so229452585a.2
        for <linux-riscv@lists.infradead.org>; Tue, 05 Aug 2025 12:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1754422798; x=1755027598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Av9ulXUYq8yypH92LgefCWXE0SBG4q/HDQdjt7nKwbs=;
        b=C4IY97tf5t7THUaIA2AaMQEUaR4Dd+Ep9MUn5+RDoSXZWwTanhlEEjdosMq3fHil72
         G3MmgQB4A/hQHSlLNYwpi8teS6ABCIGmq+54OBM7EHmG+ffuC+cQunh1xgJLRt9B9xis
         QuHw/+AzU7rxX7miHNSfbGlZZ+EsS46oGQOXeBhNHGXBr7uajbPwId1dsgPReUvHbodv
         8SnZmqO8JeHt8kCWQOn+8V+Xg8bMuH+ZeYpuEcPNnXkvewji1O0Fh+M89spgDFqCaV+H
         ko4uXYwws68TlZwm73GKBnm3Sns/G+zbOCNTdc5Y358m5NYpjoi1K3oTiyksAwmS7vaI
         XfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754422798; x=1755027598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Av9ulXUYq8yypH92LgefCWXE0SBG4q/HDQdjt7nKwbs=;
        b=b9KJRa0zfw87qLcgI2nfBJLti8YYXy1Wwg+/9c207Yivd5qhz63kYLeHE+dmOX3Gb0
         45yWzTwmxGroTiDdNBZcbdIf3qCxikR+9deCpa9AtZsUxb7un1EI6dpdJeZzpAgRPI9W
         x97HXwd755HmkBAKI0W3x9uaCCVA8Or9N+c8285e3yPn9L4IYCdMBw6/mczieDGlKYO7
         cJBHRlTeHxMDmzxUpUKHUC9atgi92lxcm+EUw/3njpSIIN0RRafQxlqA3hreKE9Xz4rk
         bUdl3qpd6081LPxJzvgHwrkcOOMZlat533uYjCiVPjUP0lRmVDIsGW4+0lEBfu2sY8uv
         RZDg==
X-Gm-Message-State: AOJu0YyYM5vo8mBAMS+ZqxyK7xj/y/YTLc7JY082A+PhLE6zcuTz0Ttt
	YMpEyx5icPNLr7Os+qeAfurJ7CHls4hM0G8jDsnWa9XWASyvNUJ9AtObX1jVAN9bcM41kp1k5QD
	04sUO
X-Gm-Gg: ASbGncsvlGO/1se+nDTJuKLRClA/JwGYg/QLlwIDfW36G4Ay/ii3zUNIJpm5lhNgRZA
	IOk3Is0Ab3t9XIDf/Hkhb0Ux2CamDayvwJZv6ysx8WfWlNkKfb4xXxvUVe0jyUK9xoIFstPjcEU
	ZEks7Cg3XJM7TzMt4FBcnn7/gNujKw48+phsv4i7TJ0hHBPfGJtdDwlFExZYn06hcBD84u7lREK
	1W2k/JYEqDd5n0PQbnX1RL0Jeuu/ZyRkOz208f4FHj+C5oibmjT2A93YiNklFUK+yVpwAccAGdg
	AmhcR64m0lDspzaAwuxQNp1IOgDsatYK/PRwNnfN013vaHSdT1V2lu67CmftCbqNzlJmHoZtk2/
	6cgOMbBPM6Jc8P2/Xq5QL5s6btKCZ4GH5pw6x99qvO2m3p8R9FSXitBLsgR6ac0MWr599grxT8u
	z2D1qumA==
X-Google-Smtp-Source: AGHT+IGaYz9rbHDaluNVvJAMepELkYucyj+ueO/efwJAG+Ld5Sktyl2JYCmbLDUiGqnvS0NmhNn2LQ==
X-Received: by 2002:a05:620a:370f:b0:7e6:67b3:ebf2 with SMTP id af79cd13be357-7e814d1a1e2mr85393985a.27.1754422798022;
        Tue, 05 Aug 2025 12:39:58 -0700 (PDT)
Received: from jesse-lt.jtp-bos.lab (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f7064b0sm717855685a.54.2025.08.05.12.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 12:39:57 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Shuah Khan <shuah@kernel.org>,
	Jesse Taube <jesse@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley  <conor.dooley@microchip.com>,
	Deepak Gupta  <debug@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	WangYuli <wangyuli@uniontech.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Joel Granados <joel.granados@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Celeste Liu <coelacanthushex@gmail.com>,
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
	Nylon Chen <nylon.chen@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/8] riscv: add initial support for hardware breakpoints
Date: Tue,  5 Aug 2025 12:39:47 -0700
Message-ID: <20250805193955.798277-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_123959_734433_EA8E69D5 
X-CRM114-Status: GOOD (  13.61  )
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

This patchset adds initial support for hardware breakpoints and
watchpoints to the  RISC-V architecture. The framework is built on
top of perf subsystem and SBI debug trigger extension.

Currently following features are not supported and are in works:
 - icount for single stepping
 - Virtualization of debug triggers
 - kernel space debug triggers

The SBI debug trigger extension can be found at:
https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-debug-triggers.adoc

The Sdtrig ISA is part of RISC-V debug specification which can be
found at:
https://github.com/riscv/riscv-debug-spec

based off the original RFC by Himanshu Chauhan here:
https://lore.kernel.org/lkml/20240222125059.13331-1-hchauhan@ventanamicro.com/

Second RFC by Jesse Taube here:
https://lore.kernel.org/lkml/20250722173829.984082-1-jesse@rivosinc.com/

Himanshu Chauhan (2):
  riscv: Add SBI debug trigger extension and function ids
  riscv: Introduce support for hardware break/watchpoints

Jesse Taube (6):
  riscv: Add insn.c, consolidate instruction decoding
  riscv: insn: Add get_insn_nofault
  riscv: hw_breakpoint: Use icount for single stepping
  riscv: ptrace: Add hw breakpoint support
  riscv: ptrace: Add hw breakpoint regset
  selftests: riscv: Add test for hardware breakpoints

 arch/riscv/Kconfig                            |  13 +
 arch/riscv/include/asm/bug.h                  |  12 -
 arch/riscv/include/asm/hw_breakpoint.h        |  59 ++
 arch/riscv/include/asm/insn.h                 | 132 ++-
 arch/riscv/include/asm/kdebug.h               |   3 +-
 arch/riscv/include/asm/processor.h            |   4 +
 arch/riscv/include/asm/sbi.h                  |  33 +-
 arch/riscv/include/uapi/asm/ptrace.h          |   9 +
 arch/riscv/kernel/Makefile                    |   2 +
 arch/riscv/kernel/hw_breakpoint.c             | 769 ++++++++++++++++++
 arch/riscv/kernel/insn.c                      | 165 ++++
 arch/riscv/kernel/kgdb.c                      | 102 +--
 arch/riscv/kernel/probes/kprobes.c            |   1 +
 arch/riscv/kernel/process.c                   |   4 +
 arch/riscv/kernel/ptrace.c                    | 169 ++++
 arch/riscv/kernel/traps.c                     |  11 +-
 arch/riscv/kernel/traps_misaligned.c          |  93 +--
 include/uapi/linux/elf.h                      |   2 +
 tools/include/uapi/linux/elf.h                |   1 +
 tools/perf/tests/tests.h                      |   3 +-
 tools/testing/selftests/riscv/Makefile        |   2 +-
 .../selftests/riscv/breakpoints/.gitignore    |   1 +
 .../selftests/riscv/breakpoints/Makefile      |  12 +
 .../riscv/breakpoints/breakpoint_test.c       | 246 ++++++
 24 files changed, 1657 insertions(+), 191 deletions(-)
 create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
 create mode 100644 arch/riscv/kernel/hw_breakpoint.c
 create mode 100644 arch/riscv/kernel/insn.c
 create mode 100644 tools/testing/selftests/riscv/breakpoints/.gitignore
 create mode 100644 tools/testing/selftests/riscv/breakpoints/Makefile
 create mode 100644 tools/testing/selftests/riscv/breakpoints/breakpoint_test.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
