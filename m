Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0135C76195
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 16:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4M72rGzoa0FeHKalOz3IVqhlIqFYoQ1ppP3QjTO1UPo=; b=mrVtTbTkYqp1QH
	Dn3Rzj3+YkxtQ+iAxyhOLc4A7p4LiR5hjKfPnZ0yvdG+HkJe1EIdm6aGkO/NEBc0pkcOwLl93Zr52
	Lh0UwBqZdvy3VD81549enFVqB13PDDecQT3YN/KQt6OQNAIhqfcch9quxEdgxTsVA70sV4MFCdOJ6
	//Qhjb3pCZN0d+ghSNpca/1nCeS8LxW2XH9AyxolBSNkkxkN5fqbIU+b+WqW31Rif2MfVUWLa/KFC
	c8Vcz3hAHfk+/2PwfprFbGwJZkPKozKkXVIpRSJ2PdFQxxrsHEaj67XOQbPpAGVREIDaOhOput6aH
	ys1hoGsIA33rlU5btPXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq2d-00BkuV-18;
	Mon, 27 Mar 2023 16:49:55 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq2Z-00BkqG-04
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 16:49:53 +0000
Received: by mail-pj1-x102b.google.com with SMTP id gp15-20020a17090adf0f00b0023d1bbd9f9eso12426933pjb.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 09:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679935788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tdUFmaq7u79G774KQc9ypVCe2BnAZIMgxiji5+Qs7A4=;
        b=dNW4o+xajDZvMcr0T5CXYHCOdN7vmv5s68AMCIKTHEp7itb+0wEpWGGCFre8v0OrgP
         1iSQhvN8sKhNIVtxd9OJmVbT+a+GQBO95uRnw7DMroWlZbGcCTGEOpGBeMVxJFsfClpV
         5OTXGhFrU6nJA8lladRka6pjW58FUlAK5k/Q4oV1quJOR5Sv4rKUYItT5XUNbTCtNnM1
         KYfOzBal46jMCm4KvC1glpyeKw3kGrfpG7qep8nvg8JNAvRLYsAaIH14JEfX2esOOCKC
         B7ZiQ8U6Cx7szoQuoHAPaaUpmLQc9Vo5JAZEu6yEm2O6qXkiDEG+5dmX6eQiM6mAzsZ6
         LSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679935788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdUFmaq7u79G774KQc9ypVCe2BnAZIMgxiji5+Qs7A4=;
        b=P1xmH6AjK711fyBY/Gwe7NPUa9gWxtjqv315d1RKveDzezlVwiVWSoB05RkQkaW4vo
         vgBme3zkrvvvOLYr++hlKciK0F015RJxF9Kp4Av8vjncjmtTEB5pLFnl+oZA/BEW3Eu5
         +BA93QqUhijvuQYS52bVjHKz0q1WdUNlDiF2143mgDolMVfhHRemUqo4uuUEjSzecRbM
         uIjRw2o1ZEpHMUyyQ3pLTWsmpjD2ZajTf0CiSNADhO+GFjVnHhrINyWOn0uDfy5hUbrQ
         9yCR86AMMh9thgHu5xp+QaGjNpgUZ0ktmr/vMCewxHyu20Xp7Y6UVCFwJtzVcg5zQOnh
         zrUQ==
X-Gm-Message-State: AO0yUKWh2REhzZ0Dt9EdnS7LG+Nek6iVVohOCM7JfI6or0AlQe+Z/ceY
	vbdUGNks/B20s2ATwoGmUqh1be7csT5J+G1Rcuv30JpGuiDNZfOhjR3mJk0nHwkGlDZfjaDqnwK
	7hWkVkEl33sfjDypmMHyGdUR5KlX/y9GD6n7OF+UM38tJbN++RI7TtNL5Z2Z9eBN43DJoV6o+X7
	nt31kSAiDsAqc7
X-Google-Smtp-Source: AK7set9Tv8plFf2XkmlpEpqjnzxJtZMO1dvxVpcCRU2I971Im21ranWmw31b7MwsUM2merx/s1M3dA==
X-Received: by 2002:a05:6a20:b71b:b0:d9:7af9:6a82 with SMTP id fg27-20020a056a20b71b00b000d97af96a82mr11980375pzb.9.1679935787379;
        Mon, 27 Mar 2023 09:49:47 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q20-20020a62e114000000b0061949fe3beasm19310550pfh.22.2023.03.27.09.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 09:49:46 -0700 (PDT)
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
Subject: [PATCH -next v17 00/20] riscv: Add vector ISA support
Date: Mon, 27 Mar 2023 16:49:20 +0000
Message-Id: <20230327164941.20491-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_094951_081936_1317438F 
X-CRM114-Status: GOOD (  30.21  )
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
2. We disable vector in both kernel andy user space [1] by default. Only
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

