Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC358C61DB2
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 08:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bnol8lSzz3LlAlelbLbnF2Zzh8yHSkjHM1eXJpraO34=; b=kvNKNXXBg8oquz
	7t2EX0e1utSAVEZygMIqrag0594tz81gRrdxGGjLWHf37RMUWrzGgsBHPg/uOhrB/qpwdp/bp4kOC
	DBh0tvumxky3KynldAx8dm1hoHQR2zxnQTQh+RE9ylRRRJ7t5eojyfzAHgs8aG7/NfxqCjz2vB0hy
	+pwS2A4ywgE7JsvokhaXcF+3zQztlTmpBCZqtj5gdFeNdMF99B4RenS/FQhzuDZr15jLKsSeZatxQ
	ScX9gcn6aVLwp+H0nj0BV3g5hoPnTENl8l0gJFVT9fgDe2DXCRMHVQEF4WFHtJE59JB6nV4F6XlJ2
	p8h19T5PKFbTaIjZpv0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ08P-0000000FoWk-24Oj;
	Fri, 13 Jun 2025 08:51:37 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ08M-0000000FoWJ-2yXK
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 08:51:36 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749804679; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OJNixlvG4wt1EB6V7xJ36lJQpuFR4Z6q5XvGw6dJ1w6sQbPpCNGY1Lw6jVij81YWVqqbSpnMFGyWkFIXfbfZ0JIGcgP6HANw5XFms9Ji0ja6d8F6YQHNGRYmXtx/IfXEHe0W90wpoRLho+QlUzPrdqLjIFCoqPi5NbNizbHr+24=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749804679; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8VeSyupMjDgT9uU0kgEi/NVyk9eHor94fs7ZydFVgBM=; 
	b=C9qrDq3vJKsSjeFl21S4guauElMPw6G4YH2Gprg2dcTuF3YRrpiWr6sxPYO+HDy0or/h9Sx5m5RGNr8oZUlWQ65RZYsiT5kj5dC2LkbapjNU9239AMDqK2zu0Gv5w8M2hUZNHWtXjkZonl+9PyHBQbkT1hpopt/HuOf7W7gJApM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749804679;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=8VeSyupMjDgT9uU0kgEi/NVyk9eHor94fs7ZydFVgBM=;
	b=eH9sbo8OmuigiUuDZlqnTC29j0xHHigWIXbP4PntsV5PJ6x5Fi7EINKlgczUlkRf
	jWPi0LipngBx/R+YupPwBGzng9xprBBsghTUztmxI6tFwLqdNucTlyrN167lGkcAf90
	eGXSY+dg4yaHfqlnO7+g77XwK8AzHaH51XG1Um/c=
Received: by mx.zohomail.com with SMTPS id 1749804677016890.5791024555222;
	Fri, 13 Jun 2025 01:51:17 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v4 0/2] reset: canaan: add Kendryte K230 reset support
Date: Fri, 13 Jun 2025 16:49:22 +0800
Message-Id: <20250613-k230-reset-v4-0-e5266d2be440@pigmoral.tech>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABLmS2gC/13OQQ6CMBCF4auYri2ZTlsprriHcYFlkEalpEWiM
 dzdgjEGl2+S78+8WKTgKLL95sUCjS4636Whthtm26o7E3d12gwBNShQ/IISeKBIA5dYmNzuGqB
 aswT6QI17LLHDMe3WxcGH59IexXydMwoKXGVGwYHXYGsrRGEKOpX+Ply9v2TW39gcGvGL0w8IK
 4wJN+KkKhA7UtKUvTvffKiu2UC2/XD54xryFZeJW6PTV7lBqvQ/n6bpDbpTKlkkAQAA
X-Change-ID: 20250404-k230-reset-32987c6f0ed5
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Junhui Liu <junhui.liu@pigmoral.tech>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
 Chen Wang <unicorn_wang@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749804649; l=2310;
 i=junhui.liu@pigmoral.tech; s=20250507; h=from:subject:message-id;
 bh=D3HaEDiRSIXxKlHSWFGGoal45EeRfaXUo6u8WNz/3/A=;
 b=270SMOZN9VeCr1u/EstBgtALe5pCAD14I1lcpbLv/83MnUzFEfNQcytMprC09IOJ/CB99zJlC
 7LEfy9Rz+ixD3GPUanD/OV1mZByBTYhX6/wS95IwG6esQ85Ie6YAjpJ
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=d3i4H2mg9LUn4SQemoLAjLRQy0nTcyknIv6zgKMwiBA=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_015135_144792_9DA8C3A7 
X-CRM114-Status: UNSURE (   9.16  )
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

This patch series add reset controller support for the Canaan Kendryte
K230 SoC.

Tested on CanMV-K230-V1.1 board. Some of the HW_DONE and SW_DONE reset
type was tested by reseting the submodule and checking the reset
register value[1]. The CPU reset type was tested by a temporary rproc
driver[2][3].

link: https://gist.github.com/pigmoral/cc45de673775575750ac7fe49d4456a2 [1]
link: https://github.com/pigmoral/linux/tree/k230/rproc-cpu0 [2]
link: https://github.com/pigmoral/linux/tree/k230/rproc-cpu1 [3]

---
Changes in v4:
- Rebase to v6.16-rc1 and test on CanMV-K230-V1.1 board
- Collect and update tags
- Link to v3: https://lore.kernel.org/r/20250507-k230-reset-v3-0-c85240782ea5@pigmoral.tech

Changes in v3:
- Update copyright/license in driver and bindings headers
- Rename HS/LS to HISYS/LOSYS in DT bindings
- Add reset-timing notes at the top of reset-k230.c
- Replace long udelay(200) to fsleep(200) for HW_DONE paths
- Remove rstc->dev, store device in rstc->rcdev.dev
- Link to v2: https://lore.kernel.org/r/20250420-k230-reset-v2-0-f1b4a016e438@pigmoral.tech

Changes in v2:
- Turn to_k230_rst from macro to inline function
- Use guard to replace spin_lock_irqsave and spin_unlock_irqrestore
- Remove assert and deassert operations for self-clearing reset types,
  only reserve the reset operation
- Add delay to accommodate the reset time
- Remove blank line inside read-modify-write operations
- Remove redundant default case in enum switch
- Update copyright dates and my email address
- Link to v1: https://lore.kernel.org/r/20240924-k230-reset-v1-0-d0cdc11989eb@outlook.com

---
Junhui Liu (2):
      dt-bindings: reset: add support for canaan,k230-rst
      reset: canaan: add reset driver for Kendryte K230

 .../devicetree/bindings/reset/canaan,k230-rst.yaml |  39 +++
 drivers/reset/Kconfig                              |   9 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-k230.c                         | 371 +++++++++++++++++++++
 include/dt-bindings/reset/canaan,k230-rst.h        |  90 +++++
 5 files changed, 510 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250404-k230-reset-32987c6f0ed5

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
