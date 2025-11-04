Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6580DCCFA06
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 13:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E6L7qmNKttr1F0GO0m24wNy14/Y+W6GYijYrYy4dwWc=; b=MIG4xxemFL5DT1
	eo/IzkBPurndPntJBAqHVnM9nuydzyshRw/JbrDDn6OQ17HY3ZO1PxSLAbyHjKWU4lrtJHTpmFTzS
	BZFOnQLULVVa+MxNZRfChSuUN1UhUyR8Mb/UQ58Wo5w+waxWNe4Kriv4CxQ1cR8f3Rzx461Zpqn2j
	vHYNOCdpfRBxu/DxcEaZAsHifrzMUehxCOXbyy1zYonFyaOBo/1Z4BUgbGOBRrwPrFQI/pUg91SMj
	mQ19sB5mvyCSu7C/4J1pbiIT8H7B8CB7GYAiRpdXTUsCBamTRZcO7GArMw1OinrITbDe7VSQyQPm+
	cGy+6n5XURLIoVosir0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGmd-0000000BqIQ-1ANq;
	Tue, 04 Nov 2025 13:09:11 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGmZ-0000000BqFu-3zgE
	for linux-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 13:09:10 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-429c4c65485so4134766f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Nov 2025 05:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762261746; x=1762866546; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FxK9/M5N84FExLoRTW+PNKgn9H8+1HjlE5VylpeIsHQ=;
        b=XBVN+fSNXJ/QcA+YZvAj9cNP54wMiWuRqmeWbf/Gn3RGQXrNjHWXazxnusd0Mm5urs
         rKb31ww+Zqgc/ELJr+qSF1W+DokYhWn9Z0yz90U2B82JcZi3vQX/DkeHHf6Ev6Ae7OgA
         K3F7W8N3XGGRncymWGPfdXUYWPQ4WHK5yWbO+zjI5h4HpcyWqw8sp8uNGM+rwMa3To3o
         Pxzg7rscr43/ZS79dkdmdn3Wbs04u18ISJDhvHNUWsLU22RuPTPMWb2KSMnneTFkH5G6
         PioPYzd+RWbTBIK7SvD8CG2mEkUfoJ9V+il4IJS+ZjOfeuN5YAqOZ/TwMy08hHUx7SIa
         pZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762261746; x=1762866546;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FxK9/M5N84FExLoRTW+PNKgn9H8+1HjlE5VylpeIsHQ=;
        b=UOMXSdXGWBt0VG/FfYVBFQMYPgB5i+pwSUJ/nUZYIDcPmhBt3+HcILuH1IM7PdX9SE
         N89RENidYVJ5Zn1zNHvDhzwR9GN7ScjTDfTSyB7+z9us7moxY2Fk0X7sv3vyaFq6Uwtf
         f7lT0du2Iw+vDuCFBNvN59pGGQ26T/ka7rsQAEHMUxI5ij073HSjCPW+gjJIjju7G47I
         YpBm1QdZrgRAYfav25Nu2XtqeynuF5e8tn8jfo8rrl8GKlXbh5WTFAUAVCTMPlP47BhS
         CK7fdjR7ca12iIx1MnEBT5jVVCcPSWQOcahIQSCsxxqNldIib829xFFBDizgHKo9fgwA
         HA0A==
X-Forwarded-Encrypted: i=1; AJvYcCVG66mJhdcSDiucywHr3JdYr5DNAu9OB9XIASrd0J2Bv+eNbMcL2Kkndcokd39Z0u/90pnhIJWokG9dlg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjDx9mAe11xIyFbU0uX+TRHZQFre4Nu5OFBrtW2RPjCebTqLRn
	vEYVamjawU0w2Thg8RVBISCiLi2kxc/+v5vMLZAYETXO9D4pmDmxsTYqi2FqgOXPVgI=
