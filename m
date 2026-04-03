Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AC7E7E36C
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 11:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ANbM+ikWIL3aX85S07f0iZTchUC2Kyu7iO8O+vlt7RA=; b=PtUAekwubz7py2
	E0cjQ9WG35KRK+G0thS6IltNRPberN861+yAFJ4kvzwws6XPDqwM4UqrUV4EaxfBSxxlwm9ggggxg
	5i5Drt4NZ0D0oztnYQRBEO9PRHrRNRQ+tSQ8fsLNYjmcSm7cu2VeTHAbpKJE7lj2ir+D+5xPK2KQl
	zf0J2B4bNaCZlDI2OAbuNV+nzgXIbwubNFhK2T9c+fEtDTxuPDQbMYbTtKaYZOyHA48Y1YfDDPpqF
	lOA8RCdbJ2HO9hQF35m/n1r0cATM1s8VaXI/QrqVutyiXRLUAoB6Y+jr7mkR6C3iuOhmfpVDJ7s4K
	w+TqOQN/OaL7+Ks4I8fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cVO-00000001vlv-3u1k;
	Fri, 03 Apr 2026 11:16:02 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cVM-00000001vlH-1GCg
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 11:16:01 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-8a093c784b0so25370166d6.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 04:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775214959; x=1775819759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VScxEqB1ufMX1zFMz0Kwtu1aZDayJH9mecM8OM4h8BQ=;
        b=XZajp07YFhORfDhZ2V6ptasbQ25T0G9VrT0G7yOaxn9QpCuc6+OtJo98Gi20DK8sa3
         lZzs90tLiNaDINDjYSX9183LqG9g9SAC/SymTY4vc2IrS4hL8ORzRJM9fEgrTCMaLQC7
         fePlHVAXyt1wApP+dQKTjixgvQuQpXIqCM+ENayqUwt511e0jzsVC4xHD6Nb399nzD9+
         4x57D/Kjf+Fp6xYJxdVUZL0acn7jv9Gm3jzBQisg/n6g+3U5sk0A/X0CNvC9m5PaIO/k
         Od8GlM0/pfugIolUQlnyQsWJrPgbhgISjDAZfN5MmbftgqxjIAw3Ail+/m5SAbpZ1gwp
         RmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775214959; x=1775819759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VScxEqB1ufMX1zFMz0Kwtu1aZDayJH9mecM8OM4h8BQ=;
        b=ibCNWxqzi4/esT7NoKqULYy0gVqpqfjZBLZ9nnN18r5H9qVDv1LpEtTHwpAc+4ax1R
         25baY++bIzXrSrLJX3Qu06plolHOHNKxwxYth0REYY8jsocJ93ouEb6qHXAtweq04B9T
         kqVhJOCYi4xvxCzMjxlKdl2q5a2AgXVCYFR0+hOoG6F0aLV4HNymObs6kju5uvpUdlwq
         nveg2+C9HNOoAbv5layESscRflw8XeQPCXG0/FsuzPNc81bR0urHTo4IDvJ0v37moVGC
         9skIDOfjKz+ZUZutJywouTPCDMGPGZeX4CDoNunOou3pkNZGGxgc1IQEx0mhbeVJpsEI
         FXmA==
X-Forwarded-Encrypted: i=1; AJvYcCUTRqHtPXhSed/4YWOJA/eS2YYcnipd9dy0io5XCTSqzeV9QxrG5YL1P0lNbjMPUdHXmT92xyfxtSATmg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxacCs/KQswn8wJNkzID3E+qBVSZvUYSEwpS/41kzIBfNKMAQ/7
	VEy6prQbG1st4nQISdqqpL7oG9UPwYOrJNAphA9emqWk8OS3XJned58v
