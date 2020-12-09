Return-Path: <SRS0=PU6a=FN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACB8C4361B
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 00:22:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF37423B5D
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 00:22:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF37423B5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l4+hUmJpbS7BYp6m/7txVNkt38xmkT/FIvY9UQ6v5ZY=; b=mQ5RYY27X8oxvhsozbOrCx69o
	aUcQQyKE3xVh2q/eXaOYamz6LP2fOFZzJJ6HG2bYaRKCUnM8BGvEuaQr7N51T2z0fkcPGkgAej1qR
	74izBmdJwhR8dTQSoAb8NEBJmmFgt54X7OkYy0WlVOAEnVzS5R0tkY+COxptjJ6HICxS4088wMg19
	4qqDiupeq2bdd1xNDMUw/HN69VWocQ40gzdxHoIFSog1aKj9J/sqZa9E4NIkejAVV4JDfZhvEqvS2
	Bn1CLkNxbeTeTprMtdh9Vc+P7y7ajOdljfVK2nxR6R7qZwVbF+tYe0SoUod0MGjo150qFDJgWWNmA
	I7PXlskSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmnFc-0007BI-IG; Wed, 09 Dec 2020 00:22:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmnFa-0007Aw-Ez
 for linux-riscv@lists.infradead.org; Wed, 09 Dec 2020 00:22:35 +0000
Date: Tue, 8 Dec 2020 16:22:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607473353;
 bh=7aLIiUxTStX+LYo0g8eo7ffWgLa3KFjWTVyCfcZ57Dc=;
 h=From:To:Cc:Subject:In-Reply-To:References:From;
 b=KxtEfx890KXGSsLxTVjROYHRwY0kk7yJrKsUG4p6A7hOjPCzvenyFZM2PBPRXiZ/n
 w60WBokUBoYRzmBjubCtMRfSfvxsxV6HIC7Idw7yNr54SKmRL577K0lj+W9JIC7eP8
 1wm5oSejwgMbnuUh2GNzAH0JaGYtCdrwxrRDQy3BRn6pyFZdoRjKY20GfFfm6wQc32
 5YQmntdD4cuajzapgkvHFtIX4iKpcV4b76sChcWwEtlmQXGFlAxKRNQOkFSA4jXLvy
 GxCWC9kgkqURWoitYmtwQ3nLx3kxH4YsudaIhpIR5Z5AtAVO9SnTorB+Rltmn9d0+i
 eXhrdp6m98zPw==
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 3/8] net: macb: add function to disable all macb clocks
Message-ID: <20201208162226.7ca7f49f@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
In-Reply-To: <20201208184856.GM2475764@lunn.ch>
References: <1607343333-26552-1-git-send-email-claudiu.beznea@microchip.com>
 <1607343333-26552-4-git-send-email-claudiu.beznea@microchip.com>
 <20201208184856.GM2475764@lunn.ch>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_192234_570871_7BBBED16 
X-CRM114-Status: UNSURE (   5.97  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, davem@davemloft.net, netdev@vger.kernel.org,
 linux@armlinux.org.uk, nicolas.ferre@microchip.com, yash.shah@sifive.com,
 robh+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 8 Dec 2020 19:48:56 +0100 Andrew Lunn wrote:
> > -err_disable_rxclk:
> > -	clk_disable_unprepare(*rx_clk);
> > -
> > -err_disable_txclk:
> > -	clk_disable_unprepare(*tx_clk);
> > -
> > -err_disable_hclk:
> > -	clk_disable_unprepare(*hclk);
> > -
> > -err_disable_pclk:
> > -	clk_disable_unprepare(*pclk);
> > +err_disable_clks:
> > +	macb_clks_disable(*pclk, *hclk, *tx_clk, *rx_clk, NULL);  
> 
> Personal taste, but i would of not changed this.

+1 FWIW

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
