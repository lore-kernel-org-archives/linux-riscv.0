Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFA2C4321E
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Nov 2022 10:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AbnDB8hinz038jF4TSMn4FcCDtDopnFJBIfMHp9L2Vk=; b=PPdRxLzqQRIewQ
	pFLE6zcmdp0KDEhMHDbXlQi0vscBS2Oq22V7BGOVhd+0nS2wsrnAsfoYr7kQL+cg2cgLvN/7UnfuD
	v3jK9Uec4at1sg10t4ErQMMk+mOzs3OfiITsCTiWlnUEFiSLNAhNHTI0TgUoXUGcx1EuB5uXBCrCq
	q4VDqjRt6F3kslkZLVytOtAxUGJWcbi3bcx6n1O4hIpHSZ6MU8UFSh3bI+sWZ0fcD//9Eg47Gttp5
	ZdfZiDSn/2ftq/AUhU+FW8cM7FuizBq8lgK0XP1p+NpVcf/xFO97HKpqNIHDpXDcKIRIrXzCjdaT8
	GvJcBB2SnqqIJdPIiZ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orcVa-007ugc-JH; Sun, 06 Nov 2022 10:04:06 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orcVL-007uWS-2A
	for linux-riscv@lists.infradead.org; Sun, 06 Nov 2022 10:03:58 +0000
Received: from cgk-Precision-3650-Tower.. (unknown [219.141.235.82])
	by APP-05 (Coremail) with SMTP id zQCowACnrKByhmdj7bRnCA--.7053S4;
	Sun, 06 Nov 2022 18:03:31 +0800 (CST)
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
	Liao Chang <liaoclark@163.com>
Subject: [PATCH v4 0/8] Add OPTPROBES feature on RISCV
Date: Sun,  6 Nov 2022 18:03:08 +0800
Message-Id: <20221106100316.2803176-1-chenguokai17@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowACnrKByhmdj7bRnCA--.7053S4
X-Coremail-Antispam: 1UD129KBjvJXoWxXw18Zry7Zw1DWFyDZr43KFg_yoWrGr4UpF
	WkKw45JrWUAr4fCrW3Jr4kuFySkan5Gw43ur1UJ34rX3y3JryFy3ZagayUZF15GF4Y934j
	qrn09ryvkFy5A3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28I
	cVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx
	0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwAC
	I402YVCY1x02628vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07b52NNUUUUU=
X-Originating-IP: [219.141.235.82]
X-CM-SenderInfo: xfkh0w5xrntxyrx6ztxlovh3xfdvhtffof0/1tbiCgUCE2NnSRxR0wAAsN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_020351_764923_3A8F673C 
X-CRM114-Status: GOOD (  13.02  )
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

From: Liao Chang <liaoclark@163.com>

From: Liao Chang <liaochang1@huawei.com>

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
renaming in modern processors. From the perspective of register renaming,
a register could be represented as two different registers if two neighbour
instructions both write to it but no one ever reads. Extending this fact,
a register is considered to be free if there is no read before its next
write in the execution flow. We are free to change its value without
interfering normal execution.

Static analysis shows that 51% instructions of the kernel (default config)
is capable of being replaced i.e. one free register can be found at both
the start and end of replaced instruction pairs while the replaced
instructions can be directly executed.

Contribution:
Chen Guokai invents the algorithm of searching free register, evaluate
the ratio of optimizaion, the basic function support RVI kernel binary.
Liao Chang adds the support for hybrid RVI and RVC kernel binary, fix
some bugs with different kernel configure, refactor out entire feature
into some individual patches.

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
 arch/riscv/include/asm/kprobes.h          |  48 ++
 arch/riscv/include/asm/patch.h            |   1 +
 arch/riscv/kernel/patch.c                 |  22 +-
 arch/riscv/kernel/probes/Makefile         |   1 +
 arch/riscv/kernel/probes/decode-insn.h    | 145 ++++++
 arch/riscv/kernel/probes/kprobes.c        |  25 +
 arch/riscv/kernel/probes/opt.c            | 602 ++++++++++++++++++++++
 arch/riscv/kernel/probes/opt_trampoline.S | 137 +++++
 arch/riscv/kernel/probes/simulate-insn.h  |  41 ++
 11 files changed, 1023 insertions(+), 5 deletions(-)
 create mode 100644 arch/riscv/kernel/probes/opt.c
 create mode 100644 arch/riscv/kernel/probes/opt_trampoline.S

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
