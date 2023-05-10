Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03288C7EE2A
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 01:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DCZUojpqhjoZ6/o00HaGQOJ61oeV1w1FnXhB7jogOD8=; b=GdTVgm60aMXOOY
	CKkR88i0GrFckO8NK4CAH26wS1rubAPx+4KheDSXl+A9udHt2aVXgsER3z0IkK88NZT+0q+91sLpL
	pwgQ78fKh1zLT1k2EsUs7ocqECOMX9ryl6sjtvkIksdCPo/gFzKZ7hcWXvvemrwQMpZGcoyRMXTeF
	eY2yFguvr7JOkIJzLXEdjxs4b1KNz3MEQu9LsT5BDLjrEaIRD/8uxD6ZpI7Gsswg6JFrBYcKgbQ0W
	y67Ak8FSHp4w2GEYjklqLdDtHwIScp8262lS38hcKqSIOfdEox/QRQIo4/MhZIEnRMV6a3czJll5y
	F0TPBFzTrlhmmzNZzx7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwZ1g-004igB-1E;
	Wed, 10 May 2023 01:53:56 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwZ1d-004iaR-2H
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 01:53:54 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 5D5AF24E1BD;
	Wed, 10 May 2023 09:53:15 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 10 May
 2023 09:53:15 +0800
Received: from ubuntu.localdomain (183.27.98.219) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 10 May
 2023 09:53:14 +0800
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Walker Chen <walker.chen@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v3 2/5] soc: starfive: Replace SOC_STARFIVE with ARCH_STARFIVE
Date: Tue, 9 May 2023 18:53:08 -0700
Message-ID: <20230510015311.27505-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230510015311.27505-1-changhuang.liang@starfivetech.com>
References: <20230510015311.27505-1-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.98.219]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_185353_893546_C4EA52AB 
X-CRM114-Status: GOOD (  10.74  )
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

Using ARCH_FOO symbol is preferred than SOC_FOO.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Walker Chen <walker.chen@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/soc/starfive/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/starfive/Kconfig b/drivers/soc/starfive/Kconfig
index bdb96dc4c989..1e9b0c414fec 100644
--- a/drivers/soc/starfive/Kconfig
+++ b/drivers/soc/starfive/Kconfig
@@ -3,8 +3,8 @@
 config JH71XX_PMU
 	bool "Support PMU for StarFive JH71XX Soc"
 	depends on PM
-	depends on SOC_STARFIVE || COMPILE_TEST
-	default SOC_STARFIVE
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	default ARCH_STARFIVE
 	select PM_GENERIC_DOMAINS
 	help
 	  Say 'y' here to enable support power domain support.
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
