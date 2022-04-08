Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04C6C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 14:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cvBE12IdBYjKPaDHb1Zbtyr0GuXpteMONf8vtjXWcEU=; b=UiETe51hVXsCXP
	GT9YiywYoGSYxcHwd8hnXJ1EaRdBM2xpUaKUdJMZcNHz+FWfxFDIK/1OZOC0RNo8velhO0q0Q199U
	YPQykPGvmRcD8IT7pru4nlOuL4n/QxM7X2rVFHkyoj2w+bU6AM51nug/L1Kp46xHIYo7uQsAcjR54
	zy0d9CGBZ7GHs0yd0/SII6W6wX1ETiIxXzTgndxcdrxRPOP8Ezt04iyZrgjMLAWIAoVOBA9pv7Uxs
	cbHGIzy5BI8ysmAtTYsI5SaF8bWQ1Ao+hmX0J5j4DGKAoNsaeRtaxyx9lOiisHseXFvR8TAihNSrP
	bsnJdOf1dyGXdDtc/DbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncpkI-0000es-7n; Fri, 08 Apr 2022 14:37:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncpkC-0000ad-UF
 for linux-riscv@lists.infradead.org; Fri, 08 Apr 2022 14:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649428669; x=1680964669;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Jo7U3pyaqboWoRpS9duDleK5OsBJt/5r/x0gKendpq0=;
 b=XjQGgSNZMy7N2zGUruSInmZS3TcF7e+0lSVoUfwcX7fhfliRfJL1IvOe
 lvXCmTFVKjhuKIGLAAKIgDXJdw8l11sWtf9DSyN+UItPbqqsy+HQJMTbZ
 BSi2b3vJ6F823O3MtBRRTQi/eg9gkcG31s5/UuE/HIV9Uzflvy6ycZZJu
 NwPklFt1eDaJVZEWgbOiSVbI6qEjRKTdjpU7UKuHjF/ukLrJQmq4cdZ7l
 8Jl3kPezUpKwZg2/doUga65sqjR5IAdS54vC1XnmdNTg4eENm409b3FFp
 kzLD7bYE/oqFZv2s/MgkUU97teS4rVT/nIUfrLkXiCdqqK0+egXjC8vhY w==;
X-IronPort-AV: E=Sophos;i="5.90,245,1643698800"; d="scan'208";a="152027955"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Apr 2022 07:37:41 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Apr 2022 07:37:41 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 8 Apr 2022 07:37:38 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <aou@eecs.berkeley.edu>,
 <paul.walmsley@sifive.com>, <palmer@rivosinc.com>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <daire.mcnamara@microchip.com>, <linux-rtc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1 0/7] Add rtc refclk support for PolarFire SoC
Date: Fri, 8 Apr 2022 14:36:40 +0000
Message-ID: <20220408143646.3693104-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_073749_061807_3BAEB2F5 
X-CRM114-Status: GOOD (  12.83  )
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

Hey,
As I mentioned in my fixes for 5.18 [0], found out that the reference
clock for the rtc is actually missing from the clock driver (and the
dt binding). 

Currently the mpfs clock driver uses a reference clock called the
"msspll", set in the device tree, as the parent for the cpu/axi/ahb
(config) clocks. The frequency of the msspll is determined by the FPGA
bitstream & the bootloader configures the clock to match the bitstream.
The real reference is provided by a 100 or 125 MHz off chip oscillator.

However, the msspll clock is not actually the parent of all clocks on
the system - the reference clock for the rtc/mtimer actually has the
off chip oscillator as its parent.

This series enables reading the rate of the msspll clock, converts
the refclock in the device tree to the external reference & adds
the missing rtc reference clock.

I assume it is okay not to add fixes tags for the rtc dt binding?
Since the clock was previously missing, the binding is wrong, but
idk if that qualifies as a fix?

Clock driver changes depend on the fixes I sent in [0].
Please lmk if you want me to respin into a single series w/ the fixes.
Thanks,
Conor.

[0]: https://lore.kernel.org/linux-riscv/20220408133543.3537118-1-conor.dooley@microchip.com/

Conor Dooley (7):
  dt-bindings: clk: mpfs document msspll dri registers
  dt-bindings: clk: mpfs: add defines for two new clocks
  dt-bindings: rtc: add refclk to mpfs-rtc
  clk: microchip: mpfs: re-parent the configurable clocks
  clk: microchip: mpfs: rename sys_base to base
  clk: microchip: mpfs: add RTCREF clock control
  riscv: dts: microchip: reparent mpfs clocks

 .../bindings/clock/microchip,mpfs.yaml        |  11 +-
 .../bindings/rtc/microchip,mfps-rtc.yaml      |  14 +-
 .../microchip/microchip-mpfs-icicle-kit.dts   |   2 +-
 .../boot/dts/microchip/microchip-mpfs.dtsi    |   8 +-
 drivers/clk/microchip/clk-mpfs.c              | 205 +++++++++++++++---
 .../dt-bindings/clock/microchip,mpfs-clock.h  |   5 +-
 6 files changed, 199 insertions(+), 46 deletions(-)

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
