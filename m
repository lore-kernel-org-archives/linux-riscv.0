Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77E5C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 07:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IeR4gMfnMnIIM9aifuf5HkFQfFTuQtfZGP0aAxuKeTg=; b=p2LNLAmKp1Rb6myaxnXwOt3jxy
	ekLGZDCfWAUoaDy7zNH5VHOVTu6UMs9iTH4KjYXatllqBvdW9T0hv8AZiWIrfjJo8pCm91oViKjVj
	l8VCwj/m1GSF2tcresd5OVVpvplZJeX5mzBXdGjrZGY7Y5M7zDS0DxC0z8uap73fH78V0IdkZ2QvC
	40x8WpkxhjGfzDn+eMZvsa5+u/f/RUcIEmThBZXxXMIl8zb3NCbGztP+kCCGYFh/a9w4A6B1kMTau
	0aXio275V56mUnlCDxRzXMhWP4rJ3prMhHPb537X0wp/nd5i8WESQC99zTxaw1VXFAlw3uhzKo/3G
	pIXEDWCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pet9t-00F2km-0V;
	Wed, 22 Mar 2023 07:45:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pet9p-00F2io-2k
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 07:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679471118; x=1711007118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RYefIU0H1tV7oRs3iK9qN/VFbE6LPVzSiwMg5YgkybQ=;
  b=kUqVFxuwqGrFRogfn8xA7HewFgQSM/vJvwl8A6Akxf/3O0tIjeN8csiN
   8VkoBdfv+dQ3xAG3EElYludChOfj9zbOQMHtbgI6yljitDpdVWQHMSAyD
   e9RcNgB+oHZ1CbpReUbIOEPMTpWOFb895VDv7bMopmyL97uOPeu+BwM19
   jtAuKXGZd55bNsozReXNMqBhv4YcW2bTf6h3oEzdr/Uz1wACQvQ3O2pIr
   D3PtmQJslLMRT8rnDGq3P4hmc0rg3IF/1J3sIXSF0Usr9fwO0sO/2RaTj
   WM3XCOzPPqjPiC57Lzndrvu0n8j6HQfxbdiOLtEGeb+ElrtyucMWoQXoS
   w==;
X-IronPort-AV: E=Sophos;i="5.98,281,1673938800"; 
   d="asc'?scan'208";a="202832350"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Mar 2023 00:45:09 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 00:45:08 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 22 Mar 2023 00:45:06 -0700
Date: Wed, 22 Mar 2023 07:56:18 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
CC: Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo
 Ren <guoren@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/6] Deduplicating RISCV cmpxchg.h macros
Message-ID: <76e39a0e-1ca9-435a-82b5-6655579cef9a@spud>
References: <20230318080059.1109286-1-leobras@redhat.com>
 <8f698f49-135a-4263-8471-96f406919cb1@spud>
 <4f35f41c143b02b6b815e7eb527ca3acd8b4aabe.camel@redhat.com>
 <18e07d0a-7e21-46d0-9166-6ee07817352a@spud>
 <CAJ6HWG5zHMB1-vVsuQ+nG3EC12JAi2MP5o8GbSQ9QJfgLEQNnw@mail.gmail.com>
 <4d9770c7-3cb6-42d6-891f-1247a02742e9@spud>
 <CAJ6HWG5+5f_z7HaVb70w4wxtTbyMMxwTAwpk5gv4C4JiSve5iA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG5+5f_z7HaVb70w4wxtTbyMMxwTAwpk5gv4C4JiSve5iA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_004518_043596_C0A0A44B 
X-CRM114-Status: GOOD (  32.11  )
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
Content-Type: multipart/mixed; boundary="===============0908999099692155350=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0908999099692155350==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zA6GcOdC/jSQ4LTZ"
Content-Disposition: inline

--zA6GcOdC/jSQ4LTZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 12:42:56AM -0300, Leonardo Bras Soares Passos wrote:
> On Tue, Mar 21, 2023 at 4:48=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> > On Tue, Mar 21, 2023 at 02:01:59PM -0300, Leonardo Bras Soares Passos w=
rote:
> > > On Tue, Mar 21, 2023 at 4:49=E2=80=AFAM Conor Dooley <conor.dooley@mi=
crochip.com> wrote:
> > > > On Tue, Mar 21, 2023 at 03:30:35AM -0300, Leonardo Br=C3=A1s wrote:

> > > > > For patch 5/6 it actually adds many more lines, but tracking (som=
e of) the
> > > > > errors gave me no idea why.
> > > >
> > > > Probably just sparse being unhappy with some way the macros were
> > > > changed - but some of it ("Should it be static?" bits) look very mu=
ch
> > > > like the patch causing things to be rebuilt only for the "after the
> > > > patch" build, but somehow not for the "before" build.
> > >
> > > Humm, not sure I could understand that last part:
> > > What I get is that the patch 5/6 is causing things to be rebuilt, and
> > > it was not like that on 1-4/6.
> > > Is that what you said?
> > > If so, and you are doing it as an incremental build, changing the
> > > macros in 5/6 should be triggering rebuilds, but it does not make
> > > sense to not be rebuilt in 1-4/6 as they change the same macros.
> >
> > Right, it is an incremental build.
> > First it builds the tree with a patch applied, then it checks out HEAD~1
> > and builds that tree. Then it goes back to the tree with the patch
> > applied and builds it again. The output from builds 2 & 3 are compared
> > to see if any errors snuck in.
> > In theory, that should ensure that, as builds 2 & 3 have had the same
> > diff to the previous one just in opposite directions, the same files get
> > rebuilt - but I am a little worried that ccache gets involved sometimes
> > and leads to the before/after builds not being exactly the same.
>=20
> Makes sense to me.

Oh, the other thing that I didn't notice until now is that, if, as
in your case, HEAD~1 for the patch currently being tested does not build
but the HEAD build does, the HEAD build will have more sparse coverage
than the HEAD~1 one. Cos of that, sparse is likely to find more issues in
the after build, and you end up with +1000 error count like patch 5 in
the v1.
If you look at your most recent version, that doesn't have build issues,
patch 5 gets the all-clear:
https://patchwork.kernel.org/project/linux-riscv/list/?series=3D732217

Not sure why I didn't notice that before, I completely forgot that 4/6
had build issues and it should've been immediately obvious to me why 5/6
had a bunch of extra sparse warnings...


--zA6GcOdC/jSQ4LTZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBq0ngAKCRB4tDGHoIJi
0glZAQCLTV6fmIThzea60AfrZGhW2ChbeyHWwHwcml5KyOItzwEAt6XoV0kTQhDk
ocbElrRZ1d8ZR65TbcjJCvk3ur1adgU=
=u33Y
-----END PGP SIGNATURE-----

--zA6GcOdC/jSQ4LTZ--


--===============0908999099692155350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0908999099692155350==--

