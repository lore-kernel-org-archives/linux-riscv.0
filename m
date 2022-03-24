Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71931C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Mar 2022 00:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0RC/OgFQ4j6rmnmoxQmR0X0vVySW4/Dqd9qMcyi5Yk=; b=hKSHPATMOoXSaz
	04K8ssfXRQSJQP6Gjz5pdrtzduV6GNomVo31mYQRani7slhvvkgkQuNDlWwl5ygJ3jrGkY7NxlyNd
	maPNIgJvq0+lmSPrnv9echPiIsCfUG4dnPqmtFG60+2+LeCPql7tZaceZw+rBLVpOAPGyek2Ik7qx
	tSXGu9vGec5s//lQoRJw14tt9u81yor4lLdc0WcAAek04w/JBsdVphkJBOsPsFIpF9oM6osYelBf7
	rxjCnVgWGHarrm4R8PER23OqaNMdQBkoF1XjLHZRbj1Mykrek4xxkS94gGteWKRMw+a1v86oM6n0t
	PGd7reR1x7f4lvxUT1lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXB0z-00F9fL-Dg; Thu, 24 Mar 2022 00:07:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXB0s-00F9bS-EV
 for linux-riscv@lists.infradead.org; Thu, 24 Mar 2022 00:07:41 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nXB0p-00055s-EF; Thu, 24 Mar 2022 01:07:35 +0100
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
Subject: [PATCH v8 07/14] riscv: prevent compressed instructions in
 alternatives
Date: Thu, 24 Mar 2022 01:07:03 +0100
Message-Id: <20220324000710.575331-8-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220324000710.575331-1-heiko@sntech.de>
References: <20220324000710.575331-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_170738_617399_6A66AC79 
X-CRM114-Status: UNSURE (   9.90  )
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
 arch/riscv/include/asm/alternative-macros.h | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 25b4559d743b..3c12396e247c 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -21,7 +21,11 @@
 	.popsection
 	.subsection 1
 888 :
+	.option push
+	.option norvc
+	.option norelax
 	\new_c
+	.option pop
 889 :
 	.previous
 	.org    . - (889b - 888b) + (887b - 886b)
@@ -31,7 +35,11 @@
 
 .macro __ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, enable
 886 :
+	.option push
+	.option norvc
+	.option norelax
 	\old_c
+	.option pop
 887 :
 	ALT_NEW_CONTENT \vendor_id, \errata_id, \enable, \new_c
 .endm
@@ -42,7 +50,11 @@
 .macro __ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
 				  new_c_2, vendor_id_2, errata_id_2, enable_2
 886 :
+	.option push
+	.option norvc
+	.option norelax
 	\old_c
+	.option pop
 887 :
 	ALT_NEW_CONTENT \vendor_id_1, \errata_id_1, \enable_1, \new_c_1
 	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
@@ -72,7 +84,11 @@
 	".popsection\n"							\
 	".subsection 1\n"						\
 	"888 :\n"							\
+	".option push\n"						\
+	".option norvc\n"						\
+	".option norelax\n"						\
 	new_c "\n"							\
+	".option pop\n"							\
 	"889 :\n"							\
 	".previous\n"							\
 	".org	. - (887b - 886b) + (889b - 888b)\n"			\
@@ -81,7 +97,11 @@
 
 #define __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, enable)	\
 	"886 :\n"							\
+	".option push\n"						\
+	".option norvc\n"						\
+	".option norelax\n"						\
 	old_c "\n"							\
+	".option pop\n"							\
 	"887 :\n"							\
 	ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
 
@@ -91,7 +111,11 @@
 #define __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
 				  new_c_2, vendor_id_2, errata_id_2, enable_2) \
 	"886 :\n"							\
+	".option push\n"						\
+	".option norvc\n"						\
+	".option norelax\n"						\
 	old_c "\n"							\
+	".option pop\n"							\
 	"887 :\n"							\
 	ALT_NEW_CONTENT(vendor_id_1, errata_id_1, enable_1, new_c_1)	\
 	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
