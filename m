Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE1DC3DA4A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 00:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BPvNfrqAeYdbjIJiehuo+XGs5npv35YSr/WUD4Aiu4M=; b=ONBmsH2LWlIDor
	wq2QbnkprMZ4h2aJG4lRi+uY7A1v4Urc4ei7E7/iaE7pG6CO/HDDWN47SGQXiNuPs1ZPO5e82KTdK
	mA0S34QW25JfPPNPBi2Wxkt7E9TvJ+0qPDPH5X5cibeCjxuMoOFhPrFlaJslhgRRVG9zfAJMW+Mw8
	wJ1JOOhMU4EvyeFgAMM2rMlhvBWRnbJiEM6BroiMO4YDJHzhYT/p4NpplXyEQAafOi9IHykwUnpQQ
	Vvf48phygOMh7B8WKp0gv/NvX1D9H7/KaWb9bVNJ9CCrCt3QA//xr4Ji51WAAwVOfGDF0yMjkWnXs
	ByF/pLQ0XZ6a4RRC8R5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYajZ-0000000D5dV-2xyI;
	Tue, 30 Jul 2024 00:28:57 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYajW-0000000D5cG-0DtL
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 00:28:56 +0000
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v5 00/10] riscv: add initial support for SpacemiT K1
Date: Tue, 30 Jul 2024 00:28:03 +0000
Message-Id: <20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJQzqGYC/2XMSwrCMBSF4a1Ixl7JO+jIfYiDJL1tg9BIUoJSu
 nfTgvjo8Bz4/olkTAEzOe0mkrCEHOJQh9rviO/t0CGEpm7CKZdUcw03BpSBszl4aEZg1gqGiM4
 3nFR0T9iGxxq8XOvuQx5jeq79wpf3nTL/qcKBgvdUe6OUaqk5dziMMR5i6sjSKuLjDRUbL6pnv
 DXCSSM1w42X3/648bJ6i8o5hUpb2/74eZ5fYBp4GS0BAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Yangyu Chen <cyy@cyyself.name>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4015; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=V4T8fd0d2+h0+Ln8i2kGkme2tTA/eQW/YrvMlVwVBNw=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmqDOaQ0GI2eOl57347SCIy4BFS/AKSz2EiNH9+
 Hev8/juaJuJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZqgzml8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277c50D/42G0a9O66gMEGAcM
 WOw+H3lRyEXfImWH31qsng7fdSgHbn4y9VgbF/gJQtuyNzHM8vFkWb4CzZQ1bYrmVI9fPJRoF6u
 ziSWrpmQIK8724b9Tmkg6I0N83rY5p0uS8YqT2jAzFaTy8cF1GwN0aEJ6w8yKi9S2+Cs0GXKKIa
 /gw4vvNaeKK0jQjaBj09zNvx/qOAiQqzzPZXpzgryReaBh8t+fyeITItgdqIVPNvCQHZ36XeNZd
 loAs/ifHifi7k5seVfatnxLltcglNQclyLKaldxVqwKLVSv4qIPkgTzT4zBShl28Hn2B7kzzhyq
 Pig0Tb1kNZUd7hwOb1bcYAhV9BP7PxOGGjHvGLxtScHbyA41D7aophhs64zaFiHYow9wZmh+TyB
 1mOYJnrveID98HncHvFCQLHJOdaxrOuq+MhSNGu1kBiTlFNT3AGheFXheKyfArOWbvOP4KNyYlX
 ICaaX7VtxqjJnLFEa3YyZxfJPr42m4UF3JBoQvzOKJOYyXkAmTqG9B1AwuAdErxwod7j4S8W7ZC
 Ys1ff+dtEDOvQqmCfcDY04x/X3R3y1Wo50lNeoiYJ2vfytNq75cdJZs1PUIzup8/L9SS4wXK0lq
 Rv0P9UeesI6Nse9BenhJ0LnRCo5Vsqrul40JUvgLxUxTDzk2OBuS+AjwUNL9T1vjjJjg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_172854_161321_1E92C6D5 
X-CRM114-Status: GOOD (  13.42  )
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
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@outlook.com>, Meng Zhang <zhangmeng.kevin@spacemit.com>, Jisheng Zhang <jszhang@kernel.org>, Matthias Brugger <matthias.bgg@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
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
Changes in v5:
- fix cache-sets in dts
- collect Rob's Ack
- rebase to 6.11-rc1
- Link to v4: https://lore.kernel.org/r/20240709-k1-01-basic-dt-v4-0-ae5bb5e56aaf@gentoo.org

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
Link: https://lore.kernel.org/linux-riscv/20240706082928.2238-1-jszhang@kernel.org/ [5]

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
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240626-k1-01-basic-dt-1aa31eeebcd2

Best regards,
-- 
Yixun Lan <dlan@gentoo.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
