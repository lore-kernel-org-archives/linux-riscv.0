Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726FFEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 20:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjskI5h/ob1uJzpVJVUquP9yeArEzyfZq98bEMv+jqM=; b=LHPXywIBtIuh0W1KAB+zW1s0Cz
	EkIiFqZ3aU/Jj/Y1OV4Oo7HOxBPCnBtw61EHrHgugAbY6ieXWtvlEDUFF6prBXWfZfRC3W07cdZCM
	72it7Vt1LW3TZMcTGRkbpdWOPchVYn6soZszbtdBl3Tt5DplRhb4/3i8pCOl6DNgfyCMqvcxaxbcl
	PrBOQ8u841IL/J89PTr1JPC0uC6SyQ16q/Hm06GqXdz5dStyF8UFdviPSzjqUv1+ZA9qE7FzxKI0M
	hRjOi9eE2eGoGOLS/YYEc9xfgm57EbFDo2Hw20m8AfzBFqXP7xgwMq7YOTonv9+WpdvCjERSR93xS
	wOF2UKbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEyIF-0025Pq-2F;
	Thu, 29 Jun 2023 20:31:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEyIC-0025O4-0P;
	Thu, 29 Jun 2023 20:31:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 91032615C5;
	Thu, 29 Jun 2023 20:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF2F6C433C0;
	Thu, 29 Jun 2023 20:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688070661;
	bh=FCckL39hhcHT57R5uYeNPhUQQwIFbfubCkljbMtdAYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pMFxkZiZLQWOpfqIBlL5paN6vadf1xSqWH3B6cDg6kABJyAg2i8HrcsxL+IhRhc0c
	 IOsoaOZu0zbuIODy6l6FoTHHpq97rmxDSXrvRNyxm/OHUCmVsrMR653cFN6ahVNpTM
	 qUd669BbNdNkLyY3fRbgT5zD0BnZr4hNzl0RoX3x1P6/2OqZpbkQ1d63XJZ/ejlh6p
	 boHl0SpSzSuZt0ysN/UtfNgjKS7v8M5iSNITjGA6KX694kD0PBJgItkHBPOFCxpKfi
	 afmfzOc80had61Fthbtb8M8adSHUjeyO/MtIhmUUkCmPeeKLBVaXgvn6KgA/8ENsPt
	 bHcWmAI5xLtKg==
Date: Thu, 29 Jun 2023 21:30:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 3/3] PCI: microchip: Remove cast between incompatible
 function type
Message-ID: <20230629-smirk-resample-6741dcf9eac5@spud>
References: <20230629165956.237832-1-kwilczynski@kernel.org>
 <20230629165956.237832-3-kwilczynski@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230629165956.237832-3-kwilczynski@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_133104_245553_B59BA6DD 
X-CRM114-Status: GOOD (  13.60  )
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
Content-Type: multipart/mixed; boundary="===============2410289931028203224=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2410289931028203224==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1tORRD56oX7m24Ur"
Content-Disposition: inline


--1tORRD56oX7m24Ur
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29, 2023 at 04:59:56PM +0000, Krzysztof Wilczy=C5=84ski wrote:
> Rather than casting void(*)(struct clk *) to void (*)(void *), that
> forces conversion to an incompatible function type, replace the cast
> with a small local stub function with a signature that matches what
> the devm_add_action_or_reset() function expects.
>=20
> The sub function takes a void *, then passes it directly to
> clk_disable_unprepare(), which handles the more specific type.
>=20
> Reported by clang when building with warnings enabled:
>=20
>   drivers/pci/controller/pcie-microchip-host.c:866:32: warning: cast from=
 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible fu=
nction type [-Wcast-function-type-strict]
>           devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_un=
prepare,
>                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
> No functional changes are intended.
>=20
> Fixes: 6f15a9c9f941 ("PCI: microchip: Add Microchip PolarFire PCIe contro=
ller driver")
> Co-developed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Co-developed-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Krzysztof Wilczy=C5=84ski <kwilczynski@kernel.org>

This looks to be the same content wise as the patch I previously acked &
effectively the same as the one I previously reviewed - you could have
picked up either of those tags from the other submissions tbh.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--1tORRD56oX7m24Ur
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ3p/wAKCRB4tDGHoIJi
0nbtAP4sy4P0Oru7YzNbLHMrWLhkwYJyOVKPMFqjwd0yIUAjLAD+M46rYMGjK+Se
VSqbMkFjW4dHvnCRoYjmNpzWoWvKUAc=
=eJrt
-----END PGP SIGNATURE-----

--1tORRD56oX7m24Ur--


--===============2410289931028203224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2410289931028203224==--

