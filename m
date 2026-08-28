Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCEDC61DC6
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 09:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=io+lsMqkKszpqV0VAcFyF5oWiEqSQsXDAorwmR3oKPo=; b=qUPJao9aR/oNOg
	SAB6v6NXcPEjd9LAeU8VpMdRzpc5sWJ87D/WRZEEWuJBViUS5uPhKDR3Erwaw4MUJCCBi/YrI5x5c
	U5mqAEQLxUbpyxNgXHrKXVtvR57z3RxTUCO+IVDmPC1QF4HyJ31cAfsmU3kLj9Nr5HKnTyTlq0nK4
	5/qo+CRACR1zZZeygPv9BvYmVJPRwXV0UU5+erU+I/Zh93Fy5QW+SBFPU/FccYjTlAPhoWh1re4Ch
	2IIS37317RAuZCX9Ok9p/zIYZ3K/8lejdfUt4O8Il/gL2PHqA9nYB07O7d7ftftWHMBRiLWPWJ7TK
	HGxPLhUx1SWvBA5B57VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsdm-00000005PTI-0n0d;
	Fri, 28 Aug 2026 09:12:50 +0000
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsdh-00000005PRf-2BLE
	for linux-riscv@lists.infradead.org;
	Fri, 28 Aug 2026 09:12:48 +0000
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app2 (Coremail) with SMTP id TQJkCgAXHpwAUZFq3NppAA--.5375S2;
	Fri, 28 Aug 2026 17:12:33 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Nam Cao <namcao@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: [PATCH v4 0/2] riscv: kprobes: reject probes inside LR/SC sequences
Date: Fri, 28 Aug 2026 17:12:00 +0800
Message-Id: <20260828091202.1124-1-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
MIME-Version: 1.0
X-CM-TRANSID: TQJkCgAXHpwAUZFq3NppAA--.5375S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr4ktF4fCw15Kr1xXw45trb_yoW8ZF13pF
	Z8Gw15JrWkXw1xJryfZr48AFySkayrXr43Jrn7tw1Sk3y8Jr4ftFn7K3y5KwnxCrs0qw1f
	Zr1vqr9Y9347AFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUva14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
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
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAgENE2qQZyIWlAABsh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_021245_715838_72B24448 
X-CRM114-Status: UNSURE (   7.61  )
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

A breakpoint trap taken in the middle of an LR/SC sequence clears the
load reservation, so an SC following the probed instruction always fails
and the enclosing retry loop re-enters the breakpoint, livelocking the
CPU.

This series makes the RISC-V kprobes implementation reject probes placed
inside an LR/SC sequence:

  - patch 1 detects the sequences (insn.h decoding helpers, reject list
    in decode-insn.c, and a forward scan from the function start in
    kprobes.c).
  - patch 2 adds a KUnit test that registers a probe inside and right
    after a hand-written LR/SC loop and checks rejection/acceptance.

Changes in v4:
  - v3 walked backwards from the probe to find an open LR.  That was
    wrong twice: the LR/SC state was toggled in the reverse order, and
    worse, a backward walk is fundamentally ambiguous in RISC-V (the
    halfword at addr-2 may be a compressed instruction or the upper
    half of a 32-bit instruction, and the length bits cannot be
    trusted).  v4 walks forward from the function start instead, a
    known instruction boundary.
  - document the kallsyms_lookup_size_offset() offset-0 caveat in the
    commit message, and test it with local (.L) labels so probe
    addresses never coincide with kallsyms symbols inside the sequence.
  - the KUnit test (patch 2) is new in v4.  No earlier version had a
    dedicated LR/SC test, which is why the backward-scan bugs went
    unnoticed.

Link: https://lore.kernel.org/linux-riscv/REPLACE-WITH-V3-MSGID/

Xiaofeng Yuan (2):
  riscv: probes: reject kprobes inside LR/SC sequences
  riscv: kprobes: add KUnit test for LR/SC sequence rejection

 arch/riscv/include/asm/insn.h                 | 18 +++++++
 arch/riscv/kernel/probes/decode-insn.c        |  2 +
 arch/riscv/kernel/probes/kprobes.c            | 54 +++++++++++++++++++
 .../kernel/tests/kprobes/test-kprobes-asm.S   | 19 +++++++
 .../riscv/kernel/tests/kprobes/test-kprobes.c | 19 +++++++
 .../riscv/kernel/tests/kprobes/test-kprobes.h |  6 +++
 6 files changed, 118 insertions(+)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
