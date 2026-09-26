Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0512C98332
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 12:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kx3beoPu5EyxgM1yXq9YQKnfLYaNtvshsUyZU7MsQOg=; b=Xy2PTWljVsFY0C
	oSdK0z48VSVQ8CrtUfxaahsfjDwe6oSKXkiwExGSYx3j2bCbHxf3/rbeJSW7TuVQcfZ9ZfV9My/mj
	7bgRQ9tx9vALRzypxHyySjYteAd4ekaWpE/RZVPdAjZN/K4YdsvjWeIdKAeAXbUiDlxh6kO7soMa/
	W3WrestipxZXZ3P+Go7s6i31I47RzdmX8FZ3c2JrIG7+lHJyDd5hRfTrzSVe7Y89UOLfJz92D0aK/
	3/XghlGDFVz4PAQsK3XH0yIogmvjnMqwaJWn+ZmYzDIb2LxBiiobbFMoo6VQO+2Nsay/a+YIPhQ7s
	WoJTzATOekTevfnV4peg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xARaU-0000000FNpe-1ddo;
	Sat, 26 Sep 2026 12:33:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xARaS-0000000FNoz-3ryW;
	Sat, 26 Sep 2026 12:33:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DB1AB6020C;
	Sat, 26 Sep 2026 12:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15541F000FF;
	Sat, 26 Sep 2026 12:32:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=jlCeeByi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1790425978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wN9D2nKA01y/2x8IJdWZfEnnjMzwFRK3N4mVnSJjkBY=;
	b=jlCeeByiKyNAkRDIl4L4BWyGHQY1JK/6GovcSrkf8oXtiWNghruM3MspMqAjQRrS0A5Y4N
	9+00l0im2/J3X1CtQ1hGQXUesbacPr8oKkkGy3jQrUfnbQNxrABBNqKeaKwtQlF9FRtom+
	IijiL9NA1TH1lfYG6igzuyjRxzyvjCg=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 6d775622 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sat, 26 Sep 2026 12:32:58 +0000 (UTC)
Date: Sat, 26 Sep 2026 14:32:49 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
Message-ID: <are7cfMIHZZn6jLz@zx2c4.com>
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
 <87zex4ic68.fsf@linux-m68k.org>
 <20260926121927.GA1486962@ax162>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260926121927.GA1486962@ax162>
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

On Sat, Sep 26, 2026 at 01:19:27PM +0100, Nathan Chancellor wrote:
> On Sat, Sep 26, 2026 at 11:39:43AM +0200, Andreas Schwab wrote:
> > On Sep 25 2026, Nathan Chancellor wrote:
> > 
> > > +#if __has_builtin(__builtin_memset_inline)
> > > +#define memset_inline(dst, value, size) __builtin_memset_inline(dst, value, size)
> > > +#elif IS_ENABLED(CONFIG_CC_HAS_OPT_INLINE_MEMSET)
> > > +#define memset_inline(dst, value, size) __builtin_memset(dst, value, size)
> > > +#else
> > > +static inline void *memset_inline(void *dst, int value, size_t size)
> > > +{
> > > +	char *d = dst;
> > > +
> > > +	while (size--)
> > > +		*d++ = value;
> > > +
> > > +	return d;
> > > +}
> > > +#endif
> > > +
> > 
> > memset actually returns the original pointer, not the incremented one.
> > Nothing uses the return value of memset_inline here, but it is
> > confusing.
> 
> Whoops, good catch, I guess my fingers gave up on those last two
> characters :) I will fix this for v3 once there has been some time for
> further review.

Do we even need to return a value at all? Might as well just make the
function two lines:

+       for (char *d = dst; size--;)
+               *d++ = value;

(Technically that could even be one, but maybe that sort of golf loses
clarity. Your choice.)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