X-Gm-Gg: ASbGncuE2pExziSnq165YaIt/neZGTVdJsDcK7DebNPWmseLaavri5jc/QiorzK/NZ/
	vNOl96HxGTzZoLkaH3AufMdOypHVGdo5UN2Kvsf1mNtVDGPpVOxYnmyzhbM59awnlGVLtn4Ipp9
	DY0gdIBSzbPGiVriDMXWb25NG2SHyxzqFgHzpmI0T9lSSWxNRdI9YRrK7MLoda1BRtiYyDQFdoo
	YKjAxXd8hsnf6TuAsqBD0QVxR5LfMNAnE27sBl7HZK6ChAYpVVxpZwaRR4oOt+QP2w3EFIEgELe
	cBOyGszgjyW43xDpcvgplBNO21A9JbGT/mMSUKO9jA/SiUWaz9qg+HiZF8u22Ql5c9MYTsQLd3v
	9b3aLDjQvDITJy+67RLXWr1IqDOMVnamgLSRqeeWchIkZOzOhlNw1luPkFBgbgWPuhUceVA==
X-Google-Smtp-Source: AGHT+IE51x9w7/hxMZ9PYtS8ESk4KgkwdjVyNKfliIp++ChjMUBtnNjUsSmL+9gueXbgY/eWMabzRA==
X-Received: by 2002:a05:6000:25c3:b0:429:c989:cec0 with SMTP id ffacd0b85a97d-429c989d7c1mr8999942f8f.48.1762261745752;
        Tue, 04 Nov 2025 05:09:05 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:9ea1:7ab7:4748:cae3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc18efd3sm4554431f8f.5.2025.11.04.05.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 05:09:04 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v4 0/8] net: stmmac: qcom-ethqos: add support for SCMI
 power domains
Date: Tue, 04 Nov 2025 14:08:51 +0100
Message-Id: <20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOP6CWkC/23N0QqDIBTG8VcJr+c4HlNrV3uPsQtzVsLKpkM2o
 nefNRgMuvx/cH5nJtEGZyM5FTMJNrno/JijPBTE9HrsLHW33AQBBSgo6cP4gUZdoRATtYM2tCo
 lIBfaCIYk303Btu61mZdr7t7Fpw/v7UVi6/rVagY7WmIUKEetatMyK2V1vrtRB3/0oSMrl/iPY
 IBqj+CZUEJJ1dTIQTd/xLIsH6aIvcj2AAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3930;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=27kqkXSD5Dzki0U4bTNuaSeqDRFBWPYuP5DPJT8ZFZo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpCfroWcJdifPCL3DqXR4QlKAcd6tQEdpGbNgCW
 Q0tgy82H+GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQn66AAKCRARpy6gFHHX
 cnpEEACoL9P7Ziw7NnZ7jlXuq7UvKyOILSTEZrw4bOjYVbB1okZWNYg8nELLmKc0SWoQh1v81zn
 8jPH/xO+q8aI6WJyCtcYYoYAEbDEbrtPkkbAC9JBR1mQDXuBzUwhYTv6yrR+rPN1VgKpBxsoFGU
 lsvwRztOiuowXcfATN6VcDvribhefA+yt3NcXIKQYnVGQMLUVpsHX65Y4Kuu/7b0+I+REk3PjdX
 ueeB9pGfgvbs8cWR0bkEGRMrOwxNddI+q51rRBf3e3Wbwo3zZ6B5Akb/epU/Bxm+vE9bRHNx+Vh
 bhKSRhAno4uTknAh/I5sXVGLUnS5eFTJSOkME2ySH+J/3mz7cg4rH6aXMborjd0F3BS+zwYJIk+
 Vy3/TIzzfowg6ZmoYhJwVMDNF/KJKIlHM4E7iVeL8BY5UA/EvMv8hSsebb/K+ZzGWFMWxdHMR+I
 qbzm2ZlOv1gA6l+Zlv3jqJia1kgKYBHqCif6ucHCZkvx4uu717BzMa73qdKGhxDDmNV/TYltteb
 g/frzBavk4BzSsb0fEbqf83E8rp02Ks3gYYTvdPdXNf38dNdYvljDIdcDPqgLU/qBfMD9mp3dTC
 5ggohhPVS5WZWsK2NORk/IjygwdLF8oiWlmjh1MzdcMjuQOAvJE4V4SwjKWQnqSCuGO58QdU+KD
 DP2eqomEec9/ZFQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_050908_282682_1E0B5AE1 
X-CRM114-Status: GOOD (  13.90  )
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
 .../devicetree/bindings/net/qcom,ethqos-scmi.yaml  |  97 ++++++
 .../devicetree/bindings/net/qcom,ethqos.yaml       |   3 +
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
 26 files changed, 447 insertions(+), 63 deletions(-)
---
base-commit: 9823120909776bbca58a3c55ef1f27d49283c1f3
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
