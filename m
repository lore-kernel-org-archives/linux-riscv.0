Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82900C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 11:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mWhVKDIYPUyDNV9In9sEJbfogVWM1r8B7WcIeQXA+O0=; b=ilRjoh5i4i7lIj
	U3gOxI0UEIEdbsGNsPyML7QlGUft+6k/q7mf+2iSKEFoqiz2AJc36b4es4rQpAj4OMb+j6Jb67zd7
	OYhanRDLKOhyGDh99zHv3w0DqzOtQURQy88PBzzg1dpIKRGfutB05E4bZIx46kNkZazj/faKnrgs5
	3+7M090LyBu17yExY+56ffKn0faLY2AGJioWMMeh5iEWFCE5jrgcXFPoSOdL24/K8N3YDqQmIaEdg
	CbXcanF8jgcAAWd1nCb60mYRrzC0AZ4o1khsJf0ioQoLRB1/uQKQCtrC0Zecn/td2NkTccWYG0der
	ukLpjvMdx94dUyhIRmLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0iYf-003Lhv-28; Mon, 13 Jun 2022 11:48:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0iYb-003Lgj-BB
	for linux-riscv@lists.infradead.org; Mon, 13 Jun 2022 11:48:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655120912; x=1686656912;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ip7LDyLvG35PweXXiZXDcl0rYNLBHjbyNoPhnAv4A5k=;
  b=MdWGPN/V+myrY7kUYvtjXXHwALR+g8ROBB301URWx/FHBDEOjF+cSrxH
   injZ50koQp22rH4xw06AmPZTSfDRVvC59fsvX1L6biwYX05+P3AhHAFbp
   7f9JIBJxVeLcAaBWhix9vK3oaTa0xCO30jLFHtWOmSPcpJOvPrQxKXRJs
   zc/JolCsOXPuGRj6K1bXsv8NaPLrBSyfVJSef/y9LH8agscA+TSSZTwDr
   oeEOVn9OP1vBDo7vSYf0G25ifhD9OqIDJyUq/hYRPqFXCWx8G7NnwZGRv
   N9NEnhXBSNgGbhR3zeRMBBjvS9Liz4lKBiU1rYnD0Yd4Dy42IlTLDvAFm
   g==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; 
   d="scan'208";a="177684159"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jun 2022 04:48:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 13 Jun 2022 04:48:29 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 13 Jun 2022 04:48:26 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Valentina Fernandez
	<valentina.fernandezalanis@microchip.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Ben Dooks
	<ben.dooks@codethink.co.uk>, Heinrich Schuchardt
	<heinrich.schuchardt@canonical.com>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v2 0/2] Add support for PolarFire SoC's musb controller
Date: Mon, 13 Jun 2022 12:46:41 +0100
Message-ID: <20220613114642.1615292-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_044833_406550_6971FDF2 
X-CRM114-Status: UNSURE (   7.98  )
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

Hey Bin, Greg,
Short series here adding support for USB on Microchip PolarFire SoC FPGAs.
The kconfig dependency for INVENTRA_DMA has become a bit of a mouthful,
is there a better way of dealing with that?
Thanks,
Conor.

Changes since v1:
- Drop unneeded resource copying as per Rob's changes to the other drivers
- Drop the dts patch

Conor Dooley (2):
  usb: musb: Add support for PolarFire SoC's musb controller
  MAINTAINERS: add musb to PolarFire SoC entry

 MAINTAINERS               |   1 +
 drivers/usb/musb/Kconfig  |  13 +-
 drivers/usb/musb/Makefile |   1 +
 drivers/usb/musb/mpfs.c   | 265 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 279 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/musb/mpfs.c


base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
