Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACF0CD1283
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 04:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Uua7xZTboMQWd4cBmUwOH5r7Lsx5e/KE9Vntd+/8lgQ=; b=q5wZQ4kkHelFyE
	A60jC+q8ztMjXRPfwKbHZKRe47mEupAEDKCXIXlLU85cpdFDVnbRde96oiHidAXf033S+FBUk6+Sh
	6KSkGmwUMtKboSD/U8RrrqFpDyJbqxGhYicXPmyoDtP8t9/H6m6Kwm0hLdaiYW/YUROdFMMUZKNx1
	xjksQom2pCy/yvEUblCW7T3ejPvtkUHycx15Cti6RgIPLmqsMzJ2rb7D3BqNQcuqYCZlM0fl+JCWX
	V8jMf0NAG2AmEQ1ptTI+SN5+T3JPRYW7y1u+jnrqt3J+KHfqCW1tbEG/8CiHfRgP/iXT951oMqfvX
	UHwJu9UpTVtRjTig1stA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq478-0000000GmqO-2RZe;
	Fri, 29 Mar 2024 04:45:14 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq474-0000000Gmoc-2Tic
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 04:45:12 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6e6ce0702c3so789775a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 21:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687508; x=1712292308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EqtDO42QHAr23qi0CzfGPQCsTN5H+bnmkZbW5sqZyb4=;
        b=wYtRWk79X4VqkSCq7I1LmoBE3dTBuV8iOvRuh7lIjSLvdw9IPlhPYe2ensYxQi7z8H
         WrfhPineO4QqKXC5a1QGzD1Roq7emU8Asr75xhQLiiHOAXjdmfNe9n48djda2DwMA0+9
         qA8K9hztHsn4xOkIcHOxBWDdGZ4qfEBaaBr9oC+hTxPrEnXmPB9dEriGgpEjgGfmQjew
         7ObBxkj/QpfltJJjAGmfWOv/Cbh6MhQxQIq/vj0BO/waZSqB0LGsJGOdjfqTPJOTJ8BA
         lsKa+2JpLunUQV9P7yc0EUs/+VgfAuWtU/ttJj7ZNDmyRyCgnqqa+ADXC8vbZmcEMoLW
         6CXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687508; x=1712292308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqtDO42QHAr23qi0CzfGPQCsTN5H+bnmkZbW5sqZyb4=;
        b=IU9dusIkayMBTahVO7QwS/2duoZoizVIdL2QMT/Gh/my0YZTyJjhpf206aYWsgmyTr
         6GztLJlcGxcTjDAuX9UvmjhiuXczqSu0xgf8U9wijzNS8m3+CHPLnLkGoV/wu71Pn9jZ
         8CqJ/3OWyTdAZtykNeKib45sfzAMN9PlhtmXqU1+21EF2ySx8mrowVsOYiwqDA3H1KrB
         3opWo8t5ygADj6Y7xjAnR5jwUpUdwjX8jJMEXBqqZcUvXZtYFAcT3K79vb7IdebUgSxI
         KT8iiBW26mSSzpabwrfKwAfGDiKvYSLCTZKF9iMcOm//DJbMTfYCt35weWP/DlqkEi5/
         995Q==
X-Forwarded-Encrypted: i=1; AJvYcCXuRlv5mzkupUKVAtM0dmHwE4OKhZFcdMOfAJI+iMZmC5fpx81p0EwlImhd0yofhUHtRCpFv4D2tShafA/b5OMJJ3rstOkilVAGHOoCAE+W
X-Gm-Message-State: AOJu0YxGMe8RgPJAGOjHmybiutgWg+8MnQ5tNIkh64EGHmgJamgfjdGv
	JVSXGvObI5iT1GUL/JMSp3xD4OPTQZrlJaszdpbj7PTuf2deSoKNpw1s6wqjIXs=
X-Google-Smtp-Source: AGHT+IGk8Phd46dcfosR9Oo5hXv/PvR5tBNwvT90McPidSgaKVOwDwxJqZMjb6jIVw0g1/5CoCMZaA==
X-Received: by 2002:a05:6870:328a:b0:22a:f03:8259 with SMTP id q10-20020a056870328a00b0022a0f038259mr1171868oac.41.1711687507664;
        Thu, 28 Mar 2024 21:45:07 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:45:07 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: corbet@lwn.net,
	tech-j-ext@lists.risc-v.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v2 00/27] riscv control-flow integrity for usermode
Date: Thu, 28 Mar 2024 21:44:32 -0700
Message-Id: <20240329044459.3990638-1-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_214510_756250_37D435DB 
X-CRM114-Status: GOOD (  19.15  )
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

