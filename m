Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C32C6FD1D
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 08:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ui6MbsJpAPQTisongOq0Gde9N1u0uDTws1n5Wz8rO0=; b=eILmRZqwr1/jyxydOpNysfv8+9
	i6Br8IKQ90c3jyHlwGUNvAXQ+AHH5B8GpsWYx6gbfRsmGSSsJsjtbcdVTqNe2ZxopKdGiGMcLbNIw
	Baz56Rs7HQx9kuhhkb4jK8KOpnZmHZpmRH/PnQq4kTheU7H6oQ+1+JiQEulxqycGu1XMGZj8hnsBh
	eUJv5Kqywg8u8zwEaklEj6hqEw4WOPwzctMDlUixQTrkBwuQEv2L3Jrk7QyIeCuUUGGwc+jqYF3I5
	7F+i7Ts6BMtmwqNfNW3PBdnVscljs0MI5Z/V4wy/H0zFqn6QIj8Eezk2RTwR1sjqpaUF3fvy9jgi/
	NZpPRjPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phnZs-0034ZB-2F;
	Thu, 30 Mar 2023 08:24:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phnZn-0034Xv-2W
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 08:24:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680164648; x=1711700648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SBoEmEO7Dj8b7NzG7TSXvuV5ruIHbv+zWUEtKVANFTE=;
  b=QMxpvkCQD1vbWfg5pJodw7CS38u2ajAItBtLnpR1SN4mgifGh6+TPb/O
   cBhHZchHMdDIfLLNX79RpNwFI3bPtExfSxUxcMCv6Ne4WwUZZB0XL2UjU
   Q+FNx46NettzxJXLAYVgin1cb8jxdUYrPq4E8lahRz62iLxYvVaxvKUC+
   /oPM7Os22uLIkCRzBLbUHK/9bmY2ThYW99fFpUaQP8Vfv2yBDp1jMVEwU
   ZwBZMA/CERpuNxw50rZH98oodNULp2IsNsLPH9oUE6wWe1OrltGiad8F+
   Zpmy4wginJwHQC+jPRRGZl99P8sNcdMUrN+2FEHsbMQui4s/m8fipua1U
   g==;
X-IronPort-AV: E=Sophos;i="5.98,303,1673938800"; 
   d="asc'?scan'208";a="204161151"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Mar 2023 01:24:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 01:24:01 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 30 Mar 2023 01:23:58 -0700
Date: Thu, 30 Mar 2023 09:23:45 +0100
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
Message-ID: <a6220e52-9934-422b-9b05-95705b8fd684@spud>
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <CANiq72=i9je2864iTvZBFnhVLhF7Cema7EPCcdWOJ3mr62SqDg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANiq72=i9je2864iTvZBFnhVLhF7Cema7EPCcdWOJ3mr62SqDg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_012407_851224_00E8EC2B 
X-CRM114-Status: GOOD (  14.83  )
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
Content-Type: multipart/mixed; boundary="===============1213276824703290126=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1213276824703290126==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YyN1dM7SJNHGwojV"
Content-Disposition: inline

--YyN1dM7SJNHGwojV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 07, 2023 at 12:07:29PM +0100, Miguel Ojeda wrote:
> On Tue, Mar 7, 2023 at 11:25=E2=80=AFAM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> >
> > I have added SoB's too, but if that is not okay Gary, then please scream
> > loudly.
>=20
> Note that `Co-developed-by`s always go with a `Signed-off-by`s, i.e.
> it is not possible to add just a `Co-developed-by`.

Aye, but that does not mean that I am entitled to add someone else's!

> By the way, like for the Arm patch set, if you end up doing a v2,
> could you please add the `BINDGEN_TARGET_*` in `rust/Makefile` (GCC
> builds are really experimental, but since they are there anyway, it is
> best to be consistent and add it).

Sure.

--YyN1dM7SJNHGwojV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCVHEQAKCRB4tDGHoIJi
0sZQAQCUXauXvBSo3TQBU7zir2CymSgO+QWCV5+jRW9nEMhawAD/bfruWxpKJBpY
m9CRaroRiPS0CZfC4rp/1I2j2aRuSQg=
=eDKb
-----END PGP SIGNATURE-----

--YyN1dM7SJNHGwojV--


--===============1213276824703290126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1213276824703290126==--

