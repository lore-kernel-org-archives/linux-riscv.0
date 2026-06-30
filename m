Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE159C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 10:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iT+R7jbGXqltMEtRBM+igTLZBw56DQN1Ijur88lK9hU=; b=02bdscKgXAbCgI
	Z8ysoewExtGpFSguTQNcpBNkmz+t6rr6MkeR7HWRg2nMpiXW2Mat1Y2wsHG511BYnMwmOqGC/gtRa
	5D6alAoQIKLwZhrQFNzb4RWSthxYCRSutik4CkETxqGElz/Kkk3Lfg6LRLURoaCu+s03rqQTvcIiz
	Z0gcL44IjbnsGQMO1TCrAmm1p6xIptnAwcxx22nJCnZyMdQ/WNZ5ezJOwncPfy325i3wW0GQbdAw1
	qAHbEIlgLYqqFWyWRMvl0ib+R1Nge6oMEh51er3WTohFNKzWK1GJo55VA4a13qgNKGXPeHqN1/osS
	1a0gZPlsOsIauq6kumNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVch-0000000Gd3E-2UBe;
	Tue, 30 Jun 2026 10:23:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVcg-0000000Gd2E-0ouD;
	Tue, 30 Jun 2026 10:23:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 79CBA600BB;
	Tue, 30 Jun 2026 10:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8E41F000E9;
	Tue, 30 Jun 2026 10:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782815001;
	bh=hGencHR1rqX4oR1/IqjhQFQRDCZNECISdf4kfhlCG0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XyBy2bQcCpF6LYOuss3LRRJeQlCYc8dvpcRUfK1ZagqxIqYPz5p0WwpsaFIQBW9vW
	 IlOw0fNJJFpKyyg9iic4NuDm02LrPL3qHKHefNIo7aqpS80LB6lvKqynKgGBvzbREO
	 4ZvHpLHCO720wCr2vYLratFlyl/gE//Y7cU/ye1HTlkGVUfMCklP+eJYoqc/HjpTxw
	 MZXb8/jIFyvGrFJo82KLZha9Mhc3PkZrDWmDJGTsxLZUbwokWPsckf2VwK19WHIVoz
	 +qkE0c3p44BQOkrv6SHKYZtWI+7gQ0YPbPbglot3g6oJ2J7Z4K4XFytNkclDQawEPq
	 nxmkjQc7MH7Bg==
Date: Tue, 30 Jun 2026 15:53:16 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Radu Rendec <rrendec@redhat.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Drew Fustini <dfustini@tenstorrent.com>,
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-mips@vger.kernel.org, imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
Message-ID: <akOZFIowVvprnAMf@vaman>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
 <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
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

On 29-06-26, 16:51, Geert Uytterhoeven wrote:
> > Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
> > driver instead of the MAC driver where it was previously. Instead of cramming
> > both HLOS and firmware handling into the same driver, I figured it makes more
> > sense to have a dedicated, cleaner driver as the two share very little code (if
> > any).
> 
> I think you are mixing up DT bindings and driver implementation?

Should the bindings change if we have different driver and firmware
implementations? Isn't binding supposed to be agnostic of
implementations..?

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
