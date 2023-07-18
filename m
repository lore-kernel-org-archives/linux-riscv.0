Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A555C001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 05:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YInlHujqFqrtiV29dotNyep0RVpgz35DB7YU53VBdW8=; b=kfLG6LXirdDzHO1qOZlsqYwb07
	ble3F+STLKFd/iDUsPlImRQTUZoIRvtfeg3qO9SyWN01JgiTyaZVFwJ3Xur0AHv/O/18pvjV+63sC
	pn06TfgO8OuTm1WepGm6gDSScV9o/jPYTDlM4aza2Yk4D9/DoRyxKAkvX0m1i19befnbl44FU2+AB
	5Gr2vSjNPVAX7CnHisHbwI7SW55SX1Jn+qqU4eRQmSXxnBZJ7kOQSAWrGNoXecbquRl1qr2aa/alQ
	W2V8iO9acGSPERAwtOyknIsMbSlrBtvCIt6JgzFE7pgDcemzZtu6ZSjT5JtZ8lYQUSUcb2gRZSl/C
	Hoz/+Fqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzYt-005Cm8-1r;
	Wed, 19 Jul 2023 05:17:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzYs-005Cle-2O
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:17:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lhJ86AWTD5vleR+jHhYltF681Wre2kmWnGZRuMbZCiY=; b=L3NN7FYwTt8a9qgd9mKSVRVBoy
	hAXDJEPwWRAzM7BDxLqxFtrwf0D3jIgdUtLTYbSqIWBg8FKeNvH07BGGxC3LxwNsZzxubhTEebq4v
	JP32o1M39RE7Ja6b8Zia6Cw31dn2sBcQty45wASAouZd1vKSC9kXsAKKfEB1DfiqF6X1Ymv/K+cWO
	NCuVNpKlVsW66Kxaxb6SF6ncwxr4q8Ykfs4pk8E9KLEDXlys/CEBzRZvuEmOqNHAH2hWmTfMQFTzg
	x4/YtsmCvESMZinRneKdtYl2kyLXuSCgjWcKZtJ3PHskm2+cYCxOa2GnPngWmV/6K0Rnl9MVAHJda
	KxpT5AKQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLiS0-00BS5Q-0w
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 11:01:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EEC8F614E1;
	Tue, 18 Jul 2023 11:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38493C433C8;
	Tue, 18 Jul 2023 11:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689678041;
	bh=ixEPt0KsI/kEYxdZncDau78OTg2utWz1hEg4qVyudLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cjEsQoU36RUkJ/UN1B1vZWzL8yidJpHSrjHM8/FEWt5WGiGuYVNLaG48zC7K8Zs4W
	 VcUKU9/38bkOJpGcZqI0g+BVQ+zJf7dHPZKzlK7FI9lVgp+3z6GVilrOD/gclmF40y
	 QLGdqNvuKGEPa5uiwHsj7V+UvQ91Gj+OE+H+SCmq8A1dwZe7v00zSjd5H7r0epcByQ
	 6ltEOXUga/G+TGK4pr/xOlnAc/cd6Inrj1hl62sh7CQy0weA5Khg8Iocu6OuFu6Etn
	 2M5XsiSQpgMsxv0aySOMveILaihrT3tpbyRUtTMRZFPuKK6yctL4IVjCimDMYJ8q8y
	 YjnT8PQXEi/LQ==
Date: Tue, 18 Jul 2023 12:00:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Yuanjun Gong <ruc_gongyuanjun@163.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/1] drivers:rtc: fix return value check in
 mpfs_rtc_probe()
Message-ID: <20230718-fineness-strategy-aca59e380c85@spud>
References: <20230717144705.23656-1-ruc_gongyuanjun@163.com>
MIME-Version: 1.0
In-Reply-To: <20230717144705.23656-1-ruc_gongyuanjun@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_120104_701221_50D99428 
X-CRM114-Status: GOOD (  26.40  )
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
Content-Type: multipart/mixed; boundary="===============0351922731536366115=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0351922731536366115==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ysUyR6lvCgbzIIO4"
Content-Disposition: inline


--ysUyR6lvCgbzIIO4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 10:47:05PM +0800, Yuanjun Gong wrote:
> in mpfs_rtc_probe, devm_clk_get

In the future, please add ()s to the end of function names.

> may fail, and its return value
> should be checked before passing to clk_get_rate().
>

Fixes: 0b31d703598d ("rtc: Add driver for Microchip PolarFire SoC")
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

I don't think this is the only think not quite right about the handling
of the "rtcref" clock, since nothing ever calls enable on it, instead
relying on its dual role as the timebase...

One thing to note, I assume you are using a script to generate v1
patches, since the PCI patch you sent me the other day also had this
problem, but "drivers: rtc:" does not match the prefix used by other
patches for this driver:
 rtc: mpfs: Convert to platform remove callback returning void
 rtc: mpfs: Use devm_clk_get_enabled() helper
 rtc: mpfs: Remove printing of stray CR
 rtc: mpfs: remove 'pending' variable from mpfs_rtc_wakeup_irq_handler()
 rtc: Add driver for Microchip PolarFire SoC

Thanks,
Conor.

> Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
> ---
>  drivers/rtc/rtc-mpfs.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
> index 5b96a6d39210..c126df40c343 100644
> --- a/drivers/rtc/rtc-mpfs.c
> +++ b/drivers/rtc/rtc-mpfs.c
> @@ -257,7 +257,11 @@ static int mpfs_rtc_probe(struct platform_device *pd=
ev)
>  	}
> =20
>  	/* prescaler hardware adds 1 to reg value */
> -	prescaler =3D clk_get_rate(devm_clk_get(&pdev->dev, "rtcref")) - 1;
> +	clk =3D devm_clk_get(&pdev->dev, "rtcref");
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +	prescaler =3D clk_get_rate(clk) - 1;
> +
>  	if (prescaler > MAX_PRESCALER_COUNT) {
>  		dev_dbg(&pdev->dev, "invalid prescaler %lu\n", prescaler);
>  		return -EINVAL;
> --=20
> 2.17.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--ysUyR6lvCgbzIIO4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLZw1QAKCRB4tDGHoIJi
0v0xAP9eymEvrvBt9tdIsXiiKi/619DiVMNkJPG7Xp/g4HVd6AEA8YioR+ALQLZK
KPa4s3QSft9Qy2gioQrZFE49CWc4Sgs=
=uzjT
-----END PGP SIGNATURE-----

--ysUyR6lvCgbzIIO4--


--===============0351922731536366115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0351922731536366115==--

