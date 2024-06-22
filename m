Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E345EC27C53
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jun 2024 12:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhMwM7OwFpoXRA2g2AUNcVn+5mYqCvcWPez8HCEPJM0=; b=wfYvkH6/taGizMy30Qzn2basi6
	5WB9X9gyS5EuRZlAyBbjPyaLkaB+PtUPHDSJWRb+L0/pSyLfTCNgkEUcZ2lKk6oLdaiDJ7Ol8nOjv
	aXKo1H0zxu0hYTHIcpDknLrQnMdoIms5nIcD2n1mMNrh6GnVuy1MY5bJFk1xBZOKtVpK8hCUHoylK
	CdEl3aLVD0XcWz0YnA4wip14929NqKTYHK3kL3XbqzI1zMOuanHYWU9W0DtSxcnuCXU670pCKZWhQ
	VJKUZjZZaucVsvXpKws7Gdze6qdX5uMEZ6ZHZWcg+UDliPhrJcX+AN3UNdXkM6A5zdk1P8rBOfc5i
	UDyFKlHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKzR9-0000000C1Gj-3oSj;
	Sat, 22 Jun 2024 12:01:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKzR6-0000000C1Ej-0Hwo;
	Sat, 22 Jun 2024 12:01:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3D2D6CE069B;
	Sat, 22 Jun 2024 12:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FC5C3277B;
	Sat, 22 Jun 2024 12:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719057695;
	bh=4IxETGVg4/bc2jI5lLzgI9phYpsgH2CfHaJhgcXMNNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CWaCrU20NmFrhv6fqL/qkygH4JAUO+yFKNXsfDcsn8YVtQwHKMpnzvSgUL42gzMw8
	 b9/0E3260B7BoLTOVfteBcG5GSp/r9EyCKp2jGjTJR3PsV6z72mAAZwDiLHVyTXSck
	 roeyXDyEv3JSguVA/7Y5gs4GEijb0XRfhT7m+egXGEfPh3MTf1/M11Hq7du9vowcfM
	 3PcNurM9jRoV9lTnqr8IaKHpBieoaCcodDWTk4KHjE6pLF6C2bBshrpWMlTcncfITL
	 D7nq/FipswdGKwtnj/EbcoF36LV7GN1u9w9Lpo+sCNBOjqGwa+NaKeZYZwx28oFt3J
	 9TnNnYdNoaZYw==
Date: Sat, 22 Jun 2024 13:01:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	greentime.hu@sifive.com, vincent.chen@sifive.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
Message-ID: <20240622-stride-unworn-6e3270a326e5@spud>
References: <20240605-atrium-neuron-c2512b34d3da@spud>
 <CAK9=C2XH7-RdVpojX8GNW-WFTyChW=sTOWs8_kHgsjiFYwzg+g@mail.gmail.com>
 <40a7d568-3855-48fb-a73c-339e1790f12f@ghiti.fr>
 <20240621-viewless-mural-f5992a247992@wendy>
 <edcd3957-0720-4ab4-bdda-58752304a53a@ghiti.fr>
 <20240621-9bf9365533a2f8f97cbf1f5e@orel>
 <20240621-glutton-platonic-2ec41021b81b@spud>
 <20240621-a56e848050ebbf1f7394e51f@orel>
 <20240621-surging-flounder-58a653747e1d@spud>
 <20240621-8422c24612ae40600f349f7c@orel>
MIME-Version: 1.0
In-Reply-To: <20240621-8422c24612ae40600f349f7c@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_050140_492006_17E1B6C5 
X-CRM114-Status: GOOD (  35.34  )
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
Content-Type: multipart/mixed; boundary="===============0998455123981594909=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0998455123981594909==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZMOCsO9fyo4yCpOo"
Content-Disposition: inline


--ZMOCsO9fyo4yCpOo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 05:08:01PM +0200, Andrew Jones wrote:
> On Fri, Jun 21, 2024 at 03:58:18PM GMT, Conor Dooley wrote:
> > On Fri, Jun 21, 2024 at 04:52:09PM +0200, Andrew Jones wrote:
> > > On Fri, Jun 21, 2024 at 03:04:47PM GMT, Conor Dooley wrote:
> > > > On Fri, Jun 21, 2024 at 03:15:10PM +0200, Andrew Jones wrote:
> > > > > On Fri, Jun 21, 2024 at 02:42:15PM GMT, Alexandre Ghiti wrote:
> >=20
> > > > > I understand the concern; old SBI implementations will leave svad=
u in the
> > > > > DT but not actually enable it. Then, since svade may not be in th=
e DT if
> > > > > the platform doesn't support it or it was left out on purpose, Li=
nux will
> > > > > only see svadu and get unexpected exceptions. This is something w=
e could
> > > > > force easily with QEMU and an SBI implementation which doesn't do=
 anything
> > > > > for svadu. I hope vendors of real platforms, which typically prov=
ide their
> > > > > own firmware and DTs, would get this right, though, especially si=
nce Linux
> > > > > should fail fast in their testing when they get it wrong.
> > > >=20
> > > > I'll admit, I wasn't really thinking here about something like QEMU=
 that
> > > > puts extensions into the dtb before their exact meanings are decided
> > > > upon. I almost only ever think about "real" systems, and in those c=
ases
> > > > I would expect that if you can update the representation of the har=
dware
> > > > provided to (or by the firmware to Linux) with new properties, then=
 updating
> > > > the firmware itself should be possible.
> > > >=20
> > > > Does QEMU have the this exact problem at the moment? I know it puts
> > > > Svadu in the max cpu, but does it enable the behaviour by default, =
even
> > > > without the SBI implementation asking for it?
> > >=20
> > > Yes, because QEMU has done hardware A/D updating since it first start=
ed
> > > supporting riscv, which means it did svadu when neither svadu nor sva=
de
> > > were in the DT. The "fix" for that was to ensure we have svadu and !s=
vade
> > > by default, which means we've perfectly realized Alexandre's concern.=
=2E.
> > > We should be able to change the named cpu types that don't support sv=
adu
> > > to only have svade in their DTs, since that would actually be fixing =
those
> > > cpu types, but we'll need to discuss how to proceed with the generic =
cpu
> > > types like 'max'.
> >=20
> > Correct me please, since I think I am misunderstanding: At the moment
> > QEMU does A/D updating whether or not the SBI implantation asks for it,
> > with the max CPU. The SBI implementation doesn't understand Svadu and
> > won't strip it. The kernel will get a DT with Svadu in it, but Svadu wi=
ll
> > be enabled, so it is not a problem.
>=20
> Oh, of course you're right! I managed to reverse things some odd number of
> times (more than once!) in my head and ended up backwards...

I mean, I've been really confused about this whole thing the entire
time, so ye..

Speaking of QEMU, what happens if I try to turn on svade and svadu in
QEMU? It looks like there's some handling of it that does things
conditionally based !svade && svade, but I couldn't tell if it would do
what we are describing in this thread.

--ZMOCsO9fyo4yCpOo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZna9GgAKCRB4tDGHoIJi
0h3EAQCEzS530QLTXXBLPksl2mQ8sX+WkbvTcdwou3zq2avSrgEA6hNFxVSOme2f
3YECDPsNJ8996blTH6mu6XZ5ht3fRAg=
=pKba
-----END PGP SIGNATURE-----

--ZMOCsO9fyo4yCpOo--


--===============0998455123981594909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0998455123981594909==--

