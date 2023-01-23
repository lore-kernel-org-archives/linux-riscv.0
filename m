Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1FEC38142
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 12:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0BRsxCX94d9I/pNCeEK4s1yBZcv0lYiPr9Cn7tbeZM=; b=mYo5TpSNJopeUskA2guYVjE6id
	YkAZc2ElXUwlySX1wvx0C2QYIVuQD37a+cJdhDvlynbPo1P3pwLwc8Jp4KuJyKZP0L1CMW9xGgMYL
	PGdI4GtaJxBlu25tIkUsurDmF84Ki2Bu/OMeYtqZXfWl6Qzzxp1mf0BNycn+FXsE5EnABq6uAgtvm
	kVHTOaF1nDv3JVMMkbch+qwDQJi+cPXtO7l9FM4FJGL5qaL/n6yAs6zGu452nEfUbrZUv+67z+AuV
	kCJWVQtkFNg0fl9yRJLaHFuUKrkiD1eT7FOicA4iqlMXJllLZio7H9sUlFbCb53pYhUxxLQI0TxBo
	4VpPqEMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJvmX-00H2kx-3S; Mon, 23 Jan 2023 12:18:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJvmQ-00H2jr-IB
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 12:18:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674476310; x=1706012310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3zUQoPIQjdr5z56SbkIAZoVsvFdlOUGCvFn9K0j4mGI=;
  b=sITedUpGteIWA3KGPIAp3LjpqR1SMH1JK45eV4YkFz8/1NrS5fG6LGJ4
   tvF4Cnf4DsYQqW0T7jdAZ6Dswds6j4C0dYAO3lptF68jGM2lC5tG0k4dc
   kVnu0Mvu9I6YKzFP2IFTKAYntKDTOQC4xIS5LH8pJSrSYe4I9Ixo8psHX
   kGPqt7+SPRyGEn9II3wI266hP41r7CduJiSfl0z1pBg9r8ZT9dup6538l
   fQo7PYMzJfxk28A//6mFpcksthNf5HkssMetvNVBWCRWSUQoH2X0Gsv4G
   QUjlq84Unq+wZRIlzq/76oWMGT6xxf5gJU0D5FUi9LkoAxJhbNEh5xckw
   g==;
X-IronPort-AV: E=Sophos;i="5.97,239,1669100400"; 
   d="asc'?scan'208";a="133565461"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jan 2023 05:18:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 23 Jan 2023 05:18:14 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 23 Jan 2023 05:18:10 -0700
Date: Mon, 23 Jan 2023 12:17:47 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>
CC: Jeff Law <jlaw@ventanamicro.com>, Richard Henderson
	<richard.henderson@linaro.org>, Vineet Gupta <vineetg@rivosinc.com>, Kito
 Cheng <kito.cheng@sifive.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Vincent Chen <vincent.chen@sifive.com>, Florian Weimer <fweimer@redhat.com>,
	Rich Felker <dalias@libc.org>, Andrew Waterman <andrew@sifive.com>, Palmer
 Dabbelt <palmer@rivosinc.com>, Christoph =?iso-8859-1?Q?M=FCllner?=
	<christoph.muellner@vrull.eu>, <davidlt@rivosinc.com>, Arnd Bergmann
	<arnd@arndb.de>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Szabolcs Nagy <szabolcs.nagy@arm.com>, Greentime Hu
	<greentime.hu@sifive.com>, Aaron Durbin <adurbin@rivosinc.com>, Andrew de los
 Reyes <adlr@rivosinc.com>, linux-riscv <linux-riscv@lists.infradead.org>, GNU
 C Library <libc-alpha@sourceware.org>
Subject: Re: Auto-enabling V unit and/or use of elf attributes (was Re:
 Adding V-ext regs to signal context w/o expanding kernel struct sigcontext
 to avoid glibc ABI break)
