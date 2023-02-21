Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31310C61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 11:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DUqrHTzFU3Dly+U39LHx43dNMumNfG70x4JhqRhypdc=; b=nYMCy8AijNlZ0PwHBmcYGd0Q0e
	R5l/gHwYU0cXM5CCSp92qICXSf+y01CxoN6gjdAtT4CGa3w3q9JlaXsEpfk5h+ncOGRQQBgNuA0vO
	h39pNcfXPOWnoAuhPhuSd0V/VBtOLggtZwFujdfPlCBtepKXWr+iiqJ7hwQdgu/72XHXyrwPZBKSo
	p4zbS2u5iKTmIKA3QHoWsvyxqv3u4q36JbCeqAy/gdEaQCWr43nK3P61iDlscCuazJrh6tPZeUkI9
	yPnZCoiMK7QBi9H6QQN28/EJbg8YS4Tvqr1ntuEFsEFWKfY6BreJMI2JlAqPJ2J8A9/CZNYDeVvAK
	lZZ/qXEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUQNU-007UE9-Ra; Tue, 21 Feb 2023 11:00:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUQNR-007UD1-Hk; Tue, 21 Feb 2023 11:00:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676977205; x=1708513205;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fVoyeszrnawguFMAcNS7/Ulx+Q4Q5phuGRkAbIy7V+I=;
  b=lwBO2HWtvTZ6yWT1AG6tHs5d+qMbF4lgvpTGO5V6ITS+lGOEqivEKWZA
   Gx/N23gzoBPjH3WZkKSslJniwWAt8pVoZ1v7rZHyEJnYCELsP8WxLigFy
   J0sFVI/My6aGNaQm4Z5IRfCjdu53MgV7yilYEQ7uM4sJWwry6L4vAgEQX
   +K7/hg204zR/xwmnHhF/lV01oXLZ3XEDNDs1i/GiOS5aR3/ZU00NACT1R
   KgOO3wR5H0NtLqYT5ePKosQsJm6DTxI8R7l5RFB9hUsbNeCb9bSpYYYw8
   BTte+OO2YjG8WRUbawYx4385IplQaZElsB8B4PrylvxPlqS10FQxidolC
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,315,1669100400"; 
   d="asc'?scan'208";a="197966108"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Feb 2023 03:59:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 21 Feb 2023 03:59:57 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 21 Feb 2023 03:59:55 -0700
Date: Tue, 21 Feb 2023 10:59:29 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Jessica Clarke <jrtc27@jrtc27.com>
CC: Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>, Palmer
 Dabbelt <palmer@dabbelt.com>, Anup Patel <apatel@ventanamicro.com>,
	<pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Anup
 Patel <anup@brainfault.org>, <kvm@vger.kernel.org>,
	<kvm-riscv@lists.infradead.org>, linux-riscv
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/7] RISC-V: Detect AIA CSRs from ISA string
Message-ID: <Y/SkES28TNBz02wM@wendy>
References: <20230128072737.2995881-3-apatel@ventanamicro.com>
 <mhng-0f9bdf58-5289-4db4-8fd7-38898824c44f@palmer-ri-x1c9>
 <CAEg0e7hrQFu+cdZy+3QO1ML9FNTPBehZwOOBnr1F-5ABYDnkGg@mail.gmail.com>
 <CAEg0e7hRjMSgYZbPTQztbQ3bGZf-r8wAfCK5ZnDXOcx27HcTCA@mail.gmail.com>
 <Y/Sfpb2c/LS0LCiA@wendy>
 <F80EBB4C-29C4-472D-B213-EFD220EF9B1F@jrtc27.com>
MIME-Version: 1.0
In-Reply-To: <F80EBB4C-29C4-472D-B213-EFD220EF9B1F@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_030005_669353_76A7882F 
X-CRM114-Status: GOOD (  12.54  )
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
Content-Type: multipart/mixed; boundary="===============7618180667692035264=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7618180667692035264==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fkedauUBfv9Z3eAN"
Content-Disposition: inline

--fkedauUBfv9Z3eAN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 10:51:13AM +0000, Jessica Clarke wrote:
> On 21 Feb 2023, at 10:40, Conor Dooley <conor.dooley@microchip.com> wrote:
> > On Tue, Feb 21, 2023 at 08:12:58AM +0100, Christoph M=FCllner wrote:
> >> The full meeting minutes can be found here:
> >>  https://lists.riscv.org/g/tech-chairs/message/1381
> >=20
> > This link is non functional unfortunately :/
>=20
> tech-chairs is private, for (co-)chairs only... not sure why it went
> there rather than tech-privileged.

Yah, that's what I was getting at.. This is a conversation on a public
ML, so it'd be annoying enough for some readers if it was gated around
RVI membership, but gating on membership of the inner circle makes it
kinda useless!



--fkedauUBfv9Z3eAN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/SkEQAKCRB4tDGHoIJi
0iIsAQD33eYII7OicrE7raQAFQf4L6dnKBZxw8YEJkvZx/SVrQEAoAmPtSKMvq8V
tiy/3pfhtR6/frhw7YmjIh1N66thdA4=
=rw0B
-----END PGP SIGNATURE-----

--fkedauUBfv9Z3eAN--


--===============7618180667692035264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7618180667692035264==--

