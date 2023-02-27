Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54CBC7EE30
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 19:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGczXd9TyZzwxRP+8Pp0ZMmpbQMzQJej7x0Rn/Ps4d4=; b=p07d/ewrCcGSEccMEDGm5HQu7I
	v5B/FBvv+/FiGXFw/9QtX+e3SQKMhj2S6rMp0KAeX0pZfabkdoeL1jTT3jgvOncB/UNtQRzXumrII
	IVDIjExqXl54359OFYD6PDJliIgUwk/mQBHmYh1klob9R6R7GwiG9+TCLoQM7Z291xJwcbHS1FoeE
	zp3zLsotOgfUhrYW6co/FkMdQmfdPvXKRSBCx1MEnG/dEwC4iTGYr7UySb/MxjY0kdepMFWOTzuoC
	vq3+JuREaRH2b2IbLQRLS2FV1BXFOY+yZwYJFG5TjrM96MZcY0unpTC9INkc0GQtSigzxD1LpV16k
	uMu1I5HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWjYj-00B35M-H7; Mon, 27 Feb 2023 19:53:17 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWjYh-00B33M-9S
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 19:53:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F2BF9B80DB4;
	Mon, 27 Feb 2023 19:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3AF4C433EF;
	Mon, 27 Feb 2023 19:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677527592;
	bh=FN7q+7LSkEQEP880hk5AYmzKXSJvzUeUVUoebZQ16HA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tYj+uDZDne/XGQiIqDWNdSQzxsv/OBNbwggrKIK5fDT5AdGAdFlLg7n1KODd+NYf+
	 EV1Ne8D2msXpPrcqoSSSSy3os+Z0QHTf/KSQWv7RdFamOk16lGvZcGShDlqko/Rftm
	 1J9NTjHHxoAzBVROVwzTTvqxwX4ykZpGgjxd571UFCAZ+a7WyvJUBlWzQwjzN1nGdQ
	 Na6nld+VvRuyiOj2pQt2uIExSPPVE5JDc3ioC1axM5c3VHqmVmJbtE+J1k37rNYakU
	 HC0hpyzsdMk36kbPalLwJBHb9nM5yvEdz65WHE5FpHQjgr/8HJ6u7QVb2ORaXyTWB3
	 JiVsEeuo8RBXA==
Date: Mon, 27 Feb 2023 19:53:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 11/11] riscv: dts: starfive: jh7110: Add
 STGCRG/ISPCRG/VOUTCRG nodes
Message-ID: <Y/0KI0rgqjqMi1Db@spud>
References: <20230221083323.302471-1-xingyu.wu@starfivetech.com>
 <20230221083323.302471-12-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230221083323.302471-12-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_115315_504594_F6ECFF0D 
X-CRM114-Status: GOOD (  15.62  )
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
Content-Type: multipart/mixed; boundary="===============7307598889717288726=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7307598889717288726==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zQa043iT/WKT54d9"
Content-Disposition: inline


--zQa043iT/WKT54d9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 04:33:23PM +0800, Xingyu Wu wrote:
> Add STGCRG/ISPCRG/VOUTCRG new node to support JH7110
> System-Top-Group, Image-Signal-Process and Video-Output
> clock and reset drivers for the JH7110 RISC-V SoC.
>=20
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 59 ++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/d=
ts/starfive/jh7110.dtsi
> index a5e6fb3ad188..697ab59191a1 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -6,6 +6,7 @@
> =20
>  /dts-v1/;
>  #include <dt-bindings/clock/starfive,jh7110-crg.h>
> +#include <dt-bindings/power/starfive,jh7110-pmu.h>
>  #include <dt-bindings/reset/starfive,jh7110-crg.h>

Please keep these sorted alphabetically, otherwise this *looks* fine to
me.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--zQa043iT/WKT54d9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/0KIwAKCRB4tDGHoIJi
0jvJAQDekG/U779L3Qjyj6JbBBmIo+FDgfYF3Uun3G4Hi9mw+AD/XmgxAMbFNf8a
ktj4/8QaSfT2gPFgTUOnACOYIdRbDw0=
=e2v5
-----END PGP SIGNATURE-----

--zQa043iT/WKT54d9--


--===============7307598889717288726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7307598889717288726==--

