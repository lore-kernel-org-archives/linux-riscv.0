Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C22C678D5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 11:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JskaSVj4yINJZ7hoNnsfgYKcUHkEZ+BKD2klKy0o3qM=; b=y9M6US6u4TaXFdC/VSPhbXpdJx
	ZhIE3GGE2Rhi6zWCLcd2CgikVsKQjHQuMXLgkg1/OXRQgVrCTT1DMCABCdu+alib0Yrs0Deg43WmB
	AqYnEOwgpnHgS337s3DxQCeRNVam3MMTPpQ1BQV26t9hVWXC58NUgnrC25N7PTXQbWSwaUQr9uYcj
	nq7mLtYthrntgT6vuMuAI5p16CdI6JXoUXpQSbHX3rB83mSsI2cRj1evq6VWmxNqzcca71pfkcyvX
	9zr1aKChHsUAIqR2RzVT5CiubjjppnaGIlivLAW8CZK6PGz2kEcCJmEVIK6y2348Px2XYa0i6IaWh
	FMNrqcyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZV4x-00HOnU-6a; Tue, 07 Mar 2023 11:01:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZV4s-00HOmH-6U
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 11:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678186915; x=1709722915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=297I+f2QIP3fYjyaueh8DMg0UU/5q5ZcWqC31Xzuzco=;
  b=WSxyWTTEHwcRtwIOQh4q1mfbswa+B9bG9kA5LCYrh1beZNSEFcoBufMl
   ZLGUuUO2foKf+de3fMIcFOiccC/EFf8FZLcXu/W7JLnooMWEqQb7EsM6T
   Mc3u6IbN2Et2tV/yjqUqNuRiGQxQwJ9/wQfBTcI9+Y9dgdw6AbFd3w39f
   nYMRi2ujOmJeOJRohRMT8TwjBGUy70jnv/QQRcj/WO9odJQj/VM3YXqE2
   D+ucZIAFVbdRxEC9dMRPEl9S7Ng0keo+qMLEihP1dO+/b/StLEivN3ZEI
   6dPFW4fLBwhIjG+NUGL7Yqyp//lgf/ab+dcowLHnbdcGMtMwIW2DosbOY
   w==;
X-IronPort-AV: E=Sophos;i="5.98,240,1673938800"; 
   d="asc'?scan'208";a="203976780"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Mar 2023 04:01:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 7 Mar 2023 04:01:46 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Tue, 7 Mar 2023 04:01:42 -0700
Date: Tue, 7 Mar 2023 11:01:13 +0000
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
Subject: Re: [PATCH v1 2/2] RISC-V: enable building 64-bit kernels with rust
 support
Message-ID: <ZAcZeWYUU75BK5FO@wendy>
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <20230307102441.94417-3-conor.dooley@microchip.com>
 <CANiq72nLjBgMSUTtWuF7qU5vG9rA3v=ekWk1d6+SNiGkfcaS8Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANiq72nLjBgMSUTtWuF7qU5vG9rA3v=ekWk1d6+SNiGkfcaS8Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_030154_262002_2BF75C88 
X-CRM114-Status: UNSURE (   9.65  )
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
Content-Type: multipart/mixed; boundary="===============6715830573680587503=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6715830573680587503==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FkEia1k7ZMsXTyfP"
Content-Disposition: inline

--FkEia1k7ZMsXTyfP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 07, 2023 at 11:56:30AM +0100, Miguel Ojeda wrote:
> On Tue, Mar 7, 2023 at 11:25=E2=80=AFAM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> >
> > While adding RISC-V to the table, I took the chance to re-sort it
> > alphabetically.
>=20
> For reference, there is a patch for this coming at:
>=20
>     https://lore.kernel.org/rust-for-linux/I0YeaNjTtc4Nh47ZLJfAs6rgfAc_QZ=
xhynNfz-GQKssVZ1S2UI_cTScCkp9-oX-hPYVcP3EfF7N0HMB9iAlm1FcvOJagnQoLeHtiW3bGC=
gM=3D@bamelis.dev/

Cool. Git should resolve that, probably without even generating a
conflict in -next, right?


--FkEia1k7ZMsXTyfP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAcZeQAKCRB4tDGHoIJi
0iWbAP9z3UWgpmmPL9iCnUOvG6wdr7hbXIjO7rXRgnhbqt0fkwD9HQMjWbIh05Hm
OgvH3JO4XhG7ZCQ2aWRBhDWQ86BUSAM=
=cBqK
-----END PGP SIGNATURE-----

--FkEia1k7ZMsXTyfP--


--===============6715830573680587503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6715830573680587503==--

