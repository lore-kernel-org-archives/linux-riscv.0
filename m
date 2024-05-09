Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98860C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 08:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMdc6sig4oUp1BCHyn1mQTBqs1d42H6eflwrQMiJZ8M=; b=bTpq0jyc8Wib9efaLs0znHC7hr
	b97ZFSQhyCjtNoTHypv/rebuqd1uVODSiUh9P4Bp+/b78rANoobdgiz0MjLNMafen27il9Yv7bfiB
	8NefeAhCfCFlP0HZZZ3PUnDCiDSmnEjVxqSJxX8zp/IP0Hdh1ZhaJDNuaLYWT+nSIR0JP6e3xi20r
	gJqO9sg+IMuUvrMbGw8A/gS2dQtGU6tRW4G6OvyxdDzr+ayUaaz8uEmCMf15Usuyf6dG1Q6ryJXpH
	9b0vcpB6q/lVoPn+6/ZGtijiRKWZSJ+BnTI88e+xcQ1o+UyUtTzRNOFnd4Nfec0NBEK+sLo5hdG82
	sgDTRspA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4z6Y-00000000pcH-3Btk;
	Thu, 09 May 2024 08:26:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4z6V-00000000pbr-2fD1
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 08:26:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1715243175; x=1746779175;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lizFEMoTEBeHtyz3VDJYwUzuXXkaTL9FurOp+03QTdM=;
  b=AMdu3RDe+AmTMkyfebgdHaPS9XG7SfMJ6/8mJwE/sYMHcF3N/0YOLPMZ
   mACW8uk0IWCIw3TDzVQk8A6fcnwlbNYtgamafNQNY3QFwgRgqVRwHtNNL
   5zYUVQDxedhpYmOYJW9Bjzqk5hnfDudsDQWdBFJ2Iwh+q2vPyeTNEhh5S
   UOYa2yqX+bVtUzhTV4ZWUEbw/9QD+knUQBhs5nEuL0SgNkvc/VuCij+Fa
   YlTVj599GoWj9O0RDKQcM7V4Zt/Z55eo8quc5e62qf2FXXwx9OnBYiPD0
   GT2HfuEerLhuFxHK8MeuuILea4camUgbNN75FsJ+YSmL967U/KllWaKuf
   A==;
X-CSE-ConnectionGUID: jv5JI/A3QPCNVsdCd9Mb+g==
X-CSE-MsgGUID: UDMgsYuwTqGWVx95aCyr1w==
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="asc'?scan'208";a="191613156"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 May 2024 01:26:14 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 01:25:39 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 9 May 2024 01:25:35 -0700
Date: Thu, 9 May 2024 09:25:25 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>
CC: Conor Dooley <conor@kernel.org>, Eric Biggers <ebiggers@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Guo Ren
	<guoren@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Evan
 Green <evan@rivosinc.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?=
	<cleger@rivosinc.com>, Shuah Khan <shuah@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Palmer
 Dabbelt <palmer@rivosinc.com>, Vincent Chen <vincent.chen@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>, Joel Granados
	<j.granados@samsung.com>, Jerry Shih <jerry.shih@sifive.com>
Subject: Re: [PATCH v4 7/9] riscv: vector: adjust minimum Vector requirement
 to ZVE32X
Message-ID: <20240509-habitable-unrefined-02322f228d5a@wendy>
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
 <20240412-zve-detection-v4-7-e0c45bb6b253@sifive.com>
 <20240418-brook-chili-4d3e61d1a55c@wendy>
 <20240418155256.GA2410@sol.localdomain>
 <20240418-ultimatum-yam-11de4b063b83@spud>
 <20240418173203.GA1081@sol.localdomain>
 <20240418173946.GB1081@sol.localdomain>
 <20240418-sterling-sanding-d59c3b0a2aaa@spud>
 <CABgGipU74TA3KgCH4pPuRefbnYt3q6RKcQwfyspenisEtY6eqw@mail.gmail.com>
 <20240509-mandatory-monsieur-dfa4d7881fa9@wendy>
MIME-Version: 1.0
In-Reply-To: <20240509-mandatory-monsieur-dfa4d7881fa9@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_012615_906021_15A0647F 
X-CRM114-Status: GOOD (  28.17  )
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
Content-Type: multipart/mixed; boundary="===============3293724212959846479=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3293724212959846479==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fd9CceYogHrFCPUX"
Content-Disposition: inline

--fd9CceYogHrFCPUX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2024 at 08:48:09AM +0100, Conor Dooley wrote:
> On Thu, May 09, 2024 at 02:56:30PM +0800, Andy Chiu wrote:
> > Hi Conor,
> >=20
> > Should we check if "v" presents for vector crypto extensions in
> > riscv_isa_extension_check()? We are not checking this for now. So a
> > kernel compiled with RISCV_ISA_V still has a problem if its isa-string
> > includes any of vector crypto ("zvbb, zvkg, etc") but not "v".
>=20
>=20
> Yeah, one of the things I took away from this discussion is that we need
> to improve the implementation of both the methods we have at the moment
> for drivers etc to check if extensions are present and usable.
> In general, I don't think checks like that are "safe" to do in
> riscv_isa_extension_check(), because the dependencies may not all have
> been resolved when we probe an extension (Clement's current Zca etc
> series improves the situation though by only calling the checks after
> we probe all extensions).
>=20
> The simple V cases are all fine though - the DT binding and ACPI rules
> for compatible strings all mandate that single-letter extensions must
> come before multi-letter ones. For riscv,isa-extensions we control the
> probe ordering and probe V before any multi-letter stuff. Additionally,
> we should make it a requirement for V to be present if things that
> depend on it are.
>=20
> That said, is it permitted by the specs to have any of the extensions
> you mention without the full V extension, but with one of the cut-down
> variants you mention here? If not, I'd be more interested in figuring
> out the non-extension dependencies: whether or not the kernel itself
> supports vector and if the kernel has opted to disable vector due to
> detecting that harts have mismatching vector lengths.
>=20
> TL;DR: I think we should add some checks in riscv_isa_extension_check().

Also, unless this only becomes a problem with this series that adds the
cut-down forms of vector, I think this is a separate problem to solve
and I can send some patches for it (along with some other cleanup I'd like
to do as a result of Eric's comments) and you can just submit the v2 you
were planning to without it. I can't, off the top of my head, think of
why this particular series would break the vector crypto stuff though,
the problems with enabling extensions seem underlying.

Thanks,
Conor.

--fd9CceYogHrFCPUX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjyIdQAKCRB4tDGHoIJi
0hcBAQCRofWX8dSzuxqpA0rVYBNGm8WInygUT4+nUrHkr+BHaAEAhVPTVOy9BnkO
2PVLOWUyKNOC8CVZCq9rs7skTcEbaAI=
=w/06
-----END PGP SIGNATURE-----

--fd9CceYogHrFCPUX--


--===============3293724212959846479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3293724212959846479==--