I had sent RFC patchset early this year (January) [7] to enable CPU assisted
control-flow integrity for usermode on riscv. Since then I've been able to do
more testing of the changes. As part of testing effort, compiled a rootfs with
shadow stack and landing pad enabled (libraries and binaries) and booted to
shell. As part of long running tests, I have been able to run some spec 2006
benchmarks [8] (here link is provided only for list of benchmarks that were
tested for long running tests, excel sheet provided here actually is for some
static stats like code size growth on spec binaries). Thus converting from RFC
to regular patchset.

Securing control-flow integrity for usermode requires following

    - Securing forward control flow : All callsites must reach
      reach a target that they actually intend to reach.

    - Securing backward control flow : All function returns must
      return to location where they were called from.

This patch series use riscv cpu extension `zicfilp` [2] to secure forward
control flow and `zicfiss` [2] to secure backward control flow. `zicfilp`
enforces that all indirect calls or jmps must land on a landing pad instr
and label embedded in landing pad instr must match a value programmed in
`x7` register (at callsite via compiler). `zicfiss` introduces shadow stack
which can only be writeable via shadow stack instructions (sspush and
ssamoswap) and thus can't be tampered with via inadvertent stores. More
details about extension can be read from [2] and there are details in
documentation as well (in this patch series).

Using config `CONFIG_RISCV_USER_CFI`, kernel support for riscv control flow
integrity for user mode programs can be compiled in the kernel.

Enabling of control flow integrity for user programs is left to user runtime
(specifically expected from dynamic loader). There has been a lot of earlier
discussion on the enabling topic around x86 shadow stack enabling [3, 4, 5] and
overall consensus had been to let dynamic loader (or usermode) to decide for
enabling the feature.

This patch series introduces arch agnostic `prctls` to enable shadow stack
and indirect branch tracking. And implements them on riscv. arm64 is expected
to implement shadow stack part of these arch agnostic `prctls` [6]

Changes since last time
***********************

Spec changes
------------
- Forward cfi spec has become much simpler. `lpad` instruction is pseudo for
  `auipc rd, <20bit_imm>`. `lpad` checks x7 against 20bit embedded in instr.
  Thus label width is 20bit.

- Shadow stack management instructions are reduced to
    sspush - to push x1/x5 on shadow stack
    sspopchk - pops from shadow stack and comapres with x1/x5.
    ssamoswap - atomically swap value on shadow stack.
    rdssp - reads current shadow stack pointer

- Shadow stack accesses on readonly memory always raise AMO/store page fault.
  `sspopchk` is load but if underlying page is readonly, it'll raise a store
  page fault. It simplifies hardware and kernel for COW handling for shadow
  stack pages.

- riscv defines a new exception type `software check exception` and control flow
  violations raise software check exception.

- enabling controls for shadow stack and landing are in xenvcfg CSR and controls
  lower privilege mode enabling. As an example senvcfg controls enabling for U and
  menvcfg controls enabling for S mode.

core mm shadow stack enabling
-----------------------------
Shadow stack for x86 usermode are now in mainline and thus this patch
series builds on top of that for arch-agnostic mm related changes. Big
thanks and shout out to Rick Edgecombe for that.

selftests
---------
Created some minimal selftests to test the patch series.


[1] - https://lore.kernel.org/lkml/20230213045351.3945824-1-debug@rivosinc.com/
[2] - https://github.com/riscv/riscv-cfi
[3] - https://lore.kernel.org/lkml/ZWHcBq0bJ+15eeKs@finisterre.sirena.org.uk/T/#mb121cd8b33d564e64234595a0ec52211479cf474
[4] - https://lore.kernel.org/all/20220130211838.8382-1-rick.p.edgecombe@intel.com/
[5] - https://lore.kernel.org/lkml/CAHk-=wgP5mk3poVeejw16Asbid0ghDt4okHnWaWKLBkRhQntRA@mail.gmail.com/
[6] - https://lore.kernel.org/linux-mm/20231122-arm64-gcs-v7-2-201c483bd775@kernel.org/
[7] - https://lore.kernel.org/lkml/20240125062739.1339782-1-debug@rivosinc.com/
[8] - https://docs.google.com/spreadsheets/d/1_cHGH4ctNVvFRiS7hW9dEGKtXLAJ3aX4Z_iTSa3Tw2U/edit#gid=0

