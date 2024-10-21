Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADC7D15D93
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 13:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJsUrjsTWAVz6pXTk5MFJjSLLJvaCWT9xKlN+zn5Ji8=; b=wYdURN79x2P28b
	3rDBOpz7ZUXmfji4xhhu7mbbGIA7F90lQQLrm0S9pbuMul7AdXXNJwHxvD7Te0SpM+nJkji6SU00i
	lnAtx55PmmHVThdOwip1HY8p+1NYbIVDqXUAkvl6cEqZ22RVMbg1tWFIf5FIJO9plibikkl9HFsmi
	F77c8nZNRu7Hqab34+KQVKsVw8VKgTjFk7Q/0k5Z4HslPFTQMTspMdr0W34TejCGu72AZn7Zkumf6
	eUmkXIc6P+vKrrdUbAlEXHZNugmZiK85VHIWnJleQI+ita4svSIoknnLcpp96phbhk/GpX6/xdJN2
	KQH+hGFuPCuWtlq/JjqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2smY-00000007UWO-20qF;
	Mon, 21 Oct 2024 13:49:14 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sRh-00000007Q3d-2rjE;
	Mon, 21 Oct 2024 13:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=oyGvjz3/Hib5fIbnXMnThAnbAp+YfY0g/qjJuNmpK4E=; b=Vf7B2c8qiEwkPVEwyBcYyfO60W
	ioO34B4XYd++tnetkNAqExZEqPVXB5v/j6vULA/sT4YpCzZMazXIqcCo/A8XKYr0pvhjeRmAujCHP
	uEQiS7X6XEbId/OSkwXV1uow9Eku1mO7mWIrIf174yXI9Lp4onWcoSU3gm4sfrnNbrLA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t2sRK-00Aj01-4D; Mon, 21 Oct 2024 15:27:18 +0200
Date: Mon, 21 Oct 2024 15:27:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
Message-ID: <65720a16-d165-4379-a01f-54340fb907df@lunn.ch>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-5-inochiama@gmail.com>
 <227daa87-1924-4b0b-80db-77507fc20f19@lunn.ch>
 <gwtiuotmwj2x3d5rhfrploj7o763yjye4jj7vniomv77s7crqx@5jwrpwrlwn4s>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <gwtiuotmwj2x3d5rhfrploj7o763yjye4jj7vniomv77s7crqx@5jwrpwrlwn4s>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_062742_294388_69C35B0C 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

> It is related to the RGMII delay. On sg2044, when the phy 
> sets rx-delay, the interal mac is not set the same delay, 
> so this is needed to be set.

This is the wrong way to do it. Please look at how phy-mode should be
used, the four different "rgmii" values. Nearly everybody gets this
wrong, so there are plenty of emails from me in the netdev list about
how it should be done.

    Andrew

---
pw-bot: cr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
