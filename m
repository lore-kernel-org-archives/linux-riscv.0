Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5419EC982FA
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 02:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRYWnz+SrDYBy/BJjPfKSLyJBOo+cNcINXUOqiJK3iw=; b=y+z6QCGkuOHajYEZBs/VSG28j3
	GOTQtF/lxT2jdm6ZDCvXzJLCYC7rciQmAunqRIxBjJQawsjKToHRMmcDuhKYaLeXH2i4yCKrRgpr7
	J8D5qdlnKb/xf3tmrUzTrZv7+yKC1Y/DaY6r52egzkZs39wFyr5LgVqct5R9vuTWdLTHVb7i5B4m0
	8e/kFIXfEIdGvHeHVYbMwgWFULfy4P20vkqsrg0CK/vgcMhrR8kEuSmw6BMNTlBlC8W8Zs4zfu5Lh
	PNYdXdRvkXhSNVYRY2yvJCqMbLP4uahuTAo/n4BZDHr3sTX0BfXmjmEIFicwW1m0cYuuZAWmamUYv
	lE7hd6bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Cfn-00000006w45-1meg;
	Wed, 23 Sep 2026 02:25:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Cfm-00000006w3e-0O3z
	for linux-riscv@bombadil.infradead.org;
	Wed, 23 Sep 2026 02:25:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:References:
	In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8eBwOgT/P+WBWiIFGIYRyTHNte9OZxM1YATGcOp6ONg=; b=dp2bTg0TLzLGOB+SSFp25Zg4Ii
	5bBEYgUSfBSt8KCldKfciJHv9BkHnfh3fqVVs5ys2VZRAG+NLFAUplDsXos1BHfW8ve4mS6a0xlR6
	fUIzzMSdJcM6I1ClxLshQSvnsf54OM/yxmiLXGeQziv29eE9QBq8fOC+t8jxSi6jCw6ud+MRTn+gF
	a2mJlICS6zSMLOekzdXP0cMqCbAb0DuszpOAWcT5zQLGkrcG47jcHXwV/uCeEe1bO50BlK1nvL4fc
	9xyuQlxGoOHRU9hVb6E0OA2Fjl0t/jijeespydhp4DrqJduj7E//DcN68ol7jcC8/H6hfwFCtHiUo
	CZD0gt8g==;
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Cfe-0000000EHH9-452a
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 02:25:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790130214;
	bh=8eBwOgT/P+WBWiIFGIYRyTHNte9OZxM1YATGcOp6ONg=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=P+V+gBb16B9JBIdJ4v8NDnqB5UogIhiCrEviGXYO6bwoUmbDRiMuCw6W/uxOZByzs
	 h5VRZZ20G7g5+fJ9kVtVuGqcgmxdUK8kAB5l+vtrviLEWYfxNq5uVmW0cefE+9ihDv
	 LqW7OaySTrSM/TGnkhzcW42Gl3y4y9yAnxl/Drbg=
