Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21131C27C4F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 07:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=exhCNGjI7YGWDoGLgVPGki/XIOrw46kfI1TiIiVmChY=; b=EyVCXGOphZmZ8f
	Ce71lBqYdKzVJh/dON6MJJWW3tfdAt5KRh2jnfU1T6HPsCDM4ndx7GK0BtUJZyJz8tjzVfNglivbx
	Rl4PvzNkuPVJmdJxoVlCxQ6zawqm7cBCDItEeSryY6Fx12wZ7uBD9v5eSpakvQPPaZRzkghjkCrLq
	Uye0I5I7USwtIoxEkbuUawsPH25dagMMdh0/vc4FA0+o1XzhTnhM7V2Ixwa0s13zV9vJjkmM3eJYf
	hYjvwUEC3/OQ9IOciabLm+blYtLfTHsP8Qp37vUZPTbdIHQbjblcVMIZTiYm/aa1p+DjNEY+PRGSW
	gmKYJo31QEPJymCH6oYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHewx-0000000FUMj-24y3;
	Thu, 13 Jun 2024 07:32:47 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHewt-0000000FULc-2o6w
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 07:32:45 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-254c8e27c80so341960fac.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2024 00:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718263960; x=1718868760; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FYkT3MY6oOMowcuPeCUIoQ2Ndwhv5Wfye8oIKBe0p2g=;
        b=IUO8y3Fa6rtLquRn9fLm0KBoN0JQq2AUFIBTXExE4C4LDgONh0/5/wPX3jEigZf2RO
         jnpo2iLKbQ45X3pzSlAr2IZyvd0KyrgxK2lKeIq1TrVpXPVsvurhcvew83T0oohWi4ia
         cJED3jHdCGJw5VtW7spCUbXNYaN2s2EGs4pv2iLnWxcVzu61Ab75oY3ELM446j+u4p12
         FTFKsjgp0kExRtUH9WUaei2v8hBi0DoWQMz1jEQGRu0bT5BFMQpN4QudiXIMPwPUtZm5
         4LGTvOlvKoTrAHyQ1l9kFVfEZFG3gQFReKN1vi0bLkw4jsNugORusb8IMJwwE1yjJ6a8
         wF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718263960; x=1718868760;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYkT3MY6oOMowcuPeCUIoQ2Ndwhv5Wfye8oIKBe0p2g=;
        b=dUg87ZQWMK6sZYvZxgO7DztFLdv1/gVtin/0xWhnNBuGSarf7571eMtq/XTNkGlaS7
         VYE+tyFaKAkEqm8x8vPfiYs2wcsppH/TPqjh4JNufG6159nubtlABMGA50YN0ttu3agd
         T44SJNk9mdlB5DIcxccoVE6VhsJ95PpTe16MjMksQkPXK22V3lA149IVDuo+BhFWge4F
         +bXAcilUMC1jnWLFEgIz8N37GBh/9PZsuCWv8fh3pVfxjg2HzG+IrVUDCvbooGWwnHR6
         BssOrHaFLSzn5sxV9T6Ds7Emw5f7apw60H+wjSTtavoFL3EDH6qE0lJ4E9hWOtVptov4
         tnpg==
X-Forwarded-Encrypted: i=1; AJvYcCWWqmfDCOh3RZ03xFuSFa9bNvNHEn3vbsPx27Jz5vJUh3qU6IHUXe2LBv9Mk90RcYqkLCQC28KbZwz3FHGL/Or//38NbKpNVcGHzYqY6w/h
X-Gm-Message-State: AOJu0YyG/rCIloNnZMQ6p7KLNjGUfBn2uKcMEN9WriY6nzl4yKOUwcok
	ekN99zLLB+NmLGZ9ZpKIuRVibfDzTmqHOuRZ0VlQJBVl5vEI/ZtT5ce8FjWkgC4=
X-Google-Smtp-Source: AGHT+IGmYhRnTeJ1bd7J2EL+xnsQNgi//5OJtSEKyWJEXOiAjofEj7fKYDnP/Ta8QspMsNmDQvrm/A==
X-Received: by 2002:a05:6870:392b:b0:254:8006:8e06 with SMTP id 586e51a60fabf-25514c94529mr4505658fac.31.1718263960249;
        Thu, 13 Jun 2024 00:32:40 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc78a1a0sm730028b3a.0.2024.06.13.00.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 00:32:39 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Subject: [PATCH 0/8] riscv: ftrace: atmoic patching and preempt
 improvements
Date: Thu, 13 Jun 2024 15:11:05 +0800
Message-Id: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAImbamYC/x3MMQqAMAxA0atIZgOtFkGvIg6hiZqlSitFkd7d4
 viG/19IElUSTM0LUbImPUKFbRvwO4VNULkaOtM5M9geWTJS4McjPwHXK5IXzA5HZ9mRMUJ2hFq
 fUVa9//O8lPIBP9tutWkAAAA=
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Puranjay Mohan <puranjay@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Andy Chiu <andy.chiu@sifive.com>, 
 Evgenii Shatokhin <e.shatokhin@yadro.com>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_003243_778973_8A782C0A 
X-CRM114-Status: GOOD (  13.63  )
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

The series is composed by two parts. The first part (1-3) cleans up
existing issues that was found during testing of and not caused by the
implementation. The second part modifies the ftrace code patching
mechanism (4-6) as mentioned above. Then prepare ftrace to be able to
run with kernel preemption (7,8)

---
Andy Chiu (8):
      riscv: stacktrace: convert arch_stack_walk() to noinstr
      tracing: do not trace kernel_text_address()
      riscv: ftrace: support fastcc in Clang for WITH_ARGS
      riscv: ftrace: align patchable functions to 4 Byte boundary
      riscv: ftrace: prepare ftrace for atomic code patching
      riscv: ftrace: do not use stop_machine to update code
      riscv: vector: Support calling schedule() for preemptible Vector
      riscv: ftrace: support PREEMPT

 arch/riscv/Kconfig                 |   3 +-
 arch/riscv/Makefile                |   7 +-
 arch/riscv/include/asm/ftrace.h    |  11 +++
 arch/riscv/include/asm/processor.h |   5 ++
 arch/riscv/include/asm/vector.h    |  22 +++++-
 arch/riscv/kernel/asm-offsets.c    |   7 ++
 arch/riscv/kernel/ftrace.c         | 133 ++++++++++++++++---------------------
 arch/riscv/kernel/mcount-dyn.S     |  25 +++++--
 arch/riscv/kernel/stacktrace.c     |   2 +-
 kernel/extable.c                   |   4 +-
 10 files changed, 129 insertions(+), 90 deletions(-)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240613-dev-andyc-dyn-ftrace-v4-941d4a00ea19

Best regards,
-- 
Andy Chiu <andy.chiu@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
