Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08E2606A329
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 06:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FtcLr63W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vvSfxHwGCByXjLk2B1rzd8V1FIeO+E+eleEvCXKrbzg=; b=FtcLr63WLq7o0L
	a1/ks0T4zkVGmLTEn1pZf8y3z5UTXU81UOHcKIBCBi00U541zTH/WqgP0xFYai4ljWyMPwCLvGz5u
	g2u1CIisj/mK6bvtqujrFyo8AHRgP/ZlUQOMsDnWCOEV6Wocg/uAFFr2RBB3EEzPHflzK5pigsWwj
	ucV5jFI/w3sB2KcW1z+fnAB53pxifJInXpfYYylm+IVYpQv35q4qpY8alXArTBJV+k+BG6ZMaXvs6
	Zd+a3wPxKLCd8fJw82MM0nKtVCbv/S3PKXixIzAP0IG1ASYtTXeOM9tCQiDHs9vC7ANCq69lZFWHE
	xSqM24hLU8dGVdM7RjCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ3Xo-00000008wIl-3uVV;
	Tue, 20 Oct 2026 06:41:56 +0000
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net ([162.243.161.220])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ3Xh-00000008wGH-2Af4
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 06:41:53 +0000
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app1 (Coremail) with SMTP id TAJkCgDniXMgDddqfWGHAA--.19571S2;
	Tue, 20 Oct 2026 14:41:37 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Nam Cao <namcao@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: [PATCH v4 0/2] riscv: kprobes: simulate nop and c.nop instructions
Date: Tue, 20 Oct 2026 14:41:34 +0800
Message-Id: <20261020064136.665-1-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: TAJkCgDniXMgDddqfWGHAA--.19571S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFyfWr1DZr47Xr4xur4xtFb_yoW5WF43pF
	sIkwn8Kr4kJwnxC3sxAw4xZFWrKws7Jw4fJF47t34rta1UKF13tFn2g3y5ZFnxWw4Fg34a
	vF17Wryvkry7ArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUva14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyT
	uYvjfUYCJmUUUUU
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAQEGE2rWRjQeDAAAsJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_234149_687613_B34A7248 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.6 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

Changes since v3:
- patch 1: drop the NOP/C.NOP encoding comment (per Nam Cao's review;
  the other macros have none, and the encodings are in the spec).
- collect Reviewed-by from Nam Cao on both patches.
- re-ran the QEMU benchmark on a next-20261019 base: uprobe per-hit
  cost drops by roughly 70 percent and kprobe by roughly 30 percent,
  the same magnitude as v3.

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

 arch/riscv/include/asm/insn.h                 |  7 ++++++
 arch/riscv/kernel/probes/decode-insn.c        |  6 +++++
 arch/riscv/kernel/probes/simulate-insn.c      | 14 +++++++++++
 arch/riscv/kernel/probes/simulate-insn.h      |  2 ++
 .../kernel/tests/kprobes/test-kprobes-asm.S   | 23 +++++++++++++++++++
 5 files changed, 52 insertions(+)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
