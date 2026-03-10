Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C4F10775E6
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 16:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zck0GqNY+334tX4iYd1QKoEa6U/6saKrj4DuQ+WCCd8=; b=0Ti+Sj23iR+Lh0
	RvpfeZapEM7hQtHVaw3jrZEZLWEAOXB+SmbD2Ft0LqFfI0XLb+XN42YgMY/03yjj76vSH29ddI3Nj
	SXgznZmryHcXHzQz1/kNXKX2QHhdMHPJLx3CRf/mlW5yLaas2BhZfVIDFLQQGZDBpaikLvLvSAbNO
	rRPtmW2wQVB82dqNYadAdsrfWlSr971quyByNMI5ftnTwMVlwc7bMFsu/h1ir7SCMK2ykgUrZJTqB
	MuampIwSdcmXfJEpCjkKdil9gD8N2R+Os1/IOiEo8NLg5UwsA2iiTbaMGF26O2ctRsQVU6YncSeUL
	NFeDLvQ9v0hSxYHUaXbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tki-00000008vKb-1PL0;
	Wed, 18 Mar 2026 16:28:12 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzqNz-00000008mSh-3ttC
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 06:16:10 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4fVNtF5kPpz8Xs6y;
	Tue, 10 Mar 2026 14:16:05 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 62A6FwKW065083;
	Tue, 10 Mar 2026 14:15:58 +0800 (+08)
	(envelope-from liu.xuemei1@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 10 Mar 2026 14:16:00 +0800 (CST)
X-Zmail-TransId: 2afc69afb7207e7-b4382
X-Mailer: Zmail v1.0
Message-ID: <20260310141600411Fu8H8-GXOOgKISU48Tjgx@zte.com.cn>
In-Reply-To: <20260310141349432DBRJJclgnBHYWu8it0geX@zte.com.cn>
References: 20260310141349432DBRJJclgnBHYWu8it0geX@zte.com.cn
Date: Tue, 10 Mar 2026 14:16:00 +0800 (CST)
Mime-Version: 1.0
From: <liu.xuemei1@zte.com.cn>
To: <anup@brainfault.org>, <tglx@kernel.org>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <sunilvl@ventanamicro.com>, <rafael.j.wysocki@intel.com>,
        <liujingqi@lanxincomputing.com>, <cyan.yang@sifive.com>,
        <nick.hu@sifive.com>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <liu.xuemei1@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYyIDEvMl0gaXJxY2hpcC9yaXNjdi1hcGxpYzogRG8gbm90IGNsZWFyIEFDUEkgZGVwZW5kZW5jaWVzIG9uIHByb2JlIGZhaWx1cmU=?=
X-MAIL: mse-fl1.zte.com.cn 62A6FwKW065083
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: liu.xuemei1@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Tue, 10 Mar 2026 14:16:05 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 69AFB725.000/4fVNtF5kPpz8Xs6y
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_231608_126308_DAB38647 
X-CRM114-Status: GOOD (  11.69  )
X-Mailman-Approved-At: Wed, 18 Mar 2026 09:28:11 -0700
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

The aplic_probe() function calls acpi_dev_clear_dependencies()
unconditionally at the end, even when the preceding setup (MSI or
direct mode) has failed. This is incorrect because if the device
failed to probe, it should not be considered as active and should
not clear dependencies for other devices waiting on it.

Fix this by returning immediately when the setup fails, skipping
the ACPI dependency cleanup. Also, explicitly return 0 on success
instead of relying on the value of 'rc' to make the success path
clear.

Fixes: 5122e380c23b ("irqchip/riscv-aplic: Add ACPI support")
Signed-off-by: Jessica Liu <liu.xuemei1@zte.com.cn>
---
 drivers/irqchip/irq-riscv-aplic-main.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
index 4495ca26abf5..8775f188ea4f 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -372,18 +372,21 @@ static int aplic_probe(struct platform_device *pdev)
 		rc = aplic_msi_setup(dev, regs);
 	else
 		rc = aplic_direct_setup(dev, regs);
-	if (rc)
+
+	if (rc) {
 		dev_err_probe(dev, rc, "failed to setup APLIC in %s mode\n",
 			      msi_mode ? "MSI" : "direct");
-	else
-		register_syscore(&aplic_syscore);
+		return rc;
+	}
+
+	register_syscore(&aplic_syscore);

 #ifdef CONFIG_ACPI
 	if (!acpi_disabled)
 		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
 #endif

-	return rc;
+	return 0;
 }

 static const struct of_device_id aplic_match[] = {
-- 
2.27.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
