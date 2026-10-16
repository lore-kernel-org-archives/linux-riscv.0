Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D279CC6B38
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 08:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BcddpLTYQONeqU1+qpXyzX0YvLI16UY2P/4NfKMc/4w=; b=Sxua1RL6ONeAkG
	LMIYsDCowOEawkU8BPeLc/yl0JuenKYVpZYAzGJMKcXQtrGjfVh4s475Fd07Yk8DX4282Rl5s6XIB
	GSlzcNyQQf9IIknYHc4z4Bs0yHWZM9E2LgiI90+CKq/4GQ8+V5UCnsfA6g2MCqhNHxumGRifYgpdg
	W1Mc5Ig9PTrmXjLteS6ILyPO0X865xKASjxUJKnA1SsmxFmXYaB4rcujXPGpZ3SC1W1Ue4Rj662ix
	sCoWak9jU0OFpZKzLnR8rYBmxXO5EV2DnVePgS5sj2p50jrMFIHBm4wy8nsVDCF+Ma1xph4eKV5nP
	iwRlpac0V1jYA6Uc+5QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHd86-00000002JXn-1FhT;
	Fri, 16 Oct 2026 08:17:30 +0000
Received: from azure-sdnproxy.icoremail.net ([13.75.44.102])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHd82-00000002JUX-0AZm
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 08:17:27 +0000
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app2 (Coremail) with SMTP id TQJkCgAXLqGD3dFqtNKGAA--.25396S2;
	Fri, 16 Oct 2026 16:17:08 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>,
	Naveen N Rao <naveen@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: [PATCH v6 0/2] riscv: kprobes: reject probes inside LR/SC sequences
Date: Fri, 16 Oct 2026 16:17:04 +0800
Message-Id: <20261016081706.1085-1-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
MIME-Version: 1.0
X-CM-TRANSID: TQJkCgAXLqGD3dFqtNKGAA--.25396S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr4ktF4fCF48JF1rWFyDKFg_yoW8Xr43pF
	s5Gwn8KrWkXw4fGry3uw4kZryft3yrJw43JFnrCw1jy3yUAr13tFnag3yUG34kCrZ0q34a
	vr18XrZ8WFy7ZrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAgECE2rRAKkT-wAAss
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_011726_405194_CF96B628 
X-CRM114-Status: UNSURE (   7.79  )
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
CPU.  This series makes the RISC-V kprobes implementation reject probes
placed on an LR/SC instruction or between them, following arm64's
approach for its equivalent exclusive load/store instructions.

Changes since v5:
- Fix a dangling stack pointer in the KUnit test: a probe that was
  expected to be rejected but was unexpectedly registered stayed on
  a stack-allocated kprobe.
- Add Acked-by: Masami Hiramatsu to the implementation patch.
- Annotate that test_kprobes_lrsc() is never executed and that
  reject[] must match the length of test_kprobes_lrsc_offsets[].

Verified by cross-compiling for RISC-V and running the kprobes KUnit
test in QEMU (ok 2 kprobes_riscv).

Xiaofeng Yuan (2):
  riscv: kprobes: reject probes inside LR/SC sequences
  riscv: kprobes: add KUnit test for LR/SC sequence rejection

 arch/riscv/include/asm/insn.h                 | 33 ++++++++++
 arch/riscv/kernel/probes/decode-insn.c        |  2 +
 arch/riscv/kernel/probes/kprobes.c            | 63 +++++++++++++++----
 .../kernel/tests/kprobes/test-kprobes-asm.S   | 30 +++++++++
 .../riscv/kernel/tests/kprobes/test-kprobes.c | 31 +++++++++
 .../riscv/kernel/tests/kprobes/test-kprobes.h |  3 +
 6 files changed, 150 insertions(+), 12 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
