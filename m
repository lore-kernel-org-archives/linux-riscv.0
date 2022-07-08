Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C662CC43334
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 14:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j/WYihHfuAkEp73U+jgvUpbz41ptEx9l10jI1SxFlo4=; b=Sicc9dGGIaFjWG
	QGlRoAilF1cvaFNmpoYiGEqtI/a/A/iq4RmXZYFss1OiFjBR8NouW9IFGGFiyvyqzwGbb9NC/uVQs
	An7TSxR09hwARsh2s3dRxJm1xMeO5hjp0DIedjGINxu0wJ8NRSnUFw8slBtSKj3EbMUl1xes3njzc
	z7rKx8cvtez9dEDO39Plpx7m2o5nm2HxZISbob1WfAiT+sFPoiPRpM1vVqwr6z/sQ3I7SDvUA3Lcj
	rhEVkxaDf1Qo646IKAcmWBAaleoQG+EhgzVIPBiJQQqdoBh1XtRcp6k9rmoswEF23tHrdNLvESvdI
	jfR8UaU14KuVZH8cV4gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9p8v-004BDz-N3; Fri, 08 Jul 2022 14:39:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9p8s-004BC1-QG
	for linux-riscv@lists.infradead.org; Fri, 08 Jul 2022 14:39:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657291178; x=1688827178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fnl5CGvXmbwoIcy91psfgiwxnD3o6LZLHepJqwb/OE0=;
  b=MT6VnbTN83Fg9w/bDM6+Zo8okf/PxwTxsybkmUj/r3W9g7vb7XTUihYi
   byEAJsw3Jwi+zDBijfznrW4nWsu7X7YzTdzWf5ze77cv9FbyXZHmYxR6a
   zCpixcuBVN0s49yu4nJllEgLJX7SpD9RV8ZRkFc5fLf1SbhwLyK6C3MWP
   lJc6QJXHPqz9EfH49uoiXPGC8hqAVRwWnnUrO82HPOGdwchCb1IzoSf85
   DPzdoBpO20AssIfUJHp/Z29TpRy9QwtImVkX292CnGayWAdxGgGmNFwdm
   Mpn06MpANnn1sDhFWd1zfLRf4RrE666Dhhru2IFuud3Zctm1D5kKAsTHK
   A==;
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="167013024"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Jul 2022 07:39:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Jul 2022 07:39:33 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 8 Jul 2022 07:39:31 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Lee
 Jones" <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v5 4/4] MAINTAINERS: add pwm to PolarFire SoC entry
Date: Fri, 8 Jul 2022 15:39:23 +0100
Message-ID: <20220708143923.1129928-5-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708143923.1129928-1-conor.dooley@microchip.com>
References: <20220708143923.1129928-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_073938_921526_EF76B485 
X-CRM114-Status: UNSURE (   7.53  )
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

Add the newly introduced pwm driver to the existing PolarFire SoC entry.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d64d79eb36a2..f023ae8442ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17429,6 +17429,7 @@ L:	linux-riscv@lists.infradead.org
 S:	Supported
 F:	arch/riscv/boot/dts/microchip/
 F:	drivers/mailbox/mailbox-mpfs.c
+F:	drivers/pwm/pwm-microchip-core.c
 F:	drivers/rtc/rtc-mpfs.c
 F:	drivers/soc/microchip/
 F:	drivers/spi/spi-microchip-core.c
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
