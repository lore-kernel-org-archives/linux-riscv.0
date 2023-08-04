Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7C3C00528
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 10:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SoIwdhBwasCTHXc/8rwMUCx/QgDbyeXZkbToGmejVJM=; b=d5mcEZ4RsSMI5oXio53N0D5nAs
	+5q89kcKtmh6vdkL6u3DY8r2ZxCf8MSkZEDWYjCgIKXHeVbgC/EY+B6KC0XKg4+NdkMaXB6SPck2I
	IUEAJnAXrIZ7SEdLqMz0tYlMnyX/6TXR5fNgzQQECOlWOcQYMNmKPJ39ptVMrFMCKoYZA0raHBQMF
	R9XnK4V52lMLv9xpnsbF7kaTeKhFDbOBq7gSw1shDOEmo/7vXfjC69DC3HIOMnivtrZ1n1M3IDVOT
	WmMuQCujwiB399RCR+DcneQfLL+so0wcy5e2X8/SDF6yH5rs/CuPUQ6p733kC6Gcj5XM+1t0eNdZk
	d3MvUtvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRriY-00C5wG-2q;
	Fri, 04 Aug 2023 10:07:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRriU-00C5uT-1L
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 10:07:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691143650; x=1722679650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wKN3d8eeDXqlTBQixSdvl3Wq7r2YvBLUa2tQIqAHrC8=;
  b=xIZLQzh5o668DnR0xq/y6TuSjChU8te9rhR6IBRRGhwPjt4Glgdi8a9n
   w4JfNpPhJTx4G1e+JA5CbILVKGE2kIRuTVgYK+NvLEOzOMemVjcxex8ca
   XJTGT9hW9Br+pxQqgab5Gjvhje+NZb3qUUY2/VG4T+TM9To5kcNXydh9o
   jLtasq42o06IxO0OQtKUBqvsb7ltr6+htsceO0BNWroKnpZMa7GvIhvQ+
   sSb3gjQT34m/EciVBwKSEUouFyD+P46bqgIvAGeoIL2GvZU8jpDv6A3Kn
   Ou5AW8K9ikInZixo4l7+ltu2txdEfChlimv3Vp+ZpvJrNu+QH1uUyD70m
   w==;
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="asc'?scan'208";a="164838139"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Aug 2023 03:07:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 4 Aug 2023 03:07:23 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 4 Aug 2023 03:07:18 -0700
Date: Fri, 4 Aug 2023 11:06:42 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Guo Ren <guoren@kernel.org>
CC: <paul.walmsley@sifive.com>, <anup@brainfault.org>, <peterz@infradead.org>,
	<mingo@redhat.com>, <will@kernel.org>, <palmer@rivosinc.com>,
	<longman@redhat.com>, <boqun.feng@gmail.com>, <tglx@linutronix.de>,
	<paulmck@kernel.org>, <rostedt@goodmis.org>, <rdunlap@infradead.org>,
	<catalin.marinas@arm.com>, <xiaoguang.xing@sophgo.com>, <bjorn@rivosinc.com>,
	<alexghiti@rivosinc.com>, <keescook@chromium.org>, <greentime.hu@sifive.com>,
	<ajones@ventanamicro.com>, <jszhang@kernel.org>, <wefu@redhat.com>,
	<wuwei2016@iscas.ac.cn>, <linux-arch@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<kvm@vger.kernel.org>, <virtualization@lists.linux-foundation.org>,
	<linux-csky@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V10 07/19] riscv: qspinlock: errata: Introduce
 ERRATA_THEAD_QSPINLOCK
Message-ID: <20230804-throwaway-requisite-c73ebe3fee8c@wendy>
References: <20230802164701.192791-1-guoren@kernel.org>
 <20230802164701.192791-8-guoren@kernel.org>
 <20230804-refract-avalanche-9adb6b4b74e9@wendy>
 <CAJF2gTTfLmCe7eDhfPU1qFTBoVZN8oFACEd4NmTyZaAVtdMK-w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTTfLmCe7eDhfPU1qFTBoVZN8oFACEd4NmTyZaAVtdMK-w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_030730_581466_59B9E3A1 
X-CRM114-Status: GOOD (  29.96  )
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
Content-Type: multipart/mixed; boundary="===============1226706283801341647=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1226706283801341647==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6ux3xtC3FvsADk3y"
Content-Disposition: inline

--6ux3xtC3FvsADk3y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 04, 2023 at 05:53:35PM +0800, Guo Ren wrote:
> On Fri, Aug 4, 2023 at 5:06=E2=80=AFPM Conor Dooley <conor.dooley@microch=
ip.com> wrote:
> > On Wed, Aug 02, 2023 at 12:46:49PM -0400, guoren@kernel.org wrote:
> > > From: Guo Ren <guoren@linux.alibaba.com>

> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufe=
ature.c
> > > index f8dbbe1bbd34..d9694fe40a9a 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -342,7 +342,8 @@ void __init riscv_fill_hwcap(void)
> > >                * spinlock value, the only way is to change from queue=
d_spinlock to
> > >                * ticket_spinlock, but can not be vice.
> > >                */
> > > -             if (!force_qspinlock) {
> > > +             if (!force_qspinlock &&
> > > +                 !riscv_has_errata_thead_qspinlock()) {
> > >                       set_bit(RISCV_ISA_EXT_XTICKETLOCK, isainfo->isa=
);
> >
> > Is this a generic vendor extension (lol @ that misnomer) or is it an
> > erratum? Make your mind up please. As has been said on other series, NAK
> > to using march/vendor/imp IDs for feature probing.
>
> The RISCV_ISA_EXT_XTICKETLOCK is a feature extension number,

No, that is not what "ISA_EXT" means, nor what the X in "XTICKETLOCK"
would imply.

The comment above these reads:
  These macros represent the logical IDs of each multi-letter RISC-V ISA
  extension and are used in the ISA bitmap.

> and it's
> set by default for forward-compatible. We also define a vendor
> extension (riscv_has_errata_thead_qspinlock) to force all our
> processors to use qspinlock; others still stay on ticket_lock.

No, "riscv_has_errata_thead_qspinlock()" would be an _erratum_, not a
vendor extension. We need to have a discussion about how to support
non-standard extensions etc, not abuse errata. That discussion has been
started on the v0.7.1 vector patches, but has not made progress yet.

> The only possible changing direction is from qspinlock to ticket_lock
> because ticket_lock would dirty the lock value, which prevents
> changing to qspinlock next. So startup with qspinlock and change to
> ticket_lock before smp up. You also could use cmdline to try qspinlock
> (force_qspinlock).

I don't see what the relevance of this is, sorry. I am only commenting
on how you are deciding that the hardware is capable of using qspinlocks,
I don't intend getting into the detail unless the powers that be deem
this series worthwhile, as I mentioned:
> > I've got some thoughts on other parts of this series too, but I'm not
> > going to spend time on it unless the locking people and Palmer ascent
> > to this series.


--6ux3xtC3FvsADk3y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMzNsgAKCRB4tDGHoIJi
0khLAP9+2g1IgFSD0vA1M3uPqS9mK54CvXWvT/+KgFMj04+U5AEAjDGL/J2yGNCs
uKAsNMtA7Mq5Y7xVkuHu857cBMMzPQU=
=HiRV
-----END PGP SIGNATURE-----

--6ux3xtC3FvsADk3y--


--===============1226706283801341647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1226706283801341647==--

