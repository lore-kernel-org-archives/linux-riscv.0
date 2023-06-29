Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841ABC0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 23:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=5oEmZcq2ZX/Lz2LGCE0liAn1hOdVguTsNlk1DGmdl6E=; b=x/o
	2XzR3nUNu6/Ud7RqyoDQq8XTI+186i/ragmYzOabp/pJ2BU1W35f0uIBbrBrTKjVV1CB56iepP3nC
	78GyeI4MieL6Aqu770tAMjCo3OfNerRaIJkMVEwzkQOoLFXatTUwOBHoW1BXtaLw6BsF2/yGC/1bq
	8IQMQ61shkItfHbbk2t0d5PM1Am9yMaq9Sm5TGhAome+xdAItc3JWXIEsx/OyQknexvaCQa4v0YTO
	ThprsAv8J4XZUxlMPO8njlUlM714gSvj6M7wR9t0VqmpNk4U8kcZLAPtnEYUv2arBZWbGjXYTRKuJ
	MuTM2/vFVnj6aa/3ybXkKIzKPBhpOdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF1Hw-002TxC-2W;
	Thu, 29 Jun 2023 23:43:00 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF1Ht-002Tuq-1K
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 23:42:58 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5428d1915acso760980a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Jun 2023 16:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688082169; x=1690674169;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UqxiJ+wxeOup3g+v1VHpaHDKWQztxMxqi0mk+NuRGI0=;
        b=JFJLqtpj9HP+j2cx8ibkcKdNPfiT4hV/vniOYA+lGlaubKwrgLdo+IqDliWWwLVCXX
         4qew4YCgpeJ+l4vse/+P1GvQa9jQXWVMLPPTY3qpJN27Hmlq9pzgTTZEY2+pn0z1Aj8p
         79cdHWQKV0ftUG/JgX3DNIHwG8NSV5ICPDKYxyHYfpwN4H/eVvGqmtkgalPEpyICaibJ
         0c+7yff/jYz47CVInUbsucKWyflvKPxTnOQMV+WuJ2Z++mVSI7L2HmleoB3tBQ10iaV7
         MRMwpvNfl3kbYyTuBd31uPvUplw64d49c+MrqsgTUd5I9XF4J3ViZ/E2QrStaqYWMsm+
         9Iow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688082169; x=1690674169;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UqxiJ+wxeOup3g+v1VHpaHDKWQztxMxqi0mk+NuRGI0=;
        b=fWZzZx8kkbk9CamPOHqh6T504nhNwEnSV6l4nZupzoJRB02wDZCScg+0Mm0OlSaa/Y
         GtfR3lB+JAeFtakwOS7SoTbqJ26Nd3DXwSIBBPE+gEc+SSbat5I+STMGC36KAKQEJh/E
         ZCoohcrMA4Ir/XAoX527EPfxVJgSbR/V8XOGSLs19eWcRmC/BSNijlslnessKOiXnU+z
         R335W9jAAhniOu5T8NePisC1KyjnIbAmexzTLLAdqaeh6l3notDGf2iYstbUA802gRLV
         OGPnKS53aRnYc/Mm8ByMo3j1+pI5uMz7qpQpS2AHN6g6lg7gIpcAwQ5WWrBPpUnEtzmJ
         6w/w==
X-Gm-Message-State: AC+VfDz+rdyHzorXqld9aQc8vdhgrnlxWFgQ3M6eD90kbFCcYfhX4Mor
	PJ60hUTusvbSrPvWwWj9oJG+yme5V3/Xmop8O9Q=
X-Google-Smtp-Source: ACHHUZ6vUtYaX6I26hwq42e3qYc1jUuPZEmeaRTh+ELGRVrZOZ5ozI8rE+BXZrWz8EZenOof5u9+N5+gcL+j0v40i44=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a63:5264:0:b0:55b:4410:aafb with SMTP
 id s36-20020a635264000000b0055b4410aafbmr800040pgl.3.1688082169612; Thu, 29
 Jun 2023 16:42:49 -0700 (PDT)
