Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2FDC2A062
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jan 2026 22:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6oO4mG8sHRps5M3XDAm3/17kQnDJMyGwOxSYoKg7ds=; b=fRJ5c/q7xnlkoX
	6MQZ/PFffhO2vNlOlKRcy3yzbiQQ8X0dtvpuJvtKEKlpgULBw0HMojyFcveo1xPf/n7WaP84UbKwS
	ICgdc1KqNWR+A7TS9iwLgKUm1NIULXVLwKSmiC0FVYzMDaFXtu4YZj065V6n5/gAJqUalnt66d9gi
	+8bzV1qS+C/+wyzeSOBVzjspiweBmAIZ5Cm+FucaESckgbzYqB+oRDi6/cFFqQ+PHL+5f9f68JIGY
	bCpiV3CA/Tp5HeOXnaryJTwywIl3FypRHjPOAxv1x7D7gSr8cSIUSSuA4bIGsgaS0wIGJZGcokw4l
	IOA+pb7E+4oAL186UOVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcWAJ-0000000AV1i-1g77;
	Sun, 04 Jan 2026 22:01:35 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcWAH-0000000AV1N-1Fnk
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jan 2026 22:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=aeuB7RE4nWCYjEZEiNhs/O/FKrA2fhaoXeDG211Y5xE=; b=wYABjYYf58NcIGmxuQeCgHjmRh
	RjpXxbZF9ZQNYKAzU9bDpHGhOm+zVdjrjM1MujzXcaicgBkzhgeX6vdfrvXBn5rOodfEJBf4J5Y2k
	Ahb+ZhJx0PCwJ2C19pEBlipNqrNKNFGT9tOJCS/lvPYwANxpcVseaffYNlI4gAJ9Nd34=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vcW9u-001PFO-Dc; Sun, 04 Jan 2026 23:01:10 +0100
Date: Sun, 4 Jan 2026 23:01:10 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yixun Lan <dlan@gentoo.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3] net: spacemit: Remove broken flow control
 support
Message-ID: <d9d2781e-dffe-465e-a684-49d5e4c42d93@lunn.ch>
References: <20260104-k1-ethernet-actually-remove-fc-v3-1-3871b055064c@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260104-k1-ethernet-actually-remove-fc-v3-1-3871b055064c@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_140133_369721_710DEBC3 
X-CRM114-Status: UNSURE (   7.92  )
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

On Sun, Jan 04, 2026 at 02:00:04PM +0800, Vivian Wang wrote:
> The current flow control implementation doesn't handle autonegotiation
> and ethtool operations properly. Remove it for now so we don't claim
> support for something that doesn't really work. A better implementation
> will be sent in future patches.
> 
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
