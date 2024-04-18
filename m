Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25091C04FFF
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 09:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umuhruycIQ/cwe/WS/hW4OlbP4RcAug9YdO2kUmqT2A=; b=XnAzzuO+3+jOWJZzowGFnu7UIf
	taVxGRa0HhpsD+H3V1oS+MqKXuY9Xb5WxFLjiri2YBs4dt5/9HATLfIAxEkTLk6yyQI/JDQT/DTbO
	1ua9vm0WtAB93zOF7RN+m3crUsiIBqTNa64YGcNMfe4gTZefWKvb2QliGkSc+tc++TXxFStsg0LAV
	CJY9insdHYOfSDs+re7RNQtpZH1pHk1daSPpxPjkzJ/J5DR91VJP8WtZwcZDg0sh4LcbHH5UCKUT0
	uWNhYEfqw5lloaUJqdpldtB9fbHi6oxNFu6T76zH1hcORO0dONBAoweDaQ7uD3anu6yBVhCEF9aVS
	oWfsJcRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxOUA-00000001iGf-3iDf;
	Thu, 18 Apr 2024 09:55:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxOU7-00000001iFY-1481
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 09:55:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1713434115; x=1744970115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=duaR1AnrObmqETtxDghvr7defhHd1q2pgv4fpE/MLDo=;
  b=QciYPFcfJ1G8+lC4twTHg58ALKAdRrISYUNQ5rBJTxEVAIB34Ev2Kjdx
   gRVh4e67qxNDOULQ8eWFZ97tm/CPMOl1cZCPTIZnqNX6XsaCAUXQTe6Qp
   eGf8v7/t3go+UYo79gUd/ea4jtELa2WfVqaJ6JWQbtYJ5GItB+auFeY7b
   0H+2zB/HqbuuZxWQme8ZZt+GdoDNED21lD8pyC2CNuDEhxy7Zg8cFlIg5
   CXxP5c2FRQecBpZhxiFDEdmxh7cNHjVHasisWGoV7pDdpuqTL+IAopBZe
   KN3hbw/8KG67sZtEwHH8IBLsi4dhZ23REnrYwD8f9tVurJH+gvWF+v91B
   A==;
X-CSE-ConnectionGUID: ECU7hUHwT6yX4X4vObkvLg==
X-CSE-MsgGUID: G7MHUU6ZS1qzj52fb6t0/g==
X-IronPort-AV: E=Sophos;i="6.07,211,1708412400"; 
   d="asc'?scan'208";a="188872991"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Apr 2024 02:55:11 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 02:54:31 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 18 Apr 2024 02:54:27 -0700
Date: Thu, 18 Apr 2024 10:54:12 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner
	<heiko@sntech.de>, Guo Ren <guoren@kernel.org>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Evan
 Green <evan@rivosinc.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?=
	<cleger@rivosinc.com>, Shuah Khan <shuah@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Palmer
 Dabbelt <palmer@rivosinc.com>, Vincent Chen <vincent.chen@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v4 1/9] riscv: vector: add a comment when calling
 riscv_setup_vsize()
Message-ID: <20240418-harsh-childlike-94403aa132b3@wendy>
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
 <20240412-zve-detection-v4-1-e0c45bb6b253@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240412-zve-detection-v4-1-e0c45bb6b253@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_025515_446646_1C73E186 
X-CRM114-Status: GOOD (  20.64  )
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
Content-Type: multipart/mixed; boundary="===============5139993407523317078=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5139993407523317078==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="stxnFH69aESRe/Ix"
Content-Disposition: inline

--stxnFH69aESRe/Ix
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 02:48:57PM +0800, Andy Chiu wrote:
> The function would fail when it detects the calling hart's vlen doesn't
> match the first one's. The boot hart is the first hart calling this
> function during riscv_fill_hwcap, so it is impossible to fail here. Add
> a comment about this behavior.
>=20
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
> Changelog v2:
>  - update the comment (Conor)
> ---
>  arch/riscv/kernel/cpufeature.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 3ed2359eae35..d22b12072579 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -683,6 +683,10 @@ void __init riscv_fill_hwcap(void)
>  	}
> =20
>  	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
> +		/*
> +		 * This callsite can't fail here. It cannot fail when called on
> +		 * the boot hart.

I am loathe to comment on this again, so=20
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
but you could just write this as "This cannot fail when called on the
boot hart."

Cheers,
Conor.

> +		 */
>  		riscv_v_setup_vsize();
>  		/*
>  		 * ISA string in device tree might have 'v' flag, but
>=20
> --=20
> 2.44.0.rc2
>=20

--stxnFH69aESRe/Ix
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiDtuAAKCRB4tDGHoIJi
0vBwAP98Il+vXK4C3r4MkJnr98Iu2kDKN2juNFv17/2CzU01XAD8DKAV9cWacroD
OxgMcDQ3nbE0Mhf3iWlSh55SQQYoqQ4=
=At92
-----END PGP SIGNATURE-----

--stxnFH69aESRe/Ix--


--===============5139993407523317078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5139993407523317078==--

