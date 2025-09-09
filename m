Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1C7CAC582
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 17:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hQ8WPFnkocsnWkTC9fXRwvmeibEtx5aXaJVlG+r9DvU=; b=p7J6kTQQZ8qf4J
	jSGAEV+2KGp4TMzyHHBInx+G7wm87DXb5Y5vYKTTchAAiaAHCnROQXxJ27k7yILod8e+RFJdkNYcu
	sjMWjHYfExyL/xYcfDjgF/6mcXQr8w0UxJvNEIEveZB+IKO39EM/HzUF7Gdkd/EqrRL2PFmBt3UWv
	YnoAbO/3E8iAlGnk1McQ43Blep5IggJPIJ/y7fCqZMVxOUE9iXj0vowd20iwjE8QFh3vXrhDkQoXZ
	fj+Zke7QvrcyzxAgtRoREhpADRhssmdFl8Ci06mB8U3r8TIYJmetJPM4+aq98b+EXz+EeVnisnv9G
	NQKhLsOWLjyFmAZlTcMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw26L-000000094XZ-1MtK;
	Tue, 09 Sep 2025 17:25:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw13B-00000008Te3-1ryq
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 16:18:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B43C44BF0;
	Tue,  9 Sep 2025 16:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F587C4CEF4;
	Tue,  9 Sep 2025 16:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757434712;
	bh=zjM0ZFGXF7CG6poTLXyEy9jmsj2idsqfoWbfmtN5A3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6xkxEpNBw1feIQDl8RsDKxxWge5IUdPMauh/ToF78Bce2M3GcCE5+/nNRgWF413s
	 mif1rMBOMk9PJXb58miP2BiKseccrCu7/xCv327yCT1Yb2GQROqaNJKmR2s7IwI2Or
	 uQWctEPywqiMcJIJQc9H5qjZBUqD+VBtMenWpmoe6tO/7qtWwpt58TJK3S9zvf6Q4E
	 IAf8w8pbXhR6QMEf+BzLoXRYO5TCndRRxlTml20MtSLkNfzmmesKN7PrRH6q8exv7R
	 8ngtUh5qT3Q5B13Nr6/77K5RLeIEgo8Dq1KFXJrLid3Ogzu5INwWYvqOoVCcJBb74J
	 hubKpObcQGCAQ==
Date: Tue, 9 Sep 2025 17:18:26 +0100
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
Message-ID: <20250909161826.GA23218@horms.kernel.org>
References: <20250905-net-k1-emac-v9-0-f1649b98a19c@iscas.ac.cn>
 <20250905-net-k1-emac-v9-2-f1649b98a19c@iscas.ac.cn>
 <20250905153500.GH553991@horms.kernel.org>
 <0605f176-5cdb-4f5b-9a6b-afa139c96732@iscas.ac.cn>
 <20250905160158.GI553991@horms.kernel.org>
 <45053235-3b01-42d8-98aa-042681104d11@iscas.ac.cn>
 <20250909161549.GC20205@horms.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250909161549.GC20205@horms.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_091833_525471_0E19AFBA 
X-CRM114-Status: GOOD (  25.23  )
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

On Tue, Sep 09, 2025 at 05:15:56PM +0100, Simon Horman wrote:
> On Sat, Sep 06, 2025 at 12:35:37AM +0800, Vivian Wang wrote:
> > On 9/6/25 00:01, Simon Horman wrote:
> > 
> > > On Fri, Sep 05, 2025 at 11:45:29PM +0800, Vivian Wang wrote:
> > >
> > > ...
> > >
> > > Hi Vivian,
> > >
> > >>>> +		status = emac_rx_frame_status(priv, rx_desc);
> > >>>> +		if (unlikely(status == RX_FRAME_DISCARD)) {
> > >>>> +			ndev->stats.rx_dropped++;
> > >>> As per the comment in struct net-device,
> > >>> ndev->stats should not be used in modern drivers.
> > >>>
> > >>> Probably you want to implement NETDEV_PCPU_STAT_TSTATS.
> > >>>
> > >>> Sorry for not mentioning this in an earlier review of
> > >>> stats in this driver.
> > >>>
> > >> On a closer look, these counters in ndev->stats seems to be redundant
> > >> with the hardware-tracked statistics, so maybe I should just not bother
> > >> with updating ndev->stats. Does that make sense?
> > > For rx/tx packets/bytes I think that makes sense.
> > > But what about rx/tx drops?
> > 
> > Right... but tstats doesn't have *_dropped. It seems that tx_dropped and
> > rx_dropped are considered "slow path" for real devices. It makes sense
> > to me that those should be very rare.
> > 
> > So it seems that what I should do is to just track tx_dropped and
> > rx_dropped myself in a member in emac_priv and report in the
> > ndo_get_stats64 callback, and use the hardware stuff for the rest, as
> > implemented now.
> 
> Thanks, that makes sense to me.

Oops, for the 2nd time today I see I've responded where other's have
already done so. In this case, please take Jakub's advice elsewhere
in this thread.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
