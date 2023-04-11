Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D79EC76196
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 14:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7fvczU6yAPJYnUNuSluewac2Vv5dB5mHRZHistkEts=; b=l+6+Hrt4JM0+Zf9jc/vw16gRhc
	Y3ohSv3NbvJcpjV/TRe03dr/X+cibK2bgzatEFbRi20D10C0dOkgAZD2pWeJGLi+n5eK8IeQkc5Oc
	iKkK0gQyYYm0iTE1vGZyMtaVRPUa+ERONoReoS3Ps1ch3/7vCnziOInBrWWGvQj95uG2/NWcevNzV
	/OfKKdw9Tadv3LhioNK02jFff+G35vZCQ0T1rl9FSxOXdO/ofmfqBKykqvvdCY/LVDcNYgt98ZaoC
	WmINbwyJu7OMd7eKGQgudLtYzoVrzYiWHdDR0s2S5J0r/TAiSVZIGT8PmRD3q9O1ZjAKttVjrQMtg
	PF97/kjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEeO-000Cpg-1p;
	Tue, 11 Apr 2023 14:07:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEeL-000Cp6-2h
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 14:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1681222029; x=1712758029;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iwXMraFk3rEELAWbRtbHrkEz6gUhWBvUZKer76tBfNQ=;
  b=hxYyfBK6gnN44LuVjpjcWE7/3btCqyNo88aYI+IpCLVnsvqUu4EbUp2t
   yYuL4hl9BTGH0BK5Yf6zRASqf/L+ZD6y/R83M832ZKoBTX2JK2cQTXb6X
   dOobPUMoWKpzVmUQoYHuuyanZx4NkTAMvZGvYybjxMSmuiGcj6pL3KkgS
   +FaZtM5dnC+lVC5Kl0MY3c0A91RqVapqcu0b1VNlGs6mixiNFUo/iZ8vl
   HWLF9We7FCrSQ4OSoGEf7gHCns3JB5WY0ToKI4jIELPmBq5p1odsKNi/Y
   6Mc2byM2id37epODVcON8yCqJPfXAlVfWDxC4nwmnyMZnpJCQu/zbdOIz
   g==;
X-IronPort-AV: E=Sophos;i="5.98,336,1673938800"; 
   d="asc'?scan'208";a="220369799"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Apr 2023 07:07:08 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 11 Apr 2023 07:07:08 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 11 Apr 2023 07:07:04 -0700
Date: Tue, 11 Apr 2023 15:06:49 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v6 4/6] RISC-V: hwprobe: Support probing of misaligned
 access performance
Message-ID: <20230411-prefix-rename-71ab4af0324a@wendy>
References: <20230407231103.2622178-1-evan@rivosinc.com>
 <20230407231103.2622178-5-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230407231103.2622178-5-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_070709_881566_97AEE116 
X-CRM114-Status: GOOD (  14.87  )
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
Cc: heiko@sntech.de, linux-doc@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, Celeste Liu <coelacanthus@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, vineetg@rivosinc.com, Philipp Tomsich <philipp.tomsich@vrull.eu>, Paul Walmsley <paul.walmsley@sifive.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, slewis@rivosinc.com, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>
Content-Type: multipart/mixed; boundary="===============8194772610623345925=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8194772610623345925==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YDuEwp07zFXzbIC1"
Content-Disposition: inline

--YDuEwp07zFXzbIC1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 07, 2023 at 04:11:01PM -0700, Evan Green wrote:
> This allows userspace to select various routines to use based on the
> performance of misaligned access on the target hardware.
>=20
> Rather than adding DT bindings, this change taps into the alternatives
> mechanism used to probe CPU errata. Add a new function pointer alongside
> the vendor-specific errata_patch_func() that probes for desirable errata
> (otherwise known as "features"). Unlike the errata_patch_func(), this
> function is called on each CPU as it comes up, so it can save
> feature information per-CPU.
>=20
> The T-head C906 has fast unaligned access, both as defined by GCC [1],
> and in performing a basic benchmark, which determined that byte copies
> are >50% slower than a misaligned word copy of the same data size (source
> for this test at [2]):
>=20
> bytecopy size f000 count 50000 offset 0 took 31664899 us
> wordcopy size f000 count 50000 offset 0 took 5180919 us
> wordcopy size f000 count 50000 offset 1 took 13416949 us
>=20
> [1] https://github.com/gcc-mirror/gcc/blob/master/gcc/config/riscv/riscv.=
cc#L353
> [2] https://pastebin.com/EPXvDHSW
>=20
> Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Evan Green <evan@rivosinc.com>
> Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

I think I had given you an R-b a few versions back, guess it was dropped
due to changes or w/e :)

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Perhaps at some point the "errata" naming of those files should change,
but today is not that day.

Cheers,
Conor.

--YDuEwp07zFXzbIC1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDVpeQAKCRB4tDGHoIJi
0t7jAQDMNiwdcIYzMff2OO0oRagi00n+9SjD1CMom7IerxVzoQD8DNnuZQ82JyZU
KaysKejn3MqblyvB0zU+J9PRFOQyJA8=
=Skce
-----END PGP SIGNATURE-----

--YDuEwp07zFXzbIC1--


--===============8194772610623345925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8194772610623345925==--

