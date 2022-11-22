Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E399C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 07:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=27Q9gKVapzpJXGlp7RNYFi4DDvyVJRIKNgscjMgwecs=; b=dFfJgT4OBTrQL7
	XjEzTHIXmRx7WRt+26i0j3sCbDZy5/DHQGRijGNH3GFD3B1+WNFGQeZO557FLP1Pm2JT4vb0NRlOZ
	tf0Hv51KpbKwiOT2dnvlJJtPzRUCSAgn02DB5a2jTwJPDqbMSs1kejI3DRYzUZiGadYmkaX4ET0on
	oRCi2TgrQ2TPYRf+kW5KSe9xXGXhQfuqBTDIyztsfTHXInohmTPjiIqM4OgmAkdpRdwS+fjRDmrOi
	EK7sea33TISW3PNUGOHUxzsmCxZPBYOIWj0tJHMi0U6GPOkIRX5PvilWXKgDo97gKMIottnHytVh9
	CPaZqHHRg09cmfS3a02w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxNmy-005bmc-1D; Tue, 22 Nov 2022 07:33:52 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxNmu-005bia-HI
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 07:33:50 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NGbZp3ysrz15Mns;
	Tue, 22 Nov 2022 15:33:06 +0800 (CST)
Received: from kwepemm600020.china.huawei.com (7.193.23.147) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 15:33:35 +0800
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600020.china.huawei.com (7.193.23.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 15:33:34 +0800
From: Peng Zhang <zhangpeng362@huawei.com>
To: <damien.lemoal@wdc.com>, <linus.walleij@linaro.org>, <seanga2@gmail.com>,
	<palmerdabbelt@google.com>
CC: <linux-riscv@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sunnanyong@huawei.com>,
	<wangkefeng.wang@huawei.com>, ZhangPeng <zhangpeng362@huawei.com>
Subject: [PATCH] pinctrl: call of_node_put() when breaking out of for_each_available_child_of_node()
Date: Tue, 22 Nov 2022 07:58:53 +0000
Message-ID: <20221122075853.2496680-1-zhangpeng362@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600020.china.huawei.com (7.193.23.147)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_233348_769892_3638986C 
X-CRM114-Status: UNSURE (   8.03  )
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

From: ZhangPeng <zhangpeng362@huawei.com>

Since for_each_available_child_of_node() will increase the refcount of
node, we need to call of_node_put() manually when breaking out of the
iteration.

Fixes: d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
Signed-off-by: ZhangPeng <zhangpeng362@huawei.com>
---
 drivers/pinctrl/pinctrl-k210.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
index ecab6bf63dc6..ad4db99094a7 100644
--- a/drivers/pinctrl/pinctrl-k210.c
+++ b/drivers/pinctrl/pinctrl-k210.c
@@ -862,8 +862,10 @@ static int k210_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	for_each_available_child_of_node(np_config, np) {
 		ret = k210_pinctrl_dt_subnode_to_map(pctldev, np, map,
 						     &reserved_maps, num_maps);
-		if (ret < 0)
+		if (ret < 0) {
+			of_node_put(np);
 			goto err;
+		}
 	}
 	return 0;
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
