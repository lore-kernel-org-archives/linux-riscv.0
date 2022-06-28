Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C139C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jun 2022 13:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bvWhCxKO046N4/fZ2J0RPbpI/o9gMHjDaVznuicJbWE=; b=RGS8ORohsXpfhz
	FjvggDMozoVVkVaxN2xEhAbn7UkHfmdOg47zG3OG/lz0eQMfUe/uU13gMgi8dPvxG/F83PapvmK5g
	z7vuAhW6doFSpdqN9H4FlqPYwQI+5ryhVMEx0MfiG4bxX/HWQP8jsIHTqBnhKFchrjbfC/goxZrvf
	X58ygILP/lpsxVBMZUMVN75fr3LXxhsHWkRiphgHJkuc0QRPeyZyPvqdgqMBJGCw/K7G3txDoP0e6
	d6pXhcW24F1OBd0mSTDCW2P0n1hKotyVEMs2UpijvLTPdqhA49NeRiTSgcCAeUmrq+65oCE7mRInt
	RtaH2fMfZVhLqI0cHbGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Bgx-006Z3O-Op; Tue, 28 Jun 2022 13:55:47 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Bgo-006Yyr-Qj
	for linux-riscv@lists.infradead.org; Tue, 28 Jun 2022 13:55:41 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LXQzr47xSzkWL4;
	Tue, 28 Jun 2022 21:53:44 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 28 Jun 2022 21:55:34 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 28 Jun
 2022 21:55:34 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <conor.dooley@microchip.com>, <valentina.fernandezalanis@microchip.com>,
	<gregkh@linuxfoundation.org>
Subject: [PATCH -next] usb: musb: mpfs: add missing  clk_disable_unprepare() in mpfs_remove()
Date: Tue, 28 Jun 2022 22:05:27 +0800
Message-ID: <20220628140527.1404439-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_065539_570236_050B7E1A 
X-CRM114-Status: UNSURE (   6.81  )
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

clock source is prepared and enabled by clk_prepare_enable()
in probe function, but no disable or unprepare in remove.

Fixes: 7a96b6ea90a4 ("usb: musb: Add support for PolarFire SoC's musb controller")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/usb/musb/mpfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/musb/mpfs.c b/drivers/usb/musb/mpfs.c
index a69ca338eace..cea2e8108867 100644
--- a/drivers/usb/musb/mpfs.c
+++ b/drivers/usb/musb/mpfs.c
@@ -239,6 +239,7 @@ static int mpfs_remove(struct platform_device *pdev)
 {
 	struct mpfs_glue *glue = platform_get_drvdata(pdev);
 
+	clk_disable_unprepare(glue->clk);
 	platform_device_unregister(glue->musb);
 	usb_phy_generic_unregister(pdev);
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
