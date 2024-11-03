Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDB5D11183
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Nov 2024 17:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cQVgNAO1icepIejEoElDiNdZdHr/VAVwim5xOzjkUt4=; b=b7SAjk42paLp40
	SQzmZdzYEJlzLYsEHQo3crcO2y+x8IyTWYVXYgRPQ/3yRIpaRSjntvDr8MTolG1k8mgkJ/YR0C5lp
	zLaBFjhFoxlAt+SEaj1+KaDwXAtFfQMwsbRH8XyTbqaCcEqQHFntFUafBn5pyNAVJp2F3fcSZ3eK0
	Vn1it2puEbawg+e3EpCA+DzXeIgA5ZwH5EihiQGv4bjh6rOwmcmjsxdAH2Wg0qGHo1m5fw5hXaOV6
	OfM4EkK0IiezQixOEyKDxV8KCvy/pl4xB1+PASCee+mVesq7i7FG+uBOkE9XVgDL8GRB9KKHN+3ui
	GWoVb7PJCZ/7mwlqLoOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7dxE-0000000BjdC-0OAm;
	Sun, 03 Nov 2024 16:59:56 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7dvU-0000000BjMW-42uo
	for linux-riscv@lists.infradead.org;
	Sun, 03 Nov 2024 16:58:11 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20e6981ca77so36175975ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 03 Nov 2024 08:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1730653087; x=1731257887; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SiRHBTzAaAAcdz9wR1AEo/4hHR8Jww4cDbAZ/MX74uo=;
        b=h3OgtW9KfN0hM/bRFRFl78mu/1TPBJr7k3V+TxQ1Qzhe21udqCckDzqh7paDHtgewD
         QjbVLxHYjUj+icYGwmS4oGQowWnOlMME1SH+jML90yfSnAL1dL/jgnAHc/U/Wjfp+V/S
         KrFSw+45AiIxKeFtdUdqg5gQ0klrApLpC9/Cc7FLF9bBRGAR0+COteC9tykfA2Qknufx
         V+C0qjA/Hrz8BUEIrpfVjhKObRAYLmkxUjTtmxS8d2+9HUmuzEN0vDd1I34mZoYVuHEU
         XJsoSKJ8jmXeTJYossX44dt97uNXfUjFih7nKEVEI36kQGzeJaG1aiTVbtJyBDtP/5QI
         NG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730653087; x=1731257887;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SiRHBTzAaAAcdz9wR1AEo/4hHR8Jww4cDbAZ/MX74uo=;
        b=rhTZYcr75FalLn478iNo2oihdQ+6H/bsE4dlDi77MSo1aXW9Y2Up1ODfp5fSiogqBC
         foxM9uuyc4lIu4xJ3Kc/H1NnQ9nU3LxOgLXF4Ztoi+P0TTWvRZtPmRMnMkeSjGqQTDdu
         dt4Isaoj3Qp/YUH4ZcHqAN1n3I68vgpUqR6oz4nYqdrNj2eq/BpPyS/86oc9JREW2m76
         teqlg7nAlPb7apVToS6xpKKLJD87PCOwNxg3KOAWAcYwQrO898AU5Kjm9t/GJKakFil5
         Xq9NzTwhcOwTbzE4Kgp0G5XPkulBAJEPZ6gzFgolghMb0a/Zs3u/NtX19sfw3rnrI0xm
         dgpw==
X-Forwarded-Encrypted: i=1; AJvYcCWLH6h44msbbEFMfZVlEP0eIJEWFYbvb3W8sNWVt6MdUG5ePgDCGKxY0u4D5W4zMqUczau8FECPESmrnw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPhjHsHBUKrRvbcPt2jQdk3w6dq0UGP4WSpSSA3z8mA+o+tVIK
	hdhpGA8kDT7W+QYrWBm81Y0oYIoF6M1PM40ak1ANyS3VyNMAL7mv7+3yV0rzaY8=
