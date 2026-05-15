Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5C9CD37AC
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 01:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CDh6GpAH7bbvJhJERjwHA55rokAFfVQCYTXbN2YEBqw=; b=QZnKC6jStMg6tJ
	jBxDDI5JfqExZcHoVuBwsEN9dnL0ug0dufk/RTuLtPbFPOJIqVkZ37rHUU+/Y079jc+uTC9DowqS9
	0cl1MktVdEoM6NtIvEkgZB1qG6jsvCaBXqYYyAGX4a7w2tVrlVTh+O/xb7C6Oz1cq3odznmooFHgg
	tJWbRQ+2dUFC7kgKjgbZN3G1wMbjDMzApbtnj6emyYQc36ZLcu3f5kdrL6WESAgq7x3g8l7oi2eU0
	ywzTRLaL/74a60zCunlDxrTOjKVry6Wt6QBXO/j/8R1487CBgpHFEzln73uBKiu1AJhgW72+SPnzM
	5xUpeIhnKO3OiW6u1pZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhC3-00000006znm-0Rz1;
	Fri, 15 May 2026 01:18:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhBu-00000006zgx-1Ck0
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 01:18:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CACE543972;
	Fri, 15 May 2026 01:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0546C2BCB3;
	Fri, 15 May 2026 01:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778807892;
	bh=CIzqu3iSXQE7WxLBaG2FjLAc8gxifDDaK5d1TURsWzw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jFAX2C35WASpbW6IgltgDFQTonP7mjFkOe6XTQvVFgFtOpsPgk8NuXs0ix05a7iyc
	 B+H1ZiWSI/FS/lLCMntHpsCOdV3D/DeulHw1TTHwHdtQN5/G9rEyqQYJO0/S2WahMz
	 VGiaXnwTskSRUABEdq2cczZKsx3BfedV+VCn2oADWigrKLzYbG0NfrYbGF5LGWlODB
	 GqsEB6WUCS52aIxWjyuKGLgKQaUPB1QZpinZRME7yKlXF1Su/AISs+7dkVhTx0bXG/
	 YF3+ZVhs0j53TzUUJuldgICDI9n6WarWYjy2T1wIPLoYuINk0MqyfpCmjkckhJBfNq
	 /gBTIce2oa8xg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB36CD37AC;
	Fri, 15 May 2026 01:18:12 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Subject: [PATCH 0/9] riscv: ultrarisc: add DP1000 SoC DT and pinctrl
 support
Date: Fri, 15 May 2026 09:17:56 +0800
Message-Id: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAER0BmoC/yXMQQqEMAxA0atI1hZqlSJzlcFFjVEj0pGkiiDe3
 c7M8i3+v0BJmBRexQVCByt/YkZVFoBziBMZHrLBWedtXXmzr0mCsKLZOGKS1dAYPLkGm9bWkLt
 NaOTz93x3f+veL4TpO4L7fgAwkAmRdQAAAA==
X-Change-ID: 20260316-ultrarisc-pinctrl-efa6e24c4803
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778807890; l=3939;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=CIzqu3iSXQE7WxLBaG2FjLAc8gxifDDaK5d1TURsWzw=;
 b=Dc3d8WwB4MLDtzdPDDLY4xc9u1QECszdJWuus/oTWcJL6qCseT8wQhfxrgPWTLdMqoNvJ2MJ9
 GoaIZaZQjVpC7juOougB38kb6ZoCx5T2PubrnD9nuZnupQ/FfpHQfw3
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_181814_396807_9D0869AD 
X-CRM114-Status: UNSURE (   9.02  )
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
Reply-To: wangjia@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds initial Devicetree support for the UltraRISC DP1000 RISC-V
SoC and two DP1000-based boards (Milk-V Titan and Rongda M0).

The series introduces the required DT bindings, adds the DP1000 pinctrl
driver, and provides the initial SoC/board DTS files.

Notes:
  - Clocks are configured and enabled by firmware before Linux boots. Linux
    does not manage clock rates or gating at runtime on this platform.
    Therefore the initial DT only models the fixed clocks required by
    standard drivers, and no clock controller/driver is provided.
  - The DP1000 pinctrl binding supports two child node styles under the same
    controller compatible:
      * legacy DP1000-specific nodes using phandle-array properties
        "pinctrl-pins" and "pinconf-pins"
      * generic pinctrl nodes using "pins", "function" and generic pin
        configuration properties
    The legacy form is kept for compatibility with existing vendor DTs.
  - The bindings for "ultrarisc,dp1000-uart" and "ultrarisc,dp1000-pcie" are
    being reviewed in separate series, since the DP1000 SoC DTS introduced
    here uses those compatibles:
    * Link: https://lore.kernel.org/lkml/20260429-ultrarisc-serial-v7-3-e475cce9e274@ultrarisc.com/
    * Link: https://lore.kernel.org/lkml/20260427-ultrarisc-pcie-v4-2-98935f6cdfb5@ultrarisc.com/
  - ARCH_ULTRARISC support is being reviewed separately:
    * Link: https://lore.kernel.org/lkml/20260427-ultrarisc-pcie-v4-1-98935f6cdfb5@ultrarisc.com/

Testing:
  - dt_binding_check and yamllint (all new/modified binding YAMLs)
  - dtbs_check and dtbs (RISC-V, including dp1000-milkv-titan.dtb and
    dp1000-rongda-m0.dtb)
  - Kernel build for RISC-V and boot-tested on DP1000 (Milk-V Titan and
    Rongda M0)

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
Jia Wang (9):
      dt-bindings: vendor-prefixes: add Rongda
      dt-bindings: riscv: cpus: Add UltraRISC CP100 compatible
      dt-bindings: riscv: Add UltraRISC DP1000 bindings
      dt-bindings: pinctrl: Add UltraRISC DP1000 pinctrl bindings
      riscv: dts: ultrarisc: Add initial device tree for UltraRISC DP1000
      pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl driver
      riscv: dts: ultrarisc: add Rongda M0 board device tree
      riscv: dts: ultrarisc: add Milk-V Titan board device tree
      riscv: defconfig: enable ARCH_ULTRARISC

 .../bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml | 168 ++++
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/ultrarisc.yaml       |  27 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |  15 +
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/ultrarisc/Makefile             |   3 +
 .../dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi  | 107 +++
 .../boot/dts/ultrarisc/dp1000-milkv-titan.dts      | 182 +++++
 .../dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi    |  85 ++
 arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0.dts | 111 +++
 arch/riscv/boot/dts/ultrarisc/dp1000.dtsi          | 851 +++++++++++++++++++++
 arch/riscv/configs/defconfig                       |   1 +
 drivers/pinctrl/Kconfig                            |   1 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/ultrarisc/Kconfig                  |  23 +
 drivers/pinctrl/ultrarisc/Makefile                 |   4 +
 drivers/pinctrl/ultrarisc/pinctrl-dp1000.c         | 112 +++
 drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c      | 746 ++++++++++++++++++
 drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.h      |  71 ++
 .../dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h |  65 ++
 21 files changed, 2577 insertions(+)
---
base-commit: 50897c955902c93ae71c38698abb910525ebdc89
change-id: 20260316-ultrarisc-pinctrl-efa6e24c4803

Best regards,
--  
Jia Wang <wangjia@ultrarisc.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
