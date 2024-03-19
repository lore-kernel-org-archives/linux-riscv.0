Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A3BC54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 08:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHpuWKtOSkx2WutpXlJ0PLwnmvJNpGwhAEuye9O6BNs=; b=4TFuU7o8mo2NQo+I9aqnC0CkrB
	664xhg4lapOe2Pub/Mo/W45TR9b2oq3k2DfMQoERUJjwenQJwJWO4Eb9u5gM4AIlvFBVy/f4Q39fA
	Roub5BDjfKrN7muccQKNsvWd214J/Kr+Ct2g8ydlexMAi+THb1f2LR7gI0nTGUAFieIKkqhQYcOzk
	SadMJzcEuHBzrSFySEmRgnOl904eswn20Zf0TPa99vuKNzZTtD5PNAmFH4ASnGV1oEhMgKitpR36x
	DWUeX1aJO39wjaTf/Bp3zy+jOtqayLECgsPCofrNo2svyqVzInYGOsnidbeySpYdKG97U4Y5KwrVl
	D5Xk26rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmUgm-0000000BrK9-2gOu;
	Tue, 19 Mar 2024 08:19:16 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmUgi-0000000BrIT-25MK
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 08:19:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C656CCE0C6A;
	Tue, 19 Mar 2024 08:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54FEC433F1;
	Tue, 19 Mar 2024 08:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710836350;
	bh=3SfmKfgUNOAfWCL6jKlcEf4C3YVN39oYJGMEMbuonRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vwp5CQdn0MIt9yrPHEn/qNqGQhxuevwB8kuKHo0hf5vB9zBbeR1dBbvQFfba3D5ms
	 qldO+kjEhp2TzRHDvFXQxfDUVX3+2MfeNT9p12orWYvhYGqXGvxZgac4oTTlaos32r
	 Y2lt0/aPq4w0UKk0cdENv5BA6aZ9TZ8CxBTQ7QVBYhj8rZ+nEnqRMr3WY9xT1vwkBD
	 8Bml0CbA/0KVQw7dlNSF0IjGdYFiEqP0yk8ddXTy0OgmBuCxqXrBYPnXwQEhCIRRDU
	 DCO4pwCfa8Wq5NILweaQshURhPwib4yxlUOaU/+kGrMm20KDt7ZfNc9wSsvZNdt7UK
	 ixNOpk2nFNMhg==
Date: Tue, 19 Mar 2024 08:19:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Ziv Xu <ziv.xu@starfivetech.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Walker Chen <walker.chen@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/3] clocksource: Add JH7110 timer driver
Message-ID: <20240319-vivacious-anointer-cf790d8852c1@spud>
References: <20240318030649.10413-1-ziv.xu@starfivetech.com>
 <20240318030649.10413-3-ziv.xu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240318030649.10413-3-ziv.xu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_011912_733986_917CB8FA 
X-CRM114-Status: GOOD (  10.65  )
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
Content-Type: multipart/mixed; boundary="===============8977864677511153060=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8977864677511153060==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YezK/PMoxPe85t3w"
Content-Disposition: inline


--YezK/PMoxPe85t3w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 18, 2024 at 11:06:48AM +0800, Ziv Xu wrote:

> +static int jh7110_timer_start(struct jh7110_clkevt *clkevt)
> +{
> +	int ret;
> +
> +	/* Disable and clear interrupt first */
> +	writel(JH7110_TIMER_INT_DIS, clkevt->base + JH7110_TIMER_INT_MASK);
> +	ret = jh7110_timer_int_clear(clkevt);

The return value here is not checked/used.

> +	writel(JH7110_TIMER_INT_ENA, clkevt->base + JH7110_TIMER_INT_MASK);
> +	writel(JH7110_TIMER_ENA, clkevt->base + JH7110_TIMER_ENABLE);
> +
> +	return 0;
> +}

--YezK/PMoxPe85t3w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZflKeAAKCRB4tDGHoIJi
0iiAAP9eFKT0Wvg9p6zbDBpV0eN1dqOCx6nUB2Ukf5DY1ap3LQEA5MjriVvzPk0/
gnnyHqu05K8r0itRDk0eHc7kHO+3mws=
=dyH+
-----END PGP SIGNATURE-----

--YezK/PMoxPe85t3w--


--===============8977864677511153060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8977864677511153060==--

