Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37EBBC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:50:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F037F61251
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F037F61251
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Reux+MQqDsgxPruZvrU+hv59xZu/bOuEqKTgT6ad7+A=; b=vUuvDHSIH3U7qE
	/kNyRtddF8I1ILH7TFt1ITjbDB58PGCNrdCcx8UvCFcHl2ywPcHLPKGZTYuNi4DFX1PfL6gvjU1ig
	8n3iHdk7T28ERv0sV5f2Me4DxIJejnQyqsRWkUYATYBsMr8HUAJjyd0ksfUo96A20WwdRJeVE7zAa
	Um1glLdnFs26rURXph0OgezZ0lkVQTdAc05KPvhGS0z+SsrM77sZcvERv24Bn/NSG+Wgx/3Fz4iqh
	KO4PVDpUM/ZK7GcIrUAXuQL0WkGtGF6xSCJzbp2NzCy93NkdBL5Lb2wLRlDsfog3emx3d3HNCPpL/
	URrDWCmBQ25FlmPalpGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkNlz-001KB0-3c; Tue, 09 Nov 2021 09:50:35 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkNk2-001JQH-1p
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 09:48:36 +0000
Received: by mail-pf1-x42b.google.com with SMTP id g18so14196338pfk.5
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 01:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g6SI+GiU8941Hm+qpVFQtR2xu0rkhJco6OwMqL6R5Po=;
 b=dSlutICv3KDh1SAjN1MJn4EzjCtZtor3MjckIrzKKhOz4S8VYwWwLsgKlBrb+0NriO
 r2M2KkijLNLn9oNPjRidUAawqY3VeaSwOLj1FXuWoPLjY+S0i3X1uthif90L7HHy3xOY
 3sjnht1EdBRwIn3G9JbFSHKCLwibZUN3TO7eJvHO3/jwpSkkMxX/SKYsG+8LlPDxuZkj
 w2Zw2gCWK36fqmY+3GQSbubyJ2fc/AZjogfRBQ3HE4keF0DK3/CGplnjQT3h/adRNMo2
 saFBVjU1bJtOat1FPmVOue0y0EngHn8Q/gwbaoyi5a9PCghfDPhZNyJk0TZ+sStro7wd
 TmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g6SI+GiU8941Hm+qpVFQtR2xu0rkhJco6OwMqL6R5Po=;
 b=eGST/rSgmj3iLl30EG9Eyz/h4YvDYjq0n4ysiiPZr6y8vjYfgQMq6XH0XxjLJJhzdt
 QuMjUjTra8+nE54Oo3tno4Pvz3XGMQuErnx2hkmWvjf2fquihgYYVo2KrXqQWGGfzPzc
 SYpBNiunuIz9vF6oi4zZ11tRoB5/yFW/R6z489t5jzDObupoA9jtjqE1c0Hd2fOPXxIw
 Pbz3ZAhLGyK2Q+cH252h00AHADNpGz9uOe7nBWEZSN97UJ3usmM3BjKG0F47+Q/OuQUa
 PmrxjWhGoMsdAPxf29CXhssyp8xeXG/ejkffWxj7zLi8z91pLS8pWbzS3EOEg6/pV0el
 /PEQ==
X-Gm-Message-State: AOAM530fSpZ4HCAttUCCg5QltaCb4EUmkYgUkqQrLPWTs2GRpy13wX5q
 kd200z8VpK7b2aZ0desgK1/f6w==
X-Google-Smtp-Source: ABdhPJzb68gL6r+ujm/J8Q4+lkVUdBfLMGAQ25az88je/i2Fcfc77uQKbELuRu+nRJeUoRsM064P6g==
X-Received: by 2002:a05:6a00:1310:b0:494:672b:1e97 with SMTP id
 j16-20020a056a00131000b00494672b1e97mr40094265pfu.77.1636451312606; 
 Tue, 09 Nov 2021 01:48:32 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id cv1sm1940511pjb.48.2021.11.09.01.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 01:48:32 -0800 (PST)
