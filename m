Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4822ECD4F39
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 18:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1d5mBUVDj0CK7iVpAC6dPZtEqpag+g4DtomOSswtoI0=; b=ilxt72XwGrv//QFANmzgZJrW8h
	zdVCp430zywYsdNi/tAob2jMjChpA9eU0OnnLYoks3CIqYGx4ErfYv/i1oYLJZ0ckkw9tV93VrmJc
	pTpvd7suVw2ppjI4JRVGSPbGLNFBh/aINtHuBp0zeh1ujoP968M3zhYn6kWWszVWwFCubET4+YW10
	wNjvyAGb4JNsZPkLkMMRwZ7DdhLXtgSf+xhjg1ILz8YK01ZA4tR3DpXkPjVwyvHXoSPug5OaQOkbJ
	2lW49Bb3aoScPELcGeq797AlvTckO1pn2rwPbIM6H90TbRiWQDDlSNH0Iqv2hJcM4pH0G4a0mIHCj
	tdJXRSSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNbFp-00000006NB8-1e8T;
	Thu, 14 May 2026 18:57:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNbFn-00000006NAZ-47C4
	for linux-riscv@bombadil.infradead.org;
	Thu, 14 May 2026 18:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+FM6hA+10TTi7iU5PA1MKulFrGwvHU/KyYs1Y/Opk94=; b=JOWfAOaH8S4GQdbSoIe77pi1VE
	3Gkru5tHwIyAZbdgvAORFERgEXggfh5xe4iTCylUU4j5xX1G5VRMwiAEPyCtmSNrQQ8NxyKhg/QTo
	6NAsm1MlN6Xq7YABgX8QnMyO4ldQIr+s0Mj9F77YaT5n+O9Aur+4lQZ/X1lAFfZK4qUgHPh+g5BXS
	GQqODEIeVi97EyQrgUnOqdXRu4LA/1LgKSEgFEcx+9o3nIP8B9sqp04I3yVVDi0c1M/wLlaxu1VTb
	hZJqBnM8zffzyre9NCgE12sXnF7q0I4k12RXWL3ZMhPiLf8c0CyPrnvl/RYZMNOOgxzswQ7SOlGtb
	jANQM2QQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNbFk-00000003fgv-0o2R
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 18:57:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A9F3F4072F;
	Thu, 14 May 2026 18:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC839C2BCB3;
	Thu, 14 May 2026 18:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778785066;
	bh=+FM6hA+10TTi7iU5PA1MKulFrGwvHU/KyYs1Y/Opk94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G9hhLWKFWIVd/foKe6YYx5dv48kqWpysPUwK0LZaP2I6dy8uvNUrOTrO4ou/DI/Gh
	 K8EfpuI6Giwo5ewulsKBJndXG1ZHWIBC00Sozh+uYZ9BNSdX5fHP2bU7HdewyFn+ob
	 wqNma7qU8Go0tOaOI+MFH6xJcyTqd+UJmFbXkwEHoiGUVHYrGAitb8gKfmX9Livtjk
	 1NwWSFYxZIl24oyNV5mOmSZvmYUPOM4q21yKkF6+UdDEgxUJ7T9Ttk+6bbD6Fc+yBh
	 dxhEhIfSfgIWb+c1FzrU6BNkAqjK1/ljPPuEFGF2PaIZ7R+muuRyG/6v0MJX7w7WrL
	 iqmeHGRYKtvmw==
Date: Thu, 14 May 2026 19:57:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [RFC v1 0/4] generic pinmux dt_node_to_map implementation
Message-ID: <20260514-used-revival-306ddced4ab8@spud>
References: <20260506-energize-dramatize-051909e54256@spud>
 <CAD++jLkEfqDrqaxTjxf4AwHPcdCppPfO5F7H5YnR2gebzhZFig@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD++jLkEfqDrqaxTjxf4AwHPcdCppPfO5F7H5YnR2gebzhZFig@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_195748_751038_A90AA33A 
X-CRM114-Status: GOOD (  23.57  )
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
Content-Type: multipart/mixed; boundary="===============7759641254750682923=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7759641254750682923==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G1HwXNExfpOqsnk7"
Content-Disposition: inline


--G1HwXNExfpOqsnk7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 10:23:16PM +0200, Linus Walleij wrote:
> On Wed, May 6, 2026 at 11:58=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
>=20
> > Whipped this up last week, at to a first glance it appears to work,
> > although the spacemit platform I've used to implement this has very
> > limited in-tree use of pinctrl so it is hard to be sure.
>=20
> I like it, if it wasn't RFC I would merge it.

Half the reason that it is RFC is that I knew dlan wanted to take a look
but told me they weren't available, so I said I'd send it on the list in
the interim.

> > What I don't love though is how similar the functions
> > pinctrl_generic_pins_function_dt_node_to_map() and
> > pinctrl_generic_pinmux_dt_node_to_map() are - essentially identical
> > other than which function they in turn call.
>=20
> Hm we can maybe think of something more descriptive
> to the first one?

I think the name is actually okay, it was the similarity of the code
that I don't like. There's a fair bit of duplication.

> I think the new function is very much to the point. That's what
> it does. pinctrl_generic_pins_function_dt_node_to_map() could
> perhaps be names something that make it evident what is
> special about it. Not that I have a good idea.
>=20
> > Basically, I wanna know if you think that that is acceptable,
>=20
> Looks Good To Me (TM) no-one else is helping out with pin
> control core work so I'm happy for everything I get.

Right, well I'll go clean it up I suppose. I might send a rfc v2 with an
extra patch that tries to get rid of some of the code duplication and
you can tell me which version you prefer?

--G1HwXNExfpOqsnk7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYbJgAKCRB4tDGHoIJi
0pQuAQDdsm05Tu6s305sA0AF4zcLSMo5WeLpHnAmao/S4UXj2AD/VgBbmKWYI8YG
d3/lbYthJp15vGrtvCrbRjMd8nqi2Q4=
=CZj+
-----END PGP SIGNATURE-----

--G1HwXNExfpOqsnk7--


--===============7759641254750682923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7759641254750682923==--

