Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8A2CE7B09
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 07:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+ssJbIl2wFPBaslJNLrU/UYuErFvNyWdWeq49ocGbUQ=; b=vNVAptfY7bZZpd
	hgXhcPwMHrDFCjkz4r80mLE3Y6cE2uFiPlbQPePyj5g8eJEkk9gPX9cEg+NuCiNpG4htB3u09yhsb
	+UBzyXje7jv8jSNHAqcRghDEPh7ytRpygfspTgDrmtrC16mWBIIijLIcdcwkQU5SnC37U2RfrB0wd
	LHVB6EqsH6zpmMGPrZENhWYprW+M8eq/40RAzjheHLcw8q2+z+XkY2jh9SLyC5he2AvIOZxmp+Fuv
	To98FL5vCUr995HbgBqnkgr0PnsSO0+yxgs37h0yDKrVRMwZ8RcjbK+r7DeW9m/+SjEnrhHXXk//6
	ZE9J97a/1Tg8WN4zBp9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qllqH-002ZEl-0m;
	Thu, 28 Sep 2023 07:53:49 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qllqC-002Z9i-14
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 07:53:48 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 469977F98;
	Thu, 28 Sep 2023 15:52:51 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 28 Sep
 2023 15:52:51 +0800
Received: from ubuntu.localdomain (113.72.144.128) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 28 Sep
 2023 15:52:50 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: Guenter Roeck <linux@roeck-us.net>, Conor Dooley <conor@kernel.org>, "Emil
 Renner Berthing" <emil.renner.berthing@canonical.com>, Hal Feng
	<hal.feng@starfivetech.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] MAINTAINERS: Add Hal as one of the maintainers of SFCTEMP HWMON DRIVER
Date: Thu, 28 Sep 2023 15:52:49 +0800
Message-ID: <20230928075249.109459-1-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Originating-IP: [113.72.144.128]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_005344_581418_C0B0B0D2 
X-CRM114-Status: UNSURE (   8.19  )
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

As he is the submitter of this driver, add his mail so he can
maintain the driver and easily reply in the mailing list.

Acked-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---

History:
v1: https://lore.kernel.org/all/20230718034937.92999-4-hal.feng@starfivetech.com/

---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b19995690904..2376272bbe20 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19402,6 +19402,7 @@ F:	drivers/net/ethernet/sfc/
 
 SFCTEMP HWMON DRIVER
 M:	Emil Renner Berthing <kernel@esmil.dk>
+M:	Hal Feng <hal.feng@starfivetech.com>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml

base-commit: 6465e260f48790807eef06b583b38ca9789b6072
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
