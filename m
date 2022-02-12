Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AEBC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Feb 2022 11:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUip0XAo4R/RCtMHfTQpvfCr3ToyQ6rXyz6ILnUWwS4=; b=j+50Wn7atgx6cUSPQk86iMcXg/
	UwWoXnJCIICsm/Wa0T7QiNOsEcufvots363zw1ZBj1trENWZ0Lbuv2GuN/HmH95aLcGRa4Xfi8KYz
	bTHIQn1umZIN29fvsMTu+3ySvRE7DufBLneyhOSbFBeFmSZapE4LDmADONvNFTd5YwKoOwKb1g2dV
	n/k0xXzB4td5IP5YF5oZp+UCCNl++BbZIoKSqyY3EFb7F7p47qyOS7BVyY0wBTTZ9lAQw3ng1rGm4
	1lCO8rOLb7WQECo2J0+77ZMOjYfGyBR/4ChLItQpBA1RM/BQuIaKBDZ/okqsRLHhomsPEnDFWUaOn
	UbcTjQgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIqp3-009p6j-3c; Sat, 12 Feb 2022 11:44:13 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIqoq-009p43-VS; Sat, 12 Feb 2022 11:44:02 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 119231C0B7A; Sat, 12 Feb 2022 12:43:56 +0100 (CET)
Date: Sat, 12 Feb 2022 12:43:55 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Rob Herring <robh+dt@kernel.org>,
 Sandeep Tripathy <milun.tripathy@gmail.com>,
 Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Liush <liush@allwinnertech.com>, Anup Patel <anup@brainfault.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvm-riscv@lists.infradead.org,
 Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v11 1/8] RISC-V: Enable CPU_IDLE drivers
Message-ID: <20220212114355.GF20866@duo.ucw.cz>
References: <20220210054947.170134-1-apatel@ventanamicro.com>
 <20220210054947.170134-2-apatel@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20220210054947.170134-2-apatel@ventanamicro.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220212_034401_190843_C0963B80 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============3047689953533851645=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3047689953533851645==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xkXJwpr35CY/Lc3I"
Content-Disposition: inline


--xkXJwpr35CY/Lc3I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Anup Patel <anup.patel@wdc.com>
>=20
> We force select CPU_PM and provide asm/cpuidle.h so that we can
> use CPU IDLE drivers for Linux RISC-V kernel.
>=20
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <apatel@vetanamicro.com>

This is quite... interesting. Normally we have one signoff per
person...

Best regards,
							Pavel
--=20
http://www.livejournal.com/~pavelmachek

--xkXJwpr35CY/Lc3I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYgedewAKCRAw5/Bqldv6
8vflAJsExysBvOdiG/3HcSePeKRPJdXguwCglsuWNamkMdXA65hOK7oMLl5SIDM=
=5z62
-----END PGP SIGNATURE-----

--xkXJwpr35CY/Lc3I--


--===============3047689953533851645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3047689953533851645==--

