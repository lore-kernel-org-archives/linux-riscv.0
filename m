Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48D3C83F05
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jul 2025 09:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5miJsmdPgaBsmY2qQLNLEcAZIxntjM3eVppYKBP6vkk=; b=Go3BUcKTHG2cY+b4oIqkig6pGN
	NslSOUjOlNV+ymdt7t2XzjPVAOagIJEgvdqZQoAlEkR1KlxUxwwxTlwfazdO4yeOuTuf5bxEsgtLc
	aiHWaHFO799VUtLLBTyoeSfcuqTodSmV1jaatCTE4x3wnihsgYRkJjVGBsuYgrSNTuixqBORtK7eu
	QUUUFCNfGxOf33E6yRTtgTqgzvgOptlWUoYdndbTmqBBd0fvKOR1g2jQDkKGaq10eAiDDw4y7KGNg
	OvyN3rB64BajJKxrkxZVEDFUQvw5ib1kGaZCWAccnV/osQaAUAl9MMuW4VrtpXKzJF0El956ro3VQ
	qjmkhlzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYLPE-0000000029W-0F1Q;
	Sun, 06 Jul 2025 09:11:28 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYLLn-000000001iv-0lpA;
	Sun, 06 Jul 2025 09:07:56 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:In-Reply-To:References;
	bh=Ho2vJrnmP0hAKFMj4ugRd5xpUyaSxVYHzOv8nai9HE4=;
	b=kGT+P99nbmbmlDK5wRcoQe7iTi0tj4rgq8Ja1NThF/Ut/eVDDS6zSOy/cBNeWCpC2WaWEjsDTE9nALznc4eUbYmsFDflpU7Wy67/u3PIg+8N8YG8NlKJU/04n5ytvbG8QSj/DyZPcvrVBo4AODJMy3a1l8NyWoAb1HZ6/bnTz/o=
Received: from lukas-hpz440workstation.localnet (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Sun, 6 Jul 2025 11:07:39 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 3/7] dt-bindings: arm: sunxi: Add NetCube Systems Nagami Keypad
 Carrier Board
Date: Sun, 06 Jul 2025 11:07:38 +0200
Message-ID: <4994705.GXAFRqVoOG@lukas-hpz440workstation>
In-Reply-To: <21e0785e-b2f6-4b31-8887-0c22bd686dc8@kernel.org>
References: <20250705213900.3614963-1-lukas.schmid@netcube.li>
 <20250705213900.3614963-4-lukas.schmid@netcube.li>
 <21e0785e-b2f6-4b31-8887-0c22bd686dc8@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_020755_535957_925A9B2B 
X-CRM114-Status: GOOD (  16.61  )
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
Content-Type: multipart/mixed; boundary="===============5159074719852603618=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5159074719852603618==
Content-Type: multipart/signed; boundary="nextPart1926776.tdWV9SEqCh";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1926776.tdWV9SEqCh
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Lukas Schmid <lukas.schmid@netcube.li>
Date: Sun, 06 Jul 2025 11:07:38 +0200
Message-ID: <4994705.GXAFRqVoOG@lukas-hpz440workstation>
In-Reply-To: <21e0785e-b2f6-4b31-8887-0c22bd686dc8@kernel.org>
MIME-Version: 1.0

On Sonntag, 6. Juli 2025 09:49:58 CEST Krzysztof Kozlowski wrote:
> On 05/07/2025 23:38, Lukas Schmid wrote:
> > The NetCube Systems Nagami Keypad Carrier is a custom board intended to
> > fit a standard Ritto Intercom enclosure and provides a Keypad, NFC-Reader
> > and Status-LED all controllable over Ethernet with PoE support.
> > 
> > Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> > ---
> > 
> >  Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > b/Documentation/devicetree/bindings/arm/sunxi.yaml index
> > 7919b5bf5..a2f16d064 100644
> > --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > 
> > @@ -610,6 +610,12 @@ properties:
> >            - const: netcube,nagami
> >            - const: allwinner,sun8i-t113s
> > 
> > +      - description: NetCube Systems Nagami Keypad Carrier Board
> > +        items:
> > +          - const: netcube,nagami-keypad-carrier
> 
> That's just enum with previous entry. Don't make it over-complicated.
> 
> Best regards,
> Krzysztof

Just making sure here. The actual bindings are fine, but I should merge them 
into one patch, correct?

Best regards,
Lukas

--nextPart1926776.tdWV9SEqCh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEPv6dcBmn59ssZMkSJnN+drMVRtgFAmhqPNoACgkQJnN+drMV
Rths8gf/e6eLq4uNu0vJSGM9LYg+wGaYJJBiydq7iEk18FH2Vf60tOp7PGIYhSjW
hX9iL6iA5xvsycCO01AkcgT3+qV0r9sNoIiRyBPKVIdDltG4WRYzGnzGtGD6maff
mN8PR9rZ6k9qhlAFvdqCPTagJJ2GOHFu7NMv+uWxtuDedBNR3bMm5Q/EixQ2iqF8
tYMkXbl+DEGoMMbceDoBAitKJC6cZcWUsqaSFtLn84F9yl2EOM16r/9NTUAusT0T
nOkfvSD05VWc9iDoukZbIHPlH+63S/+LksJVMKYtJXI+0OUTH+YZwi0qzrK3NVgI
s9BZgcYcWUtfy5TXpq3lhvVxus+DDQ==
=jjD0
-----END PGP SIGNATURE-----

--nextPart1926776.tdWV9SEqCh--






--===============5159074719852603618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5159074719852603618==--





