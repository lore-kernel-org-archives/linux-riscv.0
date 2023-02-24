Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEDBC7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 17:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qOn/vH9FyfwkxeSiw0puyuN6XzhTKrZYC1udpdEO7/A=; b=Z2913N6IOCR9ZQ
	00JnAzL0H85RUbXeZOM+RDI5wxlpPYYukcRmT7SZwXdx+Iet2SSwAsi7hPb++niM4OApsUv/dNYgO
	fXhIgWmiKycWny8MOPTsnC4Lob2fwQQZLOD3S8JwLLKY+E80M7QrLqXil4VoPp8mJ6+bT24xTI8XW
	JhShvjdXIECgU/8xud3nViKp2gmIpn4gR/IuEO80qfhWcz8+YZ4oNn9CoVcdUKy28E4LvpyZs6FMD
	d/sPireavSxA8kUHpChrRgs/zZ3qBre8dPQFlMWYzxtGT5oWU5CYWAo3btHrsvFydGol/cmbWifgd
	/9vrVpLoAEY9oGpco2Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbRy-003D76-DL; Fri, 24 Feb 2023 17:01:38 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbRu-003D5J-Qw
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 17:01:36 +0000
Received: by mail-pj1-x102d.google.com with SMTP id x20-20020a17090a8a9400b00233ba727724so6605111pjn.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 09:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OsUGB0DM/EiiUwXAQcVEgLH8TGWRtNqL6vxbqH7OVo=;
        b=JIPMLWSGDhKDadytb+Yq6QtkIkqpab2OQNMC3f22PfuwaAK6/O2xr4bjf31zUCD26c
         a67Dm0MW0b3MmIVJuO24a63gx+wX/J3KL7iesj1vAbNl96M3Xe/72tly/a08UXBj4o5Y
         YiP45hLstSv3s0L9jtN3CnT8AS/NRfxaMRrgUkbf5clD3w7FeqOq0WgUyATrFC/+vj+X
         TQHMTNaPnIkJOFOu9tvTikWd0Nj341wu23MbPcCJscefc32HuQbuGreP78IDIk9fX1Db
         F7LrHGulKl+vbpfuYnhuVPG24f/NZmuUTk2KS6ZFCfhqcWFAXoabP7eiSIL8Y9vlESDy
         S0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9OsUGB0DM/EiiUwXAQcVEgLH8TGWRtNqL6vxbqH7OVo=;
        b=3wQQmFqCqAlHBrUQgw/bIr52KbHgA2l5CwiubZO3dMNCgBGkV2BNhxgwKxI2fao8j8
         vSu50Lur8ECEwOOA5FvKBfM04q+lRyHwurm4NZ02xqvlJqcGKorTw1dyIhON/KQbqBZE
         sz54B5nnWSofRSJh3p8qDoXwFtzG/gAzbqXSXWmyD4Nwz8uNXuoEgHLBuin3c3P4+kW5
         jUEzqoP9zNBv95alCrGQyW9w5o3pPQius3m4d/7a/gSJPWVD9L0RkSdx2ZTygTVZfVOC
         kvY/ViIl7FkqrD14H1Pc5f3rcvqFG9eV6TgXgj3HTZWJjX0aUcfDCrmKPxxhho4Ra6dO
         ob2g==
X-Gm-Message-State: AO0yUKXxEaRf7am5/AUlu8/dQH+/3gO2sukTUKwbCN/3GjYaJPwIQ0R3
	VyDGv5Qmk+8SwgRnAAnvj3HIOQS2CZqZpnMHqLh0l/sZ2WrQKb22HZ7NR5CVdWy+YZyV2BfLJpb
	gt0PeNkJ066AUSnLGZIJJpoMf7wv8/JUnbQCan2YtxPPyb2bcijK4jx2cQ7zjvg0nkOePk9STgm
	OvOnJnm69RnA==
