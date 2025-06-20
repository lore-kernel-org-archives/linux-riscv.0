Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8228C7115C
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 13:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TROvU9tPal8SZD5LYgI9I+B4T25xHqHx56JC7NcpHQU=; b=awOXLT8Cq7TEag
	6V9H66ySzQtyO95gu6tWn+ltzGUfym4giSrahDs0IMB0gin738bRKuWAERMlkGsNwd1W2uTmZl+J5
	KBFSFCen/OolQPhnJyZ1hl7PqIfzOODzqlSHRMFf8Hu5uYttu4gWDHoB8N8Hduag4wWqLpHuUeSkp
	OtHh5DxBuS+TsCNp0PTzlANn1gX0P3lyzBZD/NHKn0HawOT3m6l1ZXp7AVD0HCbNvvhqOhdwG4O0l
	EV6sdAgyM1gEgey9kx6oK7j8ssn+EA9rFA6IwMEvi8uVhR/keaaY/eqmpsXzNTI9nhxyLTp4Zx/GK
	ABF6KgkxxCijQl+wjx7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSc21-0000000FlNr-1iUY;
	Fri, 20 Jun 2025 13:43:49 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSc1y-0000000FlMy-1ZKy
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 13:43:47 +0000
Date: Fri, 20 Jun 2025 15:43:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750427024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6e5LiVdLYV1MWzKzm2m1QtrQk2Nr/rVHB48W5asO8Cg=;
	b=Uek3h/ox5BdHyjedKfonkpQexvpQ9o7KIUuDiu7fe3874JF9ZCdFhjafKo2geauJlK8u0N
	5St4VbJtIg8TijyGaDbDPyFiiiPNuR6uTpnJHYZGQQdTJVrwuBzSOlxXHy83CoTYg5zrmi
	UHVRZc9YwXxrYARSdqnBI1nyTX1KRtp0+s8naFhXeR0NQdiFnJy+YG02GPyU6IZWToqS30
	HGdped6jS8ckUjTlEUMAmyV1Y1AZDt74DxeulpgQufmVZbFR1HIbdXMVcy1VHfruB7+W8z
	ia6+enwyHC3umAf6Vv69ImHbaKaq4TCnZo0sSY8v4qt5x+esnqoXl2CGYOVlWA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750427024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6e5LiVdLYV1MWzKzm2m1QtrQk2Nr/rVHB48W5asO8Cg=;
	b=hj9fDcoQDkyXcjztkkuYK+FdVDHyH2XXIcdl+2TM6PadC4dD9JUEMU+mDkWDXpM8kEkwz0
	BIGtpZnNbb1N+6Cg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: David Gow <davidgow@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Willy Tarreau <w@1wt.eu>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <rmoar@google.com>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, workflows@vger.kernel.org
Subject: Re: [PATCH v3 13/16] kunit: Introduce UAPI testing framework
Message-ID: <20250620152344-fadbb8ae-0a86-4938-b05d-00da66fc05c5@linutronix.de>
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
 <20250611-kunit-kselftests-v3-13-55e3d148cbc6@linutronix.de>
 <CABVgOSmdcOZ0+-k=SM4LibOVMKtcbF27p6N40kuDX_axTPZ=QQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABVgOSmdcOZ0+-k=SM4LibOVMKtcbF27p6N40kuDX_axTPZ=QQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_064346_557007_6652EA2F 
X-CRM114-Status: GOOD (  25.71  )
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

On Fri, Jun 20, 2025 at 05:47:39PM +0800, David Gow wrote:
> On Wed, 11 Jun 2025 at 15:38, Thomas Wei=DFschuh
> <thomas.weissschuh@linutronix.de> wrote:
> >
> > Enable running UAPI tests as part of kunit.
> > The selftests are embedded into the kernel image and their output is
> > forwarded to kunit for unified reporting.
> >
> > The implementation reuses parts of usermode drivers and usermode
> > helpers. However these frameworks are not used directly as they make it
> > impossible to retrieve a thread's exit code.
> >
> > Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> >
> > ---
> =

> It feels to me like there are three features hidden in here:
> - KUnit helpers for manipulating vfs files
> - A way of having KUnit tests run userspace helpers
> - The full framework for writing/running whole tests in userspace.
> =

> It's really the first two which excite me personally most -- as they
> give us a sort-of inverse to the kselftest "helper module" paradigm --
> so we can test things which are impossible to test from within
> kernelspace.

For me it is only the third feature that I really care about right now.
But I do expect users for the first two to pop up at some point and these a=
re
obviously valid usecases.

> So maybe those APIs should be exposed separately (so a
> test can be written mostly in kernel-space using the KUnit framework
> APIs, and just call out to a helper where needed). But I'm happy for
> them to stay private functions until we have a test which actually
> needs them.

Agreed, let's expose it when there are users.

> > Currently this depends on CONFIG_KUNIT=3Dy as it uses some non-exported
> > symbols around process management.
> =

> That's fine for now, IMHO, but will make it difficult to use this on,
> e.g., Red Hat setups, where CONFIG_KUNIT=3Dm. Hopefully we can resolve
> this by exporting some of the symbols?

I'll try to use the new EXPORT_SYMBOL_GPL_FOR_MODULES() on these symbols and
see what the maintainers say about it.

> In general, I'm happy with the implementation here. The fs stuff
> probably needs a closer look from someone who knows the vfs better
> than me, though.
> =

> Nevertheless,
> Reviewed-by: David Gow <davidgow@google.com>

Thanks

> =

> Cheers,
> -- David
> =

> > ---
> >  Documentation/dev-tools/kunit/api/index.rst |   5 +
> >  Documentation/dev-tools/kunit/api/uapi.rst  |  12 ++
> >  include/kunit/uapi.h                        |  24 +++
> >  lib/kunit/Kconfig                           |  10 +
> >  lib/kunit/Makefile                          |   2 +
> >  lib/kunit/uapi.c                            | 287 ++++++++++++++++++++=
++++++++
> >  6 files changed, 340 insertions(+)

<snip>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
