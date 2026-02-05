Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C9DEC1EAA
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 12:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4y82St/nnpLpQz5f1ijI+ZsdF7EcQfxoN4hkNT+WavI=; b=h1ep4RTL01L/mK
	bNsfbnduxcXzcEs0ZTl3KDyZvUPy5C0b+I5BYf4teLeq4k2fDFSOGAvpWYGsfa2gURLT0LfG2Jzl9
	6TyszpdhB5Y2LI4+Z1sw7VtcspHpx5f2u/h0Uf+U22sTLlLuRnw63cix2zVxbz0gvv8bo4/rsUJjv
	PDl+bCpqX7hf7PoF1vMDnlOJKPKdxNX1WXVpq/UcENDqUxDQVx6M4Ze7BnnoOoDO57iQc8TtvGr5n
	IwP1PdPepByomJs5BVxSUSWwO6FHN/oTGUVWFctngHv5wkAtFKtpmugF92pICE8hTHi15DpAVmihD
	t+OlFZsT9Avs8B76L0nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnyI2-00000009rqU-2tG1;
	Thu, 05 Feb 2026 12:16:54 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnyHz-00000009rpw-10xH
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 12:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1770293803; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=vqjw6KqXzJomH3TcE9LMBHSPYPYNGrUh0jEWCj+m51k=;
	b=JSKF9qXhxRpNyNyp7VYZpKOkNoNMMORL6ixXky7T4lOSSilPK7I0JKoqiZpEIecgJ5PN5LtHp5kExJSDXU3QwWEDWqom18uazd4fGDFxtul+KrPucNfgjKvZqDR12u6w7Tu10GJqDqtz+1hlnLxDWtDAHD5bLHdaPj/RYRQQmkc=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WyawLmD_1770293795 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Feb 2026 20:16:42 +0800
From: cp0613@linux.alibaba.com
To: pjw@kernel.org,
	anup@brainfault.org,
	alex@ghiti.fr,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH] riscv: smp: Align secondary_start_sbi to 4 bytes
Date: Thu,  5 Feb 2026 20:16:25 +0800
Message-ID: <20260205121625.716-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_041652_300210_96FBCF15 
X-CRM114-Status: UNSURE (   7.93  )
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

From: Chen Pei <cp0613@linux.alibaba.com>

During SMP boot, the secondary_start_sbi address is passed to the
slave core via sbi_hsm_hart_start. In OpenSBI, this address is
written to STVEC in sbi_hart_switch_mode.

According to the privileged specification, the BASE field of STVEC
must always be aligned on a 4-byte boundary. However, System.map
reveals that secondary_start_sbi is not a 4-byte aligned address.

For example, the address of secondary_start_sbi is
0xffffffff80001066, and the disassembly is as follows:

Dump of assembler code from 0xffffffff80001052 to 0xffffffff8000107a:
   0xffffffff80001052 <_start+4178>:    c.nop   -11
   0xffffffff80001054 <_start+4180>:    auipc   gp,0x1a1f
   0xffffffff80001058 <_start+4184>:    addi    gp,gp,84
   0xffffffff8000105c <_start+4188>:    csrw    satp,a2
   0xffffffff80001060 <_start+4192>:    sfence.vma
   0xffffffff80001064 <_start+4196>:    ret
   0xffffffff80001066 <_start+4198>:    csrw    sie,zero
   0xffffffff8000106a <_start+4202>:    csrw    sip,zero
   0xffffffff8000106e <_start+4206>:    li      t0,2
   0xffffffff80001070 <_start+4208>:    csrw    scounteren,t0
   0xffffffff80001074 <_start+4212>:    auipc   gp,0x1a1f
   0xffffffff80001078 <_start+4216>:    addi    gp,gp,52

When writing to STVEC at address 0xffffffff80001066, the actual
write address is 0xffffffff80001064, corresponding to the address
of the previous ret instruction. This is unexpected, and if an
interrupt occurs at this point, it will cause unpredictable results.

However, secondary_start_sbi immediately masks all interrupts and
updates STVEC, so no problems occurred.

In summary, it is more reasonable to make secondary_start_sbi
satisfy 4-byte alignment.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 arch/riscv/kernel/head.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index bdf3352acf4c..f35dbfa79505 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -124,6 +124,7 @@ relocate_enable_mmu:
 
 	ret
 #endif /* CONFIG_MMU */
+.align 2
 #ifdef CONFIG_SMP
 	.global secondary_start_sbi
 secondary_start_sbi:
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
