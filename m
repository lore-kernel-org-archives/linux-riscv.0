Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BCAC6FA8A
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 12:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mb1b6fDmSk+J3PCr7aZFHgQm6zned0UlDyXUZhRW830=; b=LxeuchtKMlpge0
	17GOF9l5nyEMb9rgJg1rGmzcMp2mejhcr3JohwKg/6q+EbDFGwTou8+/67b9o3pqe6cO8YfYZqEAO
	ffZQm4ssQ75XHvOSB0U0+YJe0Sq9lFjnC2bZE5IKgfPq9att3xiUv/pFhWVYc2cDN3DfPSmWJDSvL
	I4NtzNxxYZlIUSc2BXoWd5dQE5rca9mQF+m4/a5ICHThj5OiFJPwxs1DMl4AtCjxUdwIg0Sv4aRVa
	g3pmezncp4VeQV3V1jWbgz7P5aYRyMFnEOMgFVo3dKtCQB8P7zvsCAhgB24tkthCCQD2QjKBJCqca
	UaN9FqJOyyen4yk0dBmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWdBB-00G2Fq-2d; Fri, 09 Sep 2022 12:32:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWdB5-00G28a-Ec
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 12:32:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662726731; x=1694262731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7t9fB7n5BXz/TvDnDRUyp7NhU4pUYNzktSxEQMgJVzo=;
  b=AWSSw2JqZsyTZBxYmYU4PBxpGqr05Ze2pjyGfAho9i/U34JCV+tCLnhq
   aEw8oOujl6F6jmDQ5WRMG5lGz4GHfhJsKOMYQx4RwB5avC6DVyEWr67nu
   MUKlPwxW5e8JdY8w4Rmaqw5OvovEKr02LvIQ724I+GAXVYOGO5SOCikiT
   VIzde8eeO4Fp95gux6scA6/jFwuMuYhf5YSFHk4Xiz9H/mXgOKvRdCAva
   NIx5ztJxPjep7tCN0JGrjC/gne1IVvWz91JQM4ySWAGX0tYZ3nf4rti9J
   Q/sLMSMYJ0jy8qM3qi9NBceUszBZM16poyyPWSbeCJ9+4BjHQHxjDz5wb
   g==;
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; 
   d="scan'208";a="176399234"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Sep 2022 05:32:10 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 9 Sep 2022 05:32:03 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 9 Sep 2022 05:32:00 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Claudiu Beznea <claudiu.beznea@microchip.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v5 06/14] MAINTAINERS: add polarfire soc reset controller
Date: Fri, 9 Sep 2022 13:31:15 +0100
Message-ID: <20220909123123.2699583-7-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220909123123.2699583-1-conor.dooley@microchip.com>
References: <20220909123123.2699583-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_053211_579231_49F899EF 
X-CRM114-Status: UNSURE (   8.10  )
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

Add the newly added reset controller for the PolarFire SoC (MPFS) to
the existing MAINTAINERS entry.

Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a5012ba6ff9..6136b1b22e2c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17532,6 +17532,7 @@ F:	drivers/char/hw_random/mpfs-rng.c
 F:	drivers/clk/microchip/clk-mpfs.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/pci/controller/pcie-microchip-host.c
+F:	drivers/reset/reset-mpfs.c
 F:	drivers/rtc/rtc-mpfs.c
 F:	drivers/soc/microchip/
 F:	drivers/spi/spi-microchip-core.c
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
