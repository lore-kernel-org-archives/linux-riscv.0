Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234E0C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 07:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NT/VNyVXmLSzy+RO++xcYcg0Uf0HcJqHw3dxgfNYybA=; b=EaZcUOZXpuALns
	mmO1qYteTWQo4uwn6tkrWmu/FIcV+HD23lc3SeO1tqlKAP9KRAvH4BxdSq7okwiGiLnXBb3Pxigf2
	RO5QennnmZfVdUJucOe7WgyGAB5n80v0e0MAGDIztQnKNxFCc8woBXYudpnMGmA/L9gKHqUaNnNK5
	UhKWLsxxbjE+DC559GAE6EaCSIzi3Tf3xgmzy2RC3WPBIzSfkxhjxK0LwJTvy47sSS22Va+Cn2to7
	nZnUAjSQsf63ZcG0Hneo+Crhgvu+O9NnR7bigpKxoc4hoEjwXc4xlaDEV1f+O9HbBJsRdOswI4PeQ
	iB3Y43o9wQ1wNgDXiylg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSuD5-00736x-2O;
	Thu, 25 Jan 2024 07:31:39 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rStDZ-006kB9-1F
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 06:28:08 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5ca29c131ebso4636262a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 22:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706164081; x=1706768881; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QXTHyjxL8kR5Po7d+GYATRHdwro/16lDMpxqrKjx/Ag=;
        b=a8C3K8Z9WcPoXdTNSi0armsRZ89XulqArZeSiD/Ct7ZNhm5noV45Pp1ovb90ovd7Py
         pSRlAiADUX++BLczS39Ut0aqw4FzB6Muyyxqlcq6m0gZR/uPEyPfg/cO9CRg8Hb+2c+0
         6Y+nEwurNHkH39leqEsNiOUdLCRkrVQwGavNPBLs7weauY+POWfIBUQGCzAj2/l2OF3Y
         ajuhyMG8pwC6vETJCoJVPR3+/Bqxgx9WVJJKzz3P9owxvvQgHEtv5c/XZydGOk2vBOrQ
         aCq24upLImSvnTn3nL0l/izTcScvio9MCujkjHVkLUK5XnK3tEMFK7CNC++lqG7uiBNE
         HAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706164081; x=1706768881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QXTHyjxL8kR5Po7d+GYATRHdwro/16lDMpxqrKjx/Ag=;
        b=KVWoF8sSfbIRNk6SgIV9bnZAv1iQq/0KkDfJmzsAhT5tMTZerz8UDVtXP0EJ7w92fT
         jvvIelirAITQL9qC1vBbZCpf/VB7pEZmZXh3lXaeEaA6L1pbLW/Ojf4A4I3mPFAyxpHl
         4AKaWQjaxWsXvuRmNJd95LQFG8PSyC8YLDjcM6StW4O0L6bB3l9vFkecBYfjqWnZeG+/
         RNys3S6XYXJHJNzkk5A0fbckjJSZdp2HNxeLqvvyRdH4UAWEr+HYmvlQ3UQay1LNcggl
         0GdQvJ4wyQ+bKrTZN191Rpp3p/jpIwOzvoawRoad1Iyf4LkedtaI1FlM8ZJwkbYxkyS7
         DadA==
X-Gm-Message-State: AOJu0YzerBwZY74fSaG7/8HDjTkcmdS876W9uMTKwy0M89UOtVMnB/Hn
	2v+MJMy3VLI8SaNdaZCOwqWXp7c/gzNTXlA41pNcNVTrBbxfYHgXDdb4UCUL+so=
X-Google-Smtp-Source: AGHT+IHI/WMAhl2PB+/aXrDdR8LPiiPrRqLK2yfdwW0qIQIbS5kaetCk3DdXJz5Rd4D4N6P34jxx3A==
X-Received: by 2002:a05:6a20:938f:b0:19b:211a:e62d with SMTP id x15-20020a056a20938f00b0019b211ae62dmr712796pzh.25.1706164080770;
        Wed, 24 Jan 2024 22:28:00 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id t19-20020a056a00139300b006dd870b51b8sm3201139pfg.126.2024.01.24.22.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 22:28:00 -0800 (PST)
