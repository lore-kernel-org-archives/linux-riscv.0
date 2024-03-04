Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D03C48BF6
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 09:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CZ8LBRa4uboe2kfzm6jcWa/pJBt7K9Ze4Vh2BK7HG/o=; b=e+EU1H3MhKe+PO
	BXIGemMmnTo2xmFvB4CvijLiEtOweQ5fe99czI/1weHnZdejWLRNS8+oA2VbkhabO3MraMQZ+p1Gj
	XnYNGkUyg8lH5xMSDsJ2pdykbiCb9y6RWkryHtN0WnOy6bFM7vr8ORZ5H6dO1cGhqw4KfOUSa8bNL
	aMzF0QdDoTIGTVCq/eSqRa1C5Iz+AXzg0SG6jc3D55LMPd3lvPGx/ADpOI1rnBy3uRt+CsTjCvPtV
	ib/qLGbZKhMVBXR0+7vaVEUMHibqIPq8VnnAbHBCP4AL4AvZ9Kdt42B/7/WWIYqgmH2lkme7bvzeE
	j6VaBxRLkjg+VZv2/V1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh4aT-00000008Nh4-01Oa;
	Mon, 04 Mar 2024 09:26:21 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh4aK-00000008NNQ-3Kes
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 09:26:19 +0000
X-QQ-mid: bizesmtp77t1709544338tbvh7m0l
X-QQ-Originating-IP: /8qetr6ORn/X+N+f2KO84Qws+LjhcD+YICaQ7LCYY1w=
Received: from localhost ( [112.22.30.30])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 04 Mar 2024 17:25:37 +0800 (CST)
X-QQ-SSF: 01400000000000505000000A0000000
X-QQ-FEAT: qPPBrXN7Wh+uu+Oshg+pJH+InOcUFIlvm2eJlW3zNBPIzyTLwKQAunGD3FCwb
	zwyMY7CdMV2tZ54TuJOawKbq57h5TE6z3bq9+dKiI2AsgkqwjjDfTVg5lIaoVkDLYq9zDYr
	B+NC4YSSdaexh+v2RbdouhF0KG8MQkHwfvAV9dKQd2ZpKw6mCjxCjr+vxi4lVnO4DffIhy7
	Bp8bES/XvFY32VFOiR49STQmxEgSBPeNzmBJpHKaqsWPOBFUfSoc6ImedCXlvonCQvw/XkC
	ToAlhHse/0shw2Jkgra+fw3FaQQJiDxuxXp4XT6UWxSGLDZ60zcvXXmre+31R0+pdOe9C28
	zxShzXKHft+hSESzzPFzcWabdAqyOZNshksj13TcTCY2nogMtqgP9uLM22wzb+VL3jwi//t
	nBkaCl93UStK79lsqDOIhQ==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 14106722739390484581
From: Dawei Li <dawei.li@shingroup.cn>
To: conor.dooley@microchip.com,
	daire.mcnamara@microchip.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Dawei Li <dawei.li@shingroup.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] firmware: microchip: Fix over-requested allocation size
Date: Mon,  4 Mar 2024 17:25:32 +0800
Message-Id: <20240304092532.125751-1-dawei.li@shingroup.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_012613_653916_E6D44D01 
X-CRM114-Status: GOOD (  10.30  )
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

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/microchip/mpfs-auto-update.c:387:72-78:
   ERROR: application of sizeof to pointer
   drivers/firmware/microchip/mpfs-auto-update.c:170:72-78:
   ERROR: application of sizeof to pointer

response_msg is a pointer to u32, so the size of element it points to is
supposed to be a multiple of sizeof(u32), rather than sizeof(u32 *).

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202403040516.CYxoWTXw-lkp@intel.com/
Signed-off-by: Dawei Li <dawei.li@shingroup.cn>
---
 drivers/firmware/microchip/mpfs-auto-update.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/microchip/mpfs-auto-update.c b/drivers/firmware/microchip/mpfs-auto-update.c
index 682e417be5a3..7ea3cdb917bc 100644
--- a/drivers/firmware/microchip/mpfs-auto-update.c
+++ b/drivers/firmware/microchip/mpfs-auto-update.c
@@ -384,7 +384,7 @@ static int mpfs_auto_update_available(struct mpfs_auto_update_priv *priv)
 	u32 *response_msg;
 	int ret;
 
-	response_msg = devm_kzalloc(priv->dev, AUTO_UPDATE_FEATURE_RESP_SIZE * sizeof(response_msg),
+	response_msg = devm_kzalloc(priv->dev, AUTO_UPDATE_FEATURE_RESP_SIZE * sizeof(u32),
 				    GFP_KERNEL);
 	if (!response_msg)
 		return -ENOMEM;
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
