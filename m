Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABD8C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wy5fqmGN/V9z3x7w33YRFPgj07Fy1PmQ5UhRUx9QrDI=; b=cJaovwAYBnUPWS
	TitA1V0oO3ieS1fTIWin0fUcW6x/Uw6S5ej5/6Y0zB/HKinXRq+AVTO7SCWcX7ZO9EOWEECHfgLku
	BxtjIIIOoGBV4GtXjRc3x6BuLlU/qv9tgWLRYvuz8p/Lm7phK/4MuJGHE+AL1iIhxDXzwTYtZ2/mt
	jz9cpqmfjCPPoBpCOfk+/MQYBP/WBotw3mzfA6Usi7rbTF8e4z2qMVujb029MaBQ7dcL/lSNpVpw2
	kFkXd1TjoA+tlNJaGe45dANDy/loqF+Phyp8IvgWGMYeJcigj4eI+eeV/gJHDEPhIcZ8h6K3IxYrU
	ug90AY2tWHNVU1dh96CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHZA-00000004WvY-3saf;
	Thu, 02 Jul 2026 13:34:56 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHZ7-00000004WtR-2x02
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 13:34:55 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782999291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pBDhUIAkr3h7kDmW6cW3zlXUtNbH/QbCHeJocp9cdb0=;
	b=M3oHpNLPbjHc7wZ/D5SuJWMlE/8RP65KbTXk4dBqJNi8JcUfoYX0lNnd3rn+G1FPefgday
	fyd8wSnqFBlyeqtreQuIEMTcz6D8VUVFh3T7uvVklocSOXgK1gFhLG2NX01tSq32woTh9E
	MUTiiXTEmzBYg2CaVDYHURyTzA4yY6IpjfOJFXpyVpYdyemmhc3Y6oYxwIoAFSltYeJIQA
	WxxspEvk8hB897evEW2Fn1DIaEDL6a2qmXCmG5/q0uziFjs1zZIHMInlDBW+mlsMO7oEMq
	xMZlYm6l4S4PBQhm221aA0HV6Y1UudLbFX1kttYlhRx4tCcl815ll2RBJeszvw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782999291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pBDhUIAkr3h7kDmW6cW3zlXUtNbH/QbCHeJocp9cdb0=;
	b=x16rEQBEGs427SZyR+V055dsh0H/gE7pkmz7N47GTH2Go6Zmfj5ou+r8hULgWBxBqDzd+r
	F6GON7tPskXQh9BQ==
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
Subject: [PATCH v2 3/5] riscv: compat_vdso: Introduce COMPAT_MARCH variable
Date: Thu,  2 Jul 2026 15:34:39 +0200
Message-ID: <0b47857a89bdb692e570e386424de0703b62ecac.1782998849.git.namcao@linutronix.de>
In-Reply-To: <cover.1782998849.git.namcao@linutronix.de>
References: <cover.1782998849.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_063453_883906_4865FF6A 
X-CRM114-Status: UNSURE (   7.56  )
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

The -march option is inside COMPAT_CC_FLAGS, making it difficult to extend.

Introduce COMPAT_MARCH variable to allow extension. A follow-up commit
will take advantage of this to add _zacas to -march.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/compat_vdso/Makefile | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/compat_vdso/Makefile b/arch/riscv/kernel/compat_vdso/Makefile
index 452c623d1a44..63580b33e3ce 100644
--- a/arch/riscv/kernel/compat_vdso/Makefile
+++ b/arch/riscv/kernel/compat_vdso/Makefile
@@ -13,10 +13,13 @@ COMPAT_LD := $(LD)
 # binutils 2.35 does not support the zifencei extension, but in the ISA
 # spec 20191213, G stands for IMAFD_ZICSR_ZIFENCEI.
 ifdef CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
-	COMPAT_CC_FLAGS := -march=rv32g -mabi=ilp32
+	COMPAT_MARCH := rv32g
 else
-	COMPAT_CC_FLAGS := -march=rv32imafd -mabi=ilp32
+	COMPAT_MARCH := rv32imafd
 endif
+
+COMPAT_CC_FLAGS := -march=$(COMPAT_MARCH) -mabi=ilp32
+
 COMPAT_LD_FLAGS := -melf32lriscv
 
 # Disable attributes, as they're useless and break the build.
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
