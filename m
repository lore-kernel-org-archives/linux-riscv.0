Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A13D5C0C1
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 02:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2roeKEHURgqDYgGatc9nnEwdxTX2Puc6CuYBkIU1l2M=; b=n00Hg+gkzXZzQz
	Rz0pGv4d3TuhJH6ia+iGLUITEovwmwkfl+aNFy/0EyoLAGo5brdDC9h2RYHqtx3jShY4rDRc4oNrN
	IBvs0mV7XWEXmCGlYurIH53r/iD7hQjhYSXML2QfomJwbffDvpn6QXCf7iut1/6D+MgERY4Chn+Ko
	nfqNOtnMpT4WdipOpkMlbppVAHh5/kQWlbLcyTFgHLWxi2FP+gZouoEE1O/rAzqzQcl3Al/RnDfpl
	rBO+FabbDIX/B13DKfXi9kIOnJqZi0dy0EzXcEmaRftiVvQoGd0QiiH9eyltZbxQdxwCiVO/Hzv84
	38zejbfMsU5yRYnIRCNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVKOa-00000004Xnz-0Znf;
	Tue, 16 Dec 2025 02:02:36 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVKOW-00000004Xn7-3Qsl
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 02:02:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type:To; bh=O5iu4yIsSO9ZWZlJQVFULBolHuSozJ/OSd+ZcqTsLBc=;
	b=ps1CQMlYZwgVk3oj5+edqK156CDZtUI9pGrvMF1uF6vjIJxpC87bATBL/2fRun
	MDB0q98WA0avy5aGORlr/0zzb3gBkhgtldssJTABKPCbWnAEWJ29oct7NN/0HlcC
	WYTG86EJXD29xaB9mWdQF9VJOsUxlCesFVIH5/rm1Imx8=
Received: from [192.168.10.1] (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDXUu97vUBpOmJ5Ag--.29S2;
	Tue, 16 Dec 2025 10:01:34 +0800 (CST)
From: Shuwei Wu <shuweiwoo@163.com>
Subject: [PATCH v2 0/3] thermal: spacemit: Add support for SpacemiT K1 SoC
 thermal sensor
Date: Tue, 16 Dec 2025 10:00:34 +0800
Message-Id: <20251216-patchv2-k1-thermal-v1-0-d4b31fe9c904@163.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEK9QGkC/x3MQQqEMAxA0atI1hOYRAriVQYXnZja4IxKK0UQ7
 25x+Rb/n5A1mWbomxOSFsu2LhX0akCiXyZFG6uB3+yIyeHmd4mFcSbco6a//6EL4du1XRASgRp
 uSYMdz/QDhWG4rhtSmDr3aAAAAA==
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765850492; l=1390;
 i=shuweiwoo@163.com; s=20251125; h=from:subject:message-id;
 bh=4JEux+wemjhe5lRBTJMYmOo5JbXHIEj6+c2dZiB74RM=;
 b=IBMt8PFGdohtMqhWB2UmoRRcAUFBvDkXtpCpUypHi17BMGo7NcoyJ6EagYHfgnr1dwBZrT80M
 2DUUw/J5whNA+TmA6JdliHQpyalK89xB+W/Gj/STy5B/OfzU8fA73x2
X-Developer-Key: i=shuweiwoo@163.com; a=ed25519;
 pk=qZs6i2UZnXkmjUrwO5HJxcfpCvgSNrR4dcU5cjtfTSk=
X-CM-TRANSID: _____wDXUu97vUBpOmJ5Ag--.29S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw43JF4rJr4rKw13GFyDWrg_yoW8JF47pF
	s8ur95Cr1DGF4xJw4fur1UuFZxtF4rtFy2gr1Igw1YqF15CFy3Jr98try5Xa48Xry3JFyj
	vrsrGr45CF1qyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi8sq_UUUUU=
X-Originating-IP: [240c:c983:3:5c03:81d3:caf5:2e64:be2]
X-CM-SenderInfo: 5vkx4vplzr0qqrwthudrp/xtbC5B-4h2lAvX+0VQAA3O
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_180233_288510_F5140A07 
X-CRM114-Status: UNSURE (   7.97  )
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
 drivers/thermal/spacemit/k1_tsensor.c              | 283 +++++++++++++++++++++
 7 files changed, 485 insertions(+)
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
