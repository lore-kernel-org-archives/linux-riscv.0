Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59313C3ABCB
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 21:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nJbxRIzyZqErAkpdiumfE/Lhyg61LsEVewCyhczbxR8=; b=i2LdZHzUwdx6xa
	4omhjqsFMNd0Hpmd9xB0SGLqcrYZefADLANIb9W5t7joDyEsV3/GdmKiH/+I2EOR/RAo/SHaQiZJ3
	JnfA3x/HUNoWUlepV+1ViK2bzN18qkHvSC0EmIaDDS4N/u+O0BWuhlppq+3tF3Ewet50aY3SDVmoK
	tep6GO7lXaPHw7Gna4wLP5Z/hlZkCe/KWk/FeVRQo7/HETNxr26hW0sFqVUrERtvURSG8EfJiz6Al
	zzmX19JvHe867IjOPF0L3oodBL1TOVUyabE/zA8qJ3txZjWHLQ7w4X8AjzjDMxOchdQla0MkCpcKC
	B0eTJHIlHbsZARTvFEww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEE3p-00000007s9b-3Wvz;
	Sun, 11 May 2025 21:18:13 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEE3m-00000007s7b-3Qop
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 21:18:12 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746998289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pQCK+FP6fnuhEa7dhrwrGy4kUeW1D/ROXBpaKli5CKE=;
	b=1RCdFz1HJTsjDwa9XHS9jn0XMydrFZ1PWyYQs4a3DDOHuMrRPh0mj2JiEPg0NCPdqbF4wE
	F0qh36yqA8m6oHn29VfIklqoJUrnJ76LBdPisktOyvaJF7qsLxbQBqekOz3CTa5+NORGjf
	bHkiBplJ9KWGxzZd5r6MBypw4NtkLQIdQxl99RC5M0xZudDZtXuh+tL2u9FE6pY3p1CN+E
	AjleH6oZQsEivyXWjRT5/u/5riLiUGHiEPI+UsveEswePyBET56GnQbrbl+0wxYW98kFwn
	TCen9euQeHzh00CGxGi9Zd/fZRPdeAdhje4FwVbpHs0XWKtdIsb52msIoLbCRA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746998289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pQCK+FP6fnuhEa7dhrwrGy4kUeW1D/ROXBpaKli5CKE=;
	b=iIFrDLctf7tvgDZbef0i//Tgeef+0AGf4PIlYFc8ewBgDLEtLSJcLE5FftQyVwg1v4k4mv
	PCxjhbb8G0BIY7Bg==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 00/11] riscv: kprobes: Clean up instruction simulation
Date: Sun, 11 May 2025 23:17:52 +0200
Message-Id: <cover.1746997351.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_141811_010848_5124B5CD 
X-CRM114-Status: UNSURE (   5.12  )
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
