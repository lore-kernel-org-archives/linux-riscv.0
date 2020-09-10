Return-Path: <SRS0=oUx1=CT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55BDAC43461
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:12:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 763B220731
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:12:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jZeCGQb+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="FXRK29J+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 763B220731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZCt0oD24HJOI5rdukKPoyARGkNcmaZTd8oFoNRV9x5U=; b=jZeCGQb+kzUFG3Abe7v9udMHBJ
	MLOwazREfsOgZT0WHe+UfuDOOVU/rlIfsnH6/QB9s9Yhs6Bjfpvp7l7HZAQgzwJqyPwYUf6pzByYc
	+g8BmC14e0n4kTh40p9/Wtc+hUVYpCNpEsOdZ67JBaYVuRx4/fYk1or2catX8MJBOv/S163ZaKOf8
	5se4dEsJ6itC5BGyB88aEYDxl9TKROad5Vy5UpAbrwZg/+GHKDyeDdgY8lZYI9nX1zBxNWyKT4W7v
	NHVUh16BnelZDU8v6uc4okDcHeCZChjB5xQ5V0kq0s5rxBPaUNIi2ALLyfP54QTlINWBHeUxdjGXi
	vHXyqwGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHhE-0008At-CZ; Thu, 10 Sep 2020 08:12:44 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHhA-00089N-Ip
 for linux-riscv@lists.infradead.org; Thu, 10 Sep 2020 08:12:41 +0000
Received: by mail-pf1-x442.google.com with SMTP id k15so4165233pfc.12
 for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2020 01:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hIxpQhbgonx8nlKAxkVhSGRouo/g4ZEWjtm8/CRy5aY=;
 b=FXRK29J+v4F+YBc420YkHOyHLh7jwTadoKM/lNVSCpVD7MYPy7Lo5T3tDw6LP8REDC
 h+zW9PCfrWEEbfBU4uLw1F027VrDeaTw/byn/DJvswLplWwnD9OfTwlE3KHXwn4XWsbH
 n6EdU4DWYd1YbfqXb+W7Wo/v2LDo+ky4nZJpD2zpzTvcZ1NGmmvDn45fpxhp1NlAYqml
 2GLH8bG+oCvWhcQhSqbN895sXBNkP9PH/r7uYijb8jfrjL2WFOCLxiNW0jYLdhRXryFL
 Zx0TXrsozNinLi0TJTX99DCZdJAiiqJRddN0qvteaEWsW+fwGxyGRu1eQsfo17ep82CV
 BUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hIxpQhbgonx8nlKAxkVhSGRouo/g4ZEWjtm8/CRy5aY=;
 b=OQHO4c1MGgJspAxR8F5ZKSp/ulflX8YOomzHxsXGDrB4fvPmctGtwY3gEgmT/sx3O7
 VoLv7G+tI9nAwsNtW0BBYEESHVvRQx5oziGAL0S5M/V8/8FzT1fI/LGYYHjc+ryPHGoz
 BqEPNZ5ZC4Zl9ji7xNF7MA91AgkYunxDGmwBN/NnQzOY16i5o9rOu9Xej0RcjK5Szn7I
 E5fA982Zo9p2qLnaqrCyYuymMiIl+1ZdlveUwSvaM4kiEMiy39S+i1yzWAsUDtZ5vmSh
 5QVVkg3DiDTURS92YdKjqFOugDjVjV+30v0jpim9MI1fPnhzifGMFgpWlgdfRdN2voCp
 aXvA==
X-Gm-Message-State: AOAM5330RQ3s6SYsX9qu6zfTzN0bn78Px4NpYKZXwvO3fJusPvkx2a0A
 Q08/5iOO0z6vMpa1Qmst8RrnlQ==
X-Google-Smtp-Source: ABdhPJwuBJkNNxY8b+LyEc92/ARvkWCjxC8Rleny4O12LG9s+CSiC/NeDIIHAqvIoRxGvqu6TIAafw==
X-Received: by 2002:a65:66c6:: with SMTP id c6mr3679317pgw.206.1599725556826; 
 Thu, 10 Sep 2020 01:12:36 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id e1sm2196056pfl.162.2020.09.10.01.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 01:12:36 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Subject: [RFC PATCH v7 00/21] riscv: Add vector ISA support
