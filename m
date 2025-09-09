Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8453CCAC583
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 17:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SLK7Rj3vGHi6CYliVu4mjYGu7O791G3Zcxc0w1EHBvU=; b=mS8lapBrjLZdO8
	taFbui/PzFYtq49WvdZbeLM7iNc/2GMvVvAGA9Kc3MO0W9EckYa8OAmYTKwResEXlQpeEjlJMrMJG
	DXC2Kp4MT7h0WmDnmbQxjmFrLAhQKRTXj3gzwaxd/J+tQdZmvBeC1gICGpcj32U8JplM80YRRW4dI
	5vSr7JpHch09wwe2EyGFAGveokf0Mi3urwU/yeCZvypKGGDBqGhbY8Lo3y/6USIXT6h0crg5JJgd5
	Ex1Po7pU/bUAz3mlppqgQKlODCISGy/Z0ARgfl80V65CTLvUEccoQ832XaJ0pcEmcsMxsrMRU88LZ
	11KhNu25BiuLazYE9qrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw26K-000000094WW-3wXj;
	Tue, 09 Sep 2025 17:25:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw10f-00000008Sqy-0S8K
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 16:15:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FA7640A58;
	Tue,  9 Sep 2025 16:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C884FC4CEF4;
	Tue,  9 Sep 2025 16:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757434556;
	bh=3JFS7qi/WCdnUSTSsAZiAZWQwu8b4HEGLmE7L2yCBWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TNBQ2ujQO7daaI51CSxSqryEWfCnP8QIQ6ZJ8Q6nOBNjh3MfsR1I4Ho8NbNrwtL7h
	 B5rCaUjqyrDzGVjo1+r5SfzSpXg2LDLp6GLicEPf2LdN23akLMMdL6cJT15RCCdb6P
	 5GjNUeMEeActlZVS6zzpj21MNi4H1rWYfHaC8E2QdYNbS8c/uDDlV/lPJ6uzQi6o2Z
	 zg0TzKH+u5IAUQYxbmkel2UOdoWn6etcS33xqX0L3OLtwTkZXeb9uXxq9wTXJSiyoz
	 wOrdovN+CGvAfAwIKWy13kkjzOqCeWQjJnOvoTxEanxov+XptqWrmctmatAxrZWQOt
	 qaS7DM9b+e22g==
Date: Tue, 9 Sep 2025 17:15:49 +0100
From: Simon Horman <horms@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Vivian Wang <uwu@dram.page>
Subject: Re: [PATCH net-next v9 2/5] net: spacemit: Add K1 Ethernet MAC
Message-ID: <20250909161549.GC20205@horms.kernel.org>
References: <20250905-net-k1-emac-v9-0-f1649b98a19c@iscas.ac.cn>
 <20250905-net-k1-emac-v9-2-f1649b98a19c@iscas.ac.cn>
 <20250905153500.GH553991@horms.kernel.org>
 <0605f176-5cdb-4f5b-9a6b-afa139c96732@iscas.ac.cn>
 <20250905160158.GI553991@horms.kernel.org>
 <45053235-3b01-42d8-98aa-042681104d11@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45053235-3b01-42d8-98aa-042681104d11@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_091557_164099_208D397E 
X-CRM114-Status: GOOD (  20.95  )
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

On Sat, Sep 06, 2025 at 12:35:37AM +0800, Vivian Wang wrote:
> On 9/6/25 00:01, Simon Horman wrote:
> 
> > On Fri, Sep 05, 2025 at 11:45:29PM +0800, Vivian Wang wrote:
> >
> > ...
> >
> > Hi Vivian,
> >
> >>>> +		status = emac_rx_frame_status(priv, rx_desc);
> >>>> +		if (unlikely(status == RX_FRAME_DISCARD)) {
> >>>> +			ndev->stats.rx_dropped++;
> >>> As per the comment in struct net-device,
> >>> ndev->stats should not be used in modern drivers.
> >>>
> >>> Probably you want to implement NETDEV_PCPU_STAT_TSTATS.
> >>>
> >>> Sorry for not mentioning this in an earlier review of
> >>> stats in this driver.
> >>>
> >> On a closer look, these counters in ndev->stats seems to be redundant
> >> with the hardware-tracked statistics, so maybe I should just not bother
> >> with updating ndev->stats. Does that make sense?
> > For rx/tx packets/bytes I think that makes sense.
> > But what about rx/tx drops?
> 
> Right... but tstats doesn't have *_dropped. It seems that tx_dropped and
> rx_dropped are considered "slow path" for real devices. It makes sense
> to me that those should be very rare.
> 
> So it seems that what I should do is to just track tx_dropped and
> rx_dropped myself in a member in emac_priv and report in the
> ndo_get_stats64 callback, and use the hardware stuff for the rest, as
> implemented now.

Thanks, that makes sense to me.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
