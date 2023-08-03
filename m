Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317C6C04A6A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 10:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jpwxV44JM9VB/cml2n8pbRTrTMTNgEAOsPaV2ltA+yE=; b=fdErinZ6BukOkxl6KR4lln0aiG
	QNmtgp5sN/7t8suRCSqQ5ZEzszsAhX65ubgj9INHQ8RSdSenPauUvrGF5owIJ7kq8DNI21ON3+4ir
	8Fz70AnDvKCS0BY43HpIenIMhxBKtDlarr6LwyjppY9yHadimIpFhcVDvHur7QNWcoMX9ceRKyRjc
	NyY6ZVyjIUmJsgQIukMRFRg/s4OJBzV20D4FKu+8ljKW5UR/xak3+PUAthuJBUoVH5LWkwcInXgqn
	qJoLcPUtYJkO8vmc/yv4HX67y/raYklc0gIm4DKFe3RdODrE/zwDo62BzfofNGrzYkpTNQvFmOxSN
	cVQqC/GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRVbZ-007Mtj-18;
	Thu, 03 Aug 2023 10:30:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRURW-0079hb-1G
	for linux-riscv@bombadil.infradead.org;
	Thu, 03 Aug 2023 09:16:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PT2llYmhvICyeTcPbZHNVpvRyYUsJUvNxHW61kr/i98=; b=dXZ9fnker/DBaFQRWA4k8gFZCO
	idtO+bpwpEQfIPv2CVozEB9OocpeTHcTHfd/NTuTIUq4JUQroty6pz5MTnzSlE9PFwN/fmpBCrUJE
	RUc80wIEKAVCWFO2HhaX16/Am5ZmCnoutahudGw/93mACvkLa7z+kg0HzJBNkWmmk9y+Tsi1ZuqVK
	USs3NMahR27WGU7TlZFGfoLRHlgrnybe/ws+GyIesWUAcmad1/sr/Cd0aWcXrk6pZhBPSyj+Fd2/m
	5/fXrOGrXxEhfhPwd0VCFRrmn8UB8BNDzW6WsRmgmwjduGaxz+8F1jsTPipPrisZgUxeI1erZQGN9
	g8g+wK4A==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRURS-00Gi7p-2E
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 09:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691054182; x=1722590182;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=04nS9RFoJGf7hQ29BgtmNNaD7za5rZOA7S2jxdjGYCQ=;
  b=XfH9UlsExipvpTGJOcqxTp+kCliwG44yInYrjZ+Jf3MJsvm2OC/Kwjlr
   l0nDZGzJR4CdvNYmd/jZi1bywARQ30f2UD4coed7/She8vO11MiASfiCO
   /ezqdvFZVQ0xynfFc83Otu7nVgQtzEnF7c65NH8D1DOAgWqODLhCxAOdj
   X7mSruSdgD14RAB9g4jOzJtFLsq9ecqu8vQZ66mhIt4G9uIDzS1CiSd+g
   +OEBrQrANlcArjst84kGxMEgtYV4AWU+tNw5NaEGYtPhGGd+KoAvCDLM7
   WAM2vSweGQ9Q1t6tssQ2L2BHTLjENU9TlYqbYFcyht79wQ3zqPEylsqE/
   A==;
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="asc'?scan'208";a="164641497"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Aug 2023 02:16:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 3 Aug 2023 02:15:49 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 3 Aug 2023 02:15:46 -0700
Date: Thu, 3 Aug 2023 10:15:10 +0100
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
Message-ID: <20230803-vehicular-leggings-2830239f818a@wendy>
References: <20230803085734.340-1-nylon.chen@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230803085734.340-1-nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_101623_113667_19A872AF 
X-CRM114-Status: GOOD (  10.40  )
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
Content-Type: multipart/mixed; boundary="===============4025739550115126711=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4025739550115126711==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PB2u+tDiCA4uxtSW"
Content-Disposition: inline

--PB2u+tDiCA4uxtSW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2023 at 04:57:33PM +0800, Nylon Chen wrote:
> According to the circuit diagram of User LEDs - RGB described in themanua=
l hifive-unleashed-a00.pdf[0] and hifive-unmatched-schematics-v3.pdf[1].
>=20
> The behavior of PWM is acitve-high.
>=20
> Removed patches: 1
> New patches: (none)
>=20
> Links:
> - [0]:  https://sifive.cdn.prismic.io/sifive/c52a8e32-05ce-4aaf-95c8-7bf8=
453f8698_hifive-unleashed-a00-schematics-1.pdf
> - [1]:  https://sifive.cdn.prismic.io/sifive/6a06d6c0-6e66-49b5-8e9e-e68c=
e76f4192_hifive-unmatched-schematics-v3.pdf
> - [2]:  https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed=
8b16acba_fu740-c000-manual-v1p6.pdf
>=20
> Changed in v4:
>  - Remove previous updates to the PWM algorithm.

Why? I don't recall the conclusion on the previous version being that
that patch was not needed.

--PB2u+tDiCA4uxtSW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMtwHgAKCRB4tDGHoIJi
0oMBAP9459PoL9HrrQEWgQ+bIJZFoDTz4oSo2vP5a5WyJGiJPAEAlkh6h9+6u46j
Vp1m1aPtTRxrkslLMJnwvuWrvxWbqAA=
=791u
-----END PGP SIGNATURE-----

--PB2u+tDiCA4uxtSW--


--===============4025739550115126711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4025739550115126711==--

