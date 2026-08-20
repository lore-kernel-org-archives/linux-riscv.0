Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1551DC5DF81
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 12:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+/Kh+vMWeGgXdfBTXa5yQSciG2h5GSWyV+3Vq2m1h0=; b=ME4vKt8GJ5ypIEP95RoYTJqqMb
	fqwOLySWUKmqc2vU4i9LE/Sa3SYggT50HzY/lpg5+w6EZPHXyyhyk/AAw7ItbNbZk6YFJ/tS99I1k
	UW82YiuQGmJ73G8bDuja579aUVUhoSzhk7P14ygrhSQbTsHsNdRhEdEJXYe9akvASsgSgY0PnM+ik
	0IVwptXNpd/0RRnmk9bpHOTdPq2k1rPvOM07MAnK7f1Wr+9WHzPTsBSpYv4jdWqWzp0KG0J01mn4s
	xQkrWicNWQB+HPi0ZWBA1fWKU9N8qlLlgrFV6rjBs7fSDuepXXGr6L7L/q2YI/myJ9SGYfUVjPaz3
	kLLd/q7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2Eq-0000000BZnw-1YDF;
	Thu, 20 Aug 2026 12:51:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2Ep-0000000BZnB-3JVV
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 12:51:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F1253434A9;
	Thu, 20 Aug 2026 12:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A92C1F00A3A;
	Thu, 20 Aug 2026 12:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787230278;
	bh=dAVoYnB5WFPNY5isnPlH4ce36KYRKmD4kl/YEQC1mAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mgPgh60BEcNbFO4U1gRCt9kcXAEhf35i+NR7lVlBIJfL1JrKFx8tZSR2qz91zSrlz
	 z9lWyjXulNRc788+A/flCzJSMEvOTbqaErTUClDB/Pwf2BHH9kGuE/jQt4VJXeD9W0
	 aPZYoxKP547bHPpxHi6RvVMcfQFLgiymPSuPUWifcNjpsHodGXHMfRcn71+lqY1iZs
	 W3NkS6xQCc7i2QT3WxbtlnkVYMhF0msyNhGdfVmSkuKJAImGyyzO/PdZpoHd80Sx6a
	 kOEvHUrTKfcuaq12LUBuDii7XCYfFDDAel9Royb7P0CD21Kj/xsRXikwNpZ7EhK9tK
	 UY4XPo9KHgERw==
Date: Thu, 20 Aug 2026 14:51:13 +0200
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
Message-ID: <bpnqwggtidgiec5akns3fa5edbsvl7xf55dxabtwng2xspy4pn@ue554aii2ngk>
References: <20260819-sysctl-module-aliases-v3-0-aab90569365d@igalia.com>
MIME-Version: 1.0
In-Reply-To: <20260819-sysctl-module-aliases-v3-0-aab90569365d@igalia.com>
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
Content-Type: multipart/mixed; boundary="===============6194460488732758387=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6194460488732758387==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="llmpbpsieq7v5rwe"
Content-Disposition: inline


--llmpbpsieq7v5rwe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 03:16:13PM -0300, Mauricio Faria de Oliveira wrote:
> This series adds 'sysctl:' aliases to modules that register sysctl tables=
; e.g.:
>=20
>         $ modinfo ./mpls_router.ko  | grep sysctl:
>         alias:          sysctl:*/net/mpls/conf/*/input
>         alias:          sysctl:*/net/mpls/default_ttl
>         alias:          sysctl:*/net/mpls/ip_ttl_propagate
>         alias:          sysctl:*/net/mpls/platform_labels
>=20
> It provides a trivial way to map /proc/sys files to modules (not trivial =
today),
> and for userspace to handle nonexistent /proc/sys files (e.g., procps's s=
ysctl
> and systemd-sysctl applying tunables) with "modprobe sysctl:<...>" and a =
retry.
>=20
> This is done almost automatically with register_sysctl(), register_net_sy=
sctl()
> and friends as wrappers of MODULE_SYSCTL_TABLE (similar to MODULE_DEVICE_=
TABLE),
> which emits symbols for file2alias/modpost to find and parse the sysctl t=
ables.
>=20
> The big exception to 'almost' are sysctl tables and paths allocated or de=
fined
> at runtime (e.g., per-namespace or per-device), as all information is req=
uired
> at build-time. Fortunately, such tables and paths are often based on 'tem=
plates'
> which are static and can be used.
>=20
> This is done by plumbing the template table/path as optional arguments (m=
acros
> with default values as default_gfp()), so not to create functions for all=
 cases:
>=20
>         register_sysctl(path, table [, table_tmpl [, path_tmpl]]);
>         register_net_sysctl(net, path, table [, table_tmpl[, path_tmpl]]);
>         register_net_sysctl_sz(net, path, table, size [, table_tmpl[, pat=
h_tmpl]]);

