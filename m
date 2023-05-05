Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8688C77B7D
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 06:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/9PW/NmGud3YchHEdVSqiAy4vxopFfGvHI2mYN71Hk=; b=ZUQR6AHc88rHtq2qZT1jYnTlGT
	uOiDqRZAHf6twFz5txJjwZWoqVKmdonacgjofy5CX6GAzOv4t0Y5feHH1j4dd/YelFj4oaxuFQD2v
	SAIkhObS6eDz9RIUgFm8MDGzgaByi/fCQhFhx5VM6kzNqo4WfFI/AHTjRf2Tf4AFyBWyw+C7Z3lxf
	i4Tn+ichTZujLq6L1mmrElExuQ5yQeTFEONpPbqZ/m4RAPgIfqXEh5PmomX81ANSmR3bE0aBg2aPi
	v16BeoJDGDV1V0k5xq2MgzlNFGb1mzvoiG9xG34gP98/mToknwZf0KKYyWkmjs8f7WDL4qDQg9gHA
	iuZ+YyTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puoxG-009pcQ-2v;
	Fri, 05 May 2023 06:30:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puoxB-009pap-2Z
	for linux-riscv@lists.infradead.org;
	Fri, 05 May 2023 06:30:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683268205; x=1714804205;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qc7fG6VouXbKbHHlRomViVIdE9mWho9KSNjrEuBZBgs=;
  b=EqoAmoZa+SqR4taK0aXvDkg7htxYwx5Yr0PzobrS6JOTbIbNuMSBcJ3C
   GMC7WO2TMlDGvElJKPvZaNEZbqjJGe8K8EEF6KNAIFm0Eb+EHaDpxF3cG
   SeUXDMwjBkzw86CyvrE5+4bVFeBQuQos4bVfShkm376j2Pfzf87RndGWZ
   Wf1R+UR89s6L0GOi2FSETG0mVPBX7BLmOYMTzIj7yipJoTyTX61UsQBEm
   2N9/tIr2IseUKJm06K26K63KsIcpXYv/Vr5fQ6Prh79MjU/Ykn3Qg8ScX
   Y0uexVesDBkd68TAhPWDIuocZGmSpiKxOKxhl+ar0oxXrwj20VFXdA/Wa
   w==;
X-IronPort-AV: E=Sophos;i="5.99,251,1677567600"; 
   d="asc'?scan'208";a="223952954"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 May 2023 23:30:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 4 May 2023 23:30:00 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 4 May 2023 23:29:57 -0700
Date: Fri, 5 May 2023 07:29:38 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Mason Huo <mason.huo@starfivetech.com>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Shengyu Qu <wiagn233@outlook.com>,
	<linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 0/3] Add JH7110 cpufreq support
Message-ID: <20230505-gusty-corset-e451d947c10d@wendy>
References: <20230421031431.23010-1-mason.huo@starfivetech.com>
 <457c35b5-aec4-1147-673f-947052b5f944@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <457c35b5-aec4-1147-673f-947052b5f944@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_233005_974396_55452F8D 
X-CRM114-Status: GOOD (  10.45  )
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
Content-Type: multipart/mixed; boundary="===============7759347407691212748=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7759347407691212748==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PSNHXBMMJYphhDWy"
Content-Disposition: inline

--PSNHXBMMJYphhDWy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 05, 2023 at 09:38:38AM +0800, Mason Huo wrote:
> Hi Conor & Shengyu,
>=20
> Thanks for your review, and is there any comments about these v3 patches?

Firstly there appears to have been some mess-up with the driver/bindings
for 1/3, so I am waiting to see if the binding gets reverted before
doing anything and secondly it's the merge window so I can't do anything
about 3/3 until next week.

Cheers,
Conor.

--PSNHXBMMJYphhDWy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFSiRgAKCRB4tDGHoIJi
0r5hAP0YWltPpwr1izMQlhksHrJ1Nsu+nh7ZltEKQl+EUT7mZwD+Nja7QwXhJfN8
PS+uHl3ESNKd2rWmiwAV2HVtGWwC7gw=
=N0Ys
-----END PGP SIGNATURE-----

--PSNHXBMMJYphhDWy--


--===============7759347407691212748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7759347407691212748==--

