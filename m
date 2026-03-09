Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7632BEF370A
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 08:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IizzafM7xaHHyCoLdS39aGH1WNxInTy6zMbq4gkfc5g=; b=rIFU8bqQUkx4Zr
	lSS044fDmwPzfOJypjmXtGvRNNhaNiJ94hdowmOhqKyWInJPAvP9y9h8HrolxG7IL2JmZendLVCxd
	wVAOaybYr3+uyUpK9MY1Tnz103MyGXk0GkVwgzRbCR8ErjjBG9ALEkdtvYctml22BJc0qjnp8csv+
	KwLgTqsQ55sGwqc6ebqMNY+qKlEftP364cDa+e0q/yzsHWjfAAr/BsT4QSdsCBSyJBCAczXCp8B/2
	HcGKHQ0c95/kdNn5Gx7TGupT/jdAO6XKEnO4rkdqi8uXirCsVBNYdpc76pVgxqv8W6FYDm4wWa8sr
	NqunyETSb+ppRax20JdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzViZ-00000006rwt-1OAB;
	Mon, 09 Mar 2026 08:11:59 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzViV-00000006rwO-41pg
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 08:11:58 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4fTqVF3GHcz8Xs7T;
	Mon, 09 Mar 2026 16:11:49 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 6298Bbfg046466;
	Mon, 9 Mar 2026 16:11:37 +0800 (+08)
	(envelope-from liu.xuemei1@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 9 Mar 2026 16:11:40 +0800 (CST)
X-Zmail-TransId: 2afc69ae80bc9de-cfb58
X-Mailer: Zmail v1.0
Message-ID: <20260309161140133ZhM76Wt3uPliHU5_R8O0j@zte.com.cn>
Date: Mon, 9 Mar 2026 16:11:40 +0800 (CST)
Mime-Version: 1.0
From: <liu.xuemei1@zte.com.cn>
To: <anup@brainfault.org>, <tglx@kernel.org>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <liujingqi@lanxincomputing.com>, <cyan.yang@sifive.com>,
        <nick.hu@sifive.com>, <yongxuan.wang@sifive.com>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBpcnFjaGlwL3Jpc2N2LWFwbGljOiBSZWdpc3RlciBzeXNjb3JlIG9wZXJhdGlvbnMgb25seSBvbmNl?=
X-MAIL: mse-fl1.zte.com.cn 6298Bbfg046466
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: liu.xuemei1@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Mon, 09 Mar 2026 16:11:50 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 69AE80C5.000/4fTqVF3GHcz8Xs7T
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_011156_175983_DF17184F 
X-CRM114-Status: UNSURE (   8.71  )
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

From: Jessica Liu <liu.xuemei1@zte.com.cn>

We can have multiple APLIC instances so setup global state
and resgister syscore operations only once.

Fixes: 95a8ddde3660 ("irqchip/riscv-aplic: Preserve APLIC states across suspend/resume")
Signed-off-by: Jessica Liu <liu.xuemei1@zte.com.cn>
---
 drivers/irqchip/irq-riscv-aplic-main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
index 4495ca26abf5..8299e0da6577 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -20,6 +20,7 @@
 #include "irq-riscv-aplic-main.h"

 static LIST_HEAD(aplics);
+static bool aplic_global_setup_done __ro_after_init;

 static void aplic_restore_states(struct aplic_priv *priv)
 {
@@ -375,8 +376,10 @@ static int aplic_probe(struct platform_device *pdev)
 	if (rc)
 		dev_err_probe(dev, rc, "failed to setup APLIC in %s mode\n",
 			      msi_mode ? "MSI" : "direct");
-	else
+	else if (!aplic_global_setup_done) {
 		register_syscore(&aplic_syscore);
+		aplic_global_setup_done = true;
+	}

 #ifdef CONFIG_ACPI
 	if (!acpi_disabled)
-- 
2.27.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
