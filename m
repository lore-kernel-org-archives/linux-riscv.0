Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401F7606A326
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 01:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z5WFtmu/;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=TCfqkYHU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=roQnJI3/Xab065SdH7KxD3hspxs2I37BiB+QRZcxuzk=; b=z5WFtmu/i1i+coVTUh6yWLzGPz
	RJ9bQ+uMlbCJXmkmUDWEAXYkSzQGQ1Cf5XnBYDuyecpSIEFZPRAUADZIrOPapaipAW17x2sKc0ccL
	O9OifNkiaok1KrKcC6f6NqTN40kgO1PJ9qlXJzEofh5ftGfckxudwb3TH1t9P8sNGQftlr04DWI4L
	sH1IQI20oShh9v5whC7sFqIZZsFca58pq06UpoKKUGRPUum7nDYf9xpVvlJ5zgWpBUNPLjmfC151/
	4PJYels2LnwR0Smi8TD1cuuW7TOiyVODcU1EHThNuQ8o2qbjHxOlPoR4jouKQSaLYgh9krdXEBvuL
	SnxBVLqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOm9a-00000007Syd-0Ipv;
	Thu, 05 Nov 2026 01:20:34 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOm9S-00000007SwZ-29QS
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 01:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793841588;
	bh=qg2+dZF3TjKEHvPr7q+CoS4vmmGWQlhmYsqxlyiBRfw=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=TCfqkYHUtSnRj9DAu8t2wmi6ZhdBD7tkPnIEIfSDrNAxebuyO9AbLwB4n3eNQRP26
	 Eet6SXm9aSCVb43XsRZpE3f/3ujZGFFCfUmS+8H+DssUrTsVXImVHxqZOnq9gFFmX8
	 RvEIVaHoEGkJ3dO/z94lUKn96e4uq1o0qcuEtric=
X-QQ-mid: esmtpgz13t1793841586tce477b9b
X-QQ-Originating-IP: db7vP0PyT1iv0ktdaH831sO646d7fHC9DdZ5Je/YyqQ=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 09:19:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 394686068405469888
EX-QQ-RecipientCnt: 14
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Thu, 05 Nov 2026 01:19:43 +0000
Message-Id: <DMMVRQOY5TBN.J0PHJAAZSC2F@linux.spacemit.com>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261102060012.100623-1-sandie.cao@deepcomputing.io>
 <20261102060155.100679-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20261102060155.100679-1-sandie.cao@deepcomputing.io>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OZsapEVPoiO6CysBWbheExxOP4cCHLxJ34n2xqQixQ170frSEKKltw99
	deW+mD8REj37AlVlFArSgblpns9yP8QVCChwffS+mz0Urjc4A2PZXKPR2cSgvKwiRky4OcQ
	NM0PzM77/ay+nnlvchbKuTyj2ZJ4Z3qhNpJWr7oxxlHyl5Q6wujnKe59wMwhHq/WsVQzJn9
	OdMr4IdxGaGDF67l7nGCP0AuNomJ5bg0IKcthLbXUQ33CjaSeI4JXWJ4dF4R8gm59xdykP6
	qQxm1qnfkS9YryM84bPsy3XXm4oxCIDthtUwra8Qs6M3XAE0fi5UXFxZWWw58wxYGaWf0Lt
	pR/3bi1Cbxpov9/FLj9VFMVOsDOaSTX/FtiMoqTPrK0wlE6zCCCRjQCdGj3oUlTejM1ynLe
	WuWMNKmTnrqAenO/qOQpJky6yLfWTXr3+8UYiZoLhyXZsnxv9soOrao8Yv8jUOYPagVKbr1
	j1QKxaJYdhYKJiLaucSZnUhtkIVWpE4XJfQR1D7Uyr+EbD37oghckBMtPZdekvRdnEacgpx
	WhlG1STbDAY9US0Er4sdkg0ZRpR/bbq3iYbWBWUiLRwZOFhCZFvfr5PTSb9Z0/VV/jdBcjp
	SmFtOJlHLw16ccYKb8n/sMgyLvlIdZvAjwFevnJ6M4WExRI8GH1XVAiHY9Vk69eSmFvtFNA
	AwcxywLn09McHKGmWO62ojaPbQvEGsJSLoWPCGgLYBrSQRkk20hQWpHzbf/UnCk6+tyl+Qj
	fbaHxJkLBD/Ioomnu+ZnlpgakGThs0tIMYN6NRK/G97YJbxPYyzWiAKfwKIRT+kCRwrAsGV
	/mo7lBEevQEw10ZWoU2uqbuHCMnp3o6XSQMbvSYMThOZlP3CSsRXLXr+YnfSNck71wSDo1Y
	h8SiCJCMsRRYmU4aWwf5bSWueg8okGshBAC8gniA3PVgXXuUewBA+jSEUiGBstBJizURiB5
	R9idTsQfVENpaf7wRsW70RpwEArr1OhTtnLjneAMInVKk8OqsEuFDhM/A0/L1CY3I+VUxdZ
	tiFGpVZ51GWuarRRzqKjtN2eDGjsF+qmFBSy8EnYoCuTlF+LEdNsewy05LEyJPdgxE3ixM/
	AT6Be3fFWKS+Z4zSpXLyKtZSCCZmW+EDI7mzqMT4dVG
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_172027_453464_F1B96B28 
X-CRM114-Status: GOOD (  13.27  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5578735439891359590=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5578735439891359590==
Content-Type: multipart/signed;
 boundary=2980ced06dce2ce2ba54e857a1b9e298e4eb13b22897ac4ebe45f64efc24;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--2980ced06dce2ce2ba54e857a1b9e298e4eb13b22897ac4ebe45f64efc24
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 2, 2026 at 6:01 AM GMT, Sandie Cao wrote:
> Add the device tree node SDHCI-0 controller for onboard Micro SD card slo=
t.
>
> Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> ---
>  .../spacemit/k3-deepcomputing-fml13v05.dts    | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b=
/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> index 84f66dd8f962..4471338a9774 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
> @@ -184,6 +184,28 @@ &combophy {
>  	status =3D "okay";
>  };
> =20
> +/*
> + * Onboard SD card slot:
> + * Plugin/Plugout the SD card before power-on the board for secure.
How about: "Please insert or remove the SD card while the device is powered=
 off."
> + * It works as a boot media. so set it to non-removable.
> + */
> +&sdhci0 {
[...]
> +	non-removable;
[...]
> +};
> +
>  &uart0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&uart0_0_cfg>;


--=20
Troy Mitchell


--2980ced06dce2ce2ba54e857a1b9e298e4eb13b22897ac4ebe45f64efc24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCauvZryEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+r8QD9GxMgY37x8+t/
65Zh+PW3tAkCJ3fBNtdrazmtjmZmGfkA/3z7vLcrPG1IZT0PxKH+NE7ixhomH0B5
aWKFU6efMCcD
=Xgv+
-----END PGP SIGNATURE-----

--2980ced06dce2ce2ba54e857a1b9e298e4eb13b22897ac4ebe45f64efc24--


--===============5578735439891359590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5578735439891359590==--

