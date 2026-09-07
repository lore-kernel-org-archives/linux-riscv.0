Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C6CC79F89
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 08:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:To:From:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7eClD8FcQl8tt1Pv7D+hfEii9eXNRsFgALlyA5n2CY=; b=NjcMXWq8nG8AZuC5oawCDiwmhp
	8kg3r/O1mGIk7LCF/n1pnRrDHqcWtdRPGZWp8JaxYAtZTzNGBzH7/+uvktti58WOS4F5UPYiPNBJx
	ncUdxuXKRou3rD3/DrCtS0IkceKmHTtIj6C5exMajqkh7m2krbewk6zUMeZvqtiDoFGBOf2Q4UPvp
	V//gg005qHDKiTYUQnY9WKS9u/6YLR4Wc+dAnymkzIoPLINCrwxKP5H2lyBxbQLBorfNDyQluPhXk
	Fqmcz3CCOt3mBaXqnCxBo0w8ncNpL64uN7KJZTHgEHttijqfXK8S2PSH8abnnr2IB9GoSA3RjLZbT
	adbmeflQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3UjL-00000006HIB-3DcA;
	Mon, 07 Sep 2026 08:29:33 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3UjG-00000006HEm-0sl7
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 08:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788769753;
	bh=qWRgI9AOsx/PXxW+VxjVPzW5Qmp+SlNGLn4ruFkG9nE=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=oBR+IBXzLjBaJocWvo/zFzPA1ALw0ELmD/h6uUfAsTjuFLZwd/lKN0MUcbn7x9Cwm
	 BvOd189qqOcCUHnyyXnYr1Dds5pWLW6/HtcJs1+bPK99cpJfVE36/CuzXBhlUcZwkk
	 Y2Nt4nJ/A8V+vqhCgsEL/tu3B1MBo3UQKZiLGHn0=
X-QQ-mid: zesmtpsz8t1788769746t20a8a9a2
X-QQ-Originating-IP: wIBhlM3drIQ9Ntyumd1ujaGUl+998+uevieIExULl4I=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Sep 2026 16:29:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11320355853612536940
EX-QQ-RecipientCnt: 20
Mime-Version: 1.0
Date: Mon, 07 Sep 2026 16:29:01 +0800
Message-Id: <DL8XYAR1UCMY.8XJN1LP6YQPE@linux.spacemit.com>
Subject: Re: [PATCH 2/6] usb: chipidea: usb2: add optional reset support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>, "Peter Chen"
 <peter.chen@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Xu Yang"
 <xu.yang_2@nxp.com>, "Peng Fan" <peng.fan@nxp.com>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, <linux-usb@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com> <20260812-b4-spacemit-k1-usb2-v1-2-f28cf29e522b@linux.spacemit.com> <an2UgcS8cHDGwzsO@hu-petche-lv.qualcomm.com> <870CB1C672C91040+8a75565f-344c-4f1e-aa69-33585a88c8e5@linux.spacemit.com>
In-Reply-To: <870CB1C672C91040+8a75565f-344c-4f1e-aa69-33585a88c8e5@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Ni68Q0J6fxe2wIqzzpnjqZqcDXBL641bOrXTVUP6GxzUtXHWeJH1XJNw
	8uKsDXFi4zyR4vFBMulVXHap12RAkqtvyG9DxflBI6RyYUFvGBl7SFTw7/75yvJ9hRmCvJA
	WZx3zpUR3Dn+sQ0u44hOGt++j4pETwG/FrDRa6y2ESbwySpFmzfsYF4eMV12PS1YrrQ+L49
	B3Jts8fd10gD1EfFazIDSc9sX356lJtVrUchFNYU6JvbPSUzqbSHIiEStuKhHTsvT9N2bKY
	XMrnvaPar5DasCTpjLNQEGYAFGbI+qIKyoFw+bZdHCsXzYUQ3Ww8+MiwGm4rUUADFGlq9u4
	+BsqwdCcup3GHypTe/xA6JbwzIpTlg6bZ9AP/sYRVn7akIXmOZg+i0xEu2eL2D53u5YmFip
	v4Tcdg1zQedCwqg5nwWBvb1P9DV2i5/PH+gZumEY6HSIh1Jw6yU3GRHMKsdTvpc2jI7anKQ
	Ss4v0I+jKIXE3ZGa5yruqkZUVfNgfPNHRRBw7+/ssnqL1X5LFSwFsZye2Vhx0VsDEHADvKR
	TBgkfE+z69IJOtGxRC70kVCKDFbmK27FbuwuCF1uzqEkYg5VFP8lJUVRyWaVxSUC7ZBzpqd
	in+ZQU4Qe8k95hZvcPKa1kozSvUllU4G2GU/Imz6ndTGL+2QCxnCfbuqsg5IlK6mPBb7GJG
	YcB4IhV3wtqhzbXmUToTmwAC9kkLp3DL/wT8RBefcIkThHQnlq/dBm3z5EoaxtLH3rmJvlo
	zUtLNqvqlb9SBFsfBhvd1P0Dz9Flu8LIuBXxuswhkp1zb9NY56bW+I7jD/+8gt/VMtPjNUb
	z0vKiqyoMCfDAgPhBzuVIu6F2mhZwcF3zvxj84tQ0nZVtXGjZPVnzJnOX/LSkWPSvqs663/
	9wf6bezEFVcJgsXtRIZ4tLu+Y2rGA/W9lq9zKuHYlnh2KVEv+BnkSzI4CMDqEtuhtZ2e707
	KimJJxbiVLWCiQkl4eouU7flPQ5bHJ1j3v3bXZoZDLzwM/k8lyqYjICSvmhBCyu0goadn9p
	gll/OuXn0/NC6Ocf8X78ReUuOuw+IMp81rppD13HmlhP5cZ3KcIiypggtBor3hUYV892mzY
	A==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_012927_198181_22FDA1CA 
