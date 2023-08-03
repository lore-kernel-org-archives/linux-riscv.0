Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C934AC00528
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 09:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQyhuQDqUsaVb7TYmJ1LGLPy6LvvBGRnbkylDoMGZi0=; b=nVmX6A4LcT2bSVKE9SsuHtokST
	zsyZIVtkpCr11cHw0R5e5fKN1eGeS3VIPlUZqIC+CM9WFa0XS0tva3yezkzgebhD/3Zix5INxfjJF
	Rfe1W8kUEsC6qHlsQ881Zq/XFAwfuRXY8MxUfYUe1wNSTUkurCletoPO3CMwLfOyqbz4IVC98kVMt
	/1R6S4gpN3PDteXJrXZ6z9DpTDGYG8db2TbMjBZRpADLuih6HdG5ZSwv+8gzeJWCwMIy0g6bK1PFC
	RlDhj4YsT6m/b405djbvz0ZBM0c4AVsQih9dtUy6ooIebE8XxZGaZjGpQHGedao7CBBZrXawffC7o
	BXQuVyuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUsm-007FBU-32;
	Thu, 03 Aug 2023 09:44:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUsk-007FAp-0I
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 09:44:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691055874; x=1722591874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PM/FfZ0vfzEPppWtxflf4gMuWXsZGV2oeDBfvYpCndY=;
  b=oMK7QgHW09/398Jq2CPr89NiSg4E8vYTVCrzaZIgjniJeMisPdoEsKMs
   9Lz80oryOUjaC0VtzrO/fmRsuCFat6x4TujqtTV8SHgCn6z1q/aV5UEhP
   zv1Syr5L5TatwJZliHl+qN/l3WpZeQuZPSBcfrVeiTlT4qM7DZ4TtpuIK
   iz6KfG9LKeifGqx9cwdjT/775InIdg42LgAMgbMu2jNq1HCPaMS/hiZH/
   Cuveq4bZGtAjxBKreMTb9gJ+Jv5un/kzFxin1AWaruzQ+nvijo9+VZLM8
   Ais5iTE0MLlJluevPSwgO5o1xqGFic0vpLvp3wIX3MNTNMNew4B1NFHml
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="asc'?scan'208";a="227978460"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Aug 2023 02:44:30 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 3 Aug 2023 02:44:05 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 3 Aug 2023 02:44:03 -0700
Date: Thu, 3 Aug 2023 10:43:26 +0100
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
Message-ID: <20230803-caretaker-voicing-e982f2334067@wendy>
References: <20230803085734.340-1-nylon.chen@sifive.com>
 <20230803-vehicular-leggings-2830239f818a@wendy>
MIME-Version: 1.0
In-Reply-To: <20230803-vehicular-leggings-2830239f818a@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_024434_192490_27B8564D 
X-CRM114-Status: GOOD (  22.64  )
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
Content-Type: multipart/mixed; boundary="===============1457401270180200897=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1457401270180200897==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tzX8viRnXMQ13hWc"
Content-Disposition: inline

--tzX8viRnXMQ13hWc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Nylon,

(I yoinked the reply to 1/1 to here, as it makes more sense in this
context)

> On Thu, Aug 03, 2023 at 10:15:10AM +0100, Conor Dooley wrote:
> > On Thu, Aug 03, 2023 at 04:57:33PM +0800, Nylon Chen wrote:
> > > According to the circuit diagram of User LEDs - RGB described in them=
anual hifive-unleashed-a00.pdf[0] and hifive-unmatched-schematics-v3.pdf[1].
> > >=20
> > > The behavior of PWM is acitve-high.
> > >=20
> > > Removed patches: 1
> > > New patches: (none)
> > >=20
> > > Links:
> > > - [0]:  https://sifive.cdn.prismic.io/sifive/c52a8e32-05ce-4aaf-95c8-=
7bf8453f8698_hifive-unleashed-a00-schematics-1.pdf
> > > - [1]:  https://sifive.cdn.prismic.io/sifive/6a06d6c0-6e66-49b5-8e9e-=
e68ce76f4192_hifive-unmatched-schematics-v3.pdf
> > > - [2]:  https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-=
86ed8b16acba_fu740-c000-manual-v1p6.pdf
> > >=20
> > > Changed in v4:
> > >  - Remove previous updates to the PWM algorithm.
> >=20
> > Why? I don't recall the conclusion on the previous version being that
> > that patch was not needed.
>
> I apologize for forgetting about this update earlier. Just now,
> I tried to pull rebase master and noticed that other developers seem
> to have made some fixes to the algorithm. Upon closer inspection, I
> found that they addressed the part we previously discussed with Emil
> and Uwe, such as "first pwm_apply_state."
>=20
> Therefore, my instinct tells me that they have already taken care of
> the issues we discussed before.

I didn't see anything in linux-next that would solve this problem of
inversion. The last meaningful change is:
	commit 334c7b13d38321e47d1a51dba0bef9f4c403ec75
	Author:     Emil Renner Berthing <emil.renner.berthing@canonical.com>
	AuthorDate: Wed Nov 9 12:37:24 2022 +0100
	Commit:     Thierry Reding <thierry.reding@gmail.com>
	CommitDate: Mon Jan 30 16:42:45 2023 +0100
=09
	    pwm: sifive: Always let the first pwm_apply_state succeed

which predates your v3 by quite a bit.

> I will review the conflicting parts in the pwm-sifive.c code in my v4
> version once again to ensure there are no omissions. If I find any, I
> will submit v5 accordingly.

And if this patch is okay in isolation, please reply here explaining
which commit fixed the algorithm, so that I can pick it up.

Thanks,
Conor.

--tzX8viRnXMQ13hWc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMt2vgAKCRB4tDGHoIJi
0o+tAP9T2YoYk//o5k7MVQwS/3aSXKAO4fwzn4VO7kYKb3jOPgD+KA7Bv5tRvwou
PaimuCQYfr42wST7wH8mSiR9MZA7zQ4=
=Sx/n
-----END PGP SIGNATURE-----

--tzX8viRnXMQ13hWc--


--===============1457401270180200897==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1457401270180200897==--

