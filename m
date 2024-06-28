Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34089C2BD09
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 11:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uIV8/bmlPoKOMxNKESVyZG1bu406BTCKcuGogtbkIJE=; b=xmBnA8qpB6d/TV
	X58N2AIpDpGUNTGfdjx4AkHG9YxmghyM/yoEgo2TMtNLW/rDbkSY0oXdwh0+a31z6CiNR6ViWDFUg
	TG4NkPHssceK2Y1/deaQj/BPrU/f2f9GFRhdEgq29affC2HI7AwaBdxccLhxvD0OIEM2IyRbLr67y
	RNwAVHjRR4fZRgwho+LMpcN9TK7dtFj/5P4eiks1K5ICPd+4fLDPXu+lccUpBj2DQ/NSUQt87RaZs
	wK1tVT6O+1s7ViHSwYqZ7Mp395L+W5FUXk/0mM5trR0baG5Jy/qthT759T83DMaGeJiqbdPeQEelX
	a/9oqcjyym/tKqRlhCVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNA5R-0000000DZt9-1ReK;
	Fri, 28 Jun 2024 11:48:17 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNA5O-0000000DZs8-1rpc
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 11:48:16 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5b970a97e8eso240178eaf.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 04:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719575293; x=1720180093; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Go8tsPI3JHaqc+IarHpTHOFjcdklbUr4X/cGV00jz4=;
        b=JOa3SBjm1rUPTnUAi3xTOPyXYlAwi8GVUHQ7Qvlcg836Kfh+3w3S2PSIrqkTHVt2S5
         BdR2ut2qWZLqalBM2O6uS+YraKL5Kf4p1ASpPZKhxzRJC+WJj8E9qwXrIVyfCf2SyiPv
         y9Grr3EcEiAMwF2bfDL/JGmn8aK6Rqjo2JDGL28oFVWd0I2OORYBeeM4hzBJXEuQsedf
         ZEXbAt+6OmuzHvYkPmoWbk7ufNiadgdMHytRalc9eWjhxo4Z6jY7Gzd9oI2sD4FPKjTz
         6BGJ+Eb0UctXR6RSnyFyo0eiJOfsPo1eSpPu+gxlPfkkfGwyJFmCu85Pvhvpud6fTxKp
         473Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719575293; x=1720180093;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Go8tsPI3JHaqc+IarHpTHOFjcdklbUr4X/cGV00jz4=;
        b=pcuiyiZScllXKRhzuuQ4MI4+yrUihFjkPc3WcLR5lBj2E5spLPxfffcZ6lX+6tmOFc
         I9IHxkH+oieFGofRbY5a+1gLFTaSUfwjxQsvHjRJTFhESM3ILwleIotwcIauVMYK61/l
         mXSaR5+hIReGKOCAADFQyDZC+Hhf1UI9Zp2/HbJ+sLo3p3OE9ZtQp9lxDTKJBfmm8HIr
         gpN3SiId92cSZCdWFkYlQxG5+SwouDuFBBn/wHjJU4gVQ4bfAStYJ6I1YvOgnb1Il7jW
         gegPUXV7Z/DlYw6WX0L2QeY9NuKne1AOiNytKrHcC3TLA2v7jGtXrYiGzekxIzCnDK/f
         u0LA==
X-Forwarded-Encrypted: i=1; AJvYcCVCERwfCkS4G9tNKCkOecG8vQBHQ1C6VAOWs97koGAyXf+qh5x9v7HRg11yJarTuN++IJAs37FhcATpTDUBmFOqaOis25pjetynaai+WLga
X-Gm-Message-State: AOJu0YyyJUiNnNPcZS2H3YssclQw3+sFIW84kWeCjUzPaig6wx3vhlt2
	0Yp065tptBmhncVD1RE5xR82yCaPEFoFj9YkJvmITZwCHjVnLL45+8ZYO8yY1h4=
X-Google-Smtp-Source: AGHT+IGxaDreBVCsSLdh9PoJI0Hihs2g42vWKzBlr7lrYPNGCbC+Og4f9H83lvBVMVl6OYqO7WNyog==
X-Received: by 2002:a05:6870:d891:b0:254:7348:9071 with SMTP id 586e51a60fabf-25d0170cec9mr17765030fac.26.1719575292823;
        Fri, 28 Jun 2024 04:48:12 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecfb90sm1377775b3a.139.2024.06.28.04.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 04:48:12 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Subject: [PATCH v2 0/6] riscv: ftrace: atmoic patching and preempt
 improvements
Date: Fri, 28 Jun 2024 19:47:43 +0800
Message-Id: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAN+ifmYC/4WNQQ7CIBBFr9LM2jEMRWNd9R6mCwJTOwvBQEMkT
 e8u9gIu30v++xtkTsIZ7t0GiYtkiaGBPnXgFhuejOIbg1baqCv16LmgDb469DXgvCbrGIvBwZA
 3Vim2NEBbvxPP8jnKj6nxInmNqR5HhX72f7MQKiR76W9M2iniMcsshc8uvmDa9/0L/OJ01L8AA
 AA=
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
 llvm@lists.linux.dev, Evgenii Shatokhin <e.shatokhin@yadro.com>, 
 Andy Chiu <andy.chiu@sifive.com>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_044814_681731_4191846B 
X-CRM114-Status: GOOD (  16.39  )
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

This series is tested after applying the following ftrace/patching in
the fixes branch:

- commit 57a369b6f2ee ("riscv: patch: Flush the icache right after
                        patching to avoid illegal insns")
- commit a2bd3a5b4b63 ("riscv: stacktrace: convert arch_stack_walk() to
                        noinstr")

Changes in v2:
- Drop patch 1 as it is merged through fixes.
- Drop patch 2, which converts kernel_text_address into notrace. As
  users can prevent tracing it by configuring the tracefs.
- Use a more generic way in kconfig to align functions.
- Link to v1: https://lore.kernel.org/r/20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com

---
Andy Chiu (6):
      riscv: ftrace: support fastcc in Clang for WITH_ARGS
      riscv: ftrace: align patchable functions to 4 Byte boundary
      riscv: ftrace: prepare ftrace for atomic code patching
      riscv: ftrace: do not use stop_machine to update code
      riscv: vector: Support calling schedule() for preemptible Vector
      riscv: ftrace: support PREEMPT

 arch/riscv/Kconfig                 |   4 +-
 arch/riscv/include/asm/ftrace.h    |  11 +++
 arch/riscv/include/asm/processor.h |   5 ++
 arch/riscv/include/asm/vector.h    |  22 +++++-
 arch/riscv/kernel/asm-offsets.c    |   7 ++
 arch/riscv/kernel/ftrace.c         | 133 ++++++++++++++++---------------------
 arch/riscv/kernel/mcount-dyn.S     |  25 +++++--
 7 files changed, 121 insertions(+), 86 deletions(-)
---
base-commit: a2bd3a5b4b63b95aea7dbf61d9395cd6696a2bc0
change-id: 20240613-dev-andyc-dyn-ftrace-v4-941d4a00ea19

Best regards,
-- 
Andy Chiu <andy.chiu@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