Deepak Gupta (26):
  riscv: envcfg save and restore on task switching
  riscv: define default value for envcfg
  riscv/Kconfig: enable HAVE_EXIT_THREAD for riscv
  riscv: zicfiss/zicfilp enumeration
  riscv: zicfiss/zicfilp extension csr and bit definitions
  riscv: usercfi state for task and save/restore of CSR_SSP on trap
    entry/exit
  mm: Define VM_SHADOW_STACK for RISC-V
  mm: abstract shadow stack vma behind `arch_is_shadow_stack`
  riscv/mm : ensure PROT_WRITE leads to VM_READ | VM_WRITE
  riscv mm: manufacture shadow stack pte
  riscv mmu: teach pte_mkwrite to manufacture shadow stack PTEs
  riscv mmu: write protect and shadow stack
  riscv/mm: Implement map_shadow_stack() syscall
  riscv/shstk: If needed allocate a new shadow stack on clone
  prctl: arch-agnostic prtcl for indirect branch tracking
  riscv: Implements arch agnostic shadow stack prctls
  riscv: Implements arch argnostic indirect branch tracking prctls
  riscv/kernel: update __show_regs to print shadow stack register
  riscv/traps: Introduce software check exception
  riscv sigcontext: adding cfi state field in sigcontext
  riscv signal: Save and restore of shadow stack for signal
  riscv/ptrace: riscv cfi status and state via ptrace and in core files
  riscv: create a config for shadow stack and landing pad instr support
  riscv: Documentation for landing pad / indirect branch tracking
  riscv: Documentation for shadow stack on riscv
  kselftest/riscv: kselftest for user mode cfi

Mark Brown (1):
  prctl: arch-agnostic prctl for shadow stack

 Documentation/arch/riscv/zicfilp.rst          | 104 ++++
 Documentation/arch/riscv/zicfiss.rst          | 169 ++++++
 .../devicetree/bindings/riscv/extensions.yaml |  10 +
 arch/riscv/Kconfig                            |  19 +
 arch/riscv/include/asm/asm-prototypes.h       |   1 +
 arch/riscv/include/asm/cpufeature.h           |  13 +
 arch/riscv/include/asm/csr.h                  |  18 +
 arch/riscv/include/asm/hwcap.h                |   2 +
 arch/riscv/include/asm/mman.h                 |  24 +
 arch/riscv/include/asm/pgtable.h              |  32 +-
 arch/riscv/include/asm/processor.h            |   2 +
 arch/riscv/include/asm/switch_to.h            |  10 +
 arch/riscv/include/asm/thread_info.h          |   4 +
 arch/riscv/include/asm/usercfi.h              | 118 ++++
 arch/riscv/include/uapi/asm/ptrace.h          |  18 +
 arch/riscv/include/uapi/asm/sigcontext.h      |   5 +
 arch/riscv/kernel/Makefile                    |   2 +
 arch/riscv/kernel/asm-offsets.c               |   4 +
 arch/riscv/kernel/cpufeature.c                |   2 +
 arch/riscv/kernel/entry.S                     |  29 +
 arch/riscv/kernel/process.c                   |  35 +-
 arch/riscv/kernel/ptrace.c                    |  83 +++
 arch/riscv/kernel/signal.c                    |  45 ++
 arch/riscv/kernel/sys_riscv.c                 |  11 +
 arch/riscv/kernel/traps.c                     |  38 ++
 arch/riscv/kernel/usercfi.c                   | 510 ++++++++++++++++++
 arch/riscv/mm/init.c                          |   2 +-
 arch/riscv/mm/pgtable.c                       |  21 +
 include/linux/mm.h                            |  35 +-
 include/uapi/asm-generic/mman.h               |   1 +
 include/uapi/linux/elf.h                      |   1 +
 include/uapi/linux/prctl.h                    |  49 ++
 kernel/sys.c                                  |  60 +++
 mm/gup.c                                      |   5 +-
 mm/internal.h                                 |   2 +-
 mm/mmap.c                                     |   1 +
 tools/testing/selftests/riscv/Makefile        |   2 +-
 tools/testing/selftests/riscv/cfi/Makefile    |  10 +
 .../testing/selftests/riscv/cfi/cfi_rv_test.h |  85 +++
 .../selftests/riscv/cfi/riscv_cfi_test.c      |  91 ++++
 .../testing/selftests/riscv/cfi/shadowstack.c | 376 +++++++++++++
 .../testing/selftests/riscv/cfi/shadowstack.h |  39 ++
 42 files changed, 2077 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/arch/riscv/zicfilp.rst
 create mode 100644 Documentation/arch/riscv/zicfiss.rst
 create mode 100644 arch/riscv/include/asm/mman.h
 create mode 100644 arch/riscv/include/asm/usercfi.h
 create mode 100644 arch/riscv/kernel/usercfi.c
 create mode 100644 tools/testing/selftests/riscv/cfi/Makefile
 create mode 100644 tools/testing/selftests/riscv/cfi/cfi_rv_test.h
 create mode 100644 tools/testing/selftests/riscv/cfi/riscv_cfi_test.c
 create mode 100644 tools/testing/selftests/riscv/cfi/shadowstack.c
 create mode 100644 tools/testing/selftests/riscv/cfi/shadowstack.h

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
