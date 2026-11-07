Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263F9606A33F
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 17:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QuEQ4agT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=sjvthzk3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SZiEFYZv88ix8RcP8VRpZavdQLzXeEXnrRlS/0mVeqk=; b=QuEQ4agTWTMJ3+j+Nmuheu8ezN
	dwA8JuKOfYdnb3RjhYpaO/23zSMB3q1Q1Gc0afCee7ItDM8DwX7yqHSBJ17OP0VSCXDnNQGV7v39V
	IIbR5V8HTK9WZeLTLRjt3TMGbxl4oHJGb8cQWNNo19v7dPcWmZJEqh8mEO+9pN3RA5dHY4fBqIPSO
	lu2KfgoEQeG/JPID+nuN6+Ch+hhlWvtSREFSxstAqK6wsg2SOYRwUdmBwykNC5S1WxotFQsCU/tkc
	iWkQR9mOoMMW8NlkHg+uA58x+QuX3kmlT2/ybpl6CfC/R7silSW/OvBVyRIrnMpcPdnyfpZF7ga4P
	LK9eZADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPkHR-0000000F6CW-3xFq;
	Sat, 07 Nov 2026 17:32:41 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPkHN-0000000F6CA-0EDj
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 17:32:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KzndXIafRq+J+vl6EzkbdZuWJbf/1tRHEtBvKVbMKMo=; b=sjvthzk3+L4LMRbXpwAo3mKNSI
	L4xDJB8dPTR7dPR85p1EuqZ531SO5llhau/gR4p9dZkAMMvOcfZIMrRnvO90605L7Jp+vGK9tJCuV
	Lkt/PDZxaI6dtdohCeeV+d+5KoPy9r230VvSyV14gDrjbkPKxT/FEdYh3LZR+D37vU80=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xPkGr-00EzBL-J7; Sat, 07 Nov 2026 18:32:05 +0100
Date: Sat, 7 Nov 2026 18:32:05 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ali Tariq <alitariq45892@gmail.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yixun Lan <dlan@kernel.org>, Vivian Wang <wangruikang@iscas.ac.cn>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Tomas Hlavacek <tmshlvck@gmail.com>,
	Muhammad Bilal <meatuni001@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: spacemit: Hold RTNL lock in emac_resume() and
 emac_suspend()
Message-ID: <12a95b3a-9c8b-4a2d-9b81-12b3839e64a9@lunn.ch>
References: <20261105123441.2524171-1-alitariq45892@gmail.com>
 <DMO13SWAGZAN.NYISGLGI7Y5A@linux.spacemit.com>
 <c55c5878-d9c1-4863-bc55-99d334ba2ede@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c55c5878-d9c1-4863-bc55-99d334ba2ede@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_093237_093833_07242098 
X-CRM114-Status: GOOD (  13.32  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 03:44:50PM +0500, Ali Tariq wrote:
> 
> 
> On 11/6/26 2:43 PM, Troy Mitchell wrote:
> > On Thu,  5 Nov 2026 17:34:37 +0500, Ali Tariq wrote:
> > > @@ -2056,7 +2059,9 @@ static int emac_suspend(struct device *dev)
> > >   		return 0;
> > >   	}
> > > +	rtnl_lock();
> > >   	emac_stop(ndev);
> > > +	rtnl_unlock();
> > >   	clk_disable_unprepare(priv->bus_clk);
> > >   	netif_device_detach(ndev);
> > This can deadlock. emac_stop() -> emac_down() calls
> > cancel_work_sync(&priv->tx_timeout_task) with RTNL now held, while
> > emac_tx_timeout_task() starts with rtnl_lock().
> > 
> 
> Thanks Troy, that makes sense.
> 
> For the deadlock, I think the correct function to call is rtnl_trylock()
> inside the emac_tx_timeout_task(), which would return if the lock is already
> held and will hold the lock if it is not.

rtnl_trylock() is generally a workaround needed for badly written
code. Please try to avoid it.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
