Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77613EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 22:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbq4htlfeO5xSdXAa5A4pTF80GQC49dc/onPkDks0x8=; b=iEddQjx4G0AdD5LsodofiytQo4
	oH4c27K1GpoPHxwODAKAbI3/hpIBepl8EYM1wU9K09N6dllR3wJ8ELoOVL5EZxizsv6/qe+tc2sMg
	9UJZmEYeqK2B0ug0pVz/Um5J4pW/scEmXdMs2g2PX6GyQxgoGym0Hid3UMlxx1PxbWkpoua22reY0
	btZLyyySHq0eNMoTTWqdQa4Dk7hh03XGemKEZGZfeAIPqYPIAa2zQwni5Fy+abvAhqNPfNGHRDRGq
	7ip4715Bq+XZq012TE+llqcv7ob+FXgHjI5DMZC3Y2dfFNwnTBPND7LW/kNcqfZCwuU7j2iSnyLnp
	9cPx7CPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGoT4-00EIOi-21;
	Tue, 04 Jul 2023 22:25:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGoT2-00EIOF-0R
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 22:25:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9427761386;
	Tue,  4 Jul 2023 22:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF750C433C7;
	Tue,  4 Jul 2023 22:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688509551;
	bh=l+UWSNWnPBn9YwHrYZ0j4Lv7hwDX/3gV8Kn6aaki1HE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WMHxaLp1Csrv16oO4rGOZ+vPwaP2Zr9ieNInLhYuaMs6zfv+FnF2gL2AMG2a8mdSD
	 Bv0zi8vQl52i5JCuuLsSpfalG5lgyixtcUCVgNyfFqXZ/eq2BFPCgwjfk9VYciSpcb
	 Uq18eBCZpSOVftI1qnf2kjg/z7czmLGJfeQnN2GeZL3hxvFxHBmRwfJAZJZTo8RryO
	 J+XIpwMTA6uAhDxOMWgemhgEV0A+OndbJ871VpwP9ZF5V5wYPyk5Jkg0NC1SzJQC77
	 A4zg/PcJa/s6R1xNSSqLZLq8JD5V2Bh1Z7kGsQWwdP6S6dWAk8D3BntnTBp7Y6NAO+
	 Ais196WrPJiWg==
Date: Tue, 4 Jul 2023 23:25:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [RESEND PATCH v6 5/7] clk: starfive: jh7110-sys: Add PLL clocks
 source from DTS
Message-ID: <20230704-tribesman-grumbly-86db5a8c1905@spud>
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com>
 <20230704064610.292603-6-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230704064610.292603-6-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_152552_216692_99A700C5 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============3254749473999779725=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3254749473999779725==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dF3s5FbwRnrv/rJT"
Content-Disposition: inline


--dF3s5FbwRnrv/rJT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Xingyu,

On Tue, Jul 04, 2023 at 02:46:08PM +0800, Xingyu Wu wrote:
> Modify PLL clocks source to be got from DTS or
> the fixed factor clocks.

Again, would be good to mention here that the reason we are keeping the
fixed-factor clocks is for backwards compatibility with the existing DT.

Otherwise, this seems good to me, thanks.

--dF3s5FbwRnrv/rJT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKScaQAKCRB4tDGHoIJi
0hJkAPoCQb991q3ts0PJelvRVhrMb36/OMkra5qkdsjLVOB9IQD+JLRYIxcJoCqE
9oBLSnO1ugEnIbqZGcJ/S6UTfT48eAI=
=Dpi7
-----END PGP SIGNATURE-----

--dF3s5FbwRnrv/rJT--


--===============3254749473999779725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3254749473999779725==--

