Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE9FEB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 11:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2fBTbVvTZ07byq11WnGljNMj2uc8c/1R7LQUT3zXlM=; b=00QJD7PKhVMHhqWJz23c/r7CXr
	+8hoBPGXO1ZKXQbKaTUJURyDK3caFHj1XviPoLZfkXGQqkl5T/BY+FuLbD19UDKIVL1477Ysg3gOk
	QjgWxN9evDj6LzBLNXBtsccn0Sy6aoTNGGYcVv8OZj0+Hcg+1/OdxZxkucAnCft+GjREZYbkUjLFI
	nhhjR6TFO1GZtl+sN90qiMlEatLVEha1qBC132KczROxMb6vcqchqvsOB+6Cyjre7BSUxt+Inq5we
	bPkHzI/CGeiX9MYb3+7HkiOnNQA+TUR5trnALvUvKjnowxDovKq//GonJgs41eB3C+hL8Yf7N3dBi
	hvWEV5rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJYC8-00HPn9-21;
	Wed, 12 Jul 2023 11:39:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJYC5-00HPlN-1W
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 11:39:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689161981; x=1720697981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LzbXCdVYpf0mHxDKio5HWYPvlyzH8LX712oCQFbugF0=;
  b=NWpIDs/2gEMNat1wZROGCf2o9lW80YTKSGtSqFf4WA+7KvEPlTxs95L5
   7VvhRNNAH+F/V/1jOVQrx1ONw25d0VyFcdnvZPv+sq6C/tiyemxKlAkVD
   ++eeCFvgitL3+54yXlzgoc1SowKBrgHV1q1IlAHLR4K5BZN/Zs1mWrD9V
   DF6RP5zs1fEiCTBrCvX8JC2E4aMSQh0s8SfKHpdwss5yJq6Os8Qyvf6oe
   5GPcSFiQsvv4HahlTTDDgHf6Ko8qQGl/cD0iZkBOqzh3ssyFEOaOZ6o/h
   uFvnY84nG9oxILQehKhdaqnjCboXVo5zEspxTlaGUIREWMpuRqrLz+1hU
   A==;
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="asc'?scan'208";a="219993814"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jul 2023 04:39:24 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 12 Jul 2023 04:39:24 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 12 Jul 2023 04:39:23 -0700
Date: Wed, 12 Jul 2023 12:38:51 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH] RISC-V: Don't trust V from the riscv,isa DT property
Message-ID: <20230712-legislate-dental-8488c6b9c0cf@wendy>
References: <20230711223316.7961-1-palmer@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230711223316.7961-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_043941_595761_280D6E8B 
X-CRM114-Status: GOOD (  38.12  )
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
Cc: linux-riscv@lists.infradead.org, Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>
Content-Type: multipart/mixed; boundary="===============3857033465514276631=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3857033465514276631==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="erszgNZFsBF+XLJg"
Content-Disposition: inline

--erszgNZFsBF+XLJg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Palmer,

On Tue, Jul 11, 2023 at 03:33:17PM -0700, Palmer Dabbelt wroteh:
> The last merge window contained both V support and the deprecation of
> the riscv,isa DT property, with the V implementation reading riscv,isa
> to determine the presence of the V extension.  At the time that was the
> only way to do it, but there's a lot of ambiguity around V in ISA
> strings.
>=20
> Rather than trying to sort that out, let's just not introduce the
> ambiguity in the first place and retroactively make the deprecation
> apply to V.  This all happened in the same merge window anyway, so this
> way we don't end up introducing a new ambiguous interface we need to
> maintain compatibility with forever (despite it having been deprecated
> in the same release).
>=20
> ACPI still trusts ISA strings, so we'll leave that alone.
>=20
> Fixes: dc6667a4e7e3 ("riscv: Extending cpufeature.c to detect V-extension=
")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Thinking a little harder than I did last night, I think the diff should
actually look something like the below, if this is the approach that is
going to be taken:

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index bdcf460ea53d..4b759cd2e3be 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -334,6 +334,26 @@ void __init riscv_fill_hwcap(void)
 			set_bit(RISCV_ISA_EXT_ZIHPM, isainfo->isa);
 		}
