Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB78C44501
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 08:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KuVuWF9WO70SstmmiiFSzI44QongJx/EDIDGw+p5dgg=; b=T5Kqrkux9XpDGZ
	XKnjzplGOlxsXpQY8PDNpf8g0jBS1N88KkbF/TIwK6yMEJwarjy39g3/NrEaPeEzK1tcNHwaOmuU2
	pxKERQG5w+KvC9fQksHfb/M9VHTSp9nE93d7/tD9bZWfCQVHxN73hcS4rhXhrUS1TPH7gASDCfEKq
	E6+93AF0KsSAvHzS7W2PwqeMefSBPUwmZdIO/bjdWcgP7EcM4EB0YEoG02VI6quE/0eiTPKAgJJJ9
	yhRkAZrYJGrGskXs7ZHnX6MvS18gPKutFXqTjB8aCATfveEsHegW1tCENR2v5eLEaSwKmbVKvyywQ
	kqPILxQTHG5vGYCWulqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgePy-0000000Bmk8-38kN;
	Mon, 06 Jul 2026 08:11:06 +0000
Received: from naesa04.arrow.com ([216.150.161.24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgePv-0000000Bmhy-3Nao
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 08:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=1762; q=dns/txt;
  s=NAESA-Selector1; t=1783325463; x=1814861463;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DsT3k1JxGiBxu8sTPdmZdN71lJZTeiOhorI0VrVBI4Q=;
  b=P1QDo9r5yqLP2YQw17GoP5re3ugRfHZn6qxAllOmiJaEoXKa81YuIq2/
   riwpwZKoB6xDN4cHrkiZbeR3To0c9I8QACOIRvdzWxQ3BeYDoHZ7r3Y2Y
   mC+yJ/kZFdH2NUOSGwl/f4JuBq+nNvSszaNM05YcjrZeokYlud/Tbz+zu
   W281Jol7h7DZXebTOlUMpO31yBbuPaLdWbdCne7x2KYnS9dNDTud7QGaO
   brmW8PkGv4CR2Jgz0jGrmr2i7IeJjJC+CnnIUUtNztm6AbAgbPC4zCxgX
   jIKMX3chskfolcHdbwdPjU8xpKl7Y3VxQI51IOEfg/QR/v/O91seIQNYT
   g==;
X-CSE-ConnectionGUID: NVvB3EIJSByZH2LZBdT1og==
X-CSE-MsgGUID: bMT16DHrRf6HHs5PKGfdcg==
X-IronPort-AV: E=Sophos;i="6.25,149,1779170400"; 
   d="scan'208";a="116963495"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa04out.arrow.com with ESMTP; 06 Jul 2026 02:10:56 -0600
Received: from AHMCPU1888.localdomain ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Mon, 6 Jul 2026 13:40:55 +0530
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
Subject: [PATCH v2 0/8] riscv: eswin: eic7700: Add support for clocks, resets, pinctrl, HSP bus, I2C and watchdog
Date: Mon,  6 Jul 2026 13:40:47 +0530
Message-Id: <20260706081055.1126275-1-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-OriginalArrivalTime: 06 Jul 2026 08:10:55.0812 (UTC) FILETIME=[F85EB840:01DD0D1E]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_011103_904912_EEC5271A 
X-CRM114-Status: UNSURE (   9.13  )
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

Changes in v2:
- Rebased the patches to kernel v7.2-rc2
- Updated dts file
  - Changed "xtal" to "clock_24m".
  - Changed the node name from "vcc1v8" to "regulator-vcc1v8".
  - Changed the node names from "pac1934" to "adc" and "ina226" to
    "power-sensor".
- Updated eic7700.dtsi file
  - Changed the label from "xtal" to "clock_24m".
  - Changed the label from "hsp_power_domain" to "hsp".
  - Added soc-specific compatible string for all i2c controllers.
- Updated pinctrl.dtsi file
  - Corrected the function of rgmii0, rgmii1, and the i2s pin groups.
- Added "Acked-by" tag of "Conor Dooley" for Patch 4.
- Updated the commit message for Patch 5.
- Added patch(#6) that introduces ESWIN specific compatible string
  "eswin,eic7700-i2c" in snps,designware-i2c.yaml file.
- Link to v1: https://lore.kernel.org/lkml/20260615122016.1110206-1-pinkesh.vaghela@einfochips.com/

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
 .../devicetree/bindings/mfd/syscon.yaml       |   2 +
 .../dts/eswin/eic7700-hifive-premier-p550.dts | 182 ++++
 .../riscv/boot/dts/eswin/eic7700-pinctrl.dtsi | 888 ++++++++++++++++++
 arch/riscv/boot/dts/eswin/eic7700.dtsi        | 234 +++++
 5 files changed, 1307 insertions(+)
 create mode 100644 arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
