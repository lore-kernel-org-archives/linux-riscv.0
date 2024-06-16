Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE84C27C53
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 17:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l+OlEaACz8lhBnZciLjgMXcHDfbbAWpk1J5+q2vzS8Y=; b=AZvOYDymOBZMwq
	j5ZeFYJF+0cD0NpP/XjMIUErwTcgPxL41Ps1f5JXR6AOEk5svalE812UjoxK1854CD9qRj/DEaLmG
	Is1b5XdXP2qsnm4MWi52T18ReBequ+o3xW3S0xgDxfYtMGphu3Ork2yRNTvwDaRZ6yJNWsecsF21+
	CoQWhhtpVcOJWhK5NNUeH9Qka4s4WeOk38tRPOSuCbFeZkisnVVT0q7F99NLp8wwRccXGmibxxER8
	pemWwkDZHZ8ZQBTp3TIwABxyJ9b5BLmxG1iMd78fM58jO0givNVvLxQR2PMfgU/8omSZvoUym6f8O
	rP2asGb1BwzOv1FB2uFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItXH-00000007x8n-11Q2;
	Sun, 16 Jun 2024 17:19:23 +0000
Received: from out203-205-221-173.mail.qq.com ([203.205.221.173])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItXD-00000007x77-2JOD
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jun 2024 17:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1718558344; bh=jJ9Igh0peCp3hD61YPVPtVN+YWS56XTwc+sXFzKDOKo=;
	h=From:To:Cc:Subject:Date;
	b=sW/I5ZkRAhhBdauS/bOYBU0VZFVKKOQ/29trNSJYsKa/Aooko8xc8bGuWA+OzD1qp
	 lWh/GImpIPZPO3w+m5yEO0W2ruaOzrwdreZ0wnHQtHQgqlvt8CkHgV/0W7YV2baTCr
	 ZrRXnwne88vm+TQjGaZHqqweVXs8UMLgKVaiHzJo=
Received: from cyy-pc.lan ([240e:379:2260:ed00:cd33:e8cf:d8f9:bed3])
	by newxmesmtplogicsvrsza10-0.qq.com (NewEsmtp) with SMTP
	id 4C03E806; Mon, 17 Jun 2024 01:19:00 +0800
X-QQ-mid: xmsmtpt1718558340ts5w4gw51
Message-ID: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
X-QQ-XMAILINFO: MSPab3JKqisNu/J589iYOw3sGBU5TouEdZaUsX9QtkV5yGQBb/Ox4LxkgOENk6
	 oIindeAOoyurwVY774zMfvHVHOpgbcGHXtfQ4K5dJwNPaHmhqT2fWTYIn4CxswKGxDrx99dRkgRB
	 CTXCaN2rwdoFiTMuPlI1jpUSWiZiBMd8g9GPthbS5RMpae8Jp59ghRrBz6LUy0Y9ZlXMq9bFsdnB
	 nKODH5WP/nrq47fMfMsLx1mPR8lpbTo5QT/8Y4rx2c4n55a2tBk5XTjS1kYUxrPE7DjiM7Iyen4G
	 BUzXn1IbGfqAP7wyHTcgJ5X8zQq+fCbjz0nOq5Yn4WMps4QEGAlOHtwYigOJio5V+Wa8BH51ZLIT
	 /07YDz/pt1MhXXVNpjkKAp6lgLY0o/gBhzCDHbHPXm6PEP2pUvVJNs4SorrUEyvVdO9gx1MfXsXf
	 w+yM0bWefvcZtv+bUSGaF0blDOPaj5i4HDoaQO2zrfjc5RfJMf9DYM41cASOA1UkCYjXKZZPPbhd
	 8h9FBJ6lap2WjWAIVgJrDuOaeJv5ZEEI9bTxF9DZiPpijEV4Qi82NA7Hs8n1+fcaCq3hEfnKzjk8
	 NkaMUrnZKl1EdvPwjrDOmjshOdfGdG/frJwH9f1alr3SJn8kPb8O3IY5Jfnc1JpH8L3JuoN4peSZ
	 9maXCOu+bZ0hv4/XoZxSzYxiBtJ33xgmd2UQqzzRFx2wYZlTpwFEvj2bfSqQXAjI/6OqQezE4eGR
	 54IFG3vHZqFPHfRz2+R6b0vzFFEKNIA7xd/2jTrEPogfRJlzysLfDZA9DNxH+ATzp23AojaDtmTB
	 cgHqPX50Jz6UHt4DB9i2t5qy55yZEQOH3ekB+3xZZ5k8EQxEcujX0bl1ZuEGQJmeDZVeERQQ4wK4
	 /6tuCNkkIhw1zvKR/PadnRcfBJyal+c2mYcV+3OFRQ2Ji3kCF6FlKEj3dxlbe9yCAH9CPTN+ltQu
	 0g881itcy7jTYZt/m3okons20gmlUvsgBJQNXVOgODk7H3rJ2Cu/pjgmW1Dqx+gejaKGVeG/YyGs
	 5An/V/eMKQxva58m9+DR+rm+ZNmscM0GPMVU5gMeRcHxI4g/Oa
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup.patel@wdc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v1 0/9] riscv: add initial support for SpacemiT K1
Date: Mon, 17 Jun 2024 01:18:52 +0800
X-OQ-MSGID: <20240616171852.3074283-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_101920_197420_EDC2FB97 
X-CRM114-Status: GOOD (  10.99  )
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

[1] https://github.com/BPI-SINOVOIP/armbian-build/tree/v24.04.30
[2] https://gist.github.com/cyyself/a07096e6e99c949ed13f8fa16d884402
[3] https://gist.github.com/cyyself/a2201c01f5c8955a119641f97b7d0280

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

 .../sifive,plic-1.0.0.yaml                    |   5 +-
 .../devicetree/bindings/riscv/cpus.yaml       |   1 +
 .../devicetree/bindings/riscv/spacemit.yaml   |  24 ++
 .../bindings/timer/sifive,clint.yaml          |   4 +-
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/riscv/Kconfig.socs                       |   5 +
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/spacemit/Makefile         |   2 +
 arch/riscv/boot/dts/spacemit/bananapi-f3.dts  |  19 ++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 281 ++++++++++++++++++
 arch/riscv/configs/defconfig                  |   1 +
 11 files changed, 343 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/spacemit.yaml
 create mode 100644 arch/riscv/boot/dts/spacemit/Makefile
 create mode 100644 arch/riscv/boot/dts/spacemit/bananapi-f3.dts
 create mode 100644 arch/riscv/boot/dts/spacemit/k1.dtsi

-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
