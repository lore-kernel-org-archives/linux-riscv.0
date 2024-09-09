Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B44ECE579
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 10:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5PiH4gwU851qliGwBOHBy+0LSImLSLJ4vJ1AVQHs+M=; b=MQlXzeG1q3bk8ScQ2syR0U3VQA
	ZZt5xv/8Y3f4gY/JHTLLWE9OhtQtX6t34PmchAN29fGOjfk+7ewYhk9YVqtpvha1wDBQ9iihMi3G+
	XsKBq86bQVZoMUe7aVVEm5E7mmzRJZvWdBuaFcYvCy6XmnX5ugkeoRiYmqlU3cr10Alji5XWREk7q
	BtuqGrTU49vbJvRbk4i1DtejSPiU8m40jtWYGvN/Fx4h3d04weJB88tULXMCUCz5tz8SDFXIQSUg0
	f91i/x4R4h2V289meAdO2l6DkPa9LH+6IAijCRtHscAFIWn5g/3rRxL2nvKEUKSbDBaBJVnSNC43f
	YEpjcp5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snbUK-00000001Txe-1FRy;
	Mon, 09 Sep 2024 10:19:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snbTl-00000001Tmk-1zin
	for linux-riscv@lists.infradead.org;
	Mon, 09 Sep 2024 10:18:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1725877122; x=1757413122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tIl/YJLpYvs/TThG/hy945WRcGfsN7p0+d+XW5VLkZ8=;
  b=hjL6sJ3mRutDuwoo278s3isW+72dS/G5Uw20HfTqYSrHviPg4JfHAHpX
   gIK07AQlrZWYLs7OV+Wnocxfu/ucBQBHB+iBcJtmXEaIC7xsu6+vxbzbp
   qBkVzjN2EdtPtV/89Sv50jQPFvta4kmtA4+vm5nXnSSmIO3Jn7wQsOcPX
   5wzXzPYHhxoFASRyus9y7Tp99yYDXSTTA46KakmAHspNHt0O0LQsNPZOa
   bd/vku97yG3Qx+mgkrCJYAginKJtRG1ojcgwEbJcWV1wnOBR0/4DInd0P
   igm/atm6T0RJyxGvzxe3PxyHHMQa59ipZDB2VbomdZnociy2TY7J8iHgu
   g==;
X-CSE-ConnectionGUID: FaCcdkUXQ1iQi8THvrR/tA==
X-CSE-MsgGUID: /bM7iPiJR8ultVWPqJQGxA==
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="asc'?scan'208";a="31498624"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Sep 2024 03:18:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 9 Sep 2024 03:18:34 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 9 Sep 2024 03:18:30 -0700
Date: Mon, 9 Sep 2024 11:17:58 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: WangYuli <wangyuli@uniontech.com>
CC: <stable@vger.kernel.org>, <gregkh@linuxfoundation.org>,
	<sashal@kernel.org>, <william.qiu@starfivetech.com>,
	<emil.renner.berthing@canonical.com>, <xingyu.wu@starfivetech.com>,
	<walker.chen@starfivetech.com>, <robh@kernel.org>,
	<hal.feng@starfivetech.com>, <kernel@esmil.dk>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <richardcochran@gmail.com>,
	<netdev@vger.kernel.org>
Subject: Re: [PATCH 6.6 1/4] riscv: dts: starfive: add assigned-clock* to
 limit frquency
Message-ID: <20240909-fidgeting-baggage-e9ef9fab9ca4@wendy>
References: <D200DC520B462771+20240909074645.1161554-1-wangyuli@uniontech.com>
MIME-Version: 1.0
In-Reply-To: <D200DC520B462771+20240909074645.1161554-1-wangyuli@uniontech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_031841_679956_0FFA1BD8 
X-CRM114-Status: UNSURE (   9.32  )
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
Content-Type: multipart/mixed; boundary="===============4122905780903815730=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4122905780903815730==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rBzuFpmdaeKLjDQC"
Content-Disposition: inline

--rBzuFpmdaeKLjDQC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 09, 2024 at 03:46:27PM +0800, WangYuli wrote:
> From: William Qiu <william.qiu@starfivetech.com>
>=20
> In JH7110 SoC, we need to go by-pass mode, so we need add the
> assigned-clock* properties to limit clock frquency.
>=20
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>

What makes any of the patches in this 4 patch series stable material?

Confused,
Conor.

--rBzuFpmdaeKLjDQC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZt7LVgAKCRB4tDGHoIJi
0r3UAP9HR5mU/RutuFppy65U3q0D7i129EDL2Zh5HCsiIL48YwEAvSdcIMGjnuaH
T/LYM7x+opdeozaYtb1S58WtiVokywE=
=di5l
-----END PGP SIGNATURE-----

--rBzuFpmdaeKLjDQC--


--===============4122905780903815730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4122905780903815730==--

