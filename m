Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C24EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 08:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YkG2BCvhBGUWj6dvzX7B+fue/2Y7bNr1r931cXnz1zU=; b=iKdDzSlAKSjLZP
	YygP9EmnPK1Npumdlv2rOOEJPJc4/97XYmQQjYpoj6gkb9LgKPeOCGS7yX/fgtNN34o/JghDNFdW2
	Vg1NvNGRYGaFu86XYDVmaxS3O3vzfwgjYPcOPhd2J5bglckse4QDIwSKAlIY4DWIY+vWov+SgDDh7
	hsARUBA68PpY0SoZmwr7a02IHj/U74xc79KJY+Sk0dkh39GW1gCOMDmpToYq8TPqriFsEBhmx7uqS
	aWfYX5JAkZQZoeqjmdiwul3rv/0KrO8tNHPbH20OncAVfI+0CSE9l87BFz7sZt0kR/jV6IJGohbZF
	tUvn45V0lRuWWObKPM1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE3jg-00CVhh-2c;
	Tue, 27 Jun 2023 08:07:40 +0000
Received: from mta-65-226.siemens.flowmailer.net ([185.136.65.226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE3jc-00CVeu-0h
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 08:07:38 +0000
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20230627080728f840021c23d28156e5
        for <linux-riscv@lists.infradead.org>;
        Tue, 27 Jun 2023 10:07:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=felix.moessbauer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=lhHygCuH5pZN5/X93OS/Oo5FJ9iukKAx9xcVfBzbV34=;
 b=UiJggPzYIrLpAEHsgKmyKwOmO4Tm2GrMNFvXsHV3PK2w2jDMpS9iFowPpyvfQljGBdOeSn
 t7UB1jqk9qRHRnr2WN23m/609bWTWmVIrHppiBp8BQzhaY6WQpoy68SaTnPIplrsnK3jW6Ph
 5pQ6DMqOGpqd4Fll33Ts9hD5b4bEs=;
From: Felix Moessbauer <felix.moessbauer@siemens.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Daniel Bovensiepen <daniel.bovensiepen@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Felix Moessbauer <felix.moessbauer@siemens.com>
Subject: [PATCH 1/1] riscv: dts: Enable device-tree overlay support for starfive devices
Date: Tue, 27 Jun 2023 16:06:20 +0800
Message-Id: <20230627080620.329873-1-felix.moessbauer@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-72506:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_010737_331729_F0EC8FB9 
X-CRM114-Status: UNSURE (   8.87  )
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

Add the '-@' DTC option for the starfive devices. This option
populates the '__symbols__' node that contains all the necessary symbols
for supporting device-tree overlays (for instance from the firmware or
the bootloader) on these devices.

The starfive devices allow various modules to be connected and this
enables users to create out-of-tree device-tree overlays for these modules.

Please note that this change does increase the size of the resulting DTB
by ~20%. For example, with v6.4 increase in size is as follows:

jh7100-beaglev-starlight.dtb 6192 -> 7339
jh7100-starfive-visionfive-v1.dtb 6281 -> 7428
jh7110-starfive-visionfive-2-v1.2a.dtb 11101 -> 13447
jh7110-starfive-visionfive-2-v1.3b.dtb 11101 -> 13447

Signed-off-by: Felix Moessbauer <felix.moessbauer@siemens.com>
---
 arch/riscv/boot/dts/starfive/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
index 170956846d49..0141504c0f5c 100644
--- a/arch/riscv/boot/dts/starfive/Makefile
+++ b/arch/riscv/boot/dts/starfive/Makefile
@@ -1,4 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
+# Enables support for device-tree overlays
+DTC_FLAGS_jh7100-beaglev-starlight := -@
+DTC_FLAGS_jh7100-starfive-visionfive-v1 := -@
+DTC_FLAGS_jh7110-starfive-visionfive-2-v1.2a := -@
+DTC_FLAGS_jh7110-starfive-visionfive-2-v1.3b := -@
+
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-beaglev-starlight.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-starfive-visionfive-v1.dtb
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
