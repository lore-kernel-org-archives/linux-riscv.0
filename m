Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97640C79FB6
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 14:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXjXvIuTioyYLp2VPqTKOejcXc0eNZFCVMIUalyDElg=; b=TooBR47UaYcvS6bQOP7suSCV4r
	gpCGP+S2UkXUEhyUr/ZKhv7dqvrvn4OQvzn1qMliZLCmcQJfjqzyOLKSbrVdTQPgJc5qUqZMqgcvK
	xfSgl+foAKidt05VpD06sLaWrFBcz3vh5unsTzcuElWpR2EDL8mhu3iA+zKSSkKR4qON0MJ5Apj/1
	yuiaoSqW3SypKfYZjD1rU8Sk12NZuxFIcYUW7NfkBvJxxzjmMasMHH2qxFuRNzirrbpDJ+/qDYWUb
	X4XZrVXYwt5nmR3drx/2OU+mC6A7xfBu7KPbn3T+Tt7ppiaKfQRUkHIZBGHzS2sAMnFuFfnWBQy8E
	LsuEWAHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IxI-0000000BtjD-0QU4;
	Wed, 09 Sep 2026 14:07:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4IxH-0000000Btir-1Tvl
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 14:07:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 097794115D;
	Wed,  9 Sep 2026 14:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 628091F00A3A;
	Wed,  9 Sep 2026 14:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788962834;
	bh=yGxcXMg/VT7JrxWQ7k59cV5n2jK1svswZYlXM2tThIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VpvCy6UwudJZRKyHYxBt6LUZKSLzqyeSNPo8wcmuhCq6VuIWbikSim8NAcIVxZdE8
	 Rr2dWFLy383Dhuh7eMMJ38xof/JHameVOaXR+T3Oz9BdvFb0Mjf5JUjBzSALmUTCYu
	 VkvaF6rvZECVLdGBKB8OjrZdWoDHc6z4rNutbF/vdkvnn5dV+EGAyvOxEvTE9Zrwn9
	 5kbIb3SSv8A2THq3Mk3ZUKazodObnYDrfNbLzFzUtxOFWJiM2VcxN5Zf6sI5POERtV
	 UTAE55cfsVoVsODX4FPbGdSQL0V6DbXl3p6lWexRNY28qtPTAojEgIQp96U1DJPLIX
	 A+FiqpeFWSKgg==
Date: Wed, 9 Sep 2026 16:07:09 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, kernel-dev@igalia.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, fsverity@lists.linux.dev, 
	keyrings@vger.kernel.org, bpf@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, netdev@vger.kernel.org, linux-wpan@vger.kernel.org, 
	lvs-devel@vger.kernel.org, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	linux-sctp@vger.kernel.org, linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org, 
	bridge@lists.linux.dev, mptcp@lists.linux.dev, rds-devel@oss.oracle.com, 
	virtualization@lists.linux.dev
Subject: Re: [PATCH RFC v3 00/13] sysctl: add module aliases
Message-ID: <rywhz6soawf5dzyui5g7dnbufsgpxr7ma7honuhejwgncemzrm@f32at7hl6ugm>
References: <20260819-sysctl-module-aliases-v3-0-aab90569365d@igalia.com>
 <bpnqwggtidgiec5akns3fa5edbsvl7xf55dxabtwng2xspy4pn@ue554aii2ngk>
 <53155340c897560bfc67e61ba9568fd6@igalia.com>
 <mokz5pdtwswkyab4byfq7q7m6ac2g6ceoi6jflyxmaszaibzqa@su6m4kamtdpy>
 <b1a6cec17e7c828fcebe310ca2a0d25b@igalia.com>
MIME-Version: 1.0
In-Reply-To: <b1a6cec17e7c828fcebe310ca2a0d25b@igalia.com>
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
Content-Type: multipart/mixed; boundary="===============5998360395042939248=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5998360395042939248==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2m5clqoly7vxfssm"
Content-Disposition: inline


--2m5clqoly7vxfssm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2026 at 02:45:23PM -0300, Mauricio Faria de Oliveira wrote:
> On 2026-09-04 10:41, Joel Granados wrote:
> > On Thu, Aug 20, 2026 at 06:22:13PM -0300, Mauricio Faria de Oliveira wr=
ote:
> >> On 2026-08-20 09:51, Joel Granados wrote:
> >> > On Wed, Aug 19, 2026 at 03:16:13PM -0300, Mauricio Faria de Oliveira=
 wrote:
> >> >> This series adds 'sysctl:' aliases to modules that register sysctl =
tables; e.g.:
<... snip ...>
> > use the correct call moving forward?
>=20
> This scheme currently covers all modules, AFAIK, as it is wrapped in the
> functions that register sysctl tables.
>=20
> On moving forward: usage of such functions in a way that breaks a
> requirement of this series (e.g., failing to specify the template
> table/path parameter(s), or not having constant initializers) hits a
> build error, as the requirements are actually from the compiler.
>=20
> >> I guess that a different design could use MODULE_SYSCTL_TABLE() as
> >> MODULE_DEVICE_TABLE(), declared per table instead of wrapped into
> >> register sysctl functions.
> >> However, it seems to require moving the value of the path argument (or
> >> its template) into the macro and still referencing it in the function
> >> (or its instantiation of the template), which adds obfuscation, to all
> >> callers.=20
> >>=20
> >> What do you think?
> > It might be that having it inside the module subsys is more work, but I
> > believe that there is the right place to have it. I still don't see that
> > adding a module specific arg to the sysctl register is a good thing.
>=20
> Ok, cool. I can work on a different design.
>=20
> Please just let me know whether you are OK with the remaining (above),
> and I'll be happy to tackle this.

What is "the remaining"?

Best

--2m5clqoly7vxfssm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmqhaAwACgkQupfNUreW
QU+KhwwAk2Lee/ZoiUFUIogotHEgXdEnbLXsVMd7eYE+yCbFRSeHmKvBS3+HIQKk
3YwwDiKYy9LoPX/Z8J6u2Xzr6HX2acGjasEgcoVhtZwFfhNXbIhLsKQXuCL5xeP8
SP94dos6ha2gCbwAasxDxDaxBIeSpiyAojpShoXDz5sWPUp0+CmYPWbFSxvUSIiI
ky8t15AXflY5CE5Zs1l4rIapiMx4+KY3eP9XUpwYfkuRfqrIcdXpZAQLPEEHlvpI
YWkeFHLIzcVwQDJMylAIDZXqkqkcPwdT7HhvrtG59h/8S3oIx5d/D6RC03Wgb6Ac
O03rgV1e427EBuBbAqihY/D46amiR8xQUv+T+jgM+DnKvwGlmiTsIUimaqMrbVkq
tbmIxW90f2zlalhgxxmLbrnkzOLQ/jL4hz7blCO912BBCLNX40Ed/ZwI2GE+7hWk
LwqnPJ25U43p9yb5S6lO0E4aXy0oDr1cRrm93HBZeRgkQBJM4L8IttiwgbTEVAGM
McH2aXN2
=WiYs
-----END PGP SIGNATURE-----

--2m5clqoly7vxfssm--


--===============5998360395042939248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5998360395042939248==--

