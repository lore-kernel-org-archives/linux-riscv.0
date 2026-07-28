Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200C1C54F54
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 16:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JjePE1TNy0emh6oNqjwiuoNWtPq9kwh3RtTsm6e1ALY=; b=aE+YApxkih235L
	QPDnI4B+vP0SF1/BPV88RRkJwLBMQo2pHIGyO/506Ix2TYZsp6oJf2C968RVtS6sk2dtF7SMf680w
	Ptoxs+iXiaFIL5qGY5b3ivy5nVyrcbXi6/s9SPL/sg3a3xvk3mIJMI94dAfD+757+ZoJBg/xGEzF2
	sB+pJWfDWoJrQTXlCu4HM4QrCoaXFKjQIPgGgkAijuJr6o/9tdjCZ6Jck2WKNNXVBVoYZjWT8MICd
	w/DRGViNsnWAPfEL/edj1RoEfYn7Tlp3oQXEg/NiXeAkmamQVPndfbC+itdtsnX3K+oGmYwxkLtg+
	FzOk34i5C/i0XO0GdSkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokon-00000005qB0-0UXW;
	Tue, 28 Jul 2026 16:38:13 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokok-00000005qA3-1X1o
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 16:38:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1785256682; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mz+qD20qnKIXs9MwtG2brTEEqEyxoeKWl7pF0pQti++RrH0XrUE6bU6xzEYm3HqPCdkoCYVOgp0oU3oN2HOtTze4PeZTKMG23glFYspGvZl1jKl/7EZYg2Xo0a5MZKO5Zb+1i2UmGZwdvvqpJ584OVK/pN2i2YVRHt3RJq2LI4c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785256682; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=q20K+kA67289uE4ggB5wysl6OGkwE2LUdvVrvgdPmfs=; 
	b=X8ZX5GpvMq+CUpXnB3ipVexWPpM4/W66UPgTwUmG+BNyfXnX37am63/zCFU6SOD68/vcuTPZew5V+zhx/d8seJsgpIxYRUOUrYz27mjpd9Nh9FTFwRvIa4MnFsWp1zTvjrRb2WkmshZVQV6OUUt3FzORLn36TlN9uvSCXb1d5jQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785256682;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=q20K+kA67289uE4ggB5wysl6OGkwE2LUdvVrvgdPmfs=;
	b=qsbtCwxM2tEJrUtT5N7vdQBu4tOEy+HbGEG+RTvRg+CnDCdziy8M9aF78v/y9SZS
	BLFRLh5xQIcjHkS8VVXxgE6js6ZMCRRT3ZyhczvwYlKkqvJ85n6NN/T23gc1zYoxAxX
	tvX8ODSWnsvkeJsbMM9m27HlBQRo3RQpJUml9hu4=
Received: by mx.zohomail.com with SMTPS id 1785256680056311.72121539027864;
	Tue, 28 Jul 2026 09:38:00 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH RFC 0/7] spacemit: k3: Replace bad CLINT node with ACLINT
 nodes
Date: Wed, 29 Jul 2026 00:36:26 +0800
Message-Id: <20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyNL3Wxj3cTknMy8El1Lk+REyxTjNAtDizQloPqCotS0zAqwWdFKQW7
 OSrEQweLSpKzU5BKQKUq1tQBGONS7cgAAAA==
X-Change-ID: 20260729-k3-aclint-94ca9d3f818f
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4190;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=qU+HHx9IVqeto+Xj7vjzq5aDA4v1duGiO2ksgj3uRsc=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIybh31D5wn5tIlsTLoSUhcXNXWVU9Eohvur/1pNS/21
 t4bM3iFOkpZGMS4GGTFFFm4/MX/WevwfDsi0HofZg4rE8gQBi5OAZiILRcjw7M/VZzdgRvbHWMs
 I+ouXuD0aNK+5Jy4sU76KX9EossZD4b/5YGbWOId09ra4x4zWIgvVtfuChLVK2fZ/GqlyKTbf7r
 5AA==
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_093810_781105_925C7499 
X-CRM114-Status: UNSURE (   8.05  )
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

