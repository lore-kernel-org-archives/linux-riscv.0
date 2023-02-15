Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64CCC636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 21:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MxkxKiyHfJV9BXmqzto5rWAak7RPhdfn5hjroHpO0Y=; b=HX0G8JzMXG0fvBeZ5oLaZukFsY
	1J0SsOfAVRV3dzcbdiqAE0sR6a6/He6mKIgnUkCvqtGf+/9cNzHxD1bjNi4AvxqyDR4TXn+/WRShh
	HWFVNdBelLfxgBjqSVF17AZXcSfYHlGtAbOkd6sAlTrM9nMw3E33gZ1GEDRHTMNQW+OnQ4LkutrNn
	UpV477cZi/aef+TiDBUfUl20UGqZw9wLOmbf5KzGvTgWe6pohvkEjVOMlFVcOAAZNeKFfwZOitFoT
	Clyqz2uF6itTB9K6ErLUKs86FikDG8zhWY52CAWBciQr/TvPVNMqy8KxoUeV3NqzFJ/BNjb04gtjZ
	jLXbURIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSPC4-007VjA-AV; Wed, 15 Feb 2023 21:20:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSP2w-007QQ1-HY
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 21:10:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 079C5B823B4;
	Wed, 15 Feb 2023 21:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD239C433EF;
	Wed, 15 Feb 2023 21:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676495430;
	bh=LXv5NbdP319xIVX/V4C8aNo/sUcwxbNvU0xc1wh5zxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J6/UocltX37EVuikcnvQ48hV2zPcy0xUrU+46pgSsk2UdjyXM2V8YXO120VReCWdC
	 pgyhGeAQFGp/zpUVm+AgdSIqSrHclqUmtV1NiCgT3Mzmj2WqgrRnNddGIit5E5/GCX
	 eEHZVEzYOHLMb27wxeB7qEB1217sehEHwbdxiyDbsg9TtMk+a3NjDxZ//HzBlhmq8b
	 Vil6sn2EblzVsPq9nmx8H8j1bRHLN9+dl7kPqmHDgqfNN3bvxSW29mAfMUJVs2D5rn
	 idJOaqa6w9l9XYKJpVlrbXFcqxrGh3qZA9ZQciXUwLoAXJb75IMyFm9NvWIXm5OHs/
	 FneqLuUc6mcXg==
Date: Wed, 15 Feb 2023 21:10:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v2 2/6] RISC-V: Add a syscall for HW probing
Message-ID: <Y+1KPzh9xnyKXf0W@spud>
References: <20230206201455.1790329-1-evan@rivosinc.com>
 <20230206201455.1790329-3-evan@rivosinc.com>
 <Y+wedUsNEfWsKU5I@spud>
 <CALs-HssScpGxAN+TBA8PtaVHwJvmudqmXUaSZDFBiu3k4Tb3nw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALs-HssScpGxAN+TBA8PtaVHwJvmudqmXUaSZDFBiu3k4Tb3nw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_131034_939516_6654A082 
X-CRM114-Status: GOOD (  25.58  )
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
Cc: heiko@sntech.de, linux-doc@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Celeste Liu <coelacanthus@outlook.com>, slewis@rivosinc.com, Bagas Sanjaya <bagasdotme@gmail.com>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Tobias Klauser <tklauser@distanz.ch>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, vineetg@rivosinc.com, Dao Lu <daolu@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ruizhe Pan <c141028@gmail.com>, Anup Patel <apatel@ventanamicro.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>
Content-Type: multipart/mixed; boundary="===============2788932184645895325=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2788932184645895325==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zwbBbfnbfySmFPq0"
Content-Disposition: inline


--zwbBbfnbfySmFPq0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

heh, this came in right as I went to check out by branch with this on it
and look at the rest of the series.

On Wed, Feb 15, 2023 at 12:49:35PM -0800, Evan Green wrote:
> On Tue, Feb 14, 2023 at 3:51 PM Conor Dooley <conor@kernel.org> wrote:
> > On Mon, Feb 06, 2023 at 12:14:51PM -0800, Evan Green wrote:

> > > +On success 0 is returned, on failure a negative error code is return=
ed.
> > > +
> > > +The following keys are defined:
> > > +
> > > +* :RISCV_HWPROBE_KEY_MVENDORID:: Contains the value of :mvendorid:, =
as per the
> > > +  ISA specifications.
> >
> > "per the ISA specifications" sounds like dangerous wording to me! ;)
>=20
> I can replace "per the ISA specifications" with "as defined by the
> RISC-V privileged architecture specification" to try and make that
> more crisp.

Meh was a comment about not trusting the ISA specs, not an attempt to
be a pedant!

> > > +#define RISCV_HWPROBE_KEY_MVENDORID  0
> > > +#define RISCV_HWPROBE_KEY_MARCHID    1
> > > +#define RISCV_HWPROBE_KEY_MIMPID     2
> > > +/* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
> >
> > Can't wait for that to get forgotten!
>=20
> I know. I could add an if (pair->key > RISCV_HWPROBE_MAX_KEY) goto
> unrecognized_key, with a label at the default switch case, which would
> effectively be a runtime guard against it. I opted not to as it's
> aesthetically harsh, but anyone can holler if they want it.

The other question to ask is, do we need RISCV_HWPROBE_MAX_KEY?
What's it for?

> > > diff --git a/arch/riscv/include/uapi/asm/unistd.h b/arch/riscv/includ=
e/uapi/asm/unistd.h
> > > index 73d7cdd2ec49..37d47302322a 100644
> > > --- a/arch/riscv/include/uapi/asm/unistd.h
> > > +++ b/arch/riscv/include/uapi/asm/unistd.h
> > > @@ -43,3 +43,11 @@
> > >  #define __NR_riscv_flush_icache (__NR_arch_specific_syscall + 15)
> > >  #endif
> > >  __SYSCALL(__NR_riscv_flush_icache, sys_riscv_flush_icache)
> > > +
> > > +/*
> > > + * Allows userspace to probe
> >
> > That comment looks chopped off midway through.
>=20
> Whoops yes I

If you could flesh it

--zwbBbfnbfySmFPq0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+1KPwAKCRB4tDGHoIJi
0l4jAQC5f22UHoBH9B38kKxuqJs2n7jbwpZ1NT72Yf+ICx9A3wEAjuni8MRfDtah
gewzRaPArS9ppGWzmN05UCl5coAFeA0=
=izTC
-----END PGP SIGNATURE-----

--zwbBbfnbfySmFPq0--


--===============2788932184645895325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2788932184645895325==--

