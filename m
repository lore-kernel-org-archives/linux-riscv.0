Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D6BC38142
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 13:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FQW282wr3tHaKkelDBK7jQoifCgNmJe//iXjFnkOpSA=; b=l60m5yDYzVGVoQ
	iqx5dgnsRrAwPM06GUUj5pitVKJse6xgAHKD7VSHHIb8z1uT0wgekH4jjFPAVCbopYLVVUr2/iluu
	/a/XTOQFFq6JkGnV1ii4cxhnvLrtho94NnznrEnQqkqymXNhnqYsPMAItZM8fRSG1gNZfqJ/V4kgd
	gm/maADdq6i8MiK2LL/m9DiNgbhv9HOBUQlwPQEPrxZc0EBZm/oHS2218+codRxl4lJLSK/+AVRnD
	zf6ZLHmkLhgdlyMT/0+g+3lifpZCWlCYDXy0UPtxMmdewXBVnD+GRLczYbzeH8W3mEih/Fk9jVTrT
	ug+j0h2nOEKy7oZRpGDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOqv-00F1lX-D7; Fri, 27 Jan 2023 13:33:13 +0000
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOR0-00EryB-GW
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 13:06:40 +0000
Received: from cgk-Precision-3650-Tower.. (unknown [219.141.235.82])
	by APP-01 (Coremail) with SMTP id qwCowADX3Eg9zNNjDyF3Ag--.52827S4;
	Fri, 27 Jan 2023 21:06:05 +0800 (CST)
From: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org,
	mingo@redhat.com,
	sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liaochang1@huawei.com,
	Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Subject: [PATCH v6 00/13] Add OPTPROBES feature on RISCV
Date: Fri, 27 Jan 2023 21:05:28 +0800
Message-Id: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowADX3Eg9zNNjDyF3Ag--.52827S4
X-Coremail-Antispam: 1UD129KBjvJXoWxKFW5JrWkGr1rCF4fCF1fCrg_yoW7Wr4kpa
	ykGw45GrWDJF4xG3y3Jw4kua4Syan5Gw43ur1UXw1Fy3y5tryFy3ZagFZ8AF1xCFs0g342
	vFn09ryv9Fy5Z3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8v
	x2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY02Avz4vE14v_Xr4l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUaeHDUUUUU=
X-Originating-IP: [219.141.235.82]
X-CM-SenderInfo: xfkh0w5xrntxyrx6ztxlovh3xfdvhtffof0/1tbiCQcEE2PSoZK4EQABsz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_050627_175126_604F1A1D 
X-CRM114-Status: GOOD (  15.89  )
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

Add jump optimization support for RISC-V.

Replaces ebreak instructions used by normal kprobes with an AUIPC/JALR
instruction pair with the aim of suppressing the probe-hit overhead.

All known optprobe-capable RISC architectures have been using a single
jump or branch instructions while this patch chooses not. RISC-V has a
quite limited jump range (4KB or 2MB) for both its branch and jump
instructions, which prevent optimizations from supporting probes that
spread all over the kernel.

AUIPC/JALR instruction pair is introduced with a much wider jump range
(4GB), where AUIPC loads the upper 12 bits to a free register and JALR
Deaconappends the lower 20 bits to form a 32 bits immediate. Note that
returns from probe handler require another free register. As kprobes
can appear almost anywhere inside the kernel, the free register should
be found generically, not depending on calling convention or any other
regulations.

The algorithm for finding the free register is inspired by the register
renaming in modern processors. From the perspective of register
renaming, a register could be represented as two different registers if
two neighbor instructions both write to it but no one ever reads it.
Extending this fact, a register is considered to be free if there is no
read before its next write in the execution flow. We are free to change
its value without interfering normal execution.

Static analysis shows that 51% of instructions of the kernel (default
config) is capable of being replaced i.e. one free register can be found
at both the start and end of replaced instruction pairs while the
replaced instructions can be directly executed. We also made an
efficiency test on Gem 5 RISCV which shows a more than 5x speedup on 
breakpoint-based implementation.

