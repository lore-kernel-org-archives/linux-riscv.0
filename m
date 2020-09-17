Return-Path: <SRS0=KFrn=C2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72BBEC43461
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 07:26:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21EAA21973
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 07:26:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ImplEh7H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="QMccrluT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21EAA21973
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TD1xI/nL88VLEwVEilZL/VouL0DJTmjT1PiyyOXpaTU=; b=ImplEh7H4I5W4S/3Rl/NrXUW6
	zkcVVP3aHcSlX4XE5xjS0GgOJmjYFLVK4Wvi+cPg8CV52GHnJzgzee7iIigb+t+tDAhlX+bvDcLmd
	W/TlVz0JF+9E4a7lvRhoP9d4gZPWvLfjWsyR+OTV/tDcnrgkVLBlH+7uMz2HESwjFvGm75zWGoC8Y
	QkZtIu/Q4xOwX80WW2ruWl7dmGVE20YbkgfoAxUSsLifnluNnoaAEZpeYKW+21Kdd45RWP7FDile7
	4HR5+kzyVYBusb9DqBKLOg2XYuch5dWD2PfQxtR4WhSXBT6t2/gfT3A8GfHJiftw/d0ss6BeDfTYR
	Gp8Tzo1RQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIoIn-0004r5-MJ; Thu, 17 Sep 2020 07:25:57 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIoIi-0004pU-Hd; Thu, 17 Sep 2020 07:25:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1600327547;
 bh=zXWtad0JIIFPcwVYIpkWAbxd5f/Xglqob2hHG1bVTJw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=QMccrluTswFKdC4vzqLbTwsDnY5Fi6s62lnyubzZXYqReT/meO2gx6E4FPmy/yJJA
 JvhMt23jQ0tJuXIBGeA/ouC5sBW8yelnG6747VoyShStPAOoXlY3eCfyC0nTb2bIg/
 I4EiphjIC3JuzEc4SVKXdCR1osbhauOQJ0nCIYnQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.195.151]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTiU3-1jvWjJ31tl-00Tylu; Thu, 17
 Sep 2020 09:19:40 +0200
Date: Thu, 17 Sep 2020 09:19:32 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 8/8] ARM: dts: imx: align GPIO hog names with dtschema
Message-ID: <20200917071932.GF3306@latitude>
References: <20200916162250.16098-1-krzk@kernel.org>
 <20200916162250.16098-9-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200916162250.16098-9-krzk@kernel.org>
X-Provags-ID: V03:K1:YorKu7pZDQvPgwcW74yxwuNVFEWXjpKmR+QQ6aCm2kjASQe781T
 gyUNKzv6xZx4M4wwltaekmcBFF56mIMGiApidvEyvD91soIu76ecvOnAWz9Y7Rovj2sShwX
 32LYp5Gxiqo7cY8aSzhwh/VfYZsBtibMCT8gNTUvzpGI4VLobehqvbg7P5fMmCM8MgIzAmo
 8uIUIEgW8UoeyErWXINdQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y7I6dMnRb2k=:ExMK8jy0Hy6akrnQXgge2U
 2lZyxPYOqgYe5iMPk/CVzt3Ndhq6ZwIhd5v/x1Jr3O2qXg3MIUPNO1Ux9omlkeRI1dDs0cpwq
 uiVy/j2hysoMJbPbx+seuo0vNWrqHwihtPYSwdW8Pm+RHzjZgew3osZUkoPbdd2PXiWaTHG7Z
 z73UNyIK8rdZzvJ7tw7VdlRA0lTwnbili5irQ4EY2bYVh66MzguQH/YhNIAZmqMZwq1599vtM
 qzDTSy0aMYYisS6Yb77Zk8z5mY2HWxStdwx7qm6YN1u6HjrEM20QlAdlVcTRWyIPTLhj7amtZ
 G/QQvb7liwYx497e8Dl6YV04JaTX2St51RBNbp5QgAgz0USJTg2yc7RRbVvm3wAAZGlmABbld
 eevwaBm/wBHFTdoni63EoMwiEr1o7qDnnhwrIp1ltq/1P7r1hmLmzlPmKRjSiRNgyaAo1CuvP
 DsXANagkKzz2eXRCFvlVVwc0bR14YGUzB4/0cwwFrMb/YzD9gC7AH8+hL+i7XkBPC8QFVM8xa
 l5NHNjlf/7dLuG84gzBXx3N4vMVaF+9DH4wTLrM5iUBcox1pWV47StAZ8IgMFtKVt9hwV3AOc
 YI/IspB3MBCDnu2duH7cSxPL2lRnvbtY8gtSGVH2qNozvrHQCG9T3iR8IO+Ukf/5lvD0LuGVi
 a3DA5+fEUD5fSeR0uzBdkhLO+IecK0A+v21ufsB0jNcFsqAYYGiFJf0Pt1frHoxULS71/RWvX
 dwQ8ryYbMvbfOiat/yp7KN/ddydSMumW+qAIA89pGfjZP/euCbkaS49uhFckQYIi38Ykyg9Nq
 mzY0RXepOxy+lLjZoAfrQMEebCpWZOsZMXBEnb3/984bh18hLHS/aOH+VW3e0NC+aba4F7HIb
 fuW0MtRh6Km8jmVh1gll0nh3eN7G7pJUZsIq/rl5KST0+PDfDHv7TyCrWuUX1VuwrASHrhpqL
 xeWxJjUUkXSLyCob548sr4MPFJH8VFV5P0ye7D4FRpwTh8CQsbetIOu99DsFY6I8xLkiP9Ie+
 s47fcWGAYUhImFnN5f/D6xpfdfbO4YF5i5vLpxIzl/VWFDQZUS9gNv4m1tou3MbksBoi/xrRO
 eQi7VpsbXG4decRCv7DSQ2undAKXwqL8ENnUW4s9ZNseawwg6plMRV0wd1N4nIE7yIq9JSDUG
 sUL5jnSLpLLLSL/oXobvW43U+HUZ8D0NHAHcpMl2DzaT+NRyv0IznCuGwtcKncpH3NyYeIJP+
 BhhZa6dk5iei0R3QeDJoJfhaW7owR7rZs5ai3rg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_032552_808779_80635025 
