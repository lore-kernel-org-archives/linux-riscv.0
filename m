Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1E1E77188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 10:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+4HNCznmdEnNurUx4vmYtezBRtMmIAm748WLlS5frg=; b=y98T80pTZ7DRr/GdouW10Tw6eD
	CKOl0+P3tfQfNdIeBDRUwZZE/kUXWbJv7GRno+buXVbnWV6VBayz2XWDBd6caHVu2a2VmEV94yioI
	RqXA/WieVWAjRY5PkWMwktp7Q2celrBqMiPx5l0EiOniHWdnNI/sWD6zxDzt1zxMYuXtoUzbkyqwK
	SbCBLe1X+8HBuMkFUI7lZwvPqYVYCJQzlvlqBH2fDnVLEVDNTr5Hhm6D6VCmyD1eaE7vsekCOmJZO
	oVWdQv4MhzJiIt9rq+GZhrXMVKcV9hL57dZAkbYMDbHjaX7CCP7P3jayJBZVHOLOGoF2GixHi2HSx
	zg2ca6hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeIa-000000087cf-1o1C;
	Tue, 14 Jan 2025 10:37:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeFK-000000086z5-02JQ;
	Tue, 14 Jan 2025 10:34:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9EE47A40C72;
	Tue, 14 Jan 2025 10:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 310DFC4CEE0;
	Tue, 14 Jan 2025 10:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736850844;
	bh=PPBTXcmZ9FTKLOavDTSaaCxS+I83L8XKDLxpo1k4qF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AxTH1TVOByRyemy5vzP15NHxHuJlYlyl1hQLGDalk4R7LH2WyA/2gx/XtNbKHP6IE
	 BdijOVzI31N04UC33BwkWxuWMPpjOqJk4YPBcZWpHmsEzVSlAn6n8H3SvPSKjRt4Km
	 MmpAYcYGmR2n+9td9dyxGX+GBgzUR73o9ZemtBsDbfqnix+wupk/YAt26zv5Z/Nt2Q
	 YW8X2WGphjiIh5L1lDgafPSMz5AIFm6Q1aPh8ln+BKEZNUtlb11WMWugcnXi6M0GO3
	 AVtW7Uph3adO04TefpnPeJyGrUuc2ovvVgVBTVrDhbVONzJzNVIc1qvOPiQR3KVK67
	 Hr4Mh5R5VIq3w==
Date: Tue, 14 Jan 2025 10:33:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Russell King <linux@armlinux.org.uk>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>,
	Guo Ren <guoren@kernel.org>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org,
	Nam Cao <namcao@linutronix.de>, linux-csky@vger.kernel.org
Subject: Re: [PATCH v2 09/18] riscv: vdso: Switch to generic storage
 implementation
Message-ID: <20250114-lustily-nuttiness-3bb7646515d5@spud>
References: <20250110-vdso-store-rng-v2-0-350c9179bbf1@linutronix.de>
 <20250110-vdso-store-rng-v2-9-350c9179bbf1@linutronix.de>
 <20250113-kissable-monstrous-aace0cf7182e@spud>
 <20250114093609-6cb25835-f912-4f64-9ba7-54c67d4e2904@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <20250114093609-6cb25835-f912-4f64-9ba7-54c67d4e2904@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_023406_166428_92EF0A18 
X-CRM114-Status: GOOD (  17.82  )
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
Content-Type: multipart/mixed; boundary="===============5862585921126449640=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5862585921126449640==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jwGvJ1ZaVXfjr5LT"
Content-Disposition: inline


--jwGvJ1ZaVXfjr5LT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 09:40:11AM +0100, Thomas Wei=DFschuh wrote:
> On Mon, Jan 13, 2025 at 07:48:15PM +0000, Conor Dooley wrote:
> > On Fri, Jan 10, 2025 at 04:23:48PM +0100, Thomas Wei=DFschuh wrote:
> > > The generic storage implementation provides the same features as the
> > > custom one. However it can be shared between architectures, making
> > > maintenance easier.
> > >=20
> > > Co-developed-by: Nam Cao <namcao@linutronix.de>
> > > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > > Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> >=20
> > For rv64, nommu:
> >   LD      vmlinux
> > ld.lld: error: undefined symbol: vmf_insert_pfn
> > >>> referenced by datastore.c
> > >>>               lib/vdso/datastore.o:(vvar_fault) in archive vmlinux.a
> >=20
> > ld.lld: error: undefined symbol: _install_special_mapping
> > >>> referenced by datastore.c
> > >>>               lib/vdso/datastore.o:(vdso_install_vvar_mapping) in a=
rchive vmlinux.a
> >=20
> > Later patches in the series don't make it build again.
> > rv32 builds now though, so thanks for fixing that.
>=20
> Thanks for the report.
> Can you try to diff below?

Ye, that resolved it. Thanks!

--jwGvJ1ZaVXfjr5LT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4Y9kQAKCRB4tDGHoIJi
0oHDAP9Da+NrCNJE56DtkPFciL+LH3SKSSwOWQ6oFB2bu8GWRQEA9RJt/Is3QV+w
+n+t05VKvIADKDk9hc4FHnNawF8GUgg=
=tDst
-----END PGP SIGNATURE-----

--jwGvJ1ZaVXfjr5LT--


--===============5862585921126449640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5862585921126449640==--

