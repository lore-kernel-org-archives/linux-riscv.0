Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670DEC25B4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 20:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XC8SQ1uBIs3dpbP3ROrn8jRup21TlFuQZFe/P+2iA1g=; b=xOUxCjOfUCkvjy0zAdUT3cLEJZ
	6RA0G45ZyvCucR0S+0V//FGlGkR0DzgL+tnCi7ENj8QUMJVCT0MBSx0us1tlU9qEjT8u9mG7MWYTp
	HrhKzWMbMssX3uXIRhLH0ny5E1HPbl8q2ArnENQ40ZYSm804/5NaPDYS2W+Ad/w1N53ek7Ua7Sih5
	2OH4r+HUNjO8YYOMhqBpuXafji3UAEHmtOhX5itn2rgifWH7HxE4RQWmQPL/I9H0t8nQsVwNqlviC
	WdAjmG2e819F85h0LfD+HuIrif+0qYx1fG+Xmntv2TBkuxF6XGBZP7YDODC2qX9rGMl6ehALxAFRn
	9OAajjSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4nli-0000000Gs4c-2AHp;
	Wed, 08 May 2024 20:20:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4nle-0000000Gs3c-2U4d
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 20:20:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E79816177A;
	Wed,  8 May 2024 20:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AAA3C113CC;
	Wed,  8 May 2024 20:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715199597;
	bh=BlVhgBPENuRR1ZWFVbwAUMlrpcgjW2ScbS4tYNlYnxs=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=Fl2L6tIJ09V4OnXjGbc5Z6i3kTU5m7FfYRrJdfCfQTmUqjku8Sg2p4W/EuULEcxV6
	 7/sHD39jth3T43zJOWjl0/13ZuPYVUn4IKD6e64haB3kXx+AiMBPk/WKGozRWRey6c
	 f5EPr7P6HPz4lU5VbEacNOzSdT26oZudvgkibQ6xEwe3SVwLe42Ypptksqgv5xMXHI
	 2I7k5cYCxY4LNgia+d7/ksXUCMm9ssc8uOERGUqf4nfJ8J6HNQ658TFtOtFWXRyKwW
	 kuuqjnG/P6N7s+HDQ0A6dAcfG41vB/VciwZ1ndHWNUvxubmwZPozKoIJV9jWksEfgG
	 yzBbwO7xaKRCw==
Date: Wed, 8 May 2024 21:19:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: "Conor.Dooley" <conor.dooley@microchip.com>, soc@kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [GIT PULL] RISC-V Devicetrees for v6.10
Message-ID: <20240508-unpaved-courier-fefe1f81897d@spud>
References: <20240503-swimmer-botany-7368a8a17b1a@spud>
 <5222e581-a189-4477-ba6a-edf4ce369eb0@app.fastmail.com>
 <20240507-hungrily-squash-2ac370e05fc0@wendy>
 <b618c311-8925-4717-b6bf-f3699b106189@app.fastmail.com>
 <20240507-concrete-come-2899fab0888e@wendy>
 <9031c5c8-1e93-491d-b756-5794cb87d1cb@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <9031c5c8-1e93-491d-b756-5794cb87d1cb@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_131958_774671_82DCAE3D 
X-CRM114-Status: GOOD (  16.76  )
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
Content-Type: multipart/mixed; boundary="===============3922003918109960531=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3922003918109960531==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jrCX5g0Qg+HhlROA"
Content-Disposition: inline


--jrCX5g0Qg+HhlROA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2024 at 02:15:39PM +0200, Arnd Bergmann wrote:
> On Tue, May 7, 2024, at 12:21, Conor Dooley wrote:
> > Cool, just wasn't sure if you were intentionally contradicting yourself
> > or if the "below" part had just been some general remarks. I'll try to
> > get a "revised" PR sent tomorrow.
>=20
> Ok. To clarify: basing on a bugfix pull request is always fine
> since those are already in Linus' tree by the time I send my
> pull requests to him for the merge window, so the branch contents
> as seen by 'git request-pull' are clean.

Ye, I was pretty sure that this is what you meant, but didn't wanna have
my second attempt also go awry!

>=20
> I also try hard (in general) to avoid dependencies between the
> soc/dt branch and any of the other branches, to be sure that
> there are no incompatible binding changes. This wasn't a
> problem here (I think), but if you send something late in the
> cycle, I pretty much don't want to have to think about that.

If there's anyone you don't need to worry about making incompatible
binding changes like that, it's probably Krzysztof or I. It'd be a
bit hypocritical of me to send you stuff like that..

I sent an "take 2" PR there, once the rebased branch had a chance to
appear in linux-next.

Cheers,
Conor.

--jrCX5g0Qg+HhlROA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjveagAKCRB4tDGHoIJi
0gYIAQClK3SRAzuzcuyG1SQIoaIpsTh4/fQC0Hhkme6wNAHWMQEA0WUy1aBh24WZ
eiuo5KDKeCl23eb0bmfwhWFDShhcHQc=
=gClg
-----END PGP SIGNATURE-----

--jrCX5g0Qg+HhlROA--


--===============3922003918109960531==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3922003918109960531==--

