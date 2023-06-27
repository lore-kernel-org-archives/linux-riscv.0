Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370CEEB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 21:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vb7ctiiwBfQJ8FfxdZ12g+LXcZU53SGqRiHno1ogFsk=; b=QFKBvwV4Qvd2H3upgrhbenk+rm
	tNhJEgROhb2Tm35TRWrgmmkZO/KmoX4Cz3YFWlBuByPrJcOsX8dXvjvx8oxMkPpsOzkMfWSW3RuCF
	sNVCzf1YqNOeTnWI8m0GLlltFKp0aaMx2TUpdL8RQLDMM/1bluQ+6tf77uJG0FAYUL4MF/I3MCohx
	SxqWi2Iq6er/5TyPkdkygvnbBt3xdQew+VibunulneMbX2NGF09AVEiPpQMPP/KoKXA4BbRYaSxQc
	NQkY5LJdXk/Mb1AGNqQaSq2KI3N4lDHCfSxpgWd/049m+G/wLq+1BebeqT4c5jBS6GADAdS32BiSQ
	Wq2aciUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEFyp-00EAtw-36;
	Tue, 27 Jun 2023 21:12:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEFyn-00EAtN-0j
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 21:12:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B81E86121E;
	Tue, 27 Jun 2023 21:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B49C433B9;
	Tue, 27 Jun 2023 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687900324;
	bh=rz9p6s2llZuZ5L0U+OVMBKy8YtDgWTN+KEzRig12SfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OhX/ckWX/Quj0rbI+6jnmUMZ3wlBVLSS6tTeTiQbtntrM6m7LAh/tQYFaEZmQuXw+
	 K8GJzHku+Ac65wkuBZNGQEsuLuW9M1R/OEUDQupbDIaBvb8QYXJ5slLpxSRBqmZYTf
	 5t5I+N7n/ne8A/ln07ed3kFw9ESZrbTZhYTcdlsKvqU2Zot4Ywa6zJ6MmTDkzrOZ4+
	 5nCHijfjugzmzDYZ6gd8Z3Y6RHyhehTGFJzN+sxuCblGwl+TPHKbDKm1tKtnnGLcog
	 2mSO990xqCm92zAnNTXXSeBftkIswyzwb35ouGGKdE23128Z7Ea0FgWdHe9Xa4MR4a
	 Fn30vH+JUFWdw==
Date: Tue, 27 Jun 2023 22:11:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Charles Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>, Evan Green <evan@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH 0/2] Restrict address space for sv39,sv48,sv57
Message-ID: <20230627-paddle-chatter-257a9885722a@spud>
References: <20230626183611.40479-1-charlie@rivosinc.com>
 <20230627-eternity-mulberry-e1f4babf06a1@spud>
 <CA+7dDtKARX35pcgdKopuM6c8oj+TKLRhXcF0+d4MZE51V7Bifg@mail.gmail.com>
 <20230627-john-spree-0f82769618c5@spud>
MIME-Version: 1.0
In-Reply-To: <20230627-john-spree-0f82769618c5@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_141205_342517_2F03A555 
X-CRM114-Status: GOOD (  31.16  )
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
Content-Type: multipart/mixed; boundary="===============6811783486680425468=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6811783486680425468==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GAuc1YNtBNm+/mSm"
Content-Disposition: inline


--GAuc1YNtBNm+/mSm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 27, 2023 at 10:10:06PM +0100, Conor Dooley wrote:
> On Tue, Jun 27, 2023 at 01:44:18PM -0700, Charles Jenkins wrote:
>=20
> - all the random CCs

And without ballsing up Konstantin's address....

>=20
> > On Tue, Jun 27, 2023 at 11:24=E2=80=AFAM Conor Dooley <conor@kernel.org=
> wrote:
> > > On Mon, Jun 26, 2023 at 11:36:02AM -0700, Charlie Jenkins wrote:
> > > > Make sv39 the default address space for mmap as some applications
> > > > currently depend on this assumption. The RISC-V specification enfor=
ces
> > > > that bits outside of the virtual address range are not used, so
> > > > restricting the size of the default address space as such should be
> > > > temporary. A hint address passed to mmap will cause the largest add=
ress
> > > > space that fits entirely into the hint to be used. If the hint is l=
ess
> > > > than or equal to 1<<38, a 39-bit address will be used. After an add=
ress
> > > > space is completely full, the next smallest address space will be u=
sed.
> > > >=20
> > > > Documentation is also added to the RISC-V virtual memory section to=
  explain
> > > > these changes.
> > >
> > > I don't know what went wrong here, but this never ended up in patchwo=
rk
> > > for some reason, although it has appeared on lore. That seems to be v=
ia
> > > the docs mailing list, rather than linux-riscv. Could you speak to At=
ish
> > > and see if he knows what went wrong?
>=20
> > I talked to Atish, he's not sure what's going on here either. I am going
> > to add him to the CC list.
>=20
> Atish is the one with admin for the list, I figured he'd be able to tell
> if it got bounced properly. If it got bounced correctly, but didn't
> arrive in patchwork then I don't know.
>=20
> Usually when a bunch of lists are CCed, multiple entries show up on
> lore, afair. In this case, a bunch of lists were CCed, but only the one
> via linux-doc appeared on lore.
>=20
> Konstantin, any ideas?
>=20
> Cheers,
> Conor.
>=20



> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


--GAuc1YNtBNm+/mSm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJtQnwAKCRB4tDGHoIJi
0jANAP44Ahk9xz39EKWWwzKYjA1X63+8tz+zb44ekr9eUb3fnwEA7ujXUB7scUze
alagvNCqoLPIB4aQhEYIkZLzGzGP3gE=
=rNxv
-----END PGP SIGNATURE-----

--GAuc1YNtBNm+/mSm--


--===============6811783486680425468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6811783486680425468==--

