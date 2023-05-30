Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF711C77B73
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 10:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NCDrIcu9gLQr96pM8NgB5FnlcqpClzPZsM7BjAEPpGY=; b=JXRGO3bnMJMef+hGD3St0EvzcZ
	6YFspv+77UlBunGSVEWOLfU3gJAbbU5paH6taTSOZkU/6DCr0HZEjTCXpfmCLKoDDz5GIrYCldW1D
	UzoHRdX0oS4sLmNml5Powds71OPDBi/kmpxHLRQBzsUMdKtzqOBhRM4SH3Z8CxKcpsaAnLd3YGMW2
	NEVMRjBnf6vojIpYqg9ARVcW6smeydjzBewrQkCx5eclPLxD3FF6wB/g/BzfM/WbuhwJZCymoJPrA
	cpsqHG86fi6Ufeig6O1ibumvJYe1DAalpufDYRgZTcuP6+wCtRqVvr8XwMIsSguCJfsa6y/P/AA6e
	63EGbzWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3wfm-00DOBc-1e;
	Tue, 30 May 2023 10:33:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3wfj-00DOAm-2a
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 10:33:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 57CED60BA4;
	Tue, 30 May 2023 10:33:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8455EC433D2;
	Tue, 30 May 2023 10:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685442826;
	bh=Fln3Mnh+80acgeHumKpr0UR+mx8aRBQanCGCmvcj6dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R/yWFIcy7CFlAqu0bhA7C9Jz0Ig8CU44fogGfkgP3yLjE0WUmsYsWm+prUozHNWra
	 qMmpvQseC/lYmHINYfLFcU1JJ6DjvVzLI1H86rO+cREwqx7lfejrNfTmN0y7WHcfeH
	 BCC6OaIBiOeetzisYBi281hXqqYT1tP4ERJRiY4ZvgpRwB5Kyt2RaK3x6cC1pBLbSj
	 Fk5b5otjNFDYIG78h7BdI2VjymKekOHKrvM2gVATpabjk8JPuGM/njcEunvntfFCB3
	 NvJvr57w1udDStSh3dQjXQXPyoAV+Hgr32k1vZ/V36WbhvCkEXsuVYHdRAZFR8Y31Y
	 1vISdIHEiUh6Q==
Date: Tue, 30 May 2023 11:33:41 +0100
From: Mark Brown <broonie@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Ziv Xu <ziv.xu@starfivetech.com>
Subject: Re: [PATCH v1 2/3] spi: cadence-quadspi: Add clock configuration for
 StarFive JH7110 QSPI
Message-ID: <eb68722b-bcab-4aa1-aa4e-54bfe95ef414@sirena.org.uk>
References: <20230526062529.46747-1-william.qiu@starfivetech.com>
 <20230526062529.46747-3-william.qiu@starfivetech.com>
 <fecc9d6a-022e-49d9-a452-8a63c409ebf3@sirena.org.uk>
 <042c560d-1f36-8e97-3796-7423245592f4@starfivetech.com>
 <86555925-b8dd-29a8-60cd-5c2ff2c1432a@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <86555925-b8dd-29a8-60cd-5c2ff2c1432a@starfivetech.com>
X-Cookie: I've read SEVEN MILLION books!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_033347_891707_0557E4D2 
X-CRM114-Status: GOOD (  16.31  )
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
Content-Type: multipart/mixed; boundary="===============6622989488972022690=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6622989488972022690==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0IjcTOaConsRfQgO"
Content-Disposition: inline


--0IjcTOaConsRfQgO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 30, 2023 at 10:05:38AM +0800, William Qiu wrote:
> On 2023/5/29 14:44, William Qiu wrote:
> > On 2023/5/26 23:36, Mark Brown wrote:

> >> Nothing ever disables or unprepares this clock as far as I can tell?
> >> Perhaps also consider using the clk_bulk_ APIs.

> > I will add in next version.

> 	Now I want to replace the original devm_clk_get API in the
> driver with devm_clk_bulk_get_all API, which can achieve compatibility,
> but it seems that it is not good for other ip with only one clock, so I
> want to ask about that can I replace it? Or define that inside jh7110?

You could always specify a different array of clocks depending on which
compatible the driver sees, just like you'd conditionally request clocks
individually.

--0IjcTOaConsRfQgO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmR10QQACgkQJNaLcl1U
h9A/Pgf+PyO6n0Sai2vAqhannyjrJNScSAcfT759fOsLtw54OcwCbpqbZa77wgiH
PjCzh72zQSXZ0AnoaovIQ+Pfyhm+M8KSWkeP95AhiBCJQr2kbMf6zpMxJaCIwN55
fwXAlxbea49Avm2qG2zwQOnV2b3p8qFPC76xxmHETmN/mx2p9AQFmIHZhuQcRAFM
4B0OCyT+QQ01lSmM9kNL0dttXDSUk1DbdlqGu8LIg3IkbsI2btCTER46cD7I8aI/
daiysOn9wEgibBlWwfDsTwmIVd1d+y1EmB3GBE0ip6StyEjNBYmBF5pEIeIyM34C
QeXxr61Al49hA3BFWJP8vJ+bRq/c4Q==
=tDOm
-----END PGP SIGNATURE-----

--0IjcTOaConsRfQgO--


--===============6622989488972022690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6622989488972022690==--

