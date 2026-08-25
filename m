Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9433C61DBE
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 12:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JoZMsBOnArt4HiYCr6eEsdzkRLUwq4gOwZfW+WI55B8=; b=x9mBnyIAM5em/Z
	4QcWKswtlHnPOEvAPy6q3pW0LOrka8QI0u9FzDXCo0tTWn0WM5zEt3rVxwzq5peDwmd8ShJC1ZIV4
	8UjP4wOyRg8140UAb2a/FZhwgosyIT2L1gxg4kfrJ69GyrZ+Ogd0y5/MYakBg9MpHfYVGWmYsMAcT
	h9mgYbNRgoq5ETyALpYNV/QOiXmBalCkYw2ja1mQkNnn7H0NO9nZuMzbXF8s5mkdTt6AZE6SnwFF8
	/BbTtJlgnDnH13Gf5lOQ9RIneZwmzpoEDYEleiczkALimTxqSRoTvKRQdO36Z+gvasZLLsTeUP/Ka
	A7IiI6LzOr7wXbDJj2Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyq9I-00000000kpE-3adS;
	Tue, 25 Aug 2026 12:21:04 +0000
Received: from azure-sdnproxy.icoremail.net ([13.75.44.102])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyq9F-00000000knT-1evL
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 12:21:02 +0000
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app2 (Coremail) with SMTP id TQJkCgB3jaCbiI1q14xgAA--.39139S2;
	Tue, 25 Aug 2026 20:20:44 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Nam Cao <namcao@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: [PATCH v2 0/2] riscv: kprobes: simulate nop and c.nop instructions
Date: Tue, 25 Aug 2026 20:20:18 +0800
Message-Id: <20260825122020.1192-1-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
MIME-Version: 1.0
X-CM-TRANSID: TQJkCgB3jaCbiI1q14xgAA--.39139S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ArW3Cry8Kr47Wr4fJw13urg_yoW8AFW7pF
	Z0kw15tr4kArs7Cry3Ar47tr4fKw4rGr43XF43J34Sqw15KF1avF9xK3yY93ZrGwsIq342
	vF17WrWDua4UZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv214x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa
	7VUjuHq7UUUUU==
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAQEKE2qMciweIgABsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_052101_751036_A65D9D51 
X-CRM114-Status: UNSURE (   8.98  )
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

nop and c.nop have no architectural effect, so handling them through
an out-of-line instruction slot and single-stepping is pure overhead.
This series simulates them directly in the breakpoint handler by
advancing the program counter, following the approach already used on
arm64, and extends the RISC-V kprobes KUnit test to cover both paths.

riscv_probe_decode_insn() is shared by kprobes and uprobes, so the
simulation also applies to uprobes placed on nop instructions. This is
relevant for USDT probe sites in user-space binaries, which are
nop/c.nop instructions on RISC-V, the same use case that motivated the
arm64 implementation. In kernel text, nops are also found at ftrace
mcount call sites and disabled jump_label sites.

Measured on QEMU (RISC-V virt, emulated), this reduces the per-hit
cost of a kprobe on a nop by roughly 40% compared to single-stepping
through the out-of-line slot.

Changes since v1:
- patch 1: add the above use-case justification and benchmark result
  to the commit message (per Nam Cao's review).
- patch 2: simplify the test functions to load KPROBE_TEST_MAGIC
  directly instead of splitting it into LOWER/UPPER halves (per Nam
  Cao's review).

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