X-CRM114-Status: GOOD (  13.03  )
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
Content-Type: multipart/mixed; boundary="===============6352346259638427056=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6352346259638427056==
Content-Type: multipart/signed;
 boundary=c5ea966f1287d2fb0a065fbd8bfacc535291a111e20b04421be1800d226c;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: quoted-printable

--c5ea966f1287d2fb0a065fbd8bfacc535291a111e20b04421be1800d226c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 9:39 PM +08, Junzhong Pan wrote:
> On 8/13/2026 5:55 PM, Peter Chen wrote:
>> On 26-08-12 17:26:13, Junzhong Pan wrote:
>>> The USB2 controller of SpacemiT K1 SoC requires reset support, to keep
>>> compatibility, add optional reset support.
>>>
>>> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
>>> ---
>>>  drivers/usb/chipidea/ci_hdrc_usb2.c | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea=
/ci_hdrc_usb2.c
>>> index 8ffa1e95d8e8..00d575cd2955 100644
>>> --- a/drivers/usb/chipidea/ci_hdrc_usb2.c
>>> +++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
>>> @@ -12,6 +12,7 @@
>>>  #include <linux/phy/phy.h>
>>>  #include <linux/platform_device.h>
>>>  #include <linux/property.h>
>>> +#include <linux/reset.h>
>>>  #include <linux/usb/chipidea.h>
>>>  #include <linux/usb/hcd.h>
>>>  #include <linux/usb/ulpi.h>
>>> @@ -21,6 +22,7 @@
>>>  struct ci_hdrc_usb2_priv {
>>>  	struct platform_device	*ci_pdev;
>>>  	struct clk		*clk;
>>> +	struct reset_control	*reset;
>>>  };
>>> =20
>>>  static const struct ci_hdrc_platform_data ci_default_pdata =3D {
>>> @@ -80,6 +82,12 @@ static int ci_hdrc_usb2_probe(struct platform_device=
 *pdev)
>>>  		return ret;
>>>  	}
>>> =20
>>> +	priv->reset =3D devm_reset_control_get_optional_exclusive_deasserted(=
dev, NULL);
>>> +	if (IS_ERR(priv->reset)) {
>>> +		ret =3D PTR_ERR(priv->reset);
>>> +		goto clk_err;
>>> +	}
>>> +
>>=20
>> You may update binding doc?
>>=20
>
> Sure, I forgot it, will do in v2.
>
> Thanks.

Is the reset required for K1? If not, no binding change is needed. I checke=
d the
binding, and it already defines resets as an optional property.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

--=20
Troy Mitchell


--c5ea966f1287d2fb0a065fbd8bfacc535291a111e20b04421be1800d226c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCap51zQ0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQv9j0A/AuCeVJ9yE/gt/KfEJxLTBV6zSXK8wkfge0WTxJC
wNLzAP9N5s2ZVrfHOn5l/94Qv1u5kJxbdnjE6iR9SbxpQB0UBg==
=lw1Q
-----END PGP SIGNATURE-----

--c5ea966f1287d2fb0a065fbd8bfacc535291a111e20b04421be1800d226c--


--===============6352346259638427056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6352346259638427056==--

