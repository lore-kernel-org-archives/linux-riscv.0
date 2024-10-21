Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C518D3C927
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 02:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b+170c9jL/Y8Y00mR+7l3Xlibyt48/xNViPSGI/af4E=; b=vqbEbsoA+jjpb/
	b/ybz2xOFx6UL6X4XXXyGKNf8/hCHbI5c2aLLBjgEcSQqMWRztIGsQ8q1f4cmXW7b/jktxzN1cGFU
	qCiu7JJsh3i0ce93wDvAoH53e2HG+BrjL+XxG/htT4Kql0vqV0qp2HK7XoVWRpvxH5X4A7OaYiDyv
	c+MW520UsPZtAkI1JDwVt03flNqRgdQ5b6WhZeDrJ9Lup26VYqMhG7LHMdpLDzf++FEMfsHAw9SXu
	UsEGWOrFCYojxDlmBjyXk0o6DUHbQxe8M+bQcFUfc5KercPvzgsKhs1X/pOpAh5Zceda/sYa4p/q4
	IohzzupGm9hm8Z/CklRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2iHx-00000005sJc-2M1k;
	Mon, 21 Oct 2024 02:36:57 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2iHv-00000005sIL-0b1B
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 02:36:56 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2e2bb1efe78so2591520a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 19:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1729478214; x=1730083014; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SDwVvRsmB8PgMAF9NalbRCBobUSoLoKxM6gCOMAKho0=;
        b=WPjqVrlI6U7z9Al6M6Kc5tNEf4NRKMsJvuTWKW2vrQlgJzd3CiMUjcSp/e9ILtJUGA
         CoW0rZR8WGPvNib5BoNCAyKWg3jz8UwCfKgeOSh6WT8Nj7oMY7LwGEgSdNxtKbUwi+Wt
         HYAlW8evpQejOPJRRe2wirPGhmMQ5VHbDwU8mIuOL7sxlGFDPnGMF5FOkdUvEQhQw984
         LjcKiSOndSPB+lRBS1ZeIG6zh1csKYJ0H/W2UzTQEHKMPMjFY29ZPkX+Ie/g8e4XCApq
         H43JG+j6lHFRiAt/wSk/2Jjyx+Lp4A2mHsidilsOtbRsciDOsXSTtEwZQ0E2radthbEl
         TNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729478214; x=1730083014;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDwVvRsmB8PgMAF9NalbRCBobUSoLoKxM6gCOMAKho0=;
        b=mnLjmtsDSs3txOCQ4G3wQunLsuV0X+uFx7jwApXNVt5+6BpPtS+1elz2fLuim8WgT+
         sVeI94Z4rw1gI8wPyfUGj59rhAprCQGFocOSiCjyc5Hgrc8XN6+0RlAJ2eA6/oMuvHuJ
         bn+vdiCAMHwVtV6bIfCn/KdYXyBUH/bNmE7zQQMCJWJs7qYd2hPDM/uU8HbxsTUN6s4/
         18KoDMOO2Et7SpkUgwUX1mLRnuIlS4XNUsaU9CCKiT7fK+fvaCMkg6G9fwv1snZA+qm2
         FWTgJuqoY1/qXu6LSE5MqMjiA9X2LdflMZSQrcGnDcGogAjSi86JjYJFrM8CywmnzMBU
         dAnw==
X-Forwarded-Encrypted: i=1; AJvYcCWxPZUvSglkF1B4AkiTfx4gEZ5bU00ZWZA0BzJM3b9QKOA12CMuZ/w99r3UQrD3uKHEA68Y4bzB1IokGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLbJB2QBGZA8qeBch/afY6XoXjtpXd2o5NyrbvfDwdZ/FzQuVG
	V4nziWm309Zd+XcZ2bPWnRTHaCVM48+SSGnAv6qons7hsD8H1LIZKzXX+eTRSCQ=
