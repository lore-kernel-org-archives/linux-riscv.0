Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37D9C3ABCC
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 12:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QuyZVV7qpl26mbBGslr+vsIOD+KPLMYrDZE2gG/RAYY=; b=x5ihQPWvuTwkxl
	VHBDvW6KXJEG2e33k9Z83owYHPkl6JNPWEbpurGe+l3ZqZSSpBs5dLws5T0FLq3lw74veIlfUWAFx
	CSX/L0VoHBJ2Z8VxE/ohMGocHJVPHncC6/AdfWUr9vOjvqYGmohwgByQKI3t3VQKdqGZ1EcgZ24ZT
	XtT/+8J9IZ/1x5RSCzbfwrBGvi6OCnBvjZnv6GMFC+E6by6m8UE2km/kbTSXH/Krb57RmfdaFWikE
	pGO7b4DA/3IC232c3hQFWkb9yTUZUoEk9AN2pEIGSVcSLz4QDUOnqm6oBlLrQlMQdKIqDN3l1n8g5
	INV0D6q6whFNoQtABCpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB4Z-0000000F1YA-2aDV;
	Wed, 14 May 2025 12:18:55 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8Zm-0000000EhAM-2USF
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 09:38:59 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747215536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zSbuYDRtVvHSPCJT7OiqBZPf1qjnHuxHcxmCjMw550E=;
	b=akjHKHTdS+qA9f2SWAX76YwS7nCi/1TgOE+zVabQITFoOBufupyyO5lWVEGYYGHi3euo9N
	BtCH3pNcj0GuptlONdSI5ZIqouX6J6YgaYSYBYk1s7DrY7292HZhK3Y6YsLruMyFWMfXAL
	eMp2lpUI7ZSK3vmxFlWEedm4uD54UyawXdBBO+e8QAtrlEkN/vcOzJtAMjfRcXVajfSxSr
	fVyiz+5M8qoZxsLb/aYmEI5mYtljoSNt27TLrDFFesr/ElZ9GUJ0kK48zsGN1JS0l5Pgp5
	7Z71n5uD9IfpOGFmlZGVKSrumOuNfI/q7mh/4VcOFa6WrdRmumlqhTVDWWKYiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747215536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zSbuYDRtVvHSPCJT7OiqBZPf1qjnHuxHcxmCjMw550E=;
	b=GROZoH0n+qX75m8UErZojwBTQ289hvnd0Da8jPvXuIcH22Bna6qsUu3EDc2B0+bC4t4j7V
	G+uVE3yVziLpErDQ==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH v2 00/11] riscv: kprobes: Clean up instruction simulation
Date: Wed, 14 May 2025 11:38:39 +0200
Message-Id: <cover.1747215274.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_023858_775445_07965CF9 
X-CRM114-Status: UNSURE (   6.71  )
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

Hi,

There is some instruction-processing code in kprobes simulate code. These
code should be insn.h. In fact, most of them is duplicating insn.h.

This series remove the duplicated bits and make use of macros already
defined in insn.h. The non-duplicated bits are moved into insn.h.

v2:
  rebase on top of Alex's patches [1]. This means replacing RV_X with
  RV_X_mask for the first 2 patches. The rest is the same.

[1] https://lore.kernel.org/linux-riscv/20250508125202.108613-1-alexghiti@rivosinc.com/

Nam Cao (11):
  riscv: kprobes: Move branch_rs2_idx to insn.h
  riscv: kprobes: Move branch_funct3 to insn.h
  riscv: kprobes: Remove duplication of RV_EXTRACT_JTYPE_IMM
  riscv: kprobes: Remove duplication of RV_EXTRACT_RS1_REG
  riscv: kprobes: Remove duplication of RV_EXTRACT_BTYPE_IMM
  riscv: kproves: Remove duplication of RVC_EXTRACT_JTYPE_IMM
  riscv: kprobes: Remove duplication of RVC_EXTRACT_C2_RS1_REG
  riscv: kprobes: Remove duplication of RVC_EXTRACT_BTYPE_IMM
  riscv: kprobes: Remove duplication of RV_EXTRACT_RD_REG
  riscv: kprobes: Remove duplication of RV_EXTRACT_UTYPE_IMM
  riscv: kprobes: Remove duplication of RV_EXTRACT_ITYPE_IMM

 arch/riscv/include/asm/insn.h            |  9 +++
 arch/riscv/kernel/probes/simulate-insn.c | 94 +++++-------------------
 2 files changed, 28 insertions(+), 75 deletions(-)

-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
