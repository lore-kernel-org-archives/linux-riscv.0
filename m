Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE34C07E9D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/xIxfsN6AxZ004W5x3impOErDKshXDmvbCevXeVC8U8=; b=i423U9vXUbnWJb
	vUmkp60wixls1C1jzKi9+bPvQ9Pkfso0Ack+RUavbS2wqzi7Rtv+kIfnwFiLPr1OtWII4+V29QgSA
	ycJ//Oc3RBcnq+q5pb3/cdA7lMrM7y196k+UuxuWdz/bqpveNW7g37OmFXj+A4HoEPm2qN2kjObCh
	SjEoDGmDuHavytN8pfClF30ZASCc2hp09A9Ek7Ar42ztjnA6yiLZ8IOqwUmoZOVxuIEY25Ht116Yf
	iU+3VxU9K9rewke3a0kGrFt1EsRkTdCFjuO0SsWHudZnSYnMtBwIrSc/yrkAx3efo2CRMM3XHx/YO
	RzzcKoZZK2y7fw6zQd6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obntB-005RwQ-CT; Fri, 23 Sep 2022 18:59:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnsD-005R19-0m
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:58:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 81AF562186;
	Fri, 23 Sep 2022 18:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14320C433D7;
	Fri, 23 Sep 2022 18:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959483;
	bh=OLDnqjBAVWfXd36+/Y8XmfjvzSDOHb/7QnXockHoi/s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i31BvVvI0okOM0yYEphFdpjcYOq36tB+j+quwP61SITbqf+5eKmCHLuon0fod8TuN
	 43SPzZswubcOpdpfjTb3dkGFCFG+eH6DfxECC9bXkKQbYaTdlcESZ9eaVz8It0IGZR
	 TMxtyDZAMK98DY503+VxXOkkpgA7ySksK7Yg96D1v3nbs2kW2AVg4/nKLQaxXwuCxI
	 UB5bYj/0A+HAR7BjFtNKruRJw0g9O5ulgECib8JdTaSuozMVVmOXRvmVzQwMQv7ooK
	 JvpBiZbdM0TtTWNvBIMv9S8+SgZ/e3KwrQybK61DkwAIGvTHWODAbII8LBQ1+FhgiL
	 nGvNi2iVtef1Q==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 25/27] reset: k210: convert SOC_CANAAN to ARCH_CANAAN
Date: Fri, 23 Sep 2022 19:56:04 +0100
Message-Id: <20220923185605.1900083-26-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115805_134429_34CC9B18 
X-CRM114-Status: GOOD (  11.22  )
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

As per the discussions at LPC, the SOC_ symbols in Kconfig.socs are to
be converted to ARCH_ for consistency between "incumbent" and incoming
vendors who have a legacy in other architectures.

Convert the SOC_CANAAN dependancy to ARCH_CANAAN. Since ARCH_CANAAN is
only defined on RISC-V, the Kconfig dependancy on RISCV can be dropped.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/reset/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index a69bd6ef3110..576190fbe544 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -94,9 +94,9 @@ config RESET_INTEL_GW
 
 config RESET_K210
 	bool "Reset controller driver for Canaan Kendryte K210 SoC"
-	depends on (SOC_CANAAN || COMPILE_TEST) && OF
+	depends on (ARCH_CANAAN || COMPILE_TEST) && OF
 	select MFD_SYSCON
-	default SOC_CANAAN
+	default ARCH_CANAAN
 	help
 	  Support for the Canaan Kendryte K210 RISC-V SoC reset controller.
 	  Say Y if you want to control reset signals provided by this
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
