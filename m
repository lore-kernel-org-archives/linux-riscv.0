Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC4BC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 03:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0MwfCJ8fVfjDyI0ZxwGvj2AgsmdTxz5FbGnh+lOAcow=; b=WBbujaFDE2W+6/
	63a2YLQfP2ymW/lM0q+u2H6Rx0OkEUf+9FoAW0x6kkikaYptAjT8bta5iKi1uf7lr3ggO9H31TXUM
	DHU6+7uc1H8z96WD6sD25T/1o/65Tph2So4TiGMtKe7iIFDO2dUo+JFAm1bbp6SnjGV/NZyPAEp10
	YRs/Qxkp9ytmLcGnAf5UL5K/7Motgv8sPnbLT1dkR+cPa5LUrT6IYTV14VrDPJHdDhFQdn2QwExcS
	hdHzx6q2KdjvF+XrUG3XqyfrE/dLH3qHYklGKyiNiRwR4jXmLXgFEpNzIM/DcVlwyFd/+S0l9/9Zw
	PbA3meLrC4IAlBsVcCgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neTIJ-00GU0z-5g; Wed, 13 Apr 2022 03:03:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neTI5-00GTqE-3C
 for linux-riscv@bombadil.infradead.org; Wed, 13 Apr 2022 03:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=OJXAEJfNu5QyPWGPIvqek9SteMi6/OmHJroXibubk4Q=; b=jjSQ9wgs0X1asr62jGMRPUh1+N
 gRi4Os8anBol02oHpBY0vGJItH2OWopgbpnaadeCqTwsufAlFaurbJHHRdwFGrJRv7bQ7ustWmtC9
 ojdwxXkvndeL8QR+OFjwTwgLkjEJwPBm1UUIk/UjlRNSA+Ye7GThCfFTtkGG5T//qLVI8+98LZlQf
 JXJZQTczHriA8Vzypd4hzMZARIZBN3MDfBdV0rtdudHi7G2SmFopFR9vYyRgu8vbvU8V4vZENhxxn
 M9CfmxuiDpwn6/3OwafBrKQ6cbVIy6Ama9+VLfouHTjict7jRTDXCfhG+JKOFEi8b5MYAxD+9pCAL
 hbyZ1HFQ==;
Received: from gloria.sntech.de ([185.11.138.130])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neTHz-004WXe-L8
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 03:03:31 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1neTHp-0006sN-9D; Wed, 13 Apr 2022 05:03:17 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, liush@allwinnertech.com, guoren@kernel.org,
 atishp@atishpatra.org, anup@brainfault.org, drew@beagleboard.org,
 hch@lst.de, arnd@arndb.de, wens@csie.org, maxime@cerno.tech,
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com, behrensj@mit.edu,
 xinhaoqu@huawei.com, mick@ics.forth.gr, allen.baum@esperantotech.com,
 jscheid@ventanamicro.com, rtrauben@gmail.com, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v9 04/12] riscv: implement ALTERNATIVE_2 macro
Date: Wed, 13 Apr 2022 05:02:59 +0200
Message-Id: <20220413030307.133807-5-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220413030307.133807-1-heiko@sntech.de>
References: <20220413030307.133807-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_040328_383030_421E5B4C 
X-CRM114-Status: GOOD (  11.38  )
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
 arch/riscv/include/asm/alternative-macros.h | 78 +++++++++++++++------
 1 file changed, 58 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 5dd8d03a13da..9e04cd53afc8 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -39,6 +39,24 @@
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
+#define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,	\
+					CONFIG_k_1,			\
+				  new_c_2, vendor_id_2, errata_id_2,	\
+					CONFIG_k_2)			\
+	__ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1,	\
+					IS_ENABLED(CONFIG_k_1),		\
+				   new_c_2, vendor_id_2, errata_id_2,	\
+					IS_ENABLED(CONFIG_k_2)
+
 #else /* !__ASSEMBLY__ */
 
 #include <asm/asm.h>
@@ -74,6 +92,25 @@
 #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k)	\
 	__ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
 
+#define __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,	\
+					enable_1,			\
+				   new_c_2, vendor_id_2, errata_id_2,	\
+					enable_2)			\
+	"886 :\n"							\
+	old_c "\n"							\
+	"887 :\n"							\
+	ALT_NEW_CONTENT(vendor_id_1, errata_id_1, enable_1, new_c_1)	\
+	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)
+
+#define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,	\
+					CONFIG_k_1,			\
+				  new_c_2, vendor_id_2, errata_id_2,	\
+					CONFIG_k_2)			\
+	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,	\
+					IS_ENABLED(CONFIG_k_1),		\
+				   new_c_2, vendor_id_2, errata_id_2,	\
+					IS_ENABLED(CONFIG_k_2))
+
 #endif /* __ASSEMBLY__ */
 
 #else /* CONFIG_RISCV_ALTERNATIVE */
@@ -86,6 +123,12 @@
 #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
 	__ALTERNATIVE_CFG old_c
 
+#define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,	\
+					CONFIG_k_1,			\
+				  new_c_2, vendor_id_2, errata_id_2,	\
+					CONFIG_k_2)			\
+       __ALTERNATIVE_CFG old_c
+
 #else /* !__ASSEMBLY__ */
 
 #define __ALTERNATIVE_CFG(old_c)  \
@@ -94,6 +137,12 @@
 #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
 	__ALTERNATIVE_CFG(old_c)
 
+#define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,	\
+					CONFIG_k_1,			\
+				  new_c_2, vendor_id_2, errata_id_2,	\
+					CONFIG_k_2) \
+       __ALTERNATIVE_CFG(old_c)
+
 #endif /* __ASSEMBLY__ */
 #endif /* CONFIG_RISCV_ALTERNATIVE */
 
@@ -119,25 +168,14 @@
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
+#define ALTERNATIVE_2(old_content, new_content_1, vendor_id_1,		\
+					errata_id_1, CONFIG_k_1,	\
+				   new_content_2, vendor_id_2,		\
+					errata_id_2, CONFIG_k_2)	\
+	_ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1,	\
+					    errata_id_1, CONFIG_k_1,	\
+					new_content_2, vendor_id_2,	\
+					    errata_id_2, CONFIG_k_2)
+
 #endif
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
