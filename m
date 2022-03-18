Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9AFC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Mar 2022 17:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BldsbtyC/2UDoLNbCTF/q7fQejb1OBhAmzsTaApmxBw=; b=aZBc45f7+2zdV3
	XAHhwztml6N0Yd4kF+tIIefRbwAXpGu1RssekYokdDdkRj33y9e1S3EESISQ0F9DcXe6djyGnKIzr
	82zVPi9TZm55Bm8+3Hy6HzEuWFVPTxuram9959OUWcEaW7vhxskpl4Qu6xcCNrlSwxw/6ggE7LZIx
	e8EROn1ZbhCWtZZKiB89PP5rBPUfX6Ks8BZJef78/IdqpkyRBjGuG/ZZkXznqY/3Nt87ydQRyH9Ue
	JfEpo2HKLd0nV65ogA5m5/7ofdNmI8zuzNy5u3Pw2LmDmUr3T1/I+QhB6kOy/HqWCZOhGgV3INii5
	1gr1qMLieUZm6f0G46Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVGJJ-002UDJ-Ch; Fri, 18 Mar 2022 17:22:45 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVGJG-002UC5-AW
 for linux-riscv@lists.infradead.org; Fri, 18 Mar 2022 17:22:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 j13-20020a05600c1c0d00b0038c8f94aac2so813962wms.3
 for <linux-riscv@lists.infradead.org>; Fri, 18 Mar 2022 10:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l9534a34/AgA9Z2/apBy/6pemIM2g3WRkNrlI/px40Y=;
 b=tXreencTQidCxFJwd7ZQo1jGUzWbf0nCUjUIqXUSF7i3hJfuCQ0V7CPqRWjm+Nuz50
 /qavkdFCiypMZP72TOcIbMqOZJMQTktJtIZKZ7ZmoTae5kkCRyYfJsNeI9mZ29DJb/hR
 roQd1SU9ozXdiB3m6/VFzVjdGz/7ZktT6T6KdW+9rgtxwH7zhNXqEKbICUfutKAOurhy
 DfV3NbmdDkUuBjfB+Kwjs7unJCbdh2zLFV7E5MqXT/fUTP7LqdjG5TtDbjshPpKP4TG+
 Vw2GYiMzgUoJsbR7f0v48T2vEIvdoOuB1T3pcBB3T/pSyhezrtFdt2jt67I18t3BgArX
 3u9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l9534a34/AgA9Z2/apBy/6pemIM2g3WRkNrlI/px40Y=;
 b=zJluLDYirg+8yeUDVbgFmY/ACXHp5Cp12GBmAwxRDx26Dxh6xMwBS6sj/dwDrx0x88
 9Xbpnv9BmS7UTXLLWVhweMBPcuSKtYQmcxRki6tdAYMDZHMn2Ov5o8ANVHn299uu2BOR
 ijsLl+dAei5QyFpBfwjVuzpCgcW0RI8DfBafu/0JqpWrh2xwpr/Y4E/VKviTfB4gkcDG
 XTq06jr1dVESKkTCote4qnb3tEwTJy+714X+yBJ7znObi/uRfp9g4B/cMhM8KbrIHoPr
 hi9EZt4dbKhLkxEIBg/+FrMV+1/Dn8MVnHbQAn9raQlLTPcFuj+L08HqOwFsHb3LULuB
 sh2w==
X-Gm-Message-State: AOAM5302BURRe6fhpc5q3xWAE7zXwDsoo0ywuZQp1lLGFAsO2MVPpXbJ
 6/J7n3s8ux11dWjY9YZR5NohEEGYsir0gMc0
X-Google-Smtp-Source: ABdhPJyDh+usVz8Tot9VRPesh6vbKBHRpScfPgpbIJG9Ob8LkCUY+dHJCAsexSYsHfP04rSLP8rHQw==
X-Received: by 2002:a1c:7517:0:b0:38c:8722:9bc6 with SMTP id
 o23-20020a1c7517000000b0038c87229bc6mr4644093wmc.2.1647624160384; 
 Fri, 18 Mar 2022 10:22:40 -0700 (PDT)
Received: from spud.. ([109.76.4.19]) by smtp.gmail.com with ESMTPSA id
 r13-20020adfbb0d000000b00203e0efdd3bsm6556874wrg.107.2022.03.18.10.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 10:22:39 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: nicolas.ferre@microchip.com,
	arnd@arndb.de
Cc: olof@lixom.net, conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel test robot <lkp@intel.com>, Conor Dooley <mail@conchuod.ie>
Subject: [PATCH] soc/microchip: fix invalid free in mpfs_sys_controller_delete
Date: Fri, 18 Mar 2022 17:21:08 +0000
Message-Id: <20220318172107.1599399-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_102242_440535_015DDC1C 
X-CRM114-Status: GOOD (  13.15  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Fix an invalid kfree in mpfs_sys_controller_delete, by replacing the
devm_kzalloc with a regular kzalloc. Change the error handling in the
probe function to free the sys_controller struct if the probe fails.

> cocci warnings: (new ones prefixed by >>)
> >> drivers/soc/microchip/mpfs-sys-controller.c:73:1-6: WARNING: invalid free of devm_ allocated data
Link: https://lore.kernel.org/linux-mm/202203180259.lgIylRZV-lkp@intel.com/

Fixes: d0054a470c33 ("soc: add microchip polarfire soc system controller")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <mail@conchuod.ie>
---
 drivers/soc/microchip/mpfs-sys-controller.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 31f3f29fc1ae..6e20207b5756 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -95,9 +95,9 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mpfs_sys_controller *sys_controller;
-	int i;
+	int i, ret;
 
-	sys_controller = devm_kzalloc(dev, sizeof(*sys_controller), GFP_KERNEL);
+	sys_controller = kzalloc(sizeof(*sys_controller), GFP_KERNEL);
 	if (!sys_controller)
 		return -ENOMEM;
 
@@ -106,9 +106,12 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 	sys_controller->client.tx_block = 1U;
 
 	sys_controller->chan = mbox_request_channel(&sys_controller->client, 0);
-	if (IS_ERR(sys_controller->chan))
-		return dev_err_probe(dev, PTR_ERR(sys_controller->chan),
-				     "Failed to get mbox channel\n");
+	if (IS_ERR(sys_controller->chan)) {
+		ret = dev_err_probe(dev, PTR_ERR(sys_controller->chan),
+				    "Failed to get mbox channel\n");
+		kfree(sys_controller);
+		return ret;
+	}
 
 	init_completion(&sys_controller->c);
 	kref_init(&sys_controller->consumers);
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