=20
+		/*
+		 * "V" in ISA strings is a ambiguous in practice: it should
+		 * mean just the standard V-1.0 but vendors aren't well
+		 * behaved.  Only allow V in ISA strings that come from ACPI,
+		 * as we've yet to build up enough history in ACPI land to stop
+		 * trusting ISA strings.
+		 *
+		 * DT-based systems must provide the explicit V property, which
+		 * is well defined.
+		 */
+		if (acpi_disabled) {
+			if (of_property_match_string(node, "riscv,isa-extensions", "v") >=3D 0)=
 {
+				this_hwcap |=3D isa2hwcap[RISCV_ISA_EXT_v];
+				set_bit(RISCV_ISA_EXT_v, isainfo->isa);
+			} else {
+				this_hwcap &=3D ~isa2hwcap[RISCV_ISA_EXT_v];
+				clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
+			}
+		}
+
 		/*
 		 * All "okay" hart should have same isa. Set HWCAP based on
 		 * common capabilities of every "okay" hart, in case they don't

> This came up as part of some discussions about the T-Head vector
> support.

I guess what I brought up was the various T-Head devicetrees in the wild
that contain things like "rv64imafdcv". The Sophgo sg204-whatever has
that, and it has one of the "cleaner" downstream trees containing
support for the T-Head vector stuff. Usually I would not care all that
much about downstream trees, but it does mean that downstream U-Boots
and OpenSBIs will likely use devicetrees that contain similar stuff & we
do have to deal with being passed those.

> I haven't actually tested this, but Conor and I were talking
> about options and it was easier to just implement it than describe it.
> It's kind of clunky to only parse that one property, but we're already
> in a grey area WRT having the DT bindings that we don't parse so maybe
> that's not so bad?

It looks super clunky to be honest, but the alternatives are not all
that pretty either. Either we could disable detection from DT entirely
until v6.6 when you hopefully take my series handling the new
properties, but that puts the vector stuff into an odd spot, where no
system could actually use it. Or, we could send my series as fixes for
v6.5, but I think that is very much on the edge of what could be
considered a fix...

> The other option would be to turn off V when we detect we're on a T-Head
> system as part of the errata handling.  That's similar to what we do for
> misaligned accesses, but that's a hack that we're getting rid of.  It'd
> be less of a hack for V, but given that we've found T-Head systems
> aliasing the arch/impl IDs already we might be digging ourselves a
> bigger hole here.

Right. Doing anything with the T-Head arch/impl IDs is really fragile,
since we don't know if they'll continue to be zero in the future.
I'd argue that it is less "dangerous" to disable mapping "v" -> vector
when using riscv,isa on any T-Head systems w/ a zero archid/impid, than
it is to turn on their v0.7.1 flavour under the same conditions, but
that just amounts to a more niche version of what we have here.
I still don't think that it is a good idea to do it in the errata
handling code (at least how we have it structured now) since it could
affect a cpu, like the c908, that does actually support the standard
version of vector, if it still has impid/archid tied to zero.

Disabling mapping "v" -> vector is a bit of a big hammer, since it hits
behaving implementations too. I'd be inclined to limit the impact to
just the known misbehaver & make the condition
    if (acpi_disabled && riscv_cached_mvendorid(cpu) =3D=3D THEAD_VENDOR_ID)
or something along those lines.
That way, it's only being disabled for T-Head systems that attempt to
use "riscv,isa" to communicate support for vector, and T-Head systems
that may pop up in the future that support the standard extension can
use the new properties?

Hope that makes sense,
Conor.

--erszgNZFsBF+XLJg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK6QywAKCRB4tDGHoIJi
0icuAP9Sr8pwIVyuItiCtpb0IZLLdkp5rrzVM2ewV5F6wynXhgD/XoRA5P6weg62
OP4MZEiPYifp8d9lTQCUtP7fiva/OQw=
=NJ5A
-----END PGP SIGNATURE-----

--erszgNZFsBF+XLJg--


--===============3857033465514276631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3857033465514276631==--