This patchset is rebased to v6.3-rc1 and it is tested by running several
vector programs simultaneously. It delivers signals correctly in a test
where we can see a valid ucontext_t in a signal handler, and a correct V
context returing back from it. And the ptrace interface is tested by
PTRACE_{GET,SET}REGSET. Lastly, KVM is tested by running above tests in
a guest using the same kernel image. All tests are done on an rv64gcv
virt QEMU.

Note: please apply the patch at [4] due to a regression introduced by
commit 596ff4a09b89 ("cpumask: re-introduce constant-sized cpumask
optimizations") before testing the series.

Meanwhile, some user space daemons have failed to start up since commit
e45d6a52fe2b ("Merge patch series "riscv: Add GENERIC_ENTRY support""). We
 managed to boot into user space then carry out tests without starting
systemd. All vector tests are passing as usual. Though it seems not
related to Vector, I am going to check if there is anything wrong on my
QEMU setup and report it if I find something.

Source tree:
https://github.com/sifive/riscv-linux/tree/riscv/for-next/vector-v17

Links:
 - [1] https://lore.kernel.org/all/20220921214439.1491510-17-stillson@rivosinc.com/
 - [2] https://lore.kernel.org/all/73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com/T/#u
 - [3] https://lore.kernel.org/all/20230128082847.3055316-1-apatel@ventanamicro.com/
 - [4] https://lore.kernel.org/all/CAHk-=wiAxtKyxs6BPEzirrXw1kXJ-7ZyGpgOrbzhmC=ud-6jBA@mail.gmail.com/
---
Changelog V17
 - A quick respin of v16.
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

Andy Chiu (4):
  riscv: Allocate user's vector context in the first-use trap
  riscv: signal: check fp-reserved words unconditionally
  riscv: signal: validate altstack to reflect Vector
  riscv: detect assembler support for .option arch

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

 arch/riscv/Kconfig                       |  28 ++-
 arch/riscv/Makefile                      |   6 +-
 arch/riscv/include/asm/csr.h             |  18 +-
 arch/riscv/include/asm/elf.h             |   9 +
 arch/riscv/include/asm/hwcap.h           |   1 +
 arch/riscv/include/asm/insn.h            |  29 +++
 arch/riscv/include/asm/kvm_host.h        |   2 +
 arch/riscv/include/asm/kvm_vcpu_vector.h |  82 +++++++++
 arch/riscv/include/asm/processor.h       |   3 +
 arch/riscv/include/asm/switch_to.h       |   9 +-
 arch/riscv/include/asm/thread_info.h     |   3 +
 arch/riscv/include/asm/vector.h          | 179 ++++++++++++++++++
 arch/riscv/include/uapi/asm/auxvec.h     |   1 +
 arch/riscv/include/uapi/asm/hwcap.h      |   1 +
 arch/riscv/include/uapi/asm/kvm.h        |   8 +
 arch/riscv/include/uapi/asm/ptrace.h     |  39 ++++
 arch/riscv/include/uapi/asm/sigcontext.h |  16 +-
 arch/riscv/kernel/Makefile               |   1 +
 arch/riscv/kernel/cpufeature.c           |  13 ++
 arch/riscv/kernel/entry.S                |   6 +-
 arch/riscv/kernel/head.S                 |  41 ++++-
 arch/riscv/kernel/process.c              |  18 ++
 arch/riscv/kernel/ptrace.c               |  70 ++++++++
 arch/riscv/kernel/setup.c                |   3 +
 arch/riscv/kernel/signal.c               | 220 ++++++++++++++++++++---
 arch/riscv/kernel/traps.c                |  26 ++-
 arch/riscv/kernel/vector.c               | 110 ++++++++++++
 arch/riscv/kvm/Makefile                  |   1 +
 arch/riscv/kvm/vcpu.c                    |  23 +++
 arch/riscv/kvm/vcpu_vector.c             | 186 +++++++++++++++++++
 include/uapi/linux/elf.h                 |   1 +
 31 files changed, 1104 insertions(+), 49 deletions(-)
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
