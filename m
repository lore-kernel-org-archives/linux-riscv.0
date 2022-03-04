Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89999C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 07:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9pAYnk+Fqw6P7NbXlWl/tTumTfYMBiMox7t9ISaq2NY=; b=kiZa/547JZEOh0
	C/MtmpLvVMdtXyA6dz2pTrTZ03TQwfReHBlvPS2vZHBn+XvK5muy+A1YJGdZNIcBrpXgKVkoR8OYk
	AXsEywbIefgSOajsuXJZVt9XbgIINOn2B0X7uR63tpft9REO3+Ocz+Q08bxQZUwWWtabmb5gj+Hpv
	BSeKKSDiODutnoFIYsopkXO9MBo8Efnea2FKWvO8wRL8iOktRfYlLlLUxIZxom9ESSa+QZRLvEcG1
	ieUXiSXjewclai8MQESzJMImGyiVmHRc7h6267eqj76EBKPChSXDPiWaKGm5wAAy9Re2/FtUymjw7
	WAnuL7bokWeTiKWZPGOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ2WL-008oFR-9s; Fri, 04 Mar 2022 07:38:37 +0000
Received: from smtpbg501.qq.com ([203.205.250.101])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ2WD-008o2H-OB
 for linux-riscv@lists.infradead.org; Fri, 04 Mar 2022 07:38:35 +0000
X-QQ-mid: bizesmtp88t1646379480thce95hs
Received: from localhost.localdomain ( [113.89.247.79])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 04 Mar 2022 15:37:55 +0800 (CST)
X-QQ-SSF: 01100000002000Z0Z000B00A0000000
X-QQ-FEAT: o1V3RKE2+JA/6mQ65kb1/r5r/rAihR6c+aQM9M3jcTRPQ53MIKmu4ebIi1jed
 cqrqQouLUT01GUzzbsl7XpPASifUYJ2RiMQKpv/h8NqJeh2YzMUaLzH87M2w1yBOf6Hdy6o
 ai0YvPe832aOs2xztcoigC+S//wDNXkik0EwPsqXB0IxUwaZnmBRDn/bdCvG/GjsLDVSe70
 JGpGrFj53/2fetH7nWSZGFMh8sn7ij+4VyjncQJIwBVbSky8WWSw+hK6akutoqMmNVOV0se
 RmZQCijMONRhzrgIPSp9tdnITpeQRi+U44lX+MzxR0vTa+rOreHK5iMEtTZdElKX6PUQ==
X-QQ-GoodBg: 0
From: zepan <zepan@sipeed.com>
To: palmer@dabbelt.com
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 Wu Caize <zepan@sipeed.com>
Subject: [PATCH] kernel module: fix apply_r_riscv_rcv_branch_rela typo
Date: Fri,  4 Mar 2022 15:37:31 +0800
Message-Id: <20220304073730.48759-1-zepan@sipeed.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:sipeed.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_233830_139994_280FCB5B 
X-CRM114-Status: UNSURE (   8.13  )
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

From: Wu Caize <zepan@sipeed.com>

This patch fix typo: apply_r_riscv_rcv_branch_rela -> apply_r_riscv_rvc_branch_rela

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
