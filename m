Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45719C27C65
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2024 20:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a0zYH6cStSXHnQ3S9yIeKjj/Kt0nOnoYBFMIad7pkGA=; b=Ftc5435YatMshz
	kB2KjW02Bw76N/JKBDJA7D2hv7Z6jWjqXYcuoJfp9USbWkQ6lxtscm4/0erZFoJCNOXL1TsBQrJ5J
	gSkMZWN0weCLk9bmz2f+9F3qCIJi8ZGSl5Jm4AwRa70omIe7aKQpR5BIhtrOTQoRIL8Ex6lHE1R31
	SXAz7dNDIn13GWgMab66lavQTWeyou/a/1VT44JR0O8QZwhGYEaeB7EsBZQI+I9Qj+GEM53XcHo5d
	9mQ7gH0HIAonWSEP5jJsvmLXt5PCWy10f0DqQXs9fmXY3Nxbi0vpCcb8SZLF1nV7u3dunTLqZEtlU
	jTXXS6357RmCT6pOnD6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFg6V-0000000FVU9-0r5K;
	Fri, 07 Jun 2024 20:22:27 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFg6M-0000000FVQ2-1xEB
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jun 2024 20:22:25 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1717791734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9qZuhyf1lQhZt5s3eJFi8xrQOgugcSrfCBUJNf59gow=;
	b=zVDZmWbztBHi/M21/7J+Y5FeFxkTdBDatbLJyQAc/z8s1fHROXf0zBSzAL/ulQstFpGyrg
	zfRyUsZci059OwtCvS4pPWPeybEYXmpYcl9KeVkQu3D0dYr0+ETILmKDEpVxQoF8CRCx2B
	sgtVFRsKdkiMvSQy+OvKMhL1FQfSyJE4OtbAw0xLHV7tu+ob99ohN3mARhPZGooCxxsUo4
	ojVMsEJt0VI0ymsM0cqCF8hlbGz5FeazRfVXsJj4cRo8eNrFYN/l3pWMIMby3HtBU6WTZ7
	OJkRVLCe8REVuuhkiXTne8T9cvBMoyFqfw5HrwgNpo4eqoyRdtqGWelHmpJgkA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1717791734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9qZuhyf1lQhZt5s3eJFi8xrQOgugcSrfCBUJNf59gow=;
	b=gO8J18EreVY72dp9ASgoYtgplWRm+hThsi87epU0keVDaiDb0vsxg5HPVyY/g/jh5RcHeY
	CVYR7vY5j36RVlBQ==
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] riscv: cleanup XIP_FIXUP macro
Date: Fri,  7 Jun 2024 22:22:06 +0200
Message-Id: <95f50a4ec8204ec4fcbf2a80c9addea0e0609e3b.1717789719.git.namcao@linutronix.de>
In-Reply-To: <cover.1717789719.git.namcao@linutronix.de>
References: <cover.1717789719.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_132218_691690_14F56AEB 
X-CRM114-Status: UNSURE (   9.93  )
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

The XIP_FIXUP macro is used to fix addresses early during boot before MMU:
generated code "thinks" the data section is in ROM while it is actually in
RAM. So this macro corrects the addresses in the data section.

This macro determines if the address needs to be fixed by checking if it is
within the range starting from ROM address up to the size of (2 *
XIP_OFFSET).

This means if the kernel size is bigger than (2 * XIP_OFFSET), some
addresses would not be fixed up.

XIP kernel can still work if the above scenario does not happen. But this
macro is obviously incorrect.

Rewrite this macro to only fix up addresses within the data section.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index aad8b8ca51f1..1bc103aa9b74 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -142,11 +142,14 @@
 
 #ifdef CONFIG_XIP_KERNEL
 #define XIP_FIXUP(addr) ({							\
+	extern char _sdata[], _start[], _end[];					\
+	uintptr_t __rom_start_data = CONFIG_XIP_PHYS_ADDR			\
+				+ (uintptr_t)&_sdata - (uintptr_t)&_start;	\
+	uintptr_t __rom_end_data = CONFIG_XIP_PHYS_ADDR				\
+				+ (uintptr_t)&_end - (uintptr_t)&_start;	\
 	uintptr_t __a = (uintptr_t)(addr);					\
-	(__a >= CONFIG_XIP_PHYS_ADDR && \
-	 __a < CONFIG_XIP_PHYS_ADDR + XIP_OFFSET * 2) ?	\
-		__a - CONFIG_XIP_PHYS_ADDR + CONFIG_PHYS_RAM_BASE - XIP_OFFSET :\
-		__a;								\
+	(__a >= __rom_start_data && __a < __rom_end_data) ?			\
+		__a - __rom_start_data + CONFIG_PHYS_RAM_BASE :	__a;		\
 	})
 #else
 #define XIP_FIXUP(addr)		(addr)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
