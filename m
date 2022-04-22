Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30ABFC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Apr 2022 07:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KXiwLtstZeX158FBzfaznRSl8jm/lQspfceXccyIn6A=; b=veu4FxuTUFTops
	lvQSVT6I3r0yx/25CYxWGjnDhTycBN9f7YFJXlScTT9L2295xjIADEITDyLKvm//DeZqOGmfXw8a1
	XBe1E4+Bg7YKQCFcZqEOLMP25RkhJaGNHGWRKbqTebrP7UYZeofBnxVioNurgZYxUHiSrXhvwTXNR
	I8l9QlzzFXp8gjGrdF+H8ve+vMYl8eQyibOc6d/IZZBepBGy2fCAJyUaDzkwxoV8dDOCoKDDFGBk+
	l5hHmyz6WfrrJ4/z9HOHooQylr/kG6vDHbL4j3AcBdKmkDBdbkw9BOITQKuhJze6+Idq66nNnBRl2
	MPvXtqcYnlMU9gYq+VpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhngC-00Gn9b-Or; Fri, 22 Apr 2022 07:26:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhng3-00Gn56-40
 for linux-riscv@lists.infradead.org; Fri, 22 Apr 2022 07:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650612364; x=1682148364;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/YpfyL2u+t1gtrxzfg5VIROIwt7BOm7moe9tHDT1Pfo=;
 b=wXFoSNBC4G6TH9XlPiJ390bsI130h/Fn5qdKg23uOBG9uMwHnHCzFhxu
 1y9uVpuMdoRrM6cyz8t+60KzJw/xGnsJOIE7a+V48Bhzbu1P2C6xeskvO
 C2OL07iB93MkDz+D0ERl7PzdQxsjK8jB+qawNencVpwwGwhkHFeSn8iib
 7ANeewQbzESFZRCV1s7vxrIhvRXMbqTrtdIQZIsmUm2tAtcF5VgPIaTht
 471Ne/cpdiy/dww3r4PHOls1k5BTjftMLWBLjV/jZXqAjj0WYsimhEE/9
 +b/dHdVpcV2z2WYXAoYeqGxnKR/aylYQSLyJN18W0Pl4I8544SaRSHwNy Q==;
X-IronPort-AV: E=Sophos;i="5.90,281,1643698800"; d="scan'208";a="153462789"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Apr 2022 00:25:59 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 22 Apr 2022 00:25:57 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 22 Apr 2022 00:25:55 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <daire.mcnamara@microchip.com>,
 <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>, Conor Dooley
 <conor.dooley@microchip.com>
Subject: [PATCH v3 0/4] polarfire soc kconfig/maintainers updates
Date: Fri, 22 Apr 2022 08:25:29 +0100
Message-ID: <20220422072533.2582084-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_002603_311806_46A7297F 
X-CRM114-Status: UNSURE (   9.38  )
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

Hey Palmer,

As discussed, Kconfig.socs updated with the recently upstreamed drivers.
I took the liberty of also adding them to the maintainers entry.
The hwrng isnt in your tree, but was accepted today.
As you suggested, I added the vitesse phy driver in the kconfig.socs
entry - lmk if you don't like what I did with the comment.

In v2 I have replaced Lewis as a maintainer with Daire, since he is the
original author of the clock and pci drivers & a co-author on a bunch of
other (upcoming) drivers.

v3 makes the vitesse depend on phylib to avoid the lkp reported build
errors

Thanks,

Conor Dooley (4):
  riscv: select peripheral drivers for polarfire soc
  riscv: config: enable the mailbox framework
  riscv: select vitesse phy driver for polarfire soc
  MAINTAINERS: add polarfire rng, pci and clock drivers

 MAINTAINERS                  | 5 ++++-
 arch/riscv/Kconfig.socs      | 5 +++++
 arch/riscv/configs/defconfig | 1 +
 3 files changed, 10 insertions(+), 1 deletion(-)

-- 
2.35.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
