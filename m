Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0206FC7114A
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Jun 2025 22:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CS8jrvaI2fr07Fe8LibAMbOpt/h7aChfCIN/EWe4CfY=; b=b62xVAmpQRQUPm
	LSI5zU1mDmMRbrGYKHYVDfJ0riVoEAjwMIfrG276E6Ok8VM/fwH2UAIGwGU/mt7EUE/Zwtq4ULXxm
	FELducsLyJmNxR0aPIBnfZ/OTI1vZNA3lMW5slWdjFgL7zsn/+uyf3su02EtJkoV9Z1U51WSl9Wgo
	zKfCuZrQo48N4NgbRflG0a8HpWNXtugHzPdQ6ZOJGOLGnlSbMo8yEe5lnoL1H+YYuyx1lSwm/noJM
	VCpr9BwOtjC+GIIXJpXsXYrEPa2szZpmu06E/GFosSlCUTLkoyz3GQI0kUwf4xNbR9HcZXSoaxpiV
	PsY0+FMsCs/MAra/KXQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQZFW-00000001uhh-11BB;
	Sat, 14 Jun 2025 22:21:18 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQZFU-00000001uhN-1289
	for linux-riscv@lists.infradead.org;
	Sat, 14 Jun 2025 22:21:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vjbY7obwbAAFrPPEOEXlpDoKiqUTIDuOT/hoHoOFZao=; b=edHA5A93apXIr1C1lNSV6aVS2m
	pvs5DrAB4pFFXpeeeMvlNz24T/Z9YhKflRPw0a2UbXGpbrVYM4t16Peofu6UzR3PKFFY8Q3fDy9Sa
	JyejDutSXy7rqs9F8RshTJiWrBONMBxEPK5BrhEjZpytPx8cOoCIbU3ZyznKefF+w4+E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uQZEq-00FsZu-IO; Sun, 15 Jun 2025 00:20:36 +0200
Date: Sun, 15 Jun 2025 00:20:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next RFC 0/3] riscv: dts: sophgo: Add ethernet
 support for cv18xx
Message-ID: <05194937-8db3-4d90-9d03-9836c734fce1@lunn.ch>
References: <20250611080709.1182183-1-inochiama@gmail.com>
 <7a4ceb2e0b75848c9400dc5a56007e6c46306cdc.camel@gmail.com>
 <e84c95fa52ead5d6099950400aac9fd38ee1574e.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e84c95fa52ead5d6099950400aac9fd38ee1574e.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_152116_287378_94C403B3 
X-CRM114-Status: UNSURE (   4.74  )
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

> Also ethtool seems to be incompatible with mdio muxes :(

Please could you expand on that, because i don't know of a problem
with mdio muxes and ethtool.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
