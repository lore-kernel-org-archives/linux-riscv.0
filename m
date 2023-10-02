Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A013DE784AC
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 12:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/c0TMfqQO/RjPXvc17neTmgS/fg4+GHHKBDpQ2qRSI=; b=3gCTWRX9RmWfh78yjT4AakTkOY
	GhTk43g+p67L0rJzmAJcHym+HP96CpnN1hk7j+sOZ58Rvtg0CfJ/3H31hngJ2sH77LIkPpnUuoOzI
	z4X6erCHQdJIDXWozzxZncXxzJnYd6k2H6PbzCt35914nlF00mM2Pnn+wCZxQqqJQBHz9vLQHfT0M
	ydlWfeVNsb0jwgfC3ZrAKDkqSnnc1MLdXT2HhfvWLnqMG8MokwBTJnr7VLp3iWPI6IpQeMdRcCtKs
	Sw5RpJwiI8OrJ8b04g4huWMZxcHvtkrXVlU22aTKxbvOqkZTLGl6DXGDlZexoWLsybP6KpRxbAAGE
	MeU/jegg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHwI-00ChYL-09;
	Mon, 02 Oct 2023 12:22:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHwE-00ChWs-2l
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 12:22:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B0BB3B80FEC;
	Mon,  2 Oct 2023 12:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F28C433C9;
	Mon,  2 Oct 2023 12:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696249328;
	bh=9JTxOS4Ez5ORtaTea5hqlBqSPR3EmYOiqEikAVo0TJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YVAMnLqlATfqsZoU4xC+VSc696gPnBhDzh+6lCcGUTLWPOZcc9NkVoFkULvKW0ju9
	 CBYXtRW7/U1chaU1zBEs7VdXxqqy48g2GGnIAQ3WOHn8RJCMRLkwFprgvfS27ZZz2r
	 wY/HBEu09y7WvyjS5BIsYJdAuw2tMEeco8Ffexm2ILLuWlaEFKAcFk9b6LKWGTlOID
	 gDp3doFvolTvfUVvqt4U9hLdBPZtD+2N/sKwYSSLCIKJFLtHM4HmCu43N/osd4/Pwo
	 nLMfa83Hk1HT6x0e7QG9n2lzASKpnZJNi4XAFF1lScaFD5nR3seURCsrDYICj+m+o9
	 7qUA38wrlwUWA==
Date: Mon, 2 Oct 2023 13:22:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Inochi Amaoto <inochiama@outlook.com>, chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com
Subject: Re: [PATCH 0/5] Add Milk-V Duo board support
Message-ID: <20231002-slurp-anime-a2308245174e@spud>
References: <20230930123937.1551-1-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230930123937.1551-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_052215_024446_4AF0E1AB 
X-CRM114-Status: GOOD (  12.10  )
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
Content-Type: multipart/mixed; boundary="===============3502527237210729135=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3502527237210729135==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7PRu9BiGWpbVBTj7"
Content-Disposition: inline


--7PRu9BiGWpbVBTj7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Sat, Sep 30, 2023 at 08:39:32PM +0800, Jisheng Zhang wrote:
> Milk-V Duo[1] board is an embedded development platform based on the
> CV1800B[2] chip. Add minimal device tree files for the development board.
> Currently, now it's supported to boot to a basic shell.
>=20
> NOTE: this series is based on the SG2042 upstream series for the vendor
> prefix and ARCH_SOPHGO option.
>=20
> Link: https://milkv.io/duo [1]
> Link: https://en.sophgo.com/product/introduce/cv180xB.html [2]
> Link: https://lore.kernel.org/linux-riscv/cover.1695804418.git.unicornxw@=
gmail.com/ [3]

Other than the comment I left, this seems fine to me. I'd be happy
enough to pick up the pre-reqs from the other series & this one if one
of the Sophgo maintainers acked these patches.

Thanks,
Conor.

--7PRu9BiGWpbVBTj7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRq16gAKCRB4tDGHoIJi
0hPiAQDbufi/xai4dSO3amSl9rZppK2+0zKPHMA4SBi3nyrj2gEA2gOHga+VuE+6
cQyX0Y96P/ro+L1m7PljdpadXG5/swQ=
=G7RO
-----END PGP SIGNATURE-----

--7PRu9BiGWpbVBTj7--


--===============3502527237210729135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3502527237210729135==--

