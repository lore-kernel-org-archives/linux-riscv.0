Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC9CD6ACF9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 17:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KKIeHWN1lzbwh2iJ4waoi0LgV2JrVtbElyb2d2fk/ls=; b=0p6+CgF6LyPHMe
	I1woYF0rKxv4UFO4dg/WO4R+xx9VyraBoUtCgVeAbytV4fuKF+RxDMuPIcyZLgNhqRHTpmENUfYky
	f/W247UfqIMd0adfW+p5BLkr/k4lukRFwnNDEZSyHHgTCof4fVffMrve0WJ+OFi03SlUgIWOAiEV4
	ScafoHcKNU0umIVq7mL+0ri7oa9hJHx9NeUuQBxcBcvnEX8N5ZTR2e6q0kFXJ13JbHNWJv+HiuXA7
	QKCalq7NjB64mligsqDN/hTgUDdL1Ar7d207mHj00SeNbvg66CLZ1xhFBjHpV3laoMuiA/jU33FZF
	EDa6yBwJ6W1eRpexSytg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLrN-0000000DkNS-1uHg;
	Wed, 27 Nov 2024 17:29:53 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLrK-0000000DkMe-0y2b
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 17:29:51 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7e9e38dd5f1so5960209a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 09:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732728589; x=1733333389; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P4sIOmxt+6E3SUjl0OKh9ltYG/Wh+OnpptrG+2+4Agg=;
        b=PKhohIpsPgvJZmcRgRqxFTtTEw+n41P3y+GeyMGgV/PLA8tsRQSvj2kwr3CGsjuOGW
         osWkmTpDGn62AMNv+jq6pz9v/uxC819TdkNF9G+mOlnIUuWE7X8KgwgTcB6F75Q6GQds
         /Cstime1nkO337NPm2g0A/7ZQI0vt+dplxzVChYwiq7tgnHjCnwWQtf72pTaXLK3LG0T
         bEwifJhZGYo3pmV4qJhbOJhke4I2VpHRcbdaKMOmIKnZA/hk0W+tuBcQ+xXdtwTHVPYD
         MOmPyTj4R/uakyWd+tPNlAFYcMehjR3U7pTPZezb59z7dKTBfDtA4CncWnSw9xLae4Ah
         jevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732728589; x=1733333389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4sIOmxt+6E3SUjl0OKh9ltYG/Wh+OnpptrG+2+4Agg=;
        b=IKhif0NWBEp5OwGuX6/jiEeR1B1c5AMMo3V+X1a4gFTwjI/VcUTgGZCkRYrMVNVwYQ
         bQ6qYi4XpsFKV2+gkfVCQVL2GBAoEoBKEp1Bk0ZQafKYtfPFKJ5ivn1KfxDXT4Yfq1cs
         iOluQzyAF9N5tnOWEMff69TU9hGjnM1tBk4Etbin+DQXR/sdeZ8hhlndXz2uOLztSXuo
         4iHbAloxH1KGFTsjRbwi2N+Layij8GirtxVlO3XZIsYmKn24idBVO00CbyLyjL/Agg3E
         xx5BkxX0AUBSdMItNdB+if9eEx7xwXmnO6KUNfLHD205z0DM0I7pGPwVfoTugk5OqbIC
         vqkA==
X-Forwarded-Encrypted: i=1; AJvYcCWCBic93QBt7+EoCtLwgBgESr9qovUf/hw+56Qe4/0IzcvyVBHofAT+4cC3BznV/3M7M9PtiHyt4lxCdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVjYCHQ51lAs8Mb9GtleMue/k5uDroxjs5k02TsCA08XIF95mW
	ky/TU8I+nAtaQ3WtKyvGSc4l3t0NGT8MZ7wvczohF4nYHvCvDUpv
X-Gm-Gg: ASbGncuxMmAbOBLExX7blgXOJi4SmgCsiT/IkIb62ce5CtLPSR4ZleyYyQiZPTo6C0b
	3l0+cbg3Lujec+vIiM7dXFOffVx6lCdLJ1+/Uwi+wTwEdQyR/Q+fXxCXyY0sdHc3cJJMjVVPjw9
	xpf/ys0MmOmMcixFWnCL7jxkIjuj+tS9VBNpGN7+zXBroqMtr8sSR0LSYA3nJ/DLyYGcGqZ+m+E
	HTU8M2nXHrUzHekC6Na/ZICOK4Alr6YVbAZmPSY+GtUt57eAuniW64FyvBrnjIOYDzNStaI3nSj
	QOn7IbEtcw7LfbqlzFHzj3sb9Mdp
