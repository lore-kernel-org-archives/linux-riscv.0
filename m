Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC9BC27C65
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2024 20:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h1R0xqY4DsmiYFBSRkCTvLDU823hBlbwQiopSJ1q7aQ=; b=kiEuwcC6qxXzpY
	kOEa2g5cvbWyqyRovcVXBiCRoeGwb0TBntaP3s7TaQNnQEUnbv3BoMWyKa0w9/xki48PbthmP6yzr
	y3Djg0AKvYQBgW5RRFhRbueO8rsN7AqaejonJYYWG+/x3jv1rTJrLIxgP+jMqAt1TRbsOwPcIT/zm
	qAL1/7x8kq2xFIiVtKoMGjCm+ayGMwDvy+cYoxuLD9llbkiuhyINy/HpyF26HPKqFMD44v0TL/92w
	k/sLZjb3ZZ5KA7seUeQ2wfclkGlGeMZaN+lSqFXc4uZnsxf82p/oXP+ajVdwbKQJFvvYnA1L5Xm/L
	48pbzLusxPwPxQcm2TYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFg6W-0000000FVUf-2dHe;
	Fri, 07 Jun 2024 20:22:29 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFg6M-0000000FVQ8-1xdy
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jun 2024 20:22:26 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1717791734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cn6XVXZM59Nth6p5tsQDc4XnTOplZUQTrnvegHUFwrU=;
	b=sD84pO/ZxF8vHvHfZgaOrW5D7kvyq5EI0jJbj4W+SN6ILAClGy5VssRHErCgGiHyp/NwXO
	OZnpD5JzqSFGWBiat2vuhQB4gv+G0m1PrtfMfafLZDdtPvMeYzJc5IflhGoLSWb8nS8wjt
	kJxyansVjaEjcaPglhJjXow7vTGq2KNE3FUU8PwsPnJsEz+U+lmyOVSXoaiSAlMvvII/6m
	k7kxbe5pAKDnVaG9qF4tpQIuGjB6S0rlGDKPQN7uGHI2vG7cMEc4iE3ClM+DExPnVhM7iC
	25S7NRNQBIZ7/1eQ8rI9/dWg7InxsXNoQPcxiQvp7GVnNOD1/0d5iPkEUqdbBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1717791734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cn6XVXZM59Nth6p5tsQDc4XnTOplZUQTrnvegHUFwrU=;
	b=3ojEtW3hB0mfLXr+O+vmKQZ403TBBNLnM77VmV5V/6nREtIuy9sp4RkPWThWftXATWKLaI
	RaWPtBh1X93IkXBQ==
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] riscv: don't export va_kernel_pa_offset in vmcoreinfo for XIP kernel
Date: Fri,  7 Jun 2024 22:22:07 +0200
Message-Id: <8f8760d3f9a11af4ea0acbc247e4f49ff5d317e9.1717789719.git.namcao@linutronix.de>
In-Reply-To: <cover.1717789719.git.namcao@linutronix.de>
References: <cover.1717789719.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_132218_692983_D87F6766 
X-CRM114-Status: UNSURE (   8.25  )
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

The crash utility uses va_kernel_pa_offset to translate virtual addresses.
This is incorrect in the case of XIP kernel, because va_kernel_pa_offset is
not the virtual-physical address offset (yes, the name is misleading; this
variable will be removed for XIP in a following commit).

Stop exporting this variable for XIP kernel. The replacement is to be
determined, note it as a TODO for now.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/vmcore_info.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kernel/vmcore_info.c b/arch/riscv/kernel/vmcore_info.c
index 6d7a22522d63..d5e448aa90e7 100644
--- a/arch/riscv/kernel/vmcore_info.c
+++ b/arch/riscv/kernel/vmcore_info.c
@@ -19,6 +19,13 @@ void arch_crash_save_vmcoreinfo(void)
 #endif
 #endif
 	vmcoreinfo_append_str("NUMBER(KERNEL_LINK_ADDR)=0x%lx\n", KERNEL_LINK_ADDR);
+#ifdef CONFIG_XIP_KERNEL
+	/* TODO: Communicate with crash-utility developers on the information to
+	 * export. The XIP case is more complicated, because the virtual-physical
+	 * address offset depends on whether the address is in ROM or in RAM.
+	 */
+#else
 	vmcoreinfo_append_str("NUMBER(va_kernel_pa_offset)=0x%lx\n",
 						kernel_map.va_kernel_pa_offset);
+#endif
 }
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
