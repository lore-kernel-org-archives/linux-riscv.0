Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA015C001DE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 09:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PkJMUaPrZ+bxSdvT45EoHFLhn96ptds0n6TpjnqCxy4=; b=1m3NhQ62z9MS/m/VbXyL8x1vC8
	Mvmc2AO4t0Sj0W9ycTm2aj3sYslAySuh2iZpePwKR3GYKWU9122tEOfFX91ySH6X1spmsReSFWZhh
	csAkqCgxl3kn7Ssqc8GMaaK5Wf3HVdoNyTL1/mWjl7QJihh270GO9QDny2Q/OerbG9hupNDUVOgLJ
	i67ip4tsDP/fyKfmECqHPzlHxQnvuModK066QyDD2RL035S0jFrwpxl8wEpbmIIcBvA8e0kbzmCPA
	N9K2H+L9G6js0/CPQDKKIzFi1vb2YtTO2YwS5faqCdURv9dXFTw0ZqIIm1kift+9c85/WsD0tOJ7J
	2p3PYNyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRqp1-00ByQZ-0W;
	Fri, 04 Aug 2023 09:10:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRqox-00ByQ3-34
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 09:10:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691140207; x=1722676207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OU7g0r3M/XB9LzgVs7uLjBcYUCr80nlIE17NRVSfSeI=;
  b=NLiUML3tVpFmH5CrATbvGByH9lM1ZoGUMq1G3uopGd3bqFdnHX+lxkFn
   YGc/xRazVu6wKD961cqpqnKPaTcjKJMXJsP//py3R188alENAiP9B/Y9a
   QG+XIEaTJ223tbqpaVbWpMXfVPqEohSkY7JTzFZPhMMzhr5ahJhnO+mdF
   gdSfQexizj7tgjy42Lk4fjJViVDMoWqGI3qBpTdz6zXKySwmMaJMC7nDv
   2mYM77er8oR8K25+WOrl+5W0fhZ49CPnNISVbjpddrTd14PF3p3u2fs4q
   qbMNfv8VWVAxSrSffSYbYxxq7V41OFWI4bCjkMSCElGawFaxoOPtBHajx
   w==;
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="asc'?scan'208";a="239780977"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Aug 2023 02:10:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 4 Aug 2023 02:10:06 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 4 Aug 2023 02:10:03 -0700
Date: Fri, 4 Aug 2023 10:09:27 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Nylon Chen <nylon.chen@sifive.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <geert+renesas@glider.be>, <pavel@ucw.cz>,
	<vincent.chen@sifive.com>, <emil.renner.berthing@canonical.com>,
	<aou@eecs.berkeley.edu>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
	<conor@kernel.org>, <zong.li@sifive.com>
Subject: Re: [PATCH v4 0/1] Change PWM-controlled LED pin active mode and
 algorithm
Message-ID: <20230804-jaundice-outpost-b8fbc9044e0d@wendy>
References: <20230803085734.340-1-nylon.chen@sifive.com>
 <20230803-vehicular-leggings-2830239f818a@wendy>
 <20230803-caretaker-voicing-e982f2334067@wendy>
 <CAHh=Yk9A3MP4Zgz53+s_ugvMtnv57igY=+Yccbp9Om9jBuxXqg@mail.gmail.com>
 <CAHh=Yk842gFpR1a3=KiB-Yb7T1Dqbg627MBK+hntjgMtd5z6-w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHh=Yk842gFpR1a3=KiB-Yb7T1Dqbg627MBK+hntjgMtd5z6-w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_021007_995532_A0CDFD18 
X-CRM114-Status: GOOD (  18.62  )
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
Content-Type: multipart/mixed; boundary="===============6808256540573892337=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6808256540573892337==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="drXNa9U6BVDiMxxh"
Content-Disposition: inline

--drXNa9U6BVDiMxxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 04, 2023 at 02:54:33PM +0800, Nylon Chen wrote:
> Hi Conor,
>=20
> Thank you for patiently giving me advice. I appreciate your help.
>=20
> Not long ago, I said, "This patch needs to be accompanied by
> modifications to the pwm_sifive_apply() function to make sense."
>=20
> I recently reviewed the v3 version, and after discussing it with Emil,
> there are several areas that require modification. I will provide the
> necessary changes for each of them:
>=20
> 1. polarity check. (Suggestion from Uwe)
> - if (state->polarity !=3D PWM_POLARITY_INVERSED)
> + if (state->polarity !=3D PWM_POLARITY_NORMAL)
> 2. avoid using old periodperiod, not state->period
> - period =3D max(state->period, ddata->approx_period);
> - frac =3D DIV64_U64_ROUND_CLOSEST(num, state->period);
> + frac =3D DIV64_U64_ROUND_CLOSEST(num, period);
> 3. add a conditional check can be added in the code to set
> ddata->approx_period to state->period when state->period is smaller
> than ddata->approx_period
>   if (state->period !=3D ddata->approx_period) {
>   ...
> +       if (state->period < ddata->approx_period) {
> +               ddata->approx_period =3D state->period;
> +       }
> -       ddata->approx_period =3D state->period;
> +       period =3D ddata->approx_period;
>=20

> I will use 'unmatched' on my end to verify again. If there are any
> other errors, feel free to point them out. Thank you.

I'm not sure of the driver details without going and looking into the
code itself, but this sounds like it makes a lot more sense than just
flipping the polarity in the dts. Thanks for taking another look!


--drXNa9U6BVDiMxxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMzARwAKCRB4tDGHoIJi
0qDdAQCi6vcuaP29QFEGbJjRy3gSuS59BLhmOBTY1CNGgezTMQEA56t+2koBs6Of
s0vx0OPO9U9ugfjxAQT1KVCC/BlxBQw=
=fu/T
-----END PGP SIGNATURE-----

--drXNa9U6BVDiMxxh--


--===============6808256540573892337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6808256540573892337==--

