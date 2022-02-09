Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31650C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 12:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1GCuLx6bm9YQwrXU3Z7buXojj2IjXxqA4o3frDCyDgw=; b=WEIYkAwKfg+WXd
	G8lUo/y6sidOBDtHM5XXXbWcy9tQC9hdNsSkIIBfBLa2kuCgiNYq/1LpgNWdDU0DtzCPFNtPeKXhh
	ODlXMpCLJAABMLblHAcTvWtXRJR9YvDx2FLO8I8xkjrPdYjiCJ6Q7468UvSCwHVgfIl4X8nSDVjyN
	gmIk9XSIRC+ITpoLe4stmEbgZ5S+DmU6zZMlolgFfEs/W+wEi9h220+kUbtnglwYud+I+dKAckE1z
	T9EHjsoprDzOVXZ5aI2JjGKzRI572Udp68I27nWd1leX78ovmAC7FFj0FPT3XfP3qZBqAGuyRpz5r
	jEkmYATBjlOt65zfGl+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHmEv-0002AT-Uk; Wed, 09 Feb 2022 12:38:29 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHmEt-00027r-0n
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 12:38:28 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nHmEn-0001Mv-9Y; Wed, 09 Feb 2022 13:38:21 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, wefu@redhat.com,
 liush@allwinnertech.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, drew@beagleboard.org, hch@lst.de, arnd@arndb.de,
 wens@csie.org, maxime@cerno.tech, gfavor@ventanamicro.com,
 andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com,
 huffman@cadence.com, mick@ics.forth.gr, allen.baum@esperantotech.com,
 jscheid@ventanamicro.com, rtrauben@gmail.com, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v6 05/14] riscv: implement ALTERNATIVE_2 macro
Date: Wed,  9 Feb 2022 13:37:51 +0100
Message-Id: <20220209123800.269774-6-heiko@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209123800.269774-1-heiko@sntech.de>
References: <20220209123800.269774-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_043827_120615_6C18B7C3 
X-CRM114-Status: GOOD (  11.36  )
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

When the alternatives were added the commit already provided a template
on how to implement 2 different alternatives for one piece of code.

Make this usable.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/include/asm/alternative-macros.h | 52 +++++++++++++--------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 92da6b3920a3..baf649293288 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -37,6 +37,20 @@
 #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
 	__ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k)
 
+.macro __ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
+				  new_c_2, vendor_id_2, errata_id_2, enable_2
+886 :
+	\old_c
+887 :
+	ALT_NEW_CONTENT \vendor_id_1, \errata_id_1, \enable_1, \new_c_1
+	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
+.endm
+
+#define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, CONFIG_k_1, \
+				  new_c_2, vendor_id_2, errata_id_2, CONFIG_k_2) \
+	__ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1), \
+				   new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2)
+
 #else /* !__ASSEMBLY__ */
 
 #include <asm/asm.h>
@@ -72,6 +86,19 @@
 #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k)	\
 	__ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
 
+#define __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
+				  new_c_2, vendor_id_2, errata_id_2, enable_2) \
+	"886 :\n"	\
+	old_c "\n"	\
+	"887 :\n"	\
+	ALT_NEW_CONTENT(vendor_id_1, errata_id_1, enable_1, new_c_1) \
+	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)
+
+#define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, CONFIG_k_1,		\
+				  new_c_2, vendor_id_2, errata_id_2, CONFIG_k_2)		\
+	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1),	\
+				   new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2))
+
 #endif /* __ASSEMBLY__ */
 
 /*
@@ -96,25 +123,10 @@
  * this case, this vendor can create a new macro ALTERNATIVE_2() based
  * on the following sample code and then replace ALTERNATIVE() with
  * ALTERNATIVE_2() to append its customized content.
- *
- * .macro __ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
- *                                   new_c_2, vendor_id_2, errata_id_2, enable_2
- * 886 :
- *      \old_c
- * 887 :
- *      ALT_NEW_CONTENT \vendor_id_1, \errata_id_1, \enable_1, \new_c_1
- *      ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
- * .endm
- *
- * #define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, CONFIG_k_1, \
- *                                   new_c_2, vendor_id_2, errata_id_2, CONFIG_k_2) \
- *        __ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1), \
- *                                   new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2) \
- *
- * #define ALTERNATIVE_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1, \
- *                                    new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2) \
- *         _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1, \
- *                                         new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)
- *
  */
+#define ALTERNATIVE_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1, \
+				   new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2) \
+	_ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1, \
+					new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)
+
 #endif
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