X-Google-Smtp-Source: AGHT+IHZ3SR688u4NeecI0FgN5pXp5mQEMhPTdsDVQGdNI3vsPP0cL6muQcMZTinATTJ8tXbeT7e2A==
X-Received: by 2002:a17:902:c40c:b0:20c:7d4c:64db with SMTP id d9443c01a7336-21103c7bfafmr179492615ad.49.1730653087220;
        Sun, 03 Nov 2024 08:58:07 -0800 (PST)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057c9783sm47531355ad.236.2024.11.03.08.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 08:58:06 -0800 (PST)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH net-next v7 0/2] Add the dwmac driver support for T-HEAD
 TH1520 SoC
Date: Sun, 03 Nov 2024 08:57:58 -0800
Message-Id: <20241103-th1520-gmac-v7-0-ef094a30169c@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJerJ2cC/23NTQ7CIBQE4KuYtxYDlD9deQ/jgtDXlkWpAUJqm
 t5dZKXR5WQy32yQMHpMcDlsELH45JdQgz4ewE02jEh8XzNwygWjXJI8MckpGWfriDZWK2vP1Ck
 OdfGIOPi1aTcImEnANcO9NpNPeYnPdlNk6/+KRRJKOtNTK4ygahiuGcN7GjHkk1vmphX1IXT0W
 1BVQGGYVr2QjKlfYd/3F0fDCcj4AAAA
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
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_085809_062457_71FEFDC8 
X-CRM114-Status: GOOD (  19.77  )
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
RISC-V SoC used on boards like BeagleV Ahead and the LicheePi 4A.

The gigabit ethernet on these boards does need pinctrl support to mux
the necessary pads. The pinctrl-th1520 driver, pinctrl binding, and
related dts patches are in linux-next. However, they are not yet in
net-next/main.

Therefore, I am dropping the dts patch for v5 as it will not build on
net-next/main due to the lack of the padctrl0_apsys pin controller node
in next-next/main version th1520.dtsi. It does exist in linux-next [1]
and the two patches in this series allow the ethernet ports to work
correctly on the LPi4A and Ahead when applied to linux-next.

The dwmac-thead driver in this series does not need the pinctrl-th1520
driver to build. Nor does the thead,th1520-gmac.yaml binding need the
pinctrl binding to pass the schema check.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/riscv/boot/dts/thead/th1520.dtsi

Changes in v7:
 - Remove GMAC_RXCLK_DELAY_VAL(x), GMAC_RXCLK_DELAY_VAL(x) and
   GMAC_PLLCLK_DIV_NUM(x) marcos
 - Fix register write in thead_dwmac_fix_speed() by using FIELD_PREP()
   directly instead of the above macros
 - Fix thead_dwmac_init() to preserve bypass and invert bits when writing
   to GMAC_RXCLK_DELAY_CTRL and GMAC_TXCLK_DELAY_CTRL
 - Add sentinel to end of thead_dwmac_match[]
 - Normalize capitalization in dev_err_probe message
 - Link to v6: https://lore.kernel.org/r/20241030-th1520-gmac-v6-0-e48176d45116@tenstorrent.com

Changes in v6:
 - Remove unnecessary semicolon from end of switch() blocks
 - Add Rb from Andrew Lunn on both patches
 - Link to v5: https://lore.kernel.org/r/20241025-th1520-gmac-v5-0-38d0a48406ff@tenstorrent.com

Changes in v5:
 - Rebase on net-next/main
 - Drop the dts patch from this series. It applies to linux-next but
   not net-next/main.
 - Remove repeated properties from required: in binding
 - Add Rb from Krzysztof for binding
 - Link to v4: https://lore.kernel.org/r/20241020-th1520-dwmac-v4-0-c77acd33ccef@tenstorrent.com

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
Jisheng Zhang (2):
      dt-bindings: net: Add T-HEAD dwmac support
      net: stmmac: Add glue layer for T-HEAD TH1520 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml | 110 +++++++++
 MAINTAINERS                                        |   2 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |  10 +
 drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  | 273 +++++++++++++++++++++
 6 files changed, 397 insertions(+)
---
base-commit: 03fc07a24735e0be8646563913abf5f5cb71ad19
change-id: 20241025-th1520-gmac-78a76aa90c62

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
