Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDA9C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Apr 2022 07:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LKBO5EOqgv7nMnS0jrmxzWoZuvC3gPA/D+VjsJ0xuZU=; b=ByidyFJI4FkwUT
	stPibGHo5OFVpsIHKeemL9wASRx0N5xMg96krSDGSMygH+E62b9QApGnOsMHQZwXIwxr2wtClkyUi
	LuBOfqdXKjDKX1B8un1kH0tq9gdFDJITjz4aAw3P8PwtyDvaJ7407lUetrasmWSf/MkEkaIi/WDGg
	SlmAmIr+0QNt+RWWcpS+pOL0GsDvM9FgzRNcZYhHF77IpLT1+X55wHW/MlPQqxi829PrN5qond8jF
	NcAzpVXYsefXWFjiS46LWp2pc7yZsKFu6Ae5EntsQqgdXwdqaAb5c3dIGXqEHOk47sIR/qdsumIdP
	zBz04ZrkUsc0V7+G5Iww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhngI-00GnDO-Ak; Fri, 22 Apr 2022 07:26:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhng9-00Gn5b-35
 for linux-riscv@lists.infradead.org; Fri, 22 Apr 2022 07:26:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650612370; x=1682148370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oONwt6PougIPFBTUqwAmCSS1mJpqCyd7Jt1lRNAHxAI=;
 b=mnYlevI8eJj1n+YCWTJZ6Z9YY/RaDFNGND/bMnNk6pNc/Mcg16EFN0f3
 7HCNQ1JabJoRf4GX1HLVyu/K+hoA6i2fQ0oatKy41r/5/2zOLuwrjcJFq
 VOAx5qJOhcN1qm1MWGueI/TRRjqF6bD5ga0wCXPnjTs5dPppJKb1IinZ5
 8N5GjdRj3SfcjCfb7z3H69aD28YOZo42XrB1yAZplyTQc1htEyZN7/F0n
 1HU9bJm6tvUdF9OIPt8OzZfMkrHBZ6JZazZYIW+zPAjKjI5BA3FThyZdt
 wu77GfPVhEmCRVRn8Jgv7t2YHp8ma2HJoL/oRSOlIzDnaGqvUZ0k0I7FS Q==;
X-IronPort-AV: E=Sophos;i="5.90,281,1643698800"; d="scan'208";a="153462824"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Apr 2022 00:26:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 22 Apr 2022 00:26:04 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 22 Apr 2022 00:26:03 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <daire.mcnamara@microchip.com>,
 <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>, Conor Dooley
 <conor.dooley@microchip.com>
Subject: [PATCH v3 3/4] riscv: select vitesse phy driver for polarfire soc
Date: Fri, 22 Apr 2022 08:25:32 +0100
Message-ID: <20220422072533.2582084-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220422072533.2582084-1-conor.dooley@microchip.com>
References: <20220422072533.2582084-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_002609_208491_7FFFE509 
X-CRM114-Status: GOOD (  10.35  )
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

There is a Vitesse VSC8662 on the Icicle Kit, until a better option
exists, select it in Kconfig.socs for SOC_MICROCHIP_POLARFIRE.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

---
Palmer: You said to put in a comment, but I have no idea how Kconfig
expects a mid line comment to look. kbuild didn't seem to complain about
what I did, but lmk if that's not what you meant.
---
 arch/riscv/Kconfig.socs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 7f93c729d51c..50f2c686d303 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -8,6 +8,7 @@ config SOC_MICROCHIP_POLARFIRE
 	select HW_RANDOM_POLARFIRE_SOC if POLARFIRE_SOC_SYS_CTRL
 	select PCIE_MICROCHIP_HOST if PCI_MSI && OF
 	select SIFIVE_PLIC
+	select VITESSE_PHY if PHYLIB # present on icicle kit
 	help
 	  This enables support for Microchip PolarFire SoC platforms.
 
-- 
2.35.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
