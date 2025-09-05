Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112BBCA0FED
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Sep 2025 00:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IlZoAlxTF1OrtYD7LAUKUYYUXBHjfY2LK1JDxdqQMJo=; b=Qrhb1TPbbJnKQF
	Ynfr3SJd4KS5Rtl3wbxROwNjyzMEjq8GWFfIltcq/Rbls1F6Iga7Ze+SrW7tJAZPTNy6qnVTmVr2+
	8wiMJ3OpOglfHy89whnQW6GLOCcp1YwpxtpZ1P/NcXCZRlQFMclsnvpDZap5/2UWQ+3SeBH3nlhmT
	toA3D+fwfAwT1gmDTFXayExe4aQR+0dhYiohjUmTnHjVXh/vQxMbQaU2CUXDG75PQ22tFBg4/6eX3
	lXsmdKYRRUv7xdvb9x//MezRGOT0bu++STF0JUDoZD7wJUsNIQ/potuAuso30Qi4V1+Mi//W7od14
	9saUCqBUA2658d1EDgpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugZs-00000005ZDd-1cNc;
	Sat, 06 Sep 2025 00:14:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugKl-00000005Ocl-0GTa
	for linux-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 23:59:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 754F4601AE;
	Fri,  5 Sep 2025 23:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB80BC4CEF1;
	Fri,  5 Sep 2025 23:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757116750;
	bh=YvJhCsK13+5y12Tg8BXHiyPd4M1kZnLPFozMdNrGnmQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CPl+478JhsxSlnKwEhJHHCRoBp5cR76ubXmiKStL5qIRsk1zGB6DxJ2jIo1A4czaK
	 8X1090aw5/cPM0JXfhbWckAAziREaugxifYX2pRm5vWlKnLMmOW1hzC1l+qkQzLma+
	 d1C+rJ0QncTjuWjoSf6NvbYzIXlAXHbhMgOfMJ7MNzK3CA3eOWuW+s2Qnk4rYBths0
	 WNfBL47hnjihjV54KDAoviJ1Lg2a/TH1/S65gkDbU4Adn+Bg0YDnNApaFRXKeA1mve
	 TnkUZLYD+lOSAixkdgpCGk688UMOjk6jlEiLUjUUzm+3luKjjKaEGIQcwYM+zpKbc5
	 txiIHjJziZj/A==
Date: Fri, 5 Sep 2025 16:59:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Vadim
 Fedorenko <vadim.fedorenko@linux.dev>, Junhui Liu
 <junhui.liu@pigmoral.tech>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Troy Mitchell
 <troy.mitchell@linux.spacemit.com>, Vivian Wang <uwu@dram.page>
Subject: Re: [PATCH net-next v9 2/5] net: spacemit: Add K1 Ethernet MAC
Message-ID: <20250905165908.69548ce0@kernel.org>
In-Reply-To: <45053235-3b01-42d8-98aa-042681104d11@iscas.ac.cn>
References: <20250905-net-k1-emac-v9-0-f1649b98a19c@iscas.ac.cn>
	<20250905-net-k1-emac-v9-2-f1649b98a19c@iscas.ac.cn>
	<20250905153500.GH553991@horms.kernel.org>
	<0605f176-5cdb-4f5b-9a6b-afa139c96732@iscas.ac.cn>
	<20250905160158.GI553991@horms.kernel.org>
	<45053235-3b01-42d8-98aa-042681104d11@iscas.ac.cn>
MIME-Version: 1.0
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

On Sat, 6 Sep 2025 00:35:37 +0800 Vivian Wang wrote:
> >> On a closer look, these counters in ndev->stats seems to be redundant
> >> with the hardware-tracked statistics, so maybe I should just not bother
> >> with updating ndev->stats. Does that make sense?  
> > For rx/tx packets/bytes I think that makes sense.
> > But what about rx/tx drops?  
> 
> Right... but tstats doesn't have *_dropped. It seems that tx_dropped and
> rx_dropped are considered "slow path" for real devices. It makes sense
> to me that those should be very rare.

Pretty sure Simon meant the per-cpu netdev stats in general.
There are three types of them, if you need drops I think you
probably want dstats. Take a look.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
