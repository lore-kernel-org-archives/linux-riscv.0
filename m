Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621CAECE579
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 12:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuLrcLUgZPoeWE1lmLJ9kWZ85sawALGs9ia78QyWGfw=; b=z5OeVaZ9+4rLJlrGRS8UvA/Nrv
	gGUQfSTL6iPwcDpv8WEtJqFs6A7fSN2rlTX9ifdgYNFwXJSCI7BxA8y5yMNVy958+G+FtBVVcQ3ND
	UODMPIOXJXLLLIilkjIDSviTNku0stq69pSfhoZ7VN4Vb3vLLgm0mN3WMVRxbv15K2YQF12cInOPX
	0vmMIq/U5W2J+ZPT9uACPU/Q39PZ68RQxs4lpUCAq1LFaPc1obtyy+T9WReGIgKCss2UVPdzLfL45
	PfngLBCcat+Uo+1GqA8d+B6gOzBrPBvAsNsJTbx+ZmtIySwZDVN5CGsh71mWWqy1oPUn7OI25weqH
	NGqh8hiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndme-00000001tQ2-05CJ;
	Mon, 09 Sep 2024 12:46:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncK7-00000001cke-0RYH
	for linux-riscv@lists.infradead.org;
	Mon, 09 Sep 2024 11:12:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1725880366; x=1757416366;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rphq9aNLGcRYY67zbP4cV/aEbsHnchoDgt15YmtpO3U=;
  b=RfoPcuCASy3wkxZGEU/pkSlKJXguoDCJMXzuJxvqQ3eiAr2b/ZGgyBEU
   VpeJvR3jLak78PwuTKB3crq1hmn9R0Pzro+UrK1Ix2wcfW4WXeTQaGJl/
   6MuhnJRTO3OheL4ia8b2VIPy5VJcynfh8+9HLTXDBBMm8SDJ3RZF8svdL
   QYoWsZ+7Lp62+IdXthgPHzYZIGFuoWcAnGJ+ox9QGCg8eaJEWVxNu/6uw
   A5k4iF5nuWzoKXC19/GzEhNv8fpCAlgLY6y9U+cR91j+nZ8s5vfoR9nnC
   h+I3nRFD0R2GsISLMF2CpmSr2jvuP0Wtd6r9Dc3Gjpkv1LadCYnk1Gulu
   A==;
X-CSE-ConnectionGUID: IudSk0JrThq49CLawqampQ==
X-CSE-MsgGUID: wtKLYQcGQ4qObFCcGnHyuA==
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="asc'?scan'208";a="34627609"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Sep 2024 04:12:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 9 Sep 2024 04:12:20 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 9 Sep 2024 04:12:19 -0700
Date: Mon, 9 Sep 2024 12:11:46 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Miquel =?iso-8859-1?Q?Sabat=E9_Sol=E0?= <mikisabate@gmail.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jesse@rivosinc.com>, <conor@kernel.org>
Subject: Re: [PATCH v2] riscv: hwprobe: export Zicntr and Zihpm extensions
Message-ID: <20240909-raving-reproach-74431f57896d@wendy>
References: <20240817075629.262318-1-mikisabate@gmail.com>
 <20240820044749.557349-1-mikisabate@gmail.com>
 <66d9605f.5d0a0220.3dabb6.3586@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <66d9605f.5d0a0220.3dabb6.3586@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_041247_174427_FEC986C4 
X-CRM114-Status: GOOD (  19.92  )
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
Content-Type: multipart/mixed; boundary="===============3320698961855031906=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3320698961855031906==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="S5iLkL5yVJmHWDnB"
Content-Disposition: inline

