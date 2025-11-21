Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A52CFC26F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 12:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdmyL/JRXl1vEgNVaZu8+aLRDGg4N0+1M2mBphjuIac=; b=Vx86cphZd982/gzjnO0SVy7nDy
	8kmbRdeXzfGag4fnHPPg/0f5GxAuzKFGS9QV7zlG4dmDkhZW3uzF9fH3s3p3zkGveSunZiKbqi2sm
	NgVIBB6aoWYTQZVr7MTw1KY9pr5YMFD/CuDKVjnp2HmitL57k6iQoZEu1NT3XPHueLZuFBobz3Yxh
	b0yIAGmsSV3hjS+3g+hXf4nRPEN9mi6UC6ChyhGpa1cQBj8hQOuiVoCbJcgccahjDCLDFl8Ydb4CT
	BQ/RikXrgr2BegdnCeBTrOe6IEPKucR/xrNDaC6NcJOQhjXIeRfBKjN+DKpK5hgBspXIAj5aNxPsV
	RBW2ltlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMQI7-00000008MbB-18q3;
	Fri, 21 Nov 2025 12:31:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMQI2-00000008Mal-1utc
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 12:31:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C87C429F1;
	Fri, 21 Nov 2025 12:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59183C4CEF1;
	Fri, 21 Nov 2025 12:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763728261;
	bh=OH0u7+tI6QWmQtYbiS0/gq2DQX5L0kFhHUjyOoR1DMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H/0RdieVVIs1gqDFGjE2SyaCPzGfGYbECcNhkLpBNGRiUhyd4qvdGpuLDa2jhq+9s
	 1aDCen2kNVK6Gs6a1bxM9U+tgHdNhiphm0wgvwfjQyRJ4a59dpZWu9/xQ+EYyOJasM
	 jPDY+RiMW80V39iM8+4RomLl+7e4nNLy6nfpbkKrUp87d4eo/sUTz00CNCwKyfYCvr
	 Mt7PxNF1NvbB/OsvsSDCWajwFjpCdWFaihxQrSlJKcs3fls89qq/6ngc7YQ5S8034m
	 82hh/lDISLNq91DI6PzZo/S+6JFS4I9HXVJewkiz+78lh4Bv3paECtiwZehR/X6LlU
	 g8nFyTWDXDLqw==
Date: Fri, 21 Nov 2025 12:30:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: cp0613@linux.alibaba.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, peterz@infradead.org, mingo@redhat.com,
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org,
	guoren@kernel.org, devicetree@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add prefix for
 XuanTie
Message-ID: <20251121-shortlist-coroner-b29e19293b40@spud>
References: <20251121063439.2545-1-cp0613@linux.alibaba.com>
 <20251121063439.2545-2-cp0613@linux.alibaba.com>
 <20251121-able-terrestrial-spaniel-90c3cf@kuoka>
MIME-Version: 1.0
In-Reply-To: <20251121-able-terrestrial-spaniel-90c3cf@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_043102_538122_952C663A 
X-CRM114-Status: GOOD (  16.21  )
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
Content-Type: multipart/mixed; boundary="===============1685992777773562419=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1685992777773562419==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m+h7vgyI7UsGxnd7"
Content-Disposition: inline


--m+h7vgyI7UsGxnd7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 10:01:07AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 21, 2025 at 02:34:36PM +0800, cp0613@linux.alibaba.com wrote:
> > From: Chen Pei <cp0613@linux.alibaba.com>
> >=20
> > Add new vendor strings to dt bindings for RISC-V vendor XuanTie.
> >=20
> > Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/D=
ocumentation/devicetree/bindings/vendor-prefixes.yaml
> > index f1d1882009ba..5d28b2da94cd 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -1829,6 +1829,8 @@ patternProperties:
> >      description: Xilinx
> >    "^xnano,.*":
> >      description: Xnano
> > +  "^xuantie,.*":
> > +    description: C-SKY Microsystems Co., Ltd. (XuanTie)
>=20
> We do not create new prefixes for existing entries. You have already
> csky, alibaba and thead and probably many more. Choose some appropriate.

When the vendor literally says "C-SKY", it's hard to buy why csky
shouldn't be used here. Xuantie is described as being a brand, where at
least t-head was a company. This seems akin to having
"snapdragon,msm8660" instead of "qcom,msm8660", for example.

>=20
> Your commit msg should also explain anything unusual here, like above.
>=20
> Best regards,
> Krzysztof
>=20

--m+h7vgyI7UsGxnd7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSBbfgAKCRB4tDGHoIJi
0pu2AP9IUCgDAdGT2KEcgsOZxlFERNEUosFAKBFr2j6gKisKYAEAgrHYwqrbt1od
YK5FuRlMYfflubjQjT4wGFsKjrKaHQI=
=o97f
-----END PGP SIGNATURE-----

--m+h7vgyI7UsGxnd7--


--===============1685992777773562419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1685992777773562419==--

