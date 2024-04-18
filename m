Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C055FC04FF8
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 10:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDsXCvLkIlN6mra8z2sEleMqkjO1dxSuS4HVjfJoUCU=; b=J3TicLbelY2iOReAR4Qq/aTfBN
	ypwP8HwAx5TxkGHBma45eh+zNwIzP713zEK0AcWPqqZsGNDAWBlcVEqYs41/TwGQhwgAlhFe+xtOY
	Ul/IWuzypTKBddlRGTT4W5Nn8K6YQspISp29GZM3u4ARurVccCUtNeBKEmvRrm1RcpLLh2St7dlLQ
	tMsWWnBXtoq3U63gpkW14R6+DUMiJGpLxfvrtrT7s+wyNgfmQ+uCQc51GSJG7tFteRrht1FWTeuMT
	EESFNkRgXRLHxbKfkd2eeIColMW5ZTklJrh/R99jTBvDx9Do34NC08mzkhlPDE8rzBVgblpoC8S+k
	nHx6y0Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxOu4-00000001mQZ-17N0;
	Thu, 18 Apr 2024 10:22:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxOtz-00000001mO2-47Gz
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 10:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1713435720; x=1744971720;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9hq0MbHS2MZ4Vl7dzWJ4AWW2yuB2FdAWiTYckqmPylA=;
  b=TVBSPkuVgJ2vH/yKcWfokg7ikVNClafavCAN3GYVHxXaX/eH5b/1WWzZ
   fXTBoT80w+Fzmf4YuKlJPbOztA6sUQiPxebcox9wYDIYUEeHVX2K9hIDy
   x7OrTeeORkNcbEJOqQkTrwJ6UXTfC/chUTfEC5+Q45gPfsd53QhTMI3qE
   ryRAWi+OCIabUDeYh8NNOKPxCRPbPHvV1iN8iDFac+myU2NIrs8dBlahT
   r650H/Wf61l0ZHkJytyEKYdyBfuBKUd1605cRnGmTnKW2FsquybTkcXkE
   tpy2yUL0oYv1eny1yD9KK1Jb2FK1EW7YGxN8RfNj08RdTJBt+AmJdmbt4
   w==;
X-CSE-ConnectionGUID: 2BlBkMo/RkCgCTcxqrBIpg==
X-CSE-MsgGUID: fof2w0dDS92WJg8ouQypAw==
X-IronPort-AV: E=Sophos;i="6.07,211,1708412400"; 
   d="asc'?scan'208";a="21586637"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Apr 2024 03:22:00 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 03:21:37 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 18 Apr 2024 03:21:33 -0700
Date: Thu, 18 Apr 2024 11:21:18 +0100
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
Subject: Re: [PATCH v4 5/9] dt-bindings: riscv: add Zve32[xf] Zve64[xfd] ISA
 extension description
Message-ID: <20240418-litigate-zippy-d05379b5ace0@wendy>
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
 <20240412-zve-detection-v4-5-e0c45bb6b253@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240412-zve-detection-v4-5-e0c45bb6b253@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_032200_178707_512BCB6B 
X-CRM114-Status: UNSURE (   9.11  )
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
Content-Type: multipart/mixed; boundary="===============2651657987324531593=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2651657987324531593==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IKul8mjn3Ad3mqHY"
Content-Disposition: inline

--IKul8mjn3Ad3mqHY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 02:49:01PM +0800, Andy Chiu wrote:
> Add description for Zve32x Zve32f Zve64x Zve64f Zve64d ISA extensions.
>=20
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

Technically this should be before the patch using them in the kernel,
but=20
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--IKul8mjn3Ad3mqHY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiD0HgAKCRB4tDGHoIJi
0n1wAPd1er7jDl4Eexl9WWN83HD+Ca2d7uVxpq71neDpZ5hxAQDgD/U89OOnw5dd
hmkxzNHP/2AVHlS/1DyRsZjUghB3AA==
=ofyD
-----END PGP SIGNATURE-----

--IKul8mjn3Ad3mqHY--


--===============2651657987324531593==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2651657987324531593==--