Contribution:
Chen Guokai invents the algorithm for searching free register, evaluate
the ratio of optimization, the basic function support RVI kernel binary.
Liao Chang adds the support for hybrid RVI and RVC kernel binary, fix
some bugs with different kernel configure, refactor out the entire
feature into some individual patches.

v6:
1. Correct grammar and spelling errors in commit and comment.
2. Add instruction boundary check for RVI/RVC hybrid kernel.
3. Use addi/c.addi instead of 'nop/c.nop' in the detour assembly
   template.
4. Fix the instruction simulation of JALR.
5. Mark some symbols used in the path of kprobe and uprobe handler as
   NOKPROBE.
6. Add one selftest testcase that cover more complex opcode pattern in
   the code of decoding instruction and searching free register.
7. Run all tests in tools/testing/selftests/ftrace on RISCV64 QEMU
   platform, no regression.
8. Run with the CONFIG_KPROBES_SANITY_TEST module on RISCV64 QEMU
   platform, no regression.

v5:
1. Correct known nits
2. Enable the usage of unused caller-saved registers
3. Append an efficiency test result on Gem 5

v4:
Correct the sequence of Signed-off-by and Co-developed-by.

v3:
1. Support of hybrid RVI and RVC kernel binary.
2. Refactor out entire feature into some individual patches.

v2:
1. Adjust comments
2. Remove improper copyright
3. Clean up format issues that is no common practice
4. Extract common definition of instruction decoder
5. Fix race issue in SMP platform.

v1:
Chen Guokai contribute the basic functionality code.

Chen Guokai (1):
  riscv/kprobe: Search free registers from unused caller-saved ones

Liao Chang (12):
  riscv/kprobe: Prepare the skeleton to implement RISCV OPTPROBES
  riscv/kprobe: Allocate detour buffer from module region
  riscv/kprobe: Add skeleton for preparing optimized kprobe
  riscv/kprobe: Add common RVI and RVC instruction decoder code
  riscv/kprobe: Introduce free register(s) searching algorithm
  riscv/kprobe: Add code to check if kprobe can be optimized
  riscv/kprobe: Prepare detour buffer for optimized kprobe
  riscv/kprobe: Patch AUIPC/JALR pair to optimize kprobe
  riscv/kprobe: Add instruction boundary check for RVI/RVC hybrid kernel
  riscv/kprobe: Fix instruction simulation of JALR
  riscv/kprobe: Move exception related symbols to .kprobe_blacklist
  selftest/kprobes: Add testcase for kprobe SYM[+offs]

 arch/riscv/Kconfig                            |   1 +
 arch/riscv/include/asm/asm.h                  |  10 +
 arch/riscv/include/asm/bug.h                  |   5 +-
 arch/riscv/include/asm/kprobes.h              |  49 ++
 arch/riscv/include/asm/patch.h                |   1 +
 arch/riscv/kernel/entry.S                     |  12 +
 arch/riscv/kernel/mcount.S                    |   1 +
 arch/riscv/kernel/patch.c                     |  23 +-
 arch/riscv/kernel/probes/Makefile             |   1 +
 arch/riscv/kernel/probes/decode-insn.h        | 177 +++++
 arch/riscv/kernel/probes/kprobes.c            |  48 +-
 arch/riscv/kernel/probes/opt.c                | 684 ++++++++++++++++++
 arch/riscv/kernel/probes/opt_trampoline.S     | 137 ++++
 arch/riscv/kernel/probes/simulate-insn.c      |   6 +-
 arch/riscv/kernel/probes/simulate-insn.h      |  42 ++
 .../ftrace/test.d/kprobe/kprobe_sym_offs.tc   |  49 ++
 16 files changed, 1235 insertions(+), 11 deletions(-)
 create mode 100644 arch/riscv/kernel/probes/opt.c
 create mode 100644 arch/riscv/kernel/probes/opt_trampoline.S
 create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_sym_offs.tc

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
