Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95987C7EE24
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 10:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BDsd1AIWiX+gEJvSFVi0GhUHIDa6Cxxg4v5SQHvh7vk=; b=HKW9JNIwG2js8m
	H24WJyG4NMN93cRxLmykjPFuuW/qd30YriBtCon/hnOcp+W5ebvfvVVpTBkkS+XIypNt8N2CMxLLC
	9PDlSaHM7YqCeD/vn5NkDifdGT3aB9/ZCEe/T5Nm275ZS16hGsU3YfN7kN2/wjARfNGyf0lPlqFGn
	rMF99hCFMqQVbubMKgegZJdgTpvjqSw9PlOvV7CcGLsqHed2ZSUjANlNWCr3pb7Ik/QjCv9D5aKa9
	/y7BQ/Celo6B2QrKGJRD4g3ZwluqrYeZIgtYv6RWM3a9UNei7GLRHiLyh86Uftm7w2oAF9HZTvp+A
	9+B5TFKWVybMeXW2dMRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKcn-002se5-1G;
	Tue, 09 May 2023 10:31:17 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKci-002sa3-1u
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 10:31:14 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6434e263962so4274030b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 03:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683628268; x=1686220268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7dh+k6V02cyI7OPFfCN+08dONMqMpHYTjseiNbl3eo=;
        b=iLkoM8zk6OHy1oDfhe/NCGvhnigGfGqWynqEkoeoZRVkRGJQo0F5g2T2v52XMv4pJA
         iSOrsM6NHJWcC7Sx7sfyOdTSp9a/OBJPdac7IWCQjLKaRWmJc7PeByjdWqowHD727qPx
         ZB1/KHI9IKoR4gZvMmf9dEzySBmK5VrC+zuevDDoHK2CQl2Yqc9G83eRqGI7ymvX4HUW
         H7hkAeN7BSzKqJIxOzz91g8voCgyKzOaTNHXU3Kee9fHmMJUuGFr7imKCtAlDDKmAU5c
         Y0clJB7PhNn5QLHTn61029QwG+mu2TXJhdClxkgALchfurJhPDJsqSur/BO2KGLQkZRJ
         Lp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683628268; x=1686220268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y7dh+k6V02cyI7OPFfCN+08dONMqMpHYTjseiNbl3eo=;
        b=JDDrzpfFV27S975GmX3BIRayGvk26cY/aa62TIdzCt8AdqFtiKn9MfpiZ+AoiOVMWy
         Y4MZcLYwQgpVxgiDL+jCIfV1+EQfMyRdXP33Q0eyZEnznK9kc5H/1L076VpfcMp/FsBm
         /ZI72ZH5/sOhyyOS7ZbQPTSTzJ0/dgvj5ICoADbmi/8NByvfssZTtqK0/T79E+7sFwvw
         DXEwDc0sYeCQskR+FrrFxsVdKZ1eDT0eCYWvQXgCLyetCE2weGdIV4Q8syOhQb7z0x3G
         m07QoCvufMgciBUci+0GOkI8kz1iF1wNqfIpfdkLccPpKhN6z/LgpoJL9/gon0JsUc2p
         rX2A==
X-Gm-Message-State: AC+VfDwXRivsmP3Vf4ThXLNhDS+LFSmrlW20xjnM0CMRLCEZDqn9lNg/
	BcSwt+3YOpHU+/qxGkkQgfyt/NfPPv2UiSiyrBKDQK+XTYJ52nHfhAI/1Xa1LPrSBr4BFOqslMx
	eyaepS/W7/N4I250rCC9JeHohlzKsIIZjbX21HRiTCOK6LXOXgXzpx4ytb+SIzOcxiP9YwwVt8p
	izqiWTbgJ8uBKo
X-Google-Smtp-Source: ACHHUZ7NG1ZfaP8XhBc7DUf1Ft/6K2hlpwz/kMHoDS+3sqj5YrzS414VkoicLGuIAuS6aptBY3W9RQ==
X-Received: by 2002:a17:902:c94b:b0:1ab:675:3e0c with SMTP id i11-20020a170902c94b00b001ab06753e0cmr18177250pla.33.1683628268206;
        Tue, 09 May 2023 03:31:08 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902d4cb00b001a076025715sm1195191plg.117.2023.05.09.03.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 03:31:07 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Subject: [PATCH -next v19 00/24] riscv: Add vector ISA support
