Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEDBD25B4E
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 12:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qe2kEquuPm0U/Wofkd0JOjbZrsNnkbKwgY14m+lm/TU=; b=pu7q7bPKkj7G2/
	3YMbN7GosRckQwGuHKTBSpcBtWtWj6NL3xobyn1Acw2AMQm14bsmHSRMzd/Kbx2ryfZl4zZco1BaH
	8fBXpDM6IAaFtIRb6gqynzPDJx59GmpV+ggkHqRRTnWncwCT8GoXW2vHK+vgJqGn/1vUl8O3/SSMA
	NphuoNv4Muy+dKfNp2f6at0nf7ssIPNpuyyk9lenWcR4lCZ1ylUYpZSF0W/p/1XxkrrpGFCDTEJ+F
	//8gSJxLofp+yuXs+YfwkVBywQ8eFmB7tx7XKqDOLI+K+QDWVt1iqsMt9oUAgna4hzhd2PDoLhZnD
	I7jXF8VtRdjopfRe7OkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl4cQ-0000000Fzkk-3uQL;
	Wed, 28 Jan 2026 12:25:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl4cI-0000000Fzi8-2H7m
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 12:25:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D8C9B40C40;
	Wed, 28 Jan 2026 12:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8E84C4CEF1;
	Wed, 28 Jan 2026 12:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769603147;
	bh=htkwyATxZv3Whv5KhUFqYLbUDxJncIhL8/ca76w6xXk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Eij1+WrOiuLyW5WO532l2BobbHwdnzVHXriw2Zr8Nx+qrEXzsvFh9SkNcYRMFe9kk
	 iFHRUKD18pYtIJ24hGnT+WYc8QTAJtLMXNSrCLWI/wndRW4frekWK/Ps+Ndm8CbLWc
	 hh3yY5m4RSniWLyK1u7MpdYjJ7dwoVqRD4ROMqCSsGbMPWMyLFypIxuquDjh7/+oq2
	 12n8PVL/ZX8yWhJzBk9Led+NK5z8qV8fQKqRaJoGOknAhf+PdIcdT3ca3O6I+sW5uU
	 tJljCqwJ0/zebz6oVyFmS0S6n3ItUJKE4Ntah6V9oGwqZj2ODsLfYfilkwX3ZigIWt
	 jJEEVoosIitRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96BF4D25B4D;
	Wed, 28 Jan 2026 12:25:47 +0000 (UTC)
From: Ben Zong-You Xie via B4 Relay <devnull+ben717.andestech.com@kernel.org>
Subject: [PATCH v3 0/4] i2c: add support for Andes platform
Date: Wed, 28 Jan 2026 20:25:43 +0800
Message-Id: <20260128-atciic100-v3-0-8c002fcc2bb4@andestech.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEcAemkC/12OywrCMBREf0WyNuXmxjbWlf8hLvK4tRFsJYlBK
 f13m4ogLg/MnJmJRQqeIjtsJhYo++jHYQG53TDb6+FC3LuFGQI2IBC4TtZ7KwC405Jss++UMTu
 25O+BOv9cXafzh+PDXMmmIiiJ3sc0htc6lkXJFW8NCApQtCgrbAVKJbnghgYl1FEPjmIi21d2v
 LGizfgtlkP4cygjB67quhWycaBs99+e5/kNizEWaPEAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769603146; l=2623;
 i=ben717@andestech.com; s=20260120; h=from:subject:message-id;
 bh=htkwyATxZv3Whv5KhUFqYLbUDxJncIhL8/ca76w6xXk=;
 b=AgdNn4erauvy2HnDtQMQ2eNAmstIZmYqYJVaY4QwfhIix2abBHcxgoNP4+lWqXJ5xwj0KZwp2
 AtRZEIMtrOUAYaQwLjqKoMk3Zzs7FhcDEESQ5t8E0+b21d2Ccuhgwse
X-Developer-Key: i=ben717@andestech.com; a=ed25519;
 pk=nb8L7zQKGJpYk0yvrYKjViOZ34A36g1ZIsCmCsP518s=
X-Endpoint-Received: by B4 Relay for ben717@andestech.com/20260120 with
 auth_id=610
X-Original-From: Ben Zong-You Xie <ben717@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_042550_667183_CE978BFB 
X-CRM114-Status: GOOD (  12.08  )
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
Changes in v3:
- (1/4)
  - Rewrote the commit message to provide a detailed hardware
    description and explain the relationship between the ATCIIC100 IP,
    the AE350 platform, and the QiLai SoC. (Krzysztof)

- Link to v2: https://patch.msgid.link/20260122-atciic100-v2-0-7559136d07cf@andestech.com

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
base-commit: e5d4c5082ccaef6f7cdbabcf597ceede3bc9815e
change-id: 20260120-atciic100-da3ec68f7bb4

Best regards,
--  
Ben Zong-You Xie <ben717@andestech.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
