Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1BDC61DFD
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 08:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NtIhoTrHpvJrKFgkuHL1OAAXo9TJEWhf5XI5zm3cC2A=; b=EcJLQQAStSfhuj
	yUQWexfIkdcQIEbCatt8ZX0URnQG4IPh3be+gPMb8lurcdAQKqo9WGjs0ydfUWxeeQILQavHLCBkb
	0kCNVSckxcpQ4G50aCO6DK8Df1VgcxBQ3dZbD33BYf9Xg4hu0vG8D/43zzGElWQ6Ml8qJUoIvn2w4
	pDZF4HgnRahWaQaIIu3tf3/+derWP+lDldVSiwCDLU1Yjcn4t6/0OKNi82BhR6zXqh/xbECXH20NS
	PT9Vh6WOEASbAJyHUZKy7iLRl4HRLalVZQNFm/5CaXxkLKZ2ub7lEl743LnTCb84zoUgyvXI0aVeh
	Z+E5GgRqLi/kzFfwZYNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1g1J-0000000E2KZ-45rZ;
	Wed, 02 Sep 2026 08:08:33 +0000
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net ([162.243.161.220])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1g1G-0000000E2JO-2Rp5
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 08:08:32 +0000
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app1 (Coremail) with SMTP id TAJkCgCXKW5z2ZdqoZ96AA--.27641S2;
	Wed, 02 Sep 2026 16:08:21 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Nam Cao <namcao@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: [PATCH v3 0/2] riscv: kprobes: simulate nop and c.nop instructions
Date: Wed,  2 Sep 2026 16:08:15 +0800
Message-Id: <20260902080817.681-1-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
MIME-Version: 1.0
X-CM-TRANSID: TAJkCgCXKW5z2ZdqoZ96AA--.27641S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFWUXFW5GF1xJr4xXr18Xwb_yoW5JF4kpF
	s0kwn8Kr4kJ3Z3Cr9xAw4xAFyrKw4kJw43JF47t34rta15KF15tFnFg3yYvFnxWr4Yg34a
	vF17uryvkry7ArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUva14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyT
	uYvjfUehL0UUUUU
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAgESE2qW-qNgjgAAsN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_010830_789313_9743EAF7 
X-CRM114-Status: UNSURE (   8.63  )
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

Per-hit XOL out-of-line execution of a probed nop costs an extra
exception round-trip (the slot's trailing breakpoint traps back into
the kernel), and for uprobes that round-trip is a full
kernel<->userspace one.  Since these instructions have no
architectural effect, simply advance the program counter inside the
breakpoint handler instead.  riscv_probe_decode_insn() is shared by
kprobes and uprobes, so both benefit.  It primarily matters for
uprobes on USDT sites: under the SystemTap SDT ABI, the recorded
probe location is by construction a plain nop or c.nop.

patch 1: simulate nop and c.nop in the breakpoint handler.
patch 2: extend the RISC-V kprobes KUnit test to cover both.

Measured on QEMU (RISC-V virt, emulated): per-hit cost of a uprobe
on a USDT-style nop site drops by roughly 80 percent; a kprobe on a
nop by roughly 40 percent.  (arm64 commit ac4ad5c09b34 measured ~2x
on real arm64 hardware for the same class of change.)

Changes since v2:
- patch 1: no code change; commit message reworked per Nam Cao's
  review:
  - dropped the kernel-text nop motivation (jump_label text sites
    cannot be kprobed; register_kprobe() rejects them via
    jump_label_text_reserved()), and the mcount claim (the function
    entry instruction is an auipc; the nop sits at +4 only).
  - corrected the attribution of the arm64 prior: ac4ad5c09b34 was
    motivated by uprobe/USDT benchmarks, not by a generic "single
    step is slow" claim.
  - described the per-hit saving precisely in XOL terms (one extra
    exception round-trip; for uprobes a full kernel<->userspace one).
  - added a USDT-form uprobe measurement (ftrace uprobe event,
    emulated QEMU), in the style of the arm64 series numbers.
- patch 2: unchanged.

Changes since v1:
- patch 1: add use-case justification and benchmark result to the
  commit message.
- patch 2: simplify test functions to load KPROBE_TEST_MAGIC
  directly (per review).

Verified by cross-compiling for RISC-V and running the kprobes KUnit
test in QEMU (ok 1 kprobes_riscv).

Xiaofeng Yuan (2):
  riscv: kprobes: simulate nop and c.nop instructions
  riscv: kprobes: add nop and c.nop to the KUnit test

 arch/riscv/include/asm/insn.h                 | 11 +++++++++
 arch/riscv/kernel/probes/decode-insn.c        |  6 +++++
 arch/riscv/kernel/probes/simulate-insn.c      | 14 +++++++++++
 arch/riscv/kernel/probes/simulate-insn.h      |  2 ++
 .../kernel/tests/kprobes/test-kprobes-asm.S   | 23 +++++++++++++++++++
 5 files changed, 56 insertions(+)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
