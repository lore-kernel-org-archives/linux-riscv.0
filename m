Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AFBCEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 17:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxjZq6Z/nz8mdOABiAK2NwU38/42J+fZe6kR8DEa7IQ=; b=aRiVogi8sgDw2k52sDj7qEAy9Q
	Z64UxRXyjCC11SuZuH2wzXLvS1rReNEqxAHPrgkuVw6aA01vjE549BhcEq27KmVpdDjAsJelR483g
	H4D60be8bxWkLAR/MM9RhU9EPmz+S2O1yA/AVl/b7BjkhYx4zU/3wMX6SoAsKHDuOQPHvzBCiw/7P
	t1USQne7SLfEiruzXPPRTfUvoWK2a0u4MbmlNc0aNQlStw/rd8JG+z6cjCQVwknqxU6UeBLX4rbtz
	bXLQ9mcRyW+pzQyjWe929jw+GNn9ENEs+Bu6U25dW/DxxGB75gDlXnoFKH9i7iTD7OslIVaPgqAtF
	8mjtGeTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3L9-0000000GZCl-0y73;
	Mon, 17 Nov 2025 17:48:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3L7-0000000GZCb-3U59
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 17:48:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 110B4601EA;
	Mon, 17 Nov 2025 17:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011EBC2BCAF;
	Mon, 17 Nov 2025 17:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763401711;
	bh=qOLIQvSf0KW1L5d/BIjS9SrU30FqUG7gOG9CG6UKSJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJ0RXhN3PP8KuFQ/dvOP+mWwywxNTIQwSQ5XsQqJiQB4ANmQ/xrDIR2dD5uU2aFNx
	 KyDSYqRtfg3OlTuJQwVie3zQ2ccxHLYNFuH0LLpP+0q62zK8fniI+vIaiOULCJmxIk
	 GiIHED6eZJlbekYvPQLXPn52J9YXfs+DsKApnvZ5QzIL0iqSjHA4yIb5FMkvKm6Yil
	 dYyp+LtUKVYWbvb3pKdAP/STf0RzIHlJQp2SGjHeNIADm74w27tWGvYR0EAVKSwWA8
	 vhQiH8UMWE0KU+75au+ajYkhHonQN8t6yRPmMLKdDiO+RIgiHRYyhknU6iOwfwzlhl
	 Wl7O8Pjgnn6VA==
Date: Mon, 17 Nov 2025 17:48:26 +0000
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] dt-bindings: clock: mpfs-clkcfg: Add pic64gx
 compatibility
Message-ID: <20251117-scrabble-making-17ae91d03a27@spud>
References: <20251117-shadow-police-56aba5d855a3@spud>
 <20251117-depth-sage-ee0829c71c25@spud>
 <176340135320.214025.1792944827677577860.robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <176340135320.214025.1792944827677577860.robh@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============1458628932080223494=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1458628932080223494==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VHxIiW/r9SCVpufo"
Content-Disposition: inline


--VHxIiW/r9SCVpufo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 11:42:33AM -0600, Rob Herring (Arm) wrote:
>=20
> On Mon, 17 Nov 2025 15:35:20 +0000, Conor Dooley wrote:
> > From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> >=20
> > pic64gx has a clock controller compatible with mpfs-clkcfg. Don't permit
> > the deprecated configuration that was never supported for this SoC.
> >=20
> > Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> > Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  .../bindings/clock/microchip,mpfs-clkcfg.yaml     | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> >=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/c=
lock/microchip,mpfs-clkcfg.yaml: then: 'anyOf' conditional failed, one must=
 be fixed:
> 	'reg' is not one of ['$ref', 'additionalItems', 'additionalProperties', =
'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependen=
tRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum'=
, 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minim=
um', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patte=
rnProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedPr=
operties', 'uniqueItems']
> 	'type' was expected
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

Huh. I think the bot is right here, it's this hunk:
@@ -69,6 +73,15 @@ required:
   - clocks
   - '#clock-cells'

+if:
+  properties:
+    compatible:
+      contains:
+        const: microchip,pic64gx-clkcfg
+then:
+  reg:
+    maxItems: 1
+
 additionalProperties: false

 examples:

But I need to go figure out why I did not see this.

--VHxIiW/r9SCVpufo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRtf6gAKCRB4tDGHoIJi
0pTEAQC3oXitlB1I7swxgbQi91gcja4Mrydyc5KJc11uQ0OdHwEA68dT8h3Ts6/i
nHJhuhcEAbukG/MZDlIU27YwEW9BlQY=
=TBXI
-----END PGP SIGNATURE-----

--VHxIiW/r9SCVpufo--


--===============1458628932080223494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1458628932080223494==--

