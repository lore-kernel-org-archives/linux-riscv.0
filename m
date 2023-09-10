Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989D5C71153
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Sep 2023 19:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nbPdNzclkI9cODLPXHCRRcqzGh3jTfqFS4aIoCSn/w=; b=yshgblnsX9I/CRQPOrCcnJKWwd
	bUS+G+X7Rl4n0laho/jM63NqOoImhM1OPSYczEjstD/N1lJV3MVpZRMsSK9Y55vM6tOjX3XWlbqCO
	YmqeQI18MgugeZ8lr7J7GoDhUiq0IewM3fTJDSeQV4ebR2gtLFxHb4+JhRt+u307KIcuOqnllForH
	5YsxoqrxWOqnZih+bF62jLV4tiZfYuvkXSDPLdXoJ1PebTpSoNxCfl8CbVP+211qXD9Bi9RlA97Eh
	Tlpb9PakWpenzOvmFGiAlsML1sjzTtalId/5q3+2WJRYmCUVZIBEJxpvzZpH9mvh0bqyqgFZVtE+D
	dNChu/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfQNZ-00GrO9-1n;
	Sun, 10 Sep 2023 19:45:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfQNW-00GrNX-0p
	for linux-riscv@lists.infradead.org;
	Sun, 10 Sep 2023 19:45:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 719DF60D32;
	Sun, 10 Sep 2023 19:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA571C433C8;
	Sun, 10 Sep 2023 19:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694375152;
	bh=y3LT/R5kddG6jRISOgX3O0b1AfwlsqmAKG5NrInJc5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m4LRUq+GNjS1nxT6CjBfu+Kauv5mxEdU5FGaIxmYPwyn9l674yDbMBakGr//9qPCW
	 HDsmv6ZgT92MGhi5kjsP8Q/gZldYSFC3PD6kji9VI1DLjbB7oSSZcAfOGqc3os7R5m
	 NJuo/islUaX6qqopQMbVNySFN5OwLvDypjthia3kvDAg0//QiwDOaxxJCTh5ujbI+r
	 r3RLRC7Etrmzh7hWVpAS/dNI9hKoAMjpwAQ0xSAm+rqCeFLXHZu6vhPLQBydVbQq12
	 lmXgiiQXbjop+sPE6i0CE7xlE8U8iSP9cZXPcLsbmEBipgj1nnB5RSkO99H0wpVDUR
	 +6F+d2sx4tqHw==
Date: Sun, 10 Sep 2023 20:45:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com,
	longman@redhat.com, boqun.feng@gmail.com, tglx@linutronix.de,
	paulmck@kernel.org, rostedt@goodmis.org, rdunlap@infradead.org,
	catalin.marinas@arm.com, conor.dooley@microchip.com,
	xiaoguang.xing@sophgo.com, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, keescook@chromium.org,
	greentime.hu@sifive.com, ajones@ventanamicro.com,
	jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn,
	leobras@redhat.com, linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 00/17] riscv: Add Native/Paravirt qspinlock support
Message-ID: <20230910-facsimile-answering-60d1452b8c10@spud>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910-esteemed-exodus-706aaae940b1@spud>
 <CAJF2gTRQd_dNuZHNwfg3SwD0XERaYXYUdFUFQiarym40kpxFRQ@mail.gmail.com>
 <20230910-baggage-accent-ec5331b58c8e@spud>
 <CAJF2gTS8Vh5XdMUcgLA_GJzW6Nm3JKHxuMN9jYSNe_YCEjgCXA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTS8Vh5XdMUcgLA_GJzW6Nm3JKHxuMN9jYSNe_YCEjgCXA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_124554_376608_E0BEB68E 
X-CRM114-Status: GOOD (  28.01  )
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
Content-Type: multipart/mixed; boundary="===============2062409954724464004=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2062409954724464004==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FcTODDigvcxHiRXq"
Content-Disposition: inline


--FcTODDigvcxHiRXq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 10, 2023 at 05:49:13PM +0800, Guo Ren wrote:
> On Sun, Sep 10, 2023 at 5:32=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Sun, Sep 10, 2023 at 05:16:46PM +0800, Guo Ren wrote:
> > > On Sun, Sep 10, 2023 at 4:58=E2=80=AFPM Conor Dooley <conor@kernel.or=
g> wrote:
> > > >
> > > > On Sun, Sep 10, 2023 at 04:28:54AM -0400, guoren@kernel.org wrote:
> > > >
> > > > > Changlog:
> > > > > V11:
> > > > >  - Based on Leonardo Bras's cmpxchg_small patches v5.
> > > > >  - Based on Guo Ren's Optimize arch_spin_value_unlocked patch v3.
> > > > >  - Remove abusing alternative framework and use jump_label instea=
d.
> > > >
> > > > btw, I didn't say that using alternatives was the problem, it was
> > > > abusing the errata framework to perform feature detection that I had
> > > > a problem with. That's not changed in v11.
> > > I've removed errata feature detection. The only related patches are:
> > >  - riscv: qspinlock: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
> > >  - riscv: qspinlock: errata: Enable qspinlock for T-HEAD processors
> > >
> > > Which one is your concern? Could you reply on the exact patch thread?=
 Thx.
> >
> > riscv: qspinlock: errata: Enable qspinlock for T-HEAD processors
> >
> > Please go back and re-read the comments I left on v11 about using the
> > errata code for feature detection.
> >
> > > > A stronger forward progress guarantee is not an erratum, AFAICT.
> >
> > > Sorry, there is no erratum of "stronger forward progress guarantee" i=
n the V11.
> >
> > "riscv: qspinlock: errata: Enable qspinlock for T-HEAD processors" still
> > uses the errata framework to detect the presence of the stronger forward
> > progress guarantee in v11.
> Oh, thx for pointing it out. I could replace it with this:
>=20
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 88690751f2ee..4be92766d3e3 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -310,7 +310,8 @@ static void __init riscv_spinlock_init(void)
>  {
>  #ifdef CONFIG_RISCV_COMBO_SPINLOCKS
>         if (!enable_qspinlock_key &&
> -           (sbi_get_firmware_id() !=3D SBI_EXT_BASE_IMPL_ID_KVM)) {
> +           (sbi_get_firmware_id() !=3D SBI_EXT_BASE_IMPL_ID_KVM) &&
> +           (sbi_get_mvendorid() !=3D THEAD_VENDOR_ID)) {
>                 static_branch_disable(&combo_qspinlock_key);
>                 pr_info("Ticket spinlock: enabled\n");
>         } else {

As I said on v11, I am opposed to feature probing using mvendorid & Co,
partially due to the exact sort of check here to see if the kernel is
running as a KVM guest. IMO, whether a platform has this stronger
guarantee needs to be communicated by firmware, using ACPI or DT.
I made some comments on v11, referring similar discussion about the
thead vector stuff. Please go take a look at that.

--FcTODDigvcxHiRXq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZP4c6AAKCRB4tDGHoIJi
0ufzAQDyDyGN2Md5XT9ACjrp5SGyIPvMbchiOqhgvTVmc7yOaQEAxRbNy/jXdJGm
2/gUe8tsoFaT3nlOeKvjVkQDjoH62gk=
=jMZv
-----END PGP SIGNATURE-----

--FcTODDigvcxHiRXq--


--===============2062409954724464004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2062409954724464004==--