Date: Tue,  9 May 2023 10:30:09 +0000
Message-Id: <20230509103033.11285-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_033112_638003_85BD27D0 
X-CRM114-Status: GOOD (  30.66  )
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

This patchset is implemented based on vector 1.0 spec to add vector support
in riscv Linux kernel. There are some assumptions for this implementations.

1. We assume all harts has the same ISA in the system.
2. We disable vector in both kernel and user space [1] by default. Only
   enable an user's vector after an illegal instruction trap where it
   actually starts executing vector (the first-use trap [2]).
3. We detect "riscv,isa" to determine whether vector is support or not.

We defined a new structure __riscv_v_ext_state in struct thread_struct to
save/restore the vector related registers. It is used for both kernel space
and user space.
 - In kernel space, the datap pointer in __riscv_v_ext_state will be
   allocated to save vector registers.
 - In user space,
	- In signal handler of user space, the structure is placed
	  right after __riscv_ctx_hdr, which is embedded in fp reserved
	  aera. This is required to avoid ABI break [2]. And datap points
	  to the end of __riscv_v_ext_state.
	- In ptrace, the data will be put in ubuf in which we use
	  riscv_vr_get()/riscv_vr_set() to get or set the
	  __riscv_v_ext_state data structure from/to it, datap pointer
	  would be zeroed and vector registers will be copied to the
	  address right after the __riscv_v_ext_state structure in ubuf.

This patchset is rebased to v6.4-rc1 and it is tested by running several
vector programs simultaneously. It delivers signals correctly in a test
where we can see a valid ucontext_t in a signal handler, and a correct V
context returing back from it. And the ptrace interface is tested by
PTRACE_{GET,SET}REGSET. Lastly, KVM is tested by running above tests in
a guest using the same kernel image. All tests are done on an rv64gcv
virt QEMU.

Source tree:
https://github.com/sifive/riscv-linux/tree/riscv/for-next/vector-v19

Links:
 - [1] https://lore.kernel.org/all/20220921214439.1491510-17-stillson@rivosinc.com/
 - [2] https://lore.kernel.org/all/73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com/T/#u
 - [3] https://lore.kernel.org/all/20230128082847.3055316-1-apatel@ventanamicro.com/

Updated patches: 6, 8, 14 (conflict), 15 (conflict), 19 (conflict), 23
New patches: 3, 20, 21, 24
Unchanged patches: 1, 2, 4, 5, 7, 9, 10, 11, 12, 13, 16, 17, 18, 22

---
Changelog V19
 - Rebase to the latest -next branch (at 6.4-rc1 ac9a786). Solve
   conflicts at patch 14, 15, and 19.
 - Add a sysctl, and prctl intefaces for userspace Vector control, and a
   document for it. (patch 20, 21, 24)
 - Add a Kconfig RISCV_V_DISABLE to set the default value of userspace
   Vector enablement status at compile-time. (patch 23)
 - Allow hwprobe interface to probe Vector. (patch 3)
 - Fix typos and commit msg at patch 6 and 8.

Changelog V18
 - Rebase to the latest -next branch (at 9c2598d)
 - patch 7: Detect inconsistent VLEN setup on an SMP system (Heiko).
 - patch 10: Add blank lines (Heiko)
 - patch 10: Return immediately in insn_is_vector() if an insn matches (Heiko)
 - patch 11: Use sizeof(vstate->datap) instead of sizeof(void*) (Eike)

Changelog V17
 - Rebase to the latest -next branch (at e45d6a5):
   - Solve conflicts at 9 and 13 due to generic entry
   - Use generic entry in do_trap_insn_illegal() trap handler

Changelog V16
 - Rebase to the latest for-next (at 4b74077):
 - Solve conflicts at 7, and 17
 - Use as-instr to detect if assembler supports .option arch directive
   and remove dependency from GAS, for both ZBB and V.
 - Cleanup code in KVM vector
 - Address issue reported by sparse
 - Refine code:
   - Fix a mixed-use of space/tab
   - Remove new lines at the end of file

