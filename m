Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8936C10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 10:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qdli41vOkSVxC05KWb3xqgSObnHsJx/rQNEEAUbeK84=; b=FmkaKh79fWnpsQGTnqcEi8AB5P
	c4jh11GDesp6npeQXinJ6CHzPErk0cktWUOeCBi9eAZIY5xcpV4fUl1GbFaDDBAH3XSfHKHBtN//b
	p9eoLwWSbaGjuPOV1JAdWbCD8njlwwO0r2NrlQ0BysR8fuz9f03FvQ3MeNaV7MvWek8IA8mZpB8tB
	pZPfCZuxfYUz41q5wQsTZY+ByQI0/3tm9lyVy//6X3rwLhI+mWE30Iqz9TIuxyak1LWYDGvV6taaG
	CJLSoO4XuOI0lDBFlVUuyqA1KXVjzv7dOHaQFtkJ0/9eTsdtYTNeIzZe2pVr2awV2xCw7eS8URFsL
	E+pve+ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Hxs-0000000AVoL-2YJR;
	Tue, 07 May 2024 10:22:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Hxp-0000000AVnc-3HfH
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 10:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1715077345; x=1746613345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/ylm28bgQwjCsaq+PkwbOcOTeoJ2+0gYNXlHCfijRyE=;
  b=fEr0uvNgVCxGm2OdPh2TLLIOCmqJ/AadKbQ3WSPbyJ2iA8oCzbs5ShpW
   +8NSFjTjqOMmfZnQS+a6zjI+VDOZg76qnNaA6UcCUwdxoh9ks6B9w159O
   WdnfZBaCyjMkqZH+2ipsN0KOZXI9xdv+R5c9VzJvu0oJzd4ieXm1dz1Tq
   uDjZrjqR2zebbTRtMagPoXWCalu3dqGnF1+rR7pSE09wwjteWuxOX3ofr
   6qttq1NQqHvRIETkr8mB6Iuuc5KgfHrgLa7G3H4a8Obeyx13+mEysqYQs
   a3Fx1u7vMOcr3N6GDpTHeqdIp4hYYkHIkPj9X5Ix7r/PoYbSnziXuSfI0
   w==;
X-CSE-ConnectionGUID: Vms0K4hKTRCVKW0S9ZejhQ==
X-CSE-MsgGUID: e0l32h4fRqap+iJ+yGpwow==
X-IronPort-AV: E=Sophos;i="6.07,261,1708412400"; 
   d="asc'?scan'208";a="191279130"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 May 2024 03:22:22 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 03:21:51 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 7 May 2024 03:21:50 -0700
Date: Tue, 7 May 2024 11:21:41 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Arnd Bergmann <arnd@arndb.de>
CC: Conor Dooley <conor@kernel.org>, <soc@kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [GIT PULL] RISC-V Devicetrees for v6.10
Message-ID: <20240507-concrete-come-2899fab0888e@wendy>
References: <20240503-swimmer-botany-7368a8a17b1a@spud>
 <5222e581-a189-4477-ba6a-edf4ce369eb0@app.fastmail.com>
 <20240507-hungrily-squash-2ac370e05fc0@wendy>
 <b618c311-8925-4717-b6bf-f3699b106189@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <b618c311-8925-4717-b6bf-f3699b106189@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_032225_905563_4D67F973 
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
Content-Type: multipart/mixed; boundary="===============3251736423099221498=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3251736423099221498==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XB/fNXaRpUVZDCGL"
Content-Disposition: inline

--XB/fNXaRpUVZDCGL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2024 at 12:08:13PM +0200, Arnd Bergmann wrote:
> On Tue, May 7, 2024, at 11:58, Conor Dooley wrote:
> > On Tue, May 07, 2024 at 11:27:36AM +0200, Arnd Bergmann wrote:
> >> On Fri, May 3, 2024, at 17:24, Conor Dooley wrote:

> >> If you are able to extract the DT bits that don't depend
> >> on other branches (jh7xxx, microchip, bindings and
> >> new files) and resend those, I could still add them to the
> >> same dt-late branch.
> >
> > The jh7xxx stuff does actually depend on another branch, although that
> > branch is fixes. Do you want that removed too? If you do, I'd say to
> > just drop the whole PR.
>=20
> As I wrote below, it's fine to have a branch based on a
> fixes branch, so please keep that part.

Cool, just wasn't sure if you were intentionally contradicting yourself
or if the "below" part had just been some general remarks. I'll try to
get a "revised" PR sent tomorrow.

Cheers,
Conor.

--XB/fNXaRpUVZDCGL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjoAtQAKCRB4tDGHoIJi
0i7+AQDAE0G9BqtJOa773r+ubjod/SR22z4KPR/43eTZxk8+PQD9G166SffJh2y4
hASKKKljSskRAWBSYLfrb4/V2wMq5g4=
=pLeS
-----END PGP SIGNATURE-----

--XB/fNXaRpUVZDCGL--


--===============3251736423099221498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3251736423099221498==--

