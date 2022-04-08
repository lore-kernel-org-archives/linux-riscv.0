Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9929C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 10:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=euf/2Zv9OzvfCDg95DX6McEswmsJzWLgETl2ocnbXGs=; b=0/ibkl5Dy0KTpX
	cU3RHcEjV4FhtDgbBwXyeHU/mf1WU1MunV31jEi/hm+tizVgw/OdbdBgK2vHNntFDaVxahe734I5k
	iFdfdnjQzThqhe+B8xnoWje4yNNb//kKtfVCyNf8raikUEbYFH9igzI8Kghl4tEMvUb3bdBJvGsMy
	oVNP7P4/Dk0UcjX/9nJ6FISwMT5+5Y4aIbvUEIBGLzWIPAKI1itwYhsj1VXurz90Ai20ycjwZY+AQ
	ZIkzNMO6OC7OTdUFjvv9QA6Da+a9wThMuRp7yVGhkPUo4zP9p4NxMbhsoSnxPBdWMnhXdpLd+We4D
	eEU/prBs/1MtRJsfjqqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nclZ8-00GHeE-LI; Fri, 08 Apr 2022 10:10:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nclZ5-00GHbt-Qz
 for linux-riscv@lists.infradead.org; Fri, 08 Apr 2022 10:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649412603; x=1680948603;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PRW1z5BDKUyVp87gb5BA0bIYa/nZ8N7XjvhnUwpnBG8=;
 b=ORp7w1EO8w6AgFZuHHGE6UaLYt7NRhs6sledg1jdB3se4hNUVyIaRlq2
 0G7UvWmmh6HU4IhzEjPjK5PIeJxGdFcA4ZAHCcLTgbzL/rgbbSVP/j942
 An4yFwSlOkaD3b8JYHIdV1QybJ0k+6+CfgLFoGFfgf2Y/0QXWw9GrvCLX
 NEWyacOIrqpnfm5MPvCLBDRMVvzWZ/0M4CCoFBMJLjOhGx6Jo0vWCzIdg
 Mr2eCG8xfrzF0yYz/QxKUpW9IoVPu2TZ7XQmRC1HULT6mmictKE4ZkD/z
 1S9zHGR2SM0ZtJZMLxPg2TpshrhrIrXdScanIh6okOGGMz41t+FhqF8yS g==;
X-IronPort-AV: E=Sophos;i="5.90,244,1643698800"; d="scan'208";a="91749499"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Apr 2022 03:09:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Apr 2022 03:09:57 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 8 Apr 2022 03:09:56 -0700
From: <conor.dooley@microchip.com>
To: <herbert@gondor.apana.org.au>
CC: <linux-kernel@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [v2] Add support for hwrng on PolarFire SoC
Date: Fri, 8 Apr 2022 10:09:11 +0000
Message-ID: <20220408100911.1638478-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_031003_979706_CD0FA986 
X-CRM114-Status: UNSURE (   8.34  )
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

As it says on the tin, add support for the hardware rng on PolarFire
SoC, which is accessed via the system controller.
I dropped the maintainers entry change that v1 had, I will send a
single update via RISCV to avoid any conflicts.

On v1 I replied saying there was a refcount issue, but that's not
actually the case, so no changes required there.

Thanks,
Conor

Changes since v1:
- Rebased on v5.18-rc1
- Dropped the MAINTAINERS change
- Added quality estimation

Conor Dooley (1):
  hwrng: mpfs - add polarfire soc hwrng support

 drivers/char/hw_random/Kconfig    |  13 ++++
 drivers/char/hw_random/Makefile   |   1 +
 drivers/char/hw_random/mpfs-rng.c | 104 ++++++++++++++++++++++++++++++
 3 files changed, 118 insertions(+)
 create mode 100644 drivers/char/hw_random/mpfs-rng.c

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
