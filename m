Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780CFCA0EDC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 07:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HToNizWw4Sd8cS/bUzOH14jD1EDtUpZloh+2L3JD/HU=; b=diDH4vm54E8Tcq
	1fScU42PnEaN3QMzbPFTH8FkccKw/sm1OqY+kACjpKuVUH+973g/8g4H60XznAjLe3uVXRBkh1b8n
	3BWHaqD76HzrXXfmYmRhRFkMRNz1iKJGGJfmNnR43allxsJCkOmjsQSpH13ko5YpotmFHp9EW7Vl9
	xjhSdKhrMJCf62rVeP5uIyZYZvC+VTPUR3QpEFB8pq4tfZFt0vAibD45Md9zcztIVuWWMQdclzp8s
	BOs88xm9liKaDUT0ngqz49FaspHV0kPhOIr4NPfnhppITcpc95s/+aEqctTLLBOxUbFHhAAc4o4A7
	FM8n22peFTqDNOhVGqXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodWE-0000000CdNB-3FXI;
	Wed, 20 Aug 2025 07:46:02 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodTe-0000000Cd4r-3xYZ
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 07:43:24 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9879320D9F;
	Wed, 20 Aug 2025 09:43:21 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WAWoSrNxQhzA; Wed, 20 Aug 2025 09:43:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755675799; bh=Im+oemJDXWL80mEoHEC/AYrA40M35zJiJWeGpLm6Pjk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jE1pS826qnrHeJew7gQ5Uci75z55bkn53V4TQ07BBr6WL5l5ScF4AtWIfe4kNYSvN
	 H7WAu8z1V44qJbG4+Rl1ShJqaQL6oX5Yln898RzQA7AVw6HNRk3i/EfdJrNpPizHU+
	 4gkMoHqxl5DuoSlAV7Wo063TK4usv1offxnkF9Z2oyjYPM4EdJlQp43nmeQdcC/KKk
	 Y/H34MOxBQaobpWLMNVhDZngQxPIIG0ZAaefsgrZBHBQy2gJ3CujlNYirBAMs3N0l7
	 uomlqn9r8z2oNPQRkpmUtHkjkWzaOk2egOWt0DCVS+QxbFLfKuI7qIy2t5r5ZZ3rm+
	 iieguHInu0mdw==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v2 2/3] reset: th1520: Support the new compatible for VO-subsystem controller
Date: Wed, 20 Aug 2025 07:42:44 +0000
Message-ID: <20250820074245.16613-3-ziyao@disroot.org>
In-Reply-To: <20250820074245.16613-1-ziyao@disroot.org>
References: <20250820074245.16613-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_004323_114266_7FD03BFD 
X-CRM114-Status: UNSURE (   9.71  )
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
Cc: devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The reset controller for VO-subsystem is previously described with
compatible "thead,th1520-reset", which is misleading since it implies
control over all reset units on the SoC.

A new compatible, "thead,th1520-reset-vo", has been introduced to
describe the controller's scope explicitly, while the old one has been
deprecated. Let's support the compatible in the driver.

Fixes: 4a65326311ab ("reset: thead: Add TH1520 reset controller driver")
Reported-by: Icenowy Zheng <uwu@icenowy.me>
Co-developed-by: Michal Wilczynski <m.wilczynski@samsung.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/reset/reset-th1520.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/reset/reset-th1520.c b/drivers/reset/reset-th1520.c
index 14d964a9c6b6..4c8ea35b174e 100644
--- a/drivers/reset/reset-th1520.c
+++ b/drivers/reset/reset-th1520.c
@@ -154,6 +154,7 @@ static int th1520_reset_probe(struct platform_device *pdev)
 
 static const struct of_device_id th1520_reset_match[] = {
 	{ .compatible = "thead,th1520-reset" },
+	{ .compatible = "thead,th1520-reset-vo" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, th1520_reset_match);
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