X-Google-Smtp-Source: AGHT+IEQBpzMXh5yXkAktk+B4Le1RfAy/+Rf/KVUrppFxoUQ2qNw97WYZSZiNYXgYFn+fzg6vo950g==
X-Received: by 2002:a05:6a21:2d84:b0:1d9:c6e8:60fc with SMTP id adf61e73a8af0-1e0e0ab4692mr5782140637.6.1732728588569;
        Wed, 27 Nov 2024 09:29:48 -0800 (PST)
Received: from localhost.localdomain (1-171-29-17.dynamic-ip.hinet.net. [1.171.29.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc1e3fdbsm9359582a12.30.2024.11.27.09.29.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 27 Nov 2024 09:29:47 -0800 (PST)
From: Andy Chiu <andybnac@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	bjorn@rivosinc.com,
	puranjay12@gmail.com,
	alexghiti@rivosinc.com,
	yongxuan.wang@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	tommy.wu@sifive.com,
	eric.lin@sifive.com,
	viccent.chen@sifive.com,
	zong.li@sifive.com,
	samuel.holland@sifive.com
Subject: [PATCH v3 0/7] riscv: ftrace: atmoic patching and preempt improvements
Date: Thu, 28 Nov 2024 01:29:01 +0800
Message-Id: <20241127172908.17149-1-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_092950_269539_D4371983 
X-CRM114-Status: GOOD (  19.87  )
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

This series makes atmoic code patching possible in riscv ftrace. A
direct benefit of this is that we can get rid of stop_machine() when
patching function entries. This also makes it possible to run ftrace
with full kernel preemption. Before this series, the kernel initializes
patchable function entries to NOP4 + NOP4. To start tracing, it updates
entries to AUIPC + JALR while holding other cores in stop_machine.
stop_machine() is required because it is impossible to update 2
instructions, and be seen atomically. And preemption must have to be
prevented, as kernel preemption allows process to be scheduled out while
executing on one of these instruction pairs.

This series addresses the problem by initializing the first NOP4 to
AUIPC. So, atmoic patching is possible because the kernel only has to
update one instruction. As long as the instruction is naturally aligned,
then it is expected to be updated atomically.

However, the address range of the ftrace trampoline is limited to +-2K
from ftrace_caller after appplying this series. This issue is expected
to be solved by Puranjay's CALL_OPS, where it adds 8B naturally align
data in front of pacthable functions and can  use it to direct execution
out to any custom trampolines.

The series is composed by three parts. The first part cleans up the
existing issues when the kernel is compiled with clang.The second part
modifies the ftrace code patching mechanism (2-4) as mentioned above.
Then prepare ftrace to be able to run with kernel preemption (5,6)

An ongoing fix:

Since there is no room for marking *kernel_text_address as notrace[1] at
source code level, there is a significant performance regression when
using function_graph with TRACE_IRQFLAGS enabled. There can be as much as
8 graph handler being called in each function-entry. The current
workaround requires us echo "*kernel_text_address" into
set_ftrace_notrace before starting the trace. However, we observed that
the kernel still enables the patch site in some cases even with
*kernel_text_address properly added in the file While the root cause is
still under investagtion, we consider that it should not be the reason
for holding back the code patching, in order to unblock the call_ops
part.

[1]: https://lore.kernel.org/linux-riscv/20240613093233.0b349ed0@rorschach.local.home/

Changes in v3:
- Add a fix tag for patch 1
- Add a data fence before sending out remote fence.i (6)
- Link to v2: https://lore.kernel.org/all/20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com/

Changes in v2:
- Drop patch 1 as it is merged through fixes.
- Drop patch 2, which converts kernel_text_address into notrace. As
  users can prevent tracing it by configuring the tracefs.
- Use a more generic way in kconfig to align functions.
- Link to v1: https://lore.kernel.org/r/20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com


Andy Chiu (7):
  riscv: ftrace: support fastcc in Clang for WITH_ARGS
  riscv: ftrace: align patchable functions to 4 Byte boundary
  riscv: ftrace: prepare ftrace for atomic code patching
  riscv: ftrace: do not use stop_machine to update code
  riscv: vector: Support calling schedule() for preemptible Vector
  riscv: add a data fence for CMODX in the kernel mode
  riscv: ftrace: support PREEMPT

 arch/riscv/Kconfig                 |   4 +-
 arch/riscv/include/asm/ftrace.h    |  11 +++
 arch/riscv/include/asm/processor.h |   5 ++
 arch/riscv/include/asm/vector.h    |  22 ++++-
 arch/riscv/kernel/asm-offsets.c    |   7 ++
 arch/riscv/kernel/ftrace.c         | 133 ++++++++++++-----------------
 arch/riscv/kernel/mcount-dyn.S     |  25 ++++--
 arch/riscv/mm/cacheflush.c         |  15 +++-
 8 files changed, 135 insertions(+), 87 deletions(-)
---
base-commit: 0eb512779d642b21ced83778287a0f7a3ca8f2a1
-- 
2.39.3 (Apple Git-145)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
