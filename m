Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30138C25B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 20:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9olOY+pLiyn5EcYgFpjKFsgkBzRK3bdQL7/wE0LTU4=; b=IfVK2HO9R8X/Vc
	KG0hdHULjvcS7kZ9nFKR6jM3B8SJEOtJf2L0SxuZV8g8474CyfMyXH4RtBtob8N4uOVyWw1ANCGPC
	3CN21TmKrOKdMSL3ltJAQtd0YDikJOfVisvNcOovZi5CqBvy32db4xJVZXik3v61T260sHXnRn2ic
	Fnd7dA+q+8lVR1jfEdeJiR2QKhUAlAn4tffZgwauZOODI1djbQ1pBFY1MqaOaGZAmjiF+Ay04gNtt
	vq8IW+bBBTgxJid0rZyQcAb9U2i+d9gOIExLljGTXm7P2YMSY/BZKg1md2/wXBRz0sLf8uILdLIxD
	up7+JFr5bYK3doJ05CVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCQIj-00000005V0I-0xU3;
	Wed, 29 May 2024 20:53:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCQIf-00000005Uz7-2oCx
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 20:53:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 51CED6187C;
	Wed, 29 May 2024 20:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC39AC113CC;
	Wed, 29 May 2024 20:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717016012;
	bh=JSXXu4JpE/7VNAkn8ScfasSuOVWoKy4YeGw3atPcUQ4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=QF2THXyFYPfs9hzEyvzTQSP1sgf7zsaon8ypZGmgCMAUn1hhK7qNlafnngZqEJES3
	 FgR+dPqb/Jw9RHDPWGjNcXTveERP/uX403wHibUIvKcu8aC02yVCfpg9L/yNC4Hq3v
	 MPODVCPDr91yTbNSeaKY7z2qPG9ogTY0symVJmKrKQ/xrQYle99CTR1yLTMjxKIVWi
	 VB3rFtGeQ5JDv9cB/aKfbKLX0rOmYfa0Jj2+T2eoyV01KoW5bE9sD0KzL87uLP0Iz3
	 PTwvJdGkDkjIASyTPQk6kmpJWv+t1OdFtHPCnfRXippGKQI1BFGyQWb+OxkaSaNdKD
	 UOEtd3gj+Xxig==
Message-ID: <a8754e9c4c01d808f3774bc0dd71e3f6.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240528001432.1200403-1-samuel.holland@sifive.com>
References: <20240528001432.1200403-1-samuel.holland@sifive.com>
Subject: Re: [PATCH] clk: sifive: Do not register clkdevs for PRCI clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: Samuel Holland <samuel.holland@sifive.com>, Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Dinh Nguyen <dinguyen@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>, Russell King (Oracle) <rmk+kernel@armlinux.org.uk>, Yang Li <yang.lee@linux.alibaba.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
To: Samuel Holland <samuel.holland@sifive.com>
Date: Wed, 29 May 2024 13:53:29 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_135333_766887_16F4D54C 
X-CRM114-Status: UNSURE (   8.72  )
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

Quoting Samuel Holland (2024-05-27 17:14:12)
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
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/linux-clk/7eda7621-0dde-4153-89e4-172e4c095d01@roeck-us.net/
> Suggested-by: Russell King <linux@armlinux.org.uk>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---

Applied to clk-fixes

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
