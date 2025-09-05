Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2510CAC580
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 19:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MmkLyhBcT324BUYw453EOAqNrXuQs4EbDO1d+67BkvU=; b=cbmtwmMephAhfD
	iTAM/J1vSn4DDARJsQnWdtnJ7WKu5UT0bvrGBgV59v/Uh05inN2v0m4fUIj1FCAWwzBVXDMfjDPiX
	BkjaiwcXe8lBo15DGR4zuUY6f+DAsoUks7VNSTRZ/cC7GBaC/C3Zs0mVM1FWy7FND87dIA8LDvQBH
	weBcsasQWgrAbxswmtov+e2HS+Qr1pqBtOyGe8ORcqjnNoVlyOwstYe7tU5HDSJg5l94rv+tsIc+w
	YECfQ86bXHaiFJ7X+/m+jCJx6o5b7/OASSqryv2m8ivTi5GqNJ/uT8Ck2j66sxbSh8EX9ginr/Iph
	VYk/qdP8FTgf/htzUHNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuc8J-00000004A19-2rxW;
	Fri, 05 Sep 2025 19:30:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYt4-00000002xsg-1hon
	for linux-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 16:02:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CA1544B83;
	Fri,  5 Sep 2025 16:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13389C4CEF1;
	Fri,  5 Sep 2025 16:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757088126;
	bh=XtZf11jbbBoilXsBT63MRb4g16CbjYXTUzh33VUyndQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qf19mXo8p1IPKQFY0/UahTIRblVXtBICsSc3ebDDzITfYScFms3XLSzR4XT/AfBD1
	 OySqhbWgBYAoQIPBm7WPAl1n8ItJ4IVZ7w32lKiBEOSAKlYAoJci+pSJYpRmfsSi+S
	 2A3XDv2mWJhfeWexq7r+XRNFXiseFSMS/0Xjn9E1F1GwunHAuVWuE1YEbPUGOaSOgV
	 BS4HYB46R7qujD8hm3bOvz3ki4e8bD4ZNWtYmnU6ro2b4OO6OBOCHVLvphT4el6TtF
	 MnX+9ukJdOrtuZtElMAFMhCDHRVV/2HCvjYFYPuDpwfXB7OBg+cvAziKtB1RO6aPZc
	 wMTMMngXUOpIw==
Date: Fri, 5 Sep 2025 17:01:58 +0100
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
Message-ID: <20250905160158.GI553991@horms.kernel.org>
References: <20250905-net-k1-emac-v9-0-f1649b98a19c@iscas.ac.cn>
 <20250905-net-k1-emac-v9-2-f1649b98a19c@iscas.ac.cn>
 <20250905153500.GH553991@horms.kernel.org>
 <0605f176-5cdb-4f5b-9a6b-afa139c96732@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0605f176-5cdb-4f5b-9a6b-afa139c96732@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_090206_463148_162E8F03 
X-CRM114-Status: GOOD (  14.12  )
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

On Fri, Sep 05, 2025 at 11:45:29PM +0800, Vivian Wang wrote:

...

Hi Vivian,

> >> +		status = emac_rx_frame_status(priv, rx_desc);
> >> +		if (unlikely(status == RX_FRAME_DISCARD)) {
> >> +			ndev->stats.rx_dropped++;
> > As per the comment in struct net-device,
> > ndev->stats should not be used in modern drivers.
> >
> > Probably you want to implement NETDEV_PCPU_STAT_TSTATS.
> >
> > Sorry for not mentioning this in an earlier review of
> > stats in this driver.
> >
> On a closer look, these counters in ndev->stats seems to be redundant
> with the hardware-tracked statistics, so maybe I should just not bother
> with updating ndev->stats. Does that make sense?

For rx/tx packets/bytes I think that makes sense.
But what about rx/tx drops?

...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
