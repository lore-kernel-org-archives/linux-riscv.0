Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891C1C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 11:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJmx7FpTFDnB4GDSPPiBlcYgosHRPUycPxd/2PBw/bE=; b=bt1Bk2Yn+9wj7gDiWwPPNV5jG/
	zFBqO/+h+J+kXFTHCMNI/ilL0MRiF89txJleit/TjxP54IBqZZqrYTuqpeNvNZ/aYJm/33DfnD2dN
	xf8Zkto9QDyvuWQBQxQ+vqiRQ0ER1IRNHJZmACBya65pMp7CpX/n2paNnU2bKa3tJE/YMCgIzc+uC
	Sxn6tyhLKT9jun68wraJsOu2999Do7a7RQsrqDLC4k/OWMsdpw/7BrIHILa8B0NKa4iph72i+ySTV
	7GmCQmiL1RFmbYHFqJ3ufi9ZX+drnFLRzxixIGHZo0EeJUH64mHn+KgggFfqukAtq2IqlyQSgP6As
	OnUKUOww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvF5k-0000000GvEC-3bO2;
	Fri, 12 Apr 2024 11:29:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvF5h-0000000GvCW-1j73;
	Fri, 12 Apr 2024 11:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1712921349; x=1744457349;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iquIxgsQ5Z0mH9RFgypFv0gNEXhHWS+sF3ZCfjbshog=;
  b=DnUYCztZc4n08wUpkJ9KzxUEULZvyuBmpGEiRENqw+spcJ2dWC92zDlD
   vDZ/sHLjbSjVXjRpWKzSaEJoO0pfaJ0gk0t2IEbjwOZkhLAZ139Z2zV7G
   M5Ot1ithL9PEMtqrrFA5hCgTK58drIpy5LuZuQnNXXQUzYbdNqPpauXbQ
   KcJxU6ivrWbWC4kce+5dQbQsl44ZpGWvu0Ynk/qNgsGiFPZ3k1SIUOMLB
   LQDggLzfYT5DMGeifUQ4YKaQ67q4vyIi8AKC+JWdqoqjQQBKIgqWpJpOj
   QBEZ0GhphGhkQ62FIi6HAvsLBYYRo8XaV+0lXUA8xEuPDFlzfYzMkpYJX
   w==;
X-CSE-ConnectionGUID: UqSsJJfvSp2/HXPpn3qbvQ==
X-CSE-MsgGUID: gSMNaP1WQzarJHb4JiP76w==
X-IronPort-AV: E=Sophos;i="6.07,195,1708412400"; 
   d="asc'?scan'208";a="22708479"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Apr 2024 04:29:08 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 04:28:45 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 12 Apr 2024 04:28:41 -0700
Date: Fri, 12 Apr 2024 12:27:50 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Charlie Jenkins <charlie@rivosinc.com>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Evan Green
	<evan@rivosinc.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?=
	<cleger@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<shuah@kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Palmer Dabbelt
	<palmer@rivosinc.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-doc@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 10/19] RISC-V: define the elements of the VCSR vector CSR
Message-ID: <20240412-viper-bullish-d57d19805a0c@wendy>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-10-4af9815ec746@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-10-4af9815ec746@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_042909_479986_D120E0EF 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============6707976494855866120=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6707976494855866120==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1/ezE870fxXOLLQw"
Content-Disposition: inline

--1/ezE870fxXOLLQw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 09:11:16PM -0700, Charlie Jenkins wrote:
> From: Heiko Stuebner <heiko@sntech.de>
>=20
> The VCSR CSR contains two elements VXRM[2:1] and VXSAT[0].
>=20
> Define constants for those to access the elements in a readable way.
>=20
> Acked-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

You need to sign off on this as the submitter Charlie.

--1/ezE870fxXOLLQw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhkatgAKCRB4tDGHoIJi
0qMCAP9WmrMY90YHP5yda7KsglQlByWGisuGhCvnYWypcd/ApAEAs5xulwNb27Gc
2B7pEO73kwar/VMuJdyiGb3RMX/V4Ao=
=n51g
-----END PGP SIGNATURE-----

--1/ezE870fxXOLLQw--


--===============6707976494855866120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6707976494855866120==--

