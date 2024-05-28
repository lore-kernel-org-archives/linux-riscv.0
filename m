Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6312C25B79
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 08:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZMBFtzmIN3nEC1Dmu9HWlsgH+NV30GhT9qFhwIBGiN8=; b=UdkVSbhHxrfqOl
	jQCAi2RWLOXtLDIiY5IpdYTR5ZQq+6L3rRZmgx5zWu4PxCkLq7NrWvb96R74SkoIAc7EeJsIO5V7K
	Fad8ZD0Gsf8bC82vFPmJe7eZUVy6nq5DJDwuk9f2y1u0CRCXZtl+1shDSv57G6mLcmKnP0inZMizG
	G5L+vEiphSU0HQ4/y66v6cPHCpyRb4dvZ6PIVCiGVSnVm+X3wnlK6QGP+sHuJntWM5/bxI0/k5WRR
	m4Ij18Kw0jcFme1kJ5asTo0R6bXVK1Xc47WLojEfWWcM/28W9aG8blvFNt81ykjf998SEVzLaSRSh
	OnqckXHduVnJT37ktPBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBrrK-0000000HPNB-0N1B;
	Tue, 28 May 2024 08:07:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBrrH-0000000HP2G-30Lm
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 08:07:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=T1kkozHdAWncRAY26LRIlcmiras1bPg20TXNvg/U/KY=; b=Z/3d3nBpM6tBXg3l2yk3TLVzXQ
	wh3kY858l94g3RMqEd7wzU0t7n0cntF40q50QW2iDI2UHPOlC0Vup16ADO620EkFktVcSfUcYqjFv
	9MJuXcTWYdMQ6K6rAnZCOnqARVomgke9Jje8pKZ3/BS9dpVh9qDCVS4lHYSKAu+iSLVVNEPEjkl32
	CyeCa1e5E5CQOedayL+Uc4rgBGmHzpBKLpcWJSWSU4QJ8m0MkOLDJvxvpufkdDS9s114+EIZ24Liy
	+UcJPs19UjzvbWEPYpDozyBe0ptclcquizRmXHkK0S2yp1jtGG7oaQbS+Nk1w6XVLqTYrwwqpvwkS
	dtUTW4iQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49854)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sBron-0004Pb-0B;
	Tue, 28 May 2024 09:04:25 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sBrol-000361-I5; Tue, 28 May 2024 09:04:23 +0100
Date: Tue, 28 May 2024 09:04:23 +0100
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
Message-ID: <ZlWQB1q+8cE+mOAN@shell.armlinux.org.uk>
References: <20240528001432.1200403-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240528001432.1200403-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_010659_784424_4C05C229 
X-CRM114-Status: GOOD (  10.63  )
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

There is another reason they would never match - clkdev has always been
about matching the clock _consumer_ using the device name and connection
name to the producer. The device and connection name passed into clkdev
should always be the consumer (it's documented as such.)

Providing the producer device name to clkdev when registering an entry
will mean that clk_get(consumer_dev, consumer_name) will fail to find
the entry in clkdev's table, and thus fail to find the clock.

So, this code has been incorrect from the very start.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