Date: Thu, 29 Jun 2023 23:42:45 +0000
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3098; i=samitolvanen@google.com;
 h=from:subject; bh=P9om0lNdUWwXNFZNNgw3dgHTOqlhC0p07z6I9F32sio=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBknhb0iAHV/FdV5QB/CkNhg1kTCcn5k/bF4Y9dp
 ECoQTCJMMqJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZJ4W9AAKCRBMtfaEi7xW
 7i3FC/9JJjrQvfbLQqh+/oUlKPBRc4ccqjtDtqPRPN/vvj/gmo24gT4SK4QiKLSQOxPwvm1UYRc
 rK/IByu9EOG9Amh2WhwDzJ1nZYo2pgbyx2XJANKacsIKE5HIGPVj0yiD542YbVQqh0XWYsYek/H
 ZRc06Ds03/YmsEuHZcdu4MOGWxg6lOkQioXBZJILg52my7uo56gX00XNbros1ISh0dOmzpYI2sI
 vhHY/HaOmJhMvCombyTLDqHjPjrVtYq/Em7SZFf2q/REezKhd+Z9hwTtquIG2+4QwUFw4Df/qte
 wXI8fR+3YoCmQewZNZXGh85dQI+D7vwL6sG67LjmVtNmiSQuO9b/2AYH2ev3X8o5bkX9w7Wrprg
 WCLz2/XvMdKNiNDO0+b1C0Aabc87+JeYRFjsHUJAk7cQtHTF81tldyVFJ1j+qCNqUQbMBOrsDF2 WWkOlKAn+fRlG+AC1RuBn0hFhfbL5MTzy1vwk61Ofy/VmNnAJnSk8aurKOLWLlBhgAA58=
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230629234244.1752366-8-samitolvanen@google.com>
Subject: [PATCH 0/6] riscv: KCFI support
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_164257_471595_FEBB36FE 
X-CRM114-Status: GOOD (  14.67  )
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

This series adds KCFI support for RISC-V. KCFI is a fine-grained
forward-edge control-flow integrity scheme supported in Clang >=16,
which ensures indirect calls in instrumented code can only branch to
functions whose type matches the function pointer type, thus making
code reuse attacks more difficult.

Patch 1 implements a pt_regs based syscall wrapper to address
function pointer type mismatches in syscall handling. Patches 2 and 3
annotate indirectly called assembly functions with CFI types. Patch 4
implements error handling for indirect call checks. Patch 5 disables
CFI for arch/riscv/purgatory. Patch 6 finally allows CONFIG_CFI_CLANG
to be enabled for RISC-V.

Note that Clang 16 has a generic architecture-agnostic KCFI
implementation, which does work with the kernel, but doesn't produce
a stable code sequence for indirect call checks, which means
potential failures just trap and won't result in informative error
messages. Clang 17 includes a RISC-V specific back-end implementation
for KCFI, which emits a predictable code sequence for the checks and a
.kcfi_traps section with locations of the traps, which patch 5 uses to
produce more useful errors.

The type mismatch fixes and annotations in the first three patches
also become necessary in future if the kernel decides to support
fine-grained CFI implemented using the hardware landing pad
feature proposed in the in-progress Zicfisslp extension. Once the
specification is ratified and hardware support emerges, implementing
runtime patching support that replaces KCFI instrumentation with
Zicfisslp landing pads might also be feasible (similarly to KCFI to
FineIBT patching on x86_64), allowing distributions to ship a unified
kernel binary for all devices.


Sami Tolvanen (6):
  riscv: Implement syscall wrappers
  riscv: Add types to indirectly called assembly functions
  riscv: Add ftrace_stub_graph
  riscv: Add CFI error handling
  riscv/purgatory: Disable CFI
  riscv: Allow CONFIG_CFI_CLANG to be selected

 arch/riscv/Kconfig                       |  3 +
 arch/riscv/include/asm/cfi.h             | 22 ++++++
 arch/riscv/include/asm/insn.h            | 10 +++
 arch/riscv/include/asm/syscall.h         |  5 +-
 arch/riscv/include/asm/syscall_wrapper.h | 87 ++++++++++++++++++++++++
 arch/riscv/kernel/Makefile               |  2 +
 arch/riscv/kernel/cfi.c                  | 77 +++++++++++++++++++++
 arch/riscv/kernel/compat_syscall_table.c |  8 ++-
 arch/riscv/kernel/mcount.S               |  9 ++-
 arch/riscv/kernel/suspend_entry.S        |  5 +-
 arch/riscv/kernel/sys_riscv.c            |  6 ++
 arch/riscv/kernel/syscall_table.c        |  8 ++-
 arch/riscv/kernel/traps.c                |  4 +-
 arch/riscv/purgatory/Makefile            |  4 ++
 14 files changed, 238 insertions(+), 12 deletions(-)
 create mode 100644 arch/riscv/include/asm/cfi.h
 create mode 100644 arch/riscv/include/asm/syscall_wrapper.h
 create mode 100644 arch/riscv/kernel/cfi.c


base-commit: c6b0271053e7a5ae57511363213777f706b60489
-- 
2.41.0.255.g8b1d071c50-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
