Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340F5C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 08:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7CQEndd9d5UaY8/WQfBJPJYk9P0LE/NgYAcR2AERp4M=; b=0iOIEK4KcNXnaj
	FxodPL5Yz8b/6aMWth+Q3TGuWGqT81H0eUoyp99uoOLQJrYdRmpeIrS+9LbdR/EEziwW0kVf6hW9R
	zAqsosnf22SKQMAT/znIvHU336+F1eVKC0HluVK3UTeHnB936vH1KoYhPadlVHT77ZEF3ZeOc1S+8
	fVitR+qWhApYhx0sW0t9tg6dLMX+lGYNGdy8zt2KNhvkQcawXxUYI4gnabwvegqRlPlfcNpBKLX2+
	dcsCl5A+ihTOvgn0PW4V/BJX1Yn0MLR2qvmEso5qjnDqDMokIX1En11uY/js82L4iZMzbNVcyx8bW
	/Ci52vhNYAj20TNNQtHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weq2Y-00000000zgQ-18Zr;
	Wed, 01 Jul 2026 08:11:26 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weq2T-00000000zfI-26LT
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 08:11:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Wb
	wcrkvltTRky39IqZSfJP2Rrr6GyP3++S2L3ERsYI8=; b=WihMo6NO4h8yiD0DtI
	r5dRnTLAlL+8NzEyTunzM4lxx3Zz+zvFJiHZpDTmUF7Yxe66vYN/eKfiG0cQwfem
	tjIvvwfuSppZR4w36LcDzAhjV/jBML733vze38m604HFJPICcMWrIvIzvchTwse9
	MHPeJRAsaq37BX3EdMo/UFqbQ=
Received: from Ubuntu.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBHa+Z5y0Rqn4gyFA--.16458S2;
	Wed, 01 Jul 2026 16:10:34 +0800 (CST)
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Nam Cao <namcao@linutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xiaofengmian@163.com
Subject: [PATCH v6 0/2] riscv: add c.jal instruction simulation for kprobes
Date: Wed,  1 Jul 2026 08:10:31 +0000
Message-ID: <20260701081033.49871-1-xiaofengmian@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: PygvCgBHa+Z5y0Rqn4gyFA--.16458S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw1UKw1UCF17WF1kWrykKrg_yoW8Gw1fpF
	s8C3y5tFWjvFs7GFy3JF4xZr4Sga1rGr43WF12yw4Fq348ur92vF1qgrWakFsIgr4Sg3sF
	9ry2qF95uFy3ArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEv38UUUUUU=
X-Originating-IP: [39.144.122.37]
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbC5Rq8v2pEy3rHgAAA3k
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_011122_178587_6098E30E 
X-CRM114-Status: UNSURE (   8.97  )
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

The c.jal instruction is part of the RISC-V compressed instruction set
and is defined only on RV32.  Currently kprobes rejects it, causing
probes placed on c.jal to fail.

This series adds simulation support for c.jal and includes a test
case by Nam Cao.

Changes since v5:
  - Removed the #if __riscv_xlen == 32 guards around simulate_c_jal()
    as both Charlie Jenkins and Nam Cao agreed they are unnecessary.
    On RV64, riscv_insn_is_c_jal() always returns 0 so the simulation
    code is never invoked, and the small overhead in kernel size is
    acceptable.
  - Included Nam Cao's test case for c.jal instruction simulation.

Changes since v4:
  - Reuse simulate_c_j() for the jump logic (Nam Cao)
  - Use direct register assignment instead of rv_insn_reg_set_val()
  - Move RISCV_INSN_SET_SIMULATE(c_jal) to group with other compressed
    jump instructions

Nam Cao (1):
  riscv: kprobes: add test case for c.jal instruction simulation

Xiaofeng Yuan (1):
  riscv: probes: simulate c.jal instruction

Nam Cao (1):
  riscv: kprobes: add test case for c.jal instruction simulation

Xiaofeng Yuan (1):
  riscv: probes: simulate c.jal instruction

 arch/riscv/kernel/probes/decode-insn.c        |  2 +-
 arch/riscv/kernel/probes/simulate-insn.c      |  7 ++++++
 arch/riscv/kernel/probes/simulate-insn.h      |  1 +
 .../kernel/tests/kprobes/test-kprobes-asm.S   | 24 +++++++++++++++++++
 4 files changed, 33 insertions(+), 1 deletion(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
