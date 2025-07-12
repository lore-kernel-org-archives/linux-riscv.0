Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66B3C83F21
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jul 2025 07:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vS8mKbL20fZqJEz2gRvAW0i00oQzKusCZSE57x/nlUY=; b=vBZd1zDmhf2Hgs
	svL1O5LPJMYk9fC98HQLstnYR+mRT9s5b9ExBqC8XEEVznYK2Ey3usOzqSFoWr/7ugvOMLizeGXbm
	wGdAYmey2nvPpy+renbQq0ArMgNwEE0nJxoKiRX9uVzem+nj7cDMqegKA5Y3ojAVRMG0lHcYcr9hd
	wFBbfUrJCpipC6ehUanwQZfk/DJ686QXTMCrcNNJbYgZUeJU88oLBOXxMtzzDExFBj7vgTa7uIYUm
	YORoH0X63h//KBubAx6i88Ozd/19Nil3O//KXUeO3r/ZLHjjirtFOsugs2R0uhQu3YSJtEAw78lAj
	tge5ItsTFuCGCr98veog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaV4v-0000000GNoU-1HY4;
	Sat, 12 Jul 2025 07:55:25 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaUz0-0000000GNLg-00Pk
	for linux-riscv@lists.infradead.org;
	Sat, 12 Jul 2025 07:49:19 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752306555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1hEMfGUsaTb+Yy5uX2svn+tvEyF1FLF6gJK6rBT3z1Y=;
	b=LXfmtrJdfLfu9dm8NC91mhS0flxAQjRDHGW9Z1Y8xedWGzRs4SA/xJ9SXnNnt/5cmgpYMU
	iPyuyV/sI/2GF2ME7nCNXZDWeCuaRW60Mxp4W+UZwcaHCZKsmdioKzP1DxwVJ8hC4grA0M
	SEETsKbyHJ+O1bvhxoVIXa0cYQmMm0E=
From: Ze Huang <huang.ze@linux.dev>
Subject: [PATCH v6 0/2] Add SpacemiT K1 USB3.0 host controller support
Date: Sat, 12 Jul 2025 15:48:59 +0800
Message-Id: <20250712-dwc3_generic-v6-0-cc87737cc936@linux.dev>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGsTcmgC/22Oyw6CMBBFf4XM2pLSpjxc+R+GGGhHmESKtlAxh
 H+3wtblubmvFTw6Qg/nZAWHgTyNNkJ+SkD3je2QkYkMggvFC66YeWt569DGmGal4aJUVSGElhA
 jT4d3Wva6a32ww9ccW6dDhLbxyPQ4DDSdk5CnWc6czuBn7slPo/vsV4La3f9Xg2KcVabVSmKjp
 BGXB9l5SQ0GqLdt+wIpcEWX1QAAAA==
X-Change-ID: 20250705-dwc3_generic-8d02859722c3
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huang.ze@linux.dev>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752306549; l=3386;
 i=huang.ze@linux.dev; s=20250705; h=from:subject:message-id;
 bh=1MuKM66N+VpDrAadh8p/LAH+Y+Guai4ttqwz7vBJaNM=;
 b=dAWAK/ya87gUhcMsd+jqyT5tQZCy2XpKae+r+SrK66YK5bjUiK7HfcRV/8ykUt6jAAWdjQmm3
 Pe5/j1UJ38YANTv8fBdP7fTMUi1SWseq8yCfTy8+oAG4cwU4CMeTuy8
X-Developer-Key: i=huang.ze@linux.dev; a=ed25519;
 pk=Kzc4PMu5PTo8eZZQ5xmTNL9jeXcQ9Wml0cs+vlQpBkg=
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_004918_250266_9B839224 
X-CRM114-Status: GOOD (  12.30  )
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

The USB 3.0 controller found in the SpacemiT K1 SoC[1] supports both USB3.0
Host and USB2.0 Dual-Role Device (DRD). 

This controller is compatible with DesignWare Core USB 3 (DWC3) driver.
However, constraints in the `snps,dwc3` bindings limit the ability to describe
hardware-specific features in a clean and maintainable way. While
`dwc3-of-simple` still serves as a glue layer for many platforms, it requires a
split device tree node structure, which is less desirable in newer platforms.

To promote a transition toward a flattened `dwc` node structure, this series
introduces `dwc3-generic-plat`, building upon prior efforts that exposed the
DWC3 core driver [2].

The device tree support for SpacemiT K1 will be submitted separately when the
associated PHY driver is ready.

This series is based on 6.16-rc1 and has been tested on BananaPi development
boards.

Link: https://developer.spacemit.com/documentation?token=AjHDwrW78igAAEkiHracBI9HnTb [1]
Link: https://lore.kernel.org/all/20250414-dwc3-refactor-v7-3-f015b358722d@oss.qualcomm.com [2]

Signed-off-by: Ze Huang <huang.ze@linux.dev>
---
Changes in v6:
- replace SET_RUNTIME_PM_OPS/SET_SYSTEM_SLEEP_PM_OPS with RUNTIME_PM_OPS/SYSTEM_SLEEP_PM_OPS
- Link to v5: https://lore.kernel.org/r/20250705-dwc3_generic-v5-0-9dbc53ea53d2@linux.dev

Changes in v5:
- drop DTS patch (will submit when PHY driver is ready)
- drop interconnects and update resets property in dt-bindings
- remove unnecessary __maybe_unused attribute and PM guards
- switch to devres APIs for reset and clock management
- Link to v4: https://lore.kernel.org/all/20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn/

Changes in v4:
- dt-bindings spacemit,k1-dwc:
  - reorder properties
  - add properties of phys & phy-names
  - add usb hub nodes in example dt
- add support for spacemit,k1-mbus
- dwc3 generic plat driver:
  - rename dwc3-common.c to dwc3-generic-plat.c
  - use SYSTEM_SLEEP_PM_OPS macros and drop PM guards
- dts:
  - reorder dts properties of usb dwc3 node
  - move "dr_mode" of dwc3 from dtsi to dts
- Link to v3: https://lore.kernel.org/r/20250518-b4-k1-dwc3-v3-v3-0-7609c8baa2a6@whut.edu.cn

Changes in v3:
- introduce dwc3-common for generic dwc3 hardware
- fix warnings in usb host dt-bindings
- fix errors in dts
- Link to v2: https://lore.kernel.org/r/20250428-b4-k1-dwc3-v2-v1-0-7cb061abd619@whut.edu.cn

Changes in v2:
- dt-bindings:
  - add missing 'maxItems'
  - remove 'status' property in exmaple
  - fold dwc3 node into parent
- drop dwc3 glue driver and use snps,dwc3 driver directly
- rename dts nodes and reorder properties to fit coding style
- Link to v1: https://lore.kernel.org/all/20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn

---
Ze Huang (2):
      dt-bindings: usb: dwc3: add support for SpacemiT K1
      usb: dwc3: add generic driver to support flattened

 .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 107 ++++++++++++
 drivers/usb/dwc3/Kconfig                           |  11 ++
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/dwc3-generic-plat.c               | 182 +++++++++++++++++++++
 4 files changed, 301 insertions(+)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250705-dwc3_generic-8d02859722c3

Best regards,
-- 
Ze Huang <huang.ze@linux.dev>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
