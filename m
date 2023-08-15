Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF6CC001E0
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 20:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=j6o5Hjqaq5iuj2G0OTFP//BMSSZPtS/+P/gZPDbUfG0=; b=OKE
	kcRIC144Q9ASQHZkzl/JsE+WJzr/mpFWkj7girk+dVy2QcDjhB8NOospkP/KDtvAaQGZZlhGe3UVG
	LITt81evAT1oTvqRbguXJgSQFHDIUDnpL2OiUjoD7KHqdqv4PveNql5lr/LQrlxt+LtYwi7uLH8h+
	I43R4B02HbQZGJJS+oPB0CRWaA54+It6yvMsvB3w+w7GUv6WohxmhVtPklHqhVDdMNQfER2W+lsoo
	bzRWqL5SFPlZBrk2uw0Uzl7tM6aldkNCf+LJf/2+GqP/oOtRFOwDsbU1hYX+PP7gZmfjHeKFuL4ia
	DTe+0Gci7Uh6MypWDl9RnyWl5Gz4FCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qW0ke-002QOd-2l;
	Tue, 15 Aug 2023 20:34:52 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qW0ka-002QNd-1V
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 20:34:52 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d664f9c5b92so5424048276.3
        for <linux-riscv@lists.infradead.org>; Tue, 15 Aug 2023 13:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692131687; x=1692736487;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vu3YlGSzqXzwwgWi/q2n2LUyYRgXMju9WJu57GL76pk=;
        b=20AONJpHkDmgRGgvrCxY0YZ8+qqnTitvPIFm7bIiayyUYFEQqFxqWYX8evjU2xIyUw
         kjDuIsOilMdRoalLKR77olLsbFjaAed3/7DHNZLY8sSj7RzpE3XHC1oIJpS5fO3DdjZs
         eGslVcDajvPI8Rde/nLOFVgo9XIrAhuny8kJs3Bti6SoSKx0omgX3hzEuQX36GvVbFff
         2deWtQZiWKLYyFOy6UiM2NxkHW3lvNnozvk+9w3XjLcmLksHncKXXh4v5EzHm4vLOyJc
         HBhwBE8ay/jX0hjbzZVvnLB1TnzbvlCw64myqkQrR1wHFoJU0qpNclkIh421HKlMKCTj
         foPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692131687; x=1692736487;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vu3YlGSzqXzwwgWi/q2n2LUyYRgXMju9WJu57GL76pk=;
        b=irXx7HOnJJf9lpL0zNzpdi7SyLPIxv6SHvslJwBR3mIXfC5Z8xOBFMDGTE7eYQS170
         kBCwaUllKLbTvYUiq2jcc4upYkWhOft868MaBl2Fi3f2y8qJs8/c5uxHOpWEY+ULj6RK
         62FTFGP/IDGwLS+YN7bMCiMtL0PPyIWoS3nqpsw6/VjenpDFMVOYSRCRfzOgC31aG96V
         KK09JDSNpO+I54fHnL0ZYoGytA9zcZQT1aj9liEWMb5taEbkeGExzKsZcp34hak8iY6V
         eW+2yXXlEzbYDlCJn1fjrTTwsvLX6UwBAhCTBDECrXWuLJKODmTW0MX7v4lC5ehlnpl1
         stzA==
X-Gm-Message-State: AOJu0Yz6CwVz4WPuhSGeDXFEGhd2jqyMFMQduFIYsZcsJ3b1zjevPeBG
	h3MrKjRCnTb6IZvOXW3BXgaJlgRyB5F8Ffc4ZaY=
X-Google-Smtp-Source: AGHT+IEEEB9RkxNGC3nmjrLzfqaEjo04hgJYb9l9GY8BmhXIPcxgYphL1eVtvENoj53ebcdCaRYUhQD32EVakIpj8/M=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:6902:565:b0:d18:73fc:40af with
 SMTP id a5-20020a056902056500b00d1873fc40afmr177279ybt.5.1692131686943; Tue,
 15 Aug 2023 13:34:46 -0700 (PDT)
Date: Tue, 15 Aug 2023 20:34:43 +0000
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3258; i=samitolvanen@google.com;
 h=from:subject; bh=27ja0uIMORSaGulxExOcQfSpvjxiVAnXn8qbTbuF2b0=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBk2+Fi/AuN72l+gcV8yqSSBdN3XwK5ap26p2ccW
 t4HA4fLgSGJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZNvhYgAKCRBMtfaEi7xW
 7r6jC/sH51moOTq9GAgfZW4dtbVJIZrfYUSzK4jLvJmepsTXYq94/9JqoarL8IMhVnGC323YKZr
 E8A8U0U0WxapNQYW0Z0Q6wamv9b2xwueVG8zXctXXNPZsr8+jSzettmfIZjoB2uhItHSpHotq70
 iaOJ0gj83hEfx5sej+dGuPOo1tlpXxS1TYm7BVRz+7mAg8U1+4tFwVTi/22JzmAmvNwhc6YeEgX
 uE+/tftT10bAT8AEYZYiX3Q+MMBvT6cQtj5ybfDWHwHkd4hhWXNlIw9k+gaFc1L2/yoPx53SwS+
 ISUe54u+RjDb3YNfPy4JpwNdXcFQl3F3Aq7C0d2jI92BeRVINzB9MB1EtqPf01LvLnje/IhJJci
 ckDpO8njNWQ7J30a147p197hlPwd3LLqXp1YNxeBugtDRxtrbe9dAE1gUQJ3MbzGyhbJAmM5r3S /Li1U6ZyGOsoSDe2NClMgfhbi1GavCoEXC7ieC0iD4U6Oyxr4auvV2u+bGy0MWWimJbx8=
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
Message-ID: <20230815203442.1608773-8-samitolvanen@google.com>
Subject: [PATCH v2 0/6] riscv: SCS support
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Guo Ren <guoren@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Fangrui Song <maskray@google.com>, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_133448_545894_75FAA797 
X-CRM114-Status: GOOD (  16.55  )
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
when CONFIG_IRQ_STACKS is enabled. Patch 6 fixes the backward-
edge CFI test in lkdtm for RISC-V.

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

---

Changes in v2:
  - Fixed asm_per_cpu with !CONFIG_SMP.
  - Added patch 6 to fix the CFI_BACKWARD lkdtm test.
  - Rebased on top of -rc6.

---

Deepak Gupta (1):
  riscv: VMAP_STACK overflow detection thread-safe

Sami Tolvanen (5):
  riscv: Deduplicate IRQ stack switching
  riscv: Move global pointer loading to a macro
  riscv: Implement Shadow Call Stack
  riscv: Use separate IRQ shadow call stacks
  lkdtm: Fix CFI_BACKWARD on RISC-V

 arch/riscv/Kconfig                   |   6 ++
 arch/riscv/Makefile                  |   4 +
 arch/riscv/include/asm/asm.h         |  41 +++++++++
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
 drivers/misc/lkdtm/cfi.c             |  13 ++-
 15 files changed, 245 insertions(+), 170 deletions(-)
 create mode 100644 arch/riscv/include/asm/scs.h


base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
-- 
2.41.0.694.ge786442a9b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
