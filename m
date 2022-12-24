Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72807C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Dec 2022 15:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tzNNstHjmej/fX2IIa9A2NfypXr961f+6B1K9n8RMD0=; b=1aNmiYUqX8+DV1
	WvaXf6+JqshDqbUmICIyZJDNvQhtcSvpTTMHQkOhEnx50lPh3FA14HPoWC3NzoRuDLuTtpv0aaK/t
	MutE/bJl/zzijExxMZojpGKc9dlbjzWEk2wKaIwadA/JEGq4LzVd8drClKiWPh9QKsi9DhX3CdeT9
	NsGaKmJeCQPli07PBTG5n/2JcT6y9c412QcXfHyiGnrXIzj1jwLIBhHF0DjCqIZuXfGh2zec3TtcJ
	EccjQ9NksCIVOkK+FL4TbCZEgtP3Q0GAn9DyheXh9kUHZJv5eo2oDuHiJIvVb/KhumOCVm3+aj6U5
	G+ZVsachMq8tDNuha22g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p96Lw-00131G-Kj; Sat, 24 Dec 2022 15:22:24 +0000
Received: from smtp23.cstnet.cn ([159.226.251.23] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p92wO-00H5uk-K9
	for linux-riscv@lists.infradead.org; Sat, 24 Dec 2022 11:43:55 +0000
Received: from cgk-Precision-3650-Tower.. (unknown [219.141.235.82])
	by APP-03 (Coremail) with SMTP id rQCowABXXpbf5aZj9dVkCA--.18955S4;
	Sat, 24 Dec 2022 19:43:27 +0800 (CST)
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
Subject: [PATCH v5 0/9] Add OPTPROBES feature on RISCV
Date: Sat, 24 Dec 2022 19:43:06 +0800
Message-Id: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowABXXpbf5aZj9dVkCA--.18955S4
X-Coremail-Antispam: 1UD129KBjvJXoWxWrWkAw1fZF4rAw45tr4fKrg_yoWrWr48pF
	WkKw45ArWDJr43CrW3Jw4kuFySkan3Gw43ur1DX34rJw45JryFy3ZagFWDZF1xCF4Y934j
	qFn09ryvkFy5A3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9K14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc2xSY4AK67AK6r4kMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU5UDJDUUUU
X-Originating-IP: [219.141.235.82]
X-CM-SenderInfo: xfkh0w5xrntxyrx6ztxlovh3xfdvhtffof0/1tbiCQAKE2OmnPBm8wAAss
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221224_034349_198862_EC74DCE0 
X-CRM114-Status: GOOD (  13.44  )
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

Replaces ebreak instructions used by normal kprobes with an
auipc+jalr instruction pair, at the aim of suppressing the probe-hit
overhead.

All known optprobe-capable RISC architectures have been using a single
jump or branch instructions while this patch chooses not. RISC-V has a
quite limited jump range (4KB or 2MB) for both its branch and jump
instructions, which prevent optimizations from supporting probes that
spread all over the kernel.

Auipc-jalr instruction pair is introduced with a much wider jump range
(4GB), where auipc loads the upper 12 bits to a free register and jalr
Deaconappends the lower 20 bits to form a 32 bit immediate. Note that
returns from probe handler requires another free register. As kprobes
can appear almost anywhere inside the kernel, the free register should
be found in a generic way, not depending on calling convention or any
other regulations.

The algorithm for finding the free register is inspired by the register
renaming in modern processors. From the perspective of register
renaming,
a register could be represented as two different registers if two
neighbour
instructions both write to it but no one ever reads. Extending this
fact,
a register is considered to be free if there is no read before its next
write in the execution flow. We are free to change its value without
interfering normal execution.

Static analysis shows that 51% instructions of the kernel (default
config)
is capable of being replaced i.e. one free register can be found at both
the start and end of replaced instruction pairs while the replaced
instructions can be directly executed. We also made an efficiency test
on Gem 5 RISCV which shows a more than 5x speedup on breakpoint-based
implementation.

Contribution:
Chen Guokai invents the algorithm of searching free register, evaluate
the ratio of optimizaion, the basic function support RVI kernel binary.
Liao Chang adds the support for hybrid RVI and RVC kernel binary, fix
some bugs with different kernel configure, refactor out entire feature
into some individual patches.

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

Liao Chang (8):
  riscv/kprobe: Prepare the skeleton to implement RISCV OPTPROBES
    feature
  riscv/kprobe: Allocate detour buffer from module area
  riscv/kprobe: Prepare the skeleton to prepare optimized kprobe
  riscv/kprobe: Add common RVI and RVC instruction decoder code
  riscv/kprobe: Search free register(s) to clobber for 'AUIPC/JALR'
  riscv/kprobe: Add code to check if kprobe can be optimized
  riscv/kprobe: Prepare detour buffer for optimized kprobe
  riscv/kprobe: Patch AUIPC/JALR pair to optimize kprobe

 arch/riscv/Kconfig                        |   1 +
 arch/riscv/include/asm/bug.h              |   5 +-
 arch/riscv/include/asm/kprobes.h          |  49 ++
 arch/riscv/include/asm/patch.h            |   1 +
 arch/riscv/kernel/patch.c                 |  23 +-
 arch/riscv/kernel/probes/Makefile         |   1 +
 arch/riscv/kernel/probes/decode-insn.h    | 153 +++++
 arch/riscv/kernel/probes/kprobes.c        |  24 +
 arch/riscv/kernel/probes/opt.c            | 693 ++++++++++++++++++++++
 arch/riscv/kernel/probes/opt_trampoline.S | 137 +++++
 arch/riscv/kernel/probes/simulate-insn.h  |  41 ++
 11 files changed, 1123 insertions(+), 5 deletions(-)
 create mode 100644 arch/riscv/kernel/probes/opt.c
 create mode 100644 arch/riscv/kernel/probes/opt_trampoline.S

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
