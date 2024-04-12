Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2024C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 09:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnAT6/jnmiwrKyT9ASWbc/Ae5DFTgC7fXM0ptoOPLdc=; b=i2465kCA72J9MAPNqyqEsXUIld
	eYvwmyXuK3DXZ7UjyFKlwUT+xti1F67OvLxVRm2BK1sBfPYPBCfYy7/wm1OL9JlCt9m/pvx8sjiWn
	17wSiFJ9dLaKNeATcwcjiKd8Hdw5MaMphvC4iE/tIbaGKunr9mr+LPavjVDw4xorEgjdma7Hh02hr
	rkGwMoM4fX3GGLqDMyxd+Ekjsv3ODxsQrIVFotJ9t9dpjh3nV6DsKqNXx2hqKwb/UeiQ8T8lGi0pD
	410g7iqKVOvNDFEeBce4viAsk3F7L4CiwIdq0e9WRvAz5HJDbtyHmejgCcXak2Y6MgWc2Kds6dUFK
	hJ/TaZTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvDOW-0000000GUAz-0wBc;
	Fri, 12 Apr 2024 09:40:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvDOS-0000000GUAB-1epQ
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 09:40:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1712914824; x=1744450824;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AyddXRv/DnT91t6B+nxCTZtHVLA1ljNAIxVGwn0e3Vk=;
  b=2BiIcyegq+r9EdDKwcaQRGYz3Z26VfX74vP4LKJ0bgeNGe5+6SGxLAJZ
   JvWtwkOLLuajT7L8Wf4iELnUrkpr4JCF6ZIb6yYhzcaAhkrAj128RaPIb
   coSagEVSEVd36izZKtM3A/0JW8gV1jbSFxip41nx1vmIMW39k4YQ3+t2p
   onroT+BN1AYR5ndMkpjyD+ut+FqqD3qhVABndY+PVbRW9ZQOmB6/sXkyT
   mLW0zrhJFYIL2DsK12W5NYDQlAq4henRfUu4ZyR5qEOHnzooDkdo+azL+
   qAH7YJ5l9LhGGlbU+btDjLVXbTsB1Hy17Mxqzk+fxdw4tZPU4TH+CpXxW
   g==;
X-CSE-ConnectionGUID: yozmjWR8Rd+BhRpS7jT2WA==
X-CSE-MsgGUID: 7iK6SCRqSQyqm/KKGnCunw==
X-IronPort-AV: E=Sophos;i="6.07,195,1708412400"; 
   d="asc'?scan'208";a="187998476"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Apr 2024 02:40:19 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 02:40:10 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 12 Apr 2024 02:40:08 -0700
Date: Fri, 12 Apr 2024 10:39:17 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <wefu@redhat.com>, <jszhang@kernel.org>, <alexandre.belloni@bootlin.com>,
	<robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <guoren@kernel.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 3/5] drivers/rtc/rtc-xgene: Add "snps,dw-apb-rtc" into
 the "compatible"
Message-ID: <20240412-rummage-superbowl-a342f179e482@wendy>
References: <20240412080238.134191-1-wefu@redhat.com>
 <20240412080238.134191-4-wefu@redhat.com>
 <86bf8248-2443-4ced-a67c-7845fef98fd3@linaro.org>
MIME-Version: 1.0
In-Reply-To: <86bf8248-2443-4ced-a67c-7845fef98fd3@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_024024_636414_D212B1A0 
X-CRM114-Status: GOOD (  13.22  )
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
Content-Type: multipart/mixed; boundary="===============8119616338858860487=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8119616338858860487==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ge0GmYIBWwIaJ/Yq"
Content-Disposition: inline

--Ge0GmYIBWwIaJ/Yq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 11:17:38AM +0200, Krzysztof Kozlowski wrote:
> On 12/04/2024 10:01, wefu@redhat.com wrote:
> > From: Wei Fu <wefu@redhat.com>
> >=20
> > This patch add "snps,dw-apb-rtc" into the "compatible".
>=20
>=20
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/sub=
mitting-patches.rst#L95
>=20
> This we see from the patch. Say what hardware are you adding?

The compatible, unless I misread the patchset, isn't actually documented
either, only the new property is.

>=20
> Please run scripts/checkpatch.pl and fix reported warnings. Then please
> run `scripts/checkpatch.pl --strict` and (probably) fix more warnings.
> Some warnings can be ignored, especially from --strict run, but the code
> here looks like it needs a fix. Feel free to get in touch if the warning
> is not clear.
>=20
>=20
> Best regards,
> Krzysztof
>=20

--Ge0GmYIBWwIaJ/Yq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhkBOQAKCRB4tDGHoIJi
0nF3AQCpqrVUssnT4yWndlvpuzz0fOX4zka9/Ej3nX5vfZgsawEAzVtgKBzcU07+
FaxCvDk/mWbBtLR+GALH91nw0Q+wEg8=
=Cg5S
-----END PGP SIGNATURE-----

--Ge0GmYIBWwIaJ/Yq--


--===============8119616338858860487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8119616338858860487==--

