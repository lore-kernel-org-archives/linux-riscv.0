Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05275C43334
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 13:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4nSEBguGA7+WhirEKnlpGhr5rxj6CaNZveIthF4lpmI=; b=Drxg02LbCWEGKy
	7+qsyqmhwpymoj3XIW/IxKfxZJvF6v1PAn8x/6WXy7OrAtDzn9/Ff+NdTYDJvd45WNiI1j4Ui//mN
	DdjtmcRhDbpShOut2Lh3+C7AJl4FSxWd+mTceau5cSUhWgY2gn9TpZn3aW9Q1EIj8oNiHqUjhShWo
	P6r8IhsTp5y7ac/L7/belYqussftBTQDtZDAuta40i0P9cIiI3FMHYnWJTxPCX2vYxJTPaC6KJ+z6
	9rBpB+l/qtZVdtybCUDAKG0tFNn/ZX+Kvvu7Y0M9/EMjq1IORfA4Bcd51k6vyt6S456SNfB1ct41c
	uV901KOC78FDllzh13gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8ivZ-000bGa-Ka; Tue, 05 Jul 2022 13:49:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8ivX-000bFj-Ch
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 13:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657028959; x=1688564959;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Zpwn3EoTc9k3nqn9MzHBE55S0Zot3Sjy+qJz3HwwGL8=;
  b=mvsNZgms6BGIXc+SM9vDNScuVLTXU69Z9guOdvbrEklFRs7c0dIRD2Va
   6BIqEukjgIVz+bQKVwgTBBEppFXOQ0tmG9RFP+fqikuChqX8m0woHT6qc
   T3fR5seGbXDT6embvzs1bhNw8gOD68P4PBH70VgCtY7sw3TlNVCt/Xkri
   xy+X4VUj76YLKxQChgmZXDswwRVfTEeWkcZQo5fhNCFah8ni2oUl5cJ+r
   VrOE/JShB4K1mrdbqcOsuh5DQCoNfcENw8fp1heoP3ucx02zaS13SdXtz
   tKc75ZuTUSqZi6gmchcjldSAskFTqjoHfsSnAt8E8TiaQpNxKUw+zQVSk
   w==;
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; 
   d="scan'208";a="170824115"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Jul 2022 06:49:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 5 Jul 2022 06:49:18 -0700
Received: from dev-powerhorse.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 5 Jul 2022 06:49:16 -0700
From: <lewis.hanly@microchip.com>
To: <linux-gpio@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <maz@kernel.org>
CC: <paul.walmsley@sifive.com>, <conor.dooley@microchip.com>,
	<daire.mcnamara@microchip.com>, <lewis.hanly@microchip.com>
Subject: [PATCH 0/1] Add Polarfire SoC GPIO support
Date: Tue, 5 Jul 2022 14:49:11 +0100
Message-ID: <20220705134912.2740421-1-lewis.hanly@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_064919_474472_52DBAD17 
X-CRM114-Status: UNSURE (   5.12  )
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

From: Lewis Hanly <lewis.hanly@microchip.com>

Add a driver to support the Polarfire SoC gpio controller.

Lewis Hanly (1):
  gpio: mpfs - add polarfire soc gpio support

 drivers/gpio/Kconfig     |   7 +
 drivers/gpio/Makefile    |   1 +
 drivers/gpio/gpio-mpfs.c | 358 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 366 insertions(+)
 create mode 100644 drivers/gpio/gpio-mpfs.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
