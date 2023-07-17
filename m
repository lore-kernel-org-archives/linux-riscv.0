Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C07C001DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 15:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+DUPymU2H0qit9Sf+kXb6GZWz5Ir9DJJ5PP2mOpgyb8=; b=SoBQ0PAjbGdg99
	dtqCnHRzBmXrxn1c8r0jn8CucxsnQh2Cnb2hp7DnvN4VelczvKRdfnT8AFGBVEzS1IzasgbZiUHQT
	8F9dlj31sgBP4+Jt7XI1fKgEvEc1Z/5VB3XzDvfDmNItPb68V8bwU8RxGptzSMs926SroOUWbTHYM
	GuIZQ9CsFjdunZAHfhR1uYXO6liVY6dNSh/XQXurHR8m5YIacVpk7gao/D+HzfqwSirXeYvjCalqa
	mU+K/XTdHGb6V9P+Mw+VZuksKVMwu4RevWe7SzkQLTdffSdjrivmWMenN+lsc2zOwZ/K7zQU76Z/C
	jd3DWbIwoHqYPgEuwEYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLPkz-004LKl-07;
	Mon, 17 Jul 2023 15:03:25 +0000
Received: from m12.mail.163.com ([220.181.12.196])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLPkv-004LKK-15
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 15:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=JsNaSQ1Xv8SD9x90au
	0LN2fZyNi8dFnX8ivVAUEZBAE=; b=RDelUpxbVA9tcY0rJQtQRBuLD1k/PRx2E8
	KfcsXC6bQm/v81BByITj4hNher2OC/q9B5Vtx1Kscw4WirwuJsvMF43PdfFrtugj
	KnhNqkQR1fWS1FNu4nGvKpfOcwZIr7D2HbWGR2WXS7rxR0AqO/mihv1bSI92T+GV
	wx7rGfyVs=
Received: from localhost.localdomain (unknown [202.112.113.212])
	by zwqz-smtp-mta-g2-2 (Coremail) with SMTP id _____wCnhZJqVLVkG8NBAg--.18320S4;
	Mon, 17 Jul 2023 22:47:11 +0800 (CST)
From: Yuanjun Gong <ruc_gongyuanjun@163.com>
To: Yuanjun Gong <ruc_gongyuanjun@163.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/1] drivers:rtc: fix return value check in mpfs_rtc_probe()
Date: Mon, 17 Jul 2023 22:47:05 +0800
Message-Id: <20230717144705.23656-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wCnhZJqVLVkG8NBAg--.18320S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw18JrW7ury7Gr17trW5Jrb_yoWfCrX_G3
	yxZrykJFn8Gw42g3WFqr1SyrWfAF409rn3Wan5t39ayrWUZw4UWFZ7Xr4rursrX3y3KFyD
	Jwn7AF92vF1fCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNWlk5UUUUU==
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/xtbBiA+v5VaEFzdUUQAAs6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_080321_749671_12E719F9 
X-CRM114-Status: UNSURE (   9.72  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

in mpfs_rtc_probe, devm_clk_get may fail, and its return value
should be checked before passing to clk_get_rate().

Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 drivers/rtc/rtc-mpfs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
index 5b96a6d39210..c126df40c343 100644
--- a/drivers/rtc/rtc-mpfs.c
+++ b/drivers/rtc/rtc-mpfs.c
@@ -257,7 +257,11 @@ static int mpfs_rtc_probe(struct platform_device *pdev)
 	}
 
 	/* prescaler hardware adds 1 to reg value */
-	prescaler = clk_get_rate(devm_clk_get(&pdev->dev, "rtcref")) - 1;
+	clk = devm_clk_get(&pdev->dev, "rtcref");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+	prescaler = clk_get_rate(clk) - 1;
+
 	if (prescaler > MAX_PRESCALER_COUNT) {
 		dev_dbg(&pdev->dev, "invalid prescaler %lu\n", prescaler);
 		return -EINVAL;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
