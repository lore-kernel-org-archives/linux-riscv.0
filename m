Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EEF606A31C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 06:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g1XwmUim;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=IlGuBUNf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u/RZA/phest0TQPWdu7RrqB+vPhQlR8GUxVTFW5LVg8=; b=g1XwmUimT+DEGIgvCUjOet8b6/
	xhbCtd2+hH4UG1W1euqlmg8Ack0z7TpVLkSH37Pb1YPVvtM/Miqw2zyMs3SZN5zmBF44oB0If8n0l
	R2ClDNex3dlxztCkHMB6qKlGKfYeFi06OZT51tJWeZlPTTjXbrAMTBUMSYmdCTq6gRr63gRhFXD2W
	CWOLTwo1jWk+B86qchFp20YYtmTkv0NQ4AYIDPNCJ3zM/7sd1igdjYWDfzRh5h9JorPTU4QgYLJiw
	hvIU7jm/ty9j2efJi+48+ohwKyy7rz6SvCaqtkAqKGughL2BmXNS86IsMGsCCQr7WQHh/lzLH8ioo
	eTms14xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpAz-0000000F0Ua-1xz3;
	Fri, 27 Nov 2026 06:11:17 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpAw-0000000F0UC-2Hl9
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 06:11:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795759815;
	bh=E2NeSLXfonrxSY+W49lO191CRD3CyOzI7hF6dMSOWd8=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=IlGuBUNfuc0X+Pt3hn9np8itQgtiT5Y6SrDdfdiN0lIRUOz21aPe8g8Qgadna6M75
	 bdn2tXw/j7r0us/0BtOSVxF1Yjyjb3TUWZxP8XiPP5Q5qt8PZW/QpXEI/b84/aI1Ze
	 6Lxe3kwqdBXOal+B4RzUZg3Lpsm30yimKVcfbLH0=
X-QQ-mid: zesmtpsz4t1795759813ta86aa600
X-QQ-Originating-IP: n4795X9CtarIxKcBmI9iCqupaEOTuiKZlULc3AJEdYw=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Nov 2026 14:10:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10182266507146119862
EX-QQ-RecipientCnt: 13
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 27 Nov 2026 06:10:10 +0000
Message-Id: <DN5RQ489MNYL.1WRXDMIRHZK6I@linux.spacemit.com>
Cc: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] riscv: dts: spacemit: k3: Set CD pin bias
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
 <20261125-09-k3-dt-minor-misc-v1-4-dd887a8eb326@kernel.org>
In-Reply-To: <20261125-09-k3-dt-minor-misc-v1-4-dd887a8eb326@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NPhALGoAJPM8bVLOJNUsgGmOkOFiqtOOUiYoxC1L7S/MM+r05SX1ibCk
	OqEELwN5YBBcDCEO7ca6rd7uE6Vd0D/gC5037rOeHXSprOKLHZ8T59gqLkNh86U46aZftoX
	wnhAgezQTtL3/z5PdXu3H9zMsKXOPb79IxZYb4foYQqCc5Ifl2k7thsqrjgn8ydYt4DlwCl
	2K5PaLsBigw6EGrCapVzC6vuu7p2yMmvoRiBoI9FffzjQ2C7yEaOYAJry8hic1hRVqC1PKd
	YgigMFcVvG96f4XANSW1oSYAeopAEGhcCQesHait+RPFeLAMwaYZp3H+HJnU5dls1H6G8vg
	ZOpb1SKlg7dLZzS1n4wp+aGmh3P/C3t1njiWwuYgo7fFbybtc8Xuj24+v1yFy6HDdBPtGwn
	rDRkYOsi//WoozCmpn9eJmpLK0lZJn/DCNaayxXfBNLEb8NVFF33tC8xCpeoomP507I1dLj
	nkgFITt4684hsdYsUO67+yFdlas9eYD0iHCyy6zYfopYAlbTK3pCRbUEVZkjD8PTDVZlpvJ
	phy14aEOlRgdIJznuRSPUWC2cmGfEDpsa6t0S7lQElfP+TKeO9D3ysVGPeliBTFtqscMwJi
	2F0s1cOl1j1OgaaqGpG2c07jyan+LtWxl3zFijxSuHWpWVE1kmuj6g84/nKIqGlAgSSCNug
	zsKaNzBhXw1AusWEgqm4P5zv/klTY2KC6yazXDQVfynhTLHKDnNKl7AM3OOUhYi0B7kOLIh
	ezuwXXJRQlMRdeLikkyJjWQ3GWen26qQkEE9C5qI/Lny/Ws+FT98h/fBTKFUzP5WRhHjOKy
	2aLAUUN8zk+sj+xmKf5VIJZGfqJjIhAfeKfPDbhGUHdcuTs91P1jrDATXjyf+i+DRQOfW5J
	Ge01M8ILw4PSvy6e0c6as8Lrs22ugr0ilA2qMDykCNTiCime+VCwmueLz+bjZtPvM2L+aX/
	yEhxFjOo89yS95Zzl9z05EZ5uY5nlnOZSaA3+PXwZ0kdltB8gWPRwTTFi/126NdU536M3DM
	+OjmxnbD2wZSVjm64XyBnsRno6HIHzL9j/CbL89tDUAmVdheiL7XdwdReXxY7I40nEU2gbL
	cg2um7Vyisvmr0//pvf7+YwPemzkiK07Igjot1NGi4SwqcxZRykkpY=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_221115_049960_FA598662 
X-CRM114-Status: GOOD (  14.04  )
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
Content-Type: multipart/mixed; boundary="===============1295145837845654252=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1295145837845654252==
Content-Type: multipart/signed;
 boundary=26ed1f322d44d2ecd4a6afc050eef67eafba067d32d916536e0aeaac7c68;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--26ed1f322d44d2ecd4a6afc050eef67eafba067d32d916536e0aeaac7c68
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 25, 2026 at 7:46 AM GMT, Yixun Lan wrote:
> Explicitly configure the bias settings of the CD (Card Detect) pin
> for MicroSD card in CoM260-IFX board.
>
> During the GPIO pin request phase, the pinctrl driver disables bias
> settings in function spacemit_request_gpio(), this happens to work
> in kernel side, but doesn't for U-Boot. Adding a flag to fix this.
>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
>
> ---
> K3 Use same SD card slot as K1's MusePi-PRO, which needs PULL_UP.
> ---
>  arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boo=
t/dts/spacemit/k3-com260.dtsi
> index 65c6f49f8591..598a53461afc 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> @@ -240,7 +240,7 @@ &sdhci0 {
>  	pinctrl-0 =3D <&mmc1_cfg>;
>  	pinctrl-1 =3D <&mmc1_uhs_cfg>;
>  	bus-width =3D <4>;
> -	cd-gpios =3D <&gpio K3_GPIO(4) GPIO_ACTIVE_HIGH>;
> +	cd-gpios =3D <&gpio K3_GPIO(4) (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--26ed1f322d44d2ecd4a6afc050eef67eafba067d32d916536e0aeaac7c68
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCawkewiEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC/aXQEA1ljwDzb2fdP6
XzncsQ9ip4r67ZDtHNdpKwFVYpXsXskBAJwpqVE+V9wjlbhp5FQodbaCyQVw4YuI
iJup+srjnbgK
=BeSR
-----END PGP SIGNATURE-----

--26ed1f322d44d2ecd4a6afc050eef67eafba067d32d916536e0aeaac7c68--


--===============1295145837845654252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1295145837845654252==--

