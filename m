Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E19106FD60
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 01:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EGA3naNSS4wbn4kSNq2G4td5XAZeZvzQeC2EZwHU5Qc=; b=qLtZk3eFnXix7W
	DC/oJ3uYFIs8q9EggQgQ8W2TF1uKkkkoQYJ5parjVthvclDnfS33mWvuCqPUcrigYjb37Y0SYVyU5
	2/lozb5E9+VpDAxy9FTc6C7w3hVIwVh/pjzRn2DSWWR3bTRZfFDORgSc60WbdZ7YQjBBUnhT3eZOg
	odFotE9ygOE8Y3UcqgTNKugEHJfflgvfgNhGrYI7OEbAIHq/nemvo5xEv+54AtowF2vi4o2+nLxQs
	Fbu/g+H1ExXsI+omrIARrq6bA5B/SdcApUyTaGrtDvxUk7/H7px5Hh0+AXZj9G8cPTrZlNp9+MUmR
	Q0il+832n9uKQ5DZUBaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0r9B-0000000G2zY-0dPC;
	Fri, 13 Mar 2026 01:17:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0r98-0000000G2wQ-23px;
	Fri, 13 Mar 2026 01:16:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 32410418A1;
	Fri, 13 Mar 2026 01:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF82BC4CEF7;
	Fri, 13 Mar 2026 01:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773364617;
	bh=zPEcR98I4xhUijv+qJNI6kaevc+I8oOwAq51hsyZIN4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jFllOpLRMRE2IGfEDXUEY9ba4b3cNJWvEbGvGBw5ZGzoCW8DWdJj0BqcNiQ/Y8GUJ
	 cRhG0Zmu/MtyrpDtIKMli5RfjyB/7DdinXkjUxwC3r2xHYzxZbVE1PbUsIBtNBGdXT
	 zBg/De8hBSG2RiGNlB9aDCTKJRuiv+r9Rg4ZJ3giPiudOiLXMS1iDeGg6PQ7NkTCtQ
	 CN1f3+8XC3U+KAwErIpoSpBRfdv6Z/+4x5hJTBdsFVOCyayhVGj6jeZHQfgm+zMlxj
	 EQv4E9b4SZXOVU2lIIor9NApwk4IbuDYgD3C03BfACceOsz9wt5jUmHqlze9bYvBTs
	 DJoY+01DWokAA==
Date: Thu, 12 Mar 2026 18:16:54 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>, Giuseppe
 Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Fabio
 Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>,
 s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, Christophe
 Roullier <christophe.roullier@foss.st.com>, Bartosz Golaszewski
 <brgl@kernel.org>, Radu Rendec <rrendec@redhat.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH net-next v8 0/6] net: stmmac: qcom-ethqos: add support
 for SCMI power domains
Message-ID: <20260312181654.2d9ba69c@kernel.org>
In-Reply-To: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
References: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_181658_563026_3C8FCAA7 
X-CRM114-Status: GOOD (  11.34  )
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

On Wed, 11 Mar 2026 18:03:35 +0100 Bartosz Golaszewski wrote:
> Add support for the firmware-managed variant of the DesignWare MAC on
> the sa8255p platform. This series contains new DT bindings and driver
> changes required to support the MAC in the STMMAC driver.
> 
> It also reorganizes the ethqos code quite a bit to make the introduction
> of power domains into the driver a bit easier on the eye.

Not entirely sure what the conclusion was in the sub-thread with Russell
but FWIW this doesn't apply to net-next as posted so respin will be
needed either way.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
