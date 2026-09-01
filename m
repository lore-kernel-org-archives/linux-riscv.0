Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE20C624D0
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 11:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8ldk8d0dD8QNt8Vd35QKBkZjPFwb5jBfG5IiObaHxqU=; b=yDxl9p+QKez2W4
	P1GLprGxsC38hfyWMtGRpBZZ8NFIuImDpBT9kd1DPMTlZ1qyW1kBmrALGzxVjm519tu6ABVtNE6LS
	HvfLM0qla8TYHjtt0ta0JktBvfRQotsy9y9P79ksdlvo9dXDdiKZ6VI+ayTjJT2IqSKNZx1PyZf8k
	giByW0rAnKKgKdlCXSNuW7Xl5DJb2l3zTVXrDqT0sPinu307scShTuxXzO/pDm5N9JqGrZANGMmBt
	prLRSLrs65MGUXfJOF/0bgPZJNZB5/KdkJXggIVLuPmACzbaMZRVNAIzNIgTK2Vk9fROU942vYuow
	cRmgOlPWFRj1W+PC0bjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1N5F-0000000BkMP-25pB;
	Tue, 01 Sep 2026 11:55:21 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1N5C-0000000BkL3-2ODW
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 11:55:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=wW
	coy7UZLCXe5FrO0mF2TqORQCyLVupP7SFyVEEKGaY=; b=Y1QDU2dQGWCoIRM6wJ
	bujOzGqIsiL4sjE6HTb1QWR4DT/byuXg6pTZyrnIqfH7/Xf7LnqAJaZHXNDtWSuB
	JyPxklfw7feMtFVXZeyI0qnCmYLjqI7iaPBvIGTTv/as/37cPXq/hr1gR+vvf6UQ
	527t11BmbaEJDKX8JwKp+HRJU=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDHODbuvJZqiiaqNA--.37143S2;
	Tue, 01 Sep 2026 19:54:23 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	namcao@linutronix.de,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH] riscv: kprobes: Reject reserved branch encodings
Date: Tue,  1 Sep 2026 19:54:21 +0800
Message-Id: <20260901115421.109573-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: PCgvCgDHODbuvJZqiiaqNA--.37143S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFWxtry3Cw45XFyrJry7ZFb_yoW8Cr4xpF
	sxCr45tr4rWws7Cry3Jr48WrWfKa1fKw43ur1kt3yFq3y7Ar4Yq3Zagr45WF1qyF4Sg34I
	qF1j9r4ku34UAFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jev38UUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC8w+qVmqWvO+YxwAA3w
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_045519_036811_678ADFF2 
X-CRM114-Status: GOOD (  10.50  )
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

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

simulate_branch() cannot emulate the reserved branch encodings
(funct3 010/011) and returns false for them, but arch_simulate_insn()
ignores the return value. A probe on such an encoding, e.g. placed on
data misdecoded as instructions, therefore keeps the instruction
pointer on the breakpoint, and the CPU traps on it forever.

Reject these encodings in riscv_probe_decode_insn(), like the other
instruction classes already rejected there, so registration fails
with -EINVAL instead. All simulator failure paths then become
unreachable: register indices are bounded by construction, and the
c.jr/c.jalr reserved encodings are already filtered by the decode
predicates.

Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
 arch/riscv/kernel/probes/decode-insn.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
index 433d903..c0eadd1 100644
--- a/arch/riscv/kernel/probes/decode-insn.c
+++ b/arch/riscv/kernel/probes/decode-insn.c
@@ -24,6 +24,15 @@ riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
 	RISCV_INSN_REJECTED(system,		insn);
 	RISCV_INSN_REJECTED(fence,		insn);
 
+	/*
+	 * Reserved branch encodings (funct3 010/011): simulate_branch()
+	 * cannot emulate them and its return value is not checked, so a
+	 * probe would trap on the breakpoint forever.
+	 */
+	if (riscv_insn_is_branch(insn) &&
+	    (RV_EXTRACT_FUNCT3(insn) >> 1) == 0x1)
+		return INSN_REJECTED;
+
 	/*
 	 * Simulate instructions list:
 	 * TODO: the REJECTED ones below need to be implemented
-- 
2.34.1


No virus found
		Checked by Hillstone Network AntiVirus


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
