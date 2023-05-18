Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEED7C77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 20:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7skd/oec5ytPDtx8pjsfB83f1ioqFkwwwrzaxLDzRdU=; b=yD1X0Kj6EL5DJ+ttxoXaXENDaY
	VyL5oNMryAaRelRiZbBt88fNgagxKF8eaOAkOSI3PR1wCyQbO73RNvs8OyfUfhDRsdIunKYs2W6S0
	sNwqsBu5fcCOK5+OgrhQ89ZwYngzeJZp15+3giN50IQCRZlpmpZsReXL3UOJMOzkcfUPAKS4M/edE
	Nn8LDuwiDLsofQw5mKNP8BwsRjqBQ0ZsZHry+OHnl8kWq5Dos7aYZgLE9N4sYJLvY3DRGMLpi/Z1Z
	vxVViS1rRkn6CXbssZIP61RuGWNL9uUTbOSiSUC+I3RqmZXozmyeftnLRIAHylnsyU+v3BudGHDCz
	RPT4cTvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzkhh-00EAo2-2M;
	Thu, 18 May 2023 20:58:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzkhf-00EAnE-0a
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 20:58:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BD1C8650AF;
	Thu, 18 May 2023 20:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B490C433EF;
	Thu, 18 May 2023 20:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684443506;
	bh=dLOqt+9eV007gsCn+QJROL9TL+gcr3DnH80bjs11dTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ghOoRo84b6E7kyxQLeDNZYUc6PNoV+AyjnKXYinVqFVenQpnua9Xmctigo7X+/pmg
	 feBLtbo/luYvzoxcz1dQooW92z0SdxsnO9EtcsNgKAFXCxvMryrHcIeMQulHX3zZGo
	 1HhGAErdVqSHXwY6Zls9+8CRSTvU+K1IxpVKqtMNIiDk7/jeAHwVhNX+fjWKfAxFgT
	 Q5thZgUru3wiNwon4wdvLYmNiltBcol030p2XpKuwD+FaIK+/WB7FUMQi6/OeU8vN0
	 UPnksA6k931vnsU0erhjui/JmXDSfRJp4mOAq4ZAjodusntHDyMvEjTgUhhYidHPfe
	 vl7ihD1B6oljw==
Date: Thu, 18 May 2023 21:58:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2 9/9] riscv: defconfig: enable T-HEAD SoC
Message-ID: <20230518-dipping-hydrogen-7e6b673d327a@spud>
References: <20230518184541.2627-1-jszhang@kernel.org>
 <20230518184541.2627-10-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230518184541.2627-10-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_135827_256429_905D9A10 
X-CRM114-Status: GOOD (  16.58  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Yangtao Li <frank.li@vivo.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org, Wei Fu <wefu@redhat.com>
Content-Type: multipart/mixed; boundary="===============9047243919203069432=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9047243919203069432==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZtJ462ZAP8whGsyR"
Content-Disposition: inline


--ZtJ462ZAP8whGsyR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 02:45:41AM +0800, Jisheng Zhang wrote:
> Enable T-HEAD SoC config in defconfig to allow the default
> upstream kernel to boot on Sipeed Lichee Pi 4A board.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index d98d6e90b2b8..109e4b5b003c 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -27,6 +27,7 @@ CONFIG_EXPERT=3Dy
>  CONFIG_PROFILING=3Dy
>  CONFIG_SOC_MICROCHIP_POLARFIRE=3Dy
>  CONFIG_ARCH_RENESAS=3Dy
> +CONFIG_ARCH_THEAD=3Dy
>  CONFIG_SOC_SIFIVE=3Dy
>  CONFIG_SOC_STARFIVE=3Dy
>  CONFIG_ARCH_SUNXI=3Dy
> --=20
> 2.40.0
>=20

--ZtJ462ZAP8whGsyR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGaRbAAKCRB4tDGHoIJi
0iwVAQCZaep0aot5SLQOxVlXewZFM+OzCDth81alDYBTu7U83wEA7GvEJfaF5xSx
ZcEw14AURtjj8F8VE+YYldFTsAwrwwk=
=fE/E
-----END PGP SIGNATURE-----

--ZtJ462ZAP8whGsyR--


--===============9047243919203069432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9047243919203069432==--

