Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733CECCFA04
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 14:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LyP91PZ4kfuMyMgo5Lve4fZGimE8hSsAqu3v5qLWDvk=; b=47OxF7IMHw8REH6py2sxpZV+5S
	aiHpsNkMkCmr4DWmBY0r7zJjyqvXd/Yn08c1C8yDhLCSYMGyxYwsVUNLJM01rnF99wmJziG/ytCBW
	bwCDji7RNDCAdulyfkw+Ux7qcSQ/i9szE2Fd1B7ToVsoOuLQQ13ZsoH6lFJINBsa4WtNnmu2gJyZb
	p2MBCwoAaKUNb7jwffL1XQCu5myvzA6TMN96ACfbUFH6GCKbQ7QgnP7QIOWRjFWn2HFU10xqsozTj
	j0iuvYiSWIo92Y/8ILHB4Ld2SD0WdLh9oXpNIU+ClW74bOgi0nQsPodHnscPtYFZtHa7wZ3Ks57t/
	Vco2CTTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHlD-0000000Bxcv-3EsZ;
	Tue, 04 Nov 2025 14:11:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHlA-0000000BxcN-3S4g
	for linux-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 14:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1762265504; x=1793801504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ex8XdeL/8Gi1LCfuPJxHKOEhuXFMFx5Il6pVqKcnCAI=;
  b=xnPko5g6UmCu+spt6RG3FdrKdAi36XA+g6/QqY0+rIHBR4MPNMaP9HkD
   i05sQmvsyOr63Dszyi9zwkF5+tRlIo3HnsqR608ERD1DTz1yDKqf6ZvTI
   I2wITMfpoiJWf4oAjQB9WH8nouv2LeWEU8o6Yx4+2KHHrdg4cvkdpkI1p
   ngfIiX3rnKSKcfO3NHATvtYnXi1dMHz70ot32mvtPDDWpMxoVw6Dufgxd
   sAFbvg6fBFz3MGEW1FVco17mAIwi65gKnI3WFtazb1XXx5Z8k9ZFOoKlo
   Q/dad/sLY4H11iBC+UYpH936whlTNA1p5ipbKNQKfGTdatRNqvMeCTkJ7
   A==;
X-CSE-ConnectionGUID: 6jdsD7f5TPqVV8cNAt/ljg==
X-CSE-MsgGUID: veeYOFsNTXukUHMFtEd39g==
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="asc'?scan'208";a="48029652"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Nov 2025 07:11:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 4 Nov 2025 07:10:55 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Tue, 4 Nov 2025 07:10:52 -0700
Date: Tue, 4 Nov 2025 14:09:08 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
CC: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"cfu@wavecomp.com" <cfu@wavecomp.com>, "conor@kernel.org" <conor@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>
Subject: Re: [PATCH] riscv: Update MIPS vendor id to 0x127.
Message-ID: <20251104-reclining-eskimo-9ab425c708d3@wendy>
References: <20251104-iciness-ranting-29dd93fe6a7e@wendy>
 <bb3a2237-6dde-4231-a016-faf190f9a877@htecgroup.com>
MIME-Version: 1.0
In-Reply-To: <bb3a2237-6dde-4231-a016-faf190f9a877@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_061145_100180_A59AC639 
X-CRM114-Status: GOOD (  25.48  )
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
Content-Type: multipart/mixed; boundary="===============6486051293855873650=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6486051293855873650==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZDEVGWACkCSeSg9+"
Content-Disposition: inline

--ZDEVGWACkCSeSg9+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2025 at 02:06:31PM +0000, Aleksa Paunovic wrote:
> On 11/4/25 14:18, Conor Dooley wrote:
>=20
> > On Tue, Nov 04, 2025 at 11:53:49AM +0000, Aleksa Paunovic wrote:
> >> On 11/3/25 23:07, Conor Dooley wrote:
> >>> On Mon, Nov 03, 2025 at 04:05:48PM +0100, Aleksa Paunovic wrote:
> >>>> From: Chao-ying Fu <cfu@wavecomp.com>

While I am here, you have a From: header with Chao-ying it it, but the
patch has not been signed off by them.

> >>>>
> >>>> [1] defines MIPS vendor id as 0x127.
> >>>>
> >>>> [1] https://mips.com/wp-content/uploads/2025/06/P8700_Programmers_Re=
ference_Manual_Rev1.84_5-31-2025.pdf
> >>>>
> >>>> Fixes: a8fed1bc03ace27902338e4f0d318335883ac847 ("riscv: Add xmipsex=
ectl as a vendor extension")
> >>> Incorrect format for fixes tags!
> >> Will fix that in v2.
> >>
> >>>> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> >>>> ---
> >>>>  arch/riscv/include/asm/vendorid_list.h | 2 +-
> >>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/inc=
lude/asm/vendorid_list.h
> >>>> index 3b09874d7a6dfb8f8aa45b0be41c20711d539e78..55205f7938055ba2b744=
dba5118bba935bcac008 100644
> >>>> --- a/arch/riscv/include/asm/vendorid_list.h
> >>>> +++ b/arch/riscv/include/asm/vendorid_list.h
> >>>> @@ -9,6 +9,6 @@
> >>>>  #define MICROCHIP_VENDOR_ID	0x029
> >>>>  #define SIFIVE_VENDOR_ID	0x489
> >>>>  #define THEAD_VENDOR_ID		0x5b7
> >>>> -#define MIPS_VENDOR_ID		0x722
> >>>> +#define MIPS_VENDOR_ID		0x127
> >>> How was this ever wrong? Do devices exist with this old ID? Do we need
> >>> to support both as vendor IDs for MIPS?
> >> I'm not sure how it first started, but since we worked on qemu as well=
, we never noticed any issues while testing.=A0
> >> It shouldn't cause any problems in the future though.
> > So all the hardware uses the 0x127 id? Where did 0x722 come from?
> > I recall qemu defaults to 0x0, so were none of the mips code paths
> > tested, or were they tested with a qemu modified to use 0x722?
>=20
>=20
> That is correct, all hardware uses the 0x127 id.=A0
>=20
> I'm not sure where we got 0x722 from - perhaps I or someone else misread =
the value=A0
>=20
> (0x27 and 0x2 are both mentioned in the Programmer's Guide mvendorid bit =
descriptions).
>=20
>=20
> Everything was tested with qemu modified to use 0x722. Please see [1], fo=
r example.
>=20
>=20
> [1] https://patchew.org/QEMU/20250717093833.402237-1-djordje.todorovic@ht=
ecgroup.com/20250717093833.402237-4-djordje.todorovic@htecgroup.com/

Okay, cool. Can you put this information into the commit message? It
should really explain what went wrong and what is impacted by the
change.

--ZDEVGWACkCSeSg9+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQoJBAAKCRB4tDGHoIJi
0veVAP9aIWLMy4lMYIWj0uj8Yn4S4IWNd55ETr8Jmh178uAVJwEAxgR20BCN+zgr
Jb6U3+MUM5nAeAPCsgYzRrV5uPZetgQ=
=1G5I
-----END PGP SIGNATURE-----

--ZDEVGWACkCSeSg9+--


--===============6486051293855873650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6486051293855873650==--

