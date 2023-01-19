Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D8FC004D4
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 18:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpq103zvfV95NwVvLHe+bUN5hqnIOxANNBfrJtRrQkE=; b=keOoH8qfgVjl7SbJXzbRVo4QL2
	zagrMbLXP3vdAgMylJcTLh9tQ8ZtVhRmREyvIjwHtjm0ozqaC+rHwuEeB8suLF8FTR2da+rqoyauj
	z3ybJZD/p5TNnTzfov6zCy1gm0sW3YMzn+S5wrb4eoiDZbL9BwPn2+eGVK/2aLV0l+KbOt4+qr5g+
	gJ7HqTadINdbC8552ZVRzJtSqHRFH/AKVfmzXH1Eep7CIVLQmZ9zF39ISe4Uk4BnNVe47Z+dG0XOT
	1mbzIqKmPQ/mqct5M5PsXshP70iTYj8KXF0znPy3XBhY1m8++K/1pNJo1WCCWqqsdT+SbmXeFE6Ky
	DfEVeuuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZsl-006c2p-Ku; Thu, 19 Jan 2023 18:43:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZsj-006c1k-4x
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 18:43:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A043FB825EF;
	Thu, 19 Jan 2023 18:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63261C433D2;
	Thu, 19 Jan 2023 18:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674153802;
	bh=vF/z5qpyXP/mL10MG7EvPirP8eSE/txoS1bJzYmIYPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LzvGBaP/l+y/aBXX3v0npik84cCY1DzBJscI5jxbYKBb3zILhlGtoDoQp2ZMPy+Cy
	 WHtoa4ZVFyjrBAqRcpqpiPUejOAx5K2HtT4Qhy+TOtc08TWCeq7VxNz+1oj6ETt6Q9
	 ZMgwkoh1km/yo3W5vXjpst8RLohLNfj+t6SpayNbp+9RiQ+/sJ3a/UEg8h62bmU5aF
	 xYzqs7MNpc+TcSjmTNx5u3M4S8aSFh2tgDIUGEi/8NUzKpOwaLHXLkg8aO3Y9zqL/G
	 aS6I29C1ZmYj99R1kC4TO+c3J50+RlRyQjSYYP95R3+xabEHG/uX2JZsZazmU8POxO
	 HkuD0zfSKFb3A==
Date: Thu, 19 Jan 2023 18:43:17 +0000
From: Conor Dooley <conor@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] riscv: dts: starfive: Add mmc node
Message-ID: <Y8mPRQnGPpAhpu8C@spud>
References: <20221227122227.460921-1-william.qiu@starfivetech.com>
 <20221227122227.460921-4-william.qiu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20221227122227.460921-4-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_104325_365810_8225E18E 
X-CRM114-Status: GOOD (  13.85  )
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
Content-Type: multipart/mixed; boundary="===============0937615947652134139=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0937615947652134139==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XKsT41m8CI9UsBxP"
Content-Disposition: inline


--XKsT41m8CI9UsBxP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey William,

On Tue, Dec 27, 2022 at 08:22:27PM +0800, William Qiu wrote:
> This adds the mmc node for the StarFive JH7110 SoC.
> Set sdioo node to emmc and set sdio1 node to sd.
>=20
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-v2.dts         | 25 ++++++++++++

FYI, this file does not exist in the v3 Devicetree patchset sent by Hal
Feng:
https://lore.kernel.org/linux-riscv/20221220011247.35560-1-hal.feng@starfiv=
etech.com

Would you make sure that future revisions take into account that there
is now a jh7110-starfive-visionfive-2.dtsi file instead?

Thanks,
Conor.


--XKsT41m8CI9UsBxP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8mPRQAKCRB4tDGHoIJi
0toIAP4zpbU0OLSqlFxJVLB/Y+fIjOaoIFT/p8c4yIjZ70N3XAEA5X6zPiLp8UDG
nNz0GgJfub7PTipxdxFuprUVZpvnkAg=
=roCg
-----END PGP SIGNATURE-----

--XKsT41m8CI9UsBxP--


--===============0937615947652134139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0937615947652134139==--