X-Gm-Gg: AeBDievQS6tmuK6eN4UGGunKGYA7RHkxn+sOzJRT+6upEsCukEP7ROKKDR+nctHV5TG
	aDaq/LvG1AARbeFLvV3nMwHsGGG11I07adKKVxDYYFGU9KiQPoIAvCt4t7+9xgTG62ENm5J5QgU
	oKnOAkMLF4zwPRFNlscVJyLdYW7MGtamU2xnqsJpTG5vULDxZnhEXfz0YF99uqTtkaEDIc+xcGu
	FpRllBGFuH/CquMq9iHGAzOnzyLpCSV9D4aYjXFQ+JpQPS7hmVpVU9wLL9VnXsay/Cwc9ti+F5A
	IFQFmB5pHdh8a8tDZT3QIhSI41RY32ATCI9ePG2dPZ5K4m0GKY9+OB6SrJUsPHmiSCf/LT3QPib
	6JoB///DxqVrb6MFkMKc4P/Ssufp3a3dg9C83BtdLnDCS9AZsgbvhPXxgF0Lt3z37go0XcRWvVv
	h/Uy9S7uTrq/2TJsOGds1cVcX9g1SGt9xmUwhAtNQ=
X-Received: by 2002:a05:6214:226c:b0:89c:d7e3:7f01 with SMTP id 6a1803df08f44-8a704ea730bmr37757456d6.48.1775214958204;
        Fri, 03 Apr 2026 04:15:58 -0700 (PDT)
Received: from sleek.hsd1.nh.comcast.net ([2603:3005:1473:4000::71a3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5974e8e8esm45319836d6.43.2026.04.03.04.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:15:57 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	daniel.lezcano@linaro.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v5 0/5] Add initial Milk-V Duo S board support
Date: Fri,  3 Apr 2026 07:15:11 -0400
Message-ID: <20260403111516.379795-1-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_041600_368796_331413E1 
X-CRM114-Status: GOOD (  12.75  )
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

This adds an initial device tree for the Milk-V Duo S board
with support for reading from the SD card and network over
Ethernet. This is continued work from Michael Opdenacker's
v6 series [1] on the ARM64 and RISCV side. It has been tested
with ARM64 and RISCV64 to boot from an SD card, have networking,
and read I2C slave devices over i2c4.

---

v5
- Fixes spaces at beginning of line in &usb node of DTS

v4: https://lore.kernel.org/sophgo/20260328173450.219664-2-josh.milas@gmail.com/
- Rebased to latest sophogo/for-next
- Added usb node to arm64 and riscv DTS
- Removed sg200x link in commit messages
- Added missing change to v3 and removed link from v2

v3: https://lore.kernel.org/sophgo/20251029001052.36774-1-josh.milas@gmail.com/
- Added sg2000 interrupt controller and timer to documentation
- Added sg2000.dtsi for RISCV and moved DTS over to use it
- remove devices from DTS's to match what is available in the
  default pinmux config. spi0-2, i2c0-3, uart1-4
- Added i2c4 and spi3 aliases
- Removed milkv,duo-s from sophgo,cv1812h in documentation

v2: https://lore.kernel.org/sophgo/20251011014811.28521-1-josh.milas@gmail.com/
- Made new entry in docs to avoid DTC error
- "Milk-V DuoS" -> "Milk-V Duo S"
- Sorting of aliases
- Added uart*, emmc, mdio, gmac0, i2c*, spi*, dmac, saradc
  to device tree matching what is available on the pinout
- Removal of 'no-mmc' and 'no-sdio' for sdhci0 as it works without
- Added riscv device tree

v1: https://lore.kernel.org/sophgo/20250927173619.89768-1-josh.milas@gmail.com/

Link: https://lore.kernel.org/linux-riscv/20240421055710.143617-1-michael.opdenacker@bootlin.com/ [1]

Joshua Milas (5):
  dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
  arm64: dts: sophgo: add initial Milk-V Duo S board support
  dt-bindings: soc: sophgo: add sg2000 plic and clint documentation
  riscv64: dts: sophgo: add SG2000 dtsi
  riscv64: dts: sophgo: add initial Milk-V Duo S board support

 .../sifive,plic-1.0.0.yaml                    |  1 +
 .../bindings/soc/sophgo/sophgo.yaml           |  4 +
 .../bindings/timer/sifive,clint.yaml          |  1 +
 arch/arm64/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2000.dtsi        | 53 ++++++++++++
 8 files changed, 231 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000.dtsi


base-commit: 9aa6068586a9b4cd34cf04f8dee72a7283ab4ae4
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
