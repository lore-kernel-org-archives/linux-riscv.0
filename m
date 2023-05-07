Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB600C77B75
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 18:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CGyBjCaMg8KTy/HArM6gK3XZcIvJAGOg23+jM1oD+4E=; b=zusiGNI3y+1143
	FK9n57s8EJ+H5M2eX223arVh7nOK8NDtlkqYbCBntImGCH0GrFdaFS92djdIBe+2IPOSL/dJ679hC
	qTgNGpV7CYyi5iMx2xuYUBpWjgqERQZpev4zRaXJQX7MQeCCRK8TyrMI30xC0MVMxqbRPD1w3hg+D
	BgD30Jh1L+jEh6Q6E5IcN4fzeN+kjVouytxAO6LJNKP15CURrLllQqfwFfJCtU3au4RVon50mrgVE
	6dIdDtLVqmqH8dlzX91hsCLIb1polR9qXe0TJjgd4KuZ19Ux2NCgYBS3JVO/yeYNWbu7DaF6wDOPi
	EFc0Y2MucEoG9aJXaTKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvjD7-00GYEO-0E;
	Sun, 07 May 2023 18:34:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvjD4-00GYE2-1q
	for linux-riscv@lists.infradead.org;
	Sun, 07 May 2023 18:34:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8B9B560FB1;
	Sun,  7 May 2023 18:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691D1C433D2;
	Sun,  7 May 2023 18:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683484453;
	bh=6wkccwfFp70jUqmzDa70DrICPNNNF/6YSnMyCoDzYtA=;
	h=From:To:Cc:Subject:Date:From;
	b=GGfJb8xhCtbBizsSgq+L/pzFC+wkkmQpgHPMmB2mCjLgflAzd1Jz4/tmtpjbC4qVl
	 latiE9fgxVZ0BitcJNUdSCf7T5/A4dEXi6ytz/HhYq3qlpRparmrSSccKBVMQ65UQw
	 pQFhGKhIMe/4ubpF4kqqezODN9244vkj2GaOBU0KwswKkuiHdPZHvW6kTzJsvqSHEp
	 6SVC5mFuPhZfVAoHSV/mTzlEd5M61gV6cREX2WkExyYl3ioaB0vV8hYohrkBABxWK5
	 Kg/JWGMiaaVJ3eBqnVKpAdrOyXnUdtU98a0TOROKFJ8fvYr1rwG4uYdeLyPL9rplCo
	 w1aiD2EpYsSHw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH 0/5] Add Sipeed Lichee Pi 4A RISC-V board support
Date: Mon,  8 May 2023 02:22:59 +0800
Message-Id: <20230507182304.2934-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_113414_669708_ABF7E3B9 
X-CRM114-Status: GOOD (  10.59  )
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

Sipeed's Lichee Pi 4A development board uses Lichee Module 4A core
module which is powered by T-HEAD's light(a.k.a TH1520) SoC. Add
minimal device tree files for the core module and the development
board.

Support basic uart/gpio/dmac drivers, so supports booting to a basic
shell.

Jisheng Zhang (5):
  irqchip/sifive-plic: Support T-HEAD's C910 PLIC
  riscv: Add the T-HEAD SoC family Kconfig option
  riscv: dts: add initial T-HEAD light SoC device tree
  riscv: dts: thead: add sipeed Lichee Pi 4A board device tree
  MAINTAINERS: add entry for T-HEAD RISC-V SoC

 .../sifive,plic-1.0.0.yaml                    |   4 +
 MAINTAINERS                                   |   6 +
 arch/riscv/Kconfig.socs                       |   6 +
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/thead/Makefile            |   2 +
 .../dts/thead/light-lichee-module-4a.dtsi     |  38 ++
 .../boot/dts/thead/light-lichee-pi-4a.dts     |  32 ++
 arch/riscv/boot/dts/thead/light.dtsi          | 454 ++++++++++++++++++
 drivers/irqchip/irq-sifive-plic.c             |   1 +
 9 files changed, 544 insertions(+)
 create mode 100644 arch/riscv/boot/dts/thead/Makefile
 create mode 100644 arch/riscv/boot/dts/thead/light-lichee-module-4a.dtsi
 create mode 100644 arch/riscv/boot/dts/thead/light-lichee-pi-4a.dts
 create mode 100644 arch/riscv/boot/dts/thead/light.dtsi

-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
