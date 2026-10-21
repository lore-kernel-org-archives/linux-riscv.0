Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B475606A323
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 19:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hw0zj5VR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=camNRQlHH2BGhNkamEGQn8ay2GA0IFyfljiEmPqfytI=; b=hw0zj5VRORkZml
	re1wQgWRrHOtkDcIVdHn/Pr07H6u35qF7I1Jkz+lLJ9johkkIhQEZpe+Sls+XoonjO0PEk8wwZghZ
	7cyFAXvqR/PXGRDJs3657uX6fCwE/XpA0fXqLEeg4OSA3n2Me1KhNv0QMJlzOWVvnKsTfIAg5CQRc
	scoYagWiNg6JICudvmL1HbaqVzl6Nwb2pceEULPcyyI9mpVQkpA9IOzhicE7XFtYO7+wrwXZDFYi1
	yAjmFWhtWCtt5pPL5sB5jDzJ+TEUmTv84+4WZ6lXWt5GK7aoiXvzjKnc+lr+hlMNVb9ZS9qyC21B2
	gNFy2nCR9FZt69DZT+Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJcIb-0000000Cl3E-3U3y;
	Wed, 21 Oct 2026 19:48:33 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJcIV-0000000Cl0D-32r3
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 19:48:32 +0000
Received: from [127.0.1.1] (unknown [223.166.93.48])
	by APP-03 (Coremail) with SMTP id rQCowAB3gT_6Ftlqxu5hCw--.4480S2;
	Thu, 22 Oct 2026 03:48:12 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH 00/18] riscv: add initial support for Zhihe A210 and Melon
 Pi
Date: Thu, 22 Oct 2026 03:48:08 +0800
Message-Id: <20261022-a210-init-v1-0-09fb4d99da65@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDVpBw2uIhZVg7EoaRGJuLti+
 ZKff0EgzxSgTi7wdHDgxUWoNAE7GTeS4D4aUKJWElEYVFKw4030WWm7inReaAOxXz0NfH6vpv0
 d9m4mu70DuO8Hf3JP0m0AAAA=
X-Change-ID: 20261022-a210-init-d38cb9e6456a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Icenowy Zheng <uwu@icenowy.me>, 
 Drew Fustini <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-CM-TRANSID: rQCowAB3gT_6Ftlqxu5hCw--.4480S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCw4rAFW3ArW8Zr4kCF1UAwb_yoW5Aw4xpF
	srCrW3tFWUCr4aqr4fZF48Cr1fXF1rGa4aga9Fg347JFsxAFWUAwnxKFyvyr4kGrs3Cry2
	yFyUG393ua4YvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0pRWv3bUUUUU=
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBggHDGrYxtWXvwAAsM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_124828_165644_423B45A8 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds initial support for the Zhihe A210 SoC and the Melon Pi
V1 and V2 boards.

The A210 features eight RISC-V cores in two clusters: four C908 cores
and four C920 cores.

This series provides UART, clock, reset and pinctrl support, together
with the required bindings and device trees.

It is based on Linux v7.3 and has been boot-tested on a Melon Pi V2
with all eight CPUs online.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
Han Gao (6):
      dt-bindings: clock: add Zhihe A210 AON clock controller
      dt-bindings: timer: add Zhihe A210 CLINT
      riscv: dts: zhihe: add A210 module memory
      riscv: dts: zhihe: add Melon Pi V1 and V2
      riscv: defconfig: enable A210 support
      MAINTAINERS: add Zhihe A210

Zhiguo Zhu (12):
      dt-bindings: vendor-prefixes: add Zhihe
      riscv: add Zhihe A210 support
      dt-bindings: clock: add Zhihe A210 clock controllers
      clk: zhihe: add A210 support
      dt-bindings: reset: add Zhihe A210 reset controllers
      reset: zhihe: add A210 support
      dt-bindings: pinctrl: add Zhihe A210 pin controller
      pinctrl: zhihe: add A210 support
      dt-bindings: interrupt-controller: add Zhihe A210 PLIC
      dt-bindings: riscv: add Melon Pi V1 and V2
      riscv: dts: zhihe: add A210 core support
      riscv: dts: zhihe: add A210 UARTs

 .../bindings/clock/zhihe,a210-aon-clk.yaml         |   58 +
 .../devicetree/bindings/clock/zhihe,a210-clk.yaml  |  231 ++
 .../interrupt-controller/sifive,plic-1.0.0.yaml    |    1 +
 .../bindings/pinctrl/zhihe,a210-pinctrl.yaml       |  206 ++
 .../bindings/reset/zhihe,a210-reset.yaml           |   56 +
 Documentation/devicetree/bindings/riscv/zhihe.yaml |   27 +
 .../devicetree/bindings/timer/sifive,clint.yaml    |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 MAINTAINERS                                        |   16 +
 arch/riscv/Kconfig.socs                            |   10 +
 arch/riscv/boot/dts/Makefile                       |    1 +
 arch/riscv/boot/dts/zhihe/Makefile                 |    2 +
 arch/riscv/boot/dts/zhihe/a210-melonpi-common.dtsi |   55 +
 arch/riscv/boot/dts/zhihe/a210-melonpi-v1.dts      |    9 +
 arch/riscv/boot/dts/zhihe/a210-melonpi-v2.dts      |    9 +
 arch/riscv/boot/dts/zhihe/a210-som.dtsi            |   11 +
 arch/riscv/boot/dts/zhihe/a210.dtsi                |  645 ++++++
 arch/riscv/configs/defconfig                       |    4 +
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/zhihe/Kconfig                          |   12 +
 drivers/clk/zhihe/Makefile                         |    2 +
 drivers/clk/zhihe/clk-a210-aon.c                   |   94 +
 drivers/clk/zhihe/clk-a210-ap.c                    | 2283 ++++++++++++++++++++
 drivers/pinctrl/Kconfig                            |   14 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-a210.c                     | 1206 +++++++++++
 drivers/reset/Kconfig                              |   11 +
 drivers/reset/Makefile                             |    1 +
 drivers/reset/reset-a210.c                         |  589 +++++
 include/dt-bindings/clock/zhihe,a210-aon-clk.h     |    9 +
 include/dt-bindings/clock/zhihe,a210-clk.h         |  649 ++++++
 include/dt-bindings/reset/zhihe,a210-resets.h      |  351 +++
 33 files changed, 6568 insertions(+)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261022-a210-init-d38cb9e6456a

Best regards,
--  
Han Gao <gaohan@iscas.ac.cn>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
