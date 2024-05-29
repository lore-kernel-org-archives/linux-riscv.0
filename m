Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321ADC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 19:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rAQOqbuFVyTgL9Nq1lMDbaiFydN0SNyP9jrZ5emy/88=; b=4ZvvaiNmR8YinW
	WBlazsyv44IdqLjsoxgmPm4jcsyD2ShAxT9jZjhlkeu2a0swuolsXtCN+XfFxt1NCCCk4cdCAcjCb
	hY+vJQkqt6D2K5rhIrh55ZUUoJPSzPHT+WgxbU2tngr7TiZHdde6XnKCWMMoEXLTATXcalnjDjcT/
	PGQqZUhSmvS4jOPco85YbDWscNLXYhDsQvoDteZWVmDSFw2dkJoxSz7+gIbinUslT9EKCJcmMjm8M
	OxL+PJ8INyzQm1ehXpWixtr/l+jmyR/OEGLUYhJD+PC4HzJF+HfjCEKU37gciJlppzspaOrdIBx9z
	b52mto+NvzT1/CzANZMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCPSY-00000005OPp-3uQQ;
	Wed, 29 May 2024 19:59:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCPST-00000005OO7-49Wy;
	Wed, 29 May 2024 19:59:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1FC8961C77;
	Wed, 29 May 2024 19:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 970E2C32781;
	Wed, 29 May 2024 19:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717012774;
	bh=qh84C1aPyUvP46Gu8Dv17j5i6PpcG0j1xKFVooUqkcE=;
	h=From:Subject:Date:To:Cc:From;
	b=r3QGKidWT4gN19Wv9KIVZLNIHhVjnObmNEvgLKX/521M45DWEkZSeYXtNaEUYAdIs
	 3OUgmfdVvbNYWqQqTLAOg8Jc8xvi+GaJdRdauRp+A5ecDvNbz8EkFaMqAnuaIXiTBq
	 p/nJAK2QoFbFM84yY1sPGNEAnOXWQj4ZuH8ZRCgKaJo6rwk7nMuyCKApuqbPTMfHG5
	 K5M9tqknIXkfcJVJLEVe+Rpz5QLJkYJmYSKmdEStO4YtgNOk2uujdE+28frpES1WI9
	 UOwB+Ypqt42Odt5wa4NrEoEkuwd/BCjj/Kl7R0gUxtUQq1Yw75ZRoNevC89LwdwD+w
	 EgbkF+EfZ9JYQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v2 0/2] of: Fix interrupt-map for fw_devlink
Date: Wed, 29 May 2024 14:59:19 -0500
Message-Id: <20240529-dt-interrupt-map-fix-v2-0-ef86dc5bcd2a@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABeJV2YC/x2MQQqAMAzAviI9WxhTEf2KeKjaaQ/O0U0RxL87P
 CaQPBBZhSP0xQPKl0Q5fAZbFjBv5FdGWTKDNbY2je1wSSg+seoZEu4U0MmNVLVTR841MxnIaVD
 O+t8O4/t+vykBzGYAAAA=
To: Saravana Kannan <saravanak@google.com>, 
 Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_125938_118994_6B228FEC 
X-CRM114-Status: UNSURE (   7.61  )
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

The duplicated parsing continued to bother me, so I've refactored things 
to avoid that for parsing the interrupt parent and args in the 
interrupt-map.

It passes testing with unittests on QEMU virt platform, but I don't 
think that catches the problematic cases. So please test.

v1: https://lore.kernel.org/all/20240528164132.2451685-1-maz@kernel.org/
 - Refactor existing interrupt-map parsing code and use it for 
   fw_devlink

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Marc Zyngier (1):
      of: property: Fix fw_devlink handling of interrupt-map

Rob Herring (Arm) (1):
      of/irq: Factor out parsing of interrupt-map parent phandle+args from of_irq_parse_raw()

 drivers/of/irq.c        | 127 +++++++++++++++++++++++++++++-------------------
 drivers/of/of_private.h |   3 ++
 drivers/of/property.c   |  30 ++++--------
 3 files changed, 89 insertions(+), 71 deletions(-)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240529-dt-interrupt-map-fix-a37b9aff5ca0

Best regards,
-- 
Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
