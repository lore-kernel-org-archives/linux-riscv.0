Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3946ACCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 10:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4ycjUiRyAG7sTBhjgg9ah29s1xw/DsCq6roo6Je87o0=; b=n7C/cco7seOwTc
	ZHtZjZR5zpB6baqlOjy1Ab/Rr07doBiClR9VF2n7UYWvAa+FeJjVubOmdDAkzrONEsTsFkJoxe0H/
	LV1O7AMj4vRrPC49qayBBInvi8rxdvLb6SCVN6sxK/U1pZA1Ybwyhhw2WEcCVXtX/965yZSLt3itN
	CofOzX+Oe2MEBSs/JgtjbOXWX0I2nsIqs5e2zt5S5BU0KheZ81KdvOOwZKrnmhK/Nv51HGpHPozjD
	Udbep1bE/wRXKCI5+xRWOsuJjW+cq9WyVLUK2u7f62HruZ8MZTq+egcckOoNlwz4hTyxx5Khmum9j
	vGews5U9Ery7ORn91/ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJjS-0000000H55N-08Hh;
	Fri, 07 Nov 2025 10:30:14 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJjK-0000000H51q-1mB7
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 10:30:12 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4710022571cso5688975e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 07 Nov 2025 02:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762511404; x=1763116204; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6lK1bWhoDlOt3D7+OTYGFbwlQlHjc0qM/7Y1vcvdtOY=;
        b=oWsJIhMNqDGEdQdEDiykcgQL/GAX+0fV42M35+kNmoi50i8NdPE0STrwE219QXL8aj
         iRZMkdEHf2sDuqluK8bSoT7r3lI9mN21hol4a32BNnkSj25Bh5KTE4a7QTH8nCMvxdq9
         t0jqialPIN/lXxPTQF46cSJSS2fDJtHSha2yVm9UQyOVk3NvgjmvRKn9Mt6bKT2XMfLT
         j9HO7Q7G3h6VEv64zdyuWIEVlYm3ORgvQzFv6+30tAXn6qnzSbzZK7zxL007DW5GoKkh
         CcEqUHwFjv1T9MfDxkUivjrjj4aRcS2I3AwQRQxosRs26P+8/C80MSlDDK/pzoiuU3oE
         6Qgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762511404; x=1763116204;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lK1bWhoDlOt3D7+OTYGFbwlQlHjc0qM/7Y1vcvdtOY=;
        b=A6Nae6sNdTsyWQ+zGzorRAbWENvOo2JmrhACfZH5/HXq3AyNQe0XHegCl72GkAxL0R
         mTpVcml5kUdLG8UFj3/uCqLFiaqYwo+cVtZt2r4aLW770n9Xl/0DXMS4JoGVqFQkD6Dh
         ZyxeLaaAFaBXGnj2inyM5OSoUwbrkri3ON//y6//QBkxoGi2n9f2EfbnhdJMmmdlHzSG
         QwoY0WwlMix3c0GESchZzF+Nzg594wRO3gVchX6wVYmn/DuxyElRE2LrIZSH4BSjvFGj
         TOeA3JR0IXjyHvKsiDqEgseI4Y5pA/HdfjVl7ZKdBkF4lx8ScCdoeTYk9dVfARTdxkXE
         S+YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE1B2r7cUgyfFOIydsAzamLoUOVupDrEkkaCB3YDCvybScuPiP1vm0pOJOpD3CjAeplq3NYSN+rnVB3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe+2w5ibEdmWT9lRKwPqQcpNmgboxKy9J7R8/xu+OT+4raFuSE
	uhxpvOnTdD7i9p17ZzRolCnEhW3OXBAJCmO9imSToaWXk7jlu9Hodz+HtEvatONj/m8=
X-Gm-Gg: ASbGncutTsBsEp9UkwT7S6zownpcYFwWluvev7fJkSIHDw9N/JaOGibff4FQreGH5ry
	RTSDsbgjSwlW8vJsMIcepV5/+DrCguVU88v0qhh1KRPT541TX7xaphf6uQop9OOf3rrc1K10+L+
	a9wL3cHqaf3dMWjB33dwoIoEiL6MbLDk5PSdi+n/vV9t2pSyDzRlgUEe8B7Z+otFldbQfBLmkAu
	mkIK6c2/k0DBullhSP5kk5iqHPj/6ho6Z2O26CL72KGaRbm6HZ+Hy4FL/Pm8d55/2ZMSm99sCuF
	RxbOLI6FOmr/ADw/7+aH02eME7OYT/0jn+K18pkEGwzf1GM4PJiBu7RmIRGb/lJ2Ys19YbxsB23
	j4MRhFOcmLIejluRzcWuPQDMjxUz+hL0Nh6Qm9RBfjdfL7jI1OIHPlx2cmHVT2yhV82wiIJCeNu
	x6oo9gYXqtTv9XMw==
X-Google-Smtp-Source: AGHT+IGLasgznDpysA1VVPTGU5y82R7RrVgkRw3m6DuFOG2T0Xrl7Qi/ZwJh7t3lCXtqhciZW19mKg==
X-Received: by 2002:a05:600c:1384:b0:471:14b1:da13 with SMTP id 5b1f17b1804b1-4776bc93e89mr17460965e9.14.1762511404248;
        Fri, 07 Nov 2025 02:30:04 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fb6d:2ee:af61:f551])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67920fcsm4414864f8f.39.2025.11.07.02.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 02:30:03 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v5 0/8] net: stmmac: qcom-ethqos: add support for SCMI
 power domains
