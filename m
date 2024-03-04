Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BA3C5478C
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 20:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=50ANqC2Ic3TiDfUeyCOKETYm5UG2dyiR4jDiO/e3Ei8=; b=IlbBIaE5SnF3Jazn9E9GsKi4js
	Uz6pJhrw3OD3nozBdfWK5fPNxfLSJfOIY67GGLOn5Y7h58UPd6CzSgNoVOhoEEAjX+bEzvg7eHIAH
	OyZztuijNRdRoQW9hcgbuIX9nI6FiUmsXkvHMXi+x/rWAiVNcD8yHKC55/44tlETbspvKW4zNnRlo
	cpidTot3QkgR/Gqp8U3EAlj6/qfITrCmjxE1BD8s6e9moXos7s7ErY2UvUJUVKkYwEhbzRV+9ByAG
	N7CpjVUSjjXXIYx97oZQ3iBDtpWJCXmMGNSHy4Fm4bTXA8kVtJ0WwFSQClSbe6GFZTnvDRwoVYUV3
	7g06BGwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhF36-0000000AdNl-0kUr;
	Mon, 04 Mar 2024 20:36:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhF32-0000000AdMc-2LSg
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 20:36:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 63010CE069F;
	Mon,  4 Mar 2024 20:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C80C433F1;
	Mon,  4 Mar 2024 20:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709584589;
	bh=0MMHl+OHCBfHGKLKr5DEkaaBTXQ5Ns3AsiLeg4LasPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RrMQbhOgk1XVUmA/6WJP4ULh44AdnpAOnO0Cv0x3bNyjccbZz417cadgkdWkTUPyR
	 GwR5rlFpeoIqJ6nNj1xCQzmRUixk0gMNLjtsA0vxf9FmccKTsPNKRoTInjJw9evC7M
	 duXjunpcgu9ZBTVdzhKEDJ/dugKjlNk378Cj/WvdlXsM2jv9s8kJxjkS0x1tj+hlTU
	 u7syGomBNyb53bhJDzK1Fj+rThut84LRMXbPyQjQ3+jqvJEaaYq3CpYQEZligti6O+
	 jYDPEwzS1UUemkWO1+h3jLEp5KLIxMxwVg8CGmbtoLX0UHXI4wBHRcVWF9X0fy0dk4
	 wJAJaleEuxJUA==
Date: Mon, 4 Mar 2024 20:36:24 +0000
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] riscv: config: enable SOC_CANAAN in defconfig
Message-ID: <20240304-collie-approach-80d0de4dc7da@spud>
References: <tencent_64A9B4B31C2D70D5633042461AC9F80C0509@qq.com>
 <tencent_FE1B7BF85E04C1B5C51D7F707D6204436809@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_FE1B7BF85E04C1B5C51D7F707D6204436809@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_123632_801952_B2A231E2 
X-CRM114-Status: GOOD (  15.65  )
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
Content-Type: multipart/mixed; boundary="===============8930956024065266835=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8930956024065266835==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hLLOp79WaqibcIfJ"
Content-Disposition: inline


--hLLOp79WaqibcIfJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2024 at 11:16:26PM +0800, Yangyu Chen wrote:
> Since K230 has been supported, allow SOC_CANAAN to be selected to build dt
> and drivers for it in defconfig.
>=20
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  arch/riscv/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 89a009a580fe..20b557ec28df 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -33,6 +33,7 @@ CONFIG_SOC_STARFIVE=3Dy
>  CONFIG_ARCH_SUNXI=3Dy
>  CONFIG_ARCH_THEAD=3Dy
>  CONFIG_SOC_VIRT=3Dy
> +CONFIG_SOC_CANAAN=3Dy
>  CONFIG_SMP=3Dy
>  CONFIG_HOTPLUG_CPU=3Dy
>  CONFIG_PM=3Dy
> --=20
> 2.43.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--hLLOp79WaqibcIfJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeYwyAAKCRB4tDGHoIJi
0v4LAP9ovsOm8/L+g9X/8QH+JrVVrJcdIk6eA4275kf9T/KF+gEA62x/SzJ0+UPT
mfI6sWHCa72hDfjRlU6Ji0X1CNqZiAE=
=2mwa
-----END PGP SIGNATURE-----

--hLLOp79WaqibcIfJ--


--===============8930956024065266835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8930956024065266835==--

