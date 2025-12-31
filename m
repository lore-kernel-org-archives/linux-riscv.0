Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2116EE57D1
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Dec 2025 06:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VnWuuD/F/Cj0+J8is11JqzgFcNTsfhpuJ+oi06NYgGQ=; b=uq+4zjcALeMzKW
	k3+Zbw7POmMPFqy8NsZqCVfwe15jStuqu1jM0z2+3RIOycIpbTOsyeMAxlLLT1nIid6FCgnVKZJpB
	BMh2R5uEFxnbiaPWa8op2AHF8lCOARtqB8LfdWjuE1cny6w6cE/LEvPITZmMC27ArmZ2jbGWDToOZ
	hVIyRCEo+w4SjSQeisr7H0vL5xBB1BUWLahcjdWmG6wOlbFpxIxI7CNQkogNzTlxfDuvNM+5BjGKl
	EhWARune43unVmP7GuiYK8SCGTbDDU1vN3v8Z5Xt3s86I3PyPcn6Jj0bFwK9jPDvrrCFS13ZXvDzr
	zIQBIUPjut1knz34W/Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vapvl-00000005jgl-0LPE;
	Wed, 31 Dec 2025 06:43:37 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vapvh-00000005jfe-3JrA
	for linux-riscv@lists.infradead.org;
	Wed, 31 Dec 2025 06:43:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1767163394; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UD0SSaNqyxTIB8dboRduJpgQYio+KbXhgmQcCeYlyvHFgfosrWFrCFqgstDqr6b9wgDN4oHB0fWRaHrSLPoAENdN0L+HuYW6H0hER/6W6iqXVqTlbIwJxPiriYoJvrudB1sN5JKnwFK1L8wfhjygehNSktV4UX7/WQOhHV8TZvs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767163394; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=q9ypLDTMdw6YB/ZXsROHAJR2hTEvtbYVlYoJ86mENKk=; 
	b=IwfjPWwqnJCvETo8D1T8H1DARNTMRQ6ryPsl90vLUxzAtcUgRWqUppmYMTiGYnpOAEWfkUXafFdybPuMID8vve6R+KOQDFwF8BK8ZbDKSq9i4OkCH5XXzMzFIosDHlD+D/6GuhHZv0DienauvpSKS181D2udk0igBJjNA0doFug=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767163394;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=q9ypLDTMdw6YB/ZXsROHAJR2hTEvtbYVlYoJ86mENKk=;
	b=lgLDZELa6JYw8p6hXLbC6aJQaW0i3FsaJkyGcE1ZDCqAhEQLkedNovaHKMGFQxmb
	/xjyD5A8YgADNTUh4raRl7XAqdfUWdMGt9OrizNWM2VQbMXO7VBkpf+cejrZ+nh7DZM
	XT9d3Rs/9Un4FG4B5bjKkzPy+oLRoeYgwzXR6sEU=
Received: by mx.zohomail.com with SMTPS id 176716339210269.79354772892998;
	Tue, 30 Dec 2025 22:43:12 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v4 0/6] clk/reset: anlogic: add support for DR1V90 SoC
Date: Wed, 31 Dec 2025 14:40:04 +0800
Message-Id: <20251231-dr1v90-cru-v4-0-1db8c877eb91@pigmoral.tech>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NQQ6CMBCF4auQrq1pp4WCK+9hXEBnhCYqWKDRG
 O5uwUSjYfkm+f55sp68o57tkifzFFzv2mscepMw25TXmrjDuBkISEUBwNHLUAhu/ciNListrDm
 BUSyCztPJ3ZfY4fjenm5jbA7fY+P6ofWP5WGQ83W1HSQXnFSh0KQ5kqZ95+pL68vzdiDbsDkV4
 MOlgOyHQ+RaVZkpLWaIuMbVl4P85SryFKwtVI4SK/HPp2l6AQs1FqY7AQAA
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
 Brian Masney <bmasney@redhat.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767163372; l=3705;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=ltE7Nxid9ZRZpr3XgkD0CgmMAQGqavxTEGqVL5UJvDU=;
 b=WzR+JeiXhaXIqPJdMcNMbaQ3MufDdeWpxvGqt+s1R9kAFcnPP72AoFJgfA8JV4kQRf5L2O2q3
 wzbA+xDl6JIDxWcns3z7SkNcjjl1DfXDpxrdWCId6U7mgdRX3TCh60R
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_224334_201214_20EF6B63 
X-CRM114-Status: GOOD (  14.56  )
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
Changes in v4:
- Change common cru_dr1 code into a standalone module for future reuse
- Remove redundant .round_rate() in the clock driver
- Use devm_auxiliary_device_create() to simplify auxiliary device
  registration
- Pass register base from clk to reset via platform_data instead of
  performing a second ioremap
- Update clock Kconfig and Makefile licenses to GPL-2.0-only from
  deprecated GPL-2.0
- Add Kconfig dependency for the reset driver on the clock driver
- Link to v3: https://lore.kernel.org/r/20251216-dr1v90-cru-v3-0-52cc938d1db0@pigmoral.tech

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

 .../bindings/clock/anlogic,dr1v90-cru.yaml         |  60 ++++++
 MAINTAINERS                                        |   7 +
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi            |  41 +++-
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/anlogic/Kconfig                        |  21 ++
 drivers/clk/anlogic/Makefile                       |   7 +
 drivers/clk/anlogic/cru-dr1v90.c                   | 192 +++++++++++++++++
 drivers/clk/anlogic/cru_dr1.c                      | 226 +++++++++++++++++++++
 drivers/clk/anlogic/cru_dr1.h                      | 117 +++++++++++
 drivers/reset/Kconfig                              |  10 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-dr1v90.c                       | 141 +++++++++++++
 include/dt-bindings/clock/anlogic,dr1v90-cru.h     |  46 +++++
 include/dt-bindings/reset/anlogic,dr1v90-cru.h     |  41 ++++
 include/linux/clk-provider.h                       |   2 +-
 16 files changed, 911 insertions(+), 3 deletions(-)
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
