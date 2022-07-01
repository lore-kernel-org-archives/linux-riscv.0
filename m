Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5789C43334
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 06:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sTR+1G7G5LyOiahRuD8Uk/7qBjFXB2fvM+TAlz0J25o=; b=AAFWTTRZ/19muP
	HBWl8AQtTY9WtUQL6volTb2ORajbiqkP1XgbiMG19w/MMrKwqBuLCiZsf6UM9EH6CIKDa7B47ZmH+
	1a4LOtUPeXUG/aKeTMajNSblBW9xIbJDI9GGEdKbo3J46YPMgAWkR49L5b65dExMMhmUDS1/ZX1F8
	nrjux3lFJ3XBFZkZwSFyBeF04J/flcE5bUCn9J1vn0AvLlXCjRxdYg5I8jz9GU3OGDalVim9otLzI
	7y7TZugbSEh3QvuNr2NyiKjTuj+jxd+QJL9853ILr72h5ne8/no5gMSLA8qSTyZkQdX+0Q96aX66y
	blgmBF3xkWVcvTKhlLbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7AcB-003I9H-GY; Fri, 01 Jul 2022 06:58:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Ac5-003I5k-Qq
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 06:58:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656658729; x=1688194729;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9rml+Sm/loPs16VC7h+57zxkeT7atJLmjKj6lEjZoi0=;
  b=jcSr+18PbT6WwU7KC4Fv5BTjg5aExFKS7e+2ErR9kWgfLFJ5rp5Rrbzx
   sOBEI0XMzixg+DiXsa5N5tbgr1L68ght5uCftpD7H191bjWo5MpavXCoO
   X/cjhh4hA/U/wJXr58Ju4gfJlIzIvj5Fg5+M4m+oV0hCP3wiYMqebCf8b
   fxlyBglwLthrELqs0uMhNcV7sg54i/p/wvsIYfbyGBU0wDjueKe3mIz6m
   RdvwMA+QCd6DXIFBmQg3leU2jlfy7AEaIlJygFIgX7AMKdBzoJTzjiSRh
   vnfaqsFQpwsNLWvrTHCe8YL1Z27Ok+1i3Hn8kDHXcewEe1jlOdZB+cktE
   g==;
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; 
   d="scan'208";a="165961228"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2022 23:58:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 23:58:44 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 30 Jun 2022 23:58:41 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Conor
 Dooley" <conor.dooley@microchip.com>
Subject: [net-next PATCH RESEND 0/2] PolarFire SoC macb reset support
Date: Fri, 1 Jul 2022 07:58:30 +0100
Message-ID: <20220701065831.632785-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_235850_026187_BA8E4D6F 
X-CRM114-Status: UNSURE (   7.60  )
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

Hey all,
Jakub requested that these patches be split off from the series
adding the reset controller itself that I sent yesterday [0].

The Cadence MACBs on PolarFire SoC (MPFS) have reset capability and are
compatible with the zynqmp's init function. I have removed the zynqmp
specific comments from that function & renamed it to reflect what it
does, since it is no longer zynqmp only.

MPFS's MACB had previously used the generic binding, so I also added
the required specific binding.

Thanks,
Conor.

0 - https://lore.kernel.org/all/20220630080532.323731-1-conor.dooley@microchip.com/
Conor Dooley (2):
  dt-bindings: net: cdns,macb: document polarfire soc's macb
  net: macb: add polarfire soc reset support

 .../devicetree/bindings/net/cdns,macb.yaml    |  1 +
 drivers/net/ethernet/cadence/macb_main.c      | 25 +++++++++++++------
 2 files changed, 19 insertions(+), 7 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
