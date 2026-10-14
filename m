Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289A3CC6B1A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 09:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SpHMC5PzGMTFVKct5NNUN5svBZWn7nsiQ39xV7t6+T4=; b=lcdwsGEBJjK0nS
	eU9CrGDH7Mp6masO83fROX9TqeUJWZgDZHRICJsYtyLRz9BtXh+JYS1A7SmHk4ZTcHho3wMA5uhC5
	Ki58iOy03Lhvbgwp01yJdPpS425eVNPV8XpDmeJwx2oS0KijRKhD/hj6u9Wcnpawgts3JSulPrTCD
	KhCml7Tb95bCWIGpf0+XrgGqSWFwl8CskSNuDtfNDPnWlKg/atkNMx9yTJ59Pw9axGNJVtpjVmK5t
	FU3LZeFVQsekeSzS6S794cR5jr3uvM0W3szv8+WE/r1TBDNMZKoGtsr20UWa2AFxhOxLq0oMNHZs+
	k6jw9I2qwvaVmJGWHsEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvXJ-0000000F69M-1Z6V;
	Wed, 14 Oct 2026 09:44:37 +0000
Received: from zg8tndyumtaxlji0oc4xnzya.icoremail.net ([46.101.248.176])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvXB-0000000F65B-23Kf
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 09:44:32 +0000
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app1 (Coremail) with SMTP id TAJkCgCXKW7vTs9q6aSGAA--.43637S2;
	Wed, 14 Oct 2026 17:44:17 +0800 (CST)
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
Subject: [PATCH v5 0/2] riscv: kprobes: reject probes inside LR/SC sequences
Date: Wed, 14 Oct 2026 17:44:13 +0800
Message-Id: <20261014094415.374-1-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20260828091202.1124-1-yuanxiaofeng@eswincomputing.com>
References: <20260828091202.1124-1-yuanxiaofeng@eswincomputing.com>
MIME-Version: 1.0
X-CM-TRANSID: TAJkCgCXKW7vTs9q6aSGAA--.43637S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr4ktF4fCF48JF1rWFyDKFg_yoW8ZF13pF
	Z5Cwn8tr4kWw1fCry3Gw48Z34Sya1rGr43Jr1kJw1jy3y5tr1rtFnxKw4Uur98GrZYgw13
	Zw10grZ8Wa47ZFDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU13ku3UUUUU==
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAQEAE2rOXTMYPwAAs+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_024429_835891_1E0C728E 
X-CRM114-Status: UNSURE (   8.95  )
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

Changes since v4:
- Reject the LR and SC instructions themselves in the decode stage
  (riscv_probe_decode_insn()), so a probe placed directly on them is
  caught independently of the kallsyms offset (fixes the case where the
  probe address is exactly the enclosing symbol's start).
- Bound the sequence scan by instruction count (MAX_LRSC_GAP = 16)
  instead of bytes, matching the Zalrsc "at most 16 instructions"
  constraint and avoiding ambiguity with compressed instructions.
- Fold the LR/SC scan into arch_check_kprobe() so the function is walked
  only once; arch_check_kprobe() now returns an error code.
- Use the existing GET_INSN_LENGTH() macro and a single unaligned 32-bit
  load instead of two separate loads.
- Extend the KUnit test to check a probe right before, on the LR, inside,
  on the SC, and right after the sequence, storing absolute probe
  addresses instead of offsets.

Verified by cross-compiling for RISC-V and running the kprobes KUnit
test in QEMU (ok 2 kprobes_riscv).

Xiaofeng Yuan (2):
  riscv: kprobes: reject probes inside LR/SC sequences
  riscv: kprobes: add KUnit test for LR/SC sequence rejection

 arch/riscv/include/asm/insn.h                 | 33 ++++++++++
 arch/riscv/kernel/probes/decode-insn.c        |  2 +
 arch/riscv/kernel/probes/kprobes.c            | 63 +++++++++++++++----
 .../kernel/tests/kprobes/test-kprobes-asm.S   | 24 +++++++
 .../riscv/kernel/tests/kprobes/test-kprobes.c | 26 ++++++++
 .../riscv/kernel/tests/kprobes/test-kprobes.h |  3 +
 6 files changed, 139 insertions(+), 12 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
