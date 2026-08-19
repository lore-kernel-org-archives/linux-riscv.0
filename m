Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160FAC5DF87
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 10:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LS28/3tQJX74VORMnLOnwQ1xIeR8uiti5Pk37xpziPE=; b=yOk64IEVGJM95H
	eaR6fpML+F099NbF1OfIuXwW6FpOr+i8WhJ7VB1Nn2snycbKgqhXPPOesKUC0yADaIyDVgg8FqQfZ
	jtVeJHoxnm30vxTeSgv6x5VRp1o/wdpsxU229S2qu0fw4bDCM0aUqC52ucSGDi1Pio5G8AgKxXpn3
	bUZ3SeN88z5QuoStFHD0UdNCMUZ+79rOEu6VKNH787WOrr+/rQb6M4iZceXJPbPR9kEVPakSkgPwE
	fS0JaH/3QTCfSFpU5KXnPek0et35mMEypljgj4NHU4LJEm/Vub7guVqkHKy9xDwoy3pt/pA1/FNcB
	xxgRs+hByMMqFxJu0rBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdJb-00000009Uv9-2E1V;
	Wed, 19 Aug 2026 10:14:35 +0000
Received: from azure-sdnproxy.icoremail.net ([207.46.229.174])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdJY-00000009Uth-0ETO
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 10:14:33 +0000
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app2 (Coremail) with SMTP id TQJkCgDX3Zv7gYVqyyRMAA--.32000S2;
	Wed, 19 Aug 2026 18:14:20 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Nam Cao <namcaov@gmail.com>,
	linux-riscv@lists.infradead.org,
	yuanxiaofeng@eswincomputing.com
Subject: [PATCH 0/2] riscv: kprobes: simulate nop and c.nop instructions
Date: Wed, 19 Aug 2026 18:14:17 +0800
Message-Id: <20260819101419.1367-1-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
MIME-Version: 1.0
X-CM-TRANSID: TQJkCgDX3Zv7gYVqyyRMAA--.32000S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtrWUur4rXryfXryxCF13XFb_yoWDCwb_C3
	s7KryUGw4rAa1UXFyxGrnrJFWkKrWxGFyrCFy0grWqgr48XryYva4vgryUA3W8Kas0vF9x
	Zr1rXw4rXF17XjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbIkFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf
	9x0JUSNtxUUUUU=
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAQEEE2qEiSsZ5gAAsk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_031432_303519_14A72B33 
X-CRM114-Status: UNSURE (   7.02  )
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

Patch 1 adds the simulation. Patch 2 extends the KUnit test with
test_kprobes_nop and test_kprobes_c_nop.

Verified by cross-compiling for RISC-V and running the kprobes KUnit
test in QEMU (ok 1 kprobes_riscv).

Xiaofeng Yuan (2):
  riscv: kprobes: simulate nop and c.nop instructions
  riscv: kprobes: add nop and c.nop to the KUnit test

 arch/riscv/include/asm/insn.h                 | 11 ++++++++
 arch/riscv/kernel/probes/decode-insn.c        |  6 +++++
 arch/riscv/kernel/probes/simulate-insn.c      | 14 ++++++++++
 arch/riscv/kernel/probes/simulate-insn.h      |  2 ++
 .../kernel/tests/kprobes/test-kprobes-asm.S   | 27 +++++++++++++++++++
 5 files changed, 60 insertions(+)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
