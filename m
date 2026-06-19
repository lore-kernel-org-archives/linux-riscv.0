Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFEFCD4F26
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jun 2026 14:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tN/uHHqlV8OXT6OqzG1KxMJOPs+LfGgoALxxJlMYdV8=; b=vU1L0OwlUec4yp
	brqrM+RWi2Ic07qfud9D3IHOeiiwW15JHnjonVGvynvqhFlM+UGWlbDRT5lwj9Yh5yi0ZhLI0/PGW
	fYfMwqi1Y9FE8ojjiixdN9XZk8NHOOPSLSo8h2P5h30uraLNvdWFmOSRQkrGt14RHFSf1R2c49tfN
	X0J4KFvZGcM7cgRJPQ1LHRYZdyNP0SmHbEHPMs2YPS9CZE8qZukicT08WhbWwrWuRNPGJX4UKBCQE
	jf+ho/V3rgudYk/qyJ0KWKo7dDWHPtBCRYFMjlThUB2k5UWi63KFL2ogxqvr3Rb4m9nqONAzZOdDT
	YRctpTLX6rtR+ral02Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZwX-00000002Y7M-3Zrm;
	Fri, 19 Jun 2026 14:11:37 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZwT-00000002Y3p-16r9
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jun 2026 14:11:34 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781878291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bfuFJ77a5aiag+HQwk+NZ/j8B8G1PMTNy1a1C6lG7tE=;
	b=YeuKbzi7myXx4vskMAb0DN/dFtsPvR3UUrYc9oDym052gnp+KAUxj1YF+dS3BY56XNB6MT
	FwNAxcCiSojW//nFtycP15VixYT2Z0HhIlIFw5GJNM+0EDZ9F35huit91o0ajw9O2U0TEO
	1l78/nRSSkQpzlFHdpt6M5rZLsxJ/1+t0BT7vqDmYfbWlKFMe0ZWyfCwASpVIdyKEKndnx
	uPezJ9900oXpVrBikRIlKKHtD+YDVmtH/cKbsQoSoC6v4udFXu+frDcET14fEEmyGxEDRz
	uZlUdry+sEalgSmLFLfgqDhmE4ehgGsm5pHeJDvxOfzF8cOd+VQQi/z2QA+JIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781878291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bfuFJ77a5aiag+HQwk+NZ/j8B8G1PMTNy1a1C6lG7tE=;
	b=swXvXVFsPzcd5GxbFwM26mIspEvakkvcY3bbJheN/clBqnF9JCPXwYNnvzoEnq/DiNkgI8
	HbK+od6IiIHDtJBQ==
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
Subject: [PATCH 2/5] riscv: compat_vdso: Allow *.c source files
Date: Fri, 19 Jun 2026 16:11:18 +0200
Message-ID: <d8e9f7c9b4ad4b9324e23c37704e4339d0a5a398.1781876501.git.namcao@linutronix.de>
In-Reply-To: <cover.1781876501.git.namcao@linutronix.de>
References: <cover.1781876501.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_071133_451154_FA2F77BD 
X-CRM114-Status: UNSURE (   6.02  )
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

Extend to support building *.c files. This allows adding futex.c in a
follow-up commit.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/compat_vdso/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/compat_vdso/Makefile b/arch/riscv/kernel/compat_vdso/Makefile
index 52a99c7e41c5..9520569ee079 100644
--- a/arch/riscv/kernel/compat_vdso/Makefile
+++ b/arch/riscv/kernel/compat_vdso/Makefile
@@ -44,6 +44,7 @@ LDFLAGS_compat_vdso.so.dbg = -shared -S -soname=linux-compat_vdso.so.1 \
 	--build-id=sha1 --hash-style=both --eh-frame-hdr
 
 $(obj-compat_vdso) : KBUILD_AFLAGS += $(COMPAT_CC_FLAGS)
+$(obj-compat_vdso) : KBUILD_CFLAGS += $(COMPAT_CC_FLAGS)
 
 # strip rule for the .so file
 $(obj)/%.so: OBJCOPYFLAGS := -S
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
