Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38694CAC5A5
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 19:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F6cTosj4aA39MZa09S7i+mNsQOy2+tPlt6mwia8tZp8=; b=b20zfNb6xOQZnG
	eSHTlCtLlG2AHooYJaXp4mqSX9X0FGn1zk01nH/5te1MAA3gzzG05ojzVkH0gxYKQz2O8yKOOlkGb
	BSmZIL6GRZXaSIdeWaoxGCuroaYsF4isoTe3eU3vfYIoCCfAY7tU1bI5sSEhiIpkZy94VGbmw2jDr
	FoWsuZqnCqPwtU9EzgRvvAzNcoC5gfzjkiso8ymZt0lhXw631XjD5/JCcgSD6AtuIRgP3f8LcHFU2
	zoKPQY1JF84N3EJcpigOYfOXw1kQxPsQGFSC0HZhNR/SGrBzOQ8ILWEKHOASKfAo7ZC8iLINZ7vt3
	hx0VOiJw9uUq9XvPeVOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Utj-00000002vok-0Y8z;
	Wed, 24 Sep 2025 19:11:27 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Utg-00000002vmf-0klf
	for linux-riscv@lists.infradead.org;
	Wed, 24 Sep 2025 19:11:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=WLY2FkqvHLDcDGSoIam/kBKhM4hGZeSUFJS4ZsAMQ7k=; b=V/yZt/KZ/VRNT5TrMKm1LX2OCY
	wWNk2pW3rK9KN5iVgszaBEMaaHM7qheK/IpA82nLSWxtF0z/sbVkq99URVZfSCOnGdRzIAhK3HTQO
	7E9pqU8uQyeT0GiydKwuXbqTT+QhVegsU6nEszEFiF5QZSf5JUkkjwT+fO6TrvloebxsCAg2ofc8W
	hq/rNpgIYs7VC5mCSEd2c2diBXA7opqGKceanW2e0qh5MGuLSh/xJmJz5lfLOy1ugoO//W3OVutmn
	KVxBBWd3YW8CIIGTZol/Bod2z/DayJWbyxUXze98vXg+N9Kh5Z+KM9Sl3cGbOIGD4uhva/QP+BkWD
	uuLwqR2Q==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v1UtQ-00DdFY-0o;
	Wed, 24 Sep 2025 21:11:08 +0200
Date: Wed, 24 Sep 2025 21:11:07 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 1/3] riscv: dts: spacemit: enable the i2c2 adapter on
 BPI-F3
Message-ID: <aNRCS1C-M-0JY2cV@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20250921210237.943370-1-aurelien@aurel32.net>
 <20250921210237.943370-2-aurelien@aurel32.net>
 <DC360EB139FD9DE5+aNH4l-7SP5KNu-Br@LT-Guozexi>
 <aNLyIvS-UFfplmpu@aurel32.net>
 <B8749086963B3B54+aNNh9hw4TX6tVMdP@troy-wujie14pro-arch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <B8749086963B3B54+aNNh9hw4TX6tVMdP@troy-wujie14pro-arch>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_121124_660903_64275098 
X-CRM114-Status: GOOD (  20.23  )
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

On 2025-09-24 11:13, Troy Mitchell wrote:
> On Tue, Sep 23, 2025 at 09:16:50PM +0200, Aurelien Jarno wrote:
> > Hi Troy,
> > 
> > Thanks for the review.
> > 
> > On 2025-09-23 09:32, Troy Mitchell wrote:
> > > On Sun, Sep 21, 2025 at 11:01:41PM +0200, Aurelien Jarno wrote:
> > > > Define properties for the I2C adapter, and enable it on the BPI-F3. It
> > > > will be used by the 24c02 eeprom.
> > > > 
> > > > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > > > ---
> > > > --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > > > +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > > > @@ -92,6 +92,13 @@ gmac1-pins {
> > > >  		};
> > > >  	};
> > > >  
> > > > +	i2c2_0_cfg: i2c2-0-cfg {
> > > Should this be i2c2_4_cfg here?
> > > From what I see, in the initial version the second cell was meant
> > > to be the function number rather than the serial index.
> > 
> > Ok, I wasn't aware of that convention, I just reused the same numbering 
> > of the downstream 6.6 kernel. I'll fix that and use i2c2_4_cfg.
> I'm wrong..
> The second number isn't function number.
> You can find a more detailed discussion here:
> (riscv: dts: spacemit: define a SPI controller node)

Ok, I'll revert the change in the V3

Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
