Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDE8C5AD4E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 08:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HzXL28G6VZMSg+TYwO1ecEYbcLikCINieGkomO27gaA=; b=L/MMmZ5a0/v1hLo6go3KNNDU2G
	gvjyfUVXdOcnAVRptuNf5uNklmJE5VR9RotU2hJY41ccb6qYnrd5ZvaD+Voz4levy4qCFohbv+eng
	to1+U+FefI5dTSbSdDvar20Q0IR7o/nNVCuNdfPlVUNuNFW1vVkfVVHZkL7wFbvk5cQxsaYv8L8fL
	XVxsYoY+mWn+qY7S5/G0QoGx7yWb2oU2grbRCF5JcOtyqXspGOdM1wXM/bRcnAa3+XOXukfUR/Cc6
	HJqule0D9lrZLRVoVNX2jWECmKgymqv8v8ShOV5i23FfT6Ft6S7JwwPkqj6o1x645tLk/Wxv0huOU
	BBAnGfrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLbG-0000000BK1t-3Z3Z;
	Mon, 10 Aug 2026 08:43:14 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLbC-0000000BJwv-3kij
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 08:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1786351336;
	bh=9b6ShfMeZe2xAUD9+B2Stmwf48m8aw2mvouvW/AlHHI=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=YzVpz9fBx/BiYsAkfqn4CLVmugnwRJkZF8a7Ha7/tN7OjH+otvDzlh9KqyNZBgC6U
	 6gn8430g/FU1mkYrCtFK6GOKoa+YcKrr2WgWmqA0NGkS3opvvfph0bxN30/iEAcjTV
	 qNFZynqQGVVAMkhMOwAmqANgcNGsa8JfMuMJxaN4=
X-QQ-mid: esmtpgz15t1786351327tc93958f4
X-QQ-Originating-IP: kbLOV7gjYlNvnl0rraFfGXYnouNtT815jhLZiJswT5s=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 10 Aug 2026 16:42:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1439357261299029505
Mime-Version: 1.0
Date: Mon, 10 Aug 2026 16:42:02 +0800
Message-Id: <DKL4P0ONTLFP.3QG0CCUU76BUG@linux.spacemit.com>
Cc: <linux-clk@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] clk: spacemit: re-enable PLLs after init
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yao Zi" <me@ziyao.cc>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>,
 "Yixun Lan" <dlan@kernel.org>, "Inochi Amaoto" <inochiama@outlook.com>,
 "Alex Elder" <elder@riscstar.com>, "Haylen Chu" <heylenay@4d2.org>
References: <20260804-k3-pll5-pll8-1800mhz-v1-0-a3a75866ce32@linux.spacemit.com>
	<20260804-k3-pll5-pll8-1800mhz-v1-1-a3a75866ce32@linux.spacemit.com>
	<anGeZk0-YShccqwE@pie>
In-Reply-To: <anGeZk0-YShccqwE@pie>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mg1D4hNPaN4xNs8K0vq3tEv8dgERJCWMB9LOGp5Bj2xPYvHj/+zoldkR
	POwCaG4rKK3apn7ZzuXnwCLPsgBq2dP7PuzsXJm2DK6r9Or+ezbWnf52zq06d01HFpUU02k
	8te73QVb6+IBr+kgolvyc9LAuxuYLR38V3fNv7mmzoyDfjLVXUTZk2Kdh0TTWVjrltR/EeU
	AI/iB5Wm8TOonI8Yle/UeQf6mx8FasLAXBNZVgGVOLci6xrCCAU/rFOIoYFwPV62CGvVYU1
	tlX5hyWSRl4D/Q5JTdxj8s4WUK+xFqMXOGOxDMC0MLqIugORSYaylC/Vcjchk7eyKH3Al+Z
	mdiacvaheDmFPaA8rNkJxgVcUHzaQzdE7xK8gDiqSLR80MQOczv3yi6Jn3XWaWO3C/bQqgF
	Cp8mudDd1xSsCeptElIAdsI/C4m9XAhUoM/Es0comzm0kA3An2MAGbxKOoybjiroYvBDuIR
	N/hVmuFN3uRRBG0vQKelcHJCRhBoAsZf5FuT0IgJpd6m9QUjy4pN2bmi4Vetd0EdohtEIK2
	2YW9lpyxHyvT77gSXKc+J1Ru44EGAkrezF/dI/CqvJMwyZTkjM5GFgkTwe7xEiQ5V/q6x6/
	JzzrO/czLW++L3e8bQFiQ9nTjTQzsV1ntj5yAArktIZGUi9LuCAn6LFIKT5WLeA3SubOBy5
	ag1c0IaOa/JknG7QD0uxagJIFObnF+n7GDVc3JL/KQ1iNsGRHdE47QtB0IdRfSroWLPovtx
	XoFiZTvY4ws4hvhg+zw07o7d2FdJtMETDmmvpK+EqA/qpWgN2EOJxDtLIBHQPnaUtXtQTgJ
	Ir18g6oKm1TXlQKjQKslu579Kbzv3E4yLj8xlZ9PyXeriyoduWP0xgZnRb4fe9tIWF7UkOm
	CXrWNwOsDWE/5w2haymcFC3EyOFj48WpXusatS052skmw6sGOxhSbeV5zm2p4YZSVF1/tur
	ZtJwFk71wkfYrbf/qGydSyhUEMCMfHLhcRlXELzbGgh5WD6fnfpC5hB5I4CbtRre2tQK7hO
	KG9MD98K3lUvPqgPDdF8yYXm/MHvbuuvZ6tZGLAY32Vbg8pK3UXguzVaXmukuEStjkMHpbG
	X+Gq85LhXnVTx2BXsYAUh4=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_014312_131130_54A15D63 
