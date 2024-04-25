Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D88C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 08:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kDC2zgrh0P7SPTF3bBdaSeQnPLlQZObT4oDhEm7AHSo=; b=IWlTcuMi/cW8Z4
	WeeHJxbzSDdwjgDG7o4Rx7h8DBlGrTyFWYr+7AJV+MOXz+ZlvRBeD6vrvmmyAMo+SiChI9Tk/M2JJ
	5ejAIQEezP1xTJdi3tnWdXvW2g3IxdVv+t4dUacMibXQ4oqN951lNYv3nor3xyAu1mvT8AGmpzazn
	QFhNvu+nvHLVElFLg4C7BKXeDnQNK3IOZcnD4uO95wFdpLZuNcgrprxuJsDHtHsfn8/Gyk8Qi/K2q
	UoI+bwhxjZ+7pwcAn0C/OYP2e9yAHRdSqTh53EPAu16ZFaey5YGW+SLjpmAO3Ko9YYjbN5lB/dHAH
	naFV2LkApha9P0z00oUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzuNj-00000007Q36-2xMv;
	Thu, 25 Apr 2024 08:23:03 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzuNg-00000007Q1i-3XzO
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 08:23:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B5C3120009;
	Thu, 25 Apr 2024 08:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714033374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ua2r4iaJ4jH2x5xhCdB8EYqrV44YpWPYcR6DtftsZiY=;
	b=EJMEXnQKbA1ozjlJYHJ921LXaUfFUUhtrXxfDVodzrVKHmkTL/JIblbVe7iF5iKCg8vF+k
	0pPJ7Hpy0XLntZVM0XuZEAgHB/aovVLlq5am+yibMIOUAPyNSgZO0e1FHglmaIbHjsHfJU
	cjQaiGWr0oIk6z/AqKbrAoWnUFiBvbSjefU0GwfV41T8YlxnF309ITVJVYcqCAJSwG7RsA
	T5pnrxU38wL4RJftP2iJh4v1cQNJDU7iJajgP/vX7KmMUKY0+c2QjwhULr05SZSQcODkwB
	YMlpd71QP7uLEZ9gHCHz1s+tj+BSdu88iG56N7la9EW/PbysvE97C2crV2+7hA==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
To: jszhang@kernel.org,
	guoren@kernel.org,
	wefu@redhat.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: miquel.raynal@bootlin.com,
	thomas.petazzoni@bootlin.com,
	linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: [PATCH 0/4] Add I2C support on TH1520
Date: Thu, 25 Apr 2024 10:21:31 +0200
Message-ID: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_012301_051291_FA855D2E 
X-CRM114-Status: UNSURE (   9.04  )
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

This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
and a default configuration for the BeagleV-Ahead. It appears that the
TH1520 I2C is already supported in the upstream kernel through the
Synopsis Designware I2C adapter driver.
As there is no clock driver for this board as of today, this patch
series uses a fixed-clock named i2c_ic_clk.
There is also no pinctrl driver yet so pinmux must be handled manually
for now.
It also fixes the order of the nodes in the device tree to comply with
device-tree coding-style.

Thomas Bonnefille (4):
  dt-bindings: i2c: dw: Document compatible thead,th1520-i2c
  riscv: boot: dts: thead: Fix node ordering in TH1520 device tree
  riscv: dts: thead: Add TH1520 I2C nodes
  riscv: dts: thead: Enable I2C on the BeagleV-Ahead

 .../bindings/i2c/snps,designware-i2c.yaml     |  12 ++
 .../boot/dts/thead/th1520-beaglev-ahead.dts   |  22 ++++
 arch/riscv/boot/dts/thead/th1520.dtsi         | 120 ++++++++++++++----
 3 files changed, 127 insertions(+), 27 deletions(-)

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
