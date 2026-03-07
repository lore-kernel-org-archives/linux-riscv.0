Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7717EFC9EC0
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Mar 2026 03:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RswIuDy9P4JLAQdVA8FNQ/rPyFSrpBxgW2OrldI/Ymk=; b=zDIr5FwdsmWPJL
	9G+ikFTJWzKfFjL47Tnc4OuIGqonVyOF5PWzR6GIyACYxjTahvq3znr2rexIIXnTbvrJYv7ywBLw7
	EfKVbJcJm/vmSCj5UOriSssO85aTCUpNid1/LuEZuaFdHsRoBcx4ur3qRC88twFsgVmpcO+mAF1O3
	J6O/YwyzAMVoy/7A8JI6iHFXdrhHo+aG+R8S7UqjDhOy/ySWBaYlVtXZOodWWsIzbn75aDUk6TrBY
	lt85X+KEioMbmqZQ3U1h9vOzmMYb8yuJKgvAJQNDreW4hFsiml9I2h+vnfMPO+pFLwf26OvyILJfz
	btrhiTLthWwedA6OOQ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyiZl-00000004rSF-0GhD;
	Sat, 07 Mar 2026 03:43:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyiZh-00000004rRh-3pCn;
	Sat, 07 Mar 2026 03:43:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A61C43C6A;
	Sat,  7 Mar 2026 03:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B574C19422;
	Sat,  7 Mar 2026 03:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772855012;
	bh=Npi1ivSwi9obv8U3L34yLEE92R/UJPUFNgtE+UQvMxI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eEu0t4KqV0RXFs7ptg/3zuFhP8YGOnn/jnZa56ETLQ7fgpNICTk8CQhJZpG4tICj5
	 9RlrKYLlJyDOyDPNeBLR9i/IjqdNks26GRcxcCKRkytQCHcQ6FoDX/kaYfzkVD4I29
	 VM9fiopVVkrFjgAsAsP4yJKaVHQNAk5h1pWtGezpWDjiDE/LERIK9Eu1Hdtj4vsLVN
	 H0PIpltzVprS8RunFG2e2J+vtV+FW1P/lak0nG4JwecP2NkAj4/C1wWxjJb+/LP9AH
	 GyW7ZvTZlWI7b0Tg++YRXjC6U4V+brYhXf+KEuvVmI7jGUkI3lB5LBJNCK9YPVYeb/
	 PrBzkjLXUw4jA==
Date: Fri, 6 Mar 2026 19:43:28 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Richard
 Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>, Giuseppe
 Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Matthew Gerlach
 <matthew.gerlach@altera.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Keguang Zhang
 <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>,
 s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner
 <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, Minda Chen
 <minda.chen@starfivetech.com>, Drew Fustini <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Nobuhiro Iwamatsu
 <nobuhiro.iwamatsu.x90@mail.toshiba>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Maxime
 Ripard <mripard@kernel.org>, Shuang Liang <liangshuang@eswincomputing.com>,
 Zhi Li <lizhi2@eswincomputing.com>, Shangjuan Wei
 <weishangjuan@eswincomputing.com>, "G. Jaya Kumaran"
 <vineetha.g.jaya.kumaran@intel.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Linux Team <linux-imx@nxp.com>, Frank Li <Frank.Li@nxp.com>, David Wu
 <david.wu@rock-chips.com>, Samin Guo <samin.guo@starfivetech.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>, Swathi K S
 <swathi.ks@samsung.com>, Bartosz Golaszewski <brgl@kernel.org>, Mohd Ayaan
 Anwar <mohd.anwar@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH net-next v7 0/7] net: stmmac: qcom-ethqos: add support
 for SCMI power domains
Message-ID: <20260306194328.238d89ff@kernel.org>
In-Reply-To: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
References: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_194334_006483_9A8F5AC0 
X-CRM114-Status: GOOD (  13.03  )
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

On Fri, 06 Mar 2026 16:46:38 +0100 Bartosz Golaszewski wrote:
> Add support for the firmware-managed variant of the DesignWare MAC on
> the sa8255p platform. This series contains new DT bindings and driver
> changes required to support the MAC in the STMMAC driver.
> 
> It also reorganizes the ethqos code quite a bit to make the introduction
> of power domains into the driver a bit easier on the eye.
> 
> The DTS changes will go in separately.

Looks like it conflicts with patches merged last night, please rebase

Applying: dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
Applying: net: stmmac: qcom-ethqos: use generic device properties
Using index info to reconstruct a base tree...
M	drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
CONFLICT (content): Merge conflict in drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
Recorded preimage for 'drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c'
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort".
hint: Disable this message with "git config set advice.mergeConflict false"
Patch failed at 0002 net: stmmac: qcom-ethqos: use generic device properties


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
