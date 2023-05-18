Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC2DC7EE23
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 11:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2Cd3VaH6+qSNIcTU5KZG/QrukmJb6io++Ij5+5TqeA=; b=W4U3LUnmCcvViEs8Q7+RF/Q9WN
	WsIrzB2AsMQJ9R+nsVIr41fGxcnnl2CinOgP8606PtsIW9r5dRsIeADAvMHN9bdYjmePq0VEybTfe
	uBeENNTYtUjKqqfHTtvDuSTyADX+TyqFey1ldZ6jbHYcOpnkdMSQLXEjqQ+GFmJeWjhdSKsAoCvH+
	3xmVqf29hiz1+JETOGjKZC8tMBFYwoOFViftAG4In+bXeb9VL2XpZOWhhlZ2P2JgZNjqzggkgb8VT
	ILAov9EbxWVCKDy+24trT6IYnZyPoiq9AUTCCvSUc5BFVfIfHMj/Fx80zOMh5zs1+3NAlZU7/rrbo
	oHBA60IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzblR-00Cpd9-2p;
	Thu, 18 May 2023 11:25:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzblP-00Cpci-1L
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 11:25:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684409143; x=1715945143;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KPipI87LRIbP/OpMGuyK3E2LESwrrGgto5bVP90IVRI=;
  b=T0rvwLbOMC6RzMhytaSXFJ7kfnMjhz69ITRMOzFQSuoO4WHgLHIm13qN
   O7D+2gzBhGtmsdlIo2eoMN7tikG5hUnAV2a3NfAV2hX1q9ZIHc4pnBlkF
   OgQBjKt8lpG+dEMTVx0M5t5uRiXTDt0HRUk/1X1yn/ecZe8rGIqg9Bjqj
   ePQNUCRPX3yfXZm+D+Iu0q7H4HgB0408Pwk8Qrp/VwYcHOJZIPzw1Tj4H
   T7o+bozRPsCF1cNBbSw0PsnRE16v/NQ5NSPDDfi4XhiMbWIDT4VIVtzo7
   qGa/Wc45jmUdL9PvxEoSQOkO5SKBrhKfQ2UPxqKfkWGjgHu/1DnuvWYJ5
   w==;
X-IronPort-AV: E=Sophos;i="5.99,285,1677567600"; 
   d="asc'?scan'208";a="216085961"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 May 2023 04:25:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 18 May 2023 04:25:35 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 18 May 2023 04:25:32 -0700
Date: Thu, 18 May 2023 12:25:11 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: <palmer@dabbelt.com>, <conor@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Alistair Francis
	<alistair.francis@wdc.com>, Anup Patel <apatel@ventanamicro.com>, Atish Patra
	<atishp@atishpatra.org>, Jessica Clarke <jrtc27@jrtc27.com>, Rick Chen
	<rick@andestech.com>, Leo <ycliang@andestech.com>,
	<linux-riscv@lists.infradead.org>, <qemu-riscv@nongnu.org>,
	<u-boot@lists.denx.de>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230518-resurrect-copy-0ecd9eaaca1e@wendy>
References: <20230518-thermos-sanitary-cf3fbc777ea1@wendy>
 <20230518-4050231ca8dbe93c08cf9c9a@orel>
MIME-Version: 1.0
In-Reply-To: <20230518-4050231ca8dbe93c08cf9c9a@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_042543_521176_F4C0F8D0 
X-CRM114-Status: GOOD (  12.31  )
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
Content-Type: multipart/mixed; boundary="===============1327383177578136055=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1327383177578136055==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kb7QvTX+biQwTglT"
Content-Disposition: inline

--kb7QvTX+biQwTglT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 12:31:51PM +0200, Andrew Jones wrote:
> > +  # Additional Standard Extensions, sorted by category then alphabetic=
ally
>=20
> Can we just do pure alphabetically? And the single-letter extensions above
> don't have a "sorted by" comment above them. I guess they need one, or
> maybe they can also be alphabetical?

Maybe it is just me, but my brain is too used to seeing those ones in
something approaching canonical order. I'd rather keep them that way &
then alphanumerical for everything else?

I also noticed that the CMO stuff wasn't actually in the comment's order
anyway, so needs a re-sort to begin with. A vote in favour of
alphanumerical.

--kb7QvTX+biQwTglT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGYLFwAKCRB4tDGHoIJi
0grUAQCAc20dh6ItbijltjfIQVgSoT3hDJT0l6RFsHHzB6r/XgEA+HoYzGYleux9
54r2MbYTuE0fuZ9acteU6CIgBsX0Fg0=
=8leH
-----END PGP SIGNATURE-----

--kb7QvTX+biQwTglT--


--===============1327383177578136055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1327383177578136055==--

