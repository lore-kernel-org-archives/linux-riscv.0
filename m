Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA4BCD6E54
	for <linux-riscv@archiver.kernel.org>; Sat, 30 May 2026 17:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ANbM+ikWIL3aX85S07f0iZTchUC2Kyu7iO8O+vlt7RA=; b=EC1fhJrkai6yoL
	CiAtlV7kdBf434fCKfp0R8ebPizKh9rF6c2/jCgeGIApjf7XYYItb/nbxH/WIuDuvE39zqSPoXzWp
	X9JbxOOnngG07k0dAn934cpkOHyg2ZdWzU4p8C02NRpRrAvPHA5FJehlKs72/gBsbZ/Xruqb92Vu9
	0jpxnfWFrZ6IKpFkPLsSyEchkrDesxZvowMwXc0neMczuTmdzTzWIs59SR6ZGvjzcRR7SygPXgWlb
	uLUwCq9ndPh5FMpQIZ1i/1U0Uc2QB7x5y145R0Lc4Kve4TwuQ67YessS4+H9in5M8qu1Hdkeg9p6R
	uY+2yM5Wvs5wEa45J8Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTNan-00000008yBM-369v;
	Sat, 30 May 2026 17:35:26 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTNal-00000008yAz-1Dgy
	for linux-riscv@lists.infradead.org;
	Sat, 30 May 2026 17:35:24 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-91550dda53cso8957185a.1
        for <linux-riscv@lists.infradead.org>; Sat, 30 May 2026 10:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780162522; x=1780767322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VScxEqB1ufMX1zFMz0Kwtu1aZDayJH9mecM8OM4h8BQ=;
        b=nnEIJnE7xtI+jEArEXRj9HVkOY58ByQgJi3f+AoK5HbOjxYv/XLMOvMNe5Be4HufIX
         20YiE/ZgFQthD3tha6cCNrxWt2Vru5Z6qAOISNjy+DTyF3vUFWDTWIZJcX/Z2j+9a/2E
         OCBoq4W/MNEDPqBgs5ch95OybjMyxmF7YcfYs6+N03EFAxKAaxHKustvjYOKimPUQ0V3
         uWrObqwlSmCnee/gmDwxHkqr/SUPEq45nOkOz94mQYfXDPh8ad9v5B73oRLJ8r6J5ExU
         FFudW4FTnEidyux3sEf9Q8Hg8G3KON88FVipoHioDXjGZxmHckVZ7qJyavkICG8SDzyN
         boHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780162522; x=1780767322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VScxEqB1ufMX1zFMz0Kwtu1aZDayJH9mecM8OM4h8BQ=;
        b=S9VtHRNry52m3/9Td9NpGOgNd24IuCLWNQQkFSHaf8jYkXy9VdAFZa0wEm7EWLoyVx
         qUM6OR5aMi/oBmJNoK1kvGEgYn7humediQ4ysaziOzw01jhtL66p4PxM6umiAd34ZofM
         nA5eZlxa2nEZp/kvL5lRq7rjOqGQ0w+CEwBL0FWEFq8jojxC9xHjDceHZgqNmHhNr+df
         NuCVEzT8rNmof1UjbXm8bWlNYvTgm/JXVYCu2ow2drvkcQM8DOtkas6zLx05gzm9EHRp
         EM09zw8BVCItwjgaqt+70uww4LLmlpxuVfr8VKDC5DzYGMenlFiX4YqJvyzpGDdN3OYA
         N4zQ==
X-Forwarded-Encrypted: i=1; AFNElJ9IglTFfs13JLWBynZKoSNGjEMvbKRTJXCIA9VB7aUyVB8ZDC6k5lHgw4ustRDhrDyzZPrLlT2zvnJAvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZhF/vP/FJcpjZAr01iYfP2iwkR1Q58XZFHUbJ4h40nTa4b48G
	VIGswzkIu790uH7qcebVMIctFzX6yL6s5mXja0CrtK7/Z1LgCNbRg6kn
X-Gm-Gg: Acq92OEwdi2l0jdrDmwMSRAaTvV8h8JORTXTyvvDZs92mZqhUMG9xyn5ZSgJHKCZspc
	F9xWDGKPmwXcSlknqnaoiu9Oj7Fi0bjs5qIpvLIdLvYpYhZkvCqgDeCUMklJAvXMumDIGtmpUG/
	Qog/JthBjdRosdHSSOouriYdiyFUwZxzRkFBOxgC6L7zkPXJp1am704qLZ00+Y62zBwK2aF0O0L
	2c/UnK47qJbJkWYXGJwK6LF1Fi3EpcDDDpyPoFOwxBpkwWFpnxBXiMAfm0wTLqJaqIVxsCFBvGq
	vIC6+OES72zzqD3FPR3c65IsPa1ai8NMKnvdqGUhu9qamkBOoUzRQBz20GTcfLEA4SPOJ4GWmxD
	RVKQnL42Bdi5Kr9T5Seg2SiUG3+KDyjeXmyt3KAeW/5zWo5Ymm263Iyl/DVkLlP1VMl6Wb3dhVf
	DrP3Hi7S+MreQigzQr/scg4sSWfIqLunI6T8IOr6APiPk8tI0h4gXAogYRYzjYRJydqUE=
X-Received: by 2002:a05:620a:708e:b0:914:c226:ecae with SMTP id af79cd13be357-9153da04456mr673431185a.24.1780162521335;
        Sat, 30 May 2026 10:35:21 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153244e114sm565606885a.5.2026.05.30.10.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 10:35:20 -0700 (PDT)
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
Subject: [PATCH v5 RESEND 0/5] Add initial Milk-V Duo S board support
Date: Sat, 30 May 2026 13:33:42 -0400
Message-ID: <20260530173347.33533-1-josh.milas@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_103523_344274_17DBEC0C 
X-CRM114-Status: GOOD (  13.04  )
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
