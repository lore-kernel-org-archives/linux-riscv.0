Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DEBC6FD1E
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 20:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HE1cIzHZ/odusVrwZ0wQERiVV2C3S/ebQlAsG6rKeh8=; b=zgzaN2XITsd3Tl
	IYxJae/6Ts9FiausQDtGR40shBq21EZ2191H5p3YjyyPgzm5fIsGLV1F8CF+OgtmMo0KMRRfMJ3l8
	zIAohG/GS6gWPuEbbEMQtQ1urPndF3u56z3sH9LHWrB4kTyBIgUdRZaFS3hkeuI8Im01XYCb3s6u/
	eETY1EeAHjYLkrFETthhk3/4rhVJjx0qNhFEiQwfkSNhk/FBUB+gYtb/f2SzTN4nEUsGIym5jZ1k7
	yPbycPuMCczvpEv0FL/ghJW20saUlSCwyH6lb1GzZ/XEaxF+vVHxf4e64C/slIU+snHCrlbFDaLK7
	C736Wls83vNkgeqHGjDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZeOW-002Rdo-G1; Tue, 07 Mar 2023 20:58:48 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZeOR-002RbK-7F
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 20:58:45 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net ([86.15.83.122] helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1pZeOK-00FDQc-JU; Tue, 07 Mar 2023 20:58:36 +0000
Received: from ben by rainbowdash with local (Exim 4.96)
	(envelope-from <ben@rainbowdash>)
	id 1pZeOK-005z4V-0C;
	Tue, 07 Mar 2023 20:58:36 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	heiko.stuebner@vrull.eu,
	conor.dooley@microchip.com,
	ajones@ventanamicro.com,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 1/2] riscv: alternatives: add 3-config alternative set
Date: Tue,  7 Mar 2023 20:58:33 +0000
Message-Id: <20230307205834.1426289-2-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307205834.1426289-1-ben.dooks@codethink.co.uk>
References: <20230307205834.1426289-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_125843_277620_901DFB19 
X-CRM114-Status: GOOD (  10.21  )
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

Add a 3-config alternative macro set for cases where there are
three different choices for a given erratum. This will be used
when we come to patch the issues with SVPBMT and ZICBOM.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/include/asm/alternative-macros.h | 38 +++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 51c6867e02f3..8c74b00d707c 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -50,8 +50,18 @@
 	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
 .endm
 
+.macro ALTERNATIVE_CFG_3 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
+				new_c_2, vendor_id_2, errata_id_2, enable_2,	\
+				new_c_3, vendor_id_3, errata_id_3, enable_3
+	ALTERNATIVE_CFG "\old_c", "\new_c_1", \vendor_id_1, \errata_id_1, \enable_1
+	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
+	ALT_NEW_CONTENT \vendor_id_3, \errata_id_3, \enable_3, \new_c_3
+.endm
+
+
 #define __ALTERNATIVE_CFG(...)		ALTERNATIVE_CFG __VA_ARGS__
 #define __ALTERNATIVE_CFG_2(...)	ALTERNATIVE_CFG_2 __VA_ARGS__
+#define __ALTERNATIVE_CFG_3(...)	ALTERNATIVE_CFG_3 __VA_ARGS__
 
 #else /* !__ASSEMBLY__ */
 
@@ -98,6 +108,13 @@
 	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1)	\
 	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)
 
+#define __ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
+				   new_c_2, vendor_id_2, errata_id_2, enable_2, \
+				   new_c_3, vendor_id_3, errata_id_3, enable_3)	\
+	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1)	\
+	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)		\
+	ALT_NEW_CONTENT(vendor_id_3, errata_id_3, enable_3, new_c_3)
+	
 #endif /* __ASSEMBLY__ */
 
 #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k)	\
@@ -108,6 +125,13 @@
 	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1),	\
 				   new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2))
 
+#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, CONFIG_k_1,		\
+				  new_c_2, vendor_id_2, errata_id_2, CONFIG_k_2,		\
+				  new_c_3, vendor_id_3, errata_id_3, CONFIG_k_3)		\
+	__ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1),	\
+				   new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2),   \
+				   new_c_3, vendor_id_3, errata_id_3, IS_ENABLED(CONFIG_k_3))
+	
 #else /* CONFIG_RISCV_ALTERNATIVE */
 #ifdef __ASSEMBLY__
 
@@ -121,6 +145,9 @@
 #define _ALTERNATIVE_CFG_2(old_c, ...)	\
 	ALTERNATIVE_CFG old_c
 
+#define _ALTERNATIVE_CFG_3(old_c, ...)	\
+	ALTERNATIVE_CFG old_c
+
 #else /* !__ASSEMBLY__ */
 
 #define __ALTERNATIVE_CFG(old_c)	\
@@ -132,6 +159,9 @@
 #define _ALTERNATIVE_CFG_2(old_c, ...)	\
 	__ALTERNATIVE_CFG(old_c)
 
+#define _ALTERNATIVE_CFG_3(old_c, ...)	\
+	__ALTERNATIVE_CFG(old_c)
+
 #endif /* __ASSEMBLY__ */
 #endif /* CONFIG_RISCV_ALTERNATIVE */
 
@@ -163,4 +193,12 @@
 	_ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,	\
 					new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)
 
+#define ALTERNATIVE_3(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,		\
+				   new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2,		\
+				   new_content_3, vendor_id_3, errata_id_3, CONFIG_k_3)		\
+	_ALTERNATIVE_CFG_3(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,	\
+					new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2,	\
+					new_content_3, vendor_id_3, errata_id_3, CONFIG_k_3)
+
+
 #endif
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
