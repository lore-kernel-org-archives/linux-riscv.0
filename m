Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD7FC2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 16:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vx53+Sb5vjh0P49L5dxnxuKB3nxdBk5j0rCROpsCRa4=; b=X8MZvfurnMHKdTN0+O9rgprL0D
	kluCf0o7H21WzsA5LPS+bw7RjjzcZMcnNXHk/ETcTzls0ASy6/YJbnuJ8zodfxlX+FOXgpjmtHnLi
	ljYBENZLY1pXs7XwBMX6mXBvO3tJGXK8TSn1Z6gsAPVsxvy/58zqGaadJLqDobVJ7W5q/1nZeTNJO
	sZsREMADCZDdt+GV498g/JXpAZQ9Wv674EzsNjQAmaHi0taf9Q+0lm0NreAVcTlRgIBxwt/4rMgj3
	ZOIjXS7afaE09fPP94Tsjwtn342blPDy4siPquE6FyYVtd9zrPid2DITGYekVXk5pwu/78wGAMGDX
	GXMYmEaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOJvr-000000047XD-38eU;
	Mon, 01 Jul 2024 16:31:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOJvo-000000047Wa-2vSZ
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 16:31:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F19161463;
	Mon,  1 Jul 2024 16:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C198C116B1;
	Mon,  1 Jul 2024 16:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719851467;
	bh=3+N9mukdDXyzFCGLQCqPnIa6llv8dipDxdiIJdfI2BM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H4F+tGQB8Hcw87QnKmezQg520Gcp5L4jM+vlgj/UvG/nEhKg/o+U8avYMj889kQ8g
	 KIg7e1oHvlgRbaS0lVEGaX9Dpcz62o8QoQUDwCx2FMMYNUGNk2F2Tq9mvcLntsK7nb
	 L1h+t+YpXW+ATKfe9HihuqDHd0V1dYx8Bjb1Ts6ySXWD40NBsiWcQrrkbWjtHMmfjt
	 ON1nAkADPcHpVd8atehi1jgeZRXwizYT/9NejhyxvEpEF85JaxML+n6m0C/V0Mapwp
	 NQoMb123Zw2J4sno25BdiU2/gmzOht3CR7t0U44mQEqALZpCB30da2WDJ7T4qkEij6
	 SKBaTMmQ3lbhQ==
Date: Mon, 1 Jul 2024 17:31:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>, peterlin@andestech.com
Subject: Re: [PATCH v3 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
Message-ID: <20240701-pyromania-spinster-709a6c8cc460@spud>
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
 <20240619-xtheadvector-v3-3-bff39eb9668e@rivosinc.com>
 <0cc13581-5cc4-4a25-a943-7a896f42da4c@sifive.com>
 <20240701-prancing-outpost-3cbce791c554@spud>
 <7ab7d629-6993-4cad-b5b7-62bddfc74a49@sifive.com>
MIME-Version: 1.0
In-Reply-To: <7ab7d629-6993-4cad-b5b7-62bddfc74a49@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_093108_843702_BAB0B687 
X-CRM114-Status: GOOD (  39.49  )
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
Content-Type: multipart/mixed; boundary="===============8240557121959401622=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8240557121959401622==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MRFAVKKck9xRQIr9"
Content-Disposition: inline


--MRFAVKKck9xRQIr9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2024 at 11:11:55AM -0500, Samuel Holland wrote:
> Hi Conor, Charlie,
>=20
> On 2024-07-01 11:07 AM, Conor Dooley wrote:
> > On Mon, Jul 01, 2024 at 10:27:01AM -0500, Samuel Holland wrote:
> >> On 2024-06-19 6:57 PM, Charlie Jenkins wrote:
> >>> The D1/D1s SoCs support xtheadvector so it can be included in the
> >>> devicetree. Also include vlenb for the cpu.
> >>>
> >>> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> >>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >>> ---
> >>>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
> >>
> >> The other C906/C910/C920-based SoCs need devicetree updates as well, a=
lthough
> >> they don't necessarily need to be part of this series:
> >>
> >>  - sophgo/cv18xx.dtsi
> >>  - sophgo/sg2042-cpus.dtsi
> >>  - thead/th1520.dtsi
> >=20
> > Yeah, I think I pointed that out before with the same "escape hatch" of
> > it not needing to be in the same series.
> >=20
> >>
> >>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/ris=
cv/boot/dts/allwinner/sun20i-d1s.dtsi
> >>> index 64c3c2e6cbe0..6367112e614a 100644
> >>> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> >>> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> >>> @@ -27,7 +27,8 @@ cpu0: cpu@0 {
> >>>  			riscv,isa =3D "rv64imafdc";
> >>
> >> The ISA string should be updated to keep it in sync with riscv,isa-ext=
ensions.
> >=20
> > This probably looks like this cos I said that the kernel shouldn't parse
> > vendor extensions from "riscv,isa". My rationale was that we have
> > basically no control of what a vendor extension means in riscv,isa so=
=20
> > we shouldn't parse them from it (so marginally worse than standard
> > extensions, where it means what the spec says except when it doesn't).
> >=20
> > Given how we implement the parsing, it also meant we weren't implying
> > meanings for vendor extensions ACPI-land, where we also can't ensure the
> > meanings or that they remain stable. That change is in a different
> > series:
> > https://patchwork.kernel.org/project/linux-riscv/patch/20240609-support=
_vendor_extensions-v2-1-9a43f1fdcbb9@rivosinc.com/
> >=20
> > Although now that I think about it, this might break xandespmu... I
> > dunno if the Andes guys switched over to using the new property outside
> > of the single dts in the kernel tree using their SoC. We could
> > potentially special-case that extension if they haven't - but my
> > position on this mostly is that if you want to use vendor extensions you
> > should not be using riscv,isa (even if the regex doesn't complain if you
> > add them). I'd like to leave the code in the other patch as-is if we can
> > help it.
> >=20
> > I added Yu Chien Peter Lin here, maybe they can let us know what they're
> > doing.
>=20
> OK, that makes sense to me. Then please ignore my original comment.

Should the xandespmu thing be an issue, I'd suggest we just do something
like the following, in place of the new switch arm added by Charlie:

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index ec4bff7a827c..bb99b4055ec2 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -628,6 +628,17 @@ static void __init riscv_parse_isa_string(const char *=
isa, unsigned long *bitmap
 		if (unlikely(ext_err))
 			continue;
=20
+		if (*ext =3D=3D 'x' && acpi_disabled) {
+			/*
+			 * xandespmu predates this "rule", so special case it for
+			 * hysterical raisins
+			 */
+			if (strncasecmp(ext, "xandespmu", ext_end - ext)) {
+				pr_warn_once("Vendor extensions are ignored in riscv,isa. Use riscv,is=
a-extensions instead.");
+				break;
+			}
+		}
+
 		match_isa_ext(ext, ext_end, bitmap);
 	}
 }


--MRFAVKKck9xRQIr9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoLZxAAKCRB4tDGHoIJi
0vx9AP9TcSJwtzFrkZkNIG3vs0nSWuu1I+CFqCZfZtrYfWH8RQEAxGeKP2P/oodO
cyCHRd/9NqDoz5j8eiXpnwlmjUtaKAk=
=AA89
-----END PGP SIGNATURE-----

--MRFAVKKck9xRQIr9--


--===============8240557121959401622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8240557121959401622==--

