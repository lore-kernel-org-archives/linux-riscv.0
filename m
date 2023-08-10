Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A953C001DE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 10:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9c2kVUyDyU1CYcpU4xAYQz1sBjOm5cfeIGYD8HXAlM=; b=AGmE88T8zBeFeC5RbtK32Hio/x
	oGs+LavsBMFe8/csWCDKgoQlyKdBGgEpnjqaX6ij0zcPpzHvtSeIJHzzeKRDgRM/fxn9ZKZ4zS4el
	fahFrOThhQKXNHbFU48NAzCrs4fZR3Trn+3oO+e4PDikOaS9mkznEdySnYP2WgBFRpIonGasgOabT
	WpMyvW25Ejxo1QepQ8ZH/b4jENiImtx+AKBR5QSzWaRJwKE8Lu0oRaui3mI/vRA7+qekWe2ceMF8b
	XBixslIJS/XJAJNufSHpULxeTYS0xK/Klstu3WXOIOZT8EeKS7VWZklGrsNznNf+Jh9vKWUjR6bcl
	+cAthL3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU3EO-007HWd-16;
	Thu, 10 Aug 2023 10:49:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU3EL-007HRj-03
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 10:49:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691664564; x=1723200564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FDXq+aX/afVuVzyBcXeGCcLoxEtW/3tSfHqYvuf2Kfw=;
  b=ymJfe/YxNryU+byBnqe81slvcqfrLa8wrAynvkbYpmWlsl8Nn+DNztLb
   nZgzC1PpEsoy6rSgmwsiro2EtN1M96VaOYw0MvKKQO8md6SdyxGmfJJQ9
   mWDrb2fSobSRW3UWk9V2WOXg88m3j+TL8JFgNY5Le3FzYG1T7BIE5gQtf
   eExggnwNyIIwlY8YhCBhZSkLClK9wEUOxyZjK01duY4cevu0X/SqzVpGH
   EkBMCA05MaHY5cTm3Ysma+MjBQv6zMpSE5vmZMSXlz/Wqcz99754WWEoi
   6muA/6udRkU0ffR09qq/YLSMkS2FMTFiOL+ORIvL2VG6RyDX25PAVUFs1
   w==;
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="asc'?scan'208";a="228216734"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2023 03:49:20 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 10 Aug 2023 03:49:18 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 10 Aug 2023 03:49:16 -0700
Date: Thu, 10 Aug 2023 11:48:38 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Samin Guo <samin.guo@starfivetech.com>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Emil
 Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [-next v1 1/1] riscv: dts: starfive: jh7110: Fix GMAC
 configuration
Message-ID: <20230810-suitable-truffle-eac5d7f93377@wendy>
References: <20230810074646.19076-1-samin.guo@starfivetech.com>
 <20230810074646.19076-2-samin.guo@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230810074646.19076-2-samin.guo@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_034925_101007_6B061735 
X-CRM114-Status: UNSURE (   8.60  )
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
Content-Type: multipart/mixed; boundary="===============6799644664727280118=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6799644664727280118==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cBYCaHNShJUTrmWz"
Content-Disposition: inline

--cBYCaHNShJUTrmWz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2023 at 03:46:46PM +0800, Samin Guo wrote:
> Fixed configuration to improve the speed of TCP RX.
>=20
> Before:
>   # iperf3 -s
>   -----------------------------------------------------------
>   Server listening on 5201 (test #1)
>   -----------------------------------------------------------
>   Accepted connection from 192.168.1.4, port 47604
>   [  5] local 192.168.1.3 port 5201 connected to 192.168.1.4 port 47612
>   [ ID] Interval           Transfer     Bitrate
>   [  5]   0.00-1.00   sec  36.3 MBytes   305 Mbits/sec
>   [  5]   1.00-2.00   sec  35.6 MBytes   299 Mbits/sec
>   [  5]   2.00-3.00   sec  36.5 MBytes   306 Mbits/sec
>   [  5]   3.00-4.00   sec  36.5 MBytes   306 Mbits/sec
>   [  5]   4.00-5.00   sec  35.7 MBytes   300 Mbits/sec
>   [  5]   5.00-6.00   sec  35.4 MBytes   297 Mbits/sec
>   [  5]   6.00-7.00   sec  37.1 MBytes   311 Mbits/sec
>   [  5]   7.00-8.00   sec  35.6 MBytes   298 Mbits/sec
>   [  5]   8.00-9.00   sec  36.4 MBytes   305 Mbits/sec
>   [  5]   9.00-10.00  sec  36.3 MBytes   304 Mbits/sec
>   - - - - - - - - - - - - - - - - - - - - - - - - -
>   [ ID] Interval           Transfer     Bitrate
>   [  5]   0.00-10.00  sec   361 MBytes   303 Mbits/sec        receiver
>=20
> After:
>   # iperf3 -s
>   -----------------------------------------------------------
>   Server listening on 5201 (test #1)
>   -----------------------------------------------------------
>   Accepted connection from 192.168.1.4, port 47710
>   [  5] local 192.168.1.3 port 5201 connected to 192.168.1.4 port 47720
>   [ ID] Interval           Transfer     Bitrate
>   [  5]   0.00-1.00   sec   111 MBytes   932 Mbits/sec
>   [  5]   1.00-2.00   sec   111 MBytes   934 Mbits/sec
>   [  5]   2.00-3.00   sec   111 MBytes   934 Mbits/sec
>   [  5]   3.00-4.00   sec   111 MBytes   934 Mbits/sec
>   [  5]   4.00-5.00   sec   111 MBytes   934 Mbits/sec
>   [  5]   5.00-6.00   sec   111 MBytes   935 Mbits/sec
>   [  5]   6.00-7.00   sec   111 MBytes   934 Mbits/sec
>   [  5]   7.00-8.00   sec   111 MBytes   935 Mbits/sec
>   [  5]   8.00-9.00   sec   111 MBytes   934 Mbits/sec
>   [  5]   9.00-10.00  sec   111 MBytes   934 Mbits/sec
>   [  5]  10.00-10.00  sec   167 KBytes   933 Mbits/sec
>   - - - - - - - - - - - - - - - - - - - - - - - - -
>   [ ID] Interval           Transfer     Bitrate
>   [  5]   0.00-10.00  sec  1.09 GBytes   934 Mbits/sec        receiver
>=20
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>

This is
Fixes: 1ff166c97972 ("riscv: dts: starfive: jh7110: Add ethernet device nod=
es")
right?

--cBYCaHNShJUTrmWz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNTAhgAKCRB4tDGHoIJi
0oyRAQCGxq1Ij9YjDmvVTz5NImFOCOe35i94DWSGC+fLqZ8T+AD+PU0pBDtyiAVB
izIiCjD2XZAeqAG13zoGlo9xravjiwY=
=0jis
-----END PGP SIGNATURE-----

--cBYCaHNShJUTrmWz--


--===============6799644664727280118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6799644664727280118==--

