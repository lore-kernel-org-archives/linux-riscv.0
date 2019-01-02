Return-Path: <SRS0=67bH=PK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD03C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  2 Jan 2019 13:10:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3E2421871
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  2 Jan 2019 13:10:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OltYpzFB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G71i2UbO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3E2421871
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=cV6WXaI7gg/ZLIoT+Ui43KxmO5t4DN9UF8GGtnlBKI0=; b=Olt
	YpzFBDKrWMedy/cSbCIK/6LioBWJi25V83qThR5jFkPcnW8p/sOc4CWX1XtYQJEBWcaY/EGVOyABH
	XC6VpbJ57IeDfETz1PnmIKCwDiO+7URM9ma32LooBAtevV8a2WHZDlQz1BOMmnjTXiLHIuMFr9kAp
	WN+M1jI5/dIzrnu77VaUeaH2T+kE5A7+viKdoSW+KfWqbHctHklc3tY08+3ZIBZphU7+zaqrd3gft
	WmmrQR/EN36FwAVw4x2K9iSd8lKorppdUNeRuKik30uKJ2Y7Vd5FsXqhaSq6sCMbYVu64FeIa0qgu
	DSY/B5GQsdrkuMH9c172Q0gR7RF2YoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gegI5-0000Wm-6E; Wed, 02 Jan 2019 13:10:33 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gegI2-0000WB-IP
 for linux-riscv@lists.infradead.org; Wed, 02 Jan 2019 13:10:31 +0000
Received: by mail-pf1-x441.google.com with SMTP id r136so15173036pfc.6
 for <linux-riscv@lists.infradead.org>; Wed, 02 Jan 2019 05:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=g+ANRRZX7Y4eRp1vlkLKb22/iS956RvuMtC8HBXMJLE=;
 b=G71i2UbOlYubBn7A7UpHUCjiVx95wzIR9mk/sXKRT2sNyt6f9s7gpFosdZ1rQz582j
 ToCawtIyvI/N931zJ6GBakq5mPlXqHMaVq1oCBfqGgR5rH4klbVzP2Z0bXyu29ASadym
 byJ3RgwI3/sB3QH8Z6YChL0wXFXA/870HJAS/SwfhvNgH8RCN8LOydCoLVT79OKaWSyY
 wXv1d0T2DdvVp0MC/4UooqVWTT9JmlU/A4hzKe+v2PAFi+0QbE8B91nT/7Qo3myvEnxR
 63ac6CgbjWqVjVorTiFiI2DB7+nJugpHMSozMFs/gxVlDqU7kf2u7E7AsdDFkgsbDEeO
 aokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=g+ANRRZX7Y4eRp1vlkLKb22/iS956RvuMtC8HBXMJLE=;
 b=gl6rGoPX6APuqROFy7Lme5wWH0kwyrWVny+uenI1Hfsf3ryCN1mgZ7givXrYf3Xo+o
 RYfmUM3GOWzt5hG+ElUjWfg4jSbGW2TMiDdMX6yqAqBce/B4X16hIUfbwb/YpySyH5Dy
 r59bSmyx3g/pZNKHU1pRBCo+5+gc8v4GKzVUHwPlnxyMUijgTLPStOfbH2oUS9RnDsk2
 kTgXRRIrXp0s+tk9AlaQ2+IlsXyPkd+0LNiF+nmmVwXl8WBgAUHdW9Li69clOutHVEna
 PD6oz++xDOZFIc5BRtpQXWZw6EXugzpcLQIoKn9YU2lkF1CdkOO2BRUGE6l5Sg8VQuPK
 0GiQ==
X-Gm-Message-State: AA+aEWZohtMVFIJGbJiI0BwsMQH3dMbD4Kv0kuT+aoinYMbouCJqGlI9
 rvko1NwksboTHEsFYZmZ2cTbN5PP
X-Google-Smtp-Source: AFSGD/WHZaoEB/9H3LH9PrRDCSJcqzexIMd8nHUejRsY8zwmMUMWQPf86/oMGyXEHrsmxB+b4hitzQ==
X-Received: by 2002:a62:61c3:: with SMTP id v186mr44753868pfb.55.1546434627921; 
 Wed, 02 Jan 2019 05:10:27 -0800 (PST)
Received: from lp-satishg.eximiusdesign.in ([182.74.207.250])
 by smtp.gmail.com with ESMTPSA id i4sm89119649pfj.82.2019.01.02.05.10.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 02 Jan 2019 05:10:27 -0800 (PST)
From: G SatishKumar <gsatish.ldd@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] RISCV:Kernel: Cleanup RISCV Kernel header files
Date: Wed,  2 Jan 2019 18:40:08 +0530
Message-Id: <1546434608-11183-1-git-send-email-gsatish.ldd@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190102_051030_640835_19F56226 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: G SatishKumar <gsatish.ldd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

	This patch cleanup unnecessary haeder files
	from RISCV kernel files

Signed-off-by: G SatishKumar <gsatish.ldd@gmail.com>
---
 arch/riscv/kernel/cacheinfo.c | 1 -
 arch/riscv/kernel/cpu.c       | 1 -
 arch/riscv/kernel/irq.c       | 2 --
 3 files changed, 4 deletions(-)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index cb35ffd..0e710fc 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -13,7 +13,6 @@
 
 #include <linux/cacheinfo.h>
 #include <linux/cpu.h>
-#include <linux/of.h>
 #include <linux/of_device.h>
 
 static void ci_leaf_init(struct cacheinfo *this_leaf,
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index b4a7d44..f3f4690 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -13,7 +13,6 @@
 
 #include <linux/init.h>
 #include <linux/seq_file.h>
-#include <linux/of.h>
 #include <asm/smp.h>
 
 /*
diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index 48e6b7d..1d76b60 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -7,9 +7,7 @@
 
 #include <linux/interrupt.h>
 #include <linux/irqchip.h>
-#include <linux/irqdomain.h>
 #include <linux/seq_file.h>
-#include <asm/smp.h>
 
 /*
  * Possible interrupt causes:
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
