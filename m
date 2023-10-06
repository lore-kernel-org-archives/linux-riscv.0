Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8435E81DEC
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 12:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=doNDMQ8CMEAvDKJHQnWjzYjCYZQs0MaKY8MepLhDidc=; b=WXT4sIiAPtnhfq
	tZvP6r+F387PWE9YdVp8nnoAMTYLVp1DehYJEBJO9YGA8S8vtefiS/gWN6Wi8ofAiwWCzuepym6Ar
	2HMk0PLaWMfU074g28cKBWqX5p/rJv5nRQXm/EGobqZELWnq/7uFa7MyKqdfbwoJElaz9gs/7MpMw
	2X9Rbhf6dMCT0viAq/VxfXVrWY8u3wdrni1s7lMH6xX5dD1qWM9ZK6XYfhstuPwiSjbhzu915b4BI
	hAoxkOMU4wUDzeMEwN1hxXgoGNQeUqXnQLSavJRjghftIBJV/owoIrVJNqCu/MfdHbv27o+04eLmj
	IAd/V907KpHG8NKBs1iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qojvr-005mHq-2p;
	Fri, 06 Oct 2023 12:27:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qojvo-005mFd-2c
	for linux-riscv@lists.infradead.org;
	Fri, 06 Oct 2023 12:27:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 216E961D30;
	Fri,  6 Oct 2023 12:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5411BC433C9;
	Fri,  6 Oct 2023 12:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696595216;
	bh=5bXGHkGr5/pHhrZtZ+4lgLJE9Up06okKf8OassnSh44=;
	h=From:To:Cc:Subject:Date:From;
	b=OalVg+e1UaK1t79fT2L2WyGzQ3V37IVB/knbOYWzS0ETR1SpiEd+Sdm/ny9AXkh0O
	 n/Lyv7CYoqbxCD0pE2OTTyrE9+njF03o+DO63q2epvIRRJA5D5OJ94YIYP8Se/0CAJ
	 CBJr3lQAyl7/gyprO0nTrakrcI2NBhidpFUOxf+NpxEEbrTRkej9Im/xlIngew1yGL
	 QzWhWFBYMqBvQxQZqQU8JWBtsRVE0CKDsbZO5wUXVPXfYbBaLOBqERIaK6Hkp8OuV5
	 wd9cWXVcuNW0TTWyaazmqtJpvwiEO5yDpNLaNhOCyetdcjy+G1stfiE9yX6NRqhw4+
	 aNT2PQlulMGwA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Inochi Amaoto <inochiama@outlook.com>
Subject: [PATCH v2 0/5] Add Milk-V Duo board support
Date: Fri,  6 Oct 2023 20:14:44 +0800
Message-Id: <20231006121449.721-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_052748_891329_924448E7 
X-CRM114-Status: UNSURE (   8.76  )
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

Milk-V Duo[1] board is an embedded development platform based on the
CV1800B[2] chip. Add minimal device tree files for the development board.
Currently, now it's supported to boot to a basic shell.

NOTE: this series is based on the SG2042 upstream series[3] for the vendor
prefix and ARCH_SOPHGO option.

Link: https://milkv.io/duo [1]
Link: https://en.sophgo.com/product/introduce/cv180xB.html [2]
Link: https://lore.kernel.org/linux-riscv/cover.1696433229.git.unicorn_wang@outlook.com/ [3]

since v1:
 - fix dtbs_check warning
 - add clint node
 - sort dts in Makefile

Jisheng Zhang (5):
  dt-bindings: interrupt-controller: Add SOPHGO CV1800B plic
  dt-bindings: timer: Add SOPHGO CV1800B clint
  dt-bindings: riscv: Add Milk-V Duo board compatibles
  riscv: dts: sophgo: add initial CV1800B SoC device tree
  riscv: dts: sophgo: add Milk-V Duo board device tree

 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../devicetree/bindings/riscv/sophgo.yaml     |   4 +
 .../bindings/timer/sifive,clint.yaml          |   1 +
 arch/riscv/boot/dts/sophgo/Makefile           |   2 +-
 .../boot/dts/sophgo/cv1800b-milkv-duo.dts     |  38 ++++++
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       | 123 ++++++++++++++++++
 6 files changed, 168 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1800b.dtsi

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
