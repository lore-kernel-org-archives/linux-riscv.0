Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999DDC3271E
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 14:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VtPhNqbvtHFDO4ZZYeERtshq16/C11WFb1f/fEAmXhE=; b=i/KO5vCw1cF7JK
	ZNi3uQbMCK3HxPvB0pYwu6O8Du9dotPQ0PGuxMCcydc6gAtDGY7t9DYCOjNC/9gcyjT45eG8IvPTl
	GXkuzu3Joh6MNVq72KcUKAsY4PuF6Veo0erJ4dz8GSYLpyZ3BuJVRhUuAN4WMprnnMoUJBJUj/5Gt
	EzmZw1YF6wUh//E+XvTHvljFJW8Arw4A1j68flEWWsOYit705pGPy/pSNJ+4ZsyU//tLveAznABrl
	wdYv7TSQcb37IxPQFCpu6u6MsdZ7hDgTOy8z+JjQdxVOSXbF+LUIrHuHybG4jRXpl15b63hf4o0rE
	jZmXR2/hKjktM57baWyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNZx-0000000DUPD-3ZKr;
	Thu, 04 Jul 2024 14:36:57 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNZj-0000000DUKC-1aZE;
	Thu, 04 Jul 2024 14:36:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B9251CE34BE;
	Thu,  4 Jul 2024 14:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF67AC3277B;
	Thu,  4 Jul 2024 14:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720103800;
	bh=d8RBLuH5Pasj8CitSVF748rHET+zfK2JgBl1Bace8pc=;
	h=From:To:Cc:Subject:Date:From;
	b=uHzAGzTpE6j/WOHutILRZlCBD4yqe5shQQueAfrC5t1s6TFO1ajW9YIWCw1o1lmYv
	 SUG2wZ76xEdTpMTZa7IAh0GltSJmZhhBIVOIfb3HNYppr3Vk3ShI3HM6aeEAPLmGPp
	 wI6fZGozAJ1Ev68n0SKPmJaXe5Ia2+Urut3mFTwJf1VvyQM5E/1NOu2ekNGOtxBqlQ
	 u32o6+mrKKgaE/0aUSYvObtokELefUljjL3BA1YWVRS4Ask1PJUMb/XTzm3+OFdA5u
	 oF/cIqfR7xQ7XqHLH77Q2oBQrbv2ng0HGvWY2mTK5MypuAlDqGVau/J2cekYXrgyaH
	 uwiay5ttQDWMw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Christian Brauner <brauner@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-openrisc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 00/17] arch: convert everything to syscall.tbl
Date: Thu,  4 Jul 2024 16:35:54 +0200
Message-Id: <20240704143611.2979589-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_073643_804252_3B26BD9A 
X-CRM114-Status: GOOD (  21.28  )
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

From: Arnd Bergmann <arnd@arndb.de>

There are eight architectures using include/uapi/asm-generic/unistd.h,
which is still in an old format and not easily parsed by scripts.
In addition, arm64 uses the old format for the 32-bit arm compat syscalls,
despite them using the modern syscall.tbl format for the native calls.

As part of a larger cleanup, this converts all of them to use the new
format with a shared file. I was planning to post this earlier, but ended
up fixing up any system calls that have mismatched calling conventions
between kernel and userspace first, as that seemed more important.

I originally tried adding the same arch/*/kernel/syscalls/Makefile as used
on the other architectures, but ended up simplifying this in the process
to use a single set of Makefile rules in scripts/Makefile.asm-headers,
which in turn requires a few cleanups to arch/*/include/asm/Kbuild files.

Another prerequisite included in here is to make sys_clone3 get provided
on all architectures, though it remains broken and returns -ENOSYS on
hexagon, nios2, sh and sparc. To preserve the compile-time warning,
I added an explicit #warning for those that are marked broken.

Once we have the new table format in place everywhere, additional
improvements I have planned will be much easier, including:

 - generating machine-readable syscall API descriptions for each
   syscall on each architecture

 - type checking to ensure that the in-kernel prototype matches
   what userspace tools see

 - unifying the last common bits of all tables so that new syscalls
   only need to get added in one place

 - generate human-readable wrappers for native and compat syscalls
   on all architectures to replace the SYSCALL_DEFINEx() macros.

       Arnd

