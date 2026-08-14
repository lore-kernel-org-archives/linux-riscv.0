Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AEFC5CFCF
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 07:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sS4Mehq5NFf85Pfw7l8QZttj7fgaHA1C742Qf1+aT/k=; b=Grk0hC0ocaAod/
	afV7ty3r6c6ss9hKJ4Bl0V1ALJLxsm6A2VjBrJSiLnjQBr2Ba+U9s5S34yBaOzSwQzJ/DfS4dPnM1
	+Ta52cfXpd//2x4NMbKQ/RXTFG+p0CEcDCgod8Bc5mTbC4hwJD7YBlA6VQ9W1Iquj6ois24p5rg+8
	+JoRsKKQnHRULWvJwI23tWJIFSESu1ndh9x4ZnLXeWMoZHGK2wjyW4h7J4wUo42aJFNydtpEg8Ob5
	qkwhHWMorqKc0GqFyFigMmZ/UFcnnkcPsmGe3AIKsyA/kyPdDL0sizSUbV7xVohXo+Z+spL8ZScEK
	niRrMK2KZuCLOj6Y9zdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wults-000000024IO-27wX;
	Fri, 14 Aug 2026 07:00:20 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wultp-000000024Gj-0M5V
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 07:00:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=1345; q=dns/txt;
  s=NAESA-Selector1; t=1786690817; x=1818226817;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=35kPGPxm6j/S2N/cOMJwAviB4ZxNUz3laule5pBoHr0=;
  b=kq8CWGo8pOjYSJBiPhWjc8KWJKIC6EbycEKOLgT4hk6Opx/EuH6ptNpL
   qWcYTZJ6oI0kQecXeaB1s0XCysf8VocLlACar0D8/janl8lueB6euYJYZ
   g69HyR1qlovYexStXRPVb4kxedxWN/1hq1piVvdw1fmi26XCxUh5ub/rm
   J8J8MGptaTvblMUZTs9dMfoLdZkdWetYHBCjesZclpQjJkUMUdzrjQhG6
   cAIYbv7JxxBV3JD7UhmpNt6Kf+9UDGT1TqqzRjmZQ9L5bUKEyfrF6ZJgM
   VWUBMGEWM5xubL2xaJAFWoQzv3XPw+FkcNzt7T7aF5259MAyRT25fk48N
   A==;
X-CSE-ConnectionGUID: BHrq8KbTTByQZw+c4gDD0A==
X-CSE-MsgGUID: 2F51CKzgTdan5WszVrpnZA==
X-IronPort-AV: E=Sophos;i="6.25,222,1779170400"; 
   d="scan'208";a="60479704"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 14 Aug 2026 01:00:08 -0600
Received: from AHMCPU1888.localdomain ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Fri, 14 Aug 2026 12:30:07 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v4 0/7] riscv: eswin: eic7700: Add support for clocks, resets, pinctrl, HSP bus, I2C and watchdog
Date: Fri, 14 Aug 2026 12:30:00 +0530
Message-Id: <20260814070007.1662455-1-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-OriginalArrivalTime: 14 Aug 2026 07:00:07.0521 (UTC) FILETIME=[8A4D3510:01DD2BBA]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_000017_321646_211813D2 
X-CRM114-Status: UNSURE (   6.69  )
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

Changes in v4:
- Rebased the patches to master branch of linux-next tree having
  latest tag: next-20260813.
- Updated dts file
  - Corrected the pinctrl-0 property for i2c nodes.
- Drop "dt-bindings: mfd: syscon" Patch as it is already applied [1].
  This was Patch #4 in v3
- Link to v3: https://lore.kernel.org/all/20260804104431.1391839-1-pinkesh.vaghela@einfochips.com/

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/Documentation/devicetree/bindings/mfd/syscon.yaml?h=next-20260813&id=d86dadc6feeaa86b6a29db5509bfe8c65b66c7b2

Pinkesh Vaghela (1):
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
 .../dts/eswin/eic7700-hifive-premier-p550.dts | 196 ++++
 .../riscv/boot/dts/eswin/eic7700-pinctrl.dtsi | 888 ++++++++++++++++++
 arch/riscv/boot/dts/eswin/eic7700.dtsi        | 234 +++++
 4 files changed, 1319 insertions(+)
 create mode 100644 arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
