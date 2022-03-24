Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D39C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Mar 2022 02:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5yts5FXJsNnzXIIgAylf/skZG9l7eRBSWITfC57QuCs=; b=GTNPEGNFblk+n8
	nMhjWlcJL906QM9C5ATV9KtCz2qwntf+OnHdmFxuLwXg8YM+pguPhqD9p/JwOmk3QVcLZLL3PqDT5
	p6xGhpFY17xs+ayWW+QaRFIfzWwbhC08nA5nkeBaODYdSjQYBaqIolwpt0Q71zXYBMbQoZFPowPKA
	lsyNdF8QF6Usce5+pSZtdqlbd1D0e2+VzpIlctg2QIUbR1vECCT81pXoyxidW/XiyERGANToggI9F
	nc4I+dD0XEDR1pvidCyH6ai6mFCXBl8Xh1+42sCACf7QgGpu27FkwDfGgehd1VOW1iyXFPFdwDMkR
	XdQW5SF0IyDQTpPclDng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXCvn-00FPEG-G8; Thu, 24 Mar 2022 02:10:31 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXCvi-00FP37-2M
 for linux-riscv@lists.infradead.org; Thu, 24 Mar 2022 02:10:28 +0000
X-QQ-mid: bizesmtp69t1648087793tem9om0e
Received: from localhost.localdomain ( [14.154.29.68])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 24 Mar 2022 10:09:47 +0800 (CST)
X-QQ-SSF: 01100000000000Z0Z000000A0000000
X-QQ-FEAT: FXvDfBZI5O7DQYVnCSxfxVkH5JHUv6JfVW0hU3Mkt4qquhubmBRWPO1nirMx9
 mhLh6/G2aSYe8XMAE4e2CrJ6DIvweG0yQonWX8Nl7vsro0H4NW4V/KKUt7nU+gCfiP5UqCj
 fmV02kf6gL2GS6Z1garaiXCqzvBvyYtdTyvbc9WskDdUHsizjZDOiw3Bo6G56TuU8zOMv+m
 7HimLKHdI0dSq0Zi51Qle5GrBIjKlTuQ+ZOiMrxqptZVjpF6wv7ZBwYs+Uj92Ny36q9pMJe
 a/2o13YVagPVvAyTe1UTCDYJvs2j1Dfc1Lt6jR6DwwEULvP0HDxugOqyS2uEwmuReTG/dhZ
 35d+mw62afa1IsJ0Cw=
X-QQ-GoodBg: 0
From: Wu Caize <zepan@sipeed.com>
To: palmer@dabbelt.com
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 Wu Caize <zepan@sipeed.com>
Subject: [PATCH v2] kernel module: fix apply_r_riscv_rcv_branch_rela typo
Date: Thu, 24 Mar 2022 10:09:21 +0800
Message-Id: <20220324020920.651419-1-zepan@sipeed.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:sipeed.com:qybgforeign:qybgforeign3
X-QQ-Bgrelay: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_191026_546481_D384AB4B 
X-CRM114-Status: UNSURE (   7.75  )
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

This patch fix typo: apply_r_riscv_rcv_branch_rela -> apply_r_riscv_rvc_branch_rela

Signed-off-by: Wu Caize <zepan@sipeed.com>
---
 arch/riscv/kernel/module.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 68a9e3d1fe16..b92e93f2aac3 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -56,7 +56,7 @@ static int apply_r_riscv_jal_rela(struct module *me, u32 *location,
 	return 0;
 }
 
-static int apply_r_riscv_rcv_branch_rela(struct module *me, u32 *location,
+static int apply_r_riscv_rvc_branch_rela(struct module *me, u32 *location,
 					 Elf_Addr v)
 {
 	ptrdiff_t offset = (void *)v - (void *)location;
@@ -290,7 +290,7 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
 	[R_RISCV_64]			= apply_r_riscv_64_rela,
 	[R_RISCV_BRANCH]		= apply_r_riscv_branch_rela,
 	[R_RISCV_JAL]			= apply_r_riscv_jal_rela,
-	[R_RISCV_RVC_BRANCH]		= apply_r_riscv_rcv_branch_rela,
+	[R_RISCV_RVC_BRANCH]		= apply_r_riscv_rvc_branch_rela,
 	[R_RISCV_RVC_JUMP]		= apply_r_riscv_rvc_jump_rela,
 	[R_RISCV_PCREL_HI20]		= apply_r_riscv_pcrel_hi20_rela,
 	[R_RISCV_PCREL_LO12_I]		= apply_r_riscv_pcrel_lo12_i_rela,
-- 
2.25.1




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
