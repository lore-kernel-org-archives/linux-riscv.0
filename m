Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912C8C3DA42
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Jul 2024 16:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=czP+e2vY1pvIdWFPklX8zFhz4JiFYucw1Hmtk6340yg=; b=XRQK7n5AC4ecme
	fAlYMjsQAAxT2/EfdsIRqKNTlYwl9kZbq0MX4rkjnCBIWxLg2AEOU69qwwi8mvLJbo2jURllDvPee
	GoY+Ky4IrXEfNo27mC9xVfKHefJqr9xZuLNn+srfVgYzyT2sFI/A5NeVb9mguWWgc3g5yqGdINHLN
	ShlCnLibViZrJwwsFSMq6C3NxzB/DM0kwbRU8qE3Q1PVsougn5NoaBTmb+012bJx2xSTNfaL045OC
	7OOI2wNt/uZpW8uLKuEdlEHGLBSK4Ahok0h9vChR6/WG7gmTIW+mmpu50nc8ZMBO/vL10qEMjMk6W
	faPCaGKnVE6Iymmkm+Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sT1en-00000004k4S-3nYm;
	Sun, 14 Jul 2024 16:01:03 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sT1eU-00000004k0N-1rCf;
	Sun, 14 Jul 2024 16:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Gcag5dhogKZC9gz32/PhUCgzc0qisX31yFm2IoNiCR4=; b=tVVEbyH/ZF78tYD5buaLytDHq7
	aDXKypXG/uP8agsihtqRcSsxAlBE+IX5vdMGcMs2VqmPhGi5KYoMupCpgGTtYYRr0pikXWeUOrg1k
	bd46o1b45Al6L1QVJ7CpZJjuLsd8+OpP4yFpCnjn+bz7qQBJIhqjAyn6I/qA92moIilc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sT1eB-002Vkg-Lq; Sun, 14 Jul 2024 18:00:23 +0200
Date: Sun, 14 Jul 2024 18:00:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Drew Fustini <drew@pdp7.com>
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
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC net-next 4/4] riscv: dts: thead: Add TH1520 ethernet
 nodes
Message-ID: <57f778e0-e29e-4257-a06f-a15c96da49ec@lunn.ch>
References: <20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com>
 <20240713-thead-dwmac-v1-4-81f04480cd31@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240713-thead-dwmac-v1-4-81f04480cd31@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_090042_505675_7EC68E75 
X-CRM114-Status: UNSURE (   5.86  )
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

> +&mdio0 {
> +	phy0: ethernet-phy@1 {
> +		reg = <1>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <22 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios = <&gpio3 21 GPIO_ACTIVE_LOW>;

Are delays needed after the reset? Does the reset need to be applied for
a minimum time.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
