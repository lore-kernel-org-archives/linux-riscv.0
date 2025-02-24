Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D3DC021BB
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 20:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PsgEZvbXmQ44/378xKlqtJts/TSwrrcMFiHT7eWIFz8=; b=Fsy66DmfGDGZtB
	6oy+J2UNgN1LjS5580igMk4hh/e8+1edLCeIgiQif7dzzAPukNtBwj7Lgsbre/DE28gRTDNjQRqeH
	BdPLsYszoSFtp5caR4wHM33Ce5WOo08dugPYkiK4zj1furM+49DfQihazHms+QP+jaRA0rVsyfpcr
	DX6Iya0inrL2aIDJTaLDYl69lC9ltoRBmu2jgStg4bxvPsDwpytJd4Wo6CHhYPhN4rM11h8BPFcrS
	XHHqyca2BBZKaqLiixLTUQggLVPxwCJtQt4YPhn86xF1Ci/Ne6gCsy+lGO06VoBgV47Nq4RmiljO+
	EFXULg3LoWKONuSDi55Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmekU-0000000F2fn-3LLu;
	Mon, 24 Feb 2025 20:08:18 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmeiA-0000000F2KB-18sR;
	Mon, 24 Feb 2025 20:05:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8v+VH5qHJ9s8s5Z5uS138U4uFYC8T8PcRHjdrcA0cR4=; b=hiJM3wShZ1F6hQpNG6O5e6tdzx
	liLjE0PO4fhNah/NHBzsmkK7ZvMVvyR41x86x6eyBT9i11DssvhJd+4tln34zkg4VW1lR2zHeufsA
	pW8KXOqR+Nupxk+pxToKpdFFIXJZhweIaOIJeiQVPn8rblXCaY3DQXskY5QkIqJMCAkY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tmei4-00HHMQ-Hw; Mon, 24 Feb 2025 21:05:48 +0100
Date: Mon, 24 Feb 2025 21:05:48 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <drew@pdp7.com>, Eric Dumazet <edumazet@google.com>,
	Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 1/2] net: stmmac: thead: use rgmii_clock() for
 RGMII clock rate
Message-ID: <09e0ee41-f061-4e24-a58d-477758812f74@lunn.ch>
References: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
 <E1tlTo8-004W3a-CO@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1tlTo8-004W3a-CO@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_120554_307004_7FE48599 
X-CRM114-Status: UNSURE (   6.81  )
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

On Fri, Feb 21, 2025 at 02:15:12PM +0000, Russell King (Oracle) wrote:
> Switch to using rgmii_clock() to get the RGMII TXC rate, and calculate
> the divisor from the parent clock rate and the rate indicated by
> rgmii_clock().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
