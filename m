Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646D3D5C0C0
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 03:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J9Xt5TdPfuHN8whN4nZMGBDi8BbXnDgz/PLlpsY47RU=; b=U0IHtWaHyWqQcd
	He3GkYwK/DlNSFypx9xb3rEaunTu//2KzPlsHCIresIcSZc0EAnMVnYcksYPyI74CQPoSRkiNvmcP
	tg+ikE4Z4qgoRG3RyF5tvBHmCYFKMg3IldkCqO7CzaBwhJeuh0vZwvCc8Yl+bK7qwCW6bpEoJ70JG
	wgDU2yJ1EauE3Q1u2wtGvhp69b4pd6o3G9ZLjydMNPsXTT+2M35cFD3V+uvf/L+S1jhSbZC1ZIiZW
	LZq+1NjYZNmGdwOEHlfyI4ff/ooLjnnf6nHD7jHGyB4TIt4a+g0zVwz31IBW5+eL7bcw5JCUn14Ma
	om4y+75goWa3GO6HQnTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVM18-00000004dm9-1Em6;
	Tue, 16 Dec 2025 03:46:30 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVM13-00000004dko-1ybE
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 03:46:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765856772; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j3xmjWW0rGfxdb6+nK0vN5gB2OXdb39kTjm5XSphHvWbw5eVgIJCHzGf7iclb/IRgs1SM8N4myABtakx3QFNfiFbvf2DB3tMFCjRRszwdp4QeYyZR1DGHJU+HV0ki2FxMzkRIzjEwg49oU1iyHMYHQnv+lpJnwTpIJ3FjLHMbxc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765856772; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3jbWnm7yP/LIRGcpVIrC0Hwe46pPCDMrB/qxmd4Vit4=; 
	b=li8icaBUyReJ0s+xu2BiCFznD//M+iFeM6zv188Q5GctkDFmiwLa7reFdLyL9dd87XrFv1muJZgI7GWRRCts05a0i6tTIaRlqCzymL89Ntph+niiYPZCreXSFu8aGBjwCiB6KMsGRGmpngfJSFzXWW2jQPcCEsvcEQe4z5E5nT4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765856772;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=3jbWnm7yP/LIRGcpVIrC0Hwe46pPCDMrB/qxmd4Vit4=;
	b=HhNLvf+U1XcjOYNjQxqPKj+E+21rYVQnrj84qQsyi8imDBZ6yzM8fx1XgtW9ZmUK
	Xrm/OZ7dMuptrTTesuJP/Wld7rTpsJD6uU/OEwk/gJMrLOAcCKF4rzZ0n+R+AuUuuqS
	QN4ktjJT12XA8uEcTn7Hu3LMdYRd66m7i5SGu8eQ=
Received: by mx.zohomail.com with SMTPS id 1765856771748322.85027715020874;
	Mon, 15 Dec 2025 19:46:11 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v3 0/6] clk/reset: anlogic: add support for DR1V90 SoC
Date: Tue, 16 Dec 2025 11:39:40 +0800
Message-Id: <20251216-dr1v90-cru-v3-0-52cc938d1db0@pigmoral.tech>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHzUQGkC/22Nyw6CMBQFf4V0bU1fUHHlfxgXpb1AExW8hUZD+
 HcLJhqNyznJzJlIAPQQyD6bCEL0wXfXBHKTEduaawPUu8REMJGzUgjqkMeSUYsj1cpUilldCy1
 JEnqE2t/X2PH0YoTbmJrDZ2x9GDp8rIeRL+vfduSUUZCldDrfOVBw6H1z6dCctwPYliypKN46Z
 6L40kXSlawKbawrnHO/+jzPT84Ss+n8AAAA
X-Change-ID: 20250922-dr1v90-cru-74ab40c7f273
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765856765; l=3121;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=fK7BgU/BsCw/m8NZK/G3uR+3FsBg5rSzgZBTmQH1e6c=;
 b=GV54tO7n7K/G323Z2y2lV1F5e1g3msM/Y6Gbt1MwVNqXBbxc52XpCks0G/zi4synzFTBaDKzK
 Enxrxxcrr6kAoOtsomNC7kYX5MlzsU1XGMJzr8jogBvN8dcBGVYARue
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_194625_602980_92AB7047 
X-CRM114-Status: GOOD (  12.47  )
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

Add Clock and Reset Unit (CRU) support for the Anlogic DR1V90 SoC, as
well as corresponding dts bindings and dts integration.

The CRU driver framework is built around the clock controller as the
primary device, with the reset controller implemented as an auxiliary
device. The clock part refers to the vendor's code [1] to determine the
structure of the clock tree.

The Anlogic DR1 series includes not only the DR1V90 (based on the Nuclei
UX900 RISC-V core), but also the DR1M90 (based on the Cortex-A35 ARM64
core). Most of the clock tree and CRU design can be shared between them.
This series only adds CRU support for DR1V90. Nevertheless, the driver
is structured to make future extension to other DR1 variants like
DR1M90.

Link: https://gitee.com/anlogic/linux/blob/anlogic-6.1.54/drivers/clk/anlogic/anl_dr1x90_crp.c [1]

---
Changes in v3:
- Remove incorrect __free(kfree) usage for auxiliary_device in clock
  driver
- Replace __clk_get_enable_count with __clk_is_enabled in clock driver
- Add a lock to protect register read-modify-write in reset driver
- Rebase to v6.19-rc1
- Link to v2: https://lore.kernel.org/r/20251026-dr1v90-cru-v2-0-43b67acd6ddd@pigmoral.tech

Changes in v2:
- Update copyright infomation
- Add the original vendor author's infomation to the clock driver
- Rebase on the v3 basic DT patch, which is based on v6.18-rc1
- Link to v1: https://lore.kernel.org/r/20250922-dr1v90-cru-v1-0-e393d758de4e@pigmoral.tech

---
Junhui Liu (6):
      clk: correct clk_div_mask() return value for width == 32
      dt-bindings: clock: add Anlogic DR1V90 CRU
      clk: anlogic: add cru support for Anlogic DR1V90 SoC
      reset: anlogic: add support for Anlogic DR1V90 resets
      riscv: dts: anlogic: add clocks and CRU for DR1V90
      MAINTAINERS: Add entry for Anlogic DR1V90 SoC drivers

 .../bindings/clock/anlogic,dr1v90-cru.yaml         |  60 +++++
 MAINTAINERS                                        |   7 +
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi            |  41 +++-
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/anlogic/Kconfig                        |   9 +
 drivers/clk/anlogic/Makefile                       |   5 +
 drivers/clk/anlogic/cru-dr1v90.c                   | 191 +++++++++++++++
 drivers/clk/anlogic/cru_dr1.c                      | 258 +++++++++++++++++++++
 drivers/clk/anlogic/cru_dr1.h                      | 117 ++++++++++
 drivers/reset/Kconfig                              |   9 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-dr1v90.c                       | 141 +++++++++++
 include/dt-bindings/clock/anlogic,dr1v90-cru.h     |  46 ++++
 include/dt-bindings/reset/anlogic,dr1v90-cru.h     |  41 ++++
 include/linux/clk-provider.h                       |   2 +-
 16 files changed, 927 insertions(+), 3 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20250922-dr1v90-cru-74ab40c7f273

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