When testing OpenSBI with the upstream Device Tree, the CLINT controller
failed to function properly with the irqchip.riscv_imsic_noipi boot
parameter:

  Platform IPI Device         : aclint-mswi
  Platform Timer Device       : aclint-mtimer @ 24000000Hz
  
  Domain0 Region03            : 0x00000000e081c000-0x00000000e081ffff M: (I,R,W) S/U: ()
  
  [    0.091014] smp: Bringing up secondary CPUs ...
  [   10.104917] CPU1 failed to report alive state
  [   20.118689] CPU2 failed to report alive state
  [   30.132288] CPU3 failed to report alive state
  [   40.145953] CPU4 failed to report alive state
  [   50.159604] CPU5 failed to report alive state
  [   60.173212] CPU6 failed to report alive state
  [   70.186981] CPU7 failed to report alive state
  [   70.191411] smp: Brought up 1 node, 1 CPU

Through exploring and testing, I discovered that the K3 actually
provides all three complete ACLINT components, and subsequent
confirmation with the vendor yielded the following information:

The ACLINT controllers are mapped to two physical memory regions:
secure (0xf1810000-0xf1820000) and non-secure (0xe0810000-0xe0820000),
with varying accessibility per controller and execution mode:

+---------+--------+------------------------+-----------------------+
| Offset  | Module | Secure Region          | Non-Secure Region     |
+---------+--------+------------------------+-----------------------+
| +0x0000 | MSWI   | 0xf1810000-0xf1813fff  | 0xe0810000-0xe0813fff |
|         |        | (M-mode only)          | (Inaccessible)        |
+---------+--------+------------------------+-----------------------+
| +0x4000 | MTIMER | 0xf1814000-0xf181bfff  | 0xe0814000-0xe081bfff |
|         |        | (M-mode only)          | (Inaccessible)        |
+---------+--------+------------------------+-----------------------+
| +0xc000 | SSWI   | 0xf181c000-0xf181ffff  | 0xe081c000-0xe081ffff |
|         |        | (M-mode only if efused)| (M/S-mode Accessible) |
+---------+--------+------------------------+-----------------------+

Taking these constraints into account, we choose the secure region
(0xf1810000-0xf181bfff) for the M-mode ACLINT components (MSWI and
MTIMER), and the non-secure region (0xe081c000-0xe081ffff) for the
S-mode SSWI component.

This series is marked as RFC to discuss the ACLINT compatible string
strategy. Existing ACLINT compatibles in upstream carry specific quirks
(e.g., Nuclei/T-Head MTIMER requiring 32-bit MMIO access, or MIPS SSWI
adding extra DT properties). This series introduces the standard generic
"riscv,aclint-*" fallback compatibles, similar to "riscv,imsics" and
"riscv,aplic", to prevent constantly updating drivers for future SoCs.

Feedback is welcomed on this approach versus potential alternatives,
such as using standalone "spacemit,k3-aclint-*" compatibles without
fallbacks, or selecting distinct existing fallbacks per ACLINT
sub-module to bypass known vendor quirks.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
Junhui Liu (7):
      dt-bindings: timer: thead,c900-aclint-mtimer: Add SpacemiT K3
      dt-bindings: interrupt-controller: thead,c900-aclint-mswi: Add SpacemiT K3
      dt-bindings: interrupt-controller: thead,c900-aclint-sswi: Add SpacemiT K3
      dt-bindings: timer: sifive,clint: Mark spacemit,k3-clint as deprecated
      irqchip/aclint-sswi: Add generic riscv,aclint-sswi match
      riscv: dts: spacemit: k3: Fix SSWI node misidentified as CLINT
      riscv: dts: spacemit: k3: Add ACLINT MSWI and MTIMER nodes

 .../thead,c900-aclint-mswi.yaml                    |  4 +++
 .../thead,c900-aclint-sswi.yaml                    |  4 +++
 .../devicetree/bindings/timer/sifive,clint.yaml    |  5 ++-
 .../bindings/timer/thead,c900-aclint-mtimer.yaml   |  4 +++
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 37 ++++++++++++++++------
 drivers/irqchip/irq-aclint-sswi.c                  |  1 +
 6 files changed, 44 insertions(+), 11 deletions(-)
---
base-commit: 46380e4b1534c1626cecd7f4d0abb5e0cce09af6
change-id: 20260729-k3-aclint-94ca9d3f818f

Best regards,
--  
Junhui Liu <junhui.liu@pigmoral.tech>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
