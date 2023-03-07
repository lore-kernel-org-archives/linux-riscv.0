Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5BCC61DA4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 02:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XVZKEsJeGfRiEbcIgLzEaunJRg7mNJaWV4Mi2gHEgio=; b=KLwmmhDPLRHDdT
	ZHxWXDaY5w8ktPk/UwaqoUvqnH2v3z3yBxYkX4LeGpV05xgxLyedLR2yMubikOv6VsXvWxioGJPF8
	TWc1LiRTI4Yi79cxGKYxWixm1W0xlwUp2xMk0beNNA0w74azoH+foS7c9u/kkGjAUkay0dPA3jzIT
	tKJiozTWzb/fRFyE1KR03D7SEXPYFCx7yJ/BRAemHGN5hWcqdhIUjHS9pAYBzWNXLkPzXmGoAkdeS
	Uki++hRHhl4dmQAUcoPyzzi8RAjaixJwvHYKWp+7G+i9JySd/uCVphlF/jtoynA4oaK2/h5DcdT9F
	9a07BYaRaQG+SyDcPi2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZNME-00FyC1-NJ; Tue, 07 Mar 2023 02:47:18 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZNMB-00Fy6M-7Z
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 02:47:17 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 6419824E287;
	Tue,  7 Mar 2023 10:46:49 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Mar
 2023 10:46:49 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX068.cuchost.com (172.16.6.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Tue, 7 Mar 2023 10:46:48 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, William Qiu
	<william.qiu@starfivetech.com>, Conor Dooley <conor.dooley@microchip.com>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v5 2/2] mmc: starfive: Add initialization of prev_err
Date: Tue, 7 Mar 2023 10:46:46 +0800
Message-ID: <20230307024646.10216-3-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307024646.10216-1-william.qiu@starfivetech.com>
References: <20230307024646.10216-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_184715_422691_5DB0DEEF 
X-CRM114-Status: GOOD (  11.84  )
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

Add a incremental updates to fix a bug that prev_err is uninitialized.

Signed-off-by: William Qiu <william.qiu@starfivetech.com>
Reported-by: Dan Carpenter <error27@gmail.com>
---
 drivers/mmc/host/dw_mmc-starfive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/dw_mmc-starfive.c b/drivers/mmc/host/dw_mmc-starfive.c
index 40f5969b07a6..dab1508bf83c 100644
--- a/drivers/mmc/host/dw_mmc-starfive.c
+++ b/drivers/mmc/host/dw_mmc-starfive.c
@@ -51,7 +51,7 @@ static int dw_mci_starfive_execute_tuning(struct dw_mci_slot *slot,
 	struct dw_mci *host = slot->host;
 	struct starfive_priv *priv = host->priv;
 	int rise_point = -1, fall_point = -1;
-	int err, prev_err;
+	int err, prev_err = 0;
 	int i;
 	bool found = 0;
 	u32 regval;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
