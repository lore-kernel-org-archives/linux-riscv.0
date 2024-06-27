Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE118C3064D
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 15:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kP30+WJUCGMqJoiaa1ahhRsOBkYoaS/UEVzkKNSzDD0=; b=DEu/zyxhtHBQ+O
	KlimitIt6xxCOPlg1JlrqRB8nEXwnlLiMmtAXRtvyElbG2nrTc1DQEj737BvRuf7qfoqb10GqOK9n
	Ab5U/2oLqRB/KNFhgJOCk5pvzMIRFuD7JSmXSMXHeBe+09QcP5cTMpP1/uDubitJry6yp3OzttXv6
	Xnf5GroM58SIOSeZG4lwv5TqQkv5I+cX6vKwiZGleOAIPe2hYBp6IBqAvyy4fj+3fkNDcbvxzYvZ3
	60/nPTW8v+o+nsEUJmm6ZJCLpcjAbxwhTX6gFV21xJrvhK2VHPcCZ7OuY0Oj7NbFfwuDZy9ELlbBS
	EiXsR/k2DgZq5fhXQ9Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMr6q-0000000AsTO-0FSq;
	Thu, 27 Jun 2024 15:32:28 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMr6n-0000000AsSq-0YyC
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 15:32:26 +0000
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 00/10] riscv: add initial support for SpacemiT K1
Date: Thu, 27 Jun 2024 15:31:14 +0000
Message-Id: <20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMKFfWYC/x3MPQqAMAxA4atIZgNtlA5eRRz6EzUIVVoRofTuF
 sdveK9A5iScYeoKJH4kyxkbqO/A7zZujBKagRSNypDBQ6PS6GwWj+FGbe2gmdn5QNCiK/Eq7z+
 cl1o/6qWQ5mAAAAA=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 linux-serial@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>, 
 Meng Zhang <zhangmeng.kevin@spacemit.com>, Yangyu Chen <cyy@cyyself.name>, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4039; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=aVbM1IQMkrPPckh5xWOxqYkHnsmPqgtjycwr/CEZgeY=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmfYXcZao4t4/seNTZQlv12YCD3ueUpvzGIelTI
 x+XqLaMjFiJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZn2F3F8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277UNTD/98/CPAZzXwZUxG50
 N+CfEzPFoSR+6m6Z+zjvH74DWMIFuLEeghYIrET4c3lEE9WtK3QxuZJNh/3Zf9KOgFaRmHRppb/
 tfwgMiOpFJOr8RlwT4FUBRvqsbfQfNq8pHfdkdj+adTpXPBqOo2i8zEW+GxuA13T7XKWLWumM8V
 AJjXlmuOFnlbRRncxhaqXwx0YrDsaLoOKnj9PNYj0wn0fl0Kotx6mqeOXtCiZDiHh56xrW2z5g6
 /Zd8HaIIr6Ir+7niOSRa6PupQmjZ7o2BEv0FMMR7BL3mOL16ELhgFbrp5jeStt7NuE1eN5c6Ixf
 kgGzDV0KGymWAVw4rPp6ix7FHy2LhRD1ku/ijbIy1xsCb3xJcOML9AoWir/AvXWOyfVMUJPc8Yy
 k0JVjw+ex1UCVqaAzgf8ejAVl0d55iT6Xsag1OAnQew5+Wsgm3d121LJoUDdLKuSa7JFj8K0P1+
 RuvdhxoMTMKK+PwTQqNwIiRKCTwtmJB9Ek764dXGc1XJFzdiWX5kNF3VmcLcqtHtbG1y4BlYqFX
 xPvHS7BCo3I7Yt4/SfgTR6BHTpkTsOq7rtcdARSOh08+Yj5Y0GZDpn0HEefur6Bjb85AbYFD+li
 Es2bfCsSg+sz2/klkwIHqYvAHk2EMDoptVQCDlM1Axa0T0Gk+uSRxS7ubmHXHb2TnAaQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_083225_239421_8C1DD7A9 
X-CRM114-Status: GOOD (  14.41  )
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

P.S: talked to Yangyu, I will help and take care of this patch series, thanks
---
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
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: linux-riscv@lists.infradead.org
Cc: linux-serial@vger.kernel.org
Cc: Inochi Amaoto <inochiama@outlook.com>
Cc: Meng Zhang <zhangmeng.kevin@spacemit.com>

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Signed-off-by: Yixun Lan <dlan@gentoo.org>

---
Yangyu Chen (9):
      dt-bindings: vendor-prefixes: add spacemit
      dt-bindings: riscv: Add SpacemiT X60 compatibles
      dt-bindings: riscv: add SpacemiT K1 bindings
      dt-bindings: timer: Add SpacemiT K1 CLINT
      dt-bindings: interrupt-controller: Add SpacemiT K1 PLIC
      riscv: add SpacemiT SOC family Kconfig support
      riscv: dts: add initial SpacemiT K1 SoC device tree
      riscv: dts: spacemit: add Banana Pi BPI-F3 board device tree
      riscv: defconfig: enable SpacemiT SoC

Yixun Lan (1):
      dt-bindings: serial: 8250: Add SpacemiT K1 uart compatible

 .../interrupt-controller/sifive,plic-1.0.0.yaml    |   5 +-
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/spacemit.yaml        |  24 ++
 Documentation/devicetree/bindings/serial/8250.yaml |   4 +-
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/riscv/Kconfig.socs                            |   5 +
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/spacemit/Makefile              |   2 +
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  19 ++
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 378 +++++++++++++++++++++
 arch/riscv/configs/defconfig                       |   1 +
 12 files changed, 441 insertions(+), 2 deletions(-)
---
base-commit: f2661062f16b2de5d7b6a5c42a9a5c96326b8454
change-id: 20240626-k1-01-basic-dt-1aa31eeebcd2

Best regards,
-- 
Yixun Lan <dlan@gentoo.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
