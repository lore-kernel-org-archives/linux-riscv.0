Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC87CCF9E3
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 13:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHYtDcKxisrb+JXBV6c13AoKSKWC1qV9X6XafrkZ1CQ=; b=OBMoB/PMLg4WJI1edcfb5zyodD
	0YWvf5Q5wLKcPNVD2NOM9gdLjQ6/+8oNO88IzKqRyFGL/7IACNp7pTUcYDP8f50qTk26vTGyJteIk
	GdPtXbLuOkanW9XfhnzYjzmgrFZcbLFM7YXi5s1cNJulGSgBBdlDvmiXAFbNsl3wdh5sv4Yzinfyu
	W4bu1NKJg96ywGGcBe+azCwavdLxfiPV3aWMSCpRj/quczxMi/8p6ENuTZiJ074M3wCNNphu+tRHV
	12fnz1ofB5PSczbjZa/bBm4whVJvY+Wzr1X83oL2hf8gjmBGKmsDmkdRXqV0GT5Ffc0avu5TZ8fRu
	UAJEow2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGxm-0000000BsMg-0fAM;
	Tue, 04 Nov 2025 13:20:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGxh-0000000BsM0-1Elf
	for linux-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 13:20:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1762262437; x=1793798437;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=muJjyL1ZUkCFIRMnJVcw6jPbIc63lMLSCsSak2Qjrsk=;
  b=UStYgW2gXRPhVjB/0uggDvaq7TAAnoHRpj7mc2HMrL6f7gOKp3TlSD/A
   hYEKGaBrBk1HtvU7e5pHa0XhUwy+dmopXFKSrRHEVHaPQnJCcL2Lz8+1t
   JfPmk6QPENQp2TxbxhiICkZVkfZ3qRHDkzW/7Ca3dl8z680K2qnfweO13
   t5LEEkrS6n5vsiqI2mWaBsSsgtCV5ONkym+WOEfw2srdnVpQMLEYhbfQm
   QlOXZFWT+030sQ1Lo+SJUOAe8oYncx+5Y4pw3ysBqKmPNl3DSjHrt/SjK
   XtDvOdSPMvG21NYPXjhMsCiyDGoyLE9wvj/3HL99LyrCLjfj6Y5JUJiYU
   g==;
X-CSE-ConnectionGUID: /qRgm63OQfmsM8NexuLh2A==
X-CSE-MsgGUID: p+23sVE3RPWPANVT5ApTEg==
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="asc'?scan'208";a="280036531"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 06:20:35 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Tue, 4 Nov 2025 06:19:54 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Tue, 4 Nov 2025 06:19:52 -0700
Date: Tue, 4 Nov 2025 13:18:09 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
CC: "conor@kernel.org" <conor@kernel.org>, "alex@ghiti.fr" <alex@ghiti.fr>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "cfu@wavecomp.com"
	<cfu@wavecomp.com>, Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>
Subject: Re: [PATCH] riscv: Update MIPS vendor id to 0x127.
Message-ID: <20251104-iciness-ranting-29dd93fe6a7e@wendy>
References: <20251103-tabby-laurel-bc895f236a69@spud>
 <e0e4d521-cf50-4384-8461-e87b15044089@htecgroup.com>
MIME-Version: 1.0
In-Reply-To: <e0e4d521-cf50-4384-8461-e87b15044089@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_052038_231383_6D94DD9E 
X-CRM114-Status: GOOD (  22.92  )
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
Content-Type: multipart/mixed; boundary="===============8947160950282010866=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8947160950282010866==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SlwtsFVMIDtSsTYq"
Content-Disposition: inline

--SlwtsFVMIDtSsTYq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2025 at 11:53:49AM +0000, Aleksa Paunovic wrote:
> On 11/3/25 23:07, Conor Dooley wrote:
> > On Mon, Nov 03, 2025 at 04:05:48PM +0100, Aleksa Paunovic wrote:
> >> From: Chao-ying Fu <cfu@wavecomp.com>
> >>
> >> [1] defines MIPS vendor id as 0x127.
> >>
> >> [1] https://mips.com/wp-content/uploads/2025/06/P8700_Programmers_Refe=
rence_Manual_Rev1.84_5-31-2025.pdf
> >>
> >> Fixes: a8fed1bc03ace27902338e4f0d318335883ac847 ("riscv: Add xmipsexec=
tl as a vendor extension")
> > Incorrect format for fixes tags!
>=20
> Will fix that in v2.
>=20
> >
> >> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> >> ---
> >>  arch/riscv/include/asm/vendorid_list.h | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/inclu=
de/asm/vendorid_list.h
> >> index 3b09874d7a6dfb8f8aa45b0be41c20711d539e78..55205f7938055ba2b744db=
a5118bba935bcac008 100644
> >> --- a/arch/riscv/include/asm/vendorid_list.h
> >> +++ b/arch/riscv/include/asm/vendorid_list.h
> >> @@ -9,6 +9,6 @@
> >>  #define MICROCHIP_VENDOR_ID	0x029
> >>  #define SIFIVE_VENDOR_ID	0x489
> >>  #define THEAD_VENDOR_ID		0x5b7
> >> -#define MIPS_VENDOR_ID		0x722
> >> +#define MIPS_VENDOR_ID		0x127
> > How was this ever wrong? Do devices exist with this old ID? Do we need
> > to support both as vendor IDs for MIPS?
>=20
> I'm not sure how it first started, but since we worked on qemu as well, w=
e never noticed any issues while testing.=A0
> It shouldn't cause any problems in the future though.

So all the hardware uses the 0x127 id? Where did 0x722 come from?
I recall qemu defaults to 0x0, so were none of the mips code paths
tested, or were they tested with a qemu modified to use 0x722?

--SlwtsFVMIDtSsTYq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQn9EQAKCRB4tDGHoIJi
0tImAQC24un7hBWLjAJmz+RBM0YsVlVpiVuTx3AbwR0sFqC6twD+MM4CSYrlS+Wy
c1uRH+D7LVnyYsRmLzAdccel8p4iFQA=
=+1Y4
-----END PGP SIGNATURE-----

--SlwtsFVMIDtSsTYq--


--===============8947160950282010866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8947160950282010866==--

