Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1227AC6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 19:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pCDW8f+qh8lyiCdiju9cHMiqyAsBTMs9etX2Csb1f5I=; b=5FrJQP5zjbqhPF5Wq+zmj38x3b
	UUMD3o+c7WowtPydkqYCs+1CAGxaygfIm1Y0ZW8KuQs/0gju+zFDZi/0SLO+AmyJVZeDPfzYZC0LW
	3XGd4seDMz4gwikx8OOtd3MP0V0tnfetHK4PMQAHXJ+BgIEPKpoUZRhVTAL7cZL8qSna6gFNzqWhl
	cfWrt18BnDKHo6AO4UKFZTgjmhEA3hJyDEirGv6hBE8LAjid3F9ViP/LGivovhGKOUO8uX7SjcFSu
	zZKO/mrXXpIXwbfieT+dpEX9+da7Cv/gD8J7nMc9Y3NDGMXx3gGOvScOKfnhJNsZ+MJNEO/pOJTq9
	cbw939Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf4Nj-00HE0f-0O;
	Wed, 22 Mar 2023 19:44:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf4Ng-00HDzt-0x;
	Wed, 22 Mar 2023 19:44:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CCD4D6229C;
	Wed, 22 Mar 2023 19:44:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E19C433D2;
	Wed, 22 Mar 2023 19:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679514259;
	bh=N79/XcqKwBlbg0yGxOvbsm3eH9+OCTisGoN2F8v82b8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gRlGQ9wNjBIpXZ9FVQ96iypTLUE5WU7B014UkpzC90/aakAHtexI3xEWGEgxqvwqw
	 zdOU1SO7M7TiO/b1UpRxNlHHBGZx9ZW3tG7PoMGblvOdQ7x+o1qRknl2khhYDa2m/H
	 v4gcnpfh4mBZSOOYjCjpTNEjugYkKy6piCqkRfTCZD9aA+bMP0s2JqmEYuhOhy7bQm
	 MDTqhQnclR3g46B1VJAx/i8Oc9DH8CKu/89PDfyHM5OQMdiVCy3j+zCIFMOhzKfrVx
	 Ysp5S8J2eYTDB/karvCpNIU9LsQDzIVPsr9GG//ZpqlN8ec7tMBU7HdE7BlwBxTw19
	 aFaY+8qmZvvuQ==
Date: Wed, 22 Mar 2023 19:44:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	regressions@leemhuis.info, regressions@lists.linux.dev
Subject: Re: [PATCH] riscv: require alternatives framework when selecting FPU
 support
Message-ID: <2a3b08ce-5ab1-41b6-ad58-edbeff7b1acb@spud>
References: <ZBruFRwt3rUVngPu@zx2c4.com>
 <20230322120907.2968494-1-Jason@zx2c4.com>
 <20230322124631.7p67thzeblrawsqj@orel>
 <1884bd96-2783-4556-bc57-8b733758baff@spud>
 <20230322192610.sad42xau33ye5ayn@orel>
MIME-Version: 1.0
In-Reply-To: <20230322192610.sad42xau33ye5ayn@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_124420_376840_2864A09E 
X-CRM114-Status: GOOD (  15.64  )
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
Content-Type: multipart/mixed; boundary="===============4541702862369552937=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4541702862369552937==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="T7/Amfx/a00q9icF"
Content-Disposition: inline


--T7/Amfx/a00q9icF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 08:26:10PM +0100, Andrew Jones wrote:
> On Wed, Mar 22, 2023 at 03:17:13PM +0000, Conor Dooley wrote:
> > On Wed, Mar 22, 2023 at 01:46:31PM +0100, Andrew Jones wrote:

> > > (It's tempting to just select RISCV_ALTERNATIVE from RISCV, but maybe=
 we
> > >  can defer that wedding a bit longer.)
> >=20
> > At that point, the config option should just go away entirely, no?
>=20
> Ah, yes, and that makes the idea even more attractive, as we could remove
> several ifdefs.

I went and did the cursory check, it's not compatible with XIP_KERNEL so
dropping the option entirely probably isn't a possibility :/

--T7/Amfx/a00q9icF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBtajQAKCRB4tDGHoIJi
0hClAQCSetegmG02nWJ9pd0GXnKzqZSmudE53aXR6LOGdXh6tgEA/wjyL0SllO0s
4zT1G8PMYjfg2xPVfBBR3FVlPbok/g0=
=wziO
-----END PGP SIGNATURE-----

--T7/Amfx/a00q9icF--


--===============4541702862369552937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4541702862369552937==--