Changelog V15
 - Rebase to risc-v -next (v6.3-rc1)
 - Make V depend on FD in Kconfig according to the spec and shut off v
   properly.
 - Fix a syntax error for clang build. But mark RISCV_ISA_V GAS only due
   to https://reviews.llvm.org/D123515
 - Use scratch reg in inline asm instead of t4.
 - Refine code.
 - Cleanup per-patch changelogs.

Changelog V14
 - Rebase to risc-v -next (v6.2-rc7)
 - Use TOOLCHAIN_HAS_V to detect if we can enable Vector. And refine
   KBUILD_CFLAGS to remove v from default compile option.
 - Drop illegal instruction handling patch in kvm and leave it to a
   independent series[3]. The series has merged into 6.3-rc1
 - Move KVM_RISCV_ISA_EXT_V to the end of enum to prevent potential ABI
   breaks.
 - Use PT_SIZE_ON_STACK instead of PT_SIZE to fit alignment. Also,
   remove panic log from v13 (15/19) because it is no longer relevant.
 - Rewrite insn_is_vector for better structuring (change if-else chain to
   a switch)
 - Fix compilation error in the middle of the series
 - Validate size of the alternative signal frame if V is enabled
   whenever:
     - The user call sigaltstack to update altstack
     - A signal is being delivered
 - Rename __riscv_v_state to __riscv_v_ext_state.
 - Add riscv_v_ prefix and rename rvv appropriately
 - Organize riscv_v_vsize setup code into vector.c
 - Address the issue mentioned by Heiko on !FPU case
 - Honor orignal authors that got changed accidentally in v13 4,5,6

Changelog V13
 - Rebase to latest risc-v next (v6.2-rc1)
 - vineetg: Re-organize the series to comply with bisect-ability
 - andy.chiu: Improve task switch with inline assembly
 - Re-structure the signal frame to avoid user ABI break.
 - Implemnt first-use trap and drop prctl for per-task V state
   enablement. Also, redirect this trap from hs to vs for kvm setup.
 - Do not expose V context in ptrace/sigframe until the task start using
   V. But still reserve V context for size ofsigframe reported by auxv.
 - Drop the kernel mode vector and leave it to another (future) series.

Changelog V12 (Chris)
 - rebases to some point after v5.18-rc6
 - add prctl to control per-process V state

Chnagelog V10
 - Rebase to v5.18-rc6
 - Merge several patches
 - Refine codes
 - Fix bugs
 - Add kvm vector support

Changelog V9
 - Rebase to v5.15
 - Merge several patches
 - Refine codes
 - Fix a kernel panic issue

Changelog V8
 - Rebase to v5.14
 - Refine struct __riscv_v_ext_state with struct __riscv_ctx_hdr
 - Refine has_vector into a static key
 - Defined __reserved space in struct sigcontext for vector and future extensions

Changelog V7
 - Add support for kernel mode vector
 - Add vector extension XOR implementation
 - Optimize task switch codes of vector
 - Allocate space for vector registers in start_thread()
 - Fix an illegal instruction exception when accessing vlenb
 - Optimize vector registers initialization
 - Initialize vector registers with proper vsetvli then it can work normally
 - Refine ptrace porting due to generic API changed
 - Code clean up

Changelog V6
 - Replace vle.v/vse.v instructions with vle8.v/vse8.v based on 0.9 spec
 - Add comments based on mailinglist feedback
 - Fix rv32 build error

Changelog V5
 - Using regset_size() correctly in generic ptrace
 - Fix the ptrace porting
 - Fix compile warning

Changelog V4
 - Support dynamic vlen
 - Fix bugs: lazy save/resotre, not saving vtype
 - Update VS bit offset based on latest vector spec
 - Add new vector csr based on latest vector spec
 - Code refine and removed unused macros

Changelog V3
 - Rebase linux-5.6-rc3 and tested with qemu
 - Seperate patches with Anup's advice
 - Give out a ABI puzzle with unlimited vlen

Changelog V2
 - Fixup typo "vecotr, fstate_save->vstate_save".
 - Fixup wrong saved registers' length in vector.S.
 - Seperate unrelated patches from this one.

