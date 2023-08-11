Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC4EC001DB
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 23:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=MAnajWf/dQbap11oBOxhiof2ckEK4fR6TE6NeSjFbWw=; b=1Lx
	s0dFCdrazi0MbEihgUWICQiQnnJUGCayoDRw6Gjwz2zu5af8Dw8jYnD1D6JIuYTpz7ALKFypvyDdP
	opazGqmxUeNIoO5WB3oQLzI+8qdrfT9bOcF+RKD+jzNyrMaV7k1ChrMD7yWgPpGacEL+CK9hpknBO
	/a9ovfmBZ+Tpw1nlqi/oIuLH+5wutKTsOvFDNYBRk+8Ia5UeVWQHo3auURJshyE0KSAWR/DiQUHR0
	1OOLZVFmlhJjUurW2AQXcFpnsQBEMeEVkM+7xe7qB3vbn9pAWB7uxb6R68aojVEmqLZcH0fi45XlA
	Ia5+TKZ0IXOfQ2NW/1v1uuxHbuKYZqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUbfr-00Bw5U-0t;
	Fri, 11 Aug 2023 23:36:07 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUbfm-00Bw3k-0J
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 23:36:03 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1bb982d2603so36193195ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Aug 2023 16:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691796960; x=1692401760;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FJyrj6tK6yVbG9YTlwg97zBjNmUOI6qcixTijwM1454=;
        b=t4tQUrEr9br4jVUzCKEChkEGCVyX/w5GmiGPqeA0hD6O1Uy32gpVsvQDosKld/ygzA
         0TIEMY46JnkMWWtV7PTnTn22KMDZFDNB16TlTWzBzXZrIIVMYCZ+KJyn8qL2MYV1pmwz
         bZtTUUyEOEFC4EPmPS7znethsqbr0YoTsZnZqYv9QyHXjzC1P+VT5EYGHOKhDtmmM8Qu
         Re2h+x75ggvqhrlD5VchlMI1Xu1GOMoUZiWLr4cZAYYBPGljIEFk8gKbQAK4K5tWq6Ue
         hjPVDwQtRAgi492YOIlOR6RPVkVtiW6mKcEKW5Xjv2vzHd+Z0cMYTvdx1QR4v2xffK8D
         c5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691796960; x=1692401760;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FJyrj6tK6yVbG9YTlwg97zBjNmUOI6qcixTijwM1454=;
        b=VvGJqVZ/PtZUEPN5Jv2JSThKMS5KSIoZLuglyAsCeI3FuBOn2cayvhxq65spI1Jjgc
         j9ZPVvCv6BRFEvpKzkFB3zrQ6CPf+pTYGhVx0w1njSkdHTkjJzPVJVca+6nvTKkl5Dx3
         iWtL631tbSyV4onkV4kF7cq5bawmTukNLcOJYQjuQ8jAKwiFZrQLB4JTOydN6FFf0j2V
         QIXp6c5w8RlpIF6Dsy2xzwe3CE4FYEjQssAB3e6ZHj9+zwWdlLUVqkqnpSd7hmdCYx+w
         tIMWfmbpjTLBgaOXCb2yp3kkh5IekKeJmIb7VmvsPspHCjPqH/TYFPJqyNLoDCXIP507
         AXMQ==
X-Gm-Message-State: AOJu0YwrNol7Q4IjTxuTChFAk0Jn6sa+F0hqPptJKvzEWGgoppuV58vr
	sBDi/Z17BdT1/f8kgFnM7zUI5gG0ayMglGuJpAY=
X-Google-Smtp-Source: AGHT+IHIfQLwu26R66S4rNb0W+dcBEi3I8SNs14p2ndcZfHkHzE1o+CSHE6ZDND0vVU1eLU0TXIds8c/EwLduOXnpOw=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:902:d491:b0:1bc:f6d:b2f1 with
 SMTP id c17-20020a170902d49100b001bc0f6db2f1mr1221684plg.5.1691796960490;
 Fri, 11 Aug 2023 16:36:00 -0700 (PDT)
