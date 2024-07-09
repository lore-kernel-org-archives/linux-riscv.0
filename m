Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562B5C3271E
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 03:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UPfg2MVw3HPjJCFaI3x30tpLVzmGFXDFd2NZeTonjD8=; b=tYH2kIPKspArT3
	+OkNQD91T+s1U8t058gErapyBge5IWjTcUe9pehcI5twKroRRgXnp9GE3f7RBGDlqdZNJ+FvlIv0Z
	m1jO/dt0C7EI1JtjlD4aolEoZ26j61WyvKRTYLw7As8rbsT3FuAXFHb3Tzbd8C78DHW9Cii98fG2b
	LiIksNADHtmJSlav1grhwaFRhKauFVpxuP6lIbmAEyeHhoA5eTDEB63SYZr+oJceViCj4CY1mEI2w
	tJR3tyhhjhAdjkEgoeBrEzg/Z3l5TuENJrkU/dWitNgOzkqOO2sKmCIbdS8wxdcyeei1LhpcuHlaO
	ONgmz/WZuXxk5CXU2CDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR1OH-00000005j46-3uW8;
	Tue, 09 Jul 2024 03:19:41 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR1OF-00000005j3i-04j1
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 03:19:40 +0000
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v4 00/10] riscv: add initial support for SpacemiT K1
Date: Tue, 09 Jul 2024 03:18:43 +0000
Message-Id: <20240709-k1-01-basic-dt-v4-0-ae5bb5e56aaf@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABOsjGYC/2XMSwrCMBSF4a2UO/ZKXk3AkfsQB2l62wahkSQEp
 XTvpgURdXgO/N8CiaKnBKdmgUjFJx/mOtShATfZeST0fd0gmFBMC403joxjZ5N32Gfk1kpORJ3
 rBdToHmnwjx28XOuefMohPne/iO19U+aXKgIZOse0M23bDsycR5pzCMcQR9isIj+9YfKvl7XnY
 jCyU0ZpTl/9uq4v5mU/fO0AAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4804; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=1SdTmeilqjiG7jpnm9+ZW5h/p8HcQo7QMrkh1sNGG88=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmjKwbIJafHAqwMsLyc2V+MIIXf4+E9UmMfC3lR
 JnzpNZNKseJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZoysG18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277TDYD/9qTw/C2ltVXIRNhv
 Zqp3aW/KSv8QRlrbmf5NAtqnLENgOQ1Ckx94bdhXnfGQCNkTI3vSOw6RcnJlsXwp3pIRuMb10v1
 3ITzsi1OZAEi7ydZU2xi6AioLp0Mq/xWfaBrYxYwpyJDBqyTmTI5vOnJBL4EMakqZUIv5I7ntdp
 snkZwgtKwTGwJ6XFC0WSKK1mpKM8jXisJ1VQUrZ1IEg8sX+5BG/Jct1dxgrxyLOC51HC8arHLc2
 Y9JKATGoz/bRVZsnAkuHwSmq39tScVPunP10VzobRwkRyEp2vmnBC0DEEtZIe0Mu/i6BAckLi6a
 MznA+oJPzveLoI03Py+z4sVEjmQlamfvjws/BK+NTIqHTL6rTN5aRu65ENf9xE2tbYA5XNrHPZb
 b4+8VMXGqGEeqk30Vu2XTDvm7d5Jrb7rukEVTF+eGNOkei+TIYUq0nWRsZax04Xa+t3ke/+FlDQ
 MyAqlG2XKqMH/jWFHijVbkm6N+DeDHbefmKWTaPU719x0aPg0yDycw+1QQJfVAVaGjlDCscEO1d
 2So/6XNt/BXK41NOV1zEN1it2ybB7IFDh2OU5DuO8pFyrpbsIepVOU441nl/Pl2KRZHKIaCOD+N
 rHxfZ+HQv/NDe9OCuZkTgy9cojTpWvElRcWd4uedfs8TjCIBDl7gRDESpc8rDra/lJQg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_201939_120976_B236EFCA 
