Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9F3CDE02B
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 18:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IPGYafpWezSeVcIPuLEJ7BgKieTTyWAvocSZymYFa8Q=; b=NEk3X2NbGL0jh1
	7IcDsm/Z3xx27HzJRicUg9n9mvF4wXLT1qGtBd40SFEuTvWjPoAmwiPdZqvm35Wr7vJ6tja1OyybX
	iEYcmR9OSHxKXm1GTgCBSkP/L+asUgr+T5POBgAE3dLdRX0ykyTg1Osa5bwr7mpXBOxWP1gsk957a
	ntk8puegJQ7SbOUU1rv/FBujUbp25U+B+0a9hx0EKIXPrHaSDJj0iyhwrAjJOqt9By/9g6wQkzrh2
	y0nlPZT26OONm9TxoauT3RZHxUSt4bPY4Co7yo76Wv354gbHbgq58lRqVB78vtxrsi2sxkHUy6N/H
	oyuzr/ZIG1aXk4fFK2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sttAu-000000097jD-0yxT;
	Thu, 26 Sep 2024 18:25:12 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stt9h-000000097YN-3grM;
	Thu, 26 Sep 2024 18:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Xyxq1hzO7uPxbClYISo8yIzxqOiUVL2N8zCxWxmwYmk=; b=KIQv53zqR76AnG7/XgXxwA6gAR
	Ka9x8fFapRY9dNxso8ODjLZPmuQjTos01ZAN8ukm47V0V4o/HRV8EXRhH3523KP0MaRyhDQ/4L4Qt
	XFk4kUp3tkHq/lr7L2TAC1gBfbYTwMUzYUEqGDVt67NVXHJttIOdayxCXD4xQDKMhoaM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1stt8y-008P2y-EE; Thu, 26 Sep 2024 20:23:12 +0200
Date: Thu, 26 Sep 2024 20:23:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/3] Add the dwmac driver support for T-HEAD TH1520 SoC
Message-ID: <5e379911-e3de-478c-b785-61dbcc9627b1@lunn.ch>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_112357_940042_13D2B87F 
X-CRM114-Status: GOOD (  15.82  )
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

> Regarding rx and tx internal delays, that same section in the manual
> doesn't specify what unit is represented by the delay_ctrl bit field in
> GMAC_RXCLK_DELAY_CTRL and GMAC_TXCLK_DELAY_CTRL. It is only 5 bits and
> a max value of 31 seems too small to represent picoseconds. The vendor
> kernel [2] uses properties named "rx-clk-delay" and "tx-clk-delay" but
> doesn't indicate any units. I see ti,dp83867.yaml adds vendor specific
> rx and tx delay properties so that is what I've now done in this series.
> Note: the hardware default value of 0 for delay_ctrl works okay for the
> TH1520 hardware that I have.

I assume you are talking about RGMII delays here?

Do you have a board which needs to set these delays? In general, linux
has the PHY provide the 2ns delay. You only need the MAC to add the
delays if a PHY is being used which cannot add the needed
delays. Occasionally you need to fine tune the delay, and the MAC
delays can then be interesting. But since you have no idea what the
units are, i would prefer to simply hard code it to 0, unless is it
really needed.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
