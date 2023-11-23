Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F6CC61D85
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 09:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1m+khDgA26yAdPwfK54J8w0DZWPytEAj9Zv6j5arUkA=; b=CMz3Hozl9jjdoTxwjUO+adIJpr
	J1b9pEryjAl6ngRSpzpA7hcPR+jHxDt88smPzEmffUrGww1mwFHTzm8AxBKATMnPziWZ1r6Cu5KC0
	8Fx+gOyqyWqnwMdn3BxhfgV2Ij2IXWEcNcu+DVlxtsBLzbY1nW3z4ohDzrBtKC6Gtxy8SfNocJN5s
	VMt1L42TSl0toe3h1C6OvYkYKAWqWp9ezEfTTjRY2CNVlzj+O63gqmXQ7Jv+lARX33z+4w8gBR5sE
	6LPBb6JdMqkKf3ZAkYFLqshhs6KL4SYsCkiEW/zvsjDMNyjJbHEbYeKxkJeQSfbzlR2Y7bTZoqiP3
	Ih9Q/7NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r66JN-004JCg-0y;
	Thu, 23 Nov 2023 09:47:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r66JK-004JC3-20;
	Thu, 23 Nov 2023 09:47:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1700732870; x=1732268870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1PBhagH7/vOdhd9ZeQlcwBuZIBpOl+fh5UyFzBiP084=;
  b=l/fSP1D6dfD6ZY1U/cRkhtKD9+2eaHx7e/9V8g4dYWB0N9jL1zoH9nJ9
   Z/gMOvi1RTIjEKvQ2LZMorePRaFrcjMCwHqrvfTN40oP6oGXbjez+gZ6T
   bVZqX/mdmZbKHYlzteSCJUrJMhuit90XXko/G8qpJn+7+1n3FzgSoTyfe
   00ABNXDaRlYdczch9oC5k8KulOv28OrVZvplVGR9sfH++8vMJOB4K0nT4
   l583dRi0E6c7BsFfHAMw60Vdl1POgMysEVfgsVPL/PCMQiYF5pmbbSpVs
   NLuA2stWod9t+V3tkEzSCuXx6v/iN7wb9gNPjjKQ2wryso478MQwonC1u
   A==;
X-CSE-ConnectionGUID: bmtvjieoQui/t8rcBiXjvg==
X-CSE-MsgGUID: VvY/zu3aQaWWYzr2ptuE+A==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="asc'?scan'208";a="12184225"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2023 02:47:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Nov 2023 02:47:34 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 23 Nov 2023 02:47:31 -0700
Date: Thu, 23 Nov 2023 09:47:03 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh@kernel.org>
CC: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
	<nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Nicolas
 Schier <nicolas@fjasle.eu>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor@kernel.org>, <linux-kbuild@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] kbuild: Per arch/platform dtc warning levels
Message-ID: <20231123-sugar-aviator-337b290f899b@wendy>
References: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_014750_707155_E56F0218 
X-CRM114-Status: GOOD (  12.94  )
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
Content-Type: multipart/mixed; boundary="===============8170539216289682668=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8170539216289682668==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TlOjZ7bCqwxiOxdz"
Content-Disposition: inline

--TlOjZ7bCqwxiOxdz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 03:12:31PM -0700, Rob Herring wrote:
> This series adds support to set the dtc extra warning level on a per=20
> arch or per platform (directory really) basis.
>=20
> The first version of this was just a simple per directory override for=20
> Samsung platforms, but Conor asked to be able to do this for all of=20
> riscv.
>=20
> For merging, either I can take the whole thing or the riscv and samsung=
=20
> patches can go via their normal trees. The added variable will have no=20
> effect until merged with patch 2.

IMO, you should take the lot.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--TlOjZ7bCqwxiOxdz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV8flwAKCRB4tDGHoIJi
0gy+AP42cyrUTh4NL4eY8kIwsVmx5LejeoA0QZDYa85yy0PBgQD9EGKZIEXssWsj
vX2Y6dIUhPn8qia5tz+YByAjUriTEAE=
=2rQT
-----END PGP SIGNATURE-----

--TlOjZ7bCqwxiOxdz--


--===============8170539216289682668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8170539216289682668==--

