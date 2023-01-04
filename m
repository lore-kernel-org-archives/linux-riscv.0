Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD36C3DA7D
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 20:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9cCYLgjsEQR4SgmMGQuj7f2wDReMajxcmJlMQf5vL6M=; b=jSpKlr4yUJvmLd
	YnSITMgL1bBbRL+dY2RNz4hsPnBG81SMfY+lXFZzVJ6XLTWPJAj1+CvPTjuFJLBPZDEeJFb6jiEOY
	sbEp17gKVxlBLZeXYt3DqXmFKQaGfzRbYKvfHnlf8OvsjKsM+s4xkDaobm8LvhthNIrLD7HpkhEGA
	Kct5yC3HYvEUeeciiXo6OB5OBLD8P9EnWGkPutMInX99F/PPrYi9HsRKTo3qAjCfxuIiJAjyVLhgi
	/IbMCmW4EwACXYSYEqOs5Q9AAD/1z0C9X/1pMp/zLcXrt//EuQXTAahz7LbPdRzmULmCTMa/KPfsM
	EGLgJvJs4VU0FEDoc0Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDX53-00Egk5-S7; Thu, 05 Jan 2023 20:43:17 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCyPy-007S0e-0F
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 07:42:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1672818146; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kXOGhCEsUOIoGcN7IYHmRsUkVy1d/H/8f9Vrc1UZQVO9Aw2XJUlm/JMsRekN9tOowfJ9QXt8SOIbYQUco7tjLnUJJAAuIrWjhNMOhk/dgZEnD4tjLxkkG8J3fBZ3VpEOFPGKiPwU67RQrkNGiz/r1/N2sM4qP25Efp8kIBbVPxw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1672818146; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=7bm1c9V9mbEvG0nE1vfvfYoLOK+YNwcrZvHViShhvQo=; 
	b=Fl5u6TgQHavtb61bOYd5LyZ0+xo8z50h7yv7HK43tpwvbYzGs337LVSwJnsiL/aK2ssChzejeY3qPrg8Z9Tyq3old1JdBMSgqL8uxBeF0+V/oGzuoHPwI6uLqhqFH0C1nHcNCpeswblwHA3nsvRXs587xIYDF8AmDjM45W8sQBQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1672818146;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=7bm1c9V9mbEvG0nE1vfvfYoLOK+YNwcrZvHViShhvQo=;
	b=S4eWgWylW60Eh3PqkTAhNzqdDjXoZfqvp8esNveaed1hICy6nDjPRHvvcZiQYlIp
	sIKffP7jejk75FeBZEAFlJpbGrlPXudd9h8udflcYgb6DiDuzrgJiMZlqLb64Gdj6kV
	ocspKbZCSEBHym3E9IHM0Ac1DZhggO8VH3gm7eF0=
Received: from edelgard.fodlan.icenowy.me (120.85.96.143 [120.85.96.143]) by mx.zohomail.com
	with SMTPS id 1672818145011482.02075958826026; Tue, 3 Jan 2023 23:42:25 -0800 (PST)
From: Icenowy Zheng <uwu@icenowy.me>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [RFC PATCH 1/3] riscv: errata: cmo: add CMO macro variant with both VA and PA
Date: Wed,  4 Jan 2023 15:41:44 +0800
Message-Id: <20230104074146.578485-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104074146.578485-1-uwu@icenowy.me>
References: <20230104074146.578485-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_234234_209536_F19A601E 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 05 Jan 2023 12:28:40 -0800
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

The standardized Zicbom extension supports only VA, however there's some
vendor extensions (e.g. XtheadCmo) that can handle cache management
operations on PA directly, bypassing the TLB lookup.

Add a CMO alternatives macro variant that come with both VA and PA
supplied, and the code can be patched to use either the VA or the PA at
runtime. In this case the codepath is now patched to use VA for Zicbom
and PA for XtheadCmo.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 arch/riscv/include/asm/errata_list.h | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 46adc1c9428f..bf80dd58145e 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -118,6 +118,9 @@ asm volatile(ALTERNATIVE(						\
 #define THEAD_clean_A0	".long 0x0255000b"
 #define THEAD_flush_A0	".long 0x0275000b"
 #define THEAD_SYNC_S	".long 0x0190000b"
+#define THEAD_inval_PA_A0	".long 0x02a5000b"
+#define THEAD_clean_PA_A0	".long 0x0295000b"
+#define THEAD_flush_PA_A0	".long 0x02b5000b"
 
 #define ALT_CMO_OP(_op, _start, _size, _cachesize)			\
 asm volatile(ALTERNATIVE_2(						\
@@ -144,6 +147,33 @@ asm volatile(ALTERNATIVE_2(						\
 	    "r"((unsigned long)(_start) + (_size))			\
 	: "a0")
 
+#define ALT_CMO_OP_VPA(_op, _vaddr, _paddr, _size, _cachesize)		\
+asm volatile(ALTERNATIVE_2(						\
+	__nops(6),							\
+	"mv a0, %1\n\t"							\
+	"j 2f\n\t"							\
+	"3:\n\t"							\
+	"cbo." __stringify(_op) " (a0)\n\t"				\
+	"add a0, a0, %0\n\t"						\
+	"2:\n\t"							\
+	"bltu a0, %2, 3b\n\t"						\
+	"nop", 0, CPUFEATURE_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,		\
+	"mv a0, %3\n\t"							\
+	"j 2f\n\t"							\
+	"3:\n\t"							\
+	THEAD_##_op##_PA_A0 "\n\t"					\
+	"add a0, a0, %0\n\t"						\
+	"2:\n\t"							\
+	"bltu a0, %4, 3b\n\t"						\
+	THEAD_SYNC_S, THEAD_VENDOR_ID,					\
+			ERRATA_THEAD_CMO, CONFIG_ERRATA_THEAD_CMO)	\
+	: : "r"(_cachesize),						\
+	    "r"((unsigned long)(_vaddr) & ~((_cachesize) - 1UL)),	\
+	    "r"((unsigned long)(_vaddr) + (_size)),			\
+	    "r"((unsigned long)(_paddr) & ~((_cachesize) - 1UL)),	\
+	    "r"((unsigned long)(_paddr) + (_size))			\
+	: "a0")
+
 #define THEAD_C9XX_RV_IRQ_PMU			17
 #define THEAD_C9XX_CSR_SCOUNTEROF		0x5c5
 
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