X-QQ-mid: zesmtpsz6t1790130211ta5ccfb27
X-QQ-Originating-IP: Hv1VSePmG7o57TixVmzrTLL07Q9k+KrYHHFrBMvoc4Y=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 23 Sep 2026 10:23:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10725776021509883648
EX-QQ-RecipientCnt: 14
Mime-Version: 1.0
Date: Wed, 23 Sep 2026 10:23:26 +0800
Message-Id: <DLMC741RLFU5.3FF1DL7YEIFK9@linux.spacemit.com>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>
In-Reply-To: <20260922110450.3426070-1-sandie.cao@deepcomputing.io>
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io>
 <20260922110450.3426070-1-sandie.cao@deepcomputing.io>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Nv8rTAnDNEemZcCjp/1hlxAwrVVrzDFmrX+XzHjnZbwvjRgecRhjGDmC
	hdPaw8DVT9yGMNreHLPUonztD90Ui5Vma4c6YPwRL2UpOUCixBV1XbjVvUeEhzyJrc5ZRNN
	RXdx4ZZNUrfxllEjpUlg4gfXh5MOQXSJb28Jlp6Ok1aNqPXHtXfiNzW6qmDv3/a6Kie6A8q
	C00H3YZYN3mqbPWN7ss8rAKPf90WRbr9gRvHvEc299/OQtoAz8w3HdrZ6ZjGjjmRhEI+9w/
	VdEM+GwkHwZKv0cZ6/x03mCUArFCcvjx9D92DWStlC3bBJrVzjgKP8CkhdofVHOjxIcGJAf
	d9f6T489M3BfZfYEjf9oGDGK71oTu9/A55GCFqGhlzklWFAe4jKG0oqZCFytHCbAJLvP0zt
	aw+50oLQcis9oygbvlIVmMn5lJ/A/5/CkcD1XFY4XwTLUR2o+EfscdoLUNWwgRvVybADWUF
	mVLnYM33IoRxPlFJvH5LfFa/bQ9FJISqBz2hm2OXuTQE7QOuQ9kwy8GnUGQT3ttMVnMykcm
	pmqvw3YihtPlMV3GsyX1D58SPuWx6kje0efmyBHplTN04wJUpIg9ro+kQ3SWRU85PmGvQ1w
	RmxYkQ+W/hMnQB2LH3qUoDA4d4mC8CFoYG4r6eTJmerRBk6Cm8Bum8wwDwqyP4hzc5tTttC
	76kr7GIITAGyB7l8Lcjf9jXiwFPv4ZXTwlIrhH7yrd/j8sYzfHliviecAERZLRRuaA2CB3p
	zPRpSizHYnhxtPr2BATGpks3f/4SfBmHXymw5Y738VLyrG2O6+wc/7Q48roAQ/4XVk1k9ZF
	3AdrnEUmACxSjKNzzhxjh5g99UWoMdmLPu/mfIHChomlwogXn/E77l6XZ39Vx5J5MuqsOao
	Xj5CfvzsNMG5t7G2ijGmWeysvXRbzbmg4jTFe2sbI3tYbvMrdAox+x4OhwofdVEbPqMhQ0s
	ThsmOAonZFBiiYfLrwqcwEUBlsBIoVdq9W3NNsgsPm7dZB6XJeOwaFjuhIuwd7fc+rol/Cv
	4HHahwzfPNlXTpNUplIJXJmrPq4z0V/jj4AM6JxOHCvdPW2j7SoE1tpGmtciTW22frTk4zI
	d5HMlriVYDxQkCiYFSOvqZun5II0y2cksk5ohyYq699
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_032519_681360_73864944 
X-CRM114-Status: UNSURE (   7.79  )
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
Content-Type: multipart/mixed; boundary="===============5079064463145664676=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5079064463145664676==
Content-Type: multipart/signed;
 boundary=ac315c91ecc3c3395b0dbb991c1f84a289bae2ebd6cf0113e2bb44b50761;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit

--ac315c91ecc3c3395b0dbb991c1f84a289bae2ebd6cf0113e2bb44b50761
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 22, 2026 at 07:04:50PM +0800, Sandie Cao wrote:
> @@ -184,6 +185,24 @@ &combophy {
> [...]
> +&sdhci0 {
> +	pinctrl-names =3D "default","uhs";
> +	pinctrl-0 =3D <&mmc1_cfg>;
> +	pinctrl-1 =3D <&mmc1_uhs_cfg>;
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&gpio K3_GPIO(88) GPIO_ACTIVE_LOW>;

Does GPIO88 have an external pull-up? The SDK DTS [1] also includes
mmc1_cd_cfg in both pinctrl states, with a pull-up and 3.3 V configuration.
Neither mmc1_cfg nor mmc1_uhs_cfg covers this pin. Is that configuration
unnecessary on this board?

> +	no-mmc;
> +	no-sdio;
> +	disable-wp;
> +	cap-sd-highspeed;
> +	vmmc-supply =3D <&aldo4>;
> +	vqmmc-supply =3D <&aldo1>;

Could you confirm which rail supplies the card's VDD? The SDK DTS [1]
uses p3v3 for vmmc rather than aldo4. Does that RPMI regulator map to
ALDO4, or is the card powered by a different rail?

Link: https://github.com/spacemit-com/linux-6.18/blob/k3-br-v1.0.y/arch/ris=
cv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts [1]

--=20
Troy Mitchell

--ac315c91ecc3c3395b0dbb991c1f84a289bae2ebd6cf0113e2bb44b50761
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarM4Hg0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvSEoA/3IWr2MzSgk80d2GUorlzgVL9dN5Z5Dsq+DhOJvZ
9VreAQDXTpwPqeRJwGQFCrvEkytE3PdxYiCDEuGXLDFlGMaZCg==
=Za92
-----END PGP SIGNATURE-----

--ac315c91ecc3c3395b0dbb991c1f84a289bae2ebd6cf0113e2bb44b50761--


--===============5079064463145664676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5079064463145664676==--