Date: Fri, 07 Nov 2025 11:29:50 +0100
Message-Id: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAB7KDWkC/23PSwrCMBCA4auUrI1M3q0r7yEu0pi2AdvURIJSe
 nfTCorY5T8w3zATijY4G9GhmFCwyUXnhxxiVyDT6aG12F1yIwpUgAKOb8b3OOqSCjFi22uDSy6
 BMqGNIBTlvTHYxj1W83TO3bl49+G5nkhkmb61isCGlggGzKhWlWmIlbI8Xt2gg9/70KKFS+xDE
 KBqi2CZUEJJVVeUga7/CP4lyOZPiWeiUVJKgFIZq3+IeZ5fGplk2DkBAAA=
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Matthew Gerlach <matthew.gerlach@altera.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, 
 s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, Drew Fustini <fustini@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Shuang Liang <liangshuang@eswincomputing.com>, 
 Zhi Li <lizhi2@eswincomputing.com>, 
 Shangjuan Wei <weishangjuan@eswincomputing.com>, 
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
 Samin Guo <samin.guo@starfivetech.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4165;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ZivlGpi+T1c5DUoMpOPkmITE34pLl/IzVvSOHSJ88dQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDcojt3k/2PQCBq6F4SnzHXqKBXG0p9VyMcZAB
 IR/euEb67iJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQ3KIwAKCRARpy6gFHHX
 cq4aEADTN+ZUS9OBISS21hcbWDotjjlsSXxfMzNstpmanMhTAjTDqTozFbZykCw0Vf274vKfVTb
 3g3WrNgP5cYiyZLsDLBQrRu6Ymi7HMPV/05dLA/ZwUDNCnI1z7BZ88PIdxY5BkCZVJ3GKChFHtc
 /MO9zH6RfTWIudWrMD7Lfd9ZY6jZIvDoq773GGAi6RNBmUIuMwrmFa6KoiNx9FQ0NswFVmDySZh
 JXxm6zVaFTbIkl9oXrLqI2XJ/gVgWH0/Z84+6CyYJJfsal7i8ARil61hGY321B8LC7SosFR+j7j
 B++DT5/YtpyqEq7RWzvA9k+oYt2zfujGqApAhNHp98SeFy5vw7tmBvrmtAU5n+KbCm9f3NTe1i2
 fknVSt8R40eV+g1TckJWN/2/vn4TyZd0s9D7Xa8ovqOBTJDAbL9f+suLfjhBL3R5AIF1jlWhh64
 mk81XGCxt6IW5TnYAMUXhE+G4unUmH8c2hdj/NqoR1owhNhOADjIgBosXOV3YrxLMKT0gL57ydA
 hvbBFUSxE6/hrs7QM6W8VUkwoGv2QB0OI8zxJo6s2F2ZMuoMMLhGpkgud1m20fPaPHx4HQTSZR5
 +NT8ZRc9bQyTREbDWHw9J0JKcCeAP3mxkCDn1v3X1p7YmUtI4pBF/WjLgOT6OM9riUztf9yMJFV
 h4+xLNJvvsQjMdw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_023006_626567_CDA02132 
X-CRM114-Status: GOOD (  13.31  )
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

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v5:
- Name the DT binding document after the new compatbile
- Add missing space
- Make the power-domains limits stricter
- Link to v4: https://lore.kernel.org/r/20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org

Changes in v4:
- Remove the phys property from the SCMI bindings
- Mark the power-domain-names property as required
- Set maxItems for power-domains to 1 for all existing bindings to
  maintain the current requirements after modifying the value in the
  top-level document
- Link to v3: https://lore.kernel.org/r/20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org

Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (8):
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: use generic device properties
      net: stmmac: qcom-ethqos: improve typing in devres callback
      net: stmmac: qcom-ethqos: wrap emac driver data in additional structure
      net: stmmac: qcom-ethqos: split power management fields into a separate structure
      net: stmmac: qcom-ethqos: split power management context into a separate struct
      net: stmmac: qcom-ethqos: define a callback for setting the serdes speed
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |   3 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |   3 +
 .../bindings/net/amlogic,meson-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/eswin,eic7700-eth.yaml |   3 +
 .../devicetree/bindings/net/intel,dwmac-plat.yaml  |   3 +
 .../bindings/net/loongson,ls1b-gmac.yaml           |   3 +
 .../bindings/net/loongson,ls1c-emac.yaml           |   3 +
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |   3 +
 .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |   3 +
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |   3 +
 .../devicetree/bindings/net/qcom,ethqos.yaml       |   3 +
 .../bindings/net/qcom,sa8255p-ethqos.yaml          |  98 ++++++
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |   3 +
 .../bindings/net/renesas,rzv2h-gbeth.yaml          |   3 +
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |   3 +
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 .../bindings/net/sophgo,cv1800b-dwmac.yaml         |   3 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml          |   3 +
 .../bindings/net/starfive,jh7110-dwmac.yaml        |   3 +
 .../devicetree/bindings/net/stm32-dwmac.yaml       |   3 +
 .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |   3 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml |   3 +
 .../bindings/net/toshiba,visconti-dwmac.yaml       |   3 +
 MAINTAINERS                                        |   1 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   2 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 342 +++++++++++++++++----
 26 files changed, 448 insertions(+), 63 deletions(-)
---
base-commit: 9c0826a5d9aa4d52206dd89976858457a2a8a7ed
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
