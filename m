Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A918DC00528
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 07:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RwmuECxlV7CMOUBWi/bJIP1k+6M3G9UDwBoZYNDzq4=; b=YjVLwxGh0/SdpAUKtdUZnCnC/P
	gAVxILcGbHW1lnAX/dBM9ZAMrvnVg+esWwGV9Fd06sXmCx5PIgcFjyCQIR/fFMndtTtINAKQsoPP6
	VhV3aTO8RIe08rXMpL98qX0ZEOvGbg8BTvA04x7KkTXQ1bCUqv2bTn64A/axWeTL3kXqyjT2ClFHp
	87kMJ5mmX4rrqDKRctOAzrBU7NtCnkS9m+ZPxxlOM1CU8r8pRJlS2TapyHPSz/KDbOsJXSI2tMz55
	RLuvaTCLp6PxABEDaMPWc+tre+P6teMZmGxgW5PfzilV1yGluxcg3MSyIz7BWWIj/3ELqbwCr5FJv
	3JZuPSxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCDZ-006XhX-3B;
	Tue, 25 Jul 2023 07:12:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCDX-006Xgb-14;
	Tue, 25 Jul 2023 07:12:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690269143; x=1721805143;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bFFMQtUbkfGkBIZKnBOwBMrcXWpHq+8AmjNjOfszGlU=;
  b=amPQEwoko/P2rGcZTudbvct8i9skAhrrWBx7RQCgGzkrx0z+yVQxtqK7
   cjnYKTHXk4yKH6iAIr4Z1O9VoC1X2EH/Hp3o38EUQvEevgwzfL+y0BRrS
   cMuy+l9rO6OrWg88lxFpfuwR3rDPUgu0F1oCuzFa28CFW3pbXoe398kkU
   UZV+41o2P5pELgJuzh9Cq3vg8CCBBqDuK8KE6C5d6TbkRnTLzYoadoorU
   XtZAzy/xE765VaAh0vrSl/0Kx6cK9EJrF3WN+0gqpuo5K3nHKOMBIsIla
   uPrSuJBkdRCi8Yvq8pyHaKHHLUs67O7C1u4D3+LSLlEF+YxxWgSh48514
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="asc'?scan'208";a="225784961"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Jul 2023 00:12:20 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 25 Jul 2023 00:12:19 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 25 Jul 2023 00:12:17 -0700
Date: Tue, 25 Jul 2023 08:11:43 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>, Kees Cook
	<keescook@chromium.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-efi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v6 2/5] riscv: Dump out kernel offset information on panic
Message-ID: <20230725-clunky-violet-22e909b65bcf@wendy>
References: <20230722123850.634544-1-alexghiti@rivosinc.com>
 <20230722123850.634544-3-alexghiti@rivosinc.com>
 <20230724-fineness-sectional-8cdd1e4bbff2@wendy>
 <CAHVXubhVOpdZhmENkNbavAYGVZB47K9Q_4GN6RZ+rCex4uBb5g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHVXubhVOpdZhmENkNbavAYGVZB47K9Q_4GN6RZ+rCex4uBb5g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_001223_471258_A855BCEB 
X-CRM114-Status: GOOD (  15.66  )
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
Content-Type: multipart/mixed; boundary="===============8008219667614223230=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8008219667614223230==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ug5/aA5lWs5nDlds"
Content-Disposition: inline

--Ug5/aA5lWs5nDlds
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2023 at 09:05:37AM +0200, Alexandre Ghiti wrote:
> Hi Conor,
>=20
> On Mon, Jul 24, 2023 at 4:20=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> >
> > Hey Alex,
> >
> > On Sat, Jul 22, 2023 at 02:38:47PM +0200, Alexandre Ghiti wrote:
> > > Dump out the KASLR virtual kernel offset when panic to help debug ker=
nel.
> > >
> > > Signed-off-by: Zong Li <zong.li@sifive.com>
> >
> > Either you're missing a Co-developed-by: or the author of this patch is
> > incorrect.
>=20
> Ok, I thought it would work this way, Zong first did something similar
> a few years ago, so we need his name here. @Palmer Dabbelt if no other
> changes are needed, do you mind replacing the SoB with a
> Co-developed-by?

You can't have a Co-developed-by without a SoB, so both are needed :)

--Ug5/aA5lWs5nDlds
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL91qwAKCRB4tDGHoIJi
0o+rAP9z5FelZ0n3DrX8+EzVEZ5gNidCyctFi0OT1UBXZsWkmwD8CrSIlVke8g3W
Rgkqo3TvjNCB/0xyKodEtvQW+nlNbQo=
=VCzr
-----END PGP SIGNATURE-----

--Ug5/aA5lWs5nDlds--


--===============8008219667614223230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8008219667614223230==--