X-CRM114-Status: GOOD (  16.71  )
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
Content-Type: multipart/mixed; boundary="===============6979425009621536445=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6979425009621536445==
Content-Type: multipart/signed;
 boundary=5c2444142807e9cfb537af5f4976382a35e3a9d6e77c043f51e0fe45cff4;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--5c2444142807e9cfb537af5f4976382a35e3a9d6e77c043f51e0fe45cff4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> I don't think this patch makes sense.
>
> If this PLL is essential for some components of the systems to work,
> there's no chance to re-program it safely after the kernel gets started,
> since all the PLLs in K1 and K3 are specified as CLK_SET_RATE_GATE.
>
> If the essential clocks could be re-parented glitchlessly, registering
> a notifier and re-parenting it before the PLL disables might be a
> solution. In this case, we need to delay the operation in
> ccu_pll*_init() until clock registration fully completes.
>
> Otherwise, re-enabling the PLL seems totally extra here, they could be
> enabled on the fly when it's going to be used.

You are right. In both hunks, ccu_pll*_disable() has already gated the
PLL before the newly added ccu_pll*_enable() can run:

> @@ -148,7 +148,7 @@ static int ccu_pll_init(struct clk_hw *hw)
> 	ccu_pll_disable(hw);
> 	ccu_pll_update_param(pll, &pll->config.rate_tbl[0]);
>
> -	return 0;
> +	return ccu_pll_enable(hw);
>  }

> [...]
>
> @@ -252,7 +252,7 @@ static int ccu_plla_init(struct clk_hw *hw)
> 	ccu_plla_disable(hw);
> 	ccu_plla_update_param(pll, &pll->config.rate_tbl[0]);
>
> -	return 0;
> +	return ccu_plla_enable(hw);
>  }

Re-enabling the PLL afterwards therefore does not make reprogramming
safe for a live consumer. I will drop this patch, "[PATCH 1/2]
clk: spacemit: re-enable PLLs after init", from v2.

To avoid delaying the 1.8 GHz rate-table update while this broader issue
is investigated, I will resend the current "[PATCH 2/2] clk: spacemit:
k3: add 1.8 GHz PLL5 and PLL8 rates" as a standalone patch. It only adds
the firmware-selected 1.8 GHz settings to the rate tables.

The existing problem of reprogramming an unmatched PLL from
ccu_pll*_init() needs a broader solution and is independent of the rate
table update. I will address this issue in a separate patch series.

                                            - Troy

--5c2444142807e9cfb537af5f4976382a35e3a9d6e77c043f51e0fe45cff4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCanmO2g0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvCy8A/3AS+h5VxUd4a+hzLwgWTitmdjKz5AQxKY9ffa9g
0PEaAP46TDFaDGtlJxZlgxExHbHVjyTZ7P44F33VqpOtqO4bBw==
=9C3d
-----END PGP SIGNATURE-----

--5c2444142807e9cfb537af5f4976382a35e3a9d6e77c043f51e0fe45cff4--


--===============6979425009621536445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6979425009621536445==--

