Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B85FC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 08:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/UeZMixt8HzHys/Rjo8PPurmN8LSb5f2ZguzlNLSD1E=; b=ZNg/xlLufluItv
	CdYvWrtLSxmXNkREr/WoXTAxC1Yzt6WJSiQ0tn7QKFZ8zyExTuUmTDdSy5Dmalh4HaZ85ImPpbaYw
	jpG3E8yaDHkW6oRhRtq0VzD3PECU96ftDb/5Ro/UK4KNJzoH/6b6m/0y5ePMuxrp2iZeRJLjQ94Z7
	eo616NV3oWhtbr1Vz3PXq8983T4mrrYBeuBWJPD/Y6IFcpcr6rqpMjCsR+no4RypsRhGaVDzoEjWP
	YjbhYvWCG7tgTEDI+s+yH0Q5w3x3u/hkZy3JhOh869iLitxqPTK4s/yIaU4dWP99ngLXXvAvcG+0j
	drlA5VRGHEU/6J2xgqgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nohky-005xH1-AT; Wed, 11 May 2022 08:31:40 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nohks-005xAv-Kb
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 08:31:36 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d17so1243459plg.0
 for <linux-riscv@lists.infradead.org>; Wed, 11 May 2022 01:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id;
 bh=flCSwADTnhHibNznOKxkN5YZDvqkcXjACBh8CD0ghHc=;
 b=c2osYj1m09jU96EtoXunit6TMalPatArjsm29Sap/I7Mx1ZoKNUk3g8oXTpiovCJhu
 zsizXHjJpW8FvWuZIwH7mhIusngtkqmFw8210hqoL23pf4zciDzn2ll5v2OqcZO8X0BB
 sZo/5JOyTBDs1X8Kzsid5z95MthVmbKGnwg2RdEYaBjYGkh9NmNzKzz3En5d7CQllXPd
 NmkcjYQIk9ulN9L65xj00EJ5k8QiFVWS5vhl2T7F1sdMZgXDmCBp3d9KP1YMI3xOZARZ
 sCs+76g8F+N4AOz8zt6yFQUvCxWaHUm+OgZAQ5R7qPI87GeHsDGLu6yTZRzBYJxp7fFq
 3LCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=flCSwADTnhHibNznOKxkN5YZDvqkcXjACBh8CD0ghHc=;
 b=WcsE+wLPNX5M42K5XqdlX3iyXsxYaqvYWVYDrtszZ/hG/r1jtaZxga7ZM/6Rd7cdtI
 MjJwryrOlGyhttdQvw4d98OM6Ua+RQTeVepK3bR2nqVyPS7Esx27NskbiWLgsoyAlUMO
 FwaWB+ZKL7gA75CjD/4WjqOV009u/E04/jHb5sENhzyWn8j4ZHkjZg1HvOEpMJCOMsWQ
 +fwh+uvu/ODl6mTCsOlko1Yd+t4dp9ZwYZJzRq65RTf7flcXJ677gpTeGcmI1qLVU5Ox
 sAhtQ4BVORgS1TcqohErgW3+M4k8gjYVOjkJ/E5JfO82UWWVoKpUmKa5rMSMoydxazj+
 KUHw==
X-Gm-Message-State: AOAM530ZkCZttgkh1+Z1EQAiPqYnGhOitxirwK4oSc68gegFsl5x45mq
 XJFota+yfe2nz6Z1glIztVA47TxEfZAgzw==
X-Google-Smtp-Source: ABdhPJwAxYdeKz6Lln3e1nl9r6NOr3gEH4mYsWwyN1oK5dEgNEn0osm0wxsWMnpjsrjH34WM1Ciqsg==
X-Received: by 2002:a17:90b:3b46:b0:1dc:b314:52e6 with SMTP id
 ot6-20020a17090b3b4600b001dcb31452e6mr4192220pjb.134.1652257889377; 
 Wed, 11 May 2022 01:31:29 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net.
 [59.124.168.89]) by smtp.gmail.com with ESMTPSA id
 m10-20020aa7900a000000b0050dc7628170sm1020202pfo.74.2022.05.11.01.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 01:31:29 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: [PATCH v10 00/16] riscv: Add vector ISA support
Date: Wed, 11 May 2022 08:31:10 +0000
Message-Id: <cover.1652257230.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_013134_769752_C1F5A155 
X-CRM114-Status: GOOD (  21.26  )
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
2. We use vector like FPU in some ways instead of using vector like a
   specific IP.
3. We disable vector in kernel space by default unless kernel uses
   kernel mode vector kernel_rvv_begin()/kernel_rvv_end().
4. We detect "riscv,isa" to determine whether vector is support or not.

