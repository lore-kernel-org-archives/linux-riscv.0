Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A27C77B76
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 18:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpJGN+/F8TM7j1HunhRJG4YtFi30j1KX+/opHfLqDRg=; b=40VXzWq/CqP0ahaR+zoCJqONQN
	dhflPz8jErT4E3DV/8yTVs6Dj84TkLRrxZSFWU58gl1jIkc4Y0GKVQxH0vhjc+Vt6B8dB9gensTPn
	gCBkjlG5bifEU+3z+QJZR7ea5XLSnMqVp4AdfWbg645l6l/WfT4Ibop1zMVoVGCqJU/XgAeytQ/Bu
	6H8sut3hyErGl3DRoRxsoGB4uzvfT5wob1wp97DbVK3Q43LF9NBbl2JKW11uMRspuBMQHosjF1YHC
	M88PYLkK/sIiWpMEmaciUDfWdh7zyPqK2oScYAJ4ENUXpqDdUB2mjV+ycnLmr32EuaXwILtztiqJy
	1/arId9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppvF4-00BafU-2c;
	Fri, 21 Apr 2023 18:12:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppvF1-00Baeo-1M
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 18:12:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1D534610A3;
	Fri, 21 Apr 2023 18:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26125C433EF;
	Fri, 21 Apr 2023 18:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682100732;
	bh=lTEe8cO9U1J//1TZV+OYSxnLXbBOD0RvQ/wsDC6crgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RZOX6NkwkiNAQZrE+/IDcBLXkoO4Fu+k3VUWe8GmxobXB3fxNiVvsfmuzMqfymHLV
	 5c9SzfljFsbxqOoI2BUoy4w3mARnkw0WA6jWmgoVOiJ53ybSuKVlKCvZvyXCQZnyVI
	 c+34TBwYNUSHf54rGrHu8nt+jSTXegYywGuN1qCP8cfjv6+aUFLtvq92XWdGVPayWy
	 dv+Zkp9qHZ51pDyheCjwLkGYaV3otIY2mjJXjXTLIGFskAQLThkpdhGma/1HFpQvuc
	 BovAiyrWpiBgK1IxucyLtCQQi/JUPR4jsEB56e6oh3H83X9nen0WPkBMuzrjBR3w6C
	 vXiG2Em4OulJw==
Date: Fri, 21 Apr 2023 19:12:08 +0100
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: riscv: add sv57 mmu-type
Message-ID: <20230421-foster-catchy-fc8f963f17d0@spud>
References: <20230421-voucher-ecology-7ddfdf801a71@spud>
MIME-Version: 1.0
In-Reply-To: <20230421-voucher-ecology-7ddfdf801a71@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_111215_505038_7F45DFBE 
X-CRM114-Status: GOOD (  18.43  )
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
Content-Type: multipart/mixed; boundary="===============2732163026302886900=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2732163026302886900==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Vznf88r/BQv9I0vu"
Content-Disposition: inline


--Vznf88r/BQv9I0vu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2023 at 07:07:50PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> Dumping the dtb from new versions of QEMU warns that sv57 is an
> undocumented mmu-type. The kernel has supported sv57 for about a year,
> so bring it into the fold.
>=20
Whoops, completely missed a \ in my send command and lost the dt folks..

I'll resend it at some point I suppose!

> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 4c7ce4a37052..25d6e8dbffb8 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -66,6 +66,7 @@ properties:
>        - riscv,sv32
>        - riscv,sv39
>        - riscv,sv48
> +      - riscv,sv57
>        - riscv,none
> =20
>    riscv,cbom-block-size:
> --=20
> 2.39.2
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--Vznf88r/BQv9I0vu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZELR+AAKCRB4tDGHoIJi
0pRJAQCVbVnVwVqP4i/HOELCYNrnJmhxKUKlSB2lTNgYdf9cfwD/eKQkB/K8Dg8+
scaWP7+jVoN5ZxFWSRfteCiZHjnH+gk=
=gYiL
-----END PGP SIGNATURE-----

--Vznf88r/BQv9I0vu--


--===============2732163026302886900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2732163026302886900==--