Andy Chiu (8):
  riscv: hwprobe: Add support for RISCV_HWPROBE_BASE_BEHAVIOR_V
  riscv: Allocate user's vector context in the first-use trap
  riscv: signal: check fp-reserved words unconditionally
  riscv: signal: validate altstack to reflect Vector
  riscv: Add prctl controls for userspace vector management
  riscv: Add sysctl to set the default vector rule for new processes
  riscv: detect assembler support for .option arch
  riscv: Add documentation for Vector

Greentime Hu (9):
  riscv: Add new csr defines related to vector extension
  riscv: Clear vector regfile on bootup
  riscv: Introduce Vector enable/disable helpers
  riscv: Introduce riscv_v_vsize to record size of Vector context
  riscv: Introduce struct/helpers to save/restore per-task Vector state
  riscv: Add task switch support for vector
  riscv: Add ptrace vector support
  riscv: signal: Add sigcontext save/restore for vector
  riscv: prevent stack corruption by reserving task_pt_regs(p) early

Guo Ren (4):
  riscv: Rename __switch_to_aux() -> fpu
  riscv: Extending cpufeature.c to detect V-extension
  riscv: Disable Vector Instructions for kernel itself
  riscv: Enable Vector code to be built

Vincent Chen (3):
  riscv: signal: Report signal frame size to userspace via auxv
  riscv: kvm: Add V extension to KVM ISA
  riscv: KVM: Add vector lazy save/restore support

 Documentation/riscv/hwprobe.rst          |  10 +
 Documentation/riscv/index.rst            |   1 +
 Documentation/riscv/vector.rst           | 128 +++++++++++
 arch/riscv/Kconfig                       |  39 +++-
 arch/riscv/Makefile                      |   6 +-
 arch/riscv/include/asm/csr.h             |  18 +-
 arch/riscv/include/asm/elf.h             |   9 +
 arch/riscv/include/asm/hwcap.h           |   1 +
 arch/riscv/include/asm/hwprobe.h         |   2 +-
 arch/riscv/include/asm/insn.h            |  29 +++
 arch/riscv/include/asm/kvm_host.h        |   2 +
 arch/riscv/include/asm/kvm_vcpu_vector.h |  82 +++++++
 arch/riscv/include/asm/processor.h       |  16 ++
 arch/riscv/include/asm/switch_to.h       |   9 +-
 arch/riscv/include/asm/thread_info.h     |   3 +
 arch/riscv/include/asm/vector.h          | 184 ++++++++++++++++
 arch/riscv/include/uapi/asm/auxvec.h     |   1 +
 arch/riscv/include/uapi/asm/hwcap.h      |   1 +
 arch/riscv/include/uapi/asm/hwprobe.h    |   3 +
 arch/riscv/include/uapi/asm/kvm.h        |   8 +
 arch/riscv/include/uapi/asm/ptrace.h     |  39 ++++
 arch/riscv/include/uapi/asm/sigcontext.h |  16 +-
 arch/riscv/kernel/Makefile               |   1 +
 arch/riscv/kernel/cpufeature.c           |  13 ++
 arch/riscv/kernel/entry.S                |   6 +-
 arch/riscv/kernel/head.S                 |  41 +++-
 arch/riscv/kernel/process.c              |  19 ++
 arch/riscv/kernel/ptrace.c               |  70 ++++++
 arch/riscv/kernel/setup.c                |   3 +
 arch/riscv/kernel/signal.c               | 220 ++++++++++++++++---
 arch/riscv/kernel/smpboot.c              |   7 +
 arch/riscv/kernel/sys_riscv.c            |   9 +
 arch/riscv/kernel/traps.c                |  26 ++-
 arch/riscv/kernel/vector.c               | 266 +++++++++++++++++++++++
 arch/riscv/kvm/Makefile                  |   1 +
 arch/riscv/kvm/vcpu.c                    |  25 +++
 arch/riscv/kvm/vcpu_vector.c             | 186 ++++++++++++++++
 include/uapi/linux/elf.h                 |   1 +
 include/uapi/linux/prctl.h               |  11 +
 kernel/sys.c                             |  12 +
 40 files changed, 1474 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/riscv/vector.rst
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_vector.h
 create mode 100644 arch/riscv/include/asm/vector.h
 create mode 100644 arch/riscv/kernel/vector.c
 create mode 100644 arch/riscv/kvm/vcpu_vector.c

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
