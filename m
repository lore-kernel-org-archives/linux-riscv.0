Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0FFD0BB46
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 23:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QbBVdrYimOM1PRfleuvDoot27803tmOg1jN6m63byWs=; b=Dq7/Reidb7Qjz0
	2PJdAl77UVjqY61/8cqj4KZtVbiAUNe2f0Tf/jSIFHT3C1WqSC6sWQskOwDVmw412deNpFSk+Hkbo
	CpxpdyEludse+9/YxX82EuzeQHwu6VzKGQ77Nc5NU/svPu/jbrsjpKRez3UabTSgvJOFUvINhHXlM
	Yi6fsaYt69c7fahXFtKF2W0g/DEkMSRXIwdZqHo4bjrGe3fuPW68GQOjjLaneiQBa1JOCYaxAgR7Q
	+ahFvIRCJfoV5UaChv5STdPLYD6T/Qq1Slq9SWOP6z2Gb8tz0aWiRktijsboY6RpRejzAiqj/sIOQ
	nDkGvV3HDSR3m3aIVRWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3lFK-0000000GHUk-3dtO;
	Wed, 23 Oct 2024 23:58:34 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3lDn-0000000GHFS-15h5;
	Wed, 23 Oct 2024 23:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RoRcRsT4dhnXehgIrOkavzDeXndrmIy2Jhqon6Rlw04=; b=xXaPPxsWzvAbAQuddJCjS9yg5d
	2/VF7BtvdVpWAbUQBX7qUUcBsszBfqG67ZBz0MoKXGrjtUWuGGs6saIWYGdTn8TV4PvEJkmh0Y136
	u6FUSMwVJaXCsPav2KWXtqSUkpKEBVRtn/vlgfd4QeXco3meEX/lWhBFZXMyMqHmxtOI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t3lDL-00B1qp-9U; Thu, 24 Oct 2024 01:56:31 +0200
Date: Thu, 24 Oct 2024 01:56:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
Message-ID: <6f0e1c34-d5d3-4ee5-9374-768e67a0c067@lunn.ch>
References: <227daa87-1924-4b0b-80db-77507fc20f19@lunn.ch>
 <gwtiuotmwj2x3d5rhfrploj7o763yjye4jj7vniomv77s7crqx@5jwrpwrlwn4s>
 <65720a16-d165-4379-a01f-54340fb907df@lunn.ch>
 <424erlm55tuorjvs2xgmanzpximvey22ufhzf3fli7trpimxih@st4yz53hpzzr>
 <66f35d1b-fd26-429b-bbf9-d03ed0c1edaf@lunn.ch>
 <zum7n3656qonk4sdfu76owfs4jk2mkjrzayd57uuoqeb6iiris@635pw3mqymqd>
 <d691a687-c0e2-48a9-bf76-d0a086aa7870@lunn.ch>
 <amg64lxjjetkzo5bpi7icmsfgmt5e7jmu2z2h3duqy2jcloj7s@nma2hjk4so5b>
 <79f9b971-8b3f-4f31-ab42-42a31d505607@lunn.ch>
 <uzlmckuziavq5qeybvfm7htycprzogvkfdqj2pxrjmdkuovfut@5euc5nou7aly>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <uzlmckuziavq5qeybvfm7htycprzogvkfdqj2pxrjmdkuovfut@5euc5nou7aly>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_165659_316519_12BFFBEA 
X-CRM114-Status: GOOD (  19.48  )
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

On Thu, Oct 24, 2024 at 06:36:06AM +0800, Inochi Amaoto wrote:
> On Wed, Oct 23, 2024 at 02:42:16PM +0200, Andrew Lunn wrote:
> > > Yes, this is what I have done at the beginning. At first I only
> > > set up the phy setting and not set the config in the syscon. 
> > > But I got a weird thing: the phy lookback test is timeout. 
> > > Although the datasheet told it just adds a internal delay for 
> > > the phy, I suspect sophgo does something more to set this delay.
> > 
> > You need to understand what is going on here. Just because it works
> > does not mean it is correct.
> > 
> 
> It seems like there is a missing info in the SG2044 doc: setting the
> syscon internal delay bit is not enabling the internal mac delay, but
> disable it. Now everything seems like normal: the mac adds no delay,
> and the phy adds its delay. 

That makes a lot more sense.

Thanks for digging into the details.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