Date: Thu, 10 Sep 2020 16:11:55 +0800
Message-Id: <cover.1599719352.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_041240_890808_F405AD71 
X-CRM114-Status: GOOD (  19.90  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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

This patchset is implemented based on vector 0.9+ spec to add vector support
in riscv Linux kernel. To make this happen, we defined a new structure
__riscv_v_state to save the vector related registers. It is used for both
kernel space and user space. In kernel space, the datap pointer in
__riscv_v_state will be allocated dynamically to save vector registers.
In signal handler of user space, datap will point to the address right
after the __riscv_v_state data structure to save vector registers in stack.
In ptrace, the data will be put in ubuf in which we can get/put the
__riscv_v_state data structure from/to it, datap pointer would be zeroed and
vector registers will be copied to the address right after the
__riscv_v_state structure in ubuf. This patchset also adds support for kernel
mode vector, kernel XOR implementation with vector ISA and includes several
bug fixes and code refinement.

This patchset is rebased to v5.9-rc4 and it is tested by running several
vector programs simultaneously. It also can get the correct ucontext_t in
signal handler and restore correct context after sigreturn. It is also
tested with ptrace() syscall to use PTRACE_GETREGSET/PTRACE_SETREGSET to
get/set the vector registers. I have tested vlen=128 and vlen=256 cases in
spike machine of qemu-system-riscv64 provided by Zhiwei Lui and Frank Chang
and also tested in spike with vlen=64 to vlen=4096 settings.

We also sent patches to glibc mailing list for ifunc support and sigcontext
changes.

 [1] https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc
 [2] https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v4
 [3] https://blog.linuxplumbersconf.org/2017/ocw/sessions/4671.html
 [4] https://sourceware.org/pipermail/libc-alpha/2020-July/116059.html
 [5] https://sourceware.org/pipermail/libc-alpha/2020-July/116108.html
 [6] https://linuxplumbersconf.org/event/7/contributions/811/

---
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

Greentime Hu (16):
  riscv: Extending cpufeature.c to detect V-extension
  riscv: Add new csr defines related to vector extension
  riscv: Add has_vector/riscv_vsize to save vector features.
  riscv: Add vector struct and assembler definitions
  riscv: Add task switch support for vector
  riscv: Add task switch support for vector
  riscv: Add ptrace vector support
  riscv: Add sigcontext save/restore for vector
  riscv: Add support for kernel mode vector
  riscv: Use CSR_STATUS to replace sstatus in vector.S
  riscv: Add vector extension XOR implementation
  riscv: Initialize vector registers with proper vsetvli then it can
    work normally
  riscv: Optimize vector registers initialization
  riscv: Fix an illegal instruction exception when accessing vlenb
    without enable vector first
  riscv: Allocate space for vector registers in start_thread()
  riscv: Optimize task switch codes of vector

Guo Ren (4):
  riscv: Separate patch for cflags and aflags
  riscv: Rename __switch_to_aux -> fpu
  riscv: Add vector feature to compile
  riscv: Reset vector register

Vincent Chen (1):
  riscv: signal: Report signal frame size to userspace via auxv

 arch/riscv/Kconfig                       |   9 ++
 arch/riscv/Makefile                      |  19 ++-
 arch/riscv/include/asm/csr.h             |  16 ++-
 arch/riscv/include/asm/elf.h             |  17 ++-
 arch/riscv/include/asm/processor.h       |   3 +
 arch/riscv/include/asm/switch_to.h       |  67 +++++++++-
 arch/riscv/include/asm/vector.h          |  18 +++
 arch/riscv/include/asm/xor.h             |  74 +++++++++++
 arch/riscv/include/uapi/asm/auxvec.h     |   2 +
 arch/riscv/include/uapi/asm/hwcap.h      |   1 +
 arch/riscv/include/uapi/asm/ptrace.h     |  31 +++++
 arch/riscv/include/uapi/asm/sigcontext.h |   2 +
 arch/riscv/kernel/Makefile               |   7 +
 arch/riscv/kernel/asm-offsets.c          |   8 ++
 arch/riscv/kernel/cpufeature.c           |  16 +++
 arch/riscv/kernel/entry.S                |   6 +-
 arch/riscv/kernel/head.S                 |  22 +++-
 arch/riscv/kernel/kernel_mode_vector.c   | 158 +++++++++++++++++++++++
 arch/riscv/kernel/process.c              |  48 +++++++
 arch/riscv/kernel/ptrace.c               |  74 +++++++++++
 arch/riscv/kernel/setup.c                |   5 +
 arch/riscv/kernel/signal.c               | 108 +++++++++++++++-
 arch/riscv/kernel/vector.S               |  81 ++++++++++++
 arch/riscv/lib/Makefile                  |   1 +
 arch/riscv/lib/xor.S                     |  81 ++++++++++++
 include/uapi/linux/elf.h                 |   1 +
 26 files changed, 852 insertions(+), 23 deletions(-)
 create mode 100644 arch/riscv/include/asm/vector.h
 create mode 100644 arch/riscv/include/asm/xor.h
 create mode 100644 arch/riscv/kernel/kernel_mode_vector.c
 create mode 100644 arch/riscv/kernel/vector.S
 create mode 100644 arch/riscv/lib/xor.S

-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
