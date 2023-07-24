Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E6BC0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 10:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtUolmcQOVSoNGR8ZltqMhw7sHbensoPQRANcJLFZhs=; b=WMMIMsUH0AybFSXyeeIVYIZHrF
	iGwUqDEebAWjoaP/3i5uGVJiXg88JMwfwp+pjfDfMjZExIflDuUeFVx9p1wGM7Wuyr9EldITZ3FNl
	q2wJ1QYIG8hLkmvD/6lYyn8P7n+1rJhb2dHESwHlgFr+K5dx3vg/aE9qVNiz2xdXFzacKm+JvBEq5
	caKaYcW2Gp+Gq9UMSTlgh58txKI3MHvh3ZRYYAXfLqCBxL5twuj/jujJ5IKtwZ0jw7NRQD+G2Am0L
	Bn3XvKlB6Jt5FB8Md5SB+5tLgOLZ6L4qYXO47GVD4lRLyKKz7CYCsWO+Y+jisf0f9yUw/THaZF4iV
	z1UOHsvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNtAv-003tpb-0V;
	Mon, 24 Jul 2023 10:52:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNtAr-003toG-2G
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 10:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690195941; x=1721731941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W2T7XfrxSKxkkzj5cdNxCZDqTngcyH1p/2bDE4/+ios=;
  b=t6IrgUMi779pGX0mFUZVBfF/Gn1dOp0tieqOyQw0/C9nLAQXM9K9nQzB
   /q4tpdlYDKNoeCnadMGY++u3Ei1BgbIBwGFtzVDPzkv5EWymR0G88Jg+Y
   xm8EqZ1joY+XmP6pJ0x0dmjnahTdq2pmTk0J7q3K95Jdtzn/xBiqs7aE0
   iP2Aya73qCNsooHuroyGd3VqTzblVxUpKyhfoFSMRvuSlS4m7caopgwHI
   lpSjN/zhIIRMVf5TIguR/j7Mq1SuXaZcQwbZh4/a6iMJO+0r+2kNEkpGm
   o8egSvaN46wQPsTeC6EhPihDcVmZz9FZIkl2Qu3196XMbqZkPNBSsTA7q
   g==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="asc'?scan'208";a="162849694"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Jul 2023 03:52:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 24 Jul 2023 03:51:45 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 24 Jul 2023 03:51:43 -0700
Date: Mon, 24 Jul 2023 11:51:09 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>
CC: <linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<vineetg@rivosinc.com>, <bjorn@kernel.org>, <greentime.hu@sifive.com>,
	<paul.walmsley@sifive.com>, <guoren@linux.alibaba.com>,
	<anup@brainfault.org>, <atishp@atishpatra.org>, <heiko.stuebner@vrull.eu>,
	Han-Kuan Chen <hankuan.chen@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [v2, 3/5] riscv: Add vector extension XOR implementation
Message-ID: <20230724-enticing-runner-00800bd563f7@wendy>
References: <20230721112855.1006-1-andy.chiu@sifive.com>
 <20230721112855.1006-4-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230721112855.1006-4-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_035221_811489_D942FBBD 
X-CRM114-Status: GOOD (  10.09  )
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
Content-Type: multipart/mixed; boundary="===============7205346011099754397=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7205346011099754397==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XXYZfx1PDBz+BC4a"
Content-Disposition: inline

--XXYZfx1PDBz+BC4a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 21, 2023 at 11:28:53AM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>=20
> This patch adds support for vector optimized XOR and it is tested in
> qemu.
>=20
> Co-developed-by: Han-Kuan Chen <hankuan.chen@sifive.com>
> Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

Other than the inherited build failure from 2/5, this seems okay to me.
I have no opinion on the asm bits, so
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--XXYZfx1PDBz+BC4a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL5XnQAKCRB4tDGHoIJi
0rwJAPwMKpDIAtTJEhI4hrmoz4N4uK3B06vr3tIHvSb7Vwk4rgD/WeCps1dpcT41
Fmnc/0UnbN2PFQmjS/ISB3YyORJyUQI=
=ea3+
-----END PGP SIGNATURE-----

--XXYZfx1PDBz+BC4a--


--===============7205346011099754397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7205346011099754397==--

