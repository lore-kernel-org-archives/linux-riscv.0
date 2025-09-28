Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD951CAC5BB
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 03:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ouSximxSba9Y3q7FhDZoH4AgLBZtL2AvhYjDtisXnSc=; b=BAg7wh2wMmK6/X
	rj1+QlyAGCT7QRN2xx+P8cxHrXNFgaer8O/oWcAheYtdqQlOmMdwhe/DhiIi7POwWlBiSfVG24l27
	Pif/f4Ai3qL1ENjyKDQOFSUdUyeOyvb8SJCU2cDP9PnjCbruWLuRgeh+ilh8rXG81yIHJZBQUDHDD
	9CUHKMGx+8IkgBRLR4qkRMCKMlRx1HQ/QudvwQPcsBly+8H2FWu2SdmBu8F6WHmk1B4hwPKSkY9ax
	ynWAPB6dChWiuJH6F7Reyp873uJB5/AMIwmSPHWP6snONeH+0BUcuPX/9JS/hwCD6tAzK3MC9Ig59
	+aJ1ZoMXuJBkjMMTVjow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2iMp-0000000DdCm-10J7;
	Sun, 28 Sep 2025 03:46:31 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2iMl-0000000DdBh-2AsL
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 03:46:29 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/2] riscv: dts: spacemit: Add initial support for MusePi
 Pro
Date: Sun, 28 Sep 2025 11:46:14 +0800
Message-Id: <20250928-k1-musepi-pro-dts-v1-0-64d0659dfdbc@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIav2GgC/x3MwQpAQBCA4VfRnE2taQmvIgfsYBK2HaTk3W2O3
 +H/H1AOwgp18kDgS1T2LSJLExjmbpsYxUUDGcpNRSUuGa6nshf0YUd3KOa2cGQGa6nrIXY+8Cj
 3/2za9/0APJ4m42MAAAA=
X-Change-ID: 20250928-k1-musepi-pro-dts-546d20c442ab
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759031178; l=997;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=leAHyipuOrrNM/GHdGoDUYGJ6EFVBQ6TUO5UvR4dHaM=;
 b=KyplklxWO12GVPU+bp0gZ7RAp9WhOAzlXhFOisv8yAJsjTObE2dUqJ6fdZAbisASFR/pKWyjm
 aH/L3CB9hIKBWAuh4KSRBKXJRrNG8EHIcAP/1kCZ3Ix/O6pdpBAZfHD
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_204627_716591_89832D69 
X-CRM114-Status: UNSURE (   5.36  )
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

This patchset adds initial device tree support for the MusePi Pro board.

Muse Pi Pro [1] is a single-board computer integrating a high-performance
RISC-V 8-core processor, storage, I/O and expansion capabilities into
a credit card-sized 1.8-inch board.

Link:
https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf
[1]

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (2):
      dt-bindings: riscv: spacemit: Add MusePi Pro board
      riscv: dts: spacemit: Add MusePi Pro board device tree

 .../devicetree/bindings/riscv/spacemit.yaml        |  1 +
 arch/riscv/boot/dts/spacemit/Makefile              |  1 +
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     | 40 ++++++++++++++++++++++
 3 files changed, 42 insertions(+)
---
base-commit: 0f084b221e2c5ba16eca85b3d2497f9486bd0329
change-id: 20250928-k1-musepi-pro-dts-546d20c442ab

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
