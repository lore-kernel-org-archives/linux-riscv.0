Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17E8CA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 09:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AFkZJT2rIzVmX5Ki7T7m01LwRERfTmyMVsDm0Ext5cA=; b=dIDMZD+8USIzZj
	Kd7UeRa3CtnmYEAGCkJEDspncym1tET1yOcp3oF77uYLdWKeNmvHU239vk3lBkKnzBWUaI2om42hS
	V1inSbhF2MIbsfhcVsY8inQjHdkjjBVuSJilaQj+Q28caFmlLGGOKDCbE1zPFAe7ORcYAF7vEqJx+
	yd9ltbx7hpnzKZAO3VWsU2B4E6dPwIBenEOtfXRA4wTowN95nsMGCWBZ0bjUKb7ROXp7ZQj1P2jcJ
	dq4kkiKbXIUT5HjXX4cLV5JYBOxrQuoSwP/6ElnHTUmXE2tuKml5i5orBPX7NDFdj7p0iq6F2XTPy
	/P4jY2n49Y/FEeYNTchA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkfW-00000004Utv-1JFJ;
	Sat, 23 Aug 2025 09:36:14 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upVrF-00000003G9e-2iZu
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 17:47:23 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4b297962b20so21364891cf.2
        for <linux-riscv@lists.infradead.org>; Fri, 22 Aug 2025 10:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1755884838; x=1756489638; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7xWd683exLd05Xd2k+2/c9D8N3YKjun132TYqkPk7vQ=;
        b=Qhxla9A5axh9/ksiCHGoppAdFmobQRh8a3p6jyOq3FyjQbmfVqsRb0yZYZLo9qybKh
         nIufaCkEQDYzJN83/yRpbA4HEkMC80kNsk9XCVXw7p35JVSp1FsndQxz7S0KcPHOyjAZ
         ReNqR+1jfMfgan8zxuz7D6MycJwG/e36jVgoDGRfSxrYHTz4KbWdN+NyVi+sNy8WywA3
         ounFOhJDbnEF2UUeVkdcyv2QLJptdi/eH37L1E6Eh9NjZkgvSFxQmRGTM9B5w69S99Bn
         S4xbH3ugXyQyjg2ixc+40RfHQHe1zSnIduIJNvYqmkE9oMe1QBbq2Goff7U8J8XQ0PAi
         f3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755884838; x=1756489638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xWd683exLd05Xd2k+2/c9D8N3YKjun132TYqkPk7vQ=;
        b=MVaSeeWVDfUBnebTPCWXJW40FvuHDFRSdsooxPX7nzmXUxJlntaceyxsiXVcml7t3Q
         SsPwLkPqb3geM5xsZcKgdfWwr56pHheg3IySv1EbohoopGg/3XhUjXFcDrOL3n9G6PM4
         vm0PjcXly5y6GLNE2pW0vEpWCdA4qJf8BT8flsfItQItdApPolWRem5fbgUsZdWzNj/N
         MzbeyINkuTxOtNYlnFFGrpTLoFVxHECA8LKHx4gJxFsJlS1hJUNFAvYWilCvdsWLTSV2
         5wjm2uzziopwAjc89rKPNfAx5IjZjzQ1yH/jb7ta16+2x2kEJDsCnFznfJLDeD7Iy3Q6
         RaMQ==
X-Gm-Message-State: AOJu0YxNW6KS/5uH5aV1C5HTV6V4lg+104tfu3TDjGq35/ZnNQLHvmf5
	oOqfYoWRNI2mXEi0vDkR1juiCamkZbisKdSktvtZJ6mQLOkln4LESX3xfr+Nm+Rw+oB3vgsbLJw
	7QlhL
X-Gm-Gg: ASbGncteaARiBclyNlzzJQgNGcEab9fk8li0g8OhIoSjALsgshk0MnXdOCZhhFUS2m7
	GIiXIGNTXYiOnDvUJocmd6cv7d+qzifjM4kDism/39OdPa0lXOcG8R0iCEfHWxBNlr5LXna5hV+
	4PoUJ+IwAvzyv8HFy+0iczTYjDcshJA6OmfHco1X0SgXKyY0HDJ6yKrY8aw6G9GYN6YrZA/i7w2
	TJepo9ZL9oPO7t3b8G0Y2GP9VEQy+XL3vOlE8qMPQATwtZUZsv38I3a2WHfq8zQSsd3t0qA0JsE
	YmN9L+dFZ+i323EPrKc1RwgI5XlI2FTP3S1rVSJmdMqmo/vYgJ6EtB5kNrQmGvDB+V8oRvmKk0m
	5CaIz18TutYMsaMlF2Cai0PyzzcHkYwwSNWQyC7oHQLyJmTLVmHZogvCDDXfCd9T1njxkBdXO8u
	+ts+WQ2doU6QiFco4s
X-Google-Smtp-Source: AGHT+IERB8md7pMPxdX8kJ5ivrUWSgGAVukLkHuaDgpDlvNNBoFxuibBgYX+uodyqeWSfvVnl+l5kA==
X-Received: by 2002:a05:622a:1885:b0:4b2:8ac5:2586 with SMTP id d75a77b69052e-4b2aab78821mr43353651cf.77.1755884838018;
        Fri, 22 Aug 2025 10:47:18 -0700 (PDT)
Received: from jesse-lt.jtp-bos.lab (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8e6023asm3121361cf.53.2025.08.22.10.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 10:47:17 -0700 (PDT)
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
	"Liang Kan" <kan.liang@linux.intel.com>,
	Shuah Khan <shuah@kernel.org>,
	Jesse Taube <jesse@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Deepak Gupta <debug@rivosinc.com>,
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
	Ravi Bangoria <ravi.bangoria@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH 0/8] riscv: add initial support for hardware breakpoints
Date: Fri, 22 Aug 2025 10:47:07 -0700
Message-ID: <20250822174715.1269138-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_104721_816898_663014DF 
X-CRM114-Status: GOOD (  13.25  )
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

 arch/riscv/Kconfig                            |   2 +
 arch/riscv/include/asm/bug.h                  |  12 -
 arch/riscv/include/asm/hw_breakpoint.h        |  59 ++
 arch/riscv/include/asm/insn.h                 | 132 ++-
 arch/riscv/include/asm/kdebug.h               |   3 +-
 arch/riscv/include/asm/processor.h            |   4 +
 arch/riscv/include/asm/sbi.h                  |  33 +-
 arch/riscv/include/uapi/asm/ptrace.h          |   9 +
 arch/riscv/kernel/Makefile                    |   2 +
 arch/riscv/kernel/hw_breakpoint.c             | 763 ++++++++++++++++++
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
 .../selftests/riscv/breakpoints/Makefile      |  13 +
 .../riscv/breakpoints/breakpoint_test.c       | 246 ++++++
 24 files changed, 1641 insertions(+), 191 deletions(-)
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