From: debug@rivosinc.com
To: rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com
Cc: corbet@lwn.net,
	aou@eecs.berkeley.edu,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	waylingii@gmail.com,
	greentime.hu@sifive.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	shikemeng@huaweicloud.com,
	david@redhat.com,
	charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn,
	willy@infradead.org,
	vincent.chen@sifive.com,
	andy.chiu@sifive.com,
	gerg@kernel.org,
	jeeheng.sia@starfivetech.com,
	mason.huo@starfivetech.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	ruscur@russell.cc,
	bgray@linux.ibm.com,
	alx@kernel.org,
	baruch@tkos.co.il,
	zhangqing@loongson.cn,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	joey.gouly@arm.com,
	shr@devkernel.io,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH v1 00/28] riscv control-flow integrity for usermode
Date: Wed, 24 Jan 2024 22:21:25 -0800
Message-ID: <20240125062739.1339782-1-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_222806_351467_FCF575DB 
X-CRM114-Status: GOOD (  17.97  )
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

From: Deepak Gupta <debug@rivosinc.com>

It's been almost an year since I posted my last patch series [1] to
enable CPU assisted control-flow integrity for usermode on riscv. A lot
has changed since then and so has the patches. It's been a while and since
this is a reboot of series, starting with RFC and v1.

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

Deepak Gupta (27):
  riscv: abstract envcfg CSR
  riscv: envcfg save and restore on trap entry/exit
  riscv: define default value for envcfg
  riscv/Kconfig: enable HAVE_EXIT_THREAD for riscv
  riscv: zicfiss/zicfilp enumeration
  riscv: zicfiss/zicfilp extension csr and bit definitions
  riscv: kernel handling on trap entry/exit for user cfi
  mm: Define VM_SHADOW_STACK for RISC-V
  mm: abstract shadow stack vma behind `arch_is_shadow_stack`
  riscv/mm : Introducing new protection flag "PROT_SHADOWSTACK"
  riscv: Implementing "PROT_SHADOWSTACK" on riscv
  riscv mm: manufacture shadow stack pte
  riscv mmu: teach pte_mkwrite to manufacture shadow stack PTEs
  riscv mmu: write protect and shadow stack
  riscv/mm: Implement map_shadow_stack() syscall
  riscv/shstk: If needed allocate a new shadow stack on clone
  prctl: arch-agnostic prtcl for indirect branch tracking
  riscv: Implements arch agnostic shadow stack prctls
  riscv: Implements arch argnostic indirect branch tracking prctls
  riscv/traps: Introduce software check exception
  riscv sigcontext: adding cfi state field in sigcontext
  riscv signal: Save and restore of shadow stack for signal
  riscv: select config for shadow stack and landing pad instr support
  riscv/ptrace: riscv cfi status and state via ptrace and in core files
  riscv: Documentation for landing pad / indirect branch tracking
  riscv: Documentation for shadow stack on riscv
  kselftest/riscv: kselftest for user mode cfi

Mark Brown (1):
  prctl: arch-agnostic prctl for shadow stack

 Documentation/arch/riscv/zicfilp.rst          | 104 ++++
 Documentation/arch/riscv/zicfiss.rst          | 169 ++++++
 arch/riscv/Kconfig                            |  16 +
 arch/riscv/include/asm/asm-prototypes.h       |   1 +
 arch/riscv/include/asm/cpufeature.h           |  18 +
 arch/riscv/include/asm/csr.h                  |  20 +
 arch/riscv/include/asm/hwcap.h                |   2 +
 arch/riscv/include/asm/mman.h                 |  42 ++
 arch/riscv/include/asm/pgtable.h              |  32 +-
 arch/riscv/include/asm/processor.h            |   2 +
 arch/riscv/include/asm/thread_info.h          |   4 +
 arch/riscv/include/asm/usercfi.h              | 106 ++++
 arch/riscv/include/uapi/asm/ptrace.h          |  18 +
 arch/riscv/include/uapi/asm/sigcontext.h      |   5 +
 arch/riscv/kernel/Makefile                    |   2 +
 arch/riscv/kernel/asm-offsets.c               |   6 +-
 arch/riscv/kernel/cpufeature.c                |   4 +-
 arch/riscv/kernel/entry.S                     |  32 ++
 arch/riscv/kernel/process.c                   |  16 +
 arch/riscv/kernel/ptrace.c                    |  83 +++
 arch/riscv/kernel/signal.c                    |  45 ++
 arch/riscv/kernel/sys_riscv.c                 |  19 +
 arch/riscv/kernel/traps.c                     |  38 ++
 arch/riscv/kernel/usercfi.c                   | 497 ++++++++++++++++++
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
 40 files changed, 2050 insertions(+), 11 deletions(-)
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
