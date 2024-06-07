Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5CDC27C53
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2024 20:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/CkD2HEa6ozucS7rGYkvWvraFxKpLJrywPF8SGwrRg0=; b=iWedgtaO1VV4V4
	o5e1nq8C2Ak4gNhxb0U2pC78hDiPDSgLIKu1E6cYPpsC66UB0GWQg3HjtCTqCqcxHDTZcIs6PtjvB
	3vU/1bKbznyE6ZVheSIFEHfprbfJXD56DtSEVqNQtiByUl2ciHdudeuIzofGg1TxqCJM6bgINprqJ
	zXebDANbauRINZDhHMIQgDaDZQKfbitMFs4UZOyprQ1ptwqoGl7xsqI6aIwDT2WekwjJA/U//PuMU
	wdvSCIGqwPtOwlEg/LokEu2Fw86ArbJe5Y1/56aUEdNsHzAahVm/RpvhKrwqtGIfEWyLEJB0ef5DB
	2JVystt/jslDljBwDUhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFg6Z-0000000FVVl-3VYp;
	Fri, 07 Jun 2024 20:22:31 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFg6Q-0000000FVRc-0OBp
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jun 2024 20:22:29 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1717791734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DbsnZTi3yzYGcTgPSKaSRSUxnZfcrNRyLlLmKPFRcq8=;
	b=mEqcFoqVjpXHIvQJzHnpy33A6eYLASQS9rK4xkGen/LQ6fhZnv+Ap785wROp0YvwD8FHU7
	niKGv8x9Tk6bjiBkbMqWHx7aTIejL0Q/v+67iX5EsW6Nr8SNLpiDRAKoDnsc823a6WxVYk
	uxqWB1BI7+OZ9N2AJ+qdfCIgjWFsuZQya0s6/DqRY3F5sIGmwmBQytg9ToasdWeP33Cmt6
	Td8LxG0z+CU/rjNEd7//nkHBh+g8CuYp9a5AAhRulQWmX32QDCA52nJsFgAtcluFleaDyn
	cFBOfrJWPcssBbXUtmJgPwLAqiwyBUF+y452lk5Iz7hETS57gUaAITAPT8zB1w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1717791734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DbsnZTi3yzYGcTgPSKaSRSUxnZfcrNRyLlLmKPFRcq8=;
	b=gDBFKNnGRevOYtiAVL7cWyH6dsm6ymR4UCm6nKm+VDXdqgBs8BzfgFefTbtv2zd6af76QU
	n80+Z688v6fHDwAw==
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] riscv: drop the use of XIP_OFFSET in XIP_FIXUP_FLASH_OFFSET
Date: Fri,  7 Jun 2024 22:22:10 +0200
Message-Id: <7b3319657edd1822f3457e7e7c07aaa326cc2f87.1717789719.git.namcao@linutronix.de>
In-Reply-To: <cover.1717789719.git.namcao@linutronix.de>
References: <cover.1717789719.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_132222_489809_1FA312D2 
X-CRM114-Status: GOOD (  10.94  )
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

XIP_OFFSET is the hard-coded offset of writable data section within the
kernel.

By hard-coding this value, the read-only section of the kernel (which is
placed before the writable data section) is restricted in size.

As a preparation to remove this hard-coded macro XIP_OFFSET entirely, stop
using XIP_OFFSET in XIP_FIXUP_FLASH_OFFSET. Instead, use __data_loc and
_sdata to do the same thing.

While at it, also add a description for XIP_FIXUP_FLASH_OFFSET.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/xip_fixup.h | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/xip_fixup.h b/arch/riscv/include/asm/xip_fixup.h
index 9ed2cfae09e0..f3d56299bc22 100644
--- a/arch/riscv/include/asm/xip_fixup.h
+++ b/arch/riscv/include/asm/xip_fixup.h
@@ -24,13 +24,21 @@
 	sub \reg, \reg, t0
 .endm
 .macro XIP_FIXUP_FLASH_OFFSET reg
+	/* In linker script, at the transition from read-only section to
+	 * writable section, the VMA is increased while LMA remains the same.
+	 * (See in linker script how _sdata, __data_loc and LOAD_OFFSET is
+	 * changed)
+	 *
+	 * Consequently, early during boot before MMU is up, the generated code
+	 * reads the "writable" section at wrong addresses, because VMA is used
+	 * by compiler to generate code, but the data is located in Flash using
+	 * LMA.
+	 */
+	la t0, _sdata
+	sub \reg, \reg, t0
 	la t0, __data_loc
-	REG_L t1, _xip_phys_offset
-	sub \reg, \reg, t1
 	add \reg, \reg, t0
 .endm
-
-_xip_phys_offset: .dword CONFIG_XIP_PHYS_ADDR + XIP_OFFSET
 #else
 .macro XIP_FIXUP_OFFSET reg
 .endm
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
