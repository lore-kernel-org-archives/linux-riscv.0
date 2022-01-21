Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F052FC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jan 2022 16:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xD+9tPP5nvb7gL1s6XtM6sxSbCv72jEMd/CMEQZyFd0=; b=BJa2dJOSYHiIA4
	0mxISC5hlymeDOse0AuzGJnlUWChCMudoxHWLtYunPwSLenpCkxTz6b9jQrPtRY1QdNUbjUb3XFDX
	uk0exPZZhq0RLdhGb5oTSLUb38dMsUhuRi2XoFVXfKaM+lHXGKcWCIMaUPBjCldZaHWlWNOrJU/3W
	2Z0V1euRcDw4uanZuu6sL97A12hWIstjShlGfd3EPUHwawrkMmxFpSjMpFHFQdlyWAIJhvIgHgTvS
	USZRhUu59VtEPIP+O8u8hIDnu6ahQIlTeM2l5oeqSBnAjrqNrObPg8emc1S9CpgWnZn/FUAaQDt4Y
	OmzcEtYNm9TG9To+h74A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAwup-00FZiN-RS; Fri, 21 Jan 2022 16:37:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAwub-00FZYV-BM
 for linux-riscv@bombadil.infradead.org; Fri, 21 Jan 2022 16:37:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=fmRNy2FZCuFnngDbUZPbW6nY1W/hG5t3UmoItKDBiOo=; b=br5kM9MCIboefT3vmO6Daa6dVe
 ZbM6HmSjPea+TD9cWdeUQGPEnZZx6EQwyVeHj8iaSAyAv2yNqWM7z/ETZc8UMrdySfHThzSL+4c/y
 4O9/Tnhs1qycCsBbcC7eJ3rqo2s9+rZ1SgQdTNSM4krAze+ASZ10lpmwwbfa1sJYSIst+6lAcvdDz
 i36LW08Jm8qxIICfGpw9k4o33gejX0z+EWdd4g7noy4f8Wubxbe+44LumZosOBU80ywJkh+GOVDi5
 X07vUr3IGMK/HvOrFd1dwG99zLh2F0gnKGpilvZAvkTigLdEMbAZuKjR1z5DJPvfTJ5V5tCkDdXoV
 zpAxC2cA==;
Received: from gloria.sntech.de ([185.11.138.130])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAwuW-002bxh-H2
 for linux-riscv@lists.infradead.org; Fri, 21 Jan 2022 16:37:16 +0000
Received: from p508fcef5.dip0.t-ipconnect.de ([80.143.206.245]
 helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nAwuK-0008GA-RW; Fri, 21 Jan 2022 17:37:00 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, wefu@redhat.com,
 liush@allwinnertech.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, drew@beagleboard.org, hch@lst.de, arnd@arndb.de,
 wens@csie.org, maxime@cerno.tech, dlustig@nvidia.com,
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com, behrensj@mit.edu,
 xinhaoqu@huawei.com, huffman@cadence.com, mick@ics.forth.gr,
 allen.baum@esperantotech.com, jscheid@ventanamicro.com, rtrauben@gmail.com,
 samuel@sholland.org, cmuellner@linux.com, philipp.tomsich@vrull.eu,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v5 06/14] riscv: extend concatenated alternatives-lines to the
 same length
Date: Fri, 21 Jan 2022 17:36:10 +0100
Message-Id: <20220121163618.351934-7-heiko@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220121163618.351934-1-heiko@sntech.de>
References: <20220121163618.351934-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_163712_669884_87D48D92 
X-CRM114-Status: UNSURE (   9.39  )
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
