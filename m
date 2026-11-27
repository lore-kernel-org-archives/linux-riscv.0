Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372F4606A31E
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 06:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yvlroQ1/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=tXS0Nw4X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:From:Subject:Cc:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MlEeLB9MdU5xRNxlx7GhG5p0XfEUQz/3G214IR55Nq4=; b=yvlroQ1/nqtjXUkNgA48gjBw92
	VXFKgoJZ3a5kt1RXcHz34P16cc1K4gqORBQyasqYUAnX+QW7sPPSfwyBKN2oFt5lgxS6yk/WnrmRl
	tCxp3w+yt8oUk4WThxmrP8i8ryhZ6ZItjHZdF0I//e2mKQmgyHqYwgaTQab1YBa+CAgRPqxgyZYbU
	PG5JBxd/LLAVBv+6TuXcLpeN3F2Zw5rbBedDZUUVm6U5UbXL1CXT4Pkce1vBkpup1OWB6SQuzmFTQ
	VXB4JxixPg2MJy1YTFeUzQDdLKSxe0Im4IqHP4vsI7r02TOrHRShXra1m/fepnvshBC/HIJPRaUVd
	sjxudzkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWp4Y-0000000F00R-2QX5;
	Fri, 27 Nov 2026 06:04:38 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWp4S-0000000Ezyq-3qJG
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 06:04:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795759432;
	bh=+CoxtxAlXXTcTP7hM4mxLxfWNCL2jUGH6jwViGvzmUI=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=tXS0Nw4Xh93ckj4dHg2s9gfumIK+tCYENS/w+vSfjDY95VlhYalh0UCoxWKswujT8
	 jryN6i+a/4gxkZt05y/jXjRrGlOIyu4ZMFNt1lPX//XqzojRgGizTFIvEPG+YAzeli
	 Le34vxYXx4A38aaws+rFjg5nnro61kNCzECPJnnQ=
X-QQ-mid: esmtpsz20t1795759430t6776662d
X-QQ-Originating-IP: mpmvFh0R3UtSvg9VqO4lkFODjR/FTtIIYNG//MpBlWc=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Nov 2026 14:03:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3646035124795458743
EX-QQ-RecipientCnt: 13
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 27 Nov 2026 06:03:47 +0000
Message-Id: <DN5RL82O9EER.3GGSSOY5NFUOP@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] riscv: dts: spacemit: k3: Rename PMIC node
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
 <20261125-09-k3-dt-minor-misc-v1-1-dd887a8eb326@kernel.org>
In-Reply-To: <20261125-09-k3-dt-minor-misc-v1-1-dd887a8eb326@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NsUaodqEUTWoj1zWXQnIiGb2wHGiDeEtl6G4+Fo8NP0WjBT6PPK8TEmR
	jNO6LhA96Yl/6RrDEVkdFhthaSeNis1ed0JZXF1B6seUfZ/BvGx+2e/mwXpojt8qKsMp53I
	uxf1U1b7ybXHi+Gq8Sw8RQVUGmNhGL5a53zB7Rd3lqF7/nIAWlQZfgeeYgjjG8vM5oxt7Xo
	fch1MrhnUzUOem0BU79Pjn5reFvv5ic7VeygIWgzkh4glFk8xf+pujk1zW9/yzl1sBWp2Bp
	QLz0FdmkCt+jhQOMmfcL2zZhbva7XxhVW1RbSsJIHkzhwWIoMuXvfdmyq+U7km2DAIeB8Mj
	djqFcgMrH/b2XLNAY7F4iOOjNELtkPCsevE6DrulpSEwXw7MaGuNvHIQ52UQl8CEqccKXkD
	VIRfZFf/i2Wtl/eIs3Nyor6oRiLpMRtIkHMOB8QN+cvJJen30abhx5ViOy2EJbMb2HvlD70
	BAjnVtzgInWv4kxh6Lv1jOJJldJuPLRdt1/wcq8ma0H2Vf52uIyvZ0iLb3XBtJqTgeDzQD2
	Mm3FvQM6xNSoE9JI0QN91lppLEto9U2CAJSSItCC0NyWF35Vflj25UCeQJbEM72+WGNTtTf
	xvjshH5seKOBbAC152UKArx/HjEWEUwClOB0w8Dn9j7u3uMPIIAlFGeSE7/r7sUlnY5OJKG
	6PvZJoi8QtdjV33Yv4SPjoJTqH0RN3Y2ew3vDU6mOHUeOX9UCABaSQ7DfQXUBinRWKHYRfU
	jqpf9EScl7gLyvzoEcaL/N+mY6mm4Ef6d65lZuSjMs/LgEtnGlomifurswahQXagIAcEI8p
	/408Z6Ry4YwnY4xSQzsuQlkb1oq9zeKt+mV+59VqtgFj+Ln1kiSKCTzANJsgsSG9yTLMHOm
	RAvy4BZm1aY4uIyL4Nfmv4vP9IKCZejuEfMxVSEfQANTe5E/51refOFxhra9WBhwd5Hp/nY
	qmy2ro2O6+dIbnMvhWPmMr1m5u6rFwIFEVLAPM/mJM9n5uPh02GAih0Ffj/qkba1JizHHON
	ReM/GMvwUD+foLVZ3UZt1YWCSAEzxKXFaKlyg+kC6PkdJ1zNuXsye1yUjtakPRxzkUD42ol
	hNkxG33wFGF
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_220433_481037_23C8BD03 
X-CRM114-Status: GOOD (  11.03  )
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
Content-Type: multipart/mixed; boundary="===============4060832256790212672=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4060832256790212672==
Content-Type: multipart/signed;
 boundary=dea23099e5428f6b7ac3e4e3b106bb44ea01804eae0a8ac0d378e215a0ec;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: quoted-printable

--dea23099e5428f6b7ac3e4e3b106bb44ea01804eae0a8ac0d378e215a0ec
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 25, 2026 at 7:46 AM GMT, Yixun Lan wrote:
> Replace to a more descriptive name which follow Device Tree docs.
>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/bo=
ot/dts/spacemit/k3-pico-itx.dts
> index 8d1cd468cf8c..a4afe24130ae 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -100,7 +100,7 @@ &i2c8 {
>  	pinctrl-0 =3D <&i2c8_cfg>;
>  	status =3D "okay";
> =20
> -	p1@41 {
> +	pmic@41 {
>  		compatible =3D "spacemit,p1";
>  		reg =3D <0x41>;
>  		interrupts =3D <64 IRQ_TYPE_LEVEL_HIGH>;
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--dea23099e5428f6b7ac3e4e3b106bb44ea01804eae0a8ac0d378e215a0ec
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCawkdQyEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+72AEA6xeu93yEEa++
vdfWOF3LBT8G/QTUIuZMu/R3YlMKumEBAIRz1wtpkYvXtXK4vzdoyfE7b3gN3mcS
f2FUy2P9NF0A
=YDVA
-----END PGP SIGNATURE-----

--dea23099e5428f6b7ac3e4e3b106bb44ea01804eae0a8ac0d378e215a0ec--


--===============4060832256790212672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4060832256790212672==--

