Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6D5C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 17:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pedY58F4sslfTEcBPPpbfnroSDFcznGdkRrpcKB0pgg=; b=ico17f6E5SAFY/bLtisZJWtu8T
	NXiAQqsMyexdUpfL9GKNO78S6gO2iZMXwYIvI/CsVx3vmwD6cU3LkA8nAIQlGCzwS2nsyviiHlfto
	wqowlSyNXBBW2RpfLuTQ+rX6SfV9T3rJohv+bIhMK8RQUuRUQ+JXcvcS9baaMD+ED/NGMSH3DeabA
	3VXkVZwD+n+d8dTTWED4f4UZ7hIqc8r4E4mxFuNOoovG+z8ybrL4Eja28fcMOtZZuTfycgcdtTT+C
	j1E8JWRS74ISF1aZLEy8EJ10yVVr7O1vZZJl6+5YD6bfrbIoq7JliBcSZOs/7R3OpK7GE0eozjBk4
	RpVABN5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzhTe-00DeVY-1Z;
	Thu, 18 May 2023 17:31:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzhTb-00DeU8-1A;
	Thu, 18 May 2023 17:31:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B525965125;
	Thu, 18 May 2023 17:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45FBC433D2;
	Thu, 18 May 2023 17:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684431102;
	bh=zzp+uovCM+0ktu/LRwnGZCR4E9oZn2Eu76OqQF3q8zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aCa0sI9TiYtzmwygrOxmqsEphXml8GCDPI+Uyvgl2lmFO300C2SL9+xr2oZDQgnmd
	 JC1Iwm99HHpZ48WwVvC1Vp3JCWhzzlIQa5n11P8oSgprFcBeVP01ZD5NPuZVF9icu+
	 5WXSVatdqL7Ps4Tlt2ZLQTLkUgohAwnv5cHYSdo/WL8+tEyQyozAIwOQTJ+NLNMcSD
	 wycNptRle6HS5XtjWK5XwyywCCV7D67kB2X1bEVtKRgdsawRVNyFBk9riCPQjYKNxi
	 9aZBSFD8B0ttgCzluYRXW01ojb1BGacomQMkTvWdttxj5MjWh+vEmljOjluj+3zxa5
	 KKPkTCA/FunMg==
Date: Thu, 18 May 2023 18:31:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH -next v20 23/26] riscv: Enable Vector code to be built
Message-ID: <20230518-rented-jogging-b84c705f7d76@spud>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
 <20230518161949.11203-24-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230518161949.11203-24-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_103143_443671_29403CD7 
X-CRM114-Status: GOOD (  13.40  )
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
Content-Type: multipart/mixed; boundary="===============7937472845404444411=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7937472845404444411==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bQceGelgZ6gGgrWd"
Content-Disposition: inline


--bQceGelgZ6gGgrWd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 04:19:46PM +0000, Andy Chiu wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>=20
> This patch adds configs for building Vector code. First it detects the
> reqired toolchain support for building the code. Then it provides an
> option setting whether Vector is implicitly enabled to userspace.
>=20
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>

> Suggested-by: Conor Dooley <conor.dooley@microchip.com>>

You can drop this tag if you respin, I just provided review comments ;)
Also, it has an extra > at the end.

Otherwise, I am still not sold on the "default y", but we can always
flip it if there is in fact a regression.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks.

--bQceGelgZ6gGgrWd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGZg+QAKCRB4tDGHoIJi
0lffAP923xnPAi25QhBpQiF/OpAi1FG7JJJt2w3dfV0mC2a3FQEAlJOfSGkio5j1
qO0ZWN5aIO5AXcPZ1Tl1jmBjwSdNVAE=
=Hlwa
-----END PGP SIGNATURE-----

--bQceGelgZ6gGgrWd--


--===============7937472845404444411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7937472845404444411==--

