Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F36FC25B78
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 08:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hFA9L/Pzn9w1iXOnSPpGmUznQjCoUO3pw8R4LChafdM=; b=1I5oKgezhiaEZC
	Sleazp7lAkAwToRY36L/QaRS+WYC9M/74rOa0MBDSQ3CT5221spd0Q4zWUbmCBiQ6G78J1AbKK4/k
	89phdiIhx6Cki5fyaTHrMI2xTANSH3hChaGoYYljUs52faRDq1R6sMZ5TlTGkYfx4cK8uRWr5tK6L
	1szkJ7mkNBYTooImw3UL3cL+nuB1YoMnA7Na49ae+aTJqCflheSvsbAJziQ/WuGUYO9gFxtT2p+rq
	TxJkOXO2pAAJZug6ih7ocmwyW4gJyn7tyZ544GQrzCmWRsqrU1w9t0/N72kQq24HIgvKGpd0MOWmJ
	FTUJTGZWSqycw/G0E5bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBs1x-0000000HRw6-3u69;
	Tue, 28 May 2024 08:18:01 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBs1v-0000000HRuk-0F8N
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 08:18:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ptdRbhjrU2YQFZDIdErCpj8jdFAb7IMVbRAa0hSntoU=; b=xi6QhMkzi8MZAlFsG0qMB6gZNm
	zcxFzAM2cfSsbE9P+TkNvq7CG2mdAEnO5Y/+m8EcvAzX7b+Rd0ziS5JekLB8WQhOMwUAqREQwX8Kp
	eUduX/VeNECDR1NerQqUpLmMGGm5WcxvomQxAjSAUZbCDYy9SKLHG5iicwp0gfnOhkjvv94TooJBM
	RFSlKSCszCHbn4/G6YYBq4rj4h/Uy+3bGS5aug9WGkKrkhc3RerMcKUWiPm2vGgejAC/7IYR9e4ti
	m7BCXBpfO1xpI/EMhx2OiKFaNY96Wr8UocUqju/zi4IIb2+ePyxzGdrK6cbVE5o5g5KNQ3zVZ3OdX
	42dJRckA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33574)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sBs1e-0004Ri-3D;
	Tue, 28 May 2024 09:17:43 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sBs1f-000375-47; Tue, 28 May 2024 09:17:43 +0100
Date: Tue, 28 May 2024 09:17:42 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>, Yang Li <yang.lee@linux.alibaba.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] clk: sifive: Do not register clkdevs for PRCI clocks
Message-ID: <ZlWTJvvTSm2hH2ls@shell.armlinux.org.uk>
References: <20240528001432.1200403-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240528001432.1200403-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_011759_254307_707B3E63 
X-CRM114-Status: GOOD (  11.31  )
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

On Mon, May 27, 2024 at 05:14:12PM -0700, Samuel Holland wrote:
> These clkdevs were unnecessary, because systems using this driver always
> look up clocks using the devicetree. And as Russell King points out[1],
> since the provided device name was truncated, lookups via clkdev would
> never match.
> 
> Recently, commit 8d532528ff6a ("clkdev: report over-sized strings when
> creating clkdev entries") caused clkdev registration to fail due to the
> truncation, and this now prevents the driver from probing. Fix the
> driver by removing the clkdev registration.
> 
> Link: https://lore.kernel.org/linux-clk/ZkfYqj+OcAxd9O2t@shell.armlinux.org.uk/ [1]
> Fixes: 30b8e27e3b58 ("clk: sifive: add a driver for the SiFive FU540 PRCI IP block")
> Fixes: 8d532528ff6a ("clkdev: report over-sized strings when creating clkdev entries")

This doesn't really fix this commit, since if someone else is doing the
same thing, then they too may also fail to boot, so I'd suggest that
this Fixes tag is removed.

See https://lore.kernel.org/r/E1sBrzn-00E8GK-Ue@rmk-PC.armlinux.org.uk

for a fix that solves the issue introduced by that commit.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
