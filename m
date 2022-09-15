Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74341ECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 13:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=stqad1zAIFGr4tkFfx2VbSEYEZYrM9LX4+4WoWsQC6c=; b=i8/cZzehawA5wy
	9fK+aLnM+vhyxWvydYQ4D35fAsD2Jy8fA2cXn4e4gvjvTrpzUxQ2svxuuLo2w1NPiWGBZh1KtZqrc
	tvmxFBdFJWdgyOF9qylAuI7qRJNkwnqrPac7RG5utKGqYZ3RdJmWXUOydJa5HkN1UG4wJ7aHvINmo
	dFOtdINU56OzfkqbVOX027xaBVg0vfzMdUWfbcD1dFYfzslJyFQ4PpB5CL4svC9QCrWuIGj13qA3d
	HkT5SCBjoT1/bve/WagVOupWrVJgg4UQZCUGoKd36ttiXoarmOuR6aD8jB1QwxM60KJxNFVssgJ4U
	VWJjoz44mQX00mFGAvqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYpIP-009mTZ-Hf; Thu, 15 Sep 2022 13:52:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYpI7-009ly4-03
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 13:52:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663249952; x=1694785952;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qNTf/fEg8wubvKF39b6L46iyHFBcPA4/o2SKZONT/Lk=;
  b=dNJMzJM01rwwyyBBcjJctJ3GR2CSEtyhaUmty7qf+VDv73Vpl41YIbeq
   /0JFPSnpQTCiQ8Rdd5SASw1Ccx6aWcuKCLNhCrIauqRMXtFz4QHlY7hLg
   igyq7Mc6BHnG226nk4cof/ekiopxayeg+6h/zyqagbNAILb/NNMrVYFuk
   HxKfdZXZjSmPJ9jtIgP7KXxVOd7muEJLPRt9jxbT8yF3wEbwvmMLBunAL
   RNTV7eAhcK9qPahrZrRG52FRz6gERKKbdcTPAxy/di8fQusygMHMhnSuX
   eIm8iI6oRTU76EIVEbSvFA+MDL4wXQJyd+uEXXbGJfzKQDW6QC/NzRE9u
   g==;
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; 
   d="scan'208";a="180531560"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Sep 2022 06:52:28 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 15 Sep 2022 06:52:26 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Thu, 15 Sep 2022 06:52:25 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <conor.dooley@microchip.com>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Lukas
 Bulwahn" <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: update polarfire soc clock binding
Date: Thu, 15 Sep 2022 14:51:49 +0100
Message-ID: <20220915135148.2968422-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_065231_129477_F8D75AAE 
X-CRM114-Status: UNSURE (   8.08  )
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

The clock binding has been renamed and a new binding added for the
clock controllers in the FPGA fabric. Generalise the pattern to
cover both.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
The maintainers addition of binding coverage landed as a 6.0 fix via
soc while the binding was renamed in patches pending for 6.1. I'll
send this via soc for 6.1
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c26a5c573a5d..170acda52f03 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17618,7 +17618,7 @@ M:	Conor Dooley <conor.dooley@microchip.com>
 M:	Daire McNamara <daire.mcnamara@microchip.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
-F:	Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
+F:	Documentation/devicetree/bindings/clock/microchip,mpfs*.yaml
 F:	Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
 F:	Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
 F:	Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