Message-ID: <Y8566x/wr31sWKyP@wendy>
References: <CALLt3ThJyH3yihiwq-ZDeP1v5UgQZEsUWNwxOewZBeuocciRJg@mail.gmail.com>
 <b440aeaf-03e6-aa4e-9636-adbf3f841b40@rivosinc.com>
 <3923eeee-e4dc-0911-40bf-84c34aee962d@linaro.org>
 <119da65f-e976-f382-3fe1-1585be738352@ventanamicro.com>
 <8be4d673-f435-429e-9a61-bb49e7820529@linaro.org>
 <6d13e63f-69b3-6e48-b811-bbfcf3ffb3af@ventanamicro.com>
 <CABgGipUAhZNt3gaxEx7mPm20Xw7WNVVppRZ4fxZX-XswA5VG2g@mail.gmail.com>
 <e2a2ef3a-bb5e-0bda-20e5-a2344e7c4cef@ventanamicro.com>
 <CABgGipUCoykzeS5B1wSQxcxumCweRi2RDTKdD8u6ON63DV3EnQ@mail.gmail.com>
 <CABgGipVE3RnrNy1=8nsXUvW0w4XopHQuAzufQ66z6OWvU7wbwA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABgGipVE3RnrNy1=8nsXUvW0w4XopHQuAzufQ66z6OWvU7wbwA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_041830_710269_ACC426DF 
X-CRM114-Status: GOOD (  26.43  )
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
Content-Type: multipart/mixed; boundary="===============8241815562296731569=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8241815562296731569==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/owN1yQB9D8Xo+wZ"
Content-Disposition: inline

--/owN1yQB9D8Xo+wZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Andy!

On Wed, Jan 11, 2023 at 08:13:27PM +0800, Andy Chiu wrote:
> On Wed, Jan 11, 2023 at 5:28 PM Andy Chiu <andy.chiu@sifive.com> wrote:
> >
> > On Wed, Jan 11, 2023 at 2:20 PM Jeff Law <jlaw@ventanamicro.com> wrote:
> > > Fault on first use is well understood and has been implemented on many
> > > architectures through the decades, even with its warts.
> >
> > Unfortunately, we don't have a direct way of acknowledging if an
> > illegal instruction is caused by illegitimate use of V instructions.
> > Unlike ARM64, where reading ESR_EL1.EC is enough to distinguish the
> > fault, we may have to perform a sw decode on the faulting instruction.
> > Then see if it is the first-use fault, or a more general illegal
> > instruction fault.
> After taking more considerations, I think this could be minor. The
> first V-instruction of a valid program that uses Vector is limited to
> vset{i}vl{i}, vl<nf>r, or vs<nf>r. And perhaps some r/w of
> vector-specific CSRs. Decoding these instructions should be relatively
> constraint and easy. And we need this decoding only once for each
> process since we don't have to do lazy save/restore.
> >
> > Yes, we may just enable V for a process whenever we find an OP-V major
> > opcode, or a LOAD/STORE-FP with vector-encoded width on illegal
> > instruction. But it could be kind of messy, IF, later extensions would
> > also like to be enabled at first-use-fault. (e.g. ARM has SME followed
> > by SVE). And implementing this decoding logic in sw just seems
> > redundant to me because hw has already done that for us.
> Let's limit our discussion to the scope of VS enablement for now.
> >
> > Besides, ARM64 has individual mappings of traps for the use of
> > FP-related units in EL1 and EL0. So SIMD running in kernel mode would
> > not take additional instruction to enable the unit. I assume these
> > kinds of CSR-controlling instructions would have to flush hw internal
> > buffers to some extent. And doing these takes additional latencies.
> We already do some VS/FS settings on the entry of kernel code. So this
> should be minor as well.
>=20
> Anyway, I agree that faulting on first-uses is a better way to make
> per-process control of VS feasible.

> Sorry for disturbing the list.

Meh, all of these discussions seem worthwhile to me!

Now that things have died down though, I'm curious - what are your
plans? Still going to submit another version of this series?

Thanks,
Conor.


--/owN1yQB9D8Xo+wZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8566wAKCRB4tDGHoIJi
0kEKAQC/ULqYyI7210QdsatFDvT5mYhk/k1CbaNyY4BaRchOmAEAl4mWEhaGyjF1
YPXTxh9JOrMeeiISlfanCp03GByC0Q8=
=2LlJ
-----END PGP SIGNATURE-----

--/owN1yQB9D8Xo+wZ--


--===============8241815562296731569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8241815562296731569==--