Date: Fri, 11 Aug 2023 23:35:57 +0000
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2952; i=samitolvanen@google.com;
 h=from:subject; bh=SDgfUeek9bBfFH/GgjHWWomZBQ3jJ70oyZ3dQ6OElFU=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBk1sXcOnbq6JZt3RU1sP5IFJKUw25LC2bv8yymB
 W5paiN1ZL2JAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZNbF3AAKCRBMtfaEi7xW
 7tQFDACNDk8aAKLNu9rSXt5k9BB1l2H/kIELpE2MHU7dGXgGcUdXux+dC8a0NkC4eMhYyShjRBD
 855vgltV0mRxmNIGnJ/T7tm7IrUCLEDJEig69lr1nVmkzaHdAhiLnYMNADHroqKRiT82oYUVjFC
 o2543jVSzPAm6CKbx0eBx709zBvozpwYmxR7rUvg7T49jgFVT6uelJP6mMBK1Rge2cw78smfOi9
 RG2Jhdohk0YNmUYpMpO0qa3O9KJCl6u3Ee6c9mfuqmX8Lto+vW5C45CwOZvTwed1vYzfsXfh7LC
 0J+BixKgBvVxbOFuQ04mYuxugfwVm/6ZvdQV+LZn4ZOOvs4Ral3c4JpfthwfgYOW1nIND2bC4SN
 RXrbNrh/QII1Tgze+kZrhJjbN4ze1dSYV+Y1SBEc+PtqNVdglNYtmfm9cSq152TctDoqNSq0jnr 5U3Ce6svaWc7k2zr5EDhv+SDQ8diCRpkSo72SRsnIchQUzaTCl00nv7W9xzmBDbF83cS4=
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230811233556.97161-7-samitolvanen@google.com>
Subject: [PATCH 0/5] riscv: SCS support
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Guo Ren <guoren@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Fangrui Song <maskray@google.com>, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_163602_145098_D63839F9 
X-CRM114-Status: GOOD (  15.17  )
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

Hi folks,

This series adds Shadow Call Stack (SCS) support for RISC-V. SCS
uses compiler instrumentation to store return addresses in a
separate shadow stack to protect them against accidental or
malicious overwrites. More information about SCS can be found
here:

  https://clang.llvm.org/docs/ShadowCallStack.html

Patch 1 is from Deepak, and it simplifies VMAP_STACK overflow
handling by adding support for accessing per-CPU variables
directly in assembly. The patch is included in this series to
make IRQ stack switching cleaner with SCS, and I've simply
rebased it. Patch 2 uses this functionality to clean up the stack
switching by moving duplicate code into a single function. On
RISC-V, the compiler uses the gp register for storing the current
shadow call stack pointer, which is incompatible with global
pointer relaxation. Patch 3 moves global pointer loading into a
macro that can be easily disabled with SCS. Patch 4 implements
SCS register loading and switching, and allows the feature to be
enabled, and patch 5 adds separate per-CPU IRQ shadow call stacks
when CONFIG_IRQ_STACKS is enabled.

Note that this series requires Clang 17. Earlier Clang versions
support SCS on RISC-V, but use the x18 register instead of gp,
which isn't ideal. gcc has SCS support for arm64, but I'm not
aware of plans to support RISC-V. Once the Zicfiss extension is
ratified, it's probably preferable to use hardware-backed shadow
stacks instead of SCS on hardware that supports the extension,
and we may want to consider implementing CONFIG_DYNAMIC_SCS to
patch between the implementation at runtime (similarly to the
arm64 implementation, which switches to SCS when hardware PAC
support isn't available).

Sami


Deepak Gupta (1):
  riscv: VMAP_STACK overflow detection thread-safe

Sami Tolvanen (4):
  riscv: Deduplicate IRQ stack switching
  riscv: Move global pointer loading to a macro
  riscv: Implement Shadow Call Stack
  riscv: Use separate IRQ shadow call stacks

 arch/riscv/Kconfig                   |   6 ++
 arch/riscv/Makefile                  |   4 +
 arch/riscv/include/asm/asm.h         |  35 ++++++++
 arch/riscv/include/asm/irq_stack.h   |   3 +
 arch/riscv/include/asm/scs.h         |  54 ++++++++++++
 arch/riscv/include/asm/thread_info.h |  16 +++-
 arch/riscv/kernel/asm-offsets.c      |   4 +
 arch/riscv/kernel/entry.S            | 126 +++++++++++++--------------
 arch/riscv/kernel/head.S             |  19 ++--
 arch/riscv/kernel/irq.c              |  53 ++++++-----
 arch/riscv/kernel/suspend_entry.S    |   5 +-
 arch/riscv/kernel/traps.c            |  65 ++------------
 arch/riscv/kernel/vdso/Makefile      |   2 +-
 arch/riscv/purgatory/Makefile        |   4 +
 14 files changed, 228 insertions(+), 168 deletions(-)
 create mode 100644 arch/riscv/include/asm/scs.h


base-commit: 52a93d39b17dc7eb98b6aa3edb93943248e03b2f
-- 
2.41.0.640.ga95def55d0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
