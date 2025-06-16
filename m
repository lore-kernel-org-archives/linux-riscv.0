Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D90C71135
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jun 2025 06:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DYsys0K6MfnBTnkwBNtN0nqMDdwp10EGz96ymM6m+CQ=; b=tubPxpNAghrJvy
	6QAb/+zJBJCUxUEFsNqnLqBqdZoEFsuSYHFJvJW2DXa9+55Thi1l8LgI7vcRVCufvYBJiBQ5XoFYM
	BpkXw/XkJiIcN+FlXWRe7HUFN6M3Y5/EThryG3uJ4XzkbDZ3yC/auSN2oGPn3VcaFD7FnV97yMAtX
	+/hRxBRPc1pejsbuvQC5Sruh5lfDWi57zU2sP9j9oksEY0QtkQd7EY91pmP4Mt6xgIg5tShMxUubA
	gatsVKXp+eVN+Wz78i+Q1JE6Q2P+WB4mnFiYcxsABXjm9uIPuJTWivKt6zSGMkrZpOUZLcQn6smpw
	JXCZnJt5LxgA0cRRZPpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3Uk-00000003Wrh-42xf;
	Mon, 16 Jun 2025 06:39:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3Ru-00000003WJl-3sEZ
	for linux-riscv@lists.infradead.org;
	Mon, 16 Jun 2025 06:36:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VreY7vwdfbnY43YQuZ8tmmMfYatLVGTYphJA07D57n0=; b=HXYee8EJsUuQvF0URuDLGg086h
	SnAnFNwakfQlbI1lRghIWcyofnzQZ/GrOR5lCW1YgzV8Bcj7b6/ja2mbAKKSluskglLR/pxMNmEOM
	KircGnHZ5CmoqdJHmaD4IWW5ZdFMUK3UrGwRRYiQOK4f0p9A0IQ+J/ygDWw149VHf86b51xJkQHia
	wF9jnzO/2Jb85Iv/1jCUILiyzrQczA5C7GlO0jcyiIN8SU791XVij/8xTpEwW5jFPHHyBFy3WOxcD
	Dt+nBADyJTqcq0ZToW27s0qoz1f83nZCP6WFO8s1oJGug/E0O327uIe9ruwxc7rWyWv7ksGkdYVja
	dskbDnxA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48550)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uR3PQ-0003HC-07;
	Mon, 16 Jun 2025 07:33:32 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uR3PI-0004ak-2W;
	Mon, 16 Jun 2025 07:33:24 +0100
Date: Mon, 16 Jun 2025 07:33:24 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Vivian Wang <uwu@dram.page>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/4] net: spacemit: Add K1 Ethernet MAC
Message-ID: <aE-6tPMpMfRD1Zgu@shell.armlinux.org.uk>
References: <20250613-net-k1-emac-v1-0-cc6f9e510667@iscas.ac.cn>
 <20250613-net-k1-emac-v1-2-cc6f9e510667@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250613-net-k1-emac-v1-2-cc6f9e510667@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_233607_021121_1CC560F0 
X-CRM114-Status: UNSURE (   8.27  )
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

On Fri, Jun 13, 2025 at 10:15:08AM +0800, Vivian Wang wrote:
> +config SPACEMIT_K1_EMAC
> +	tristate "SpacemiT K1 Ethernet MAC driver"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	depends on MFD_SYSCON
> +	depends on OF
> +	default m if ARCH_SPACEMIT
> +	select PHYLIB

This driver uses phylib...

> +#include <linux/phy.h>
> +#include <linux/phylink.h>

but includes phylink's header file? Does it use anything from this
header?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
