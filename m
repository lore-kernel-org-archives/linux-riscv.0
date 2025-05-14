Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750B3C3ABD8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 12:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SOt4wgjOMnaJtav+0U+cOaplR2QYdrc3S9W3Ho7sDvE=; b=Qk4qYXYnVaYvn0
	NPgrUYAfHCmMJGFa+9P/zCS1tHhL+zz4/1IWGWEn+spXP+UJg3T7RApz5zkqyV6ySasCu7+v6SuOB
	wAk/YyikG1mYISLwMbzl/YgBjYukCkJYmH1nu6OWel/wJ9nOqg7lOcDkfj4mGDKFEUPJYb3yt262l
	0q6OqXUzD93TTVgbxf/f1sur6EIaiC1+OnZB6AR/rUSHdDDI2nwRdWR3sPTp6Sx+tsLTnrbxTS6La
	n3wNhtArfWyh8vcnvxEmoffb8IRFmv3ICMfN5mAZopgz5CwLoS/DzbAqRMXi5HajQAAt6pX0z4Q22
	sGy0i6vqZDnzGgiGL5lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB4f-0000000F1f2-2uFD;
	Wed, 14 May 2025 12:19:01 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8Zn-0000000EhAg-0nDd
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 09:39:00 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747215537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LK+Og6CgstdynsfQmcoHpOPeAtyjebuHccUKvOXx7QM=;
	b=CjNOLa0k4B30MmTLnXdLk3vjDzqeMwucYzVXriRYkskWy3Lx6AkhGPSMBz2sUka3u67E2r
	QpCrGj1/ZcLI+GiMVBmyYw8pUGBRHHBRfAfLjFg3QvJ0bup0J/HMbkQKPrVe2sFODu1cpB
	EQzigHl93WFISnE0JxMv4JlMwcwFjs18bgzjsMs1CI9bqTAxlVAYuQeOSsqTZxvUE0pc5q
	0WN5uWelwOSlc7FJl21fGOGz+0uW2sdis0EjcqHsZM9iM37R5pFn1pjEtbzH8Tv2zpbb/b
	+ePW8jwhhOs39cXAizEIbzj4wBnYGsjIs0m/AKhivUcrYxS5NUpoo+mYdLCxRA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747215537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LK+Og6CgstdynsfQmcoHpOPeAtyjebuHccUKvOXx7QM=;
	b=MREWsN+eYcLWH45438eJ/TnM+IWRxtCMgbkxzsoS+xk3eUCQcnN7LOcxS40DEE7f5AYitS
	0rg3tQ9Q65Kk8CCQ==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 03/11] riscv: kprobes: Remove duplication of RV_EXTRACT_JTYPE_IMM
Date: Wed, 14 May 2025 11:38:42 +0200
Message-Id: <af502036738d381c6bdb96a236d21bab8c343f74.1747215274.git.namcao@linutronix.de>
In-Reply-To: <cover.1747215274.git.namcao@linutronix.de>
References: <cover.1747215274.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_023859_362528_FE5B8049 
X-CRM114-Status: UNSURE (   6.41  )
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

Use RV_EXTRACT_JTYPE_IMM, instead of reimplementing it in simulate_jal().

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index d5f74fadbc3a..b76a691d0d9a 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -41,19 +41,16 @@ bool __kprobes simulate_jal(u32 opcode, unsigned long addr, struct pt_regs *regs
 	 *     1         10          1           8       5    JAL/J
 	 */
 	bool ret;
-	u32 imm;
+	s32 imm;
 	u32 index = (opcode >> 7) & 0x1f;
 
 	ret = rv_insn_reg_set_val(regs, index, addr + 4);
 	if (!ret)
 		return ret;
 
-	imm  = ((opcode >> 21) & 0x3ff) << 1;
-	imm |= ((opcode >> 20) & 0x1)   << 11;
-	imm |= ((opcode >> 12) & 0xff)  << 12;
-	imm |= ((opcode >> 31) & 0x1)   << 20;
+	imm = RV_EXTRACT_JTYPE_IMM(opcode);
 
-	instruction_pointer_set(regs, addr + sign_extend32((imm), 20));
+	instruction_pointer_set(regs, addr + imm);
 
 	return ret;
 }
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
