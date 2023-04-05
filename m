Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F7EC7619A
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 09:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhvkN7Fj4gM3qfKH7lb9iZpkx2f0SPEB/fGxt3UNLQI=; b=RhaN3FGNfxC6gqAODq24DjUjIW
	3407Aqry1rY/lfh7s17zgwK4oFS/DJkh4qmeaglJv0VIrWSUnu3vJjrsNlI3XhhWpQoYdIV5ud4ie
	JkRRETUTJeOjJpxQZgP1zbRy2g56EU/gHdrfv47DoJlyYplN3hLTzLj0+dyHyQAjglUPQMhQm7ALJ
	QUyLGzoM4RaRLLld/zCY9XAIXu5qns2P73KJ0Ac8kyI7xwOHR8okM6kNMR2h4l7F0iZCp3z9HhOLu
	VlyOczpZmB9o8TK5yJaHTs38dF3fKqd5vQcnTDG7Rn1H4MX6xgEq68wTM8L6s4ZrPAOrFdDA5XXrr
	4lKG3spw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjzRK-003x5r-1e;
	Wed, 05 Apr 2023 09:28:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjzRI-003x4c-0F;
	Wed, 05 Apr 2023 09:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680686904; x=1712222904;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aLX6+vqdQNVvF14fetM/8YAe4WRk9gZuo75cuAymbAw=;
  b=Cju6itZ1jp+y6+sa9qL3cL2YfA+iSXdHWYao+pCHENuhi111s/bpwCnG
   nhhu80pbJfjZZQtX7HtK8DJ9BtaZgNrJssoCije7uu+g7571iemIRjaZ+
   kH4MESHrPKmUi9jcAa8aZ2phf5LGCcNWqlQOZa+JoEyXmuYtOcqPxZ/7X
   kPdWxR5SeKrJ1dNvB2Lvz45Z6TCFP4O2Jg/bYjOkNSsIrSedDSHZPWfXU
   N+yc7dy7czlodbI9dKolcKQqLfU8di2grCZ3RsrzaidDWD8CUnW8aYZSZ
   G7HfC/USOj6xT1vIY8bv5DZcLRy9t9UpBY8Q0xzuzG42wmt4rYgHDG7+w
   g==;
X-IronPort-AV: E=Sophos;i="5.98,319,1673938800"; 
   d="asc'?scan'208";a="219516254"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2023 02:28:20 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 02:28:19 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 5 Apr 2023 02:28:17 -0700
Date: Wed, 5 Apr 2023 10:28:03 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Anup Patel <anup@brainfault.org>, Anup Patel <apatel@ventanamicro.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, <kvm@vger.kernel.org>,
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <bjorn@kernel.org>
Subject: Re: [PATCH v3 6/8] RISC-V: KVM: Add ONE_REG interface for AIA CSRs
Message-ID: <20230405-icon-arrogance-62bf7d627a5d@wendy>
References: <20230403093310.2271142-1-apatel@ventanamicro.com>
 <20230403093310.2271142-7-apatel@ventanamicro.com>
 <osrpjiywxtkgxb5i6mfvxzfrzrnjv75uqzvlu3fouo4mqsktgj@blcmyjt3twqg>
 <CAAhSdy1JEQBiO55iCy97arO63VjGc+NicUvvwzTpK97W97LmJg@mail.gmail.com>
 <ejt3x4p7xhxfvwiafnogfwdn5dzd4qyowlht22utnbvzefsbyh@7dch4mebwckm>
 <uogikq56rf7jytuufhsutdedb73b3rh67biwpzsz6ngg5rudco@qcwt7plumwpb>
 <20230404-5cfffb017198773dc3e81dab@wendy>
MIME-Version: 1.0
In-Reply-To: <20230404-5cfffb017198773dc3e81dab@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_022824_180071_C6BC8B5E 
X-CRM114-Status: GOOD (  19.61  )
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
Content-Type: multipart/mixed; boundary="===============7848492146937493420=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7848492146937493420==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6/ymYoyceqNd1+G4"
Content-Disposition: inline

--6/ymYoyceqNd1+G4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2023 at 12:58:41PM +0100, Conor Dooley wrote:
> On Tue, Apr 04, 2023 at 01:52:43PM +0200, Andrew Jones wrote:
> > On Mon, Apr 03, 2023 at 02:23:01PM +0200, Andrew Jones wrote:
>=20
> > > It's probably best if neither depend on each other, since they're
> > > independent, but otherwise the order doesn't matter. It'd be nice to =
call
> > > the order out in the cover letter to give patchwork a chance at autom=
atic
> > > build testing, though. To call it out, I believe adding
> > >=20
> > > Based-on: 20230401112730.2105240-1-apatel@ventanamicro.com
> > >=20
> > > to the cover letter should work.
> >=20
> > I also just noticed that this based on "RISC-V: KVM: Add ONE_REG
> > interface to enable/disable SBI extensions"[1] and it needs to be
> > in order to pick up the KVM_REG_RISCV_SUBTYPE_MASK and
> > KVM_REG_RISCV_SUBTYPE_SHIFT defines. It'd be good to call that
> > patch out with Based-on.
> >=20
> > [1]: 20230331174542.2067560-2-apatel@ventanamicro.com
>=20
> I've been waiting for a review on that for a while.. It's been 3
> weeks, so just gonna merge it and see what breaks!

I did in fact break some stuff, but the output was no worse than if the
dependencies had not been specified...
I've fixed it (I think!) and told it to ignore the old state, so it'll
re-run against the stuff it missed.

Cheers,
Conor.

--6/ymYoyceqNd1+G4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZC0/IwAKCRB4tDGHoIJi
0llzAQD7CVUsawsm7wpvaamyFV3X2C65V7xha05w4L4rhlmyWAEAr3QHqpnSd9Pd
JL27yJCJfcvHvC6TY2wuWqeH5ArIAAk=
=jbmg
-----END PGP SIGNATURE-----

--6/ymYoyceqNd1+G4--


--===============7848492146937493420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7848492146937493420==--

