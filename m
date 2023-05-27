Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8171AC77B7C
	for <linux-riscv@archiver.kernel.org>; Sat, 27 May 2023 10:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YhNjc8fc68GpljDj6Bqr4adzBZK3mBdW9dnh6xCCTT4=; b=kSVk0b5JQOsf3ud8gpcvSIwQl6
	IOvRoOeChQjq2A2q6Y9swZgBpsTx9s0bmqYD8A/8Fo4KPNK0TCqNivjkFqzRyA3YJ/Pnfhtzl+CXZ
	A8swrs1+VM7TMeKO0E2qUWVzoMVDLBwTXhudtN1yRdvkKKDAcQIaTm9Fahw9O7OPZ3yEOtT0jM+ro
	8Y491McfiFejclgIWylPrwhWHnPXIKw0av1wWuqhMcjcuxqNVdb3/z6vas9Z2TneMTNcL/ixtZMTN
	Ruc3nFBsGUyP69WvmNxmb3P+jkXpwEwoD87Vwo9CdzYZfYL6375DTK+TITLRcoQfyjQGw3csXkecP
	MOOGM1zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2qlM-005Pam-2F;
	Sat, 27 May 2023 10:03:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2qlJ-005PaA-2W
	for linux-riscv@lists.infradead.org;
	Sat, 27 May 2023 10:03:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8D83B60B81;
	Sat, 27 May 2023 10:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43774C433D2;
	Sat, 27 May 2023 10:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685181779;
	bh=Q2FDhXqVNJHaRjoJtXMk1o3QIJ5qqminjno17UsLNMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MrsdLN08Txax+9c2aEGIhrhw/xGdOciRKkLKTo4m+PhnvXrvRx6+/IsGBVnTrPNNw
	 jSlehauyk2ww6e4Kp6GHmtVe7Sx1Y5FdTPFTEr/QamLzVByImx/hZ1BZiFP7tBlCrC
	 RRZ54pk3WEdkd6nkzaU5Fxo2J2Z3UO/H2HqxobN18EEfGTIKbBNEKVO0rG80tZKlJ5
	 lH3BiIYFK8HB2nuuR7Dlco7eg6hz2k731zrEFy2NEjv+4n+EaVd4TWduBvaFVKnxuz
	 tGIjxXH64ibSD61yCHSpjc3MIv49A0VnYg440u7W4jGe0BIbxdHqVWgtr4ZKD0JtNe
	 l5wgnpFlK0g7w==
Date: Sat, 27 May 2023 11:02:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andreas Schwab <schwab@linux-m68k.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes] riscv: Fix relocatable kernels with early
 alternatives using -fno-pie
Message-ID: <20230527-hyperlink-doctrine-ef22cfcb508a@spud>
References: <20230526154630.289374-1-alexghiti@rivosinc.com>
 <20230526-clergyman-wriggly-accc659a3fad@spud>
 <20230526-rockfish-moody-f6d3e71f9d24@spud>
 <f6522c82-01bd-8a03-579d-a5b294784480@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <f6522c82-01bd-8a03-579d-a5b294784480@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230527_030301_928514_78C5E04A 
X-CRM114-Status: GOOD (  32.81  )
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
Content-Type: multipart/mixed; boundary="===============3896924096618875461=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3896924096618875461==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jODbkASVMwTCezVU"
Content-Disposition: inline


--jODbkASVMwTCezVU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 27, 2023 at 11:13:18AM +0200, Alexandre Ghiti wrote:
>=20
> On 26/05/2023 18:35, Conor Dooley wrote:
> > On Fri, May 26, 2023 at 05:24:41PM +0100, Conor Dooley wrote:
> > > On Fri, May 26, 2023 at 05:46:30PM +0200, Alexandre Ghiti wrote:
> > > > Early alternatives are called with the mmu disabled, and then shoul=
d not
> > > > access any global symbols through the GOT since it requires relocat=
ions,
> > > > relocations that we do before but *virtually*. So only use medany c=
ode
> > > > model for this early code.
> > > >=20
> > > > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > > > ---
> > > >=20
> > > > Note that I'm not very happy with this fix, I think we need to put =
more
> > > > effort into "harmonizing" this very early code (ie before the mmu is
> > > > enabled) as it is spread between different locations and compiled
> > > > differently.
> > > Totally & I'll happily spend the time trying to review that work.
> > >=20
> > > > I'll work on that later, but for now, this fix does what is
> > > > needed to work (from my testing at least). Any Tested-by on the Unm=
atched
> > > > and T-head boards is welcome!
> > > On 6.4-rc1 & v6.4-rc1 + this patch, with CONFIG_RELOCATABLE added to =
my
> > > config, my Nezha fails to boot. There is no output whatsoever from the
> > > kernel. Turning off CONFIG_RELOCATABLE boots again.
> > I don't know if this is better or worse news, but same thing happens on
> > an icicle kit. What systems, other than QEMU, has the relocatable
> > eries been tested with, btw?
>=20
>=20
> I tested it on the Unmatched (Andreas did too).

Cool. I cracked out my unmatched and it has the same issue as the
icicle. Ditto my Visionfive v2. Here's my config.
https://raw.githubusercontent.com/ConchuOD/riscv-env/dev/conf/defconfig

A ~default qemu virt doesn't work either. (-m 2G -smp 5)

> Very weird it does not work on the icicle kit, there is no errata for this
> soc, so what gets executed this early for this soc? Do you know where it
> fails to boot? If you can debug, you should break on the address of the
> entry point (usually 0x8020_0000) since this is the stvec address, so when
> you get a trap, you will branch there, and then could you dump $sepc, $ra
> and $stval when you get there?

> Regarding the thead issue, I think the following should fix it:

It did not :/

Cheers,
Conor.


--jODbkASVMwTCezVU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHHVTgAKCRB4tDGHoIJi
0m27AP9bIwI2RQkeOKos/BNDiKvKszT1wMJLWmbV6TKsXrd1kgEA5PTTkXBgM6OO
FsZqMgtJsC/sPnS1ikOmo/vfMb8tNgQ=
=A8Pn
-----END PGP SIGNATURE-----

--jODbkASVMwTCezVU--


--===============3896924096618875461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3896924096618875461==--