X-CRM114-Status: GOOD (  11.91  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Stefan Agner <stefan@agner.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Anson Huang <Anson.Huang@nxp.com>, Magnus Damm <magnus.damm@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 NXP Linux Team <linux-imx@nxp.com>, linux-arm-msm@vger.kernel.org,
 Sungbo Eo <mans0n@gorani.run>, devicetree@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-gpio@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>, linux-unisoc@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Yash Shah <yash.shah@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: multipart/mixed; boundary="===============6527740214009478555=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6527740214009478555==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w3uUfsyyY1Pqa/ej"
Content-Disposition: inline


--w3uUfsyyY1Pqa/ej
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2020 at 06:22:50PM +0200, Krzysztof Kozlowski wrote:
> dtschema for GPIO controllers expects GPIO hogs to end with 'hog'
> prefix.

Nit: It's a suffix if it's at the end.


Thanks,
Jonathan Neusch=C3=A4fer

--w3uUfsyyY1Pqa/ej
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl9jDfwACgkQCDBEmo7z
X9tyrRAAil2Ws9RX5xEhOM4JTYZZs2cN+39EFsN/UxgAFfH6d5DSDAvTwsAKLVYu
fN2VXncB+EnJuFS1poUbhIHVv8UKAhd51hVXveutQjhCXRCqTRxhsTbE2NamacUZ
TMUzWwXkZbmeH3GFQ07pgxKh8SSvrqeVn95IupKHWtSIHNomGY4ZccO4iuaRlD1e
Ginacpkf107eon+YEJgoAX6CMumZbzCFM9LVyaWiT9psJQvdS9aDp26ER785IaYH
UT+9LtBrXytog7EzrJHJEMbDboewPKtJ+yMWfmP33FnqR+9MvUkt+N+d7g5H0Mkb
fUPqL0NFd01jkVWAmUOGem1baRHQlupf4hcm609RGakdHyZUB0g8MBhL6O5inUZO
/m/HkeO4Gx2Y7FR3aVfIC2sDwUzglI4fHqRdoHC+4lexbvhsBfoVZw5XHe2LmSX1
lvVW3jYfGQaiJiBhFR2nWZU2CkRm7Ur4bGBa0z6Rthv0BUYNdZ9JvOuVJRKzKl0D
deUbMLt1YdCVvELm1SbG6y0ItP9EkVJVK5cTtPr1H5PIP8zl7JdAnxkR3YOEbpxt
Hkthrhjh48Cvb5id6Xqf5O6g17rAtKqKxZGjjSLDvwxDu5tQCfSad7M3gxNIb/KV
a4eXNUuwJYhawOtgrFyjvg0jJ2PXZbfZLZqIfvhepUz5Xv9gQ94=
=n42d
-----END PGP SIGNATURE-----

--w3uUfsyyY1Pqa/ej--


--===============6527740214009478555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6527740214009478555==--

