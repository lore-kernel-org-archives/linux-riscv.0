Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B762CD98F2
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jun 2026 14:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RKYSxL++AOHnkxy2kQpFbEwbVRZt2fSp55CebiD7xSU=; b=WON5zf/viU+co1
	BErDhY2vcg4/fkuxifs5csQpDbLDC7aH79WN37rIN7PWo051KhqcGSmO+PH/AtRjuHaY74Eoqt8VF
	F30OX0W2DqUoxDXqos0Etb8YEhYTuoALII3Jkulv2utRPb4S3R8cz6J+yuCsHAG7gwsJO1a0W2CSU
	EvUp1wXZssNxu+UVNcgixQ1ZED1ttXyP8Yq3gv+n/Sy3BZB5q3MMnKzsNc5TfYrdnCFfiQSAOdeFk
	YCnm7dDHSI0v0yE/81907hsb7xAjZuQdvTAdUhnqVlgoB4i2Y0nFo03nFYK+B9Z+aSMnh4rxS8Iet
	oG1xFac6OynM7TrXnAKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZwZ-00000002Y80-0knP;
	Fri, 19 Jun 2026 14:11:39 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZwU-00000002Y48-0NTv
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jun 2026 14:11:37 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781878292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RWA+c6U4pkHo+UQczk5KAhE2ULSFHeIlhLgOGjrmk8I=;
	b=zI2AU54GzU4w+FWQgAA8eEh9jdCnNatFAfX76wA9Lm60RzfmsplwsSvqJP1LOsZXFR9Xbe
	vZqLkSwpL+UV+u1ggv/cT7Enf2RgRWy8yzqWTQtgKuspjkh8clHJ6aFpnicMv2iIKMd7ld
	g+4FnlCswfqjnSaaBGURDis1RX9V/5n0ZVCoWoQrjGjUMJAi69Tvljwq8N3leSX/AL3fHz
	dTIF4hPXHkFXEZZSwpp19EVJmpZisCakiRcVzEbMGZOOAIOy6rZWD1OTmLDUFaZ+g2b1SB
	b9aIpj1VckKpdH2eR4gDHFw946lrn5jz8W93IVFMqGdT75aw2hD5KttMFIBsQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781878292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RWA+c6U4pkHo+UQczk5KAhE2ULSFHeIlhLgOGjrmk8I=;
	b=Jxjvx0JmQBRy6i2AKV0+fyY/Zf8IfcSfeKm+mbfZlw2k/EQC+L5B0z/6MpyGm9Pe5VyvIc
	Xl80ud/ej5W7bTCA==
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
Subject: [PATCH 4/5] riscv: compat_vdso: Build with zacas if available
Date: Fri, 19 Jun 2026 16:11:20 +0200
Message-ID: <bedeb95900714ddd5be9b6850fc1179e827182e9.1781876501.git.namcao@linutronix.de>
In-Reply-To: <cover.1781876501.git.namcao@linutronix.de>
References: <cover.1781876501.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_071134_270471_830A0C48 
X-CRM114-Status: UNSURE (   5.80  )
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
index 06d28a5a0368..7f222a77dbbb 100644
--- a/arch/riscv/kernel/compat_vdso/Makefile
+++ b/arch/riscv/kernel/compat_vdso/Makefile
@@ -19,6 +19,10 @@ else
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
