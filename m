Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AEFEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 14:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvlw4C4+g1brYe9XlLeJbuzRPdI/KiJJX+YxiUGP7Xk=; b=rVDQYCEacVheU2VHsmJZNLMfQM
	gh8QrmDfaU8fi2PUVlgGi8ILMN1vmV2xQRS/VzK6aFtpwmOZEpO4czf5icbzv1i0dmptYJirKZqgj
	Bj/htecGwvdDvzmKzYA9CTUFaST7aaBVPHntne8dvqet06spV3430P6hiek/lScmCtGawrFNceQJ0
	006EyCiQkUfOyA4WNKXnd8eROCQsfDRZbYFSMkN/HzdIB+HObpPyHBytFcXUTWhg7CTAlPf8r3OLc
	v4Dr8OpMX4yZYZhKM+K9X8e/KJi1NAjVyKybPfi7ZrCtNPO2wI2dLOswOrziNEphLQT+AzERHOCJE
	Y9Rs+ucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEsFX-001FnS-1e;
	Thu, 29 Jun 2023 14:03:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEsFU-001FmQ-0q
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 14:03:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688047431; x=1719583431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0LCje66TrgfndvZbz38XLfCZaJE3/THeERjOD2/AstY=;
  b=npI9rOfUuuHxJ0R5gZtwYsSZ2SaUqd/vQKNOCUOIa3q9yZQRcGJxgprs
   6DzWwmLjXRvEAGyADzKcLKuDRa5PwVo1ayo2onusWgZVE1kRG+Jlng49t
   B6o9b/yRfbddhTyoiNmwHSDPLD8f29MMi53Gzxytkx9VaRYXltfgw0Ze+
   t+etfbsfMDjzzdhfsZFidRum7hg4yywl4HEfYWxRIXfsm43okizlYPWRv
   edxX/AspLE95Gjdr2Q6tP3zxny113vvmrBCa0UgW/Awwoxz9aVHWx+Kkf
   a7Bm81kDlN8wqGv1asZmtmJiuHI+Tq2ZFtW1NFTnOUMhbjyZ6f0ixhRid
   w==;
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="asc'?scan'208";a="232893173"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Jun 2023 07:03:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 29 Jun 2023 07:03:40 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 29 Jun 2023 07:03:37 -0700
Date: Thu, 29 Jun 2023 15:03:08 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH 1/2] RISC-V: Probe for unaligned access speed
Message-ID: <20230629-untaxed-tripping-6000bc8c1873@wendy>
References: <20230623222016.3742145-1-evan@rivosinc.com>
 <20230623222016.3742145-2-evan@rivosinc.com>
 <20230626-veneering-superglue-751719bd967c@wendy>
 <CALs-HsskE1-OkZxFzH9bM6bR9NBW5R4mh5AJScVtnvHbv+Pi6A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALs-HsskE1-OkZxFzH9bM6bR9NBW5R4mh5AJScVtnvHbv+Pi6A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_070352_480777_49B37B08 
X-CRM114-Status: GOOD (  37.88  )
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
Cc: linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Xianting Tian <xianting.tian@linux.alibaba.com>, Masahiro Yamada <masahiroy@kernel.org>, Greentime Hu <greentime.hu@sifive.com>, Simon Hosie <shosie@rivosinc.com>, Li Zhengyu <lizhengyu3@huawei.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, Sia Jee Heng <jeeheng.sia@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andy.chiu@sifive.com>
Content-Type: multipart/mixed; boundary="===============3902926689459258455=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3902926689459258455==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H5dFwnc5H1LxQund"
Content-Disposition: inline

--H5dFwnc5H1LxQund
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 27, 2023 at 12:11:25PM -0700, Evan Green wrote:
> On Mon, Jun 26, 2023 at 7:15=E2=80=AFAM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> > > +void check_misaligned_access(int cpu)
> > > +{
> > > +     unsigned long j0, j1;
> > > +     struct page *page;
> > > +     void *dst;
> > > +     void *src;
> > > +     long word_copies =3D 0;
> > > +     long byte_copies =3D 0;
> > > +     long speed =3D RISCV_HWPROBE_MISALIGNED_SLOW;
> >
> > Is this not a change from current behaviour, that may actually lead to
> > incorrect reporting. Presently, only T-Head stuff sets a speed, so
> > hwprobe falls back to UNKNOWN for everything else. With this, we will
> > get slow set, for anything failing the test.
> > Slow is defined as "Misaligned accesses are supported in hardware, but
> > are slower than the cooresponding aligned accesses sequences (sic)", but
> > you have no way of knowing, based on the test you are performing, wheth=
er
> > the hardware supports it or if it is emulated by firmware.
> > Perhaps that is not relevant to userspace, but wanted to know your
> > thoughts.
> >
>=20
> Hm, that's true. EMULATED was an easy one when we were planning to get
> this info from the DT. It also might be an easy one in the future, if
> we get an SBI call that allows the kernel to take over misaligned trap
> handling. We'd then be able to do a misaligned access and see if our
> trap handler got called.
>=20
> One option is to leave the value alone if we fail the FAST test
> (rather than changing it from UNKNOWN to SLOW). This isn't great
> though, as it effectively makes UNKNOWN synonymous with SLOW, but in a
> way where usermode can't tell the difference between "I truly don't
> know" and "I tried the fast test and it failed".
>=20
> The alternative, as it is now, may mislabel some emulated systems as
> slow until the new SBI call shows up.

Make that "mislabel some emulated systems forever", existing systems
don't magically grow support for new extensions unfortunately.

Realistically though, does it matter to userspace if it is slow because
the hardware is slow, or if the emulation is slow, since there's not
really a way for userspace to tell from the syscall by how much it is
slower.
It can probably guess that emulation is worse, given how crap the
speed I see on mpfs is.

I'd rather we did say slow, rather than people start to interpret
UNKNOWN as slow.

> I'm not sure how bad this is in
> practice. We could add a subsequent performance bar below which we
> guess "emulated".

Nah, I don't really think that that is required.

> This probably matches what usermode will use that
> value for anyway (a synonym for "very slow"), but it's basically the
> same problem with reversed polarity (we mislabel some slow systems as
> emulated). I'm open to suggestions!

I think I just agreed with you, give or take. If it is fast, say fast.
If it is slow, we say it is slow. If we know it is emulated, then we can
report it being emulated. Is it too late to remove the "hardware" from
the syscall documentation, IOW s/supported in hardware/supported/?

Please actually describe the assumptions/subtleties in the commit
message though, so that the rationale for stuff is in the history :)

Cheers,
Conor.

--H5dFwnc5H1LxQund
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ2PHAAKCRB4tDGHoIJi
0u12AP9Y4hnYqRbH89CmxyncXU2SpQInIjF2gv52xpsfjjHjSgD+Kupcyjx9JdXL
IXyCwSeqVgJgGgNYQaIGXrmI/E/Biwo=
=2Coz
-----END PGP SIGNATURE-----

--H5dFwnc5H1LxQund--


--===============3902926689459258455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3902926689459258455==--

