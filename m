Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9398C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 12:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=njhy3Eco9XEsTIbe0TXRe71huvWVEMc6qxlIVYjmmiM=; b=xwusHpoJwMP34o
	VDGNDVdCRxrNJ90rokzrVoLGITqQRes8lzfMH811uA5IbgEjKbtWiUcrKZNbCsebwTgq9ZxwnNeWP
	6Zz1LRExFaXteSR9NmsDVbSH8redsHAUKpCyp7xF9dUPbcQ4iienE6sQdrH34yzXdPGFTe0UfWeTG
	4eAk5ZFnYFWiYA33Tw9KY6YSemy7XRslwrJmQKWBCsxWkstO5uUQ5nP5mDU22u2B0KWHgZ22XIirE
	dcIkB/7RVsOTgdfyqgIVwstwUernq8D5BVw6CXyFoiCUrisELbJRrJplcEyRcHApc3s2ghR10g5xJ
	wd40Tt00k6YoEPsHohLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHmFC-0002JL-AX; Wed, 09 Feb 2022 12:38:46 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHmEu-00029Z-VP
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 12:38:32 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nHmEp-0001Mv-6i; Wed, 09 Feb 2022 13:38:23 +0100
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
Subject: [PATCH v6 07/14] riscv: prevent compressed instructions in
 alternatives
Date: Wed,  9 Feb 2022 13:37:53 +0100
Message-Id: <20220209123800.269774-8-heiko@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209123800.269774-1-heiko@sntech.de>
References: <20220209123800.269774-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_043829_054790_A6C84532 
X-CRM114-Status: GOOD (  10.24  )
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

Instructions are opportunistically compressed by the RISC-V assembler
when possible, but in alternatives-blocks both the old and new content
need to be the same size, so having the toolchain do somewhat random
optimizations will cause strange side-effects like
"attempt to move .org backwards" compile-time errors.

Already a simple "and" used in alternatives assembly will cause these
mismatched code sizes.

So prevent compressed instructions to be generated in alternatives-
code and use option-push and -pop to only limit this to the relevant
code blocks

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/include/asm/alternative-macros.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index c0fb11fad631..3a52884bf23d 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -19,7 +19,10 @@
 	.popsection
 	.subsection 1
 888 :
+	.option push
+	.option norvc
 	\new_c
+	.option pop
 889 :
 	.previous
 	.org    . - (889b - 888b) + (887b - 886b)
@@ -29,7 +32,10 @@
 
 .macro __ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, enable
 886 :
+	.option push
+	.option norvc
 	\old_c
+	.option pop
 887 :
 	ALT_NEW_CONTENT \vendor_id, \errata_id, \enable, \new_c
 .endm
@@ -40,7 +46,10 @@
 .macro __ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
 				  new_c_2, vendor_id_2, errata_id_2, enable_2
 886 :
+	.option push
+	.option norvc
 	\old_c
+	.option pop
 887 :
 	ALT_NEW_CONTENT \vendor_id_1, \errata_id_1, \enable_1, \new_c_1
 	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
@@ -70,7 +79,10 @@
 	".popsection\n"							\
 	".subsection 1\n"						\
 	"888 :\n"							\
+	".option push\n"						\
+	".option norvc\n"						\
 	new_c "\n"							\
+	".option pop\n"							\
 	"889 :\n"							\
 	".previous\n"							\
 	".org	. - (887b - 886b) + (889b - 888b)\n"			\
@@ -79,7 +91,10 @@
 
 #define __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, enable)	\
 	"886 :\n"							\
+	".option push\n"						\
+	".option norvc\n"						\
 	old_c "\n"							\
+	".option pop\n"							\
 	"887 :\n"							\
 	ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
 
@@ -89,7 +104,10 @@
 #define __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
 				  new_c_2, vendor_id_2, errata_id_2, enable_2) \
 	"886 :\n"							\
+	".option push\n"						\
+	".option norvc\n"						\
 	old_c "\n"							\
+	".option pop\n"							\
 	"887 :\n"							\
 	ALT_NEW_CONTENT(vendor_id_1, errata_id_1, enable_1, new_c_1)	\
 	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
