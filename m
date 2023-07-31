Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F93C001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 11:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+9aA9ICADBC4G+gQwjNku1y8/GMUzZ5Ug95QTPXMgM=; b=TzOO3GLe71hMHshjK5lQIOukpp
	qpm2I44g5yezh8pLy4jd0S/bINYlzVCOrGNs2VXIg58OztLlzz/qy7orRXQ3bLyECnbrCN/a6qBkH
	Uctnj04eOCgFPMPSqV566PEcKrNxmcAeq7PW9e8mtIJtiGuJ/POrifATPsh2KxKAMSRWesiZAPoYL
	LNiUKwZ32qwbO1rKe3R0F9S6JJlefpE0s2ssEhrZOfkD89AlWE+ugK/zv2MH+KOkh6rdHrghhJnkR
	9QfuPb6o5dRwqsfMxFmgSJK6izuu2x/Yq3n3L9uhxqNIvFXNdwRh1C9rnrg9tAZ2XuMhO7KziA4Li
	/7ueXyvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRFM-00FLtW-2T;
	Mon, 31 Jul 2023 11:39:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRFK-00FLsQ-0B
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 11:39:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690803570; x=1722339570;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bk5DMwF7rZz6n/fcjLNabhMTSOkn7DumjJhcd9DMlSE=;
  b=A+k7GKlQ52B801akmWRajh0KUPf3ziv8ztM7SO3AofMxn/thPBja9a8T
   qeJ7KTGz921UFUyaV1pZTlodtNr/aXnxAVXWJlxZOShxF3fV4lQp6t0gn
   dt4/U+aP5RgGvfL8bDN/Ho1abnA0IGpYLhnZzEDG70G4h6JsddEetjOSI
   uramd2DTZc0sDQ30IK84N48hzaLFWl1XxSfYj0FkW2n6onI5Snz4HuSml
   S+4k6DB7IF8mUzbKJTPXFosVXeRygOR55S/rJKekQ3gPlvji1G2WgVTZQ
   O/7Q3XXqOsY/xiHGgvl5no7LsFxrr76kidsvYC2RBkvVyeBhjnmG9PuGg
   w==;
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="asc'?scan'208";a="223112760"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Jul 2023 04:39:26 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 31 Jul 2023 04:39:15 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 31 Jul 2023 04:39:12 -0700
Date: Mon, 31 Jul 2023 12:38:37 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Jisheng Zhang <jszhang@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Guo Ren <guoren@kernel.org>, Andrew
 Jones <ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel@sholland.org>, <linux-riscv@lists.infradead.org>,
	Christoph Hellwig <hch@infradead.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v10 3/6] riscv: mm: dma-noncoherent: nonstandard cache
 operations support
Message-ID: <20230731-tribute-splashing-6a90f443cefe@wendy>
References: <20230702203429.237615-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230702203429.237615-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ZMZ6XB6gX2kFd/Nt@xhacker>
 <CA+V-a8u3F_XDjBfVVVvNMfjrni8pgpcRgbVt6_Ax1TmG2fJdEg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+V-a8u3F_XDjBfVVVvNMfjrni8pgpcRgbVt6_Ax1TmG2fJdEg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_043930_230900_3FE8E8D5 
X-CRM114-Status: GOOD (  18.60  )
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
Content-Type: multipart/mixed; boundary="===============2884126822663835235=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2884126822663835235==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d/DKBGEaeBZfjJb+"
Content-Disposition: inline

--d/DKBGEaeBZfjJb+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2023 at 12:30:43PM +0100, Lad, Prabhakar wrote:
> On Sun, Jul 30, 2023 at 4:09=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org=
> wrote:
> > On Sun, Jul 02, 2023 at 09:34:26PM +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> > > +config RISCV_NONSTANDARD_CACHE_OPS
> > > +     bool
> > > +     depends on RISCV_DMA_NONCOHERENT
> > > +     help
> > > +       This enables function pointer support for non-standard noncoh=
erent
> > > +       systems to handle cache management.
> >
> > Per Documentation/riscv/patch-acceptance.rst:
> >
> > "we'll only consider patches for extensions that either:
> >
> > - Have been officially frozen or ratified by the RISC-V Foundation, or
> > - Have been implemented in hardware that is widely available, per stand=
ard
> >   Linux practice."
> >
> > I'm not sure which item this patch series belongs to.
> >
> Maybe Conor can help me here ;)

I'm not entirely sure why you need my help, it's your company that
manufactures the SoC that needs this after all.. I think Emil already
pointed out that it was the latter of the two. I guess it is not an
"extension" in the strictest sense of the word, but it fills the same
gap as one, so /shrug.

--d/DKBGEaeBZfjJb+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMedMAAKCRB4tDGHoIJi
0otyAQCTdXhKY3ZMzXlhBusieryR8/T0KUnMSoyc/nJ6g+0HrQD/ama4ssLUZSV1
/pCK2RUuXSCTW8uPY8nM87ygzQ/AbQ8=
=NAG3
-----END PGP SIGNATURE-----

--d/DKBGEaeBZfjJb+--


--===============2884126822663835235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2884126822663835235==--

