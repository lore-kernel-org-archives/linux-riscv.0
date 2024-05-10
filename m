Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF76CC25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 06:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Q68KPyuPT+Ux6Z4REFtnHdVjSadkRJvv/5mJeShNpo=; b=35zXxvcrRdpLe1
	ixr/kzZA+blNk8xa8xDMHIXc9EUF3R+UUJcXcKJchfxKOtYHvaipbQez48joMveSuYjLHsm3i2WdK
	X/WD1Mg55gbbt8jBa4Yk0JVQlf93t5YELO1lJ9yl+PrwDtwJ7FzulfmokK3xa/kP3N5IrQBJieKo+
	lSDyZI5oOnhLAc6ryKJYV0HB5d1iXeZWhDx+V5FmE9YCRe9ALrMc9dwuxIf1y0K7BsUXeYxq+jQDe
	OVXoChXYVB5XVPKZNWOhoQAN9GlmPCcqu4Pk3n1zqJF8jnPSR39sX8yENG0gdpOAanSs2lBhf2610
	1EehFihjvSdnXaMHEFeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Jkn-00000004DKD-42N4;
	Fri, 10 May 2024 06:29:13 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5JkV-00000004DFK-3HII
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 06:29:00 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1715322531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PHH4si6HFtRU8b7XLsqZ3Kjry/eLFHCUpKXqXT+XYYE=;
	b=pJH6m5nrkDt3+jD3PIkIMz8VBpZ/9+k99dffmckcKtKwiuuaD+8TsfYWRZfXVAcQNG2nt5
	NlUFIBbQQWT8F6Zrx71jV7YqKNmTFF/+PUDWuecv/Viz5S5KWlM3+QE8vQOTtHPibmOZPS
	wLzc7GWC8GRQc3z3773AWuVSSsFE120Fk/Xm8A/7WgCmp+5kJlHayekS0/K4t2qDk5BCst
	+kNj3l8Dn1yE30RRbxhU8W/inDJj5FjgsJpLGBfhxo1g0dgzVXIn1h0N08S8DoVxncnR0g
	NpkkcsH1IHedk8aPfOnloFWRjlhKtUKYz59QFj0zzmRzztVuly1wtc9uf7URhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1715322531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PHH4si6HFtRU8b7XLsqZ3Kjry/eLFHCUpKXqXT+XYYE=;
	b=2Lo9Nf1Ifnp4bxdW9nkeaSAmtEmKy9Oi9r3EaIijAJh2luo9NqMhHCeyyYg22CUMqEjmY2
	mKXahnaTxjw4PoCA==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 4/7] riscv: drop the use of XIP_OFFSET in XIP_FIXUP_FLASH_OFFSET
Date: Fri, 10 May 2024 08:28:42 +0200
Message-Id: <a49044c3833e40546f35dd1f821a683e6f4dfc1f.1715286093.git.namcao@linutronix.de>
In-Reply-To: <cover.1715286093.git.namcao@linutronix.de>
References: <cover.1715286093.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_232855_997739_F93E5071 
X-CRM114-Status: GOOD (  11.26  )
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
