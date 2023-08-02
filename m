Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D2FC00528
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 08:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KhElINnV2A4lqDHOcm+8Qu1xFR39NzHMiX2tLV4uHY4=; b=saAQsBp4arXH70g+ld9nJSDJPx
	MJqg+4zsK2BiyRVVpHbi756VEW/HSvdpOm6vmvYIRJ88U4EioAmROzQjewbM+lKReJOxZh8MwcWID
	Jbqf5zhVEdKWdXaG+nzNVLwQvg5LVCWIYeVXyW6IEYmCGVpLfZZdAGa74ZuDhfxJZ75iD3YaCJL0o
	+d7vw427haPrZO/urmJiFSPhizstHN/vVIkEjJXJw+YyhPxqoYsnsqcQXZ8htGYrUfi4movjRPBZY
	jSZxEHiLCTeIbCkGjizi6tv4YHpPsXxj1IpK7Mh3u+yU2MvohIqSJKqNG8om4Y5isDe1+dyqBCVZA
	qOUTyJHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR7bw-004Q0G-09;
	Wed, 02 Aug 2023 08:53:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR7bt-004Pzb-1J
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 08:53:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690966417; x=1722502417;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tv4M0P+a0kjE58sJhnwrk9HUNB9uEWwAlkNuhiNh6pg=;
  b=HbVkbt7MWj+p0JpeBgWt2cjwffRPQKz3AY+Z2H1ixbA99cyNEsybgseW
   Nf2Gl23d1uie79vPx8cRkFnnC720xnD0HSvkm+NIBIvIVf9VccVJPkxJ4
   Hil8IK76W47JglnqhLOR9xJdkpYJibED4k+AE4mGW42+XXmvrcHLReAQs
   /Ve2DNSdGo/ZB4ERaKortCiIox0z86UtYVzr6TQ6I0sX5nR6Cy1NNAl55
   6nA7tZQ4V86LDQ5BNX2Z1UjApgwWQZZcutf5KLzlfJeswGotsTx0oPpRN
   TyQy4CaKpQH+HY5oWmNdRO4RB+VLUsoeKhvBK6CZ9ti3uq7WVzocBxf3m
   g==;
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="asc'?scan'208";a="223448015"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Aug 2023 01:53:32 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 2 Aug 2023 01:53:23 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 2 Aug 2023 01:53:21 -0700
Date: Wed, 2 Aug 2023 09:52:45 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: Minda Chen <minda.chen@starfivetech.com>, Conor Dooley <conor@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Samuel Holland <samuel@sholland.org>, Dao
 Lu <daolu@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Mason Huo <mason.huo@starfivetech.com>,
	<stable@vger.kernel.org>
Subject: Re: [PATCH v1] riscv: Using TOOLCHAIN_HAS_ZIHINTPAUSE marco replace
 zihintpause
Message-ID: <20230802-decibel-unshaved-fde1cfba2d20@wendy>
References: <20230802064215.31111-1-minda.chen@starfivetech.com>
 <20230802-sharpness-spoon-f9b8804fb66f@wendy>
 <d64874cb-8628-a6d2-d2f4-8af4d0ebf8b2@starfivetech.com>
 <20230802-seismic-gallstone-fca0f4b17076@wendy>
 <c42bd997-8795-8bf7-eee1-3ac8b153371a@starfivetech.com>
 <2023080253-headache-moneybags-a833@gregkh>
MIME-Version: 1.0
In-Reply-To: <2023080253-headache-moneybags-a833@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_015337_612015_70A76BA9 
X-CRM114-Status: GOOD (  28.49  )
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
Content-Type: multipart/mixed; boundary="===============8965456915549300805=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8965456915549300805==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FW1Kj+nV7cDQRX/N"
Content-Disposition: inline

--FW1Kj+nV7cDQRX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2023 at 10:33:27AM +0200, Greg KH wrote:
> On Wed, Aug 02, 2023 at 04:17:51PM +0800, Minda Chen wrote:
> >=20
> >=20
> > On 2023/8/2 15:48, Conor Dooley wrote:
> > > On Wed, Aug 02, 2023 at 03:32:15PM +0800, Minda Chen wrote:
> > >>=20
> > >>=20
> > >> On 2023/8/2 14:54, Conor Dooley wrote:
> > >> > Hey Minda,
> > >> >=20
> > >> > On Wed, Aug 02, 2023 at 02:42:15PM +0800, Minda Chen wrote:
> > >> >> Actually it is a part of Conor's
> > >> >> commit aae538cd03bc ("riscv: fix detection of toolchain
> > >> >> Zihintpause support").
> > >> >> It is looks like a merge issue.
> > >> >=20
> > >> > Yup, spot on.
> > >> >=20
> > >> >> Samuel's
> > >> >> commit 0b1d60d6dd9e ("riscv: Fix build with
> > >> >> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy") do not base on Conor's commit a=
nd
> > >> >> revert to __riscv_zihintpause. So this patch can fix it.
> > >> >>=20
> > >> >> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> > >> >=20
> > >> > Did you actually manage to trigger this, or was this by inspection?
> > >> > clang-15 + binutils 2.35 was, IIRC, how we spotted this because th=
at's
> > >> > what the clang-built-linux CI uses to test the LTS kernels from be=
fore
> > >> > LLVM's IAS was supported for RISC-V. Seemingly all that needs to be
> > >> > satisfied there is that zihintpause doesn't appear in -march so th=
is has
> > >> > gone unnoticed.
> > >> >=20
> > >> > Fixes: 3c349eacc559 ("Merge patch "riscv: Fix build with CONFIG_CC=
_OPTIMIZE_FOR_SIZE=3Dy"")
> > >> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > >> >=20
> > >> > Thanks,
> > >> > Conor.
> > >> >=20
> > >> Thanks, Conor. I found this just by inspection. I found a issue that=
 vdso.so call cpu_relax
> > >> cause application core dump in kernel 6.1.31. I need Samuel'patch to=
 fix this. And I search the log
> > >> of processor.h found this issue.
> > >=20
> > > That doesn't look like it is fixed in later stable kernels (we are at
> > > 6.1.42-rcN right now I think). It sounds we should ask Greg to backpo=
rt
> > > 0b1d60d6dd9e ("riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy")
> > > to 6.1. Does that make sense to you?
> > Yes. 6.1 is lts kernel. Starfive will use this kernel for a long time. =
Thanks.
>=20
> What is preventing you from moving to a newer kernel version?  All of
> your kernel changes are already properly merged into Linus's tree,
> right?

Regardless of their reasons, "vdso.so call cpu_relax cause application
core dump" is something that we should fix in stable kernels, no?

--FW1Kj+nV7cDQRX/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMoZXQAKCRB4tDGHoIJi
0oRWAP9BTGH3q07+XeBW8yRULD9PA1MB/TiLZFZTyMSVwZ+k7gEAkN5bfTlTj2Bu
4J2aZnx6QsteTBSDwjAzsIcBaqYmGQU=
=deFA
-----END PGP SIGNATURE-----

--FW1Kj+nV7cDQRX/N--


--===============8965456915549300805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8965456915549300805==--

