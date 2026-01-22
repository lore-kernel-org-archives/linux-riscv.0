Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0F4D625E9
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 03:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aaN6zp54cXs3a7endke5928NYFxA36s7pcHvLU5LvTc=; b=etBQII8B37k4Ik
	9owlxOIKDSxyDQ1e23X2QRj4W5ma2QGSnMVy5iokY+HSXYvAGcycjZJ1KmXh8WrmgGfXrm0VpKMYE
	TFMu1r3hetYdVmEL+ohiTIDJcnU2ATB5WGsz92zymO0jXp8KrO8jMihTDFh92Q8OBnGe7htKxnsAT
	JMXrA18vdbxzuVWe860E7Z076pg3x41waGYfEpY3lQENTdNydguO9XkDneg23YhLBHgNXGUD1no9Z
	azjR+8JOUcziUjYC8nf4kQJrhc9UfdAtoJ/3u8hRv0X1DZEpjZeR1CLHwLyJ0Auaxdj8xUKXmzKFv
	ucJJiS/IdTCKKfW8zMqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1villI-00000006OYw-1d3H;
	Thu, 22 Jan 2026 03:53:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1villH-00000006OXt-0626
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 03:53:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ED665600C3;
	Thu, 22 Jan 2026 03:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7EB43C116C6;
	Thu, 22 Jan 2026 03:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769054013;
	bh=BsH5qp5mxn9oN1eQAvbNOgB+hDjXd7cRQq++eYiHMgU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uVGaS1X/EO3n7dMzgO0K976K2bbmMs51JgLMjNlnGpy1UE7DKuZ04SyWItDAoO0Gg
	 87fOCswC9trWo4Uc1fAR6Ivvfp4McOQKpLgSFwjZXzq+npXd89DxgC8V9OKpLyrElO
	 aRRqwpXCuhccN/qrs3PqyeKTDJzePwrC8f4UNhzA4QOFY0PLGGhN/HYRPj9Fe6S9bh
	 wpMdsne68vUXakdyoiNFjX4kjNrm2ov19vbL49erda9vChYLasfGStstTQ+PfMS04L
	 8CA5b1ZusYTpJFurl1ri6T+HkfrRCEJm2WxaYjnhrZCkUf6smkFa6JsqJdhDs7CMBr
	 dT9blE3pCu9Pw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C53DC44536;
	Thu, 22 Jan 2026 03:53:33 +0000 (UTC)
From: Ben Zong-You Xie via B4 Relay <devnull+ben717.andestech.com@kernel.org>
Subject: [PATCH v2 0/4] i2c: add support for Andes platform
Date: Thu, 22 Jan 2026 11:53:17 +0800
Message-Id: <20260122-atciic100-v2-0-7559136d07cf@andestech.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAC2fcWkC/yWNQQ6CMBAAv0J6tmS7VSqe/Ifh0JZF1sRi2ko0h
 L9L8TjJZGYRiSJTEpdqEZFmTjyFDfBQCT/acCfJ/cYCARtQCNJmz+wVgOytJt+cB+PcUWz+K9L
 An7116/6c3u5BPpdAMUZOeYrffTar4pXuCRAMoGpR19gq1EZLJR0Fo8zVhp5SJj/WfnqKbl3XH
 5AJcgezAAAA
X-Change-ID: 20260120-atciic100-da3ec68f7bb4
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Ben Zong-You Xie <ben717@andestech.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769054012; l=2312;
 i=ben717@andestech.com; s=20260120; h=from:subject:message-id;
 bh=BsH5qp5mxn9oN1eQAvbNOgB+hDjXd7cRQq++eYiHMgU=;
 b=MzvB4SwtZthro9prrDLjur33srf2OFFh7FyyKgieW7Q//4XlEJTYGkomf6WXTQ7XV4Aqe+l5H
 /xnw830+t18AaR7mzJb9MsFvGludOxKRas+WLy5wD7W+nhB+fNx2FOB
X-Developer-Key: i=ben717@andestech.com; a=ed25519;
 pk=nb8L7zQKGJpYk0yvrYKjViOZ34A36g1ZIsCmCsP518s=
X-Endpoint-Received: by B4 Relay for ben717@andestech.com/20260120 with
 auth_id=610
X-Original-From: Ben Zong-You Xie <ben717@andestech.com>
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
Reply-To: ben717@andestech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch series adds I2C support to Andes platform, such as AE350 and
QiLai SoC.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
Changes in v2:
- ATCIIC100 is the hardware name for the Andes I2C controller and was used
  throughout v1. However, since Device Tree bindings should reflect the hardware
  identity and driver/config naming typically follows the i2c-<soc/platform>
  convention, this version replaces occurrences of "atciic100" with more
  appropriate names, such as "i2c-andes" or "andes_i2c," to align with upstream
  standards.
- Updated cover letter title and the description.
- Rebased on andi.shyti/i2c/i2c-host-next.
- (1/4)
  - Updated the title and the description of the patch.
  - Specified what the hardware is, and modify the title and compatibles. (Krzysztof)
  - Corrected device register size.
- (2/4)
  - Updated the title and the description of the patch.
  - Replaced the readl/writel operations with regmap APIs.
  - Replaced all occurrences of atciic100 with proper names.
  - Used module_platform_driver() to initialize. (Andi)
  - Moved CONFIG_I2C_ANDES (CONFIG_I2C_ATCIIC100 in v1) to the
    "Embedded system I2C/SMBus host controller drivers" section.
  - Made CONFIG_I2C_ANDES depend on ARCH_ANDES
- (3/4) (new)
  - Added an entry to the MAINTAINERS file.
- (4/4) (new)
  - Added the I2C node to QiLai DTS.

- Link to v1: https://patch.msgid.link/20250207021923.2912373-1-ben717@andestech.com

---
Ben Zong-You Xie (4):
      dt-bindings: i2c: add support for AE350 I2C controller
      i2c: add Andes I2C driver support
      MAINTAINERS: add an entry for Andes I2C driver
      riscv: dts: andes: qilai: add I2C controller

 .../bindings/i2c/andestech,ae350-i2c.yaml          |  45 +++
 MAINTAINERS                                        |   6 +
 arch/riscv/boot/dts/andes/qilai.dtsi               |   7 +
 drivers/i2c/busses/Kconfig                         |  10 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-andes.c                     | 341 +++++++++++++++++++++
 6 files changed, 410 insertions(+)
---
base-commit: aa5804b8fb64f446260cee45e7e8a722ac7ca839
change-id: 20260120-atciic100-da3ec68f7bb4

Best regards,
--  
Ben Zong-You Xie <ben717@andestech.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
