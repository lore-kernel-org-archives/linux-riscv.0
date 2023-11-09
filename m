Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EC1C4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 07:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNSVvuKXQ39/NiJcMg15lpfq/SL/Gm1DTbzl3c/4W4I=; b=ZvKPJBxi64QEtqPRUYbTDqCDQg
	DLk7eCE+CHjElMgAybBHMQNOYCguBj3nQXnAen2UFUgQfbFr0NcypRrPy9nP+Vr2tOkimKPSs3z/Z
	pO7pbenfE83CK1rc+Jf9n/GSM77Y1WXk7dkdi6lYT2iKnJ1ZF4Yg9/XCWWH35At896o+vwkQJHE1j
	NR5jW156cD98FWKgyn6q/XSbB/GdwGjKLICQAN4Qj6QsTeiHUTlKBrWsSNMuk178Yll3FBZDJTwmm
	QvT+D1MRGqNZ3q0bv63fyX0t3doBLBGeahS3+os11DbrxjYoXyl8c6fnbJjYj8E4JgY3MgbeWhicr
	rlxPK5Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0zjt-005WxD-1X;
	Thu, 09 Nov 2023 07:46:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0zjq-005WwT-1c
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 07:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1699515966; x=1731051966;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WddjzKmX1Zq6Dft+Cb9D5Kh8Q0hR/VLguzB7s52lzCI=;
  b=X3wwwOGmvSUI1eKk3e/mA9wuGTfQC3oq8l1KcRzkvHBBseGx5IPWsshF
   BxlZa986NjxBndJKvWrhCQ3RGyd6+hfivi+NQcOtMYZtfmVpEdtS6VWfc
   0Ae/v79rPUkyQSsxYp0G1pTBhDrrHnyjlytkwExLM5IFiISrlpcBdioIk
   Bpmzi4NvEznTKYllkK19SKF6mtsqOgv08+myt/UhwbX3f8kfdrXQyo34C
   AyJtWxVbTBxvumNmQwoanJziLwHr5wCsopfCXRwbx0/ECRDKmoex9jFNv
   Amg+WUOaaglucuww8ks4fYKFXJC0/YabxQtdQCoq3egyA/3A1JHM8Os4p
   g==;
X-CSE-ConnectionGUID: pehoMMM4TryvWVfGDyAZqw==
X-CSE-MsgGUID: 3n9g/0hXRmuPAWEjx8nZJg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,288,1694761200"; 
   d="asc'?scan'208";a="11685389"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Nov 2023 00:46:03 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Nov 2023 00:45:14 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 9 Nov 2023 00:45:11 -0700
Date: Thu, 9 Nov 2023 07:44:46 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: <20231107105556.517187-7-cleger@rivosinc.com>
CC: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Palmer Dabbelt
	<palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>, Conor Dooley <conor@kernel.org>, Samuel Ortiz
	<sameo@rivosinc.com>
Subject: Re: [PATCH v3 06/20] riscv: add ISA extension parsing for vector
 crypto
Message-ID: <20231109-revolver-heat-9f4788c51bbf@wendy>
References: <20231107105556.517187-1-cleger@rivosinc.com>
 <20231107105556.517187-7-cleger@rivosinc.com>
 <5EF129A2-195B-4207-A2F6-DBA1FBB9F65D@sifive.com>
MIME-Version: 1.0
In-Reply-To: <5EF129A2-195B-4207-A2F6-DBA1FBB9F65D@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_234606_602117_FF847154 
X-CRM114-Status: GOOD (  11.28  )
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
Content-Type: multipart/mixed; boundary="===============2385289828352049461=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2385289828352049461==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VwNvAibrE2gl2ijU"
Content-Disposition: inline

--VwNvAibrE2gl2ijU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 09, 2023 at 10:58:41AM +0800, Jerry Shih wrote:
> On Nov 7, 2023, at 18:55, Cl=E9ment L=E9ger <cleger@rivosinc.com> wrote:
> > +static const unsigned int riscv_zvknhb_exts[] =3D {
> > +	RISCV_ISA_EXT_ZVKNHA
> > +};
> > +
>=20
> > +	__RISCV_ISA_EXT_SUPERSET(zvknhb, RISCV_ISA_EXT_ZVKNHB, riscv_zvknhb_e=
xts),
> > +	__RISCV_ISA_EXT_BUNDLE(zvks, riscv_zvks_bundled_exts),
>=20
> The Zvknha and Zvknhb are exclusive. It's not the superset relationship.
>=20
> Please check:
> https://github.com/riscv/riscv-crypto/issues/364#issuecomment-1726782096

You got a response to this on the previous version, but didn't engage
with it:
https://lore.kernel.org/all/c64d9ddb-edbd-4c8f-b56f-1b90d82100b7@rivosinc.c=
om/#t

Cheers,
Conor.

--VwNvAibrE2gl2ijU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUyN7gAKCRB4tDGHoIJi
0q8nAP9IHpqexwos4DKWWgRyZoHjfrUhMvADJcOsVUZ9HQjsEgD/e0oPBIuq9/3N
9eHq7P5b8WbbyEX68ToKAUYvqmjg0Qw=
=9VcE
-----END PGP SIGNATURE-----

--VwNvAibrE2gl2ijU--


--===============2385289828352049461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2385289828352049461==--

