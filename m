Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F8DCCA47E
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 08:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oy0Wzb1F0y4LWFGnaqZCmS0CdkeHXbgQ3+ARZaDdZY4=; b=A7MiyhXrVmGlov
	WZUO9C+vO8oGgMl76+a9DldpzLLzOKb6zzDzCeJlNBgf/Dda6y5AV51ogbhGMxyKqy9Tyauz2hW4H
	5TDzj9epFCNzxE5+pxl1HRwx+nOyBi/pKeo8HZxjx2qmt5+X2bp128xWPnhVyZBTtPF8VpQvGEQ6o
	tej0LLYvJt5EBWh+JJyJbubDYqYllY8cM7GOcPZewf3WrD37D3EmS13aoqnYTv5aNkuIWn7Ahdpzx
	xktkUZKgeM3q8orqzKbz26iLxAcdH8WiwfOD4jKso4uE7EKdP2rp0yPgas6hkfjZUdy7Wi694u4Lg
	DSDZiWRAOyfYWHShIg/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6pDM-00Fuqz-OW; Thu, 30 Jun 2022 08:07:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6pDJ-00Funu-LP
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 08:07:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656576469; x=1688112469;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ko9vKOsJ7sZrLYlGKuINmPgddn22iKvDujCMEuBPRPQ=;
  b=d0wwKtE1JoFjnnsLMsu7K8jHtefeAy9pVTFuRma7A5qsfS/edFyjCvR1
   KZHZO/ZhewLLTV+jUXzxFBrQEDkb4IiikxclmOk+/H2rN8hZhDs0oWbR2
   vReVilWiPI3o2KhfGo8vfFI9cR+spPf69XDAHf9vGkuLWY687/3pgV3sI
   hyAUbpMVNfTV1WMasnJHEaLsFwJuuUbyvHxiuhe11lJVfUIaDRUqWx2dM
   37rhVqJMx5q7IEV/EQIU9RFloBmD0zKd1Q1tC8VKqHJs+/t+/AOFhu9X9
   vBeVGF5iY71KySXht1SRltr0ecafbnZbjuWxY8E9+zHr1o0CPHyTSGXeI
   g==;
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; 
   d="scan'208";a="102426660"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2022 01:07:48 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 01:07:46 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 30 Jun 2022 01:07:42 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Conor Dooley <conor.dooley@microchip.com>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	"Daire McNamara" <daire.mcnamara@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v1 05/14] MAINTAINERS: add polarfire soc reset controller
Date: Thu, 30 Jun 2022 09:05:24 +0100
Message-ID: <20220630080532.323731-6-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630080532.323731-1-conor.dooley@microchip.com>
References: <20220630080532.323731-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_010749_848082_7B4C72B3 
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

Add the newly added reset controller for the PolarFire SoC (MPFS) to
the existing MAINTAINERS entry.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1fc9ead83d2a..7b82ffce6c22 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17159,6 +17159,7 @@ L:	linux-riscv@lists.infradead.org
 S:	Supported
 F:	arch/riscv/boot/dts/microchip/
 F:	drivers/mailbox/mailbox-mpfs.c
+F:	drivers/reset/reset-mpfs.c
 F:	drivers/soc/microchip/
 F:	include/soc/microchip/mpfs.h
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
