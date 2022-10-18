Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250DBC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 02:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ox1p84FVMQ8zrKz5XMCwLBg6HunUc10xYS2EldXZGnE=; b=hRenRA5h7vFrBz
	qnt1bfaS3dsToOiW/kbWzn91fG1Y/Qxcvyw+mTwHN0EiMjJ0hxEZEQ2reVoHUXA+UE/RjsPi/MtMs
	r2WNNuojZAqIgyVyi5jvjSiSlARFKfN4PM0CalzshG99aRoo1tOOwIf4HH71EVtBnKDr8LYC1pyGi
	CReXC3A+7v6hnCjebsGuP90xVhaHf+56qouxtFv+jT0XLwy5Wi4ZrD2FmMyTEXL8KCSlq5+jsFur2
	ZHL6C3+gd892gSOkGqAf0eZwzljegfUXUAodMf98iYZaYwn6US2lWfz6idW7YzvxG215PRymK8yLH
	YwpLNJYXluJJO97BISDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okcPZ-001MVi-Ph; Tue, 18 Oct 2022 02:32:57 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okcPX-001MTT-0K
	for linux-riscv@lists.infradead.org; Tue, 18 Oct 2022 02:32:56 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MryT61mqdz1P7CY;
	Tue, 18 Oct 2022 10:28:10 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 10:32:25 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 18 Oct
 2022 10:32:25 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-riscv@lists.infradead.org>
CC: <yash.shah@sifive.com>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<conor@kernel.org>, <yangyingliang@huawei.com>
Subject: [PATCH v2 0/3] some fixes for sifive_ccache
Date: Tue, 18 Oct 2022 10:31:46 +0800
Message-ID: <20221018023149.1048176-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_193255_225641_73672489 
X-CRM114-Status: UNSURE (   4.27  )
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

Add missing iounmap()/free_irq()/of_node_put() in sifive_ccache_init().

v1 -> v2:
  - Add review tag from Conor Dooley in patch #1 and #2.
  - Add patch #3 to fix missing of_node_put().

Yang Yingliang (3):
  soc: sifive: ccache: fix missing iounmap() in error path in
    sifive_ccache_init()
  soc: sifive: ccache: fix missing free_irq() in error path in
    sifive_ccache_init()
  soc: sifive: ccache: fix missing of_node_put() in sifive_ccache_init()

 drivers/soc/sifive/sifive_ccache.c | 33 ++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