X-CRM114-Status: GOOD (  15.65  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@outlook.com>, Meng Zhang <zhangmeng.kevin@spacemit.com>, Jisheng Zhang <jszhang@kernel.org>, Matthias Brugger <matthias.bgg@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SpacemiT K1 is an ideal chip for some new extension such as RISC-V Vector
1.0 and Zicond evaluation now. Add initial support for it to allow more
people to participate in building drivers to mainline for it.

This kernel has been tested upon Banana Pi BPI-F3 board on vendor U-Boot
bootflow generated by Armbian SDK[1] and patched OpenSBI[2] to enable
Zicboz, which does not in the vendor dts on its U-Boot. Then successfully
booted to busybox on initrd with this log[3].

As previous discussion in patch v1[4], maintainer expect more basic drivers
ready before really merging it, which would be fine. For other follow-up patches, 
that are clk, pinctrl/gpio, reset.. My current goal would target at a headless
system including SD card, emmc, and ethernet.

In this series, the uart node has no 'fifo-size', 'tx-threshold' property populated,
will add them once this patch is resolved, see thread [5]

P.S: talked to Yangyu, I will help and take care of this patch series, thanks
---
Changes in v4:
 - add i/d-cache, l2-cache info
 - squash uart1 dts node
 - update tags
 - Link to v3: https://lore.kernel.org/r/20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org

Changes in v3:
 - fix dt_binding_check error
 - fix plic compatible
 - fix uart node name
 - add uart1 dts node
 - collect tags
 - Link to v2: https://lore.kernel.org/r/20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org

Changes in v2:
 - fix timebase-frequency according to current setting
 - add other uart dt nodes, fix input frequency
 - introduce new uart compatible for K1 SoC
 - add 'k1' prefix to bananapi-f3.dts
 - fix k1-clint compatible
 - fix some typos
 - Link to v1: https://lore.kernel.org/r/tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com

Link: https://github.com/BPI-SINOVOIP/armbian-build/tree/v24.04.30 [1]
Link: https://gist.github.com/cyyself/a07096e6e99c949ed13f8fa16d884402 [2]
Link: https://gist.github.com/cyyself/a2201c01f5c8955a119641f97b7d0280 [3]
Link: https://lore.kernel.org/r/20240618-hardwood-footrest-ab5ec5bce3cf@wendy [4]
Link:https://lore.kernel.org/linux-riscv/20240706082928.2238-1-jszhang@kernel.org/ [5]

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>
To: Samuel Holland <samuel.holland@sifive.com>
To: Anup Patel <anup@brainfault.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-serial@vger.kernel.org
Cc: Jesse Taube <jesse@rivosinc.com>
Cc: Jisheng Zhang <jszhang@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>
Cc: Icenowy Zheng <uwu@icenowy.me>
Cc: Meng Zhang <zhangmeng.kevin@spacemit.com>
Cc: Meng Zhang <kevin.z.m@hotmail.com>

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Signed-off-by: Yixun Lan <dlan@gentoo.org>

---
Yangyu Chen (9):
      dt-bindings: vendor-prefixes: add spacemit
      dt-bindings: riscv: Add SpacemiT X60 compatibles
      dt-bindings: riscv: add SpacemiT K1 bindings
      dt-bindings: timer: Add SpacemiT K1 CLINT
      dt-bindings: interrupt-controller: Add SpacemiT K1 PLIC
      riscv: add SpacemiT SoC family Kconfig support
      riscv: dts: add initial SpacemiT K1 SoC device tree
      riscv: dts: spacemit: add Banana Pi BPI-F3 board device tree
      riscv: defconfig: enable SpacemiT SoC

Yixun Lan (1):
      dt-bindings: serial: 8250: Add SpacemiT K1 uart compatible

 .../interrupt-controller/sifive,plic-1.0.0.yaml    |   1 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/spacemit.yaml        |  28 ++
 Documentation/devicetree/bindings/serial/8250.yaml |   4 +-
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/riscv/Kconfig.socs                            |   5 +
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/spacemit/Makefile              |   2 +
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  19 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 459 +++++++++++++++++++++
 arch/riscv/configs/defconfig                       |   1 +
 12 files changed, 523 insertions(+), 1 deletion(-)
---
base-commit: 256abd8e550ce977b728be79a74e1729438b4948
change-id: 20240626-k1-01-basic-dt-1aa31eeebcd2

Best regards,
-- 
Yixun Lan <dlan@gentoo.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
