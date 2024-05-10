Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E5CC25B10
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 06:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ndVoj61cyrO0occKU5TZMs9DtIJFLcVR3/6Kkanp+Q=; b=erpyYmdZv2PuwI
	u88E2I6TMs+tanb3g7Vyu9LkQl1XRvRGK0MAWQJTD344CsCQgHW9DesUjRKoyBekT2Kc6ipp3OcCn
	oGcKErNynFaNcvKi5DZ/azyObDrrqCBhv9hMOSp2biBG0HvptcdTQmEpkoo56CzwdhhFIO+g9fbGg
	zQFVPXexOMZVaqBvtioQ7taDfcPaUOm1nmD1TFcrz3UKwQ8vuwaeUFrLFcuFJmBpXqT83szsmKgNZ
	xz3A0vDNOkKr7m1p7XzYvGMwIUfu010DjZWQcs66x7urtZ7Jqs9O01f+BujS9J0OzvAPDdJZ72QWP
	00A0mgHP+U6WDN9vUTxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5JlC-00000004DSF-0fbZ;
	Fri, 10 May 2024 06:29:38 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5JkV-00000004DFJ-3VNV
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 06:29:25 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1715322531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eHgttoFFWFRLkchEo2QfX0lB112yKyL9eNSmZIo3a+8=;
	b=rym64PB+TVDtCShFhxpKTOgaRSwibgR7yFlmNFd4PvRAuUrYMc2UEwlsOKr+TaA2X44nKV
	/BGxJK9Lz4G67Y++lwd+9styGjOi3EJMSAckZSpmyt1Q6ailUw3Xf3l2DOiF40V1U/JZJp
	9AfXnueGo9xcQGlawkeXI+cpmV6+WRVdB0bp2GqbzI1z+8tL21tnqud3yB/gzQw8aO0caN
	X6WpDnfSbqejhpXjrUfApK8jWG8/z+mvSS9iT+CL20f0h1woOwJc3FdR4h2bsGR4C3aCOj
	Nvl2zdqa1AWxKEuUTTZlLL+QlcecxyhlgNYw14dGuhq5uJ0d3zgrfyRCfNPCxA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1715322531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eHgttoFFWFRLkchEo2QfX0lB112yKyL9eNSmZIo3a+8=;
	b=0PkNmo9aY3VUVjYwMRi7xLx59JUldrS/CLbglWFZDpVhxTuy5/Erscv7pKrXKonLZoj7mR
	7fDp+5SrNKk0kuDA==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 1/7] riscv: cleanup XIP_FIXUP macro
Date: Fri, 10 May 2024 08:28:39 +0200
Message-Id: <19e63324d7a099f561c4a2e55f7df051bd5b8a6f.1715286093.git.namcao@linutronix.de>
In-Reply-To: <cover.1715286093.git.namcao@linutronix.de>
References: <cover.1715286093.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_232856_176178_2B300359 
X-CRM114-Status: GOOD (  10.22  )
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
RAM. So this macro correct the addresses in the data section.

This macro determines if the address needs to be fixed by checking if it is
within the range startting of ROM address up to the size of 2 * XIP_OFFSET

This means addresses within the .text section would incorrectly get fixed.
Also if the kernel size if bigger than (2 * XIP_OFFSET), some addresses
would not be fixed up.

XIP kernel can still work if the above 2 cases do not happen. But this
macro is obviously incorrect.

Rewrite this macro to only fix up addresses within the data section.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/include/asm/pgtable.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 58fd7b70b903..fbf342f4afee 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -139,11 +139,14 @@
 
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
