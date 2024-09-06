Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DFCCE7B02
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Sep 2024 11:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SzFTUUefL4yw/MMy6qegSvHWXSQ3CcDJpu4pdTn4pk=; b=1k2GzgK7Ozga2c
	lw3uRVrTZv8ZAR/km6cILtpN5BsqB4VrXYIiYwK31kwFqSQy4sJrJTwbyWiKv3yOTx6p/7wNAEvLk
	gP0Pge6xvAgeZSgaX67VMPokCbpph5hC/juIPRadML2eX4LLFiXb98I+UvLd57rRMdgT/2at9M+7j
	caPzv+w6pCkg9/9mk5YlLwmVKqbFiu5WkBEa3Gr8W7BUz2IwP83rqCHirgSUsoAA3sG5NfFfaunTK
	t9KOzfLQHemBjPt9nZrwB0IGX6E9NOSX5XtDEcVsr8ToIAOGAL/uXFQIkbZFcnN52o/2kpyQGUliq
	wdsq1sQbs0SnpdBb7Qjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smX9d-0000000Bz0l-0f9L;
	Fri, 06 Sep 2024 11:29:29 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smWzM-0000000BwI2-05jF;
	Fri, 06 Sep 2024 11:18:57 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1725621528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x24fAVGIJ6RuBG9Lhr8zLFLnY6PVtiQ+egHDc5imzTY=;
	b=VfZkbxfeVSYo8CDDMZ35DzkLGbAxtXEqxJTTahK9OPPE95/ZrgARouXC6xlRFXgZ1Dq6HE
	QShB7PFR1C31xUDFfHcIiQQf5x0QK7zgjFbQYs7suIrcIAcicX+Go12o+iNNtRsD18wHCu
	L+laTOp9PbG28VcUtAPlHLSppTvAwCNzu2oHFYqnhA3ZJ/MKNzm0+BlSqf+qjPkT6ouCfZ
	dHoOWMX8G1pgXaFe6C6dusln/bluwbGsUfHmqsev0Tb7JsVHvyRiGCXf0etdNSXx38bqFp
	rSe43qa44M31mcTkeHgCtC2oGWhF52cj0P9c5dzqlFJvVPjJrdGbnBd1FdXiQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1725621528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x24fAVGIJ6RuBG9Lhr8zLFLnY6PVtiQ+egHDc5imzTY=;
	b=657UDvKx20erci7Np8vEKYB6HMqB3iipyMUZV54Cb6fGMLLEfvZ9ZjVPbpu1CL2mjJ//nq
	ORnCt1D4PHWLWjCg==
To: Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Clark Williams <williams@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	John Ogness <john.ogness@linutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Will Deacon <will@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 1/3] x86: Allow to enable PREEMPT_RT.
Date: Fri,  6 Sep 2024 12:59:04 +0200
Message-ID: <20240906111841.562402-2-bigeasy@linutronix.de>
In-Reply-To: <20240906111841.562402-1-bigeasy@linutronix.de>
References: <20240906111841.562402-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_041852_229332_254EC36E 
X-CRM114-Status: UNSURE (   6.93  )
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

It is really time.

x86 has all the required architecture related changes, that have been
identified over time, in order to enable PREEMPT_RT. With the recent
printk changes, the last known road block has been addressed.

Allow to enable PREEMPT_RT on x86.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 28401c16b0c3f..a8cf61c52b063 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -125,6 +125,7 @@ config X86
 	select ARCH_USES_CFI_TRAPS		if X86_64 && CFI_CLANG
 	select ARCH_SUPPORTS_LTO_CLANG
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
+	select ARCH_SUPPORTS_RT
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF		if X86_CMPXCHG64
 	select ARCH_USE_MEMTEST
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