X-Google-Smtp-Source: AK7set/nrRorxSIKMA+SQdafg1ljH+AIDgFjqQ2u1+/IO+vMC8iqPATfQgIcqiNr5iN+Z8SY+4JRQQ==
X-Received: by 2002:a17:90a:190d:b0:237:50b6:9838 with SMTP id 13-20020a17090a190d00b0023750b69838mr8643813pjg.45.1677258090495;
        Fri, 24 Feb 2023 09:01:30 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id b12-20020a170902b60c00b0019472226769sm9234731pls.251.2023.02.24.09.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 09:01:29 -0800 (PST)
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
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH -next v14 00/19] riscv: Add vector ISA support
Date: Fri, 24 Feb 2023 17:00:59 +0000
Message-Id: <20230224170118.16766-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_090134_880616_22248B34 
X-CRM114-Status: GOOD (  24.82  )
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
MIME-Version: 1.0
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

This patchset is rebased to v6.2-rc6 and it is tested by running several
vector programs simultaneously. It delivers signals correctly in a test
where we can see a valid ucontext_t in a signal handler, and a correct V
context returing back from it. And the ptrace interface is tested by
PTRACE_{GET,SET}REGSET. Lastly, KVM is tested by running above tests in
a guest using the same kernel image. All tests are done on a rv64gcv
virt QEMU.

Specail thanks to Conor and Vineet for kindly giving help on- and off-list.

Source tree: https://github.com/sifive/riscv-linux/tree/riscv/for-next/vector-v14
Links:
 - [1] https://lore.kernel.org/all/20220921214439.1491510-17-stillson@rivosinc.com/
 - [2] https://lore.kernel.org/all/73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com/T/#u
 - [3] https://lore.kernel.org/all/20230128082847.3055316-1-apatel@ventanamicro.com/
---
Changelog V14
 - Rebase to risc-v -next (v6.2-rc7)
 - Use TOOLCHAIN_HAS_V to detect if we can enable Vector. And refine
   KBUILD_CFLAGS to remove v from default compile option.
 - Drop illegal instruction handling patch in kvm and leave it to a
   independent series[3]. The series is currently queued for 6.3
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
 - Re-organize the series to comply with bisect-ability
 - Improve task switch with inline assembly
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

Andy Chiu (3):
  riscv: Allocate user's vector context in the first-use trap
  riscv: signal: check fp-reserved words unconditionally
  riscv: signal: validate altstack to reflect Vector

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
  riscv: Rename __switch_to_aux -> fpu
  riscv: Extending cpufeature.c to detect V-extension
  riscv: Disable Vector Instructions for kernel itself
  riscv: Enable Vector code to be built

Vincent Chen (3):
  riscv: signal: Report signal frame size to userspace via auxv
  riscv: kvm: Add V extension to KVM ISA
  riscv: KVM: Add vector lazy save/restore support

 arch/riscv/Kconfig                       |  18 ++
 arch/riscv/Makefile                      |   3 +-
 arch/riscv/include/asm/csr.h             |  18 +-
 arch/riscv/include/asm/elf.h             |   9 +
 arch/riscv/include/asm/hwcap.h           |   1 +
 arch/riscv/include/asm/insn.h            |  29 +++
 arch/riscv/include/asm/kvm_host.h        |   2 +
 arch/riscv/include/asm/kvm_vcpu_vector.h |  77 ++++++++
 arch/riscv/include/asm/processor.h       |   3 +
 arch/riscv/include/asm/switch_to.h       |   9 +-
 arch/riscv/include/asm/thread_info.h     |   3 +
 arch/riscv/include/asm/vector.h          | 167 +++++++++++++++++
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
 arch/riscv/kernel/ptrace.c               |  71 ++++++++
 arch/riscv/kernel/setup.c                |   3 +
 arch/riscv/kernel/signal.c               | 221 ++++++++++++++++++++---
 arch/riscv/kernel/traps.c                |  14 +-
 arch/riscv/kernel/vector.c               | 112 ++++++++++++
 arch/riscv/kvm/Makefile                  |   1 +
 arch/riscv/kvm/vcpu.c                    |  31 ++++
 arch/riscv/kvm/vcpu_vector.c             | 177 ++++++++++++++++++
 include/uapi/linux/elf.h                 |   1 +
 31 files changed, 1066 insertions(+), 48 deletions(-)
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
