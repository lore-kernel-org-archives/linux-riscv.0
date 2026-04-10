Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7162FF36BA8
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 03:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KsMiwKaCk6eWjeIORoRsgYQnJTVvTrDur522MFjj2Bg=; b=r57H5mut8hQfmc
	wYu944Rl77fT+7DbrTvsrtfjX+AkcC+eL+dJRdIkDSkTfnWxEFa85DTE2QPWBrH3xyXJCl1fUH4R6
	Ymzja7zCjYg28Kx7gCdBsPJmusEaXt8ucd4u9VUBfxTyiVlJ3TO3L9enlIfhQ6z3p08tJZai6m/8M
	Rfp4n/AKsG4nsJHPLflAozeu8yflWybDnxRt09Tv2nN/4zOT8CxYoVPTCut1Z9iT8t4V86Rl29DgP
	fNEWXNVJMUbCDr9Nam0LuIx6CMJTgx08NxPqVHikZpXk81bq1gHmhxS+saIN9uFjZUOI2vNdkSV1P
	pb1TFVbN/juTax+3a1pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB2bT-0000000BXYu-0SZx;
	Fri, 10 Apr 2026 03:32:19 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB2bQ-0000000BXYJ-048j
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 03:32:17 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fsMmp54Kvz9v09;
	Fri, 10 Apr 2026 05:32:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1775791930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yhFceqNdq/8kDhJjs9Qm5Qij1KFElsM4S/RwXmu33Wc=;
	b=e+k1Sd64CLaCmc5hQ58tsFif6Rxh3o3oqvCISDa96MgCKX6VZ9z8tPbKnJaMxOSpFSIM1v
	5JZ7RDSIf7pI17TSzDdkf+yMWSUbKm0u+dmjRBjcxm4GipHswLhgNgn8bU8d70/R78iuSZ
	RwF2qTb4qY6djHHMrTHEQu263g0bSxSEmwkoocplIq6P/AXSiBNZXLJ0H0tleMwhcPTmY+
	pbEDMC/HIMZoJ9lhRURRbLwHNNOIMEKuDrMnBAeMRNaCTDAffZeNmsucqyHQrFTz4Im+no
	rByYMui0d67tZlQCdGj+DMMXh3VuEWLA2sKQzO8DZNmDyMx3YqYmFyDYy5FrmQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=fRLQy6gu;
	spf=pass (outgoing_mbo_mout: domain of shuwei.wu@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=shuwei.wu@mailbox.org
From: Shuwei Wu <shuwei.wu@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1775791929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yhFceqNdq/8kDhJjs9Qm5Qij1KFElsM4S/RwXmu33Wc=;
	b=fRLQy6gu1kspa0tVFsQ7HCQfW9By6hiNVWnMVFrAvDMuyx+Nt5QnobFJhnVFq2EIrneodD
	Jh3aNGhslyyoYDeRUlh2CIn7njEaOPtDOiB/F7oLZ64khEkHAl0/tTC60qz1nes66juAz0
	Simn+T0qNMyAsDpZp2RGTHjIN1oA0RZRrdZB4MaA1UPHvInr/5lOH0BRQ458LNUHGIYrx6
	e+O9oC5vxQ3rRGWVdxA/8nXm/DDHR2NtqxmNkVv/H1EJI49WVqOS2g4bPubH0NrjIvzOYd
	OjtQYa4yHA6E7wz2xAEZabZqD9o/DipCfToOCpk2IzNCeZHSQ6dC91OBAaO6dQ==
Subject: [PATCH v4 0/3] thermal: spacemit: Add support for SpacemiT K1 SoC
 thermal sensor
Date: Fri, 10 Apr 2026 11:31:35 +0800
Message-Id: <20260410-k1-thermal-v1-0-12c87dd063c3@mailbox.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABdv2GkC/x3MTQqAIBBA4avErBM0TKqrRAu1MYd+0ZAgvHvS8
 lu890LEQBhhqF4ImCjSeRSIugLr9bEgo7kYGt4oLnnPVsFuj2HXG3NaaGVsZ1SLUIIroKPnn42
 QJEw5f8kgthtgAAAA
X-Change-ID: 20260409-k1-thermal-fa1a6bc8b65e
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Shuwei Wu <shuwei.wu@mailbox.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Vincent Legoll <legoll@online.fr>, Gong Shuai <gsh517025@gmail.com>, 
 Anand Moon <linux.amoon@gmail.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, Yao Zi <me@ziyao.cc>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775791914; l=1839;
 i=shuwei.wu@mailbox.org; s=20251125; h=from:subject:message-id;
 bh=KNfrqSd7dBMSbu5friLkuT95VHDRb1Fo0ZCUFYgfUJ0=;
 b=DdLNQwFKrJo/1nUc07PwhAdhZ8yW6crJnA1EhiVMlJwu3xivpeEhFhm5+EZYm1FP079E14QbB
 PMGx8sXQm9ZALdz+l6oKFSFrS02IoLc5miGfz7/71gmVY55WU5KxOWk
X-Developer-Key: i=shuwei.wu@mailbox.org; a=ed25519;
 pk=qZs6i2UZnXkmjUrwO5HJxcfpCvgSNrR4dcU5cjtfTSk=
X-MBO-RS-META: hgou37jqyiq4irhipwwpebemm556juc5
X-MBO-RS-ID: 791dd05c49e7fda785d
X-Rspamd-Queue-Id: 4fsMmp54Kvz9v09
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_203216_379694_CB7E0637 
X-CRM114-Status: UNSURE (   8.27  )
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
Changes in v4:
- Add 'depends on THERMAL_OF' in Kconfig to ensure functional dependency
- Link to v3: https://lore.kernel.org/spacemit/20260119-patchv2-k1-thermal-v3-0-3d82c9ebe8a4@163.com/

Changes in v3:
- Fix indentation and variable types
- Simplify clock management and redundant assignments
- Link to v2: https://lore.kernel.org/r/20251216-patchv2-k1-thermal-v1-0-d4b31fe9c904@163.com

Changes in v2:
- Move driver to drivers/thermal/spacemit/ and update Kconfig/Makefile
- Address reviewer feedback on style and structure
- Improve variable naming and comments
- Link to v1: https://lore.kernel.org/r/20251127-b4-k1-thermal-v1-0-f32ce47b1aba@163.com

Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>

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
base-commit: a55f7f5f29b32c2c53cc291899cf9b0c25a07f7c
change-id: 20260409-k1-thermal-fa1a6bc8b65e

Best regards,
-- 
Shuwei Wu <shuwei.wu@mailbox.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
