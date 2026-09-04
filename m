Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB3AC61DD6
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 13:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YdeKaCFoijJ0BIsIhPVl59xBgwsNtX2tSnn7Y53F54=; b=xPqoISesjdF3zC924CGJegGG1p
	HRFsxrpkC40QG6ZigcykTm237ITPwzC9HAg8Q4miTYYit7LVD/qesJ3zGfDXdf6EnF28RF6pg33E3
	EiKa5PVavXzhLsZsmej5IzvbFGoxTX1MVfNd0znQV67j7Lp5HM556DNuGxg54C0vUkV2JQmW/Ip3r
	YHSAmlt7Q4HB2Viydpd8LBB4r3N2Q7asTqYdbUL5yp96aJQczwthkOuSAukdQEV103dgCMyPJ5Pl8
	Y2kQ2H5Lk/hZL+2eCZPuTtRPQJ3hRIgIw11P1cCQOu/uRSmQTtR05GTfRg7MacHP/kDTts/e/9mm9
	lfv0qgBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UAY-00000002GG0-0oJi;
	Fri, 04 Sep 2026 13:41:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UAW-00000002GFP-3qn5
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 13:41:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A89644079F;
	Fri,  4 Sep 2026 13:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0867A1F00A3E;
	Fri,  4 Sep 2026 13:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788529284;
	bh=sdodzR4Na8Sqljw2U9YzO1/rhfdn+6lstjf3xmHL5yY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tl3HNtlXjcpki9vJTKEAAdlO/sey7IATDkDXoGNKQfG6pfaXr4LGdJJGRG8VQgzou
	 M2pMGSsjenEtPt2HYbit8AGm+zwRYU5v9RbQSzJXr8V0rQyNFsminbBOzSV0N/aKVy
	 T4tc0TMfejuONmEj3jri/Jm7C22kCrbauJZDyv4yvs6lFrYeqtaQ8mYSZwNVYPTehg
	 cT52vtqmWpeUlt6o2nazGP1yTRVmu/xV1wgVt7M30HHfVo+7BRpk5YyYZU+0oqF4Pn
	 MWvpnb80OGvr0tGNxDUJrHuklEe72v1ymZTXWjhbrsp5Xlo+jUMr6KkZv93KHG7u4Z
	 HKQTZQoMlaj1A==
Date: Fri, 4 Sep 2026 15:41:09 +0200
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
Message-ID: <mokz5pdtwswkyab4byfq7q7m6ac2g6ceoi6jflyxmaszaibzqa@su6m4kamtdpy>
References: <20260819-sysctl-module-aliases-v3-0-aab90569365d@igalia.com>
 <bpnqwggtidgiec5akns3fa5edbsvl7xf55dxabtwng2xspy4pn@ue554aii2ngk>
 <53155340c897560bfc67e61ba9568fd6@igalia.com>
MIME-Version: 1.0
In-Reply-To: <53155340c897560bfc67e61ba9568fd6@igalia.com>
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
Content-Type: multipart/mixed; boundary="===============2038877730752506776=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2038877730752506776==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f2bekayrv5kknxjs"
Content-Disposition: inline


--f2bekayrv5kknxjs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 06:22:13PM -0300, Mauricio Faria de Oliveira wrote:
> On 2026-08-20 09:51, Joel Granados wrote:
> > On Wed, Aug 19, 2026 at 03:16:13PM -0300, Mauricio Faria de Oliveira wr=
ote:
> >> This series adds 'sysctl:' aliases to modules that register sysctl tab=
les; e.g.:
> >>=20
> >>         $ modinfo ./mpls_router.ko  | grep sysctl:
> >>         alias:          sysctl:*/net/mpls/conf/*/input
> >>         alias:          sysctl:*/net/mpls/default_ttl
> >>         alias:          sysctl:*/net/mpls/ip_ttl_propagate
> >>         alias:          sysctl:*/net/mpls/platform_labels
> >>=20
> >> It provides a trivial way to map /proc/sys files to modules (not trivi=
al today),
> >> and for userspace to handle nonexistent /proc/sys files (e.g., procps'=
s sysctl
> >> and systemd-sysctl applying tunables) with "modprobe sysctl:<...>" and=
 a retry.
> >>=20
> >> This is done almost automatically with register_sysctl(), register_net=
_sysctl()
> >> and friends as wrappers of MODULE_SYSCTL_TABLE (similar to MODULE_DEVI=
CE_TABLE),
> >> which emits symbols for file2alias/modpost to find and parse the sysct=
l tables.
> >>=20
> >> The big exception to 'almost' are sysctl tables and paths allocated or=
 defined
