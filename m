Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D98C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Feb 2022 12:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YNWKJXPlWqTkDYWzO4Acc0XKwTklMxuawZnMIdoKhyk=; b=x8sexm+e6B/Qmr
	Df16DmW1/wXMBrL37ZjLAmfgWKOOI67USr5iQ3JUMzJvxKtt0oYQpKmRjmTdFPgvhIsiKkNShS8hc
	NZS2f2icVvMsfp4pfqoFGyP9TAnOuFzPRthzMtI18C70vZEfQjZiFCQMbMYUbJ0WEdUgGVUoWEO4z
	KORLWbwSCW0ZevZQmcVWu+BCLdN0DuVikPVorr5KtgxpgvkUcc7HNJ1eOXW8C+DSQ9vkQM9AsQgbW
	Y8cW2mIl6h9pROBibR39W8Tgb43UDitucRi9L/7BLBgt4iNmKoBPmW6unoCWzfx4Jiz2vitkkjgjH
	ZRK8w/PJ4tqx96mO9gJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNwVq-0082kk-DV; Sat, 26 Feb 2022 12:49:26 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNwVb-0082iW-TI
 for linux-riscv@lists.infradead.org; Sat, 26 Feb 2022 12:49:16 +0000
Received: by mail-wr1-x42d.google.com with SMTP id b5so8393232wrr.2
 for <linux-riscv@lists.infradead.org>; Sat, 26 Feb 2022 04:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HKu7Nq9ada9Q0GKmhF6FBkxxAo4IU+EPX6BvNCYFox8=;
 b=6x5jrcANK5bD433NpXdRCtV2c9jgfqOJGU64yg75fTDWaDeT/J8OqFELBHUX9vT1Se
 oK42PtAp4iyPsW1+RThNiQceWnDxFQocHUI1YQNNpacxdjF0NeFt7XnYroEuh7qhCYKL
 XA7xgflUsxVRJdDBtLzeDqiOnTf/JiY+lkAwam377yZwG9iFHu7hNyXIHWvdNBU4VAsU
 iEmgA3dKOh7X7T6iMGC/wkno8gU5rOnUK+ay+Cthnj8xrqr5tbwQF+drdgMdj5aWqLRm
 LPWx8+QuuDiXMBSSkBEcmKsWsWcKXr42pXfjS0E96N1QdZ2DGd6Ws75zyf7h4EXCySEx
 gcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HKu7Nq9ada9Q0GKmhF6FBkxxAo4IU+EPX6BvNCYFox8=;
 b=gTW6DwYpFRoFbPJTN1MaUIjQH73POaDwvhh5X0OX24ex3+nldRElx94hdgT0iec8SL
 /0N6Udfj1y5ZKJrmE1NJaCq/CvuXOorgL+q1b+LXGfP9PCgeGwgXU7/tbeanJEbfc7UQ
 wQFmBJoBKL1+i1Sp7EMdyqazS+nBXlOxDt8+a3Zka/2NdxykxByXsp4HLw8TKHvYVDxL
 q3XfNn+KQaUm58C+zjNbitngping54gjgwVWFmvsNCDLQve7cUVF4GL+RxpgMBUo6nud
 G3YPrpyuBz9BUUR952zZoyJLsczH/weWZmSnTC1SF6aDcOh851w9QrlK0XN1wLpXpae4
 72zg==
X-Gm-Message-State: AOAM533xN0ptifCUOHuijYO661rC8tEwuuJmtNDq0MZPy/17zJQUkZF4
 7B8kUglgYkpvOALI33OnSDk4pA==
X-Google-Smtp-Source: ABdhPJxM8vLs9v8y3p3R9aQurSHHEe5oH3GDF05PcnuiNTk/vV5hbRaFoSBOSeClmdHZ3ck3kCKnoA==
X-Received: by 2002:adf:9f0f:0:b0:1ed:c016:dfe5 with SMTP id
 l15-20020adf9f0f000000b001edc016dfe5mr9200390wrf.675.1645879748687; 
 Sat, 26 Feb 2022 04:49:08 -0800 (PST)
Received: from spud.. ([109.76.226.172]) by smtp.gmail.com with ESMTPSA id
 p4-20020a1c7404000000b0038140136ff6sm5027696wmc.5.2022.02.26.04.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 04:49:08 -0800 (PST)
From: Conor Dooley <mail@conchuod.ie>
To: conor.dooley@microchip.com,
	nicolas.ferre@microchip.com
Cc: arnd@arndb.de, olof@lixom.net, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>, Conor Dooley <mail@conchuod.ie>
Subject: [PATCH] soc: microchip: make mpfs_sys_controller_put static
Date: Sat, 26 Feb 2022 12:48:27 +0000
Message-Id: <20220226124826.1564871-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220226_044914_706260_902681C7 
X-CRM114-Status: UNSURE (   9.42  )
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

From: Conor Dooley <conor.dooley@microchip.com>

dsafsdfd0054 ("soc: add microchip polarfire soc system controller")
incorrectly exported mpfs_sys_controller_put. Remove the export and make
the function static instead. This fixes the "no previous prototype
for 'mpfs_sys_controller_put'" warning spotted by the kernel test robot.

Fixes: dsafsdfd0054 ("soc: add microchip polarfire soc system
controller")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <mail@conchuod.ie>
---
 drivers/soc/microchip/mpfs-sys-controller.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 2f4535929762..31f3f29fc1ae 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -73,13 +73,12 @@ static void mpfs_sys_controller_delete(struct kref *kref)
 	kfree(sys_controller);
 }
 
-void mpfs_sys_controller_put(void *data)
+static void mpfs_sys_controller_put(void *data)
 {
 	struct mpfs_sys_controller *sys_controller = data;
 
 	kref_put(&sys_controller->consumers, mpfs_sys_controller_delete);
 }
-EXPORT_SYMBOL(mpfs_sys_controller_put);
 
 static struct platform_device subdevs[] = {
 	{
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
