Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09E010F3DEE
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Mar 2026 17:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a8FEvfL2E/zn522a8mo2IG5ruUbPtUDS1X6mgIE3tlA=; b=Jt3WOJhUQiWlTN
	3llCQzBBLAi23mnXnRhJV+Xp6+jFdfFf5k63MlOQjI7CVHaFgKZA1wJEiw0ShFrarAj5aq91qrr36
	rRGvnxrWxQhS8b0V7HLRqZ8T/6GnT546Ns/LatvpA4UHYWowEdOEeaJdjA3Wlo+kHFszCyBJ57ZU2
	QN3QryZeWcQSczZNydn80NdJgW5SR5wHxgsj8UJwrKVklmkfFTuvdm/+sdyUzmYBg+ZfGnWW8NPZd
	DUmlluohzGbk2EqMjYqXsMh3RMne8uCu5bFOZVXrBbe+r7vT/hBWUZ8XNCzpC1I4Zf+YltrfSoNcQ
	wntozUhMyzbKcW+FWXYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6XbZ-000000099kw-2DnC;
	Sat, 28 Mar 2026 17:37:49 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6XbW-000000099ka-2f6b
	for linux-riscv@lists.infradead.org;
	Sat, 28 Mar 2026 17:37:48 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-506a6cf8242so29781271cf.1
        for <linux-riscv@lists.infradead.org>; Sat, 28 Mar 2026 10:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774719465; x=1775324265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FO8lTdaN+rEnKBFSO7tgtF4+ghONTKCteN9CF0ffLO4=;
        b=OrrYOUrMhYC/3nwwskJ9G9YxaVbMNhHThQfRKrlr3Jrm4eRKJFxGqXXInnyXIeVAs2
         6/mF7bVci2vZ4zbt2DUxrxKiuBhDUB7LJFNVHHMqFGJlNNefk6CPahr9x3y7zx+r9/bR
         zphJxrbYgIZAUzjD1w5J3KP7Ee7HuDxz0heG4vZzqOIkUpCkl09274iz77TM58Fx1rQf
         CxF4/ds4Avvdm3zXbh1yFOGUS6sd+Ar2GgRW11xTguDC/X0tD1WOEr8OWAGLUO0WXp+1
         cltGtIO12nPxJE7EXqGXX6inAq2moAzvokAb0gM41mBD7Xyzc8q9XVchi65MVWthgHWg
         5prw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774719465; x=1775324265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FO8lTdaN+rEnKBFSO7tgtF4+ghONTKCteN9CF0ffLO4=;
        b=P5ezgjDzXG3gYMv6zLn+gZTH0R8IZqWjaOFceK5VN8vjC93uPir2TC6BHJLEaIG/Fr
         JDzvfDjJ9Zx8IUWULRFGAtKs1ffyb06w04eGc7sZAhEYqnzp/194xVcKP2tTGgVV/LaA
         gQKu3vdNfbL0Ps7dMl6gMVWr0gxh4hZ6cRtTGj356PpLx2A7Gc0kCHvLuNKzmT9sA5Z1
         6lssNfrtpvp1wn6P6vboq6BSLeEEXWVND7Cn2VS2sWsZq0VIyx3Y892zrwVxq/kPRoEv
         X1slhtMGyL81s4R6t9mYnJ3954HL2TmZf5wKiMujreb+jlY856/yxi8HrjWKhhTuo5i1
         UGvw==
X-Forwarded-Encrypted: i=1; AJvYcCWonlPr+AwXL0+K0R7X35hOW+RvwwqxyDnwXmU2KF44AFZKXjULxV10eDZ6kebKso4BHh/VZH7Z7ETVTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+DcGlVfXXoFzvdy7dY6AOw/RB2tId5LbjAUpuIYQ7kvPf65Pd
	U2UxETzWQNxq+Oodh/ge5o/AiiqgdPZM9j4a6Ft/CTN+/wCfS/+mooHU
X-Gm-Gg: ATEYQzz+B4HhZpZSWxkGBvpY+OYmLUFKnEj4rcCdURbO91RI4a/mdrzbfWsjyWJkNMX
	SredZoeFSQ4u39IxgBPA7hF9JuxkUDZ4n5h+CWPpa6WpyptdeAR/ztWzW6doARjbhg7+5rVaDtb
	w/EheRYhgQenM4nA9ioLP1brpkepAy745mdySpsfXGyZu6yRLVdPAk+QksOUgmP9PXm+qCmXFBi
	Nrfmn/07MmyzdbhfAkxvTY6rk8DYTxrhIwb4GSFTS8uAcNqKdA7h5AB5RQPHyI8RgZN/1FvPysW
	gV4xbX+qyNjRmK6RNkLyDY+wmsmL3Mrvk31/E6vIbO4Kmoztazf/iLvsgmxh9AssFxYSH9lweLH
	tWVfBPFg5hhpl8rp9XnaKUWKRUbrASMMU539em9noPBbk3HzJJKZ96EWwZu2oYulwNX/MDqc3AP
	M16Yia0ZNiWsJL/GBW/ZoQH4gbIapkFalYAryIjD2XEVCdyRYc7mj/qlAk64mE4IEdupA=
X-Received: by 2002:a05:622a:4807:b0:50b:3a6d:db5f with SMTP id d75a77b69052e-50ba39bae92mr89481621cf.64.1774719464707;
        Sat, 28 Mar 2026 10:37:44 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c9c93asm26629641cf.7.2026.03.28.10.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 10:37:44 -0700 (PDT)
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
Subject: [PATCH v4 0/5] Add initial Milk-V Duo S board support
Date: Sat, 28 Mar 2026 13:34:45 -0400
Message-ID: <20260328173450.219664-1-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_103746_704823_F0EE3110 
X-CRM114-Status: GOOD (  12.44  )
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

v4
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
