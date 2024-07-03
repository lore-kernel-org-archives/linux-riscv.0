Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103E1C2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 14:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YmsgI80V19FJ+OIAe3MDag8zrt7ewU9AcvRg/3H1knw=; b=EjNX6rfzgHZ/GC
	n1eJj4GbiG64TufWXdkbncv17yWh1c6LiMaF1YyLZHTdMwriRzPw4xZcXqOLL2BaKp7KeQUjDJJLu
	9sDZi/1zeTcaVUW/eaXlt79RwMKkbF4+GdLZJ0Uhr+xYcE7zZOUlsrtfXjq6T/9PkkWNjKnvc4U/O
	KlxoWLA44G13qwAljyFcXnHsZCOjDywjXFCsCbUSncnQdTsLrpDwATApIC7mkI1Xpez3YfAL4mNoW
	SYfT0K5ZS+sX3N3kEpLV7zp1TgLGLoS4ZHWfuX3TJ7LJIRtIDTUs5aDxflXHy+NIfKxnzdA15Tak5
	Ex7AG85JnMyWISX4rH8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1PW-0000000AYem-3JPR;
	Wed, 03 Jul 2024 14:56:42 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1PS-0000000AYdK-1uhl
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 14:56:41 +0000
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v3 00/11] riscv: add initial support for SpacemiT K1
Date: Wed, 03 Jul 2024 14:55:03 +0000
Message-Id: <20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEdmhWYC/13MQQrDIBCF4auEWXeKmmqgq96jZGHMxAyFWFSkJ
 Xj32kA3Xf4P3rdDosiU4NrtEKlw4rC16E8duNVunpDn1qCEugijDD4kComTTexwziit7SURTW5
 W0E7PSAu/DvA+tl455RDfh1/Ud/1Rwz9VFAp0Thg3aK0XMdw8bTmEc4gexlrrB0Oo7vutAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4318; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=NwPx3nsi9Frt9F3UqrolqP4cPwi7Q+jktVDtLsEkNUs=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmhWZ0HOav0H0NHzSndaIJgQRth3C/Xo4ktKzdn
 3fML2AcfpiJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZoVmdF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277ZvAD/9q3jxF1uPzaRjIT2
 uJ72pkyE2r8LAfLjsTAbPexyz/OQZfWG0ITZJSDtukOJVOwyH+924ozLF+7zCXmzmExJGMJ51CX
 7viL8GXJRxZWMWMIBam/ZcE98zrLmlu6gzT7i8zuR5s/OmuVImdoqePXSNg+IH8QiV8lGlGVOQQ
 FjNg/qRjhxEXiIWMoE3oXw6FXl1ZbcmVtqbhKIL9rByoT0Zmx00rbCDzEjdDi8xqCsTaJ9ftc2X
 BgQEpQUAOP7UlRp9ExUvEP5CfMxHoquTVc00BEdfqVWjCqMkqxqTcRGWqHcO43BJx56uZZDO696
 +DExF//8oV2OMM4bwACUAqcVEd/LIAv2Fq2Bgi0nS8+20m+BDqDELItTa3OyxrTUqe+ZsWOzlkY
 t/bmwRleCkugSWFWXe7G0ddY/cn7IPFYP+RbShSbrIGU3BJAF+DqIaqp6Lu1PM6OTVbS+zYCPz9
 x5BxzkH45c+HQ63mXYEPkrWsFNZK0VhtnbIQsQ5QsMbFNsSF1d/unhfohlv1NgkiC4d4DC3QjKN
 bMiEdPcgid02XHxJ+rjxK30LkheQVZZ25GvarL6932RXv+gzu7Kxd01vt49NeSkTfaGl8psrofK
 /VEucX+AlmM7AYmDhoOAV96vi/5eR8Rge+3gLaaaalDW4FG4lkLpmB/nlEdwikTBg4WQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_075638_628308_7CAFEAB0 
X-CRM114-Status: GOOD (  15.12  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@outlook.com>, linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, Meng Zhang <zhangmeng.kevin@spacemit.com>
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
Cc: Inochi Amaoto <inochiama@outlook.com>
Cc: Icenowy Zheng <uwu@icenowy.me>
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
      riscv: add SpacemiT SoC family Kconfig support
      riscv: dts: add initial SpacemiT K1 SoC device tree
      riscv: dts: spacemit: add Banana Pi BPI-F3 board device tree
      riscv: defconfig: enable SpacemiT SoC

Yixun Lan (2):
      dt-bindings: serial: 8250: Add SpacemiT K1 uart compatible
      riscv: dts: spacemit: add uart1 node for K1 SoC

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
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 386 +++++++++++++++++++++
 arch/riscv/configs/defconfig                       |   1 +
 12 files changed, 450 insertions(+), 1 deletion(-)
---
base-commit: 22a40d14b572deb80c0648557f4bd502d7e83826
change-id: 20240626-k1-01-basic-dt-1aa31eeebcd2

Best regards,
-- 
Yixun Lan <dlan@gentoo.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
