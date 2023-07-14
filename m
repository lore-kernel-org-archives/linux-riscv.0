Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A3AC001DC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 17:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jFVkbtm50o/Wim+vMESFYAaZWbYFvvQABWMyl6jt9zc=; b=vD2aGZ47/rcj/q
	il49mUZyHtc3W+cmPT8O1UuYSCyq0aTU72EI8Rc4KCR2W3Jhj7oB2JVxAqDQeHv4LrKjkaU6Q6IYc
	2IQMV+SLYsb0bDhLynuJ2Yk/R5VsQ5QbweqI7R+QLLfIv8jhHZ5FKYuJYd2dPM67UZkv1oSKCHLoZ
	CcMrQlw1dTXQRLGd17bo7a9unaqHDYL2eIJx3vqoqCbSXLkDs15tLYCXD7YY/ZYPh9+VIu5EU5XEk
	AYVgDeI8nmT0igJMCj8PBbPfqAdHILza/YkSDgi2SbLwHOmYBMNWHC7ssqIfnSLkOh41xXU9L0ikc
	EYYADDhfoVB7ihJ6TQmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMxh-006sKL-1F;
	Fri, 14 Jul 2023 17:52:13 +0000
Received: from mail-io1-f46.google.com ([209.85.166.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKMxV-006s2o-1r;
	Fri, 14 Jul 2023 17:52:04 +0000
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-78360b822abso87652439f.2;
        Fri, 14 Jul 2023 10:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689357120; x=1691949120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sTzcVBJWZ3FygfO4cCF34p+eZrcFm8fXrcWkJJkRg+4=;
        b=aTs+z8vS059shauvPWs0hDnmGYVNekjmB6RU6ehnUC7AyUPD63TdcZ1ivHX5/54QPV
         R4oyI5IsIBK/UsvssyFEGJ1ST/uMltKEMm3LnCU4+Yk9ei4r7UAUez6leNNhnIyMeEaz
         fvXXYrYjIQmXwueTQVunwvz28+a7Pb50YB22ffDbTyMBugK5DBN/zWGM14fYsStf4ca2
         U4PUhqtXIyzAhAuI1f0vcsjh/ix6ZKXOHbTEeaXgtPrhYtX0ESgGAzgEIxX1XxlrNGeW
         NkQO/0gAby9eBsk6RDtczZWv0BaaBQrvxMN/xqquRDV1RQBO4ip+U8EjDgumJzsK/sbS
         KxiA==
X-Gm-Message-State: ABy/qLaN8KVHNJEl/DWLX2PYVCtv65urWm860KqZhOkoPnOvlmYFqqnd
	7cXsw0wE1IHrdx+bwRZq6+CGHcZhHI+E
X-Google-Smtp-Source: APBJJlGpJgoM+pVfwZn7OJWzOzIWz07PqgfABsQSmT1UwRrTyjoPvoB0A+qUcXRVic/HD+YI9+DzRg==
X-Received: by 2002:a05:6e02:109:b0:345:ad48:d160 with SMTP id t9-20020a056e02010900b00345ad48d160mr5022494ilm.17.1689357120622;
        Fri, 14 Jul 2023 10:52:00 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id ed26-20020a056638291a00b0042b451aa95esm2589606jab.150.2023.07.14.10.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:52:00 -0700 (PDT)
Received: (nullmailer pid 4067752 invoked by uid 1000);
	Fri, 14 Jul 2023 17:51:40 -0000
From: Rob Herring <robh@kernel.org>
To: Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH] soc: microchip: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:51:38 -0600
Message-Id: <20230714175139.4067685-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_105201_613009_7B4CF3E9 
X-CRM114-Status: GOOD (  11.65  )
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

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/soc/atmel/sfr.c                     | 1 -
 drivers/soc/microchip/mpfs-sys-controller.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/atmel/sfr.c b/drivers/soc/atmel/sfr.c
index 0525eef49d1a..cc94ca1b494c 100644
--- a/drivers/soc/atmel/sfr.c
+++ b/drivers/soc/atmel/sfr.c
@@ -10,7 +10,6 @@
 #include <linux/nvmem-provider.h>
 #include <linux/random.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 216d9f4ea0ce..fbcd5fd24d7c 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -13,7 +13,7 @@
 #include <linux/module.h>
 #include <linux/jiffies.h>
 #include <linux/interrupt.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 #include <linux/mailbox_client.h>
 #include <linux/platform_device.h>
 #include <soc/microchip/mpfs.h>
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
