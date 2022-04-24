Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFD1C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Apr 2022 10:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DZUQXJ5DUVNdOjkBfS13YRv5u4j5JwC7mrIHADF4nO8=; b=MLSyW5zVL9g3sM
	LZjLHC1J1M74RlxdvHHBwsv9D/CCPfXdOhAGXrx11+H1KNo+325NdJQlxtMYRSjkm1q68PsHdxg8O
	c0YS6/fV/kzw2S3FX3RJnvhoccLbJs1dr6M8w2CGERyyCXD547p9wqvhHCjDYGx8xkB/xDT5xchqC
	k898zZ5e3CKa2Epw4pIeF+a69rw4l7/lCNwBm7fZEZsoPf/Mn+HIje84nujqTVXv71bSzJxON4TKi
	m0gGj8Ej2O/5G5JlOsc63uM7NA4I/585EsuE4HkGnBxsHXdUEm9yWrAt1kCFDokVEXhes5iVLMDh6
	epjdxG/Ahb4z+CYZAvwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niZqR-006PSv-8C; Sun, 24 Apr 2022 10:51:59 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niZqB-006PPD-Dj; Sun, 24 Apr 2022 10:51:45 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id EFE3992009C; Sun, 24 Apr 2022 12:51:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id E14B792009B;
 Sun, 24 Apr 2022 11:51:38 +0100 (BST)
Date: Sun, 24 Apr 2022 11:51:38 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 LKML <linux-kernel@vger.kernel.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>, 
 Theodore Ts'o <tytso@mit.edu>, 
 Dominik Brodowski <linux@dominikbrodowski.net>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "David S . Miller" <davem@davemloft.net>, 
 Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, 
 Max Filippov <jcmvbkbc@gmail.com>, John Stultz <john.stultz@linaro.org>, 
 Stephen Boyd <sboyd@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, sparclinux@vger.kernel.org, 
 linux-um@lists.infradead.org, X86 ML <x86@kernel.org>, 
 linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH v4 04/11] mips: use fallback for random_get_entropy()
 instead of zero
In-Reply-To: <YmUHBKPC0bAbs4Vj@zx2c4.com>
Message-ID: <alpine.DEB.2.21.2204241140290.9383@angie.orcam.me.uk>
References: <20220413115411.21489-1-Jason@zx2c4.com>
 <20220413115411.21489-5-Jason@zx2c4.com>
 <20220413122546.GA11860@alpha.franken.de>
 <alpine.DEB.2.21.2204131331450.9383@angie.orcam.me.uk>
 <CAHmME9pQ4xdeTUDxAdrOu=S9NRTonYzJVk50fa0Zfz4knZt5WA@mail.gmail.com>
 <alpine.DEB.2.21.2204140014580.9383@angie.orcam.me.uk>
 <YlfoeGRM6w2O+eXA@zx2c4.com>
 <alpine.DEB.2.21.2204142349180.9383@angie.orcam.me.uk>
 <20220418071005.GA4075@alpha.franken.de>
 <alpine.DEB.2.21.2204220029590.9383@angie.orcam.me.uk>
 <YmUHBKPC0bAbs4Vj@zx2c4.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_035143_664627_C1475060 
X-CRM114-Status: GOOD (  16.24  )
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

On Sun, 24 Apr 2022, Jason A. Donenfeld wrote:

> > unconditionally.  I think this discovery asks for code optimisation, which 
> > I'll try to cook up sometime.
> 
> At some point too, by the way, we might also consider putting that into
> a .c file rather than a static inline in the .h, since that function is
> starting to get sort of big.

 This code is supposed to produce one to a couple of machine instructions 
for the majority of configurations.  This is because the conditionals used 
are usually compile-time constants.  Therefore I think it will be good to 
continue having it as `static inline' functions.  Cf. the analysis in 
commit 06947aaaf9bf ("MIPS: Implement random_get_entropy with CP0 
Random").

 If this code does expand to a longer sequence for some platforms, then 
either they need to be verified whether they can be optimised (just as I 
note here for the DEC systems) or we can consider making these functions 
`extern inline' instead, with out-of-line code available from a .a file in 
case the compiler decides the code is too large for inlining to be worth 
doing after all.  Though I don't expect the latter case to be required 
really.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