> >> at runtime (e.g., per-namespace or per-device), as all information is =
required
> >> at build-time. Fortunately, such tables and paths are often based on '=
templates'
> >> which are static and can be used.
> >>=20
> >> This is done by plumbing the template table/path as optional arguments=
 (macros
> >> with default values as default_gfp()), so not to create functions for =
all cases:
> >>=20
> >>         register_sysctl(path, table [, table_tmpl [, path_tmpl]]);
> >>         register_net_sysctl(net, path, table [, table_tmpl[, path_tmpl=
]]);
> >>         register_net_sysctl_sz(net, path, table, size [, table_tmpl[, =
path_tmpl]]);
> >=20
> > The "what" is described but I'm missing more clarity on the "why". Why
> > does this need to be trivial? Where is it that you will know the sysctl
> > file path of a module and not the module name or alias?
>=20
> Thanks for looking at this.
>=20
> The problem this feature addresses is sysctl settings not applied
> because modules aren't yet loaded when systemd-sysctl/procps's sysctl
> runs on boot, and the usage of /etc/modules as a workaround.

Sorry for insisting, but is it not possible to set the sysctls after the
modules have been loaded? Why is the order to first set the sysctl and
then load the module?

>=20
> This can be addressed with a way for sysctl tools to load the module for
> a non-existent sysctl file path.
> For that, the mapping between a sysctl file path (known) and its module
> (unknown) needs to be trivial.
This touches on my question. How is the file path known and the module
not known? The module is the one providing the paths, not the other way
around. Why choose to just work with sysctl path lists and not include
the modules that go with them?

>=20
> It may not seem serious at first, but I've seen this consume significant
> engineering time and impact production systems, in a previous technical
> support job.
> An example: cloud deployments with non-scalable network routing
> performance due to nf_conntrack_max not applied after reboot or an
> upgrade because the component which turned out to help with the
> /etc/modules workaround had its placement changed from network router
> nodes.
This is more understandable to me. The issue is that you loose the
relationship between sysctl paths and modules on updates. Are there
other cases where the module would not be loaded?

And doesn't it create another problem where you will load modules that
you don't expect (on the update)?

>=20
> > Additionally, sysctls are not module specific; they are a way to
> > read/write kernel variables. Putting a module specific aspect in the
> > function arguments (that needs to be ignored in non-module cases) seems
> > wrong. Why not use the module subsys to add sysctl alias instead of the
> > sysctl subsys?
>=20
> Fair point. The current design has 2 reasons:
>=20
> 1) Use the 'path' argument (raised in [1]), only available in the
> register sysctl functions.
> 2) Use a more implicit/transparent approach, instead of more
> explicit/declarative approach.=20

I get that the data is there and you would be able to do it, but it
still seems misplaced. Additionally, are you planning to move all the
modules to this scheme? If not, does that mean that some modules would
work and some wouldn't? And how would you make sure that modules would
use the correct call moving forward?

>=20
> I guess that a different design could use MODULE_SYSCTL_TABLE() as
> MODULE_DEVICE_TABLE(), declared per table instead of wrapped into
> register sysctl functions.
> However, it seems to require moving the value of the path argument (or
> its template) into the macro and still referencing it in the function
> (or its instantiation of the template), which adds obfuscation, to all
> callers.=20
>=20
> What do you think?
It might be that having it inside the module subsys is more work, but I
believe that there is the right place to have it. I still don't see that
adding a module specific arg to the sysctl register is a good thing.


Best

--f2bekayrv5kknxjs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmqaymwACgkQupfNUreW
QU+lGQv9G3M3cE2j6nFu2ajfmqXn/HK3F13D57StjtuTwbNUrTKJAl5NYfXzFtv/
WI0RRjBuOJKO4tZwqjX37MLUYJqa3GYA6eoQ8efnCCygEUInpicx3wittaZqtnv0
TGnCLpyb4BHmtJRx6lEoZFyU4juYti6APKn4p2+CBQN9jPCn2RbFf8fRCql2G7F2
LpM/O+tkXTZ8iY6iGjkROFdKmbNXq0JO5m6dOOgtyJt/m4dLF+ivs7HxExEvaAdq
0vMjANmTDelElI17ouGEstSU8WLY1R+rMEzMbm5Y5lTWK0MxCkReBjJSEx/yAQEZ
ecNJej849cFo1mun6yzEB6+3tiB1IGZaTerj7LfxHm+Ku9nVZ4p29/emoQ0UzWdd
SkWXhwUZbVGehFGYaCTT7KVDcv5fZiCr2WBM0POFIXhmSIk0CSLezhFr6JDElVov
R12dzrMN46WspdvHiWrBWBGMtUh+8hxByKgR+YduWJfKyeKBoQnsai2u+4zJ7Ayp
sBanGs6K
=SHqf
-----END PGP SIGNATURE-----

--f2bekayrv5kknxjs--


--===============2038877730752506776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2038877730752506776==--