X-Google-Smtp-Source: AGHT+IGNXTzbHIjYscMQc1FyHJL74YRfT9c4LzptWN49IdWjspBw/dUxnVD8S9MWaYzR1JmG3gfNjA==
X-Received: by 2002:a17:90a:bc9:b0:2d8:7a63:f9c8 with SMTP id 98e67ed59e1d1-2e3dc2d22f0mr20946491a91.14.1729478213703;
        Sun, 20 Oct 2024 19:36:53 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad355bebsm2337008a91.7.2024.10.20.19.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 19:36:53 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH net-next v4 0/3] Add the dwmac driver support for T-HEAD
 TH1520 SoC
Date: Sun, 20 Oct 2024 19:35:59 -0700
Message-Id: <20241020-th1520-dwmac-v4-0-c77acd33ccef@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAA++FWcC/x2MQQqAIBAAvyJ7TlAxkr4SHUq33EMWKiWEf086D
 XOYeSFhJEwwshci3pToDE10x8D6JezIyTUHJZSWQgmevewb3HMslqPU1prNaDWs0JIr4kbl300
 QMPOAJcNc6wd0tB++aAAAAA==
To: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Drew Fustini <drew@pdp7.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
 linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_193655_232547_35DF05DB 
X-CRM114-Status: GOOD (  16.29  )
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

This series adds support for dwmac gigabit ethernet in the T-Head TH1520
RISC-V SoC along with dts patches to enable the ethernet ports on the
BeagleV Ahead and the LicheePi 4A.

The pinctrl-th1520 driver, pinctrl binding, and related dts patches are
in linux-next so there are no longer any prerequisite series that need
to be applied first.

Changes in v4:
 - Rebase on next for pinctrl dependency
 - Add 'net-next' prefix to subject per maintainer-netdev.rst
 - Add clocks, clock-names, interrupts and interrupt-names to binding
 - Simplify driver code by switching from regmap to regualar mmio

Changes in v3:
 - Rebase on v6.12-rc1
 - Remove thead,rx-internal-delay and thead,tx-internal-delay properties
 - Remove unneeded call to thead_dwmac_fix_speed() during probe
 - Fix filename for the yaml file in MAINTAINERS patch
 - Link: https://lore.kernel.org/linux-riscv/20240930-th1520-dwmac-v3-0-ae3e03c225ab@tenstorrent.com/

Changes in v2:
 - Drop the first patch as it is no longer needed due to upstream commit
   d01e0e98de31 ("dt-bindings: net: dwmac: Validate PBL for all IP-cores")
 - Rename compatible from "thead,th1520-dwmac" to "thead,th1520-gmac"
 - Add thead,rx-internal-delay and thead,tx-internal-delay properties
   and check that it does not exceed the maximum value
 - Convert from stmmac_dvr_probe() to devm_stmmac_pltfr_probe() and
   delete the .remove_new hook as it is no longer needed
 - Handle return value of regmap_write() in case it fails
 - Add phy reset delay properties to the BeagleV Ahead device tree
 - Link: https://lore.kernel.org/linux-riscv/20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com/

Changes in v1:
 - remove thead,gmacapb that references syscon for APB registers
 - add a second memory region to gmac nodes for the APB registers
 - Link: https://lore.kernel.org/all/20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com/

---
Emil Renner Berthing (1):
      riscv: dts: thead: Add TH1520 ethernet nodes

Jisheng Zhang (2):
      dt-bindings: net: Add T-HEAD dwmac support
      net: stmmac: Add glue layer for T-HEAD TH1520 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml | 115 +++++++++
 MAINTAINERS                                        |   2 +
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  91 +++++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 119 +++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi              |  50 ++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |  10 +
 drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  | 268 +++++++++++++++++++++
 9 files changed, 657 insertions(+)
---
base-commit: f2493655d2d3d5c6958ed996b043c821c23ae8d3
change-id: 20241020-th1520-dwmac-e14cc8f8427b

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
