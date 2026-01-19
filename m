Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBD8C98315
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 02:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KYyOLX2Wvt1xODyE3/NASTVY3mLY59fJ3LiiOucLUmk=; b=nbEsUizJ9z6AbH
	GlV7O1YDnhE5taPvkGsMCBS8xvi9sAzEfnfk515adRYyUDdZwggLUrZMueRw7Y4FqgwM69ITxDjTO
	L7FK5/ThJd40aqpcAb73Jn+rIgD71wIsxW3OiFNpDykmrSiZJsrlwSTWs1wmekY+7iQefOIJc9ZiV
	x1Yp0sIlSZva7Am60iQKKoXMktn0FP6Jp5FuaxYfnVecC+XbjLEsMjtd0FgTi6L2dm6eZU/0sH33W
	EM3eJzRRRAq2nsD+JpQizAL9xRN+nYZ/1QK8NbEMjcKaK2JulSNRI6lihNn4CJrEFJIRvoViLHK7M
	2iy1OAy612sJZomNo1ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhfDn-00000001HYC-2JHY;
	Mon, 19 Jan 2026 02:42:27 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhfDi-00000001HWB-319K
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 02:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type:To; bh=Cdyy8B+C4W0KUxe3m2muENX4c9ZqpB9du/esOVVOZa0=;
	b=G37TqJUJ4VZXnuCYtNSjKAPquN24rVA3w8FarxVBq8AgB+yc2/l9nsh7jyz2rY
	BWErJCLRUcKb55n+5caWe5wjg9oDJ6UFdlOGegusj8iKdso474z7zOXPkUh7T1NK
	WKLT2jdoI+sHQmDfleh6m4e8KIC3d3XvV1EI1anaA4nJw=
Received: from [113.54.162.98] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAXQfnSmW1pNwHHLg--.6S2;
	Mon, 19 Jan 2026 10:41:26 +0800 (CST)
From: Shuwei Wu <shuweiwoo@163.com>
Subject: [PATCH v3 0/3] thermal: spacemit: Add support for SpacemiT K1 SoC
 thermal sensor
Date: Mon, 19 Jan 2026 10:41:20 +0800
Message-Id: <20260119-patchv2-k1-thermal-v3-0-3d82c9ebe8a4@163.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANCZbWkC/22Nyw6CMBBFf4XM2jFMCwRc+R+GBQxT2yiPtKTRE
 P7dSuLO5TnJPXeDIN5JgEu2gZfogpunBPqUAdtuugu6ITGoXJWkqMSlW9lGhQ/C1YofuyeWxvS
 1rg0TM6Th4sW41xG9tYmtC+vs38dHpK/95ap/uUiY41D0mow03OTFlSp95nmEdt/3DzogIMOyA
 AAA
X-Change-ID: 20251215-patchv2-k1-thermal-5ffb838fc1cc
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Shuwei Wu <shuweiwoo@163.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768790485; l=1596;
 i=shuweiwoo@163.com; s=20251125; h=from:subject:message-id;
 bh=yA3VdZI4Un06fzV00HqWi7i7xrowQbaZzQEdIjfwCUM=;
 b=xOxL7SjIRv+RJxc9mAAosj7bqGbYodCxlmFPffaassJA8vOCV5iTdhEMlZYLlwo0Dt3nMmt1O
 uoDv8QHxCltAjYY6hbw2G8HLt7CbkjtrGADTemsER0EQgwFWG4hcr35
X-Developer-Key: i=shuweiwoo@163.com; a=ed25519;
 pk=qZs6i2UZnXkmjUrwO5HJxcfpCvgSNrR4dcU5cjtfTSk=
X-CM-TRANSID: PygvCgAXQfnSmW1pNwHHLg--.6S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw43JF4rJr47JF1ktFyrZwb_yoW8XrWrpF
	s8urn5C34DGr4xJw4fur17CFZ0qF4rtFy2gF1Igw1Yv3WUCFy3XryDtF15Xa48Xry3JFWq
	vrsrGr4rCF1qyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi8sq_UUUUU=
X-Originating-IP: [240c:c983:3:4334:9242:6f7:e6b:a073]
X-CM-SenderInfo: 5vkx4vplzr0qqrwthudrp/xtbC5BdR32ltmdeEuQAA3K
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_184223_557200_6D51FCB3 
X-CRM114-Status: UNSURE (   8.67  )
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

Introduce support for the on-die thermal sensor found
on the SpacemiT K1 SoC.

Include the device tree binding documentation in YAML format, the
thermal sensor driver implementation, and the device tree changes to
enable the sensor on K1 SoC.

---
Changes in v3:
- Fix indentation and variable types
- Simplify clock management and redundant assignments
- Link to v2: https://lore.kernel.org/r/20251216-patchv2-k1-thermal-v1-0-d4b31fe9c904@163.com

Changes in v2:
- Move driver to drivers/thermal/spacemit/ and update Kconfig/Makefile
- Address reviewer feedback on style and structure
- Improve variable naming and comments
- Link to v1: https://lore.kernel.org/r/20251127-b4-k1-thermal-v1-0-f32ce47b1aba@163.com

---
Shuwei Wu (3):
      dt-bindings: thermal: Add SpacemiT K1 thermal sensor
      thermal: spacemit: k1: Add thermal sensor support
      riscv: dts: spacemit: Add thermal sensor for K1 SoC

 .../bindings/thermal/spacemit,k1-tsensor.yaml      |  76 ++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 101 ++++++++
 drivers/thermal/Kconfig                            |   2 +
 drivers/thermal/Makefile                           |   1 +
 drivers/thermal/spacemit/Kconfig                   |  19 ++
 drivers/thermal/spacemit/Makefile                  |   3 +
 drivers/thermal/spacemit/k1_tsensor.c              | 281 +++++++++++++++++++++
 7 files changed, 483 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251215-patchv2-k1-thermal-5ffb838fc1cc

Best regards,
-- 
Shuwei Wu <shuweiwoo@163.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
