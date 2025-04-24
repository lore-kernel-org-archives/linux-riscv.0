Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE748C369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 08:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXRORBOkzh4z9oKkIRQTYYXQpWL28zpW1xsBRbymWvw=; b=Bbq993YAZ8Pq3W2MooI46FJHtm
	A9Ru6yS9IZBH7OwnsJjyvQvy4qH+PLRHykfipvFlUbd5NDpUXYlyXv0ANTLVdRI6AOlb3YAIplx55
	lKTCNwTlA+lS/s54Tv3axNOFghcL2Fo7OvUUnlxlqsXkb2YIp2dKhK71PFvloFMtlUa3hbX38kmQP
	qAdpoJHOdc2dusFv/H7CAM5Vjqb1KH4MSBa4cE0zfKXogBTNEFQ87+eUPr8uncJi0eiRQqklviTfN
	Kfmi0ASTbxKUVQxFA3vURUmXp9laJYYvTuDWibAUsl9/DEUmfywT0PkXF10zjLF7+oInmQm792/T2
	4iKQ5l2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s5K-0000000DLoo-2KsW;
	Thu, 24 Apr 2025 08:37:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7r2i-0000000DBlZ-1yEL
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 07:30:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6945F444D8;
	Thu, 24 Apr 2025 07:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332E6C4CEE3;
	Thu, 24 Apr 2025 07:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745479843;
	bh=kWaWSxfzAOeVQlRkq60NVI4QsIYjUWB1A9Y9Nj3yPCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HQ7OlNocl570YDHdFBrRWtojdEaHxy3uXCFJRTphSz6caEYX3Mjrrd6kfU1f4GW/P
	 Wr2bPOYaIcwazz3rZYitkGXDa7+2r/bhW8k9aXIzvjjzBqWD710ELJEgb2FN6nmykn
	 eS2AGgfNb/x2F9IzAYl5tJ0Oom5DX/RLtMfxahI8Bu5hqlqPYaNNJ26hMuBvQ8kOXJ
	 5Ef0Y0kKWreEavHMtkQcFro+VaXMdOcRg/evsCGlChHVV4WtbKS/rH8/w5pRDdNZva
	 C5n6kNNPbX4Jr46Kp49tR1KVSw5pkVo2LTP4yfk3K318mnq4nRzj2t13pcdTekq/Uz
	 or9QNBxC28Hmg==
Date: Thu, 24 Apr 2025 09:30:40 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dlan@gentoo.org, p.zabel@pengutronix.de, drew@pdp7.com, inochiama@gmail.com, 
	geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, hal.feng@starfivetech.com, 
	unicorn_wang@outlook.com, duje.mihanovic@skole.hr, elder@riscstar.com, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 2/6] pwm: pxa: add optional reset control
Message-ID: <mzfiyc2me2smqrrmiymzkzxvsyjmst6ggy7scq4wxz2yfj2ef5@np3h3k467mbl>
References: <20250420070251.378950-1-guodong@riscstar.com>
 <20250420070251.378950-3-guodong@riscstar.com>
MIME-Version: 1.0
In-Reply-To: <20250420070251.378950-3-guodong@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_003044_548565_812C7B6C 
X-CRM114-Status: GOOD (  15.05  )
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
Content-Type: multipart/mixed; boundary="===============8732746057080101955=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8732746057080101955==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7v5t3ymowpvpmtvv"
Content-Disposition: inline


--7v5t3ymowpvpmtvv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/6] pwm: pxa: add optional reset control
MIME-Version: 1.0

Hello,

On Sun, Apr 20, 2025 at 03:02:47PM +0800, Guodong Xu wrote:
> @@ -49,10 +50,10 @@ MODULE_DEVICE_TABLE(platform, pwm_id_table);
>  #define PWMDCR_FD	(1 << 10)
> =20
>  struct pxa_pwm_chip {
> -	struct device	*dev;
> -
> -	struct clk	*clk;
> -	void __iomem	*mmio_base;
> +	struct device		*dev;
> +	struct clk		*clk;
> +	void __iomem		*mmio_base;
> +	struct reset_control	*reset;

Changes like these are the reason I prefer to not align the member
names. Luckily reset is a write only variable and you can just drop this
hunk if you use a local variable for it in pwm_probe() below.

>  };
> =20
>  static inline struct pxa_pwm_chip *to_pxa_pwm_chip(struct pwm_chip *chip)
> @@ -179,6 +180,11 @@ static int pwm_probe(struct platform_device *pdev)
>  	if (IS_ERR(pc->clk))
>  		return PTR_ERR(pc->clk);
> =20
> +	pc->reset =3D devm_reset_control_get_optional_exclusive_deasserted(
> +			&pdev->dev, NULL);
> +	if (IS_ERR(pc->reset))
> +		return PTR_ERR(pc->reset);
> +
>  	chip->ops =3D &pxa_pwm_ops;
> =20
>  	if (IS_ENABLED(CONFIG_OF))

Best regards
Uwe

--7v5t3ymowpvpmtvv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgJ6J4ACgkQj4D7WH0S
/k6xkwf/eaBJze5ndiNHEnGHJcgfmpTZsHwESV/Cwj5PIp5luRW90TAB1L3SoNyQ
OHH/mCf9BoZemUdaM1+uHqSp2Uh8OzQqpeEYckqGWi2wYTCsTtlrbpfm27MdnWul
BQB3NvoFTVtICfchbF3t2qqI9MPmgQTsx/RKES15cnEoscazo3G1o1txQDY1zneP
U3mHPCwcM1PmKZIjFsySl2ptMiVHqO3G8oKZvk91HPeScVjOkk3mH+qy9aNN/mFf
veMH70GVkuQSSAUC4tAX/fRjbSZMXdeClEHuZ1yZjYLPVx2HquRP7bnt89wRDGzf
BnV9zfqbbZHhqmBShnKP2GewNTFnUg==
=2AE+
-----END PGP SIGNATURE-----

--7v5t3ymowpvpmtvv--


--===============8732746057080101955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8732746057080101955==--

