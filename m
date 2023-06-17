Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD25EB64DD
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jun 2023 16:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sB4wGRlaAPAnsrZaYrrJroBfw9vsXuQzMYnm8X3rPIw=; b=jZJEIHhlMzv3FW
	9D+iRPZ+seJ4B4kDbnu4E/QDDFjM2OVg8wD8Ft+joJZLcOt1OysMqEc40v/+ZWFzMR8KMOJvxjuK/
	qmjCFMsqNp+1/8vOs3lLm1UD2NahVYImC0L4pjE0QK8O7lZdsf1BQkn+1B2ShnRaqCguXJDnMqC2X
	kuo6oJHy/Lt4BVBD05EQ3Zz5MzHqNpN7cn/5cah3ht097e4XRihIOCwrJMJIMVHx6iVa9c13wH/V2
	up8h539Kqgx9gKyNh42JDhl49OfpYQSTdOeb/CoWkwo68mv2x9G3UkUCGncd2ZljfxCGWhE9YsLi/
	eqKY9UCdY246SoAJz4DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAYlM-003tSE-2v;
	Sat, 17 Jun 2023 16:26:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAYlJ-003tRr-30
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jun 2023 16:26:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 315BE60ADC;
	Sat, 17 Jun 2023 16:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703E8C433C0;
	Sat, 17 Jun 2023 16:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687019212;
	bh=7whImffFsXNXDTUSndk8VRw8HLujcf+MIoj28Sa/Sis=;
	h=From:To:Cc:Subject:Date:From;
	b=Spid7fkQoa7mD6jP8afMn0ZMHtWS0hnOJOwdOlG/zGMBTA/Q92s1OiZkGG2yfDaAX
	 OZ7SAnEjhXGimqC39e7wWtBhJKdUGEwU7KDHKWRdj7bDjc8w1LOMu9tT5kFcqldx9e
	 e2JqjwxrmYCciHwjWHHf6wDUNpdyioM/pq4e5qXDUTyGA/uySHErsV2PdTV6RhrtCu
	 4Wi/oJ+5MdBLs77TR5bE0r6dTR9A1EdwIZb6CYgEiHF3rFIipBE9qufSkma9MXAb5V
	 uUAvz0E3IsHsJCDOrangX5pl21erj3lv1MTc0V6W2AtbmHawJBhP8y79Xfd2pufeQs
	 wHG4SxOvB5oog==
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
Cc: Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/8] Add Sipeed Lichee Pi 4A RISC-V board support
Date: Sun, 18 Jun 2023 00:15:21 +0800
Message-Id: <20230617161529.2092-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230617_092654_078522_8252778F 
X-CRM114-Status: GOOD (  13.11  )
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
module which is powered by T-HEAD's TH1520 SoC. Add minimal device
tree files for the core module and the development board.

Support basic uart/gpio/dmac drivers, so supports booting to a basic
shell.

NOTE: the thead cpu reset dt-binding and DT node are removed in v3. This
makes secondary CPUs unable to be online. However, minimal th1520
support is better than nothing. And the community has been working on
and will work on the cpu reset dt-binding, for example, Conor, Guo and
Jessica are discussing about it, I have seen valuable comments and
inputs from them. I believe we can add back cpu reset in next
development window.

Thanks

Since v2:
  - remove thead cpu-rst dt-binding doc and its DT node from th1520.dtsi
  - collect Reviewed-by and Acked-by tags
  - update uart reg size as suggested by Yixun
  - Add Guo Ren and Fu Wei as THEAD SoCs Maintainers

Since v1:
  - add missing plic, clint, th1520 itself dt-bindings
  - use c900-plic
  - s/light/th1520
  - add dt-binding for T-HEAD CPU reset
  - enable ARCH_THEAD in defconfig
  - fix all dtbs_check error/warning except the CPU RESET, see above.

Jisheng Zhang (8):
  dt-bindings: interrupt-controller: Add T-HEAD's TH1520 PLIC
  dt-bindings: timer: Add T-HEAD TH1520 clint
  dt-bindings: riscv: Add T-HEAD TH1520 board compatibles
  riscv: Add the T-HEAD SoC family Kconfig option
  riscv: dts: add initial T-HEAD TH1520 SoC device tree
  riscv: dts: thead: add sipeed Lichee Pi 4A board device tree
  MAINTAINERS: add entry for T-HEAD RISC-V SoC
  riscv: defconfig: enable T-HEAD SoC

 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../devicetree/bindings/riscv/thead.yaml      |  29 ++
 .../bindings/timer/sifive,clint.yaml          |   1 +
 MAINTAINERS                                   |   8 +
 arch/riscv/Kconfig.socs                       |   6 +
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/thead/Makefile            |   2 +
 .../dts/thead/th1520-lichee-module-4a.dtsi    |  38 ++
 .../boot/dts/thead/th1520-lichee-pi-4a.dts    |  32 ++
 arch/riscv/boot/dts/thead/th1520.dtsi         | 422 ++++++++++++++++++
 arch/riscv/configs/defconfig                  |   1 +
 11 files changed, 541 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/thead.yaml
 create mode 100644 arch/riscv/boot/dts/thead/Makefile
 create mode 100644 arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
 create mode 100644 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
 create mode 100644 arch/riscv/boot/dts/thead/th1520.dtsi

-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
