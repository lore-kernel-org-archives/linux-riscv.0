Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888F9C7EE29
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 12:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22NFHWEcTB/w+AVH374vGxBhnWuRW/85PLNBxZzuwow=; b=uSBQ4hl+167BzZFMXxuqXDrg9D
	MBtR6xUAIuQNBSrPXLTM3ULtxRZCoNiSkzsx8DyoRdZpbTorny7N9hguJbiEIC/OusGggsOP5MduJ
	UJJmPXLHq2Ax0+JU12oH2MPalaexcJCnAuwMlq/JNSguzsxduCve2kDeEb6VKLj3EQAhEi0/gGZTj
	OxYsz4bFcy06I//LCxRmjfjkfPCG1zHMwWMx3FlfJgXhyLpByxIvpLUguXVmYW85esEfz/vKwcA6i
	OXLJSuMruAqikVg0NabQ1VaRobj+9sVjLWuvh9RsO1MUK9Beu8578rQKPAtCeP+/PldCB8npqVWWL
	xmDGwnCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7El0-009Ki5-04;
	Thu, 08 Jun 2023 12:28:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Ekw-009Kh7-0k
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 12:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686227326; x=1717763326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D3eGuNa1+BoSZIrVhFPmuw0PAOKIN8uK8gmRTqHfLG4=;
  b=m1PCF17TAiOsN5kq2B7GtzIyOj7LdKy8eaxE96Dnhl9N+pIWIIEZO7JG
   GKDYZgYf/hbFTc7DWbYdGQYYQmN5WKIkVLWS1BSyHL1Mtkra4QdfAk3mA
   pMXUgrd0lV4S3+90TnwN2q0btxKpBbqtv24XR15odPgQ/PoYqARP0/Owm
   xBWdpQ6KBhpj49bokqsm2Rrvxz934AYe5srekLL9VXf1aRofsz8tvJBt/
   tSgO3AjOcoQul8han4RmsfscaKbtypoWIrZC7o04X95y+KpseI4CGxOkj
   pZ9ayAcKcSK3tpidJmgj+MAzyegij/BN0T0WPmfzWYHi4wRwQAmd8duYA
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="asc'?scan'208";a="219411820"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Jun 2023 05:28:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 8 Jun 2023 05:28:33 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 8 Jun 2023 05:28:30 -0700
Date: Thu, 8 Jun 2023 13:28:06 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: <linux-riscv@lists.infradead.org>, <conor@kernel.org>, Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho
	<wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?iso-8859-1?Q?Bj=F6rn?= Roy Baron
	<bjorn3_gh@protonmail.com>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, <rust-for-linux@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
Message-ID: <20230608-spiritism-gonad-5f5aff4c3a24@wendy>
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <20230608-dispatch-sneer-aa09bd7b2eb8@wendy>
 <CANiq72nnph7LS1fLRtHz8NJ91PWXPaUnm0EuoV3wrbvK398AnA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANiq72nnph7LS1fLRtHz8NJ91PWXPaUnm0EuoV3wrbvK398AnA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_052846_463694_C55105F6 
X-CRM114-Status: GOOD (  11.09  )
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
Content-Type: multipart/mixed; boundary="===============2097869114615995550=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2097869114615995550==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HEkduUF7a/Zaoz5V"
Content-Disposition: inline

--HEkduUF7a/Zaoz5V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 08, 2023 at 01:52:47PM +0200, Miguel Ojeda wrote:
> On Thu, Jun 8, 2023 at 9:01=E2=80=AFAM Conor Dooley <conor.dooley@microch=
ip.com> wrote:
> >
> > I do intend revisting this, probably after the min. version for rust
> > gets bumped, I've just been really busy with other work the last weeks.
>=20
> Thanks Conor! That would be great. We are increasing the minimum
> version after the merge window to Rust 1.70.0 (assuming no unexpected
> issues).

Right, so probably I won't resubmit anything until after v6.6 then,
as it won't be in the RISC-V tree until then, by the sounds of your
timeline.
Gives me plenty of time to try and unravel the mess of libclang versions
and what extensions are supported by each tool. Not like I am devoid of
other things that need to be done!


--HEkduUF7a/Zaoz5V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIHJVgAKCRB4tDGHoIJi
0ikSAP9vwx3IhwT2YQBx4VTPuAhBIV9NLradoYYCFXuEPhuj0QD/TlPI2RbulZ9K
uWEHPxTMU46fCeYmbOUy5I7dtUUEwgg=
=ram8
-----END PGP SIGNATURE-----

--HEkduUF7a/Zaoz5V--


--===============2097869114615995550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2097869114615995550==--