The "what" is described but I'm missing more clarity on the "why". Why
does this need to be trivial? Where is it that you will know the sysctl
file path of a module and not the module name or alias?

Additionally, sysctls are not module specific; they are a way to
read/write kernel variables. Putting a module specific aspect in the
function arguments (that needs to be ignored in non-module cases) seems
wrong. Why not use the module subsys to add sysctl alias instead of the
sysctl subsys?

>=20
> In this series:
> - Patch 1 prevents a build error later.
> - Patch 2 adds CONFIG_SYSCTL_MODULE_ALIASES.
> - Patch 3 adds MODULE_SYSCTL_TABLE().
> - Patches 4-5 add register_sysctl() wrapper and update some callers.
> - Patches 6-10 add register_net_sysctl[_sz]() wrappers and update some ca=
llers.
> - Patches 11-13 add file2alias support.
>=20
> Not all maintainers/reviewers (specially for the many changes in net/) are
> in To/Cc in respect of their time, as this RFC probably needs more general
> and earlier feedback before settling on specific changes for their review.
> All lists are included for visibility, though.
>=20
> Example
> =3D=3D=3D=3D=3D=3D=3D
>=20
> To put it all together, 'mpls_router.ko' (used above) from 'net/mpls/af_m=
pls.c':
>        =20
> - Tables:
>=20
>         static const struct ctl_table mpls_table[] =3D {
>                 {
>                         .procname       =3D "platform_labels",
>                 ...
>                         .procname       =3D "ip_ttl_propagate",
>                 ...
>                         .procname       =3D "default_ttl",
>                 },
>         };
<... snip ...>
>=20
> - Per-file:
>=20
>   Use '#define SYSCTL_MODULE_ALIASES_DISABLE'.
>=20
> - System-wide:
>=20
>   Maybe something along these lines:
>=20
>         # cat /etc/modprobe.d/no-sysctl.conf
>         alias sysctl:* no-sysctl
>         install no-sysctl /bin/false
>=20
>         # modinfo -F name sysctl:/proc/net/mpls/default_ttl
>         mpls_router
>=20
>         # modprobe sysctl:/proc/net/mpls/default_ttl
>         modprobe: ERROR: Error running install command '/bin/false' for m=
odule no_sysctl: retcode 1
>         modprobe: ERROR: could not insert 'no_sysctl': Invalid argument
>=20
> P.S.
> =3D=3D=3D=3D
>=20
> I wrote proof-of-concept patches for procps sysctl and systemd-sysctl som=
e time
> ago, which worked as expected, i.e., successfully set sysctl tunables whi=
ch did
> not exist in /proc/sys, by running 'modprobe sysctl:/proc/sys/...' and re=
trying.

Do you have links to this? To the old one, not necessarily a new
version.

