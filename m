Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A196C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 07:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJb7mQhTByFngz52c9G0E2/TfBpSngJfp9wnnidjQQU=; b=hZigKonKNQGcS6oLiv1EOUlfZG
	PkDpx7PiOvyncDy/WkIZnpMurjbyJEhnCQ52CAgxcrayHcr3zr3oUHpUue/miZRNGa+/dc1neV3T/
	xdiFDDNfoW2gJqdf84F+lGWyTk1h0K9cupYraLgnb402Mi7SNd07ahGL3g+/1ea54k5VV+m66Duhc
	maVt17UjkzaslO5I+23OzYPDst7Kh2Ay+pbu63WaNQxSzFqzJ2F/cEYKRu65Eh33sa2FdmP/kEP61
	BS9DlQWfBEZ61yvVrRfmr1ZL2pQ5o2PtoGJDSxqIJUCORHkzCGj35H0DhOCXsPTJWr5qrYaTGP0EG
	Nzx3tlbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxjZt-004itt-1z;
	Tue, 31 Oct 2023 07:54:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxjZn-004isk-2G
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 07:54:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1698738855; x=1730274855;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xN51CM09J6iiCjc32Yasf35DOisKTuCsqH+zHVd4erY=;
  b=nwOBEnpTmER8JylOBTtdYxN65NRrmUNZzTnF3shBiCiN8Kgu5yTjYYlN
   BFYUYprHnAPPZf5s6O04dlH0dyL+QzOjK0mKZaCGoMm7gQNWZFR7ACKwJ
   m6M6NZH2xLL6cTj8ci61FJnEmOc//LPeLcnjOE4eSyUxaJMXkP7exH0Eq
   SukOnSEjCbuYzAeAue025hlbvxKZ+adSKAlbafH1uTpkKkXcJtsEz/pzJ
   4lccWH7muvUcCRIGvcgMqSJhM45H5/CoKw06KjYN0KLC1ljhas6Cus/BR
   PuA+EC0TvDJ9UtYNScLeRCDjcF8CU4UumtfCBYKkxTGdu1idJ+h+BeQwO
   Q==;
X-CSE-ConnectionGUID: LPH+QcWOTpS555ipnBfRWA==
X-CSE-MsgGUID: 0Qv2u934SCCmsMjxrHIzVg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="asc'?scan'208";a="178052118"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 31 Oct 2023 00:54:11 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 31 Oct 2023 00:53:17 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 31 Oct 2023 00:53:15 -0700
Date: Tue, 31 Oct 2023 07:52:50 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Charlie Jenkins <charlie@rivosinc.com>
CC: "Wang, Xiao W" <xiao.w.wang@intel.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "ardb@kernel.org"
	<ardb@kernel.org>, "anup@brainfault.org" <anup@brainfault.org>, "Li,
 Haicheng" <haicheng.li@intel.com>, "ajones@ventanamicro.com"
	<ajones@ventanamicro.com>, "Liu, Yujie" <yujie.liu@intel.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] riscv: Optimize bitops with Zbb extension
Message-ID: <20231031-triage-glacial-d70f5951627e@wendy>
References: <20231030063904.2116277-1-xiao.w.wang@intel.com>
 <20231030063904.2116277-3-xiao.w.wang@intel.com>
 <ZUAT5gKXM+pU6r3w@ghost>
 <DM8PR11MB5751DE93BE278FF01576E5A5B8A0A@DM8PR11MB5751.namprd11.prod.outlook.com>
 <ZUBgHC1GBm/Jg+cy@ghost>
MIME-Version: 1.0
In-Reply-To: <ZUBgHC1GBm/Jg+cy@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_005415_989714_74B1EDF4 
X-CRM114-Status: GOOD (  13.49  )
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
Content-Type: multipart/mixed; boundary="===============0997173854913708744=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0997173854913708744==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3v+8nSO/BFqyKTLR"
Content-Disposition: inline

--3v+8nSO/BFqyKTLR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > > +static __always_inline unsigned long variable__ffs(unsigned long w=
ord)
> > > > +{
> > > > +	int num;
> > > > +
> > > > +	asm_volatile_goto(
> > > > +		ALTERNATIVE("j %l[legacy]", "nop", 0, RISCV_ISA_EXT_ZBB, 1)
> > > > +		: : : : legacy);
> > > > +
> > >=20
> > > On this and following asm blocks, checkpatch outputs:  "Lines should =
not
> > > end with a '('".
> >=20
> > I did below check, but I got no warning.
> > # ./scripts/checkpatch.pl v4-0002-riscv-Optimize-bitops-with-Zbb-extens=
ion.patch
> > total: 0 errors, 0 warnings, 280 lines checked
> > May I know how you do the check?
> > BTW, I see arch/riscv/include/asm/jump_label.h and arch/riscv/include/a=
sm/cpufeature.h have similar code.
>=20
> I normally use the --strict flag since that is what the Patchwork server
> uses.

FWIW, checkpatch output does require human interpretation. It is only a
"dumb" perl script, and particularly for asm stuff the complaints can
often be ignored. IMO, this is one of those times.

--3v+8nSO/BFqyKTLR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUCyTgAKCRB4tDGHoIJi
0lb5AQCTfhMacWVDaEEfgJBvcrswUdOTbdqr3jTISqjE8bOYMgD+IZQdBokuYmL2
ontBt5Lb+1jxFiabOCOk+tl9dAAW5Qs=
=HvTx
-----END PGP SIGNATURE-----

--3v+8nSO/BFqyKTLR--


--===============0997173854913708744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0997173854913708744==--

