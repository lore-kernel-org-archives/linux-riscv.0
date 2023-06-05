Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B2CC77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 10:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U84DXfva70Dhr9+kxRPUqJkqDCeVOHwpCcqse5FZOPM=; b=T7nNN9jbCpJ8dY+RLaN/tWH+Kd
	QWhjAMMrU2Wp0Zl4gW6mYiRwvlycB5JNyZo63gizBLVa2PRzcy+3dx5pb1zyT9I7J9hb+8I+610Bt
	vBkat32U2DMV5dKjEfbMjUwE4pRTPpq5ThxETHz3C1A0VEH0snDNWPU5lKL5B0NYRK9N1VbSW74OP
	XPnucaWBlHT7vwVxdXWuN7XdF9in8ygm/7ZDN6gWronG1vi5R6BczwzZdGyBEj6g4RywI1IHtr5V6
	gJHhLsIUnA2WLVzqWpACZW3URaNrRmq1YbmbjpLtC8xHd1jtCvsA3SDWDgVbgZxZf7SY4S65fpiLU
	w1Iz5Q3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q67vW-00F9zF-2a;
	Mon, 05 Jun 2023 10:59:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q67vT-00F9wC-2O
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 10:59:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0820B6156F;
	Mon,  5 Jun 2023 10:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC6ECC433D2;
	Mon,  5 Jun 2023 10:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685962742;
	bh=/3rPkZp3G1q/+mjzIUib+Reuac1X1iM8z3BUwaVACOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bACOM4T6bynYlwQjyKJfA7DrAAGoqodaVx0JjEulxIC4fTppuGQDDHpP2qxxFgkYE
	 UcrTKd+WdOJW9HP0U9IYArIfEVsNa5JGrPoqw3vQemFx59ZQSeqqU6JY0YBOQD38UX
	 heFNreryzj/+BFcYyDLh+3RN5mv2TXUefJNpO6A2fIAHjFmXvfW3mveoHBLTBHeKLy
	 3RL4FAnu3A8wIodctBG0shWCcUgbNws+NiJyB5fnWgwaaZO+zaZWLkEnviiIS78Hsz
	 vj87ZwJyZvob3NcwdUdcTmfBTpRhxhfOfhaEixJVu6IEfiNveNT3K9TCc6P9eBmM7W
	 5w3nfs4YqDaKA==
Date: Mon, 5 Jun 2023 11:58:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: alexghiti <alexghiti@rivosinc.com>, robh <robh@kernel.org>,
	ajones <ajones@ventanamicro.com>, anup <anup@brainfault.org>,
	palmer <palmer@rivosinc.com>,
	"jeeheng.sia" <jeeheng.sia@starfivetech.com>,
	"leyfoon.tan" <leyfoon.tan@starfivetech.com>,
	"mason.huo" <mason.huo@starfivetech.com>,
	"paul.walmsley" <paul.walmsley@sifive.com>,
	"conor.dooley" <conor.dooley@microchip.com>,
	guoren <guoren@kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Bug report: kernel paniced while booting
Message-ID: <20230605-catnip-gallery-c20cc203b186@spud>
References: <tencent_7C3B580B47C1B17C16488EC1@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_7C3B580B47C1B17C16488EC1@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_035903_822753_15BB6413 
X-CRM114-Status: GOOD (  12.83  )
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
Content-Type: multipart/mixed; boundary="===============7832057190154501654=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7832057190154501654==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yPgjLI/9lNvHen1P"
Content-Disposition: inline


--yPgjLI/9lNvHen1P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 05, 2023 at 10:52:14AM +0000, Song Shuai wrote:

> This report is not identical to my prior report -- "kernel paniced when s=
ystem hibernates" [1], but both of them=20
> are closely related with the commit (3335068f8721 "riscv: Use PUD/P4D/PGD=
 pages for the linear mapping").
>=20
> With this commit, hibernation is trapped with "access fault" while access=
ing the PMP-protected regions (mmode_resv0@80000000)=20
> from OpenSbi (BTW, hibernation is marked as nonportable by Conor[2]).

Just to be clear, you enabled NONPORTABLE & hibernation, and then
hibernating panicked for you on a system that uses standard OpenSBI?
This is the existing, known, issue and not something you are trying to
report as a new problem here, right?
(Sorry, I am a bit slow today)

Cheers,
Conor.

> In this report, efi_init handoffs the memory mapping from Boot Services t=
o memblock where reserves mmode_resv0@80000000,=20
> so there is no "access fault" but "page fault".
>=20
> And reverting commit 3335068f8721 indeed fixed this panic.

--yPgjLI/9lNvHen1P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZH2/8QAKCRB4tDGHoIJi
0vDbAQD1SNCYKfmAuNUKkbuOXpKZPH7MLowsCtzhmC+1cmbjcwEAqiIJ7LGGwTxa
G0Okg74x/RSarXC1mk7lvGDZjWQeDAw=
=Ypye
-----END PGP SIGNATURE-----

--yPgjLI/9lNvHen1P--


--===============7832057190154501654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7832057190154501654==--

