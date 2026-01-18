Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB80C9832F
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jan 2026 16:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E2WnHhxvLeCiyc9Avd1Ge0qZsRocSkzrOMHGWJWXCG4=; b=fOAHDSKZ2l1Xha
	K+wK31+IUbmrbaBcjTlJT5K9EnXrJ+vH3PJ0ppzFuH+FLyGWTcUQvofGa6qsFv9GnoZ4pfQg4AB4h
	y0cAB07Juw8eObssChej5vwr+mgaxKzneKZl1+BcrDt4Rvu+jtxX8in/XpGixV6VC5AUpJNvGW6do
	9UA2u+zoKyPh9f0nk4Gcl8TvAM9faiLY7U+u4Hhvs8JdfDfO7w3upV21aF9FQVKXktC7dBeFBQZz5
	tNn4VkcPngEp26oKtfM0iGG2019iZKt/JzUlgQQ139rPmUhBILU9WJkuY+Mzf5jPQIuiDhFaWZ+ki
	k/NXgz1eqxegoYzLvOgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhVV4-00000000S5g-3y8x;
	Sun, 18 Jan 2026 16:19:38 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhVV0-00000000S4f-0kIh
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jan 2026 16:19:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=H5HJXUwqIdvCMxkNpGmqIKMuEfnbyUKuPXOj3lNiwF8=; b=VOz+D9DB+Je0+GUUx1VGDZeu1i
	WEndDPhS7lPav4Z/2raVz1tWppaaFUqKn6tR6oQquy7sh4N+KDk830AmwZEvG2Vg/RKjP+QMFZcOh
	jcKfQEMkKSHuYmOyPnvLlDL8C8ePCOqexoCo/6qs8G2HAQD6ooJ+sdU+4Lvw7QBckEmA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vhVUS-003Mo7-Ui; Sun, 18 Jan 2026 17:19:00 +0100
Date: Sun, 18 Jan 2026 17:19:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, Yixun Lan <dlan@gentoo.org>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH 1/1] net: spacemit: Check netif_carrier_ok when reading
 stats
Message-ID: <3659a81b-4393-4a8d-bc8d-6ab89396353d@lunn.ch>
References: <20260118100000.224793-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260118100000.224793-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_081934_221303_10454DE8 
X-CRM114-Status: UNSURE (   8.92  )
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

On Sun, Jan 18, 2026 at 06:00:00PM +0800, Chukun Pan wrote:
> Currently, when the interface is not linked up, reading the interface
> stats will print several timeout logs. Add a netif_carrier_ok check to
> the emac_stats_update function to avoid this situation:
> 
> root@OpenWrt:~# ubus call network.device status
> [  120.365060] k1_emac cac81000.ethernet eth1: Read stat timeout

What is the real issue here? That a clock is disabled? Can you test
the status of the clock, rather than adding yet more conditions to
this if ()?

     Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
