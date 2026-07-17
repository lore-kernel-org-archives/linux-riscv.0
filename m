Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7458C44514
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 08:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wy5fqmGN/V9z3x7w33YRFPgj07Fy1PmQ5UhRUx9QrDI=; b=L1673HHwX6/jh8
	5R8g41wnJvSfxeDY0JueL0BkyQhbEU6ISxzSsAQ0mPkkhrGIXR/iX14ioZMUTAUM/lSRHWYGCEQ7P
	jSDrEp3D8UB9SX2qqdCUmO6VU7PU/OfqxaBhvfWqYAn8SyiiJwN2FhK/rahSuRf9yUaMJDJun/PpH
	XIWvcaGMKzRu5nfcDHP3NbqtoLkHvBoY0ArOQNw5loTDSEw6whO7iSOUGZlO9gF3hEYTwuOeDRqNH
	NBxGtOgsscBYOukJi9kCzn6tdKgnxilCrLK/yDjTjLHraeZASoEqM8MaG8bQNeRp8Yja+1uNWLPYA
	ryC/QFu+8BVSgBG1nQwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdb3-00000001Z5X-2KGg;
	Fri, 17 Jul 2026 08:07:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdaz-00000001Z2T-2TPt
	for linux-riscv@bombadil.infradead.org;
	Fri, 17 Jul 2026 08:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pBDhUIAkr3h7kDmW6cW3zlXUtNbH/QbCHeJocp9cdb0=; b=lSQQbvTnqAKomoikyC676ekmhc
	R+6UW57zPDq+8pwXzaQ3efoK8g1QuLgQ90cOhF4U8YeipGfzI+uenRfoNyDDVVZuRjvKIRPeOXKb6
	32HSk9zdSZZUvdEoDs7GBa2/gEt+T+uGy9s/0n7M5NhInj9rMKta+JujcpE3xkw4jtZ9K4z1+nCfM
	dyreUuaRgwMWRUwpB1MoMcEDCmgwpXW1efSmiX0WDED/aXcv+LjIwQxPCX9qxif3+wzjBGN7Rxhtx
	nLxpD5YrKfEOdCvVccYh14lkE/tUfOQ+eZPpOJ4HS2JVRjvg9nfdrQb2WSMCWCAKlFqEklbAzVdTr
	ScW2Bi+g==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkdav-0000000Ee02-0FLJ
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 08:06:56 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784275611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pBDhUIAkr3h7kDmW6cW3zlXUtNbH/QbCHeJocp9cdb0=;
	b=BrM041GNN1/1MNNEoIDTHygmuKZCGwzqryUwiLpR3XWBQvnK2mKk0r9BaFygxiO6OSXOQn
	9ocRjwEGdfOhTi1dvXxR6/KRB5kPTIlqdor/e2el37n5HNvr7NXnZu3GThcP96KFxHsABg
	larTa/hRJ3wf+e/pBi37HAQ1+MAsvtT1eRlWntex45qhS0AGdtsnrW5XJAwrsPhvw9WgJj
	vy8yXN/KYSLZRxKvhC46VSDcGNd6umWsKPThlZLWyJ1g/EN+8QrNszJUPX+86jql2SJSjN
	VB7irxQA3BEDTz+tqxHL0xkY/9zYhHaekKFO7ItV+5/0CcUMNg8rbq/iJCOeeg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784275611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pBDhUIAkr3h7kDmW6cW3zlXUtNbH/QbCHeJocp9cdb0=;
	b=VcSXoklXmig7w9WUcc1PO9Yu5sc+DNOodBSkGc0ELbtkJN6OZIGt2Xy1/HB1PPj/rT1ItY
	estwVKWj9QGf0YAg==
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
Subject: [PATCH v3 3/5] riscv: compat_vdso: Introduce COMPAT_MARCH variable
Date: Fri, 17 Jul 2026 10:06:36 +0200
Message-ID: <adf98cc87ffffe0264523c1802b5a22e6047788f.1784274927.git.namcao@linutronix.de>
In-Reply-To: <cover.1784274927.git.namcao@linutronix.de>
References: <cover.1784274927.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_090653_336293_7B39F579 
X-CRM114-Status: UNSURE (   7.04  )
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
