Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A24AEB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 15:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZAW/WyLQPYsUBqZxZb/YmVfCH9S5Yrku7CAg8mzPR0=; b=rqYmfsMFU0Wl+gKG1lWPnUndOy
	jyYqYUhqOHER34PlhocSo+OKiD7bTXt0Ew7zB8+RoM5ErxIVhIkU9laBCti7jlHu3jdH6vppbsUnB
	333mWb8UF185aSCPRIMrCHg+Qh8fal9si+R96UhoRTuUD+Jae42UtgY4nQClai21i6w4TWIs77ifk
	A2GPlN+TXoA1EYdBTmuQosIjmeAPqTXjbSx2al0+T6lLHcOGThbkVvzNJ3wqdc+Fon8koQ/56ImNe
	OEP8s+DA1ICz0dascqyrW8x86q1ydriETxHeXs84tasqwXuSPKzMmpDhkUPLf2zqj0a0obPFeX9vV
	xYR7qciw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEAub-00DYkQ-03;
	Tue, 27 Jun 2023 15:47:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEAuY-00DYiw-1M;
	Tue, 27 Jun 2023 15:47:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9EF21611D6;
	Tue, 27 Jun 2023 15:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140DDC433C0;
	Tue, 27 Jun 2023 15:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687880836;
	bh=ml4C6EnGknzfMzPTZoEo67LgKgml43zDDrvSXOnzXBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jo0Rs9Cd50M7ikygAnByCUIyz8xw/PidC+UpvtsNzX24REd0L/74TkfhTtibCQCp1
	 FUNvRYPuQTz7vJFJS/wEKQvW+NLEnKYl++uWRTXlHDxbtE3kxl7eTDp9HUv3AWEjH8
	 DUe6MQpdyCAhZoktplmaWJHZRGK6Qm3Pkoj+iWo1A48RdRaaNAzlf86IxQunpfoo33
	 8WK/jSm3QV7vXV4f1uHHsAmwhPpaY+ohEKBiEvlnG6BqyjAQjjI+xQ5etGycW2bwqD
	 TiBI01q9UpML6K67M/ROnx/is7/vdhoBt6yn3Qa76Ek1WGyOJ97N5ePDurMlKmn8E1
	 klUMrQIQf4dxA==
Date: Tue, 27 Jun 2023 16:47:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Aleksandr Shubin <privatesub2@gmail.com>
Cc: linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Andre Przywara <andre.przywara@arm.com>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
Message-ID: <20230627-zestfully-unskilled-970e81550621@spud>
References: <20230627082334.1253020-1-privatesub2@gmail.com>
 <20230627082334.1253020-2-privatesub2@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230627082334.1253020-2-privatesub2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_084722_522084_59120658 
X-CRM114-Status: GOOD (  15.78  )
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
Content-Type: multipart/mixed; boundary="===============1580607756187799720=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1580607756187799720==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NYllrFxPnpdY7/Ib"
Content-Disposition: inline


--NYllrFxPnpdY7/Ib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 27, 2023 at 11:23:24AM +0300, Aleksandr Shubin wrote:
> Allwinner's D1, T113-S3 and R329 SoCs have a new pwm
> controller witch is different from the previous pwm-sun4i.
>=20
> The D1 and T113 are identical in terms of peripherals,
> they differ only in the architecture of the CPU core, and
> even share the majority of their DT. Because of that,
> using the same compatible makes sense.
> The R329 is a different SoC though, and should have
> a different compatible string added, especially as there
> is a difference in the number of channels.
>=20
> D1 and T113s SoCs have one PWM controller with 8 channels.
> R329 SoC has two PWM controllers in both power domains, one of
> them has 9 channels (CPUX one) and the other has 6 (CPUS one).
>=20
> Add a device tree binding for them.
>=20
> Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--NYllrFxPnpdY7/Ib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJsEfQAKCRB4tDGHoIJi
0juTAQC42GZyWY8pE8qWzDE82yIgW0XYwxY/lFvJ/QGGvKog9wD/X843uIT5YTU0
TZzhqTOUmU9iMVxgDlhIq2zh0+p3JQc=
=SsPs
-----END PGP SIGNATURE-----

--NYllrFxPnpdY7/Ib--


--===============1580607756187799720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1580607756187799720==--

