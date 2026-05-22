Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A58FCD4F3D
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 07:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7z1ILkebw5qyPTctb2ApO7IZ3ohwXx/qcSzftUvKoU=; b=pzuS3GMzDiXuYgXfGxFEc8oscy
	40gIWrSruflVD0Ov7xnB0sjCTEBaQzjWwWkGiqcq4ZEqbKtpJ08QFyqJjVirCn9Czl1iKazCqo2MS
	fx/SGiEkgO1h0epXOA+ImS4Tbt8aDIEkhBnbP+oq25T7HLsR3fmOwY9D2bmkjX4gb3oaCOEiF9sxo
	QmghbRbD3/84QWAcltCXDheoa+dZERHshmLHnrvJbRnsk3JeUWuZYPwPJjI3Ac21+MIedV1Ryc2SD
	u19rxTy8PJOixTmPMQDd/qf7SXFcDNDim/0namP4MOXwKbC+jwgFytf2c+bD4U2UCP3EKxESI/9wp
	s9AxvdOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQKGD-0000000A4wg-3U6Y;
	Fri, 22 May 2026 07:25:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQKGB-0000000A4vq-12D3
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 07:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779434731; x=1810970731;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Me5QERVwlsG7DT9s02Fuc2SFcWwdDlykFZlBaHyZoZQ=;
  b=pbRZqEMTC+oKCGFS0sPUPiv/reKA/jZKnppFWuZKtbBaIr5eneA0dfUE
   7a8rF0Wbkp+rl4sm4cgknvPP7O+6TsckAqZTtdI3IHXcFiipnebDYhrtJ
   yG3jg9jR32dCgwTC5wJIcxacTyt15g5QO7Xk8TYaZYu0oA+Er+SKqgUOf
   tppo80VmwY/sarVuyFXR+oH/M5p5I1tfaVQomwSDt/LGxa1oCbeVCdTdq
   xruZnfSjQl5o6uNXznODcMtFrH/aycH58e6zAEN/USROWLmnEOMXrXMZJ
   3xJVUrrbb+J5mR41zGqArzkPcFl+gyJ1VW9YpcVB0k4VmjI0/DYG+le2u
   A==;
X-CSE-ConnectionGUID: tUmhS4AxTqWFWFOKBEQuGg==
X-CSE-MsgGUID: cVxBwvSETaew3tD63fdjJw==
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="asc'?scan'208";a="225146713"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 May 2026 00:25:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 22 May 2026 00:25:28 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 22 May 2026 00:25:25 -0700
Date: Fri, 22 May 2026 08:24:45 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Xukai Wang <kingxukai@zohomail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Samuel
 Holland <samuel.holland@sifive.com>, Troy Mitchell
	<TroyMitchell988@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v12 0/3] riscv: canaan: Add support for K230 clock
Message-ID: <20260522-eligible-vivacious-3ce9bc30dd53@wendy>
References: <20260425-b4-k230-clk-v12-0-7d5ced1f5da8@zohomail.com>
MIME-Version: 1.0
In-Reply-To: <20260425-b4-k230-clk-v12-0-7d5ced1f5da8@zohomail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_002531_554536_379126A0 
X-CRM114-Status: GOOD (  13.03  )
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
Content-Type: multipart/mixed; boundary="===============3389655522598811662=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3389655522598811662==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Z/30xz3oQLOBJj/M"
Content-Disposition: inline

--Z/30xz3oQLOBJj/M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Sat, Apr 25, 2026 at 05:29:30PM +0800, Xukai Wang wrote:
> This patch series adds clock controller support for the Canaan Kendryte
> K230 SoC. The K230 SoC includes an external 24MHz OSC, 4 internal
> PLLs and an external pulse input, with the controller managing these
> sources and their derived clocks.
>=20
> The clock tree and hardware-specific definition can be found in the
> vendor's DTS [1],
> and this series is based on the K230 initial series [2].
>=20
> Link: https://github.com/ruyisdk/linux-xuantie-kernel/blob/linux-6.6.36/a=
rch/riscv/boot/dts/canaan/k230_clock_provider.dtsi [1]
> Link: https://lore.kernel.org/linux-clk/tencent_F76EB8D731C521C18D5D7C4F8=
229DAA58E08@qq.com/ [2]
>=20
> Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>

I applied this with the intent of sending a PR to Stephen, but lkp
reported some problems during randconfigs:
https://lore.kernel.org/oe-kbuild-all/202605220724.j4ZeM3KI-lkp@intel.com/
These showed up on microblaze, but I think as they're all from sparse
you should be able to see them on riscv too.

Should all be pretty easy to fix, send a patch and I will squash them
in.

Cheers,
Conor.

--Z/30xz3oQLOBJj/M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahAEugAKCRB4tDGHoIJi
0uGyAP9agbdCIhax2QTKY8ZBijDMko96YkubUzkb16tpoAg4fQEA6GxWZENh2En2
j3YHPCeNRSFrYYVr7fEXMxcbud00xQg=
=FzcN
-----END PGP SIGNATURE-----

--Z/30xz3oQLOBJj/M--


--===============3389655522598811662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3389655522598811662==--

