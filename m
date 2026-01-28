Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAC6D3F06D
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 14:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6DNzOyA10OEFXtSPdK6Rf9Kmf9hI6Nxinbl0e943qIM=; b=fUew5LXkdGkFHs
	8WzCqVTKnS3m72Zp0DxdEpO1zPD513CN2JteFV9IPkWCXFMb0hsTwxlb2k9Hhyec12EuDLZ5NyNdr
	+15kmaNuii7igJSGItwyonehRfZ6YeHXe/h7MPgf6W9ZHrThUOVJf1sxBkb11poyC5AjFkUvxvnDv
	toq59azTGGk+sa+w2MUGC7G1kDq2e4UUcx4tndKAalO6KLE/NdKqJEw5HD20tmUQyDS46NhYywsxp
	GCSuVWd06vzK70N3hAPb9PaOSzsWAE8DSQHn2U8iJykKNIVjXdzPOttyBtQkuhe3pCLAJDn46iaPP
	Blh50pzNvHFabLpT88Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6Kd-0000000G9ZX-1Wou;
	Wed, 28 Jan 2026 14:15:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6Kc-0000000G9Yo-1NGy
	for linux-riscv@bombadil.infradead.org;
	Wed, 28 Jan 2026 14:15:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JzIHVDwFjCIwEjLThlMak+eaj2p5mVb9GNydSBLEdFY=; b=b8cBdGQqw5izIZXVWD9sfDTYph
	DqFMcX0HZuP9hCJ5KgzVllh7ma57SVN6Cskzb9Tl4ud/GblOCelxl1ZggOrsHzrWmiKESg1mNCBtZ
	kQvrp51E1L6DRwS8wNOmswuZ17vtCBNJ25RPxzfOW3l95ktFvIxij92hW0Rbo3JBSomBC741nnlYm
	8iOjEf74c0xwDZcAypvo8JQeky+pGIDJfIokczbk+z59B6rDOaAqOiEPnRp8f83JvDqoFsalKxARS
	pk1YSRFhuJ87vvce145lPgpA0zBXWlI+aRnXs57gSQMoTRXtL2LzouQtOviOkkFEUTss1sgFqhwiY
	4oYCTWvQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6KY-00000008guv-0cyf
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 14:15:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5561B1A2ABC;
	Wed, 28 Jan 2026 14:15:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 235796071F;
	Wed, 28 Jan 2026 14:15:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97CFC119A880E;
	Wed, 28 Jan 2026 15:15:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769609736; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=JzIHVDwFjCIwEjLThlMak+eaj2p5mVb9GNydSBLEdFY=;
	b=2laH6QUhpYYvedtbtK1TszrakUYndSaoMPZaLGLxQjTtGVjD7aGeF+DbC9TmEefWfX62Fm
	gIwU0WSgtC4YkPybIWcrIK2XaM8Le2TNik5+kLG/e0q+ZQBvah2yYHnpg7nBhponAxEYVw
	kF2p+eWpeZQn5ONETh64nPywAe3yLa1yLoMHt+DWGwZzHAyBNWshe4ma6ifcAwZHevNnR4
	tjCqa0Gj5r1k8INjkOOtv7xuzz+YT5OdnPZ62x2CzES5G6sXm8b5oj+kWgOyfPqvzwoSVS
	ly2jTDoCeHscriEYmFOWCjzZFD1Fc9qggGWZx5zLC3i+di4YixudZFyqQUtHGA==
Message-ID: <cca153df-ae6d-4644-97ca-653f3078564d@bootlin.com>
Date: Wed, 28 Jan 2026 15:15:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] net: stmmac: thead: avoid conflicts with
 PHY_INTF_* definitions
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Drew Fustini <fustini@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Fu Wei <wefu@redhat.com>,
 Guo Ren <guoren@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aXnpTy6XckPGcmg0@shell.armlinux.org.uk>
 <E1vl36A-00000006urf-19ox@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vl36A-00000006urf-19ox@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_141538_407455_EB75AD2C 
X-CRM114-Status: UNSURE (   3.75  )
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

Hi,

On 28/01/2026 11:48, Russell King (Oracle) wrote:
> Avoid conflicts between stmmac PHY_INTF_* and GMAC_INTF_CTRL register
> definitions by replacing the PHY_ prefix with GMAC_.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
