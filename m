Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5E1C77B78
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 10:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yHKv2e0Va0aeZWPMCWs/KMbB2/2htkQcKKnzAU2JHw=; b=1tjQHeQ7CxmDi9Geq65jQzgQ92
	i2bwbnfz6uYdga1ZzRpvhSrvxFTjROKReSkjy0Ys/VE9oD6Xe3cCeLq5EJdNiVseLZ6bGe58dYVba
	d9Bt0gbWkYKbWs9NO/jvkqNATD+pmeder9fxO+/PcbSisncwkqcjzzcQ3+dl61/E6EjWH4mXUnbgF
	AcafmvUMGXIz3pBwnlUCTbjSwEA2CsON7MLWYLqYGs1IgEsDPfceiqVdgsTnf1MqeTvA9xfrqNYvP
	lXsMD2GCnICHd7Ur00NLxP94nq6aQLE/FHxTm7sL7nSQNDLiXLXphry40DE+VHo5ja2n43zNi3nYA
	XRojmSDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppRX5-007gmC-1i;
	Thu, 20 Apr 2023 10:28:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppRX2-007glN-1Y
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 10:28:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1681986532; x=1713522532;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PxxF+ybrqPaMA+5/3lIm0KfonobVUIOCFzFZF6VC8s4=;
  b=MMmC1dwPDn9szBIi9iKJ8XuGU+oQgCZAIT0o5SZU3ybxlpiptLKZtELp
   bHfQAopGi/mu9RTFChfrLWP5R5QB1Nb7OJ9InK3bo1IdhWVKbUplSd6Uq
   tnNqvAv+phyXdi9awiJWQsJ+X/sCVRxOfNTLi1zbfXzyHIIZALE6Sm2Mg
   CwgyTpGEPvBlywXq8tXQGjHis2UnuUS6n76baFGK2kg7LIMxxEC4zJhcs
   I5V/V8adO98TgzVp0/Oplzo6EynWiQXHvtCWdlLdc47sj2JbyRz4oL/I5
   VIKKgvs96G/ebvHXThR6gUTQd27Lf15vnDd0IeffiNI8JrMwSW4cpuBgV
   A==;
X-IronPort-AV: E=Sophos;i="5.99,212,1677567600"; 
   d="asc'?scan'208";a="148053676"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Apr 2023 03:28:44 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 20 Apr 2023 03:28:43 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 20 Apr 2023 03:28:40 -0700
Date: Thu, 20 Apr 2023 11:28:24 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Nylon Chen <nylon.chen@sifive.com>
CC: <aou@eecs.berkeley.edu>, <conor@kernel.org>,
	<emil.renner.berthing@canonical.com>, <geert+renesas@glider.be>,
	<heiko@sntech.de>, <krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
	<u.kleine-koenig@pengutronix.de>, <devicetree@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <nylon7717@gmail.com>, <zong.li@sifive.com>,
	<greentime.hu@sifive.com>, <vincent.chen@sifive.com>
Subject: Re: [PATCH v3 2/2] pwm: sifive: change the PWM controlled LED
 algorithm
Message-ID: <20230420-pension-threaten-bc9a549465ab@wendy>
References: <20230420093457.18936-1-nylon.chen@sifive.com>
 <20230420093457.18936-3-nylon.chen@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230420093457.18936-3-nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_032852_578928_FD179A7F 
X-CRM114-Status: GOOD (  11.02  )
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
Content-Type: multipart/mixed; boundary="===============3416956307509403128=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3416956307509403128==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="221CyLf96APVzjPW"
Content-Disposition: inline

--221CyLf96APVzjPW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2023 at 05:34:57PM +0800, Nylon Chen wrote:
> The `frac` variable represents the pulse inactive time, and the result of
> this algorithm is the pulse active time. Therefore, we must reverse the
> result.
>=20
> The reference is SiFive FU740-C000 Manual[0]
>=20
> Link: https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b=
16acba_fu740-c000-manual-v1p6.pdf [0]
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Hmm, I don't recall reviewing or acking this patch. I do recalling doing
it for 1/2 though:
https://lore.kernel.org/linux-pwm/Y9len4GinXQ101xr@spud/

Please remove these from your next submission, I don't have any knowledge
of this driver nor do I maintain it, thanks.

> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>

This SoB is new too AFAICT and looks a bit odd.
Should there be a Co-developed-by for Vincent?

Thanks,
Conor.

--221CyLf96APVzjPW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEETyAAKCRB4tDGHoIJi
0twCAQD+D5uuZoL6Zj8V7Jd9fPKoYRdogs5ET3HIn+Gcls1UdQEAzjD2zPc7ebgY
pOORg2ws5wOTXnrM95U5x6F9kWjMzws=
=E5F/
-----END PGP SIGNATURE-----

--221CyLf96APVzjPW--


--===============3416956307509403128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3416956307509403128==--

