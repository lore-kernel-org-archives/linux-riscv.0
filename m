Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B42C61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 11:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmVJnTxxOdHQ/DuClWyTiGB6VGNL1GH+MkxB5SlYKM8=; b=j8t+LffyLsSsqiBmzZZ2mzhF/C
	Ixt9DIUEYH7phHzDkha/ynvkL9FGD0u3v2aHp45T4zGuEA8HAIxOVDeiS5c0LiZuVzqZHW/foLHzI
	StD/D2iNixvvCC1oSEFtFiSeyIiUYJfbjithIqSm85RwiLWQwTrv87TlqHNrEH12bZ4BV3Wc+wHcj
	m9B39RAekofB5zjkdaIhTObaEstmG/2FUlLF95C10LlEG9UfUBF6X6IGAGAp+OcLpW0ICKOz5KjJ6
	kmg2V9GYIIy5FrwrJu2iunwmRL9coSiBGUc1O+K5Gir/K7nkU8KNQnigAqXBEDrzyMfSxmC5T+DLC
	fzZebalw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUQjO-007Y8Q-ID; Tue, 21 Feb 2023 11:22:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUQjL-007Y7v-1M; Tue, 21 Feb 2023 11:22:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676978562; x=1708514562;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xnVKZ8JYLPRVBwZVLXPtUJF2QZfME0M6oxa6WpSevws=;
  b=dTllXfzXdxg7A66QPkHuDgx/zBMalx8syeC4rWJzRMbwEwq3DeG31voi
   arjVrqA0OBVh63CbMJehh/sr8aFGfN6y4Ao6Pn6t6Y9g+z8NkBL63x5zh
   d3PILV0UePH4M4oAxXjXOTF8nrp/wNLCQJxZsE33sNynLrAg4erQDhNq/
   JCE55U1iBxQ64tp5+bXIfGIbi6vs07AfuSf1ab+v3xcXnnbnbo21X8i9B
   o/YgOBFaoaa7WuLdcv8PAjriyQd31GlhpDrVbwjB78+ePXl2NN5/Fs22r
   XrlS+U97tM0DVF6MlCwMxYumkEnWtVBYWXdHUgiYgKVlEVZtpcx6LGASt
   A==;
X-IronPort-AV: E=Sophos;i="5.97,315,1669100400"; 
   d="asc'?scan'208";a="201608555"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Feb 2023 04:22:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 21 Feb 2023 04:22:40 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 21 Feb 2023 04:22:38 -0700
Date: Tue, 21 Feb 2023 11:22:12 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>
CC: Jessica Clarke <jrtc27@jrtc27.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <apatel@ventanamicro.com>, <pbonzini@redhat.com>, Atish Patra
	<atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew
 Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
	<kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>, linux-riscv
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/7] RISC-V: Detect AIA CSRs from ISA string
Message-ID: <Y/SpZHRdUXCiV4KT@wendy>
References: <20230128072737.2995881-3-apatel@ventanamicro.com>
 <mhng-0f9bdf58-5289-4db4-8fd7-38898824c44f@palmer-ri-x1c9>
 <CAEg0e7hrQFu+cdZy+3QO1ML9FNTPBehZwOOBnr1F-5ABYDnkGg@mail.gmail.com>
 <CAEg0e7hRjMSgYZbPTQztbQ3bGZf-r8wAfCK5ZnDXOcx27HcTCA@mail.gmail.com>
 <Y/Sfpb2c/LS0LCiA@wendy>
 <F80EBB4C-29C4-472D-B213-EFD220EF9B1F@jrtc27.com>
 <Y/SkES28TNBz02wM@wendy>
 <CAEg0e7i3=Zg5pxG4HCEfFkzpot5-u6yHoTSFKPBuCGU+djZ5uw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEg0e7i3=Zg5pxG4HCEfFkzpot5-u6yHoTSFKPBuCGU+djZ5uw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_032243_179075_42DCF89C 
X-CRM114-Status: GOOD (  17.45  )
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
Content-Type: multipart/mixed; boundary="===============7665550808898947525=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7665550808898947525==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HQ7FIfEfxxoLIcym"
Content-Disposition: inline

--HQ7FIfEfxxoLIcym
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 12:03:45PM +0100, Christoph M=FCllner wrote:
> On Tue, Feb 21, 2023 at 12:00 PM Conor Dooley
> <conor.dooley@microchip.com> wrote:
> >
> > On Tue, Feb 21, 2023 at 10:51:13AM +0000, Jessica Clarke wrote:
> > > On 21 Feb 2023, at 10:40, Conor Dooley <conor.dooley@microchip.com> w=
rote:
> > > > On Tue, Feb 21, 2023 at 08:12:58AM +0100, Christoph M=FCllner wrote:
> > > >> The full meeting minutes can be found here:
> > > >>  https://lists.riscv.org/g/tech-chairs/message/1381
> > > >
> > > > This link is non functional unfortunately :/
> > >
> > > tech-chairs is private, for (co-)chairs only... not sure why it went
> > > there rather than tech-privileged.
> >
> > Yah, that's what I was getting at.. This is a conversation on a public
> > ML, so it'd be annoying enough for some readers if it was gated around
> > RVI membership, but gating on membership of the inner circle makes it
> > kinda useless!
>=20
> The mail was forwarded there as well (and to tech-unprivileged):
>   https://lists.riscv.org/g/tech-privileged/message/1294
>   https://lists.riscv.org/g/tech-unprivileged/message/430

Great, those I can actually read. Thanks for sharing with the unwashed!

Conor.


--HQ7FIfEfxxoLIcym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/SpZAAKCRB4tDGHoIJi
0gOxAP449GebNOGwifeFqectIA3BJ265MzeJAYp+PoMgGSZ96wEA+vF3amkYJJTt
36jS+BUDlwbiv7F/Px3wiehR/0FmNAU=
=LI0o
-----END PGP SIGNATURE-----

--HQ7FIfEfxxoLIcym--


--===============7665550808898947525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7665550808898947525==--

