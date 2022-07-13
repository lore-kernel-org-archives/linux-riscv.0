Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF66C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 02:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=36QJxrSKkCyeBng8ZuZ7xD+6YCW8fDhvAZD7CHEy88E=; b=nUA50o1gLCu1s5
	GiL8cwZVtzcHYBAjAjmkYit2kmIxUy1ulryDJntKIQQG2CQ6HjQ6W45B/9qc4sgL9Q8X4NUL19nu8
	MAimNm7K5hqfQaBdU/Ax2XvzPD0Ddj/nv5vDUXO6ujptJRbNQ7lcgpUZtsQMDY9QKrYg9tKh+wIAD
	4Z35rFVmbSjWX7dRgILkBhFwkPyC5+HWAFsfB43J+rnAqgt8uPs4mUIxc+OYB/pxiEhIqMv077DFc
	r/+iWixdjv+0gPS0c4ELfvFGxLmLsfesc6w3FB9I2P+IUr/aZTfy0iTB5KjGp2GzuHe6iADuivBpH
	Wo5IokK6ThsNs2ww/Dcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBSPl-00GtTB-V1; Wed, 13 Jul 2022 02:47:49 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBSPi-00GtOw-SR
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 02:47:48 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LjMRk0tbwzkWx4;
	Wed, 13 Jul 2022 10:45:22 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 13 Jul 2022 10:47:33 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 13 Jul
 2022 10:47:33 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<broonie@kernel.org>
Subject: [PATCH -next v2 0/3] spi: microchip-core: fix and cleanups
Date: Wed, 13 Jul 2022 10:56:54 +0800
Message-ID: <20220713025657.3524506-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_194747_135343_E432F04A 
X-CRM114-Status: UNSURE (   3.19  )
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

Patch #1 fix a UAF in mchp_corespi_remove().
Patch #2 and #3 some cleanups to simpify code.

v1 -> v2:
  add patch #3 to use dev_err_probe to simpify code.

Yang Yingliang (3):
  spi: microchip-core: fix UAF in mchp_corespi_remove()
  spi: microchip-core: switch to use devm_spi_alloc_master()
  spi: microchip-core: switch to use dev_err_probe()

 drivers/spi/spi-microchip-core.c | 56 ++++++++++++--------------------
 1 file changed, 20 insertions(+), 36 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
