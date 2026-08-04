Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EFBC5518F
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 10:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d4u25dxAsDDLrnE+zUO1WuOQJxT7tOc/NG8lMfYkBpk=; b=Q0rVRsKqN5FVsR
	+L/2wV2gVrkQEl6dVBTxRAOw6SDio3kzjYTfYZiWDICAN0pVPliYyr56wOJRcsvXZr8d52+b+gxlU
	/loRhwh6vtDrfQEeb5P4KUA1fhEHC/qiHBHLYOeiFug0rMlKgq7rHxGjtQC8SVqMTkNoryOQDyc19
	irZ1WXLGrhnUnhGqS9+Ce7JL2Vohw4Tn5568s6mp8nDghZP3kxleCJ5EotPV0Tl7RRCSPDyVJkXmB
	I810YP7u7+ZsQDsqMrLWOlakLNVLgLt4kfrD/TCvrsf5/g+hTTLhqPWCxhsoiUtvYu9AK2IuIhjgI
	oOi+ItKb4L8NLoNfETSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCdU-00000001a4b-0ezH;
	Tue, 04 Aug 2026 10:44:40 +0000
Received: from naesa03.arrow.com ([216.150.161.23])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCdR-00000001a2y-2cuJ
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 10:44:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=1543; q=dns/txt;
  s=NAESA-Selector1; t=1785840277; x=1817376277;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=huJokbZK2j0U2j9/oiCh1A2JWOyzh7r/H9gs5WHit7s=;
  b=uNNzq5LzFTkZE3Q2tR5Z7tKVh8xwvJYlowglTM9n9frC2dHXFXnmghcR
   vonNB4ThaAahdfM6Ni+o4B/wZPZeKI5MzE+2HqaHuOnXyDU+RtxxzhNxK
   yNmv1Jws9CnX1xhdzpnwvTxxVserMugnOFGqa4+A3EpYi3lmXk2IjbhpC
   5NzOaZOVyBlrslnJ81Sley/qDFrAOQHPq10Td0WTbenbb//GiqLIn2SAl
   g7qU35cBcJp4FiCzrucpg2Pvc5PdsfKW68IG/f1Q9J2npK+92hKtCKnDE
   nKargGpLHpx3ifhP1nq0PAdlo5w17m1kMsCd61E0pPNHKcSOzCysNaJsY
   Q==;
X-CSE-ConnectionGUID: gza3tIoJTumNo5Azsmt2yg==
X-CSE-MsgGUID: 7k1iEY+kR6yG9oaBSMP1jg==
X-IronPort-AV: E=Sophos;i="6.25,204,1779170400"; 
   d="scan'208";a="119081801"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa03out.arrow.com with ESMTP; 04 Aug 2026 04:44:32 -0600
Received: from AHMCPU1888.localdomain ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Tue, 4 Aug 2026 16:14:31 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: [PATCH v3 0/8] riscv: eswin: eic7700: Add support for clocks, resets, pinctrl, HSP bus, I2C and watchdog
Date: Tue,  4 Aug 2026 16:14:23 +0530
Message-Id: <20260804104431.1391839-1-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-OriginalArrivalTime: 04 Aug 2026 10:44:31.0525 (UTC) FILETIME=[3B57AD50:01DD23FE]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_034437_721360_3F1C5D3C 
X-CRM114-Status: UNSURE (   8.28  )
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

Changes in v3:
- Rebased the patches to master branch of linux-next tree having
  latest tag: next-20260803.
- Updated dts file
  - Changed "clock_24m" to "osc".
  - Add the pinctrl-names and pinctrl-0 property for i2c, uart and
    pinctrl nodes.
- Updated eic7700.dtsi file
  - Changed the node name from "clock-24m" to "oscillator".
  - Changed the node name from "hsp-sp-top-csr" to "syscon".
  - Corrected the missing space after "=" sign in watchdog node for
    clocks property.
- Added "Acked-by" tag of "Conor Dooley" and "Mika Westerberg" for
  Patch 6.
- Link to v2: https://lore.kernel.org/all/20260706081055.1126275-1-pinkesh.vaghela@einfochips.com/

Pinkesh Vaghela (2):
  dt-bindings: mfd: syscon: add ESWIN EIC7700 compatible
  riscv: dts: eswin: add hsp bus node

Pritesh Patel (5):
  riscv: dts: eswin: add reset generator for EIC7700 SoC
  riscv: dts: eswin: add clock generator for EIC7700 SoC
  dt-bindings: i2c: dw: add ESWIN EIC7700 SoC I2C controller
  riscv: dts: eswin: add I2C controller support
  riscv: dts: eswin: add watchdog support

Yulin Lu (1):
  riscv: dts: eswin: eic7700: add pinctrl support

 .../bindings/i2c/snps,designware-i2c.yaml     |   1 +
 .../devicetree/bindings/mfd/syscon.yaml       |   1 +
 .../dts/eswin/eic7700-hifive-premier-p550.dts | 196 ++++
 .../riscv/boot/dts/eswin/eic7700-pinctrl.dtsi | 888 ++++++++++++++++++
 arch/riscv/boot/dts/eswin/eic7700.dtsi        | 234 +++++
 5 files changed, 1320 insertions(+)
 create mode 100644 arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