Best
>=20
> Should this series eventually be merged, the patches will be submitted up=
stream
> as well, for userspace to start consuming it.
>=20
> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
>=20
> Changes in v3:
> - All issues were reported by sashiko-bot@kernel.org.
> - Tested allmodconfig with option enabled on x86_64.
> - Patch 2:
>   - Fix typo ('s/options/option/').
> - Patch 3:
>   - Fix usage of __UNIQUE_ID().
>   - Add __must_be_array() in MODULE_SYSCTL_TABLE().
> - Patch 4:
>   - Remove trailing backslash in register_sysctl().
> - Patch 6:
>   - Fix missing __register_net_sysctl_sz() in !CONFIG_SYSCTL.
> - Patch 13:
>   - Fix potential out-of-bounds read in do_sysctl_entry().
>   - Add check for entry size of zero.
> - Link to v2: https://lore.kernel.org/r/20260818-sysctl-module-aliases-v2=
-0-d5a69dae5798@igalia.com
>=20
> Changes in v2:
> - This is based on the series submitted 4 years ago,
>   with Originally-by: tags added in related patches.
> - Link to v1: https://lore.kernel.org/linux-fsdevel/20220722022416.137548=
-1-mfo@canonical.com/
>=20
> ---
> Mauricio Faria de Oliveira (13):
>       keys, pidns, fs/verity, riscv/vector: reorder '#include <linux/sysc=
tl.h>'
>       proc: add config option SYSCTL_MODULE_ALIASES
>       sysctl, mod_devicetable: add macro MODULE_SYSCTL_TABLE
>       sysctl: add register_sysctl() wrapper for MODULE_SYSCTL_TABLE
>       sysctl, parport: update register_sysctl() callers with template arg=
uments
>       sysctl, net: add register_net_sysctl{_sz}() wrappers for MODULE_SYS=
CTL_TABLE
>       sysctl, net: update register_net_sysctl{_sz}() callers with templat=
e arguments
>       sysctl, net: update register_net_sysctl_sz(ARRAY_SIZE(table_tmpl)) =
with template arguments
>       sysctl, ipv6: update register_net_sysctl{_sz}() callers with templa=
te arguments
>       sysctl, net: update register_net_sysctl_sz() edge case
>       sysctl: unrandomize struct ctl_table.procname
>       modpost: move addend_*_rel() calls into addend_rel()
>       modpost: handle MODULE_SYSCTL_TABLE symbols
>=20
>  arch/riscv/kernel/vector.c              |   1 +
>  drivers/net/vrf.c                       |   3 +-
>  drivers/parport/procfs.c                |  26 +++-
>  fs/proc/Kconfig                         |  13 ++
>  fs/verity/init.c                        |   1 +
>  include/linux/key.h                     |   1 -
>  include/linux/mod_devicetable.h         |   7 +
>  include/linux/pid_namespace.h           |   1 +
>  include/linux/sysctl.h                  | 110 ++++++++++++++-
>  include/net/ipv6.h                      |   6 +-
>  include/net/net_namespace.h             |  47 ++++++-
>  net/bridge/br_netfilter_hooks.c         |   3 +-
>  net/core/neighbour.c                    |  11 +-
>  net/core/sysctl_net_core.c              |   3 +-
>  net/ieee802154/6lowpan/reassembly.c     |   2 +-
>  net/ipv4/devinet.c                      |  12 +-
>  net/ipv4/ip_fragment.c                  |   3 +-
>  net/ipv4/route.c                        |   3 +-
>  net/ipv4/sysctl_net_ipv4.c              |   2 +-
>  net/ipv4/xfrm4_policy.c                 |   3 +-
>  net/ipv6/addrconf.c                     |   7 +-
>  net/ipv6/icmp.c                         |   6 +-
>  net/ipv6/netfilter/nf_conntrack_reasm.c |   4 +-
>  net/ipv6/reassembly.c                   |   3 +-
>  net/ipv6/route.c                        |  10 +-
>  net/ipv6/sysctl_net_ipv6.c              |  13 +-
>  net/ipv6/xfrm6_policy.c                 |   3 +-
>  net/mpls/af_mpls.c                      |   9 +-
>  net/mptcp/ctrl.c                        |   3 +-
>  net/netfilter/ipvs/ip_vs_ctl.c          |   4 +-
>  net/netfilter/ipvs/ip_vs_lblc.c         |   3 +-
>  net/netfilter/ipvs/ip_vs_lblcr.c        |   3 +-
>  net/netfilter/nf_conntrack_standalone.c |   5 +-
>  net/netfilter/nf_log.c                  |   9 +-
>  net/rds/tcp.c                           |   4 +-
>  net/sctp/sysctl.c                       |   3 +-
>  net/smc/smc_sysctl.c                    |   2 +-
>  net/sysctl_net.c                        |  10 +-
>  net/unix/sysctl_net_unix.c              |   3 +-
>  net/vmw_vsock/af_vsock.c                |   4 +-
>  net/xfrm/xfrm_sysctl.c                  |   2 +-
>  scripts/mod/devicetable-offsets.c       |   6 +
>  scripts/mod/file2alias.c                | 237 ++++++++++++++++++++++++++=
++++++
>  scripts/mod/modpost.c                   |  46 ++++---
>  scripts/mod/modpost.h                   |  25 ++++
>  45 files changed, 575 insertions(+), 107 deletions(-)
> ---
> base-commit: 2697ef8943c9985c14708a6429e21812693857b2
> change-id: 20260818-sysctl-module-aliases-2f5801b1eb71
>=20
> Best regards,
> --=20
> Mauricio Faria de Oliveira <mfo@igalia.com>
>=20

--llmpbpsieq7v5rwe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmqG+DkACgkQupfNUreW
QU9KzQwAhnJv61O/aMHJoyHWwD3V+aqe2io3c+exriyswf+YGkguC5yyn032XIx6
Ibx+W62lH2/mPJSnsg/YyCksI/isYesqXra6cysOt8n8IVaZbkJp5izyWqjxpPKI
AMrrhalbZPm1CuhneeQl9RPWYZi3byxOz9XrAaJW3ub+9aT7qMsqdRr2nKeBDKNb
arfqwZhcigESQ05YkHEDbccIUTNOjk639/fLlILoYDVhpXhUl2p2Th8kZwXf3nAJ
paRh9FhTA52dNDIA8rakiMk5GFctCcKw4dxujLjdRCjaCcyU1bkhZOhvPGhySCHL
C6v5ixdwhitvddzp6plBXGEVHohgh9n0WjRJ+eRzZiqK7GA63wM7145k1FSk2Ejr
ofvPKQQcY1f5O44JM7EhJjzrNUU3rMdxQUXz0iZP6YnYmCym4mZxIXzRxd4uneQT
jvy6cExOstetUU0qCj9qwQSvTJR8ibnMFDG/d845/FSBYC/vZyotBtkzOh/Eenj9
K+vFLC58
=87kF
-----END PGP SIGNATURE-----

--llmpbpsieq7v5rwe--


--===============6194460488732758387==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6194460488732758387==--

