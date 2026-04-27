Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4AAFF8861
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 08:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6oiaNsT16g4aRhzTQfWv5NutW6mdDEzYelO32U99DSo=; b=EWTlOyrn1jN5AD
	NlKIhb0Xv/fs4oJc4yGcOvqL5/BmfYIjOmsSvHNdq5PNeSiX7q6IP0H5R0p45dSsi9dmiV6bJFepb
	KK7dJ+3Z3GdQ96m8MdjYkpUK1uZHWEmJU2nRpeZvzuT77EjGQZIa9u7W+SbXE4dT6J1RDu1MESz5k
	2KBlGQMfPghzCb3jYGT4Q6ME+qmbvgsnS79HnlbcXROw8MzpD/kzoGXs1zKB7mZvnqDJMp07CB8X8
	IHHF3fF3Hd41SlTpu+/nXG6rj7mIsQHs13ErPh1XDhOANDn9bJV0kUA+Geh+cXXLpulbwS+k/qcmG
	5KS8bWc9t0S3h2HatqRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHH62-0000000GQks-2Szg;
	Mon, 27 Apr 2026 08:13:38 +0000
Received: from forward500a.mail.yandex.net ([2a02:6b8:c0e:500:1:45:d181:d500])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHH5x-0000000GQjq-448H
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 08:13:36 +0000
Received: from mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net [IPv6:2a02:6b8:c18:31e:0:640:f144:0])
	by forward500a.mail.yandex.net (Yandex) with ESMTPS id 81879C0AC0;
	Mon, 27 Apr 2026 11:13:24 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net (smtp) with ESMTPSA id KDTCRrjSvuQ0-3CY91MG5;
	Mon, 27 Apr 2026 11:13:23 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1777277603; bh=bguIh7S91p2DCDtxXX7BhTfTOrelXjmYTi2yJflThDg=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=kx74GM6mfiZoHCwDnVaCKFWQ3Loq9lMSRWEtNL9JgTJeoy5v1unbGsiybMz5o70Qq
	 Rh+fvprK3YW7PKcd9vtVX/koi173Jb0B8M95qwj7+2YVdKqlYU2NDSRAt4qIwA8TQz
	 67tlQ+eHioA0ELqVSI+ZzAgV0hN74yEs2T/o5xGE=
Authentication-Results: mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Message-ID: <df673a44d292bb3df498b78a8b637f880e28931f.camel@yandex.ru>
Subject: Re: [PATCH v6 0/3] riscv32 library enhancements and build fixes
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Charlie Jenkins	
 <thecharlesjenkins@gmail.com>, Alexandre Ghiti <alex@ghiti.fr>, Ard
 Biesheuvel	 <ardb@kernel.org>, linux-riscv@lists.infradead.org,
 linux-efi@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Mon, 27 Apr 2026 11:13:20 +0300
In-Reply-To: <20260425143631.e20246946f59925c5eb8dc22@linux-foundation.org>
References: <20260425185151.477442-1-dmantipov@yandex.ru>
	 <20260425143631.e20246946f59925c5eb8dc22@linux-foundation.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_011334_549518_258B0BCC 
X-CRM114-Status: UNSURE (   9.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 2026-04-25 at 14:36 -0700, Andrew Morton wrote:

> I didn't upstream "lib and lib/cmdline enhancements v9" this cycle.

You don't have to upstream v9. Because v9 is v8 + initial RISC-V build
fix, which is a part of another series (this one) now. The proper sequence
is v8 + this series.

> So can we please sort through these things (and the AI review) before
> adding more?

Not sure about AI but hopefully human should realize that I'm not an
expert in m68k/sparc32/xtensa/csky/[your favorite arch here]. Enabling
and running the test on _all_ architectures where it is expected to 
work requires obtaining (or even building by myself) a cross-compiler,
setting up the kernel and QEMU, etc. I've spent a reasonable time with
RISC-V and ARM and hopefully set up a good starting point for 
m68k/sparc32/xtensa/csky/[your favorite arch here] maintainers, who are
free to incorporate the test into their target architecture.

I'm going to fix everything I consider reasonable, submit v7 and give up -
because without even a single reply from core RISC-V maintainers, this
just turns into an endless brain masturbation.

Dmitry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
