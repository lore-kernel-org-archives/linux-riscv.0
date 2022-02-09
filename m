Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FCBC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 12:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xD+9tPP5nvb7gL1s6XtM6sxSbCv72jEMd/CMEQZyFd0=; b=2UIpMXHIGnWXt4
	pZpvzaFkggQIdo2dKLJhAyrr2TEQ6/E+a51lDovmCvk9yx9AWb31rvXHVTMW1oLn620Nv24gyDGU1
	7QNwV+zePwQTEbcZKbn1Ig7XDnvwSkgCx0HY6HKVkE06Uxljwrz6gpRZZn64/YYwjggY5f8UGFnnv
	fpZ9c5xPBmbLwzomKdLyPq6leq6xoCYSTq66qN5K08WSxX58f0RGQVnzUUoxlPm2159Fq3L8Ij4+g
	n+2zekQ2WJWInLSCR83JOf/wJKC1ySKOrVUtDUVMByvRfpzuv9HAMRWgi38kWabpJ0hMPxIOAuU5o
	MTSW8pwhTS++PVfuqwGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHmF9-0002HY-Vv; Wed, 09 Feb 2022 12:38:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHmEt-000280-E0
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 12:38:32 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nHmEo-0001Mv-88; Wed, 09 Feb 2022 13:38:22 +0100
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
Subject: [PATCH v6 06/14] riscv: extend concatenated alternatives-lines to the
 same length
Date: Wed,  9 Feb 2022 13:37:52 +0100
Message-Id: <20220209123800.269774-7-heiko@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209123800.269774-1-heiko@sntech.de>
References: <20220209123800.269774-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_043827_497138_9B4E817D 
X-CRM114-Status: UNSURE (   9.62  )
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

ALT_NEW_CONTENT already uses same-length assembler lines, so
extend this to the other elements as well.

This makes it more readable when these elements need to be extended
in the future.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/include/asm/alternative-macros.h | 30 ++++++++++-----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index baf649293288..c0fb11fad631 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -56,14 +56,14 @@
 #include <asm/asm.h>
 #include <linux/stringify.h>
 
-#define ALT_ENTRY(oldptr, newptr, vendor_id, errata_id, newlen) \
-	RISCV_PTR " " oldptr "\n" \
-	RISCV_PTR " " newptr "\n" \
-	REG_ASM " " vendor_id "\n" \
-	REG_ASM " " newlen "\n" \
+#define ALT_ENTRY(oldptr, newptr, vendor_id, errata_id, newlen)		\
+	RISCV_PTR " " oldptr "\n"					\
+	RISCV_PTR " " newptr "\n"					\
+	REG_ASM " " vendor_id "\n"					\
+	REG_ASM " " newlen "\n"						\
 	".word " errata_id "\n"
 
-#define ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c) \
+#define ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)		\
 	".if " __stringify(enable) " == 1\n"				\
 	".pushsection .alternative, \"a\"\n"				\
 	ALT_ENTRY("886b", "888f", __stringify(vendor_id), __stringify(errata_id), "889f - 888f") \
@@ -77,21 +77,21 @@
 	".org	. - (889b - 888b) + (887b - 886b)\n"			\
 	".endif\n"
 
-#define __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, enable) \
-	"886 :\n"	\
-	old_c "\n"	\
-	"887 :\n"	\
+#define __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, enable)	\
+	"886 :\n"							\
+	old_c "\n"							\
+	"887 :\n"							\
 	ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
 
-#define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k)	\
+#define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
 	__ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
 
 #define __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
 				  new_c_2, vendor_id_2, errata_id_2, enable_2) \
-	"886 :\n"	\
-	old_c "\n"	\
-	"887 :\n"	\
-	ALT_NEW_CONTENT(vendor_id_1, errata_id_1, enable_1, new_c_1) \
+	"886 :\n"							\
+	old_c "\n"							\
+	"887 :\n"							\
+	ALT_NEW_CONTENT(vendor_id_1, errata_id_1, enable_1, new_c_1)	\
 	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)
 
 #define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, CONFIG_k_1,		\
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
