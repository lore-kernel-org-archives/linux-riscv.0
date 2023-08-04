Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6432CC0015E
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 02:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=COIGQPXdXmld0My8wUvCb2VhfBmOE5uXj5jvEOceL5M=; b=yurhqolJTvRoZA
	dbEpbTbn44d537gZOHUPWVBoN/9Ld/WZEO8GEvUW4dZZoG5VaAqK7aBOA62py5dabVhO3iz1OEvbw
	PnZ3sUPovogknpq8XuRxnCEgjgJbXtBY0uRMLFy94drh/Sv68YZ8rPbXQq2FJpZug88vYfUYXimcp
	38cr9NrUp98+2IUun5hXsWWWyI4/+jRZ++swKiQsuL1QA0Y2EsdnzQKzdt+0jN9paoDpxldFOSTG5
	+quvQPA8WoRa/V+P5yyPxFE5wVa36QKbUUPcO878z8L2MuIxOE82K3t0X6n0eTwpYEecTFYrwmvd2
	fmHLINqQCo3bEqMzcaog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRkKf-00BM3H-2O;
	Fri, 04 Aug 2023 02:14:25 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRkKc-00BKt0-2g
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 02:14:24 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6bcd4b5ebbaso274913a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 19:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691115050; x=1691719850;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aKI9/8r29fiRcdK5stgXJjwhW7P4T9bJiQbL+zxyBRE=;
        b=AkhJfOQFM1pGb6BlPUy06oljjiN78H7icu0FCH4lB+bXHw/LwEgE5WfUHUrhk68xKT
         VZ9dam0/U64TWA5t9TdKruXPJ3X0H+Sf0d6VfdGQUmlqqGKLC8z8Yvh7+P06WeYSaRF6
         7tff9KQinoC1Hs5opB6YqN+4f3XkGXDoNcN0XTyYvtwmEI6i78JSWRjapxttsIFecIL3
         TCvudV8tBM9EoNig/xmiY7igTYmcPHx0ukaFkc/TJlPFpGWB16NSmemF6Z9bDb7+PdFN
         fVb3cD33kRf2q8frdWvDdZU0s40iHWB50DKpovfgMWF8buP9mcXSJ1u8dbQjRbyQHCxf
         UWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691115050; x=1691719850;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aKI9/8r29fiRcdK5stgXJjwhW7P4T9bJiQbL+zxyBRE=;
        b=K155whRvBsbj4nDHK1xz83yK0PGTtm+rq1Re0N7hpPhqJO3ybZB4+h3b2Eoi8emPiv
         5tQtBhxaC2e4kS76Mh0KXlkrrZ65P9KzntgAN3zQz4iYfrdA3AAIJDLifESGX7FPO26z
         yyRi2PwYI7XVFaRF2Hq4ihgHEearLH4cICYykP6jnoZl4pG/cT/YTbH7aBT7aI5dsReG
         32A0RuGmhYkZCuUNhc66jzF0nrVv8KlyEhAm+2PIgR4H10EhdciQgnEnXjuVy5d2/9ce
         bM2rP1oaG0LWtaQ+Pom4BEYFd6IGtnnujWMRn+FpqseuOEg5mSyBcE5JOHmd7w7P/qzp
         KTag==
X-Gm-Message-State: AOJu0YzcNlhE47Jg8u/8RR0AeCppiBGfoqK/+P6JFyxILER5NwQiT4nr
	mHHcxiAY+hkDGLJ82n7SayuB+w==
X-Google-Smtp-Source: AGHT+IGEhqmUxc1mmFiSsBDUL26nAWIZW9KyBf1DeJ5CThKaab1yi3ouqz1V6OLbD8yYEm2oPVP2Jw==
X-Received: by 2002:a05:6871:707:b0:19f:aee0:e169 with SMTP id f7-20020a056871070700b0019faee0e169mr420658oap.30.1691115050056;
        Thu, 03 Aug 2023 19:10:50 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id g6-20020a655806000000b0055c558ac4edsm369499pgr.46.2023.08.03.19.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 19:10:49 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 00/10] RISC-V: Refactor instructions
Date: Thu, 03 Aug 2023 19:10:25 -0700
Message-Id: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABJezGQC/x2NQQqDQAxFryJZG4jOLMSrlC7CmNYsHEsyFUG8e
 0OXD/777wIXU3GYuwtMDnXda8DQd1BWrm9BXYJhpDHRRANu7E0MTV5c2m6o1Zt9SwvP8ciYU2K
 mTAtTgnj5xFLPf+HxvO8foTEC2nEAAAA=
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, bpf@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
 Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Ard Biesheuvel <ardb@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, 
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, 
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 Nam Cao <namcaov@gmail.com>, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_191422_874878_94B6974B 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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

There are numerous systems in the kernel that rely on directly
modifying, creating, and reading instructions. Many of these systems
have rewritten code to do this. This patch will delegate all instruction
handling into insn.h and reg.h. All of the compressed instructions, RVI,
Zicsr, M, A instructions are included, as well as a subset of the F,D,Q
extensions.

---
This is modifying code that https://lore.kernel.org/lkml/20230731183925.152145-1-namcaov@gmail.com/
is also touching.

---
Testing:

There are a lot of subsystems touched and I have not tested every
individual instruction. I did a lot of copy-pasting from the RISC-V spec
so opcodes and such should be correct, but the construction of every
instruction is not fully tested.

vector: Compiled and booted

jump_label: Ensured static keys function as expected.

kgdb: Attempted to run the provided tests but they failed even without
my changes

module: Loaded and unloaded modules

patch.c: Ensured kernel booted

kprobes: Used a kprobing module to probe jalr, auipc, and branch
instructions

nommu misaligned addresses: Kernel boots

kvm: Ran KVM selftests

bpf: Kernel boots. Most of the instructions are exclusively used by BPF
but I am unsure of the best way of testing BPF.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

---
Charlie Jenkins (10):
      RISC-V: Expand instruction definitions
      RISC-V: vector: Refactor instructions
      RISC-V: Refactor jump label instructions
      RISC-V: KGDB: Refactor instructions
      RISC-V: module: Refactor instructions
      RISC-V: Refactor patch instructions
      RISC-V: nommu: Refactor instructions
      RISC-V: kvm: Refactor instructions
      RISC-V: bpf: Refactor instructions
      RISC-V: Refactor bug and traps instructions

 arch/riscv/include/asm/bug.h             |   18 +-
 arch/riscv/include/asm/insn.h            | 2744 +++++++++++++++++++++++++++---
 arch/riscv/include/asm/reg.h             |   88 +
 arch/riscv/kernel/jump_label.c           |   13 +-
 arch/riscv/kernel/kgdb.c                 |   13 +-
 arch/riscv/kernel/module.c               |   80 +-
 arch/riscv/kernel/patch.c                |    3 +-
 arch/riscv/kernel/probes/kprobes.c       |   13 +-
 arch/riscv/kernel/probes/simulate-insn.c |  100 +-
 arch/riscv/kernel/probes/uprobes.c       |    5 +-
 arch/riscv/kernel/traps.c                |    9 +-
 arch/riscv/kernel/traps_misaligned.c     |  218 +--
 arch/riscv/kernel/vector.c               |    5 +-
 arch/riscv/kvm/vcpu_insn.c               |  281 +--
 arch/riscv/net/bpf_jit.h                 |  707 +-------
 15 files changed, 2825 insertions(+), 1472 deletions(-)
---
base-commit: 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
change-id: 20230801-master-refactor-instructions-v4-433aa040da03
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
