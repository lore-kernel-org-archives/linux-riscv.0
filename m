Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124FCC3DA6E
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 17:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vuMaFL0tS6txok2vktLiF9+4MBca/rJldEDzzxVACd8=; b=riTyKGqSB35vIn
	yxBZiVUVC0kGkuiSbPvfKBFX5WKm4ZTnWCR003923a0H/mZ8pELZoKb+aXJb69DKxS3tpFFZOjBSB
	QMftmkOsrPkwg0nGCnJtDWStJiAWIx3Xglv1cA6D9U0qKMqsh3fUBi1VgaZr2u/3DuGoReFP27Lji
	DlO24S4j+fmRS/PSgymuzSPKzE9BKDWOcWyw+CaI8eqOane5IS1Wgj0jVQGRfv3RlQQVq5FZqWr4c
	oYmhPjRnoZq8H5HiRDnU+ppSejiqRmHorfi5Sd8mVmd1mITDHZ8vfytoQLPfOhsKzwpK7q5q0u15p
	sX7iS0NHlFGWU50CuP5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEvMf-008GV7-2k;
	Sun, 17 Dec 2023 17:55:45 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEvMd-008GUf-0j;
	Sun, 17 Dec 2023 17:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1BS2BYxI0fjRhDPFU1muWML+fVQMCFHH/gSfWLLCKhQ=; b=G2CLrRfKFu0XcBhesoEsUYs2NU
	fxQLK5S6970mi84T28XkFi+YuyqJFPT022Y931plnt/t9hTREG7bJHDkoTTpueHZrvzH0AXeKjvs4
	1dg4PhWHBHJzsdJol+cswDkvxUHQBln5quFlcko9UOJOdTmZlClCwz2ZMsl45BJIVkeU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rEvM6-003AGP-QV; Sun, 17 Dec 2023 18:55:10 +0100
Date: Sun, 17 Dec 2023 18:55:10 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Samin Guo <samin.guo@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v3 6/9] riscv: dts: starfive: visionfive-v1: Setup
 ethernet phy
Message-ID: <f8f9d454-6155-4b1c-b4b2-daf98267be14@lunn.ch>
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
 <20231215204050.2296404-7-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231215204050.2296404-7-cristian.ciocaltea@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_095543_270576_1770D455 
X-CRM114-Status: GOOD (  11.48  )
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

On Fri, Dec 15, 2023 at 10:40:45PM +0200, Cristian Ciocaltea wrote:
> The StarFive VisionFive V1 SBC uses a Motorcomm YT8521 PHY supporting
> RGMII-ID, but requires manual adjustment of the RX internal delay to
> work properly.
> 
> The default RX delay provided by the driver is 1.95 ns, which proves to
> be too high. Applying a 50% reduction seems to mitigate the issue.
> 
> Also note this adjustment is not necessary on BeagleV Starlight SBC,
> which uses a Microchip PHY.  Hence, there is no indication of a
> miss-behaviour on the GMAC side, but most likely the issue stems from
> the Motorcomm PHY.

I suggest you make a similar comment in the .dts file, just to explain
the odd setting.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
