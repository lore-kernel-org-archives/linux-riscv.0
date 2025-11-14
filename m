Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1E0CE7B08
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 13:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7BmOD5cHU6hR15w1rFQO0NoT1iXnFZBYiEkkp1MKeXg=; b=uAdS3LPw+S/nsd
	o62bZbN96BMZAwIZNFnhKgNUfGxXb9c7wlZ8zxvT4kOO9qpJ34N0CeZyDdBHxWMzXhLvMoXAXwrwS
	bpJ3ckofzEJgJ6n415RGYFoP1+fwVd1wKPv216vKkuv1W6ymo7ST3SG4My4v4mrWZhtNoFUMA1Noz
	OMWITdA2VdI26qXS7s0pn19h3tf5AjqL0576L99WlUA2fqOLVdg0i+EO+TX0ohcN61bxwp2f4WIvi
	J4e3+pEXgB/Rb/a6MRr1N6RP10+l+QprqRSPtAM42//kuAdwChnB0nAlKt8UyYQEE4B14b2L20OJ0
	a6R1suX5RI+hZs3Oxnfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJu5O-0000000CI1z-0wKN;
	Fri, 14 Nov 2025 13:43:34 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJu5L-0000000CI19-2bVV
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 13:43:32 +0000
Date: Fri, 14 Nov 2025 14:43:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763127807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xQUB6KjOBhp5NcnouuFZQn81BWCzOQnuwQGVzcoOc6s=;
	b=gIRir/4Lzgj/mHOd7JZaVUa1E9UZ0Kp6SBQjTGTYc3zBB9Uccw1PDQZgKCugDD7SNkLJc4
	rWTA1bZOYnnxFBU1c3I5+6pxafi3efAKVcvOfQxa8mYLHkao6U1a+WgjquQRNJGq7KMi70
	KU9KOzGVJgkI8JKU94Xqv5bvdlgDzk5qNnnCwypNirbyc7n9xcDwwQTJr5+ysJL63QDwuN
	v4Zoxyc9j/Niyifj12WxqFysmUyas8fb1CvF8xpXQm6Uqhxo+L+tYv/l1uziRIrJw4fWPL
	jpQKVyMnpupxpF8qCOOc7QA9LHCLSTU3hyevSChE6sWIUtC5QvXQSjxHIH2nHg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763127807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xQUB6KjOBhp5NcnouuFZQn81BWCzOQnuwQGVzcoOc6s=;
	b=PJp/vBSmzIi+3+3HURui2pgktdSqU9eraGxE64lkXGPNdO6ZlBzcYl1MFyPqJRIG+bG6hX
	hK2GxotHfbZs93BQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, 
	Nicolas Schier <nsc@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 01/10] kbuild: don't enable CC_CAN_LINK if the dummy
 program generates warnings
Message-ID: <20251114143845-ff0d3849-4495-469c-b9c1-bebf2e8808db@linutronix.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <20251014-kbuild-userprogs-bits-v2-1-faeec46e887a@linutronix.de>
 <20251114042741.GA3582402@ax162>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251114042741.GA3582402@ax162>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_054331_801704_0E228597 
X-CRM114-Status: GOOD (  23.65  )
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

On Thu, Nov 13, 2025 at 09:27:41PM -0700, Nathan Chancellor wrote:
> On Tue, Oct 14, 2025 at 03:05:16PM +0200, Thomas Wei=DFschuh wrote:
> > It is possible that the kernel toolchain generates warnings when used
> > together with the system toolchain. This happens for example when the
> > older kernel toolchain does not handle new versions of sframe debug
> > information. While these warnings where ignored during the evaluation
> > of CC_CAN_LINK, together with CONFIG_WERROR the actual userprog build
> > will later fail.
> > =

> > Example warning:
> > =

> > .../x86_64-linux/13.2.0/../../../../x86_64-linux/bin/ld:
> > error in /lib/../lib64/crt1.o(.sframe); no .sframe will be created
> > collect2: error: ld returned 1 exit status
> > =

> > Make sure that the very simple example program does not generate
> > warnings already to avoid breaking the userprog compilations.
> > =

> > Fixes: ec4a3992bc0b ("kbuild: respect CONFIG_WERROR for linker and asse=
mbler")
> > Fixes: 3f0ff4cc6ffb ("kbuild: respect CONFIG_WERROR for userprogs")
> > Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> =

> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thanks!

> While this makes sense as a way to immediately fix the problem and align
> cc-can-link.sh with the other test functions like cc-option and like, it
> is rather unfortunate that this particular warning causes an error since
> the rest of the userprogs infrastructure does not care about SFrame...
> I wonder if there is a way to avoid it since I think this warning does
> not point to a fundamental problem.

I did not find any way to avoid this specific warning, unfortunately.
This patch should make sense in any case. If we find a way to avoid the
sframe warning then that should go on top.

(...)


Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
