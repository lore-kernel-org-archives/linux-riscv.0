Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB7CCD585E
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 12:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ngrrfN8TcCR6Un3PdQVkSf8p+DON039/le9zdfg6Bxw=; b=T1yTPZCkOFCZqr
	KnG5KqH9XwrEZZCdDTp3Qx8GAgNGeDFO6zZpZYldQe4aTyT7CQP3OQR4y6dgPtC3732CMjys+46JH
	a8By1a1wOQa3mGkawX30SpcP3rrsbCfrdCbQE9SzJPkP4UwXkI97qIPQO/KDMYvs09ojMGtZMSzgC
	KDafIDgv2YDH8EBSxLWT1xQbiNYXOxy5mZpfShStpkDt4tuAs4iqc4H+Xu0VZXkMA9JFMxhtlbrdj
	CG61IzDTdeSq26yBRz7q6mW6BRljs5WZ32QfD9S5LA71CKrVI4bzSda4b0JSm/3oxoaBA6aJPw3Yq
	WnTmTn/Ac/9VZZRq+Wxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSIW-0000000Es3y-0ckH;
	Wed, 07 Jan 2026 12:05:56 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSIS-0000000Es3a-46Lh
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 12:05:54 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767787544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qIBZpkr3zGOGkYn0Srs3lb3/uwtfOhZkPU6oiwFvGgQ=;
	b=DCaA+9pwAtKAxIIvlt3COCRV0Zbl+tvj00ZDBjI2qcUA9R9dRd5Q9YThMTr+PpfMpML39D
	Lb6HMKHgbWzyD9GzgWUakZ7u6PdZCej9oHjyCUkIgBPXdo93O+cGJ/oYo2X7dO7d9MeHhB
	kgxgwFFrk5PJHv4JpxZF//pqt1VEOHM=
From: Ze Huang <huang.ze@linux.dev>
Subject: [PATCH v2 0/3] riscv: dts: spacemit: Add USB 3.0 support for K1
Date: Wed, 07 Jan 2026 20:05:29 +0800
Message-Id: <20260107-k1-usb3dts-v2-v2-0-e659b0f8fe1a@linux.dev>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAlMXmkC/yXMywqDMBCF4VeRWTcwGdtM9FWKi1zbUNQ2USmI7
 95Ql9+B8+9QQk6hQN/skMOWSpqnCro04J5megSRfDUQkkKJLF5SrMW2filiI0GEDqNhRjJQP+8
 cYvr+e/fhdA6ftWaXcwRrShBuHse09M01Knaa2XSoOqfQRytZMbY6WnOTGq2T5JWG4Th+pRoK2
 KsAAAA=
X-Change-ID: 20260107-k1-usb3dts-v2-220c0fa7702a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ze Huang <huang.ze@linux.dev>, Aurelien Jarno <aurelien@aurel32.net>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767787540; l=1166;
 i=huang.ze@linux.dev; s=20250705; h=from:subject:message-id;
 bh=Eo2jae2+EaOsg4QRLr6rm46ZFCeUQs8342559mK0nzU=;
 b=L06nVBpo3SmSV4k5dBFhCbzGFMO4igTy7hGMMXmNxyzqsIUm1covIT4CWlJAQ82meoEHMfVqX
 ngIqUxUEU0NDxsDNbWR281VCVDgs7dDOj/qPHOYDUfu6tfHXvMZzqzX
X-Developer-Key: i=huang.ze@linux.dev; a=ed25519;
 pk=Kzc4PMu5PTo8eZZQ5xmTNL9jeXcQ9Wml0cs+vlQpBkg=
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_040553_261696_DF064494 
X-CRM114-Status: UNSURE (   5.76  )
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

This patch series enables the DWC3 USB 3.0 host controller on the
Spacemit K1 SoC and enables it for the Banana Pi F3 board.

For testing, the following kernel configurations should be enabled:

CONFIG_PHY_SPACEMIT_K1_USB2=y
CONFIG_PHY_SPACEMIT_K1_PCIE=y
CONFIG_USB_DWC3=y
CONFIG_USB_ONBOARD_DEV=y

This series is based on the spacemit k1/for-next branch.

Link: https://github.com/spacemit-com/linux

Signed-off-by: Ze Huang <huang.ze@linux.dev>
---
Changes in v2:
- rebased on spacemit k1/for-next
- Link to v1: https://lore.kernel.org/all/20251101-k1-usb3dts-v1-0-dd2660e5740b@linux.dev/

---
Ze Huang (3):
      riscv: dts: spacemit: Add USB2 PHY node for K1
      riscv: dts: spacemit: Add DWC3 USB 3.0 controller node for K1
      riscv: dts: spacemit: Enable USB3.0 on BananaPi-F3

 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 48 +++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 32 +++++++++++++++++
 2 files changed, 80 insertions(+)
---
base-commit: 4f67c877a9069c60dfb1767038fba5180bc12d68
change-id: 20260107-k1-usb3dts-v2-220c0fa7702a

Best regards,
-- 
Ze Huang <huang.ze@linux.dev>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
