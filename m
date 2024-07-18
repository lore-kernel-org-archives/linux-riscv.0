Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F071AC3DA60
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 08:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRRsjl+TD9l/2pbVeo8Y7n1a+mOz7nRGcA86isRHK7A=; b=KDDAZ1gWhxqahubfcuPFHgFawV
	bCRCaJ/ZehT9L3uYyaEPc59gvubqLqDftD9nPM05YLxIB8vDE0yiwZSm+0TnXjM7I2b3XldfHK0Jd
	2KL8M2v73AcuuU3ls0Glb6Ke67Oo/3MlcACpfvTkWIKiEElhQTzt+SEGZju2MLKHAo55FkHBujiEQ
	oWe30dSHh6dqCAGskyk90CoSHl+HVQRPYm6JLYBBS7CSvI1pkqCWdBAIPtwFuj8sE7vZ0M5eR7nt/
	AdNtY6LtdmZnxC/lD1YzYWWFZucxtB9Bi19N9a21E0cAfqc5gqyFA4hbihf9xXsP+swxhjddIMhmP
	rN/edwyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUMaL-0000000GOyb-2o0I;
	Thu, 18 Jul 2024 08:33:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUMaI-0000000GOxP-2orx
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 08:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721291635; x=1752827635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gNIXVaNizqBLHCwLfM/UtwzkXFHA9hFNWND1AHtlbIM=;
  b=c4Rnyl9j5zQKjgdG0Qk9GDaPHvkBSRu7V6qFysehCBkhfhjG16Z5NTSP
   7m1PkB/RHMqqjjA5DZPv2OQiu6A63n5d4gj+ckEF8/3RhQ4eprqEZYS3y
   NoWQXKdPogBwa5YCX9dPZ0Tc6mH7HK0SeVdBjlS0cUjWluVe1HoUVCts6
   spbMD4wpmWVqx0A5A1/y84GWcFkLiKk3fa4v1Dk6W5UCYggIWtQzkUhBu
   +2eskH8+O2dW9vy5KbyjksSwhrHTjgGbK2ZXJdW0vLTQNJq7jM081zENe
   HubP4LZ9lFL5ooyocufJ1aQnxip7y156J8kBITmHTZUNIR7tHmVkkeUe3
   A==;
X-CSE-ConnectionGUID: X6g/KyPBTa2lRsaYzZqfLg==
X-CSE-MsgGUID: rYjAUFt2TkiUexP5qeRCzg==
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="asc'?scan'208";a="29395240"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Jul 2024 01:33:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jul 2024 01:33:44 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 18 Jul 2024 01:33:40 -0700
Date: Thu, 18 Jul 2024 09:33:17 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: Andrew Jones <ajones@ventanamicro.com>, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, Nathan
 Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo
 Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long
	<longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann
	<arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>, Guo Ren
	<guoren@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-arch@vger.kernel.org>
Subject: Re: [PATCH v3 05/11] riscv: Implement arch_cmpxchg128() using Zacas
Message-ID: <20240718-stammer-envy-f77637a8d039@wendy>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
 <20240717061957.140712-6-alexghiti@rivosinc.com>
 <20240717-94b49fbac3c6bf97a0f96281@orel>
 <CAHVXubi33T-5y9g1cqa+meM7q7b=0M54o+wrBeYmwfYpWAgAmQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHVXubi33T-5y9g1cqa+meM7q7b=0M54o+wrBeYmwfYpWAgAmQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_013354_858105_D3B519A2 
X-CRM114-Status: GOOD (  12.48  )
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
Content-Type: multipart/mixed; boundary="===============6885256276574175946=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6885256276574175946==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MBWKTf+6psjxKZC0"
Content-Disposition: inline

--MBWKTf+6psjxKZC0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 09:48:42AM +0200, Alexandre Ghiti wrote:
> On Wed, Jul 17, 2024 at 10:34=E2=80=AFPM Andrew Jones <ajones@ventanamicr=
o.com> wrote:
> > On Wed, Jul 17, 2024 at 08:19:51AM GMT, Alexandre Ghiti wrote:
> > > +
> > > +union __u128_halves {
> > > +     u128 full;
> > > +     struct {
> > > +             u64 low, high;
> >
> > Should we consider big endian too?
>=20
> Should we care about big endian? We don't deal with big endian
> anywhere in our kernel right now.

There's one or two places I think that we do actually have some
conditional stuff for BE. The Zbb string routines I believe is one such
place, and maybe there are one or two others. In general I'm not of the
opinion that it is worth adding complexity for BE until there's
linux-capable hardware that supports it (so not QEMU or people's toy
implementations), unless it's something that userspace is able to see.


--MBWKTf+6psjxKZC0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpjTTQAKCRB4tDGHoIJi
0rIEAQCcKgEg+YAkD5rI1kB21pebJiN0tYXyWkBOBx4nlblfvQEA9BuEuGmfgArr
DZeMwbib+Suf9yhP4wp95mVBoRW2GAM=
=Lsk5
-----END PGP SIGNATURE-----

--MBWKTf+6psjxKZC0--


--===============6885256276574175946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6885256276574175946==--

