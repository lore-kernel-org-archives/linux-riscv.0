Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA20606A31F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 01:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4DxajnKO;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=qitWkOlW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Message-Id:Date:Mime-Version:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=olv/RllCDk0otJzqFxS3NU9gj+5m1xyWHLx79u5qGsI=; b=4DxajnKOEhhiB0Fcbhqlj86CId
	hrHHfUmHj+hOsLcY13iq1PUJThek9mhsS3eshmsWQTuqEM7sudqBLLbGNLxN9Ss7YfvFjXpYAvOw2
	E+hbMx2h5inb7Zv08vRvh6jtEIrERddLqkS+VeCGpj1zb7ox2ECzWSAZUDcuqg4UPGnyV6HJ1OOFM
	sY2e/B2HvOspEa2SEXGSGTP24/5cHwd7hoznPuTpkA87ACtBCWMYk47fRrbMCPCGUogGoxZ3EW+o+
	UqVB1Ucoz0InK34KP4i1+aEa4nuVdZRiqYGjWcnPjbx9lwah2+mgW8vIIBOEx9JBAqIJhuI8M9Vj6
	tLMBmwEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSlFl-00000000qud-2Y8E;
	Mon, 16 Nov 2026 01:11:25 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSlFh-00000000qu1-3SvT
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 01:11:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794791429;
	bh=o0t1BCCQjgi14aQO1UeuhL4GaUKuMi9CPoj6dUs17Ug=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=qitWkOlWfBdU9bGhaaK2M6cSURL7bsZj74NFCD+E/EZO63omId/9ksYG1iFQncG6k
	 HtEKNbkAdsg59cLnXw5072A9uxWymuRyfSEwYjWVcFvmAZ4+oP3XTr9bDEu3sogmIG
	 l8MoI8MVBQmB49z2IS7ilZWS7Quf2viVMMvNBTOc=
X-QQ-mid: zesmtpsz7t1794791427ta4f1aa07
X-QQ-Originating-IP: lObPZKV0SB4c3ZJUWTaC8LoQmT3EgHmskcCwWr6avlU=
Received: from = ( [183.48.247.191])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 16 Nov 2026 09:10:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18264630976395257449
EX-QQ-RecipientCnt: 16
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Mon, 16 Nov 2026 01:10:23 +0000
Message-Id: <DMW8GL86YRLP.1TAQ98YVMTNUQ@linux.spacemit.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: k1: Correct missing space
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, "Conor
 Dooley" <conor.dooley@microchip.com>, "Valentina Fernandez"
 <valentina.fernandezalanis@microchip.com>, "Daire McNamara"
 <daire.mcnamara@microchip.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan" <dlan@kernel.org>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <spacemit@lists.linux.dev>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261113185214.182695-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261113185214.182695-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261113185214.182695-4-krzysztof.kozlowski@oss.qualcomm.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MWSAmC743koGz5ZW/HhYBjTxtt0sGEzS2SH5Ndh8puQIXjWpPpmV3W09
	znoeiEu6uEJzGjcZyH9L3hflVRGSPzMrok21RLGCiRh61MkAgrBBJWU4uZqgA5218KEDbQg
	A6IDEEU6jojNDu7mxFEEQNjAP3QG9v9rnrChAynTm8fQ5WjLmk+f2ejR4ujPN0I8ylTJUSm
	zH25DCnw/pC9DGmJlaoXXA5uJxjHU47q9uqkrDJgQmHxkD/EQnfx2dDV9qVQ5MOujG+6gID
	y6dWhZUCNqUL665uAiDDESQ5uI8O60yaIYevHptxyP4j2ZZY7AqZgo9mlzkbx16XiNbwRiY
	UNfWHYRjzqeJcLzlWgKpVbcCrjyLQDoxxdD9llOImapEwksvUBCxSjLw7QIUQ6dthCB2W0g
	86ItpXLAZrwA17KK1U7BVwz170EiTgwb0lff5FZaZh+BDCTp5EjM9NR+O0z/5+Zznzz6uxc
	EwAsJPZWMYDBvJk5m5KAj1ZkNDeFHoTcOJzaR/v+qXyUC2054/JjQkGqwF+gdPcONmciiJt
	MW5S1r/ZP6KESJ8udjzYXvIc/tUMfRjexmlRhs7DE/I/HsteP62nHbKUl7WwGgSnTrYPjpU
	CBttImc6OWuKamsnmBKawCaF8VVfGImuN/PowPdBHpb6frsZfXdAiG6VGMftBwi5yxmVBX2
	HXs9AlrWww/aOQ1+7BAVxukiV7BXkKniSvYHS+V631jl0JuSXoULU+4KuCvoKELrij253K0
	N2EdZdb/fNcYGvaxh9zA45wgvI2xHLy9SvzUwtAH4h71z5ZSvRiDmJ1yVpgkERtrzOaLNh1
	tbsr1wUC+i+aqP5DCgaT2U7ycBijF1SNIxxsU4H03HpuxQfHbYw8A8dWBwXzk1bggUMIg0U
	SRTgPsrG7mLzXVU7JU7ZAUwUfs24oKphSQHbMkpZkfdSavuwIoA8S0LVRNO61l8Sps5A3Ev
	ZdFA9/TF73epYJh6LXZOcv2gqvo9td1FysyzYpUPBJYLZ519irDhsU1jRD8E8GcjUqtnAFV
	qV40SgHjtRwG45WEW5xu3vFF5YVBBit6BK7RRa0woUsryyoWFFf3mwiq0jMSDu8oKJLc3pv
	R2nw8JnDI3P
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_171122_725644_767EBFC4 
X-CRM114-Status: GOOD (  11.13  )
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
Content-Type: multipart/mixed; boundary="===============7994652065258988174=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7994652065258988174==
Content-Type: multipart/signed;
 boundary=d363dc28b863c8cf98ad5ce75942de2e180d28d9a726d55085afa3a1fd81;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--d363dc28b863c8cf98ad5ce75942de2e180d28d9a726d55085afa3a1fd81
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 13, 2026 at 6:52 PM GMT, Krzysztof Kozlowski wrote:
> Correct minor style issue around white-space - missing space.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/s=
pacemit/k1.dtsi
> index 542bfc0d19f5..5d5f7f8a393d 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -948,7 +948,7 @@ pdma: dma-controller@d4000000 {
>  				resets =3D <&syscon_apmu RESET_DMA>;
>  				interrupts =3D <72>;
>  				dma-channels =3D <16>;
> -				#dma-cells=3D <1>;
> +				#dma-cells =3D <1>;
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--d363dc28b863c8cf98ad5ce75942de2e180d28d9a726d55085afa3a1fd81
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavpX/yEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC9Y1AEAz3081/Dn4Mbc
v974nlcbbvDPqVh7978m1f3OFJC3JF4A/AhCMm4Su3LtVRzK32K68OxbxeZ/9a+W
x9XsPgs0ljYG
=TIPg
-----END PGP SIGNATURE-----

--d363dc28b863c8cf98ad5ce75942de2e180d28d9a726d55085afa3a1fd81--


--===============7994652065258988174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7994652065258988174==--