From: Greentime Hu <greentime.hu@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: [PATCH v9 00/17] riscv: Add vector ISA support
Date: Tue,  9 Nov 2021 17:48:12 +0800
Message-Id: <cover.1636362169.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_014834_174607_F3E7B881 
X-CRM114-Status: GOOD (  21.87  )
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

This patchset is rebased to v5.15 and it is tested by running several
vector programs simultaneously. It also can get the correct ucontext_t in
signal handler and restore correct context after sigreturn. It is also
tested with ptrace() syscall to use PTRACE_GETREGSET/PTRACE_SETREGSET to
get/set the vector registers.

We have sent patches for vector support to glibc mailing list.

TODO
1. Refine the __riscv_v_state allocation in start_thread()
2. Refine the vector context switching functions by lazy save/restore
3. Add AMP support. To support harts with different ISA

 [1] https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc
 [2] https://sourceware.org/pipermail/libc-alpha/2021-September/130897.html
 [3] https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v9

---
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

Greentime Hu (11):
  riscv: Add new csr defines related to vector extension
  riscv: Add has_vector/riscv_vsize to save vector features.
  riscv: Add vector struct and assembler definitions
  riscv: Add task switch support for vector
  riscv: Add ptrace vector support
  riscv: Add sigcontext save/restore for vector
  riscv: Add support for kernel mode vector
  riscv: Use CSR_STATUS to replace sstatus in vector.S
  riscv: Add vector extension XOR implementation
  riscv: Fix an illegal instruction exception when accessing vlenb
    without enable vector first
  riscv: Fix a kernel panic issue if $s2 is set to a specific value
    before entering Linux

Guo Ren (5):
  riscv: Separate patch for cflags and aflags
  riscv: Rename __switch_to_aux -> fpu
  riscv: Extending cpufeature.c to detect V-extension
  riscv: Add vector feature to compile
  riscv: Reset vector register

Vincent Chen (1):
  riscv: signal: Report signal frame size to userspace via auxv

 arch/riscv/Kconfig                       |   9 ++
 arch/riscv/Makefile                      |  19 ++-
 arch/riscv/include/asm/csr.h             |  16 ++-
 arch/riscv/include/asm/elf.h             |  41 +++---
 arch/riscv/include/asm/processor.h       |   3 +
 arch/riscv/include/asm/switch_to.h       |  72 +++++++++-
 arch/riscv/include/asm/vector.h          |  16 +++
 arch/riscv/include/asm/xor.h             |  66 +++++++++
 arch/riscv/include/uapi/asm/auxvec.h     |   1 +
 arch/riscv/include/uapi/asm/hwcap.h      |   1 +
 arch/riscv/include/uapi/asm/ptrace.h     |  25 ++++
 arch/riscv/include/uapi/asm/sigcontext.h |  24 ++++
 arch/riscv/kernel/Makefile               |   2 +
 arch/riscv/kernel/asm-offsets.c          |   8 ++
 arch/riscv/kernel/cpufeature.c           |  16 +++
 arch/riscv/kernel/entry.S                |   6 +-
 arch/riscv/kernel/head.S                 |  24 +++-
 arch/riscv/kernel/kernel_mode_vector.c   | 146 +++++++++++++++++++
 arch/riscv/kernel/process.c              |  49 +++++++
 arch/riscv/kernel/ptrace.c               |  71 ++++++++++
 arch/riscv/kernel/setup.c                |   4 +
 arch/riscv/kernel/signal.c               | 173 ++++++++++++++++++++++-
 arch/riscv/kernel/vector.S               |  90 ++++++++++++
 arch/riscv/lib/Makefile                  |   1 +
 arch/riscv/lib/xor.S                     |  81 +++++++++++
 include/uapi/linux/elf.h                 |   1 +
 26 files changed, 929 insertions(+), 36 deletions(-)
 create mode 100644 arch/riscv/include/asm/vector.h
 create mode 100644 arch/riscv/include/asm/xor.h
 create mode 100644 arch/riscv/kernel/kernel_mode_vector.c
 create mode 100644 arch/riscv/kernel/vector.S
 create mode 100644 arch/riscv/lib/xor.S

-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
