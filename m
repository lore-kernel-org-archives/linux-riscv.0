Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05944D41C03
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 06:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q5KOYOF+m73iLp7Qz3dufDiX42A9hk+cg2eF1B0Rmt0=; b=o0HvLprJitqlsG
	0r+F2RlGis6L2n6C1+ETcnQ+LKaWsdqoqsqw0Lgodx0XRR/L+jwKHFE3GKjpUwxCH0aaggMsG9hkB
	kfvJYge/MxUL4J1TeydjctUWB0kRLZ70TrP63Z+agxP9Qe7eWyPJsOGnbICIvwpnZKu02H14jC90c
	rdIbf2QIv5h4BzMeTLE5k+AE0M+P4GdCkUhAsrdbYS1GkkM3psaKaVDKzl3+CRJ5jKnnnqUdT6tOR
	UnFcVIJ12gg4N0hxif4XRatYASxZKUb4e0ESQyWCG0dGWE01u5Q6PTlZwDaa5V4XXFF4U3kAOOapU
	KrQvVEs1yMEOQbrE0Blw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB6Zm-00000005rWs-21L4;
	Wed, 13 Nov 2024 06:10:02 +0000
Received: from cmccmta8.chinamobile.com ([111.22.67.151] helo=cmccmta2.chinamobile.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB6Zi-00000005rVl-3k9h
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 06:10:01 +0000
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee6673442a9277-e4b47;
	Wed, 13 Nov 2024 14:09:53 +0800 (CST)
X-RM-TRANSID: 2ee6673442a9277-e4b47
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee6673442b0a41-8554f;
	Wed, 13 Nov 2024 14:09:52 +0800 (CST)
X-RM-TRANSID: 2ee6673442b0a41-8554f
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: dlemoal@kernel.org
Cc: linus.walleij@linaro.org,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: [PATCH v2] pinctrl: k210: Undef K210_PC_DEFAULT
Date: Wed, 13 Nov 2024 14:09:50 +0800
Message-Id: <20241113060950.5247-1-zhangjiao2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_220959_498058_25A690B4 
X-CRM114-Status: UNSURE (   7.47  )
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

From: zhang jiao <zhangjiao2@cmss.chinamobile.com>

When the temporary macro K210_PC_DEFAULT is no need anymore,
better use its name in the #undef statement instead of
the incorrect "DEFAULT" name.

Fixes: d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
---
v1->v2:
	Modify commit info and add a Fixes tag.

 drivers/pinctrl/pinctrl-k210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
index caf20215aaba..eddb01796a83 100644
--- a/drivers/pinctrl/pinctrl-k210.c
+++ b/drivers/pinctrl/pinctrl-k210.c
@@ -181,7 +181,7 @@ static const u32 k210_pinconf_mode_id_to_mode[] = {
 	[K210_PC_DEFAULT_INT13] = K210_PC_MODE_IN | K210_PC_PU,
 };
 
-#undef DEFAULT
+#undef K210_PC_DEFAULT
 
 /*
  * Pin functions configuration information.
-- 
2.33.0




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
