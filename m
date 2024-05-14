Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C39CC25B75
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 10:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=InuT65od9pgR65X05T6RR+oqhb4vtybB4k1SYoN+f6Y=; b=2PYTakY69LHSM4
	Rw7hfuXLYv3X1uu1aQAe6ZaxxvA9qI91IIAXOtK9QGdRLcVxOBdSMeG+Hh8c66ajNr8YVZoolJGb3
	2Ouj0iaRc5pGyq66o63hc60/lXgnpiN65PDsvvKTao8Mugh+wVACYx3SasOeUJRKFK2uNhLg0x6LV
	m0jzt4spr8ZnaglBFj0uMLLpQYAZiiBLEjYJme5TNkKghVKQaYW7lITvfuO8migavc5ANJe++4OD+
	Jzerx+YI6USBXteeVT/QHodJWGgURWJlUDsuX8kjDp7jQfCR3ZrLaLMpkmvr2z8/9aV/W8VcIkItp
	o+j+9FRk5avUxr4g37ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6pep-0000000FcMb-0F3L;
	Tue, 14 May 2024 10:45:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6pel-0000000FcL8-2XQ9
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 10:45:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1715683515; x=1747219515;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0/gq0Od8tn/NFYb5S2ybhGqd4qamz5PoX4ti0poIl0c=;
  b=P6bGh7JMyhhiHz25n/SZooK7/F13H88SkzDZCGfd3QDhQTHYt7KSaQHG
   J3XWz4achL+9gz1EMHVH2tRNcbxEDJi1RZHnDjfV28NFR4T0iJK/CL35o
   LlrWju6KLr/WY47VmoVR91o+zombNTp/qYXxulhJXbmY4PlOiGNeAUi2r
   yJELS3kBZUfaznWXwKf6hkCMhV4DDriAGf0RN4w+PV0Qbv5U1I70/x+2I
   95vnlqJ29Y2ndHnCfDB3yNUtO6jJB8QLXKovScwKQvfmR0ESdqomjKx4X
   KzwrjwjFpbBvXYsDESiTpBTBr0RiEDq0Jz5M0J1bFkrwEKmXFzVS9XWGq
   w==;
X-CSE-ConnectionGUID: CRVhllyDQl2XuPQNxlB5Rg==
X-CSE-MsgGUID: p33gXK/ZR+6lRZgA3nAYjw==
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="24625779"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 May 2024 03:45:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 03:44:53 -0700
Received: from Lily.microchip.com (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 14 May 2024 03:44:51 -0700
From: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	<valentina.fernandezalanis@microchip.com>,
	<prajna.rajendrakumar@microchip.com>
Subject: [PATCH v2 0/3] Add support for GPIO based CS
Date: Tue, 14 May 2024 11:45:05 +0100
Message-ID: <20240514104508.938448-1-prajna.rajendrakumar@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_034515_725224_FEB517A3 
X-CRM114-Status: UNSURE (   8.38  )
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

The Microchip PolarFire SoC SPI "hard" controller supports eight 
chip selects. However, only one chip select is physically wired. 
Therefore, use GPIO descriptors to configure additional chip select 
lines.

v1-> v2: 
 - Modified all commit messages for better understanding
 - driver - added spi_is_csgpiod() API to address review comment
 - bindings - fixed bindings to set the default value of num-cs

Prajna Rajendra Kumar (3):
  spi: dt-bindings: Add num-cs property for mpfs-spi
  spi: spi-microchip-core: Fix the number of chip selects supported
  spi: spi-microchip-core: Add support for GPIO based CS

 .../bindings/spi/microchip,mpfs-spi.yaml      | 29 +++++++++++++++++--
 drivers/spi/spi-microchip-core.c              |  6 +++-
 2 files changed, 31 insertions(+), 4 deletions(-)

-- 
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
