Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BCFCD11DF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 22:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OzxWs74DHjVjqewXWHDpmMdKPz+5DLzp23pkFNIu6w=; b=Tn2E+wkmO/zXamYtUaJ5L0v7OH
	QvZK+bX5ues4lsjlv3P+hybYXQNSEggBO7H6Ivb80PG5sux4RsOGmGHeWZU6iWaxHRKyPwMAsWmgO
	Ks8Ixz6N/gTDpc8eYrkTllYMPodgAxEBlurNNjsWsBTqXxdsogSx/iAwEjTYXH/GOKC/6x3IalXe4
	/0YCvaRzKzCSGTeqvQiTNgdg3hdun38yZjVaXuaRLb+T41CoIYU/Fcxpnkr8LAhax2CT8bi+VLF9G
	nVRv8Yr+H2V6uPy3kvt9uKFul0DWYSOVdV5v1ODLgOXjVWFiv64wH9rqRZ6Zy+q+WTqwA2/lIyxAG
	ozM/Cihg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpF0X-00000006dWM-3jOt;
	Tue, 26 Mar 2024 22:11:01 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpF0U-00000006dVR-41y2
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 22:11:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 02C7DCE176E;
	Tue, 26 Mar 2024 22:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79376C433F1;
	Tue, 26 Mar 2024 22:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711491056;
	bh=cG29oNcr0+V5KGbAdPJZvHwXg0KTPqsp1JrVZjQvHzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=htXjJYXD0wfM/cszoAtDSzVwT6tZNjV5F4xuXBykzildPbNdIRjBsZmHBPKVlZg1L
	 gb1LdQGog9GC3iZcjlW3gU29VMlgmPR3Za1rHFsopjUhWbH1S5XRtofyDE4ssjvo1g
	 m8/DX/oc6h2cGx/ZmmQHI0tn8BRAdJ/903hRWmY+fidSYIAMeDOmlxbWdOPxERjlC7
	 KeLEOaaHIRwodlkLfURxwuSiY0whNWAHVTi0oyUC4NQl8+hcVH2N6bczEFb+rr7Sel
	 zpupYmYYJTX44D7CZK+MUp07D1tDbEjJxx/NsLZLwqLXlYvqvBoRo3jA/XhMJHQvyF
	 kWYiSzx/Z9Bfw==
Date: Tue, 26 Mar 2024 22:10:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Bo Gan <ganboing@gmail.com>
Cc: kernel@esmil.dk, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Shengyu Qu <wiagn233@outlook.com>,
	Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: starfive: Remove PMIC interrupt info for
 Visionfive 2 board
Message-ID: <20240326-ladylike-retold-9034734c2445@spud>
References: <TY3P286MB26116B828A34D614C09F4E8898202@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
 <20240326-create-motivate-2792be1692c5@spud>
 <f472affe-d1ef-cbdb-b5c5-76f6b3ac78b3@gmail.com>
MIME-Version: 1.0
In-Reply-To: <f472affe-d1ef-cbdb-b5c5-76f6b3ac78b3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_151059_199040_41FE25E8 
X-CRM114-Status: GOOD (  17.14  )
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
Content-Type: multipart/mixed; boundary="===============3644052059070573191=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3644052059070573191==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/H/qRSs0lzpUPZPK"
Content-Disposition: inline


--/H/qRSs0lzpUPZPK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 03:06:33PM -0700, Bo Gan wrote:
> On 3/26/24 1:37 PM, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > On Thu, 07 Mar 2024 20:21:12 +0800, Shengyu Qu wrote:
> > > Interrupt line number of the AXP15060 PMIC is not a necessary part of
> > > its device tree. And this would cause kernel to try to enable interru=
pt
> > > line 0, which is not expected. So delete this part from device tree.
> > >=20
> > >=20
> >=20
> > Applied to riscv-dt-fixes, thanks! And I didn't forget, so I re-wrote
> > the commit message to add some more information as promised.
> >=20
> > [1/1] riscv: dts: starfive: Remove PMIC interrupt info for Visionfive 2=
 board
> >        https://git.kernel.org/conor/c/0b163f43920d
> >=20
> > Thanks,
> > Conor.
> >=20
> Hi Conor,
>=20
> Thank you very much for taking care of this. Actually the PLIC may silent=
ly
> ignore the enablement of interrupt 0, so the upstream openSBI won't notice
> anything. My modified version, however, will deliberately trigger a fault
> for all writes to the reserved fields of PLIC, thus catching this issue.
>=20
> Hope it can clarify things a bit more.

https://git.kernel.org/conor/c/0f74c64f0a9f

Better?


--/H/qRSs0lzpUPZPK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgNH6wAKCRB4tDGHoIJi
0qqvAP9sYNmVhWhKIaWrwI0qOJdUWNbIMUN6dcH31ErYQl6WHwD/QoreijKXvG8q
TU3kR9EpQtoazy4ACLIGRSbE/o2ovgM=
=CI0C
-----END PGP SIGNATURE-----

--/H/qRSs0lzpUPZPK--


--===============3644052059070573191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3644052059070573191==--

