Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD79CDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 08:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fCKCuU0pxpuDzdQbUR6/YYLk5l1p/qjpNToC4yEXWmg=; b=sbgp14frsGzaflc8VcsiRcGVaa
	Tf5TnYmFyXCDZDNCdvyRgo58YsuIjQ2AJk/P8d6L3IbrxUobITUl1aoFL83UnJQYwdpBhJ7ps/5QG
	6RCFqeI0ZUlKxw2AtrLj+0nLxxwWC1rEubNPj1rv7RSjGiy7cWBOCA1F1ELC+03iXdAp0IqpvuWr5
	HhKmF8fD16Z9tCJBSt7e9OB7Qns4HesCn+PSJrjMKyKUiqsGF0UX8DUFizGiMyIcirHC1HZDZOWJW
	Uc8DDj6vKJO1HkY28qxiI0KokS0aWRMGS3n1DulTu/DRVIk2LBCV8z8E7rHPQhyxwoKv5Ee/Ljmy4
	jVtsz/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsIgF-008nBL-0n;
	Mon, 16 Oct 2023 08:10:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsIgC-008nAq-0N
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 08:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1697443823; x=1728979823;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LxryxW2/hhg5ypvaW/Cj4cSwQFokyO6Tq8LSefAbk/k=;
  b=zSiE2ubmz50VeTVUkG7olfUwKo6miWWh7lQeYBCqPTqHOqy+k3ECrkAs
   rmns/+EkHF6MIRO9AVN2e5FeopQE7dMeZAqzZctl4DHUAlSLYb8xSyxd7
   q5KsQxGHJ8WJE9+dT2Z+QjAo0zBLQds4qFcLx2Z1E5VCihLTZo2ygMzec
   UyrSRyir4VfWTQfOdN5rfLzOq2rJK/lz3SYPizOETNS1Glzbzfp7AE6fq
   +/RI0z81NobFq6i81buKY1AaW5PA+7/W3a+eOKsGF43Hh4H8pCaumZ3Bj
   XE2fxYOoXwfS3X/46zyzVAgoUkcmipt1oUCwq+Gpjwxj6QbV2mPY+0p4j
   Q==;
X-CSE-ConnectionGUID: koRSwWUXT4OxCfE2jy4xWw==
X-CSE-MsgGUID: TT0ihY+ZRs62LenG9QLRYQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="asc'?scan'208";a="10028472"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2023 01:10:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 16 Oct 2023 01:09:31 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 16 Oct 2023 01:09:27 -0700
Date: Mon, 16 Oct 2023 09:09:06 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Daire McNamara <daire.mcnamara@microchip.com>,
	"Geert Uytterhoeven" <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, Jisheng
 Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Chen Wang <unicorn_wang@outlook.com>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-renesas-soc@vger.kernel.org>
Subject: Re: (subset) [PATCH v3 0/6] riscv,isa-extensions additions
Message-ID: <20231016-veto-fascism-117d9d750db4@wendy>
References: <20231009-approve-verbalize-ce9324858e76@wendy>
 <20231015-qualifier-campus-97bf09059d51@spud>
 <CAMuHMdUTiod7o9+DG70sNWr=GGFwBeCagj=OrRp0Dn_jPDbakw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUTiod7o9+DG70sNWr=GGFwBeCagj=OrRp0Dn_jPDbakw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_011024_236601_22D57DA5 
X-CRM114-Status: GOOD (  11.53  )
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
Content-Type: multipart/mixed; boundary="===============2881249752467595029=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2881249752467595029==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2aSpILo4o1Dz0BKi"
Content-Disposition: inline

--2aSpILo4o1Dz0BKi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2023 at 09:23:23AM +0200, Geert Uytterhoeven wrote:
> On Sun, Oct 15, 2023 at 2:22=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:

> > The first 3 applied to riscv-dt-for-next, I expect the rest to go via
> > their respective platform maintainers.
>=20
> I sent my last soc PR for v6.7 last Friday, as per the soc deadline.

I was going to send mine this afternoon :)

> Feel free to take "[PATCH v3 4/6] riscv: dts: renesas: convert isa
> detection to new properties" into your tree for v6, if that is still
> possible (I have just provided my Acked-by). Otherwise, I can queue
> it in renesas-devel for v6.8.

I was expecting them to end up in v6.8 since it's pretty late & I don't
really want to send a PR with stuff that hasn't been in linux-next.
Queuing it renesas-devel sounds good to me, thanks!

--2aSpILo4o1Dz0BKi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSzvnQAKCRB4tDGHoIJi
0opqAQCkGEm9sza01pNYywi64GPOXXffC76mu2+pYDNRMvk1TQD9F9k8KyYRCpaM
Dkz5LS8icM//L/crcLEMzZL4FaOsaw0=
=Wny0
-----END PGP SIGNATURE-----

--2aSpILo4o1Dz0BKi--


--===============2881249752467595029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2881249752467595029==--

