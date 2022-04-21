Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9E7C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 19:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OlnDxSUAxLcoc5tV7jKpxpKSdYcMIJONkCrXJwOyGEk=; b=zfW/HP5Qz+x7BX
	wYKuywFjW/WvRgT+zezwjaW4myyXMFhgtCQkA12gdQEIs34ceCMAgfx9PUfz7RzWdsO4APMfYyiSV
	7UePjpwacZGP4gaYsVqymILOD7/pmAjV8geXIvywrMctJFhUJusJNAWWdSB2NXDjVyY1jH4CJgn0D
	Q+1ZcxVAcxtPuvXYahIKcw4g98MOO8zUGLueBnrXJ738Ht2stfkkqOwQX8NgjMu6W0MdYXW/CUr4T
	5KCgqWIpoAXHBoF8RkYEZylhqO12hfbqALh5qibLdQtct9N5pKULv1/UbTU8w9RmvaTFAEm3XZCvE
	nZN7vZScXgapbv/w4N+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhcRS-00EnU1-KC; Thu, 21 Apr 2022 19:26:14 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhcRE-00EnNN-34; Thu, 21 Apr 2022 19:26:02 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 1C9CB92009D; Thu, 21 Apr 2022 21:25:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 18FDA92009C;
 Thu, 21 Apr 2022 20:25:53 +0100 (BST)
Date: Thu, 21 Apr 2022 20:25:53 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
 tglx@linutronix.de, arnd@arndb.de, Theodore Ts'o <tytso@mit.edu>, 
 Dominik Brodowski <linux@dominikbrodowski.net>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "David S . Miller" <davem@davemloft.net>, 
 Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, 
 Max Filippov <jcmvbkbc@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
 Dinh Nguyen <dinguyen@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
 linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, 
 linux-um@lists.infradead.org, x86@kernel.org, 
 linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH v5 04/11] mips: use fallback for random_get_entropy()
 instead of just c0 random
In-Reply-To: <20220419111650.1582274-5-Jason@zx2c4.com>
Message-ID: <alpine.DEB.2.21.2204212018540.9383@angie.orcam.me.uk>
References: <20220419111650.1582274-1-Jason@zx2c4.com>
 <20220419111650.1582274-5-Jason@zx2c4.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_122600_314256_7A3730D0 
X-CRM114-Status: GOOD (  12.22  )
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

On Tue, 19 Apr 2022, Jason A. Donenfeld wrote:

> For situations in which we don't have a c0 counter register available,
> we've been falling back to reading the c0 "random" register, which is
> usually bounded by the amount of TLB entries and changes every other
> cycle or so. This means it wraps extremely often. We can do better by
> combining this fast-changing counter with a potentially slower-changing
> counter from random_get_entropy_fallback() in the more significant bits.
> This commit combines the two, taking into account that the changing bits
> are in a different bit position depending on the CPU model. In addition,
> we previously were falling back to 0 for ancient CPUs that Linux does
> not support anyway; remove that dead path entirely.

Tested-by: Maciej W. Rozycki <macro@orcam.me.uk>

 I've pushed the algorithm through testing with a number of suitable 
systems:

- an R2000A and an R3000A with no timer of any kind, only jiffies,

- an R3400 with a chipset timer only,

- an R4400SC with a usable buggy CP0 counter and a chipset timer,

- a 5Kc with a good CP0 counter only,

with no obvious issues spotted.  Thank you for working on this!

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
