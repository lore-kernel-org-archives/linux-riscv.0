Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90F1CD5BDD
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Sep 2024 11:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fBX0ypySTDP9tcXadfaDy2vZbObXFOAXm/3lulszWf8=; b=P2xl+x9+bacbI8
	rm1o/wrXxgjT+VNT9mjWapF/P3KSoF9cfE9giwPIBr5AhfWlwJtCWkwsI7i1cpEOBjrVEq/gWnt/f
	J29un7aT/YHQrrGSWz1UwOJcLRHQ621amu9COWu9H598nMK2u6Iqjd4Tf47VohO58foVdDvNlLIlH
	qtLQyaDu7d0nH/g9+GTNavc/LFkz96Y3qL8qeKI9pOFTIehnHqEY23XDxa/jZLgvONrdICXuJZfK5
	m8AkjuM3wADXcJirMzsftFYX3rCZ6PL46uSlzLRSp5b3TkvHaUn3WX2J9y3ta9JrjgGWEBLOq16FE
	Nclpy1SrgijiSN3CxIzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smXAZ-0000000BzFO-24le;
	Fri, 06 Sep 2024 11:30:27 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smWzM-0000000BwII-1uJ9;
	Fri, 06 Sep 2024 11:19:02 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1725621529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Ov9ALPJuo44ifDiLKTc8jETenwwiDMG5WR5RiB1FXc=;
	b=b3qlaebI69J++Ip9iWlHX1oKT9b5lb5LXwZrqwaIHuSJ+HmF6V+5ctSA8G6jvwf/Y5vLan
	7H5ztePuaiblx1PpZXV2DyBn72MWj9IXkzHI5j7QddMzTwwbo/V/nE4YfKA3uOlQ2ZTAmt
	6mlL6CgqNRJYRdK1zR5gGWeb90IZWNR4HHQCDhRYGKeOCHiyOagvixGvb7H7LZGLwrWypN
	ZetNtzvs5mXfVZjMPnpGyTHoqB1Wt5eBwiJ5nej5tkuSGmglifZr1I9kvEvi25JJCy7Vy+
	lNEThV4fnDqoUcq9uQSgPziFMcmMaeE8jGg4e6/84l0moqrw7afbFR5SXiYpXg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1725621529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Ov9ALPJuo44ifDiLKTc8jETenwwiDMG5WR5RiB1FXc=;
	b=k9Fl/fZu4R4YaQ75y+xQgYG61hhbuFdl/8yIjSC67o5UM1UWJ6bdDeX3Hrrh1XYtjYm8dU
	nJ59tZApDdHxo7Bg==
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
Subject: [PATCH 3/3] riscv: Allow to enable PREEMPT_RT.
Date: Fri,  6 Sep 2024 12:59:06 +0200
Message-ID: <20240906111841.562402-4-bigeasy@linutronix.de>
In-Reply-To: <20240906111841.562402-1-bigeasy@linutronix.de>
References: <20240906111841.562402-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_041852_691765_CB145967 
X-CRM114-Status: UNSURE (   6.95  )
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

riscv has all the required architecture related changes, that have been
identified over time, in order to enable PREEMPT_RT. With the recent
printk changes, the last known road block has been addressed.

Allow to enable PREEMPT_RT on riscv.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 801ee681059ca..a9be4dca380dc 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -65,6 +65,7 @@ config RISCV
 	select ARCH_SUPPORTS_LTO_CLANG_THIN if LLD_VERSION >= 140000
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
 	select ARCH_SUPPORTS_PER_VMA_LOCK if MMU
+	select ARCH_SUPPORTS_RT
 	select ARCH_SUPPORTS_SHADOW_CALL_STACK if HAVE_SHADOW_CALL_STACK
 	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
 	select ARCH_USE_MEMTEST
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
