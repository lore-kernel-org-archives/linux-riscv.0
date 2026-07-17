Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99063C44507
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 08:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MN7JnBOX++CANhmR7QagrPGwVbMR04z1QpWzTaRZbMQ=; b=qkdEcnRN5r7DPc
	kSLR8R+BqhSldAV5o9slf1NFvINLk3nDSswpaukY+vS3LNXfWyWjBB7A/fyKJUGQlbMe6wuGqJ06p
	x68tAQ2iQ3TMUDknEhPnnPMBiddfzkTd4dhLKoIR58TaTSH8zYZOPZxNslizNIbC32cAUkRlrx/NT
	M2ImxZ9TehG9wXjbGQqU9cT8TXXxQ3tt2NFg6HWToRRvBF9BD9UoYcNaT/C17v9nkBOq1fdj89ap8
	gHCjjn1CrdxK+BUsgO8umCnpBGZvzi9J4DUHYRn9ccRJP2d6ocmH6JJX2ruWPnxzJ8SXRodg1O/Dl
	5Y3R5qHO95xsziZb6mEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdb3-00000001Z56-1hMT;
	Fri, 17 Jul 2026 08:07:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdaz-00000001Z2S-2PjL
	for linux-riscv@bombadil.infradead.org;
	Fri, 17 Jul 2026 08:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=F/AiuPjv8/IO6sSkiI0H94eP5h3JqqboNr8FcqhnBQ0=; b=bixR36Cd/NNyhXGg0PEdkzclO9
	/v7xJpLLoONmLEFUn+7FWurTXpprW241UeumYPvO2AXwPv2x38cvRrSsTHE6fWDRGMD0TIlSW1cRw
	p/+vuj6yoJmykcdAerxD4YJl9QcPF3SD7kT08ts79+WBeghn114L9Z9nuAoBl8hPYqKyzGgHd4ICV
	yovWquTAOux+PXP12EYojJM+U5geoPHlIb6gHgihEiPUePdKf7AuTFbk6TfyyObcSR+SQ06Y42WIu
	LregaKl9yEoPdSsj5NymwqamI9kLKWFGHbnaippM92u0Hm7N3/alk8ka1Kfo1KsOEK454RVnsHnDR
	UWTnPppA==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkdav-0000000Ee03-0FRc
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 08:06:56 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784275611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F/AiuPjv8/IO6sSkiI0H94eP5h3JqqboNr8FcqhnBQ0=;
	b=P2HMMg6syw0s7sNy7qj1afJFpYblf2hD8TzYTBOKtOEe/WPrTLKg9Ce93gCxFd8ccxizCK
	/699u8k3AWTYMLx6HlCn+TOG3ZQdRhoR61A33lL13XTqF9VNET+KOOtFiCrPZR1P/Vynz6
	oJOl8Jmq62ZUJfi0C/dN2gJ5wryitlv277sJE6axlT3mnjL7FbAoP1eQ8aawDNgvf06FOU
	fVRkZIQVBglVqAAY+1DIMf3ji/IDQK1dLmbHdhbO+A29gGkX48ego9BF76QTeWQJXnJ06D
	RT73lFqoHaKo7ebJxnBXmiFzjVw5FeAT8JODn+QjQ+zGAEs97PTcu8Cwv3FndA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784275611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F/AiuPjv8/IO6sSkiI0H94eP5h3JqqboNr8FcqhnBQ0=;
	b=E03gajk3rpQ2sO/BL8gwGq06mW/blU3uq7rAfqXSgXiqMIOeoJoOkiQr805oIMb4PjWuBr
	pr5mOS5wf+SPSOAQ==
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH v3 4/5] riscv: compat_vdso: Build with zacas if available
Date: Fri, 17 Jul 2026 10:06:37 +0200
Message-ID: <704e0bbacee5f23d1351a686f3a783e31699fb3b.1784274927.git.namcao@linutronix.de>
In-Reply-To: <cover.1784274927.git.namcao@linutronix.de>
References: <cover.1784274927.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_090653_312526_B95B96FB 
X-CRM114-Status: UNSURE (   5.51  )
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

The compat vdso Makefile does not enable zacas, disallowing source
files from using zacas instructions. This is an obstacle to adding
robust __vdso_futex_robust_list32_try_unlock() in a follow-up commit.

Build with zacas, if compiler supports it.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/compat_vdso/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/compat_vdso/Makefile b/arch/riscv/kernel/compat_vdso/Makefile
index 63580b33e3ce..ffbf84aeb081 100644
--- a/arch/riscv/kernel/compat_vdso/Makefile
+++ b/arch/riscv/kernel/compat_vdso/Makefile
@@ -18,6 +18,10 @@ else
 	COMPAT_MARCH := rv32imafd
 endif
 
+ifneq ($(call cc-option,-mabi=ilp32 -march=rv32ima_zacas),)
+COMPAT_MARCH := $(COMPAT_MARCH)_zacas
+endif
+
 COMPAT_CC_FLAGS := -march=$(COMPAT_MARCH) -mabi=ilp32
 
 COMPAT_LD_FLAGS := -melf32lriscv
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
