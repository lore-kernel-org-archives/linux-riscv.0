Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4040C27C79
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 15:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i24B36ZZRGXbZRLjrNQElTTJMjLZHeFCzvwZhOoy808=; b=UFLFfl9OD6VS6VVFGVxyv/kBfo
	8USTPr4Y1CuXzxjsZYeg3CYW+JiOfNESQTse89LXzDCLHuVzEPwKWYhQkBzHCFGPfCtJhS7FECdMq
	fJPJPJgjr+FXDbqGLkIX29sDaHU/Wez6Xrccc1PuaLUFjwz2vj7+lCaYTnN7+bn39u7yKuU0wc7xe
	E/9WU7vnqEJE/xfTPNHCKRcJQqzYT/dzqQIBFDzrbsco/4pk2SG4X3Zj/6h7qPmQU9RRdvG/xojkE
	yx1//E3sxpRg1Zxzuf/BGqxruCYRtrhMLF+7dl/FJpR8xccHm/tDtMgndjt9GUl779HioNjs+AAdA
	WaoQcu0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJEM1-0000000BUHa-37fu;
	Mon, 17 Jun 2024 15:33:09 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJELy-0000000BUG3-1rQK
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 15:33:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AC1CECE118C;
	Mon, 17 Jun 2024 15:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F8FC4AF1C;
	Mon, 17 Jun 2024 15:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718638384;
	bh=HxCgZ9RRehmuaY6O4D/DkqsCxzUh2/Ih2ogkzpYGqys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cq5T+6Ci5gl+/lsjeByOrNUYs1W4yi2O0xOuvt3SOBaQpxoiuXxIozmJ9BktASDdb
	 IiegacTovdT5OMiyAfbHHRzCj40MJJWSlgbI+mkP0McRnkIvtbu0aLBShEVreEABgU
	 WZoyO+ShWJKDCgXfYoDB4Z3Pg/DhgJWsQkeRhyXxjkTBkvNXyFczzUQQSiUXC2C6t7
	 zdRv5nuvylPllepQjfdauJMZjzLn9Z66qDwNpfaQL6u8gLq38HTURc58lVN/qXoVgn
	 kumsZhxSvo0yLZe0FSWn2xAxJt93rlpLEiQqtWQvRb2QLhwjamvBelDSOyTYUk2J3p
	 jAgEr4evAWABw==
Date: Mon, 17 Jun 2024 16:32:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>, Yangyu Chen <cyy@cyyself.name>,
	linux-riscv@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jesse Taube <jesse@rivosinc.com>
Subject: Re: [PATCH v1 0/9] riscv: add initial support for SpacemiT K1
Message-ID: <20240617-synapse-carmaker-0a59c7c6edb7@spud>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <20240616-exorcism-computing-e11e26084a62@spud>
 <20240616224811.GC3983622@ofsar>
 <ZnBEBQjTQtFs-fXt@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZnBEBQjTQtFs-fXt@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_083306_972190_D98B82F9 
X-CRM114-Status: GOOD (  26.25  )
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
Content-Type: multipart/mixed; boundary="===============2157801178435973667=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2157801178435973667==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AaEPeEN+LnYVG4mh"
Content-Disposition: inline


--AaEPeEN+LnYVG4mh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 10:11:17PM +0800, Jisheng Zhang wrote:
> On Sun, Jun 16, 2024 at 10:48:11PM +0000, Yixun Lan wrote:
> > Hi Conor
> >  Thanks for bringing this up
> >=20
> > On 19:35 Sun 16 Jun     , Conor Dooley wrote:
> > > On Mon, Jun 17, 2024 at 01:18:52AM +0800, Yangyu Chen wrote:
> > >=20
> > > No MAINTAINERS update, so I figure that means you don't want to maint=
ain
> > > it going forwards? If there's someone out that that does care about t=
he
> > > spacemit k1 (Jesse maybe?), then I'd be more than happy to have them
> > > look after it.
> > Yangyu kind of has limited time, too many stuff for him..
> >=20
> > I'd volunteered to help on this if it can fill the gap
> > Also I'd be more than happy if anyone willing step forward to co-mainta=
in..
>=20
> Does maintainership work like this? Is willing to do enough?
> FWICT, maintainership involves active patch contributing, reviewing and
> maintaining the whole SoC. It is better to take over the maintainership
> after showing enough patch contributions and understanding of the SoC.

I was going to reply to your other patch about providing more complete
"basic" support for the SoC, but I guess I'll reply here and address
both points. After the k230 and th1520, which were both merged with very
basic support and have made very little progress towards being a useful
platform, I'm pretty reluctant to merge another platform in a super
basic state. I was going to make this point before you brought it up,
but it's good to know I am not the only one with that view. To be clear,
I'm not pointing blame for those platforms, I'd just like to avoid a
repeat. If Yangyu doesn't have time to do any development work on the
platform, I'd like to see someone else (and as I mentioned Jesse is
interested) take on getting some of the basic driver patches written and
merge only when those are accepted. Having no in-tree clock and pinctrl
drivers is definitely a hindrance to other people doing parallel
development of drivers and I'd like to avoid that.

Getting back to your point in this mail, whoever gets the platform to
that state is well suited to looking after it going forwards. Some other
interested parties could also join as reviewers. I don't want to see
people joining as maintainers that are not going to have an interest
in the platform going forward, as that'll just end up with me as the
defacto maintainer.

Thanks,
Conor.

--AaEPeEN+LnYVG4mh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnBXKgAKCRB4tDGHoIJi
0v20AQCpR2ZQ2v2NRkN0DYxAd/yPPIfKqlUlrmJB2U/evik29gD9FRxjtuXoD1XB
QPAeBrDfwe+kvuWdHG1CeRwlLMpItAA=
=xn4V
-----END PGP SIGNATURE-----

--AaEPeEN+LnYVG4mh--


--===============2157801178435973667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2157801178435973667==--

