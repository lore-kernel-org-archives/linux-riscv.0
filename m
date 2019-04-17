Return-Path: <SRS0=fLp7=ST=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08B8C282DC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2019 16:55:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 722A020835
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2019 16:55:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R0l+jSON";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=akkea.ca header.i=@akkea.ca header.b="hgRh1mps";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=akkea.ca header.i=@akkea.ca header.b="WaXPPY3b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 722A020835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=akkea.ca
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=+d5NosM1kQ1vGk3+lCgjF1prI2JZJBHei+QvvtHn63U=; b=R0l
	+jSONYjioHUVkRCkmYhF9QrRB8Pr11d2ikSb8SZyUvgR9W9DHzoetA7p9RI8msFBFVgbtmMXjO4dc
	Rsny8w7mfBPNorhIW3TNpVOdhpIhJ5ERqE8Xie4qMuVD1vjxz5aB8seaSk0ET7mhMJFl+9sAhLUHx
	xXe6wNdq3DzOWipr9Cens7fOWTihcxFHBsq0NUKyzUVQnURFKlL3APnBLPjsOP9PowLcd9KcV1R8D
	NmQm5pgUeunx1yVIBCSBl6Vr/oc98IcPAjc1jjttzRRYwQaB4Ev8muT6epReoH73wy4/udmB6FlZy
	0P9rsvFG/taIBVdgsFMWtMlO18XReeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGnqQ-00046P-Vg; Wed, 17 Apr 2019 16:55:34 +0000
Received: from node.akkea.ca ([192.155.83.177])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGnqH-0003vz-23; Wed, 17 Apr 2019 16:55:26 +0000
Received: from localhost (localhost [127.0.0.1])
 by node.akkea.ca (Postfix) with ESMTP id 1AAFE4E204E;
 Wed, 17 Apr 2019 16:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1555520124; bh=1yUusGBdcu5BEoPIKK0Fan8/wFVNluzZyLTp08YWMeY=;
 h=From:To:Cc:Subject:Date;
 b=hgRh1mpsRxpg5ENqByC5HqzLfs/Ht+pZ+kAyrP4WkgXXgecF3rSnsqgDl+CCDO9sU
 irF6y627X2aGN6xLKFeTdVtuTAseVDmOkv34e2lynSguwnF0QPMdcFsw7X3Jt7B8Tt
 XeEHRPdob6+LyZXP0wlJYrtd9t64lXna//kcPiXI=
X-Virus-Scanned: Debian amavisd-new at mail.akkea.ca
Received: from node.akkea.ca ([127.0.0.1])
 by localhost (mail.akkea.ca [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I2ScYVgCG2q8; Wed, 17 Apr 2019 16:55:23 +0000 (UTC)
Received: from midas.localdomain (S0106788a2041785e.gv.shawcable.net
 [70.66.86.75])
 by node.akkea.ca (Postfix) with ESMTPSA id 90D7B4E204B;
 Wed, 17 Apr 2019 16:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1555520123; bh=1yUusGBdcu5BEoPIKK0Fan8/wFVNluzZyLTp08YWMeY=;
 h=From:To:Cc:Subject:Date;
 b=WaXPPY3bDvMxkhFHrJNy9UIpKSU5lK/PN83HNu6/dpcY3KCClrLqdlxoB4b4D2xHc
 rGYCVdaPDzDGorxCFwpvRLTUawGvS94EpH5FwHijlRY+I2N3B+kR9NOEWaU747RABB
 l/HFEybDwQWgq4VAsAca3VFH3V9mywFPz6M4vyBI=
From: "Angus Ainslie (Purism)" <angus@akkea.ca>
To: angus.ainslie@puri.sm
Subject: [PATCH v5 0/3] Add support for the Purism Librem5 devkit
Date: Wed, 17 Apr 2019 09:55:11 -0700
Message-Id: <20190417165514.18689-1-angus@akkea.ca>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_095525_158719_DA3A7A24 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Jacky Bai <ping.bai@nxp.com>,
 Palmer Dabbelt <palmer@sifive.com>, Bruno Thomsen <bruno.thomsen@gmail.com>,
 m.felsch@pengutronix.de, Guo Ren <guoren@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, Thierry Reding <treding@nvidia.com>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Aisheng Dong <aisheng.dong@nxp.com>,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The Librem5 devkit is based on the imx8mq from NXP. This is a default
devicetree to boot the board to a command prompt.

Changes since v4:

Compiled against linux-next next-20190415.
Added imx8mq to the arm yaml file.
Re-arrange regulator nodes to dropp undefined supplies.
Additional ordering for aesthetics.
Split some long lines.
Added lots of blank lines.
Moved pinctl muxes to where they are used.
Cleaned out reg defintions from regulator nodes.

Changes since v3:

Freshly sorted and pressed nodes.
Change the backlight to an interpolated scale.
Dropped i2c2.
Dropped devkit version number to match debian MR.

Changes since v2:

Fixed incorrect phy-supply for the fsl-fec.
Dropped unused regulator property.
Fixup Makefile for linux-next.

Changes since v1:

Dropped config file.
Updated the board compatible label.
Changed node names to follow naming conventions.
Added a more complete regulator hierachy.
Removed unused nodes.
Removed unknown devices.
Fixed comment style.
Dropped undocumented properties.


Angus Ainslie (Purism) (3):
  arm64: dts: fsl: librem5: Add a device tree for the Librem5 devkit
  dt-bindings: Add an entry for Purism SPC
  dt-bindings: arm: fsl: Add the imx8mq boards

 .../devicetree/bindings/arm/fsl.yaml          |   7 +
 .../devicetree/bindings/vendor-prefixes.txt   |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mq-librem5-devkit.dts   | 833 ++++++++++++++++++
 4 files changed, 842 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
