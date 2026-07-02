Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F46AC43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MN7JnBOX++CANhmR7QagrPGwVbMR04z1QpWzTaRZbMQ=; b=NirDPNzUYM+WPn
	xS4gracC08ZIckthlTDgenT/91H/peFcYtrGW/6IoO4EnCzhe5RM8d5wCd6aaOwOFT/VkWRUArfMo
	wDUpUmIfRMW4t6o5mQ2aoWYI84enOmE2uvjCTPfIjefL0ge0uGopHez9oHoE5SHHdjtT2sto3dTkP
	UKE/d0AcKKi4kc0OfRqWivwOVVtwLiYGmDVCpq8LzyXUUIsISARLObFU+Qe7IpITyAtweeDFC4FNT
	g7xj25t6tlmAvu6dlluuGX751pHjQXtqnyL8XgY/Js0ys4h8EQQaF1JEJfec/cOh3Rga0QIjUVgGZ
	I4WEIz80antgtNIVvFXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHZA-00000004WvU-3TqV;
	Thu, 02 Jul 2026 13:34:56 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHZ8-00000004WtS-07C4
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 13:34:55 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782999292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F/AiuPjv8/IO6sSkiI0H94eP5h3JqqboNr8FcqhnBQ0=;
	b=GzM6b0sBSzB/MsUuB5H0/CYr+lZgA6QVr5cB0tdXw74nA5Erap5VVpc/We0X1aBQOgszcR
	jGOmxIHCCAFh/a1WYXjr2efE40BOrbh7LME3DmkK8hGW6ThFgOTptc+1/T7eY0yAkXW3pd
	c7AY7PdXFxmX/eOa/kqtkPOEU1p3GLbnTyLCREMjn9NOkLm3NfDlJckionWaCdkpEfC3ws
	HcgB10Z3LuV/qOESTd3Lt8e4QQvf7h+gS/jYRD6mQWIM3ShHYe2jX4uNvaDiPz6Fk/W45T
	v/ylsyqQHnkYPADnviKjqzWStoxhkLBxdFaAbUlZOTCjuvV/4HtlE8w8Wo3Leg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782999292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F/AiuPjv8/IO6sSkiI0H94eP5h3JqqboNr8FcqhnBQ0=;
	b=ybME/MMbaWqfORpVa6ncNH23mgsxqz93Zxnoxs9M+e67gUmeiATNOoeGSQkgO28UUI2cAS
	x1ZcJZQOKEKTEABA==
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
Subject: [PATCH v2 4/5] riscv: compat_vdso: Build with zacas if available
Date: Thu,  2 Jul 2026 15:34:40 +0200
Message-ID: <0784df307882646ca56f1c4587f5f5dead2ebf87.1782998849.git.namcao@linutronix.de>
In-Reply-To: <cover.1782998849.git.namcao@linutronix.de>
References: <cover.1782998849.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_063454_217721_1ED16AD1 
X-CRM114-Status: UNSURE (   6.04  )
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
