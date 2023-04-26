Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C434C7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 23:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vvSazfZeVig8kUV8l2Z4+Mc4nzZ9uV03M5ccISlrIYk=; b=PUjGpPanT+s4z3
	nVl8+vBgzKZJ9xnZ8xoV+hPjYCo1UdaI1hQPY6srIVGqjHSTy0BgqCZgKp2xNBog7ZT9yGoeAgUkC
	duHx/9liSg6sHwk+E7ANK1mUv2AN879GHs73kbnMeoQiqfkCR36f6pmZtiApeKP1j8jrd9ExFrskk
	S+Rs3xDFouWELvqaiGlonANVrgNqOaeSWIz6QA/phPpLU1RW5tNrTYPPQyQ3NnelzlLgy8GT9zYLc
	xozMS5DQ/VIKig7kVsVPh21CLOxKmWG4ioHIu+VEF4HoFSswnuNpIKX6LOiqR78gvxBwvh4rS0CJ7
	WhekIoWWsrcOmIECHI2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1proZK-0052QP-0s;
	Wed, 26 Apr 2023 23:29:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1proZH-0052Py-14
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 23:29:00 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1proZ6-0000GR-FU; Thu, 27 Apr 2023 01:28:48 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Eric Biggers <ebiggers@kernel.org>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 herbert@gondor.apana.org.au, davem@davemloft.net, conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, christoph.muellner@vrull.eu
Subject: Re: [PATCH v4 0/4] Implement GCM ghash using Zbc and Zbkb extensions
Date: Thu, 27 Apr 2023 01:28:47 +0200
Message-ID: <5008634.irdbgypaU6@diego>
In-Reply-To: <20230426232331.GB65659@sol.localdomain>
References:  <20230329140642.2186644-1-heiko.stuebner@vrull.eu> <7664296.GXAFRqVoOG@diego>
 <20230426232331.GB65659@sol.localdomain>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_162859_368384_0F544728 
X-CRM114-Status: GOOD (  11.00  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

Am Donnerstag, 27. April 2023, 01:23:31 CEST schrieb Eric Biggers:
> On Thu, Apr 27, 2023 at 01:20:31AM +0200, Heiko St=FCbner wrote:
> > But for me, this small bit of scalar crypto is also sort of a stepping
> > stone :-). Previous versions [0] already included patches using the
> > vector crypto extensions too, I just split that into a separate thing,
> > as _this_ series actually uses ratified extensions :-)
> > =

> > =

> > Heiko
> > =

> > =

> > =

> > [0] https://lore.kernel.org/lkml/20230313191302.580787-12-heiko.stuebne=
r@vrull.eu/T/
> =

> That patchset wasn't sent to linux-crypto.  Can you make sure to include
> linux-crypto@vger.kernel.org on any subsequent patchsets?  Thanks!

yeah, that was a fault on my part, which I managed to rectify with v4 here
[haven't had time to send the vector part as separate v4 yet]

Will include linux-crypto in further submissions.


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
