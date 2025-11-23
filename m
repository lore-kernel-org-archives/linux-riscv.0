Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D068CFD2F6
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Nov 2025 22:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dTamsDQ5MCvGeo/ke3jwtrPdSYzIf0teSzK0uCBi1OQ=; b=lbWHxSs6redhck
	vQXtagOboVvLJHIovoO8uNC+ZTtjTqK/DyctiAxX5QkKOKzYJin0Bfap6Jmi91eMMv9KEiq2qg4ci
	UAXdmEk7dW8DpuP5zx1LNib3TtpuW6EJtiRG2DMhKFL9ENDHS9/3UGrZRIkifZ13o58dkHUzMMCnX
	WjJmeZt0IBzNx7ZhpT0FkZT1u3myBZqrGfraJj5th7zfadjvsIlkdMMk7idIS9bbG+2qXpfeelmJu
	ahRkxvaGOJpVcmlChtrYvS+CstgH+z+ovAdywEsco3rk+O+f/JcuHGUk4fMsI+5L8UNV7xJhACx5m
	QJxo3XQtQTMOHB+fLDlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNIwA-0000000Akvg-1tg5;
	Sun, 23 Nov 2025 22:52:06 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNIw7-0000000Ako3-49RA
	for linux-riscv@lists.infradead.org;
	Sun, 23 Nov 2025 22:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1763938291;
	bh=wosiOaQZUhu7EKm1DwKUdmsa8HOLli5/tH3gn4fvomA=;
	h=From:To:Cc:Subject:Date:From;
	b=gOrcXBkouNCxFVtXvATn08C3P93nqbetX/zPoV3tFbrFTgMBl4Uxr05yXLtZ8nTSX
	 zrPd5CSWvVPta1PwpJXaH2Em2hrhMEmZiXkFujzQfIF4MWMGlySX3PWCQCizZ2fdRf
	 57Z99xUd9fSAZrdbc8hhSVN48G15TDwcViQfi3nSqqCJjQY/pmgPQvIYo/5CFMbgd6
	 5330BXbQyOTwZOq/GeCiyw6US/9Us8YQxMxksSkSiVVGxqt4MgHnYPhPA4nuUmUNWu
	 QeIc1miDCPfuyjCpviN+1YZUBRL1r43uWRE7lsYyxAGHUIz8GuZ4MsxWaSeunfsDHY
	 PsSmK/QO5/EYw==
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 2BFEDB220120;
	Sun, 23 Nov 2025 23:51:29 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH v3 0/2] riscv: dts: starfive: Add OrangePi RV board
Date: Sun, 23 Nov 2025 14:50:43 -0800
Message-ID: <20251123225059.49665-1-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_145204_501866_88FA2F7C 
X-CRM114-Status: UNSURE (   8.89  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, E Shattow <e@freeshell.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Icenowy is busy and so with their permission I have applied v2 review
feedback. Additionally I revise the commit messages. This should now be in
good shape for -next

- E

Changes since v2:
- enable active high mmc1 card detect gpio
- drop delete-node from mmc0 reset pins following commit fa939a287224
  ("dts: starfive: jh7110-common: split out mmc0 reset pins from common 
  into boards")
- sort phy0 properties rx before tx
- revise commit description of SoC peripherals as list
- revise commit description of compatible binding

Changes in v2:
- Property order change mentioned in the review of v1.
- Added Wi-Fi (along with the always on VCC3V3_PCIE regulator, which is
  used to power up WIFI_3V3). The OOB IRQ is still not possible to use
  because of some incompatibility between StarFive pinctrl driver and
  brcmfmac.
- Removed the LED because it's in common DTSI.

Icenowy Zheng (2):
  dt-bindings: riscv: starfive: add xunlong,orangepi-rv
  riscv: dts: starfive: add Orange Pi RV

 .../devicetree/bindings/riscv/starfive.yaml   |  1 +
 arch/riscv/boot/dts/starfive/Makefile         |  1 +
 .../boot/dts/starfive/jh7110-orangepi-rv.dts  | 76 +++++++++++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts


base-commit: 1088d49b626487777913079bef0db3adef4bfb4a
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
