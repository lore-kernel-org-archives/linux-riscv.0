Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55C0C44508
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 11:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D5ZPl4GgvhN7V7VF2esvtCzP4veEMiEvKuKnJYLge+c=; b=JptX5uyz3aNApW
	gmvz1aPYUVlqUkeYnIiqQ6weEFRMFLRnViUutVGJoZjVa6TRVbS3618nrqgn1MkFxC9O8ovzdJGJk
	olkAR7q41A2NNzrD8cSZi6y7YsNSPrYdLBz/spCZrjie6gU0QS64NPwiAsjNPG/KsxVDG0AsVUivk
	ZN4/m7JYd99KgLVuS2I93JKyxBr2Dt8cXcXZVEac/YjnG6nrkBNgpdfA7Vdn6zu51Pf26ap7HUr8t
	XEnoo9DexrK4FI/vgl1wkdiQrycX5LfXxy6eWhnDhi6QuI+HulnXXWUtyUW2bLFGWV4wvMHNwTmPc
	jH1D7r0ZGJRzgN5PEv7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxRY-0000000EX2F-0qnS;
	Wed, 15 Jul 2026 11:06:24 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxRV-0000000EX1k-2b3E;
	Wed, 15 Jul 2026 11:06:23 +0000
Date: Wed, 15 Jul 2026 13:06:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784113578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=abtaHT+iM35mYhuUa0tFLYJlMk0dWSVeeSAZanDwdRY=;
	b=1Q56+mb7FdmVtn2LseSeElkRG3+cBY0sq+4sHmMi4f8/OYZeRDvn1QWWrZVvm20Zwt/i4f
	KIAA0hrOKzDmyvz4S23yrhyGLvIZRCmqbK+lXs/vw4EjtvY9TwvhZrT4SFIwRbcXWM36Ht
	NmjV4QYTqhBT0YhtgNxnFx6ChnesB2qT9OWe/2+huuby5ySLYRSKFQRlSsc4USNKEHvEMi
	v4Tbe6bg1sDx1548467nYT8272WMWIWeM/13hn+CeQ/BZRsGYQYYl/Rco/ZQ76vm/D2z8M
	f33HH8nfd7NC54hsaeEvjSE4xgoRbcPGNpKluhrSbacyRWjKndBZcwb8z7d+wQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784113578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=abtaHT+iM35mYhuUa0tFLYJlMk0dWSVeeSAZanDwdRY=;
	b=nOtaw3lpuc2tTTbVyR+QigURKy+xRCGuJurFvmtVUN0XYRnH+u6fxhtm7hTWCKyZxAd+BQ
	tpHoDvSyj+3BCeCA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Linux-Arch <linux-arch@vger.kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 3/7] MIPS: csrc-r4k: Replace CONFIG_GENERIC_GETTIMEOFDAY
 ifdeffery with IS_ENABLED()
Message-ID: <20260715125715-5f101707-9307-4e7a-a8eb-698c42aadb21@linutronix.de>
References: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
 <20260709-vdso-arch-clockmodes-v1-3-3fd780bbf851@linutronix.de>
 <87wluwoe1c.ffs@fw13>
 <20260715102751-d1ed7195-f541-484e-9843-73ee4237b7b5@linutronix.de>
 <ee62c755-a15a-41e8-b0bb-7595e9366977@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ee62c755-a15a-41e8-b0bb-7595e9366977@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_040621_808429_34E31FDF 
X-CRM114-Status: GOOD (  20.73  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 15, 2026 at 12:13:06PM +0200, Arnd Bergmann wrote:
> On Wed, Jul 15, 2026, at 10:43, Thomas Wei=DFschuh wrote:
> > On Wed, Jul 15, 2026 at 10:25:19AM +0200, Thomas Gleixner wrote:
> =

> >> -#ifdef CONFIG_GENERIC_GETTIMEOFDAY
> >>  #include <asm/vdso/clocksource.h>
> >> -#endif /* CONFIG_GENERIC_GETTIMEOFDAY */
> >>  enum vdso_clock_mode {
> >>  	VDSO_CLOCKMODE_NONE,
> >> -#ifdef CONFIG_GENERIC_GETTIMEOFDAY
> >> +#ifdef VDSO_ARCH_CLOCKMODES
> >>  	VDSO_ARCH_CLOCKMODES,
> >>  #endif
> >>  	VDSO_CLOCKMODE_MAX,
> >> =

> >> and then you can just unconditionally set clocksource::vdso_clock_mode
> >> in all drivers.
> >> =

> >> No?
> >
> > It will weaken the sanity check in __clocksouce_register_scale() if
> > CONFIG_GENERIC_GETTIMEOFDAY=3Dn. I am not sure what that sanity check
> > is supposed to protect against, so I left it as is.

See [0], where HAVE_GENERIC_VDSO is now VDSO_DATASTORE.
The naming "generic vDSO" does not make much sense anymore.
There are different pieces which are used in various combinations.

> Is there still a reason to even allow CONFIG_GENERIC_GETTIMEOFDAY=3Dn
> when  generic VDSO is enabled? I see that loongarch32 and
> riscv32 are still missing the vdso time support, but that may
> be more a sign that nobody cares enough about performance
> on those targets.

> In particular, riscv64 doesn't even build the vdso32 code for
> compat tasks, which indicates that userspace doesn't actually
> need vdso.

It doesn't build the time bits. But it has the hwprobe bits,
which do need the datastore (which is effectively HAVE_GENERIC_VDSO).

> On loongarch32, the commit adding the vdso said
> GENERIC_GETTIMEOFDAY 'will be supported in future'.

I have no idea if this port is even functional right now.
So far I was unable to run it in QEMU.

> On everything else, GENERIC_GETTIMEOFDAY and HAVE_GENERIC_VDSO
> are already synonyms.

[0] https://lore.kernel.org/lkml/20260709-vdso-have_generic_vdso-v1-0-d2e10=
61f268b@linutronix.de/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