Arnd Bergmann (17):
  syscalls: add generic scripts/syscall.tbl
  csky: drop asm/gpio.h wrapper
  um: don't generate asm/bpf_perf_event.h
  loongarch: avoid generating extra header files
  kbuild: verify asm-generic header list
  kbuild: add syscall table generation to scripts/Makefile.asm-headers
  clone3: drop __ARCH_WANT_SYS_CLONE3 macro
  arc: convert to generic syscall table
  arm64: convert unistd_32.h to syscall.tbl format
  arm64: generate 64-bit syscall.tbl
  arm64: rework compat syscall macros
  csky: convert to generic syscall table
  hexagon: use new system call table
  loongarch: convert to generic syscall table
  nios2: convert to generic syscall table
  openrisc: convert to generic syscall table
  riscv: convert to generic syscall table

 Makefile                                      |   2 +-
 arch/alpha/include/asm/unistd.h               |   1 +
 arch/arc/include/asm/Kbuild                   |   2 +
 arch/arc/include/asm/unistd.h                 |  14 +
 arch/arc/include/uapi/asm/Kbuild              |   2 +
 arch/arc/include/uapi/asm/unistd.h            |  44 +-
 arch/arc/kernel/Makefile.syscalls             |   3 +
 arch/arc/kernel/sys.c                         |   5 +-
 arch/arm/include/asm/unistd.h                 |   1 -
 arch/arm64/include/asm/Kbuild                 |   8 +
 arch/arm64/include/asm/seccomp.h              |  13 +-
 arch/arm64/include/asm/unistd.h               |  22 +-
 arch/arm64/include/asm/unistd32.h             | 939 +-----------------
 .../include/asm/vdso/compat_gettimeofday.h    |  12 +-
 arch/arm64/include/uapi/asm/Kbuild            |   1 +
 arch/arm64/include/uapi/asm/unistd.h          |  25 +-
 arch/arm64/kernel/Makefile.syscalls           |   6 +
 arch/arm64/kernel/signal32.c                  |   2 +-
 arch/arm64/kernel/sigreturn32.S               |  18 +-
 arch/arm64/kernel/sys.c                       |   6 +-
 arch/arm64/kernel/sys32.c                     |  17 +-
 arch/arm64/kernel/syscall.c                   |   3 +-
 arch/arm64/tools/Makefile                     |   6 +-
 arch/arm64/tools/syscall_32.tbl               | 476 +++++++++
 arch/arm64/tools/syscall_64.tbl               |   1 +
 arch/csky/include/asm/Kbuild                  |   3 +-
 arch/csky/include/asm/unistd.h                |   3 +
 arch/csky/include/uapi/asm/Kbuild             |   2 +
 arch/csky/include/uapi/asm/unistd.h           |  15 +-
 arch/csky/kernel/Makefile.syscalls            |   4 +
 arch/csky/kernel/syscall_table.c              |   4 +-
 arch/hexagon/include/asm/Kbuild               |   2 +
 arch/hexagon/include/asm/unistd.h             |  10 +
 arch/hexagon/include/uapi/asm/Kbuild          |   2 +
 arch/hexagon/include/uapi/asm/unistd.h        |  13 +-
 arch/hexagon/kernel/Makefile.syscalls         |   3 +
 arch/hexagon/kernel/syscalltab.c              |   8 +-
 arch/loongarch/include/asm/Kbuild             |  17 +-
 arch/loongarch/include/asm/unistd.h           |   2 +
 arch/loongarch/include/uapi/asm/Kbuild        |   2 +
 arch/loongarch/include/uapi/asm/unistd.h      |   4 +-
 arch/loongarch/kernel/Makefile.syscalls       |   4 +
 arch/loongarch/kernel/syscall.c               |   3 +-
 arch/m68k/include/asm/unistd.h                |   1 -
 arch/microblaze/include/asm/unistd.h          |   2 +
 arch/mips/include/asm/unistd.h                |   1 -
 arch/nios2/include/asm/Kbuild                 |   2 +
 arch/nios2/include/asm/unistd.h               |  10 +
 arch/nios2/include/uapi/asm/Kbuild            |   2 +
 arch/nios2/include/uapi/asm/unistd.h          |  14 +-
 arch/nios2/kernel/Makefile.syscalls           |   3 +
 arch/nios2/kernel/syscall_table.c             |   6 +-
 arch/openrisc/include/asm/Kbuild              |   2 +
 arch/openrisc/include/asm/syscalls.h          |   4 -
 arch/openrisc/include/asm/unistd.h            |   8 +
 arch/openrisc/include/uapi/asm/Kbuild         |   2 +
 arch/openrisc/include/uapi/asm/unistd.h       |  15 +-
 arch/openrisc/kernel/Makefile.syscalls        |   3 +
 arch/openrisc/kernel/sys_call_table.c         |   9 +-
 arch/parisc/include/asm/unistd.h              |   1 -
 arch/powerpc/include/asm/unistd.h             |   1 -
 arch/riscv/include/asm/Kbuild                 |   3 +
 arch/riscv/include/asm/syscall_table.h        |   7 +
 arch/riscv/include/asm/unistd.h               |  13 +-
 arch/riscv/include/uapi/asm/Kbuild            |   2 +
 arch/riscv/include/uapi/asm/unistd.h          |  41 +-
 arch/riscv/kernel/Makefile.syscalls           |   4 +
 arch/riscv/kernel/compat_syscall_table.c      |   6 +-
 arch/riscv/kernel/syscall_table.c             |   6 +-
 arch/s390/include/asm/unistd.h                |   1 -
 arch/sh/include/asm/unistd.h                  |   2 +
 arch/sparc/include/asm/unistd.h               |   2 +
 arch/um/include/asm/Kbuild                    |   1 -
 arch/um/include/asm/bpf_perf_event.h          |   3 +
 arch/x86/include/asm/unistd.h                 |   1 -
 arch/xtensa/include/asm/unistd.h              |   1 -
 include/asm-generic/Kbuild                    |   1 -
 include/uapi/asm-generic/unistd.h             |   4 -
 kernel/fork.c                                 |   8 +-
 kernel/sys_ni.c                               |   2 -
 scripts/Makefile.asm-generic                  |  58 --
 scripts/Makefile.asm-headers                  |  98 ++
 scripts/syscall.tbl                           | 404 ++++++++
 tools/arch/arm64/include/uapi/asm/unistd.h    |   1 -
 .../arch/loongarch/include/uapi/asm/unistd.h  |   1 -
 tools/include/uapi/asm-generic/unistd.h       |   4 -
 86 files changed, 1219 insertions(+), 1271 deletions(-)
 create mode 100644 arch/arc/include/asm/unistd.h
 create mode 100644 arch/arc/kernel/Makefile.syscalls
 create mode 100644 arch/arm64/kernel/Makefile.syscalls
 create mode 100644 arch/arm64/tools/syscall_32.tbl
 create mode 120000 arch/arm64/tools/syscall_64.tbl
 create mode 100644 arch/csky/kernel/Makefile.syscalls
 create mode 100644 arch/hexagon/include/asm/unistd.h
 create mode 100644 arch/hexagon/kernel/Makefile.syscalls
 create mode 100644 arch/loongarch/kernel/Makefile.syscalls
 create mode 100644 arch/nios2/include/asm/unistd.h
 create mode 100644 arch/nios2/kernel/Makefile.syscalls
 create mode 100644 arch/openrisc/include/asm/unistd.h
 create mode 100644 arch/openrisc/kernel/Makefile.syscalls
 create mode 100644 arch/riscv/include/asm/syscall_table.h
 create mode 100644 arch/riscv/kernel/Makefile.syscalls
 create mode 100644 arch/um/include/asm/bpf_perf_event.h
 delete mode 100644 scripts/Makefile.asm-generic
 create mode 100644 scripts/Makefile.asm-headers
 create mode 100644 scripts/syscall.tbl

-- 
2.39.2

Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Guo Ren <guoren@kernel.org>
Cc: Brian Cain <bcain@quicinc.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: Jonas Bonn <jonas@southpole.se>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Stafford Horne <shorne@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-csky@vger.kernel.org
Cc: linux-hexagon@vger.kernel.org
Cc: loongarch@lists.linux.dev
Cc: linux-openrisc@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-arch@vger.kernel.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
