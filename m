Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4D1CD98F2
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jun 2026 14:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xyd0og2cjbXuHyQBudZLR1adorFX6D/YyjVduH8U6wk=; b=zj++gwen1iZPq+
	383JkMoRkFN0zLUWgmh6Kb3WPXgTPwopCqp7cajxwb1it2xXFOPAoMl/2ppWaS2mWMyaYTQPW3R+t
	u0cZ471Ken7i8wUUpGjgjKQ2GBL/vSfArb8xL+aQrgke+KitGqx2BDsUOJpbDTREMjXdhOHBsgQVg
	a+xbupvGuK9fDhlVyNIRiQVnduoyrtdgKzmTkvhIvgmvmPyqkbWKu9L99GGcZGq7ZzRnCmJqzNZ+q
	QLGkI6TNiLTqdPU5SRz63GuCgxpY6NnkNYm8K2icGstdzrRZ2oT+/DuAXFKHK5aFEY8fk9WC43Ibf
	L8FKpOufHVTNfn61xi0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZwZ-00000002Y8B-1Z1w;
	Fri, 19 Jun 2026 14:11:39 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZwT-00000002Y42-2ZeX
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jun 2026 14:11:37 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781878292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T243zhGPta7N4L1M21iRxrw6YdC3wTHHItomXMqbkGk=;
	b=teOmO9IzMsVsqozvMnhot2N4v/lgLFxxzVzMgoXMQcIkSukuwalGPhqdZYLq0c5o6Jhvy9
	VDvd5GHy+7DlXUUPZqa3cI5V95zF6XETBMPRYC2wpOu2SkHLdP0GSQ+As4+pWsH7HUFCOT
	aEaT+2soxtnF9+Yjkznyh/lwKHI9QbI5k/6RnWmozBxClDL+MJuwaTrHLQl3xKZDad+IfH
	jvdnm/BoSvgxWuprJ8TlMvpj2rcWyIUnVDumSDMaLroUEzuEzC18q2i/TjyMUWeLV8F85C
	7/LBwmcbm5JEQy1iArIkhjD8fZxT3f3ME0knfU/f+BBN8yEjoXdBGotkM1sFSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781878292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T243zhGPta7N4L1M21iRxrw6YdC3wTHHItomXMqbkGk=;
	b=mRVF3Pj4kcrTQ0mN4kl2BpqlaItCRaARPcF8MiD/jecp4xvliToCnkfiJsKGpZCOt/+JUG
	tqbHeiHVWBT8/9Cg==
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
Subject: [PATCH 3/5] riscv: compat_vdso: Introduce COMPAT_MARCH variable
Date: Fri, 19 Jun 2026 16:11:19 +0200
Message-ID: <91885dbd798696aef7209cea9dd30aff2797e9b2.1781876501.git.namcao@linutronix.de>
In-Reply-To: <cover.1781876501.git.namcao@linutronix.de>
References: <cover.1781876501.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_071133_838925_3A77E42F 
X-CRM114-Status: UNSURE (   7.32  )
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
index 9520569ee079..06d28a5a0368 100644
--- a/arch/riscv/kernel/compat_vdso/Makefile
+++ b/arch/riscv/kernel/compat_vdso/Makefile
@@ -14,10 +14,13 @@ COMPAT_LD := $(LD)
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
