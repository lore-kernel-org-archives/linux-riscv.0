Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79932C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 17:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7B4T4dBApX4ZRir7AL1y45jmxt1QfG046Wd8RvHyD2k=; b=EEAaj1zGgxshkWqRYSCdJwJFWe
	V3KIGTfSl1kELUgt9RArS+NnzOMotVKBFmH2i82TxrUNXcKXlV5LtUiAnfiaMvEpiY6dgLtn8eZD3
	YdYirhgis6Y36cwK2vEqFSlzRTRrq62I19jH9vo5TF/MsCJRxZVo049ikrv5zrv+MVf041kMXXyFe
	P5AOkLQ8LJSwAuunw5QXPgFMztLQMOXEBXwpPiArtTsLplg9KN+YZeuHaQjbJR6bJpaq+y255EeIR
	AN7We+vWF+RZPrPkDrIHRJ2ev/E46SKyZYXMIdgiyT03W7h+tOX8Faz2qoo3FldIxNfExiTLCTyQt
	rNSJFinA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r18ch-006t7j-1v;
	Thu, 09 Nov 2023 17:15:19 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r18ce-006t6p-2t
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 17:15:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C4A99CE131A;
	Thu,  9 Nov 2023 17:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37E3C433CA;
	Thu,  9 Nov 2023 17:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699550114;
	bh=VrmtHvFIFAf4vhLknqzGY4CAC0ddBJN+OXw9FKzqRB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qe0bB+AtLMXEM85wddl2mDF6P2tPMcQptGsAbroFpDiBoVeaIErEExxtxEXZuxjT+
	 A0gx9bKZDMfrUgsvZAiPVXpVrlIp6pgzuVovXV7sJs1HG1rShXjZMJ9qhdj7UHyIXq
	 +8IP5ArYXANUZjyciVG/N0L2IlQwGe2bKrJfIaGFjhQ8Eu8uJ1atocQ7A3O0a9VJVI
	 gfCiVtJ37OqASUEhhmB5+sOtz+csR/Hkj8+W4KfzJGTnPIl7Rbc043+F1jHstN1Eun
	 zIDFuEpYHUYQQWsZnrbDjgb97Zoi+jiXpoJvcVNukd2Z5NXwkBnttMzDkGf+Bjlpmh
	 wSnul6nNo9jrA==
Date: Thu, 9 Nov 2023 17:15:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
	git@xilinx.com, Albert Ou <aou@eecs.berkeley.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: riscv: cpus: Add AMD MicroBlaze V compatible
Message-ID: <20231109-hardcore-empathic-dd95ccb2c878@spud>
References: <d442d916204d26f82c1c3a924a4cdfb117960e1b.1699270661.git.michal.simek@amd.com>
MIME-Version: 1.0
In-Reply-To: <d442d916204d26f82c1c3a924a4cdfb117960e1b.1699270661.git.michal.simek@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_091517_111561_B6A1663E 
X-CRM114-Status: GOOD (  13.70  )
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
Content-Type: multipart/mixed; boundary="===============2352045440081355700=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2352045440081355700==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7xwT4XJ225knA3hD"
Content-Disposition: inline


--7xwT4XJ225knA3hD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 06, 2023 at 12:37:47PM +0100, Michal Simek wrote:
> MicroBlaze V is new AMD/Xilinx soft-core 32bit RISC-V processor IP.
> It is hardware compatible with classic MicroBlaze processor.
>=20
> Signed-off-by: Michal Simek <michal.simek@amd.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
I thought I had already done so, but must have forgot to actually send
the email.

Cheers,
Conor.

> ---
>=20
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Document=
ation/devicetree/bindings/riscv/cpus.yaml
> index 97e8441eda1c..7b077af62b27 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -32,6 +32,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - amd,mbv32
>                - andestech,ax45mp
>                - canaan,k210
>                - sifive,bullet0
> --=20
> 2.36.1
>=20

--7xwT4XJ225knA3hD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZU0TnQAKCRB4tDGHoIJi
0tgeAQCQdC+QAWJRhWvWwoAoN/Msq0G/jpWZOlReGX4cEyxHXwEA9pkjRVCwq0ZR
BsGc3oeMsnsa+gsJ7GuY0Ecjh3T7qgM=
=TmUg
-----END PGP SIGNATURE-----

--7xwT4XJ225knA3hD--


--===============2352045440081355700==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2352045440081355700==--