We defined a new structure __riscv_v_state in struct thread_struct to save
/restore the vector related registers. It is used for both kernel space and
user space.

 - In kernel space, the datap pointer in __riscv_v_state will be allocated
   to save vector registers.
 - In user space,
        - In signal handler of user space, datap will point to the address
          of the __riscv_v_state data structure to save vector registers
          in stack. We also create a __reserved[] array in sigcontext for
          future extensions.
        - In ptrace, the data will be put in ubuf in which we use
          riscv_vr_get()/riscv_vr_set() to get or set the
          __riscv_v_state data structure from/to it, datap pointer
          would be zeroed and vector registers will be copied to the
          address right after the __riscv_v_state structure in ubuf.

This patchset also adds support for kernel mode vector, kernel XOR
implementation with vector ISA and includes several bug fixes and code
refinement.

This patchset is rebased to v5.18-rc6 and it is tested by running several
vector programs simultaneously. It also can get the correct ucontext_t in
signal handler and restore correct context after sigreturn. It is also
tested with ptrace() syscall to use PTRACE_GETREGSET/PTRACE_SETREGSET to
get/set the vector registers.

TODO
1. Refine the __riscv_v_state allocation in start_thread()
2. Refine the vector context switching functions by lazy save/restore
3. Add AMP support. To support harts with different ISA

 [1] https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc

---
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
 - Refine struct __riscv_v_state with struct __riscv_ctx_hdr
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

Greentime Hu (9):
  riscv: Add new csr defines related to vector extension
  riscv: Add has_vector/riscv_vsize to save vector features.
  riscv: Add vector struct and assembler definitions
  riscv: Add task switch support for vector
  riscv: Add ptrace vector support
  riscv: Add sigcontext save/restore for vector
  riscv: Add support for kernel mode vector
  riscv: Add vector extension XOR implementation
  riscv: Fix a kernel panic issue if $s2 is set to a specific value
    before entering Linux

Guo Ren (4):
  riscv: Rename __switch_to_aux -> fpu
  riscv: Extending cpufeature.c to detect V-extension
  riscv: Add vector feature to compile
  riscv: Reset vector register

Vincent Chen (3):
  riscv: signal: Report signal frame size to userspace via auxv
  riscv: Add V extension to KVM ISA allow list
  riscv: KVM: Add vector lazy save/restore support

 arch/riscv/Kconfig                       |  10 ++
 arch/riscv/Makefile                      |   1 +
 arch/riscv/include/asm/csr.h             |  16 ++-
 arch/riscv/include/asm/elf.h             |  41 +++---
 arch/riscv/include/asm/hwcap.h           |   1 +
 arch/riscv/include/asm/kvm_host.h        |   2 +
 arch/riscv/include/asm/kvm_vcpu_vector.h |  65 +++++++++
 arch/riscv/include/asm/processor.h       |   3 +
 arch/riscv/include/asm/switch_to.h       |  72 +++++++++-
 arch/riscv/include/asm/vector.h          |  17 +++
 arch/riscv/include/asm/xor.h             |  82 +++++++++++
 arch/riscv/include/uapi/asm/auxvec.h     |   1 +
 arch/riscv/include/uapi/asm/hwcap.h      |   1 +
 arch/riscv/include/uapi/asm/kvm.h        |   6 +
 arch/riscv/include/uapi/asm/ptrace.h     |  23 +++
 arch/riscv/include/uapi/asm/sigcontext.h |  24 ++++
 arch/riscv/kernel/Makefile               |   2 +
 arch/riscv/kernel/asm-offsets.c          |  15 ++
 arch/riscv/kernel/cpufeature.c           |  18 +++
 arch/riscv/kernel/entry.S                |   6 +-
 arch/riscv/kernel/head.S                 |  37 ++++-
 arch/riscv/kernel/kernel_mode_vector.c   | 132 +++++++++++++++++
 arch/riscv/kernel/process.c              |  43 ++++++
 arch/riscv/kernel/ptrace.c               |  71 ++++++++++
 arch/riscv/kernel/riscv_ksyms.c          |   6 +
 arch/riscv/kernel/setup.c                |   4 +
 arch/riscv/kernel/signal.c               | 173 ++++++++++++++++++++++-
 arch/riscv/kernel/vector.S               | 102 +++++++++++++
 arch/riscv/kvm/Makefile                  |   1 +
 arch/riscv/kvm/vcpu.c                    |  33 ++++-
 arch/riscv/kvm/vcpu_switch.S             |  69 +++++++++
 arch/riscv/kvm/vcpu_vector.c             | 173 +++++++++++++++++++++++
 arch/riscv/lib/Makefile                  |   1 +
 arch/riscv/lib/xor.S                     |  81 +++++++++++
 include/uapi/linux/elf.h                 |   1 +
 35 files changed, 1298 insertions(+), 35 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_vector.h
 create mode 100644 arch/riscv/include/asm/vector.h
 create mode 100644 arch/riscv/include/asm/xor.h
 create mode 100644 arch/riscv/kernel/kernel_mode_vector.c
 create mode 100644 arch/riscv/kernel/vector.S
 create mode 100644 arch/riscv/kvm/vcpu_vector.c
 create mode 100644 arch/riscv/lib/xor.S

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
