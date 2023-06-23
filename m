Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A92EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 16:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6CH1VYVeGdcdvalBMIJhL3pL1bBoVwSVkvhHXiAEXyI=; b=io8nE184zABKA4oNMjjwysDKRp
	jhAWxl2EKulfh/Vxukrqt2oUTVQmOBiPQtv/tAbon30u4ugYX8q7HQHTHdyFz0MwfZqhRNOEHoBZP
	MT5oXJrXIi1I7q+pPulx/jIVeu5+4r5WEoloTaGA72F15MvMSJMduPFKNthYM1bzYQfihdtErt8+f
	q0Xz3aJZZx5BS2lQqCCQM6ySwpE4E5BboX/vJ2IQiA+71jvyXD12Zhv8A3FXiGf8h/j1BP7IKjb+S
	TSv+PeXvkvVg3CcvUNp8jC9K9eS92Cd7Lr8yfhmXjqqxxQRmZHxmwecvFx6OfGHlwda3HJrgAbtYA
	eY6X7Hyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCjbk-0044WP-2Q;
	Fri, 23 Jun 2023 16:26:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCjbh-0044VL-39;
	Fri, 23 Jun 2023 16:25:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7957D61A91;
	Fri, 23 Jun 2023 16:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9585C433C0;
	Fri, 23 Jun 2023 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687537556;
	bh=8BSU1uoOm7hSm6Lmw/MxVj8R8nDMM2P3Woosh1ZcvZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dpDW/le3KDwp9SrBMwFLunXeltQLNhKl2U8J0SM7Balu06xLVgppJtCvYuIlUP+1h
	 cEmFzUHLYjg3ZptCGYrGWyONt27rSixGJSUn/Zwu6ZSV0zNO7xlq/OhatNyqz9JbWt
	 tq4RRRQA+yPhQDYgk5GTMv1gwH/9ouerLgnlWXFtxv0jNRImQbRjpDeTzBtAGi/VMV
	 GpePlUptHQyq7H7WpIk/ovn6g7L9lEYHwMMA7nfrvBicbBIoN2JkY0wRv085fawxv9
	 n7I7VoaqcDfOeuFV0pUpNFas+NjIyDhudOigZ7AN9EOzJq2ubHxJsaCFtjLL3MCBT9
	 eGbmsbr/hXpvQ==
Date: Fri, 23 Jun 2023 17:25:50 +0100
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
Subject: Re: [PATCH v2 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
Message-ID: <20230623-elite-exile-5074bcd2eaf2@spud>
References: <20230623150012.1201552-1-privatesub2@gmail.com>
 <20230623150012.1201552-2-privatesub2@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230623150012.1201552-2-privatesub2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_092558_057932_61B7E992 
X-CRM114-Status: GOOD (  10.47  )
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
Content-Type: multipart/mixed; boundary="===============2158577417573119374=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2158577417573119374==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1gOb5YGhbcjVPxc6"
Content-Disposition: inline


--1gOb5YGhbcjVPxc6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 23, 2023 at 05:59:59PM +0300, Aleksandr Shubin wrote:
> +  resets:
> +    maxItems: 1
> +    description: module reset

Also, this description doesn't really add any value, resetting the
peripheral is the default meaning pretty much, and should be dropped.

--1gOb5YGhbcjVPxc6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJXHjgAKCRB4tDGHoIJi
0jeaAP9fpvlP8uveLMQLZKt0Z7dT2q18NKXE+yLZo2WhRh+eMwD+JOXUIXIzpiIi
ZUc7H1i2K0OmCSMj/Bnbb1EyzhccTAU=
=CZ9F
-----END PGP SIGNATURE-----

--1gOb5YGhbcjVPxc6--


--===============2158577417573119374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2158577417573119374==--

