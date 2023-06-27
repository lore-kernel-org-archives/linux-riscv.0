Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B764EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 21:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbVPHlmGDyWfvfSzNgKLPfZk0MjuCZDdLTX3MjKsMX4=; b=zCHoH9PrLAOm5sUip0wmOwdQjf
	1KescI1989DQdGn3VDI4cne/KaPale+3grXWnpSFznSLUPV5mCFsGcDRaekbtTMs2oO4fW0FQ6ju3
	5IZUVMiMbOiNbM+u94nZ3hWV8gPMyruHT5JVrprdboX6Omkf5n3JOC9DlrpqoCpV2dt7Fh5/ehcpk
	vk2oNu0ECXylFwfH3HDh3HlFsQa+i9SnKlWahwuKpAhmQhDAANdiJRVVdlr8ACyJMbyrT9ToVG2wx
	ysoGc3MHvgkLAtF6quYK/bH47rDzbIilm+lcmFM/HeKGxyHhCw7RHSpmzshIWYziATcY6rwxIwzPH
	c5Dhy+ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEFx0-00EAYg-1Z;
	Tue, 27 Jun 2023 21:10:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEFwy-00EAXj-0K
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 21:10:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8B30B60FD9;
	Tue, 27 Jun 2023 21:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2867C433C0;
	Tue, 27 Jun 2023 21:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687900211;
	bh=KSyaqdeyazGave2FEEoaPhxTSkgaMYMdBaB6B0YcnpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EIer1aekcKm5P14EuU7KW1WX/4J/CTm30pf2Mw2bH+L+XGNQ1wdPn5wQQ5CCg7yWe
	 5JLvwLI37LmH5Cl7kPaHK1NOfQACTNP6V/C8/OawzXScs8q6MDi66VwuzLpBwBYSOu
	 rxpDlYvDz3GwWsDsgSprc/vt/HWJssTJrVeLGYKufKzvcNxyiGWltNt32t6xXWtyqs
	 9kPFRAL4t/M8cG066m0ti/ZPXataVnFK2r+efgNqCzYYR+R0lqgIaqhtuwvBNe+4Rv
	 Qo0OjrjZSUDKSDPb6q4gbHRW6McDZDwM4W/lKRP832U9INP6KEkxRax6erJ+sFGrC1
	 ytwOsrLj7wfaA==
Date: Tue, 27 Jun 2023 22:10:06 +0100
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
	.konstantin@linuxfoundation.org
Subject: Re: [PATCH 0/2] Restrict address space for sv39,sv48,sv57
Message-ID: <20230627-john-spree-0f82769618c5@spud>
References: <20230626183611.40479-1-charlie@rivosinc.com>
 <20230627-eternity-mulberry-e1f4babf06a1@spud>
 <CA+7dDtKARX35pcgdKopuM6c8oj+TKLRhXcF0+d4MZE51V7Bifg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+7dDtKARX35pcgdKopuM6c8oj+TKLRhXcF0+d4MZE51V7Bifg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_141012_237788_D4259734 
X-CRM114-Status: GOOD (  27.96  )
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
Content-Type: multipart/mixed; boundary="===============4870321520450282567=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4870321520450282567==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g2C1m2/qKd6bfPLL"
Content-Disposition: inline


--g2C1m2/qKd6bfPLL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 27, 2023 at 01:44:18PM -0700, Charles Jenkins wrote:

- all the random CCs

> On Tue, Jun 27, 2023 at 11:24=E2=80=AFAM Conor Dooley <conor@kernel.org> =
wrote:
> > On Mon, Jun 26, 2023 at 11:36:02AM -0700, Charlie Jenkins wrote:
> > > Make sv39 the default address space for mmap as some applications
> > > currently depend on this assumption. The RISC-V specification enforces
> > > that bits outside of the virtual address range are not used, so
> > > restricting the size of the default address space as such should be
> > > temporary. A hint address passed to mmap will cause the largest addre=
ss
> > > space that fits entirely into the hint to be used. If the hint is less
> > > than or equal to 1<<38, a 39-bit address will be used. After an addre=
ss
> > > space is completely full, the next smallest address space will be use=
d.
> > >=20
> > > Documentation is also added to the RISC-V virtual memory section to  =
explain
> > > these changes.
> >
> > I don't know what went wrong here, but this never ended up in patchwork
> > for some reason, although it has appeared on lore. That seems to be via
> > the docs mailing list, rather than linux-riscv. Could you speak to Atish
> > and see if he knows what went wrong?

> I talked to Atish, he's not sure what's going on here either. I am going
> to add him to the CC list.

Atish is the one with admin for the list, I figured he'd be able to tell
if it got bounced properly. If it got bounced correctly, but didn't
arrive in patchwork then I don't know.

Usually when a bunch of lists are CCed, multiple entries show up on
lore, afair. In this case, a bunch of lists were CCed, but only the one
via linux-doc appeared on lore.

Konstantin, any ideas?

Cheers,
Conor.


--g2C1m2/qKd6bfPLL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJtQLgAKCRB4tDGHoIJi
0ljlAP9ROA9DCAsi1yLcXbPjuQnORcX/RtbUyCNB0Gi9w2i8jwD/f/6mcf3A2K2t
XVvq6B8GF69YUvsCQtNH1XZ9vdX8Hwo=
=VtGo
-----END PGP SIGNATURE-----

--g2C1m2/qKd6bfPLL--


--===============4870321520450282567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4870321520450282567==--

