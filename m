Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169D0C7619A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 20:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nP1xl0ixTUdbtmZbXHxQnKAXAJ1V2fMcRgjlayuDjrU=; b=Cc8eqzwmF+hSkQgKbP0dQyNAit
	lEUBMvbf6fU3RN0ml4SIcKwBehowgOoSJoROarXPJlgJdvuXvcUJQGWT1lEFiLD8ACnhbdfYyFz3y
	rAAL4+YXbpDydcNJBf95SiqHp1IFYhrQIrndIKohmYhei10ZSaSmy/+d//+3CKVekh4d+WM4CAYdo
	AQOkzqY6a2blDxoIgghkix3aNdJs9wlfvIivCt2ck4eNm0F58Es1gwwflcZgp/rr0BLMnHmocMDVF
	FNCB8xBAfi5s8WArtf+0fvNKkS/FMNcE4MUrbmAsjcY442Yo7gLMczQDYzinCZbQYLdXe55Is2us3
	GekwqxIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmKyo-0017Wk-2m;
	Tue, 11 Apr 2023 20:52:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmKyl-0017W8-2X
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 20:52:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 27B2D60E9D;
	Tue, 11 Apr 2023 20:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C453C433D2;
	Tue, 11 Apr 2023 20:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681246358;
	bh=Uw2/Byf4kuU8+07mE//heEnMrZgOuJnGJy2pZr8fhEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kr7O+0tZrPjEw0m/XXSwGiAmEd0MbZYqCzhbwtcx7NCA01FSSC9pitekLgnICQxbi
	 syANdkMkdw1wXFuiLU96iyGAW7TceQUdlVMG+sd7JcKbBTNlzFL6qMHoFB7n57Htw4
	 wo6n0LaAmGEh5FlbS8RBYEvlsa2iSUFr7THTM1mlNZdKnJKHStKO5tfowCNPf7Y4ug
	 vl7TQstNxxUicCr9x2A7brZKNb+yKoIsxG4G/j+pVNvDnEQAJXLF7S2eKthRjnDNxV
	 BicfhtBoLVOViQnorBBk7E5ByCJGD3PqOLQId1Ti6sSAHfvPEo1gg8xhllRLM0SpuH
	 Py55B92WHjoNg==
Date: Tue, 11 Apr 2023 21:52:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Walker Chen <walker.chen@starfivetech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 4/7] soc: starfive: Add pmu type operation
Message-ID: <20230411-flavoring-sternness-a3b6cdee9fcb@spud>
References: <20230411064743.273388-1-changhuang.liang@starfivetech.com>
 <20230411064743.273388-5-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230411064743.273388-5-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_135239_862899_761FA109 
X-CRM114-Status: GOOD (  17.76  )
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
Content-Type: multipart/mixed; boundary="===============0521284440306735862=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0521284440306735862==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9jTLzkgimlFJEOUu"
Content-Disposition: inline


--9jTLzkgimlFJEOUu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Changhuang Liang,

On Mon, Apr 10, 2023 at 11:47:40PM -0700, Changhuang Liang wrote:
> Add pmu type, make a distinction between different PMU.

Please write more detailed commit messages, thanks.

>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/soc/starfive/jh71xx_pmu.c | 55 ++++++++++++++++++++++---------
>  1 file changed, 39 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/soc/starfive/jh71xx_pmu.c b/drivers/soc/starfive/jh7=
1xx_pmu.c
> index 306218c83691..98f6849d61de 100644
> --- a/drivers/soc/starfive/jh71xx_pmu.c
> +++ b/drivers/soc/starfive/jh71xx_pmu.c
> @@ -45,6 +45,12 @@
>   */
>  #define JH71XX_PMU_TIMEOUT_US		100
> =20
> +/* pmu type */

Delete this comment, it's obvious.

> +enum pmu_type {
> +	JH71XX_PMU_GENERAL,

I'm really not sold on GENERAL as a name.
Why not name these after the compatibles?

> +	JH71XX_PMU_DPHY,
> +};
> +
>  struct jh71xx_domain_info {
>  	const char * const name;
>  	unsigned int flags;
> @@ -54,6 +60,7 @@ struct jh71xx_domain_info {
>  struct jh71xx_pmu_match_data {
>  	const struct jh71xx_domain_info *domain_info;
>  	int num_domains;
> +	u8 pmu_type;

This is an enum, not a u8?

Thanks,
Conor.


--9jTLzkgimlFJEOUu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDXIkQAKCRB4tDGHoIJi
0kByAP97IOiAFgI8nObj/x4ZMdTZk7xSaKs/qUUM2jPffnTMYQD+KVvBSO9lhyL7
NFR2FZ7jNsQX8DC9ZEqOFcs91Gip5A4=
=lb9a
-----END PGP SIGNATURE-----

--9jTLzkgimlFJEOUu--


--===============0521284440306735862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0521284440306735862==--

