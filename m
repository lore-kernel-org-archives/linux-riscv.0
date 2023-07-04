Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C37EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 13:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C21E9ap/DZDQINnuVXD2fEZNTPdvcqupaqXxRPHlagM=; b=1spKs/XDlCN/OfnecyM5ViQhHl
	Tj4Up6J1nAYmEpfULagdVnrskWnZJnf8LPmHuTxvKih7Xos1FN5rbwyr2DodpJlVWNqEpSr12P9ZM
	DftQPRJQQN7RKNUsjKIAlD9YZedqTzZQBUKnEYxDtOq78SFE8aWcuGSxRlxNhEuASSlmrqHQjAh/O
	TbYW2joXu2PXWhWY61ekuC2S7CXmpScq3zQyGplIMst6wloSyxfxT2hiN8QN3jMYrclHAFuwmLnz6
	uwylPvGEdzTi3MXJ1RNIl//jola90SYDS18mR74V7RWtLVhhL6jArykn8EOwjH+Yf1eA1C0qcLmND
	EOntb62Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGftG-00DN9A-1u;
	Tue, 04 Jul 2023 13:16:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGftD-00DN8i-2K
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 13:16:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 34D066123A;
	Tue,  4 Jul 2023 13:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4678BC433C7;
	Tue,  4 Jul 2023 13:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688476578;
	bh=9OfNHl2CO4ROmH3NF/2N3isOj60W98pvOXJYsArljSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ud24Fpvc23yw0jB69LVc1U7yb9UrxAvp/lHgt+t8ji497SVTdEwl+qC4OLtrFszRe
	 P+n/mzaNsKgQl/86HJ2Yy5LM9JaO2Jt4eIguPh8zzRHbNeaWf4uGW8YrEs2t98YAgO
	 Iv5zTFgpNAB70CuEZzwIpD6C0XVXMJTDlnvAphg6yTOI79tTTqwmoqkr8CR6f4plqv
	 DPU3MMjuJczDzz9pTZxp38Ziv+z9GOeQ2e3AswbQx7GqXaiEYq2Zdt5CZBMpo1C+KX
	 qcBPmHX3wADJoFjoTfBwca3x8HJsy4BaZQMQL92THTO8Qv9JIEymBGJJnonIkXg6KO
	 ANTAVVDkVkbxA==
Date: Tue, 4 Jul 2023 14:16:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND v1 2/2] riscv: dts: starfive: Add spi node for JH7110 SoC
Message-ID: <6307c5b2-64d2-405f-b1a5-696d4184f6a0@sirena.org.uk>
References: <20230704092200.85401-1-william.qiu@starfivetech.com>
 <20230704092200.85401-3-william.qiu@starfivetech.com>
 <7f3b600d-d315-22d6-b987-eabfe1b04fdf@linaro.org>
 <eba1e868-6371-42fe-91be-bcbee54d1aff@sirena.org.uk>
 <4afd90d9-f1bd-f40d-1c79-50fef1406ab7@linaro.org>
MIME-Version: 1.0
In-Reply-To: <4afd90d9-f1bd-f40d-1c79-50fef1406ab7@linaro.org>
X-Cookie: Memory fault - where am I?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_061619_802557_9A30D5A1 
X-CRM114-Status: GOOD (  10.71  )
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
Content-Type: multipart/mixed; boundary="===============5878707318062334314=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5878707318062334314==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aFA/yWSMzb/vdMUW"
Content-Disposition: inline


--aFA/yWSMzb/vdMUW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 04, 2023 at 02:27:57PM +0200, Krzysztof Kozlowski wrote:

> Also see:
> "every Co-developed-by: must be immediately
> followed by a Signed-off-by: of the associated co-author."

> https://elixir.bootlin.com/linux/v6.4/source/Documentation/process/submitting-patches.rst#L467

Oh, that seems unhelpful especially with it not lining up with the DCO.

--aFA/yWSMzb/vdMUW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSkG5wACgkQJNaLcl1U
h9CdRgf/YT9C89atfxGy/SpvZXN6BNT9anIKzi+r5u287IcAy7tL5fpweh4KpQH5
I7TRVjyJJiiOAtb1BLxRzPip/o5TEa9QK4zrGJDyQOwpymt9xSjwNhzfsjr+J4dY
yKjbkq5+0s+te5MjqgdSFDjaeofXB5MO6T0YpB5CMhTUnvAyDv63+97PrVnJ/ILH
jHD3a/xvC8lTXEz6N0Tc2QjsRJoJhlYk47zaqqnlTI+Eei8P/NobfTFpUW6b2BJF
kGvTIwJkGuDuVNjjDydp+/m4yKLYeeTettfawSdSDsXGwzA03eAR+Oui4YY3rEoy
6wWtGofRbywYyPDWxHR1zUPgqlUFDg==
=sSlP
-----END PGP SIGNATURE-----

--aFA/yWSMzb/vdMUW--


--===============5878707318062334314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5878707318062334314==--

