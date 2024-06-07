Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37A7C27C55
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2024 20:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yyeXJVk6oID6S+KeeOj92WERGyFN2ag9EBAJaj1eyWQ=; b=pE/lubV87V2JEF
	ETn6hhxyUTEt2oQKcT2Gu8Huki+D/suTe65PXyIeKw/941TDyURee6i6+upjvsupNaYntYI/pjCIT
	4lYUkiP5FDp7llDAr7Ex3pK+RUXZUaD/bCyTMOuTUvr8FKHrZPi8wPdARVjNzAwqGkld6Nquvh1VX
	clZvXfcsbbMzGBnkwAOtZjjCWt8LaRMh+5F8hz0MIVHxgbzGD7rl+J7Ov1ij5H5IxLkr0MkU3YyvB
	v2OkZhaLAO2F0fmfiAjkEkj9xPVNH202uqZGC9bhk8t/kXw3y7Ad+CdTzn8ot3HkBkNz3BFoZIqui
	IfjCFgB0iEvj0g57q/fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFg6Q-0000000FVRu-38vV;
	Fri, 07 Jun 2024 20:22:22 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFg6L-0000000FVQ3-2imk
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jun 2024 20:22:20 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1717791734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xAfTfmpszFUN8R3pQgNHXaFB8SYv5tBzsg3wc1Daekc=;
	b=gxJTMEjjVsWUXg8QWo8gxk6k6dsK1gOSK8tiVKXP5qTp34PYDSnja7IWgElhx75fYN8tr7
	l602j9hesKQoFFE2N+sl62RFmCbIAC0er2w8jwhGeizfJq0wTou/jxVaJ1FadOiltK1VKX
	mcw5Rniv4bObsJlZxU8kgMXDshp4S1YlKAr9hSGIYjtvYhtc0GdU02f39XNFsYilbM8wPw
	8312nbySFzXFPtx2L5HiG5xwvnjOED8vhNJIuLQKM0leerlH6gIu/tvcYgkthd7LTenxky
	hpaTZounjSwIpPUegA0PssykWkUF8peu71Z3b+LJhdcbDj53w6X7d92mtiyK2g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1717791734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xAfTfmpszFUN8R3pQgNHXaFB8SYv5tBzsg3wc1Daekc=;
	b=nofRIHje+QL9kJv7xuUmmYgeTzznlDF8UquGUkvpWA1FtPDrwMFpZchdLaVXLfcVSs9T73
	K/C9iB3wE69jeUCg==
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/8] riscv: drop the use of XIP_OFFSET in XIP_FIXUP_OFFSET
Date: Fri,  7 Jun 2024 22:22:09 +0200
Message-Id: <dba0409518b14ee83b346e099b1f7f934daf7b74.1717789719.git.namcao@linutronix.de>
In-Reply-To: <cover.1717789719.git.namcao@linutronix.de>
References: <cover.1717789719.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_132217_870027_E89B052E 
X-CRM114-Status: GOOD (  11.32  )
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
using XIP_OFFSET in XIP_FIXUP_OFFSET. Instead, use CONFIG_PHYS_RAM_BASE and
_sdata to do the same thing.

While at it, also add a description for XIP_FIXUP_OFFSET.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/xip_fixup.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/xip_fixup.h b/arch/riscv/include/asm/xip_fixup.h
index b65bf6306f69..9ed2cfae09e0 100644
--- a/arch/riscv/include/asm/xip_fixup.h
+++ b/arch/riscv/include/asm/xip_fixup.h
@@ -9,8 +9,19 @@
 
 #ifdef CONFIG_XIP_KERNEL
 .macro XIP_FIXUP_OFFSET reg
-        REG_L t0, _xip_fixup
+	/* Fix-up address in Flash into address in RAM early during boot before
+	 * MMU is up. Because generated code "thinks" data is in Flash, but it
+	 * is actually in RAM (actually data is also in Flash, but Flash is
+	 * read-only, thus we need to use the data residing in RAM).
+	 *
+	 * The start of data in Flash is _sdata and the start of data in RAM is
+	 * CONFIG_PHYS_RAM_BASE. So this fix-up essentially does this:
+	 * reg += CONFIG_PHYS_RAM_BASE - _start
+	 */
+	li t0, CONFIG_PHYS_RAM_BASE
         add \reg, \reg, t0
+	la t0, _sdata
+	sub \reg, \reg, t0
 .endm
 .macro XIP_FIXUP_FLASH_OFFSET reg
 	la t0, __data_loc
@@ -19,7 +30,6 @@
 	add \reg, \reg, t0
 .endm
 
-_xip_fixup: .dword CONFIG_PHYS_RAM_BASE - CONFIG_XIP_PHYS_ADDR - XIP_OFFSET
 _xip_phys_offset: .dword CONFIG_XIP_PHYS_ADDR + XIP_OFFSET
 #else
 .macro XIP_FIXUP_OFFSET reg
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
