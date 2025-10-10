Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F4CCCD183
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 00:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8u+o6Ypx095r37zJaH0nCvppIso42efUx7SMsQtGS2s=; b=qpt5zr/+VzI/vu
	ZsFCCZjqIM8WWXRhUK2czn4wIo55LlenKawQG4ENg1Q96RAUWqsUT8GWwfC3Jw+QGRNsfx+aqm9+0
	FUVkY44/TdxhVwsxNSzA5xDXvuzlTPj2SAhdjzZ7jXqvzftyAoIcJS9t63zP9jpwr8TG2o/YN3xHH
	cxKifxpHeEbFdP7HjerAoeEn3zURZkAxXcFKg3vHTVnvZMVR9/OZZ0QoEw3I/Uk4zhbgWKXHiEEB7
	sOw/aK9oWVHTu0XOhCnxlRhwcC5d3njlJPdyNoP6K23+lyrsegooz5obk6tLUxOesnR3VJmPoKVXt
	ziKTS+Bcsk0tlZDQdcKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v71S4-00000007OxI-3U7Y;
	Fri, 10 Oct 2025 00:57:44 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v71S0-00000007Owp-3Wu2
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 00:57:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760057791;
	bh=CyvlSdXG8TtNo3ETOGHHmQ0/SGXil5W+cwusE27OmWM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=pQ9NDHKUZnwxkBjpg7m6qhWpH2b8qWx47NdNECdJoCY7iYQA4MFQd9XsyO8YvKvfw
	 2tXkOMe2pGNe953CJzS3T4ahqaf257YSAcEcs2mfBvCXJ9AZ914HIVftxccussFINs
	 rLtpUDMvtLiYRZG021BIdvgNvQHxFPQ+E4bZoPIM=
X-QQ-mid: zesmtpip2t1760057789t9ba13e2a
X-QQ-Originating-IP: upay9BIZzUs6ukPD/DewrCcUCwZLERSWByypQTR/LpY=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 10 Oct 2025 08:56:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16317150121370824884
EX-QQ-RecipientCnt: 16
Date: Fri, 10 Oct 2025 08:56:24 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Conor Dooley <conor@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Troy Mitchell <troy.mitchell@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: riscv: spacemit: Add MusePi Pro board
Message-ID: <4A760DE7DC8BE2EE+aOhZuGN-RPGwnEfJ@kernel.org>
References: <20250928-k1-musepi-pro-dts-v1-0-64d0659dfdbc@linux.spacemit.com>
 <20250928-k1-musepi-pro-dts-v1-1-5efcca0ce3ae@linux.spacemit.com>
 <20250928074914-GYA1344940@gentoo.org>
 <20250929-challenge-molecular-947bb1f5962b@spud>
 <A5845378AE731404+aOdtKmFPaYfc2n7n@kernel.org>
 <20251009-crazy-outhouse-fe3e47d0dbe7@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251009-crazy-outhouse-fe3e47d0dbe7@spud>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MqswyhUqVe0CT5Bnycc7D71Hhc8vt4Ts8LRvN2ZAcwvaC9ieC/x57RiM
	wKVS/97nD4GKtx+Pgwyvg8lmImS2q7gaVAfk30s/bWXlXTkA0YRmLHbg/kGKRsEA+qc1L13
	3G2NKA4Rmd2s2IFuHGyYkdl1sStwIwpA57f7dgcEJkoU5VzaFbxoGhdSBAZ/WSORx3n8k51
	YJVxfo5WcH/kI8R0o1+I9pCmsuwWjviPWdnEONhcsTWnaopfJdwZOjHqR8Ly1pzNFXul6O/
	GMFMuq71rVOxHBGjGKAT5Cjom2Mlwk91qJEWJjgnCNslJ3BuO/GnE4g2+3tyW88TDEdUkK9
	CxejW+mJBa2PNQxLkzkVpH4Ff1kjfcIautdLb4Hn+QE6haJ3meUcz1IYjcU46Rn3rr0rOmu
	knJRNZgSIb1rtGVB0xZV/12mSObZwFteG4DNHaFyclZ3Tk5X6NCTuairOi8ktixGbRyFJCv
	I4z8Axt6rEn9mUWUMkc9gQDa/a8AmlOyD5k+S6Z140U2UWIJJ8Dfm4O9CX3+qkGewkfjbNs
	iJ/S6zt5qiFgPBnCdOiITI5gxiYXGBviNazqmtdQkpMNgFe6y0s1PDAmnnsyIXEdbPx3mBI
	Q1RA2JsFf8DReyfPMVJ9rbVUB3VE9SmN/JpzOu2s1CzWx/Wj1sKqcN/hAr3Gr7kiRnJWuzo
	HaAvQtSv92myhLeaUEepO5N6VKF5ofqAaf9pivron9A5cqDukSlCiZn0gad139Elw5XBwII
	XnH/NLuby1qbQ57fI+ZxIO17MyBeNojwTtMXDJqjqqFSe/k8XIo0r85Az0+FBz/iZkLiHdA
	5xSTUYg1oQUgcu+136BvD2MnUWMDkO9bechk7N3lmYUkTTC/nFENSPoYhroBnXqyVVBTlMa
	BWW5Q1riTR6iq/97T0tvz4dqS1DcYIE+8ecRcS7NtWyWKDMyFXxKJYlmmC8z9PV3y0sAKYh
	vZQvKNAVycygzfBdpw0m6DWJicTzvDP0nu9skbsg+4uSATS7LgIHdxPyfo5qvUz/BslhA4V
	JaAeZSyp6oJHHKpuavfJd+eBq+IrBeUCniZObSzwXRv8tteZpx1Eww6zYBLWtEDBt8WoBj1
	J6JEZ+ScJGT
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_175741_264093_A86760DC 
X-CRM114-Status: GOOD (  19.25  )
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

On Thu, Oct 09, 2025 at 04:27:10PM +0100, Conor Dooley wrote:
> On Thu, Oct 09, 2025 at 04:07:06PM +0800, Troy Mitchell wrote:
> > On Mon, Sep 29, 2025 at 06:48:22PM +0100, Conor Dooley wrote:
> > > On Sun, Sep 28, 2025 at 03:49:14PM +0800, Yixun Lan wrote:
> > > > Hi Troy,
> > > > 
> > > > On 12:16 Sun 28 Sep     , Troy Mitchell wrote:
> > > > > From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > > > 
> > > > > Document the compatible string for the MusePi Pro [1].
> > > > > It is a 1.8-inch single board computer based on the
> > > > > SpacemiT K1/M1 RISC-V SoC [2].
> > > > you could wrap at slightly more characters, I remember 72 chars
> > > > (haven't spent time to find a formal document link..)
> > > > 
> > > > > 
> > > > > Link:
> > > > > https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf
> > > > I'd suggest to list core features of this board, while using this link as a complement,
> > > > base on previous experience, vendor may change the link address, thus the link vanish
> > > 
> > > The link doesn't even work for me.
> > Could you double check if it really doesn't work now?
> > 
> > > Is this board actually made by spacemit as a developer platform?
> > Yes.
> 
> With the link, that seems pretty clear. Not sure why the link didn't
> work before, but it is working now.
Thanks for you confirming.

                - Troy
> 
> Cheers,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