--S5iLkL5yVJmHWDnB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2024 at 09:40:14AM +0200, Miquel Sabat=C3=A9 Sol=C3=A0 wrot=
e:
> On dt., d=E2=80=99ag. 20 2024, Miquel Sabat=C3=A9 Sol=C3=A0 wrote:
>=20
> > Export Zicntr and Zihpm ISA extensions through the hwprobe syscall.
> >
> > Signed-off-by: Miquel Sabat=C3=A9 Sol=C3=A0 <mikisabate@gmail.com>
> > ---
> >  Documentation/arch/riscv/hwprobe.rst  | 6 ++++++
> >  arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
> >  arch/riscv/kernel/sys_hwprobe.c       | 2 ++
> >  3 files changed, 10 insertions(+)
> >
> > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/=
riscv/hwprobe.rst
> > index 3db60a0911df..cfd2929d0562 100644
> > --- a/Documentation/arch/riscv/hwprobe.rst
> > +++ b/Documentation/arch/riscv/hwprobe.rst
> > @@ -183,6 +183,9 @@ The following keys are defined:
> >         defined in the Atomic Compare-and-Swap (CAS) instructions manua=
l starting
> >         from commit 5059e0ca641c ("update to ratified").
> > =20
> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZICNTR`: The Zicntr extension version =
2.0
> > +       is supported as defined in the RISC-V ISA manual.
> > +
> >    * :c:macro:`RISCV_HWPROBE_EXT_ZICOND`: The Zicond extension is suppo=
rted as
> >         defined in the RISC-V Integer Conditional (Zicond) operations e=
xtension
> >         manual starting from commit 95cf1f9 ("Add changes requested by =
Ved
> > @@ -192,6 +195,9 @@ The following keys are defined:
> >         supported as defined in the RISC-V ISA manual starting from com=
mit
> >         d8ab5c78c207 ("Zihintpause is ratified").
> > =20
> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZIHPM`: The Zihpm extension version 2.0
> > +       is supported as defined in the RISC-V ISA manual.
> > +
> >    * :c:macro:`RISCV_HWPROBE_EXT_ZVE32X`: The Vector sub-extension Zve3=
2x is
> >      supported, as defined by version 1.0 of the RISC-V Vector extensio=
n manual.
> > =20
> > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include=
/uapi/asm/hwprobe.h
> > index b706c8e47b02..098a815b3fd4 100644
> > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > @@ -72,6 +72,8 @@ struct riscv_hwprobe {
> >  #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
> >  #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
> >  #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
> > +#define		RISCV_HWPROBE_EXT_ZICNTR	(1ULL << 49)
> > +#define		RISCV_HWPROBE_EXT_ZIHPM		(1ULL << 50)
> >  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
> >  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
> >  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hw=
probe.c
> > index 8d1b5c35d2a7..910b41b6a7ab 100644
> > --- a/arch/riscv/kernel/sys_hwprobe.c
> > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > @@ -107,9 +107,11 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe =
*pair,
> >  		EXT_KEY(ZCB);
> >  		EXT_KEY(ZCMOP);
> >  		EXT_KEY(ZICBOZ);
> > +		EXT_KEY(ZICNTR);
> >  		EXT_KEY(ZICOND);
> >  		EXT_KEY(ZIHINTNTL);
> >  		EXT_KEY(ZIHINTPAUSE);
> > +		EXT_KEY(ZIHPM);
> >  		EXT_KEY(ZIMOP);
> >  		EXT_KEY(ZKND);
> >  		EXT_KEY(ZKNE);
> >
> > base-commit: dc1c8034e31b14a2e5e212104ec508aec44ce1b9
>=20
> Hello,
>=20
> Can I get a review on this version of this patchset?

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

By the way, I totally missed this first time around because the v2 was
sent as a reply to v1 - it's pretty common for people to view their
mailbox sorted by thread, and sending new versions as a reply will bury
it.

Cheers,
Conor.

--S5iLkL5yVJmHWDnB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZt7X8gAKCRB4tDGHoIJi
0thiAP9hQnKR4nidhZ+Q/MFpJAMc8yb08FsLJQ/6HEH7mnqVDgD6AoBEiQy+m2Tq
Q4K90S9mDC+ePAHjHt1WucXOjwUidgk=
=rbYl
-----END PGP SIGNATURE-----

--S5iLkL5yVJmHWDnB--


--===============3320698961855031906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3320698961855031906==--

