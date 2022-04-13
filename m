Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46982C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 12:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F0pnD0lQcT3JtB/BIqpU+DgBWlbWbGhVxMFg7vak8Cc=; b=FcT1CYsw6w5nh/
	Cf/9NWwAX/gw0UC1g3b4MV3iXQ5VCj2VV3G359gTruzQEm3omzQxNj1WCk0f0CfiF2McNWnu9jzff
	WuHOqIIyNTc6GZDmL4wKj0Q12cI0ghwfoxXtcV7rqRghiPl5sRl2UAP6dCKi4pyZUxoLDJHI12UJK
	zauIJcF0fl/0R7ABs98wlI/lGw0/fZ8i2OM4vFfMIRFUOt2p63jDcYmIqyF3C6Eyz5XPG+RBM3A7x
	Hq9bFF1U+W7r1nCL33gEsFtClnmx5bhxtOQvdIkUHvOaB4V1AzKYXJB/fb6XjaE5YoUN3/DBONLdu
	xpsqwd67gktzNQ82NoSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1necOX-0013aW-QX; Wed, 13 Apr 2022 12:46:49 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1necOK-0013W2-3V; Wed, 13 Apr 2022 12:46:37 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 3F3EF92009C; Wed, 13 Apr 2022 14:46:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 2EF4892009B;
 Wed, 13 Apr 2022 13:46:29 +0100 (BST)
Date: Wed, 13 Apr 2022 13:46:29 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, tglx@linutronix.de, arnd@arndb.de, 
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
 linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org, 
 linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH v4 04/11] mips: use fallback for random_get_entropy()
 instead of zero
In-Reply-To: <20220413122546.GA11860@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2204131331450.9383@angie.orcam.me.uk>
References: <20220413115411.21489-1-Jason@zx2c4.com>
 <20220413115411.21489-5-Jason@zx2c4.com>
 <20220413122546.GA11860@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_054636_337546_B5A848EB 
X-CRM114-Status: GOOD (  14.99  )
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

On Wed, 13 Apr 2022, Thomas Bogendoerfer wrote:

> > diff --git a/arch/mips/include/asm/timex.h b/arch/mips/include/asm/timex.h
> > index b05bb70a2e46..abc60a6395e3 100644
> > --- a/arch/mips/include/asm/timex.h
> > +++ b/arch/mips/include/asm/timex.h
> > @@ -94,7 +94,7 @@ static inline unsigned long random_get_entropy(void)
> >  	else if (likely(imp != PRID_IMP_R6000 && imp != PRID_IMP_R6000A))
> >  		return read_c0_random();
> >  	else
> > -		return 0;	/* no usable register */
> > +		return random_get_entropy_fallback();	/* no usable register */
> >  }
> >  #define random_get_entropy random_get_entropy
> >  
> > -- 
> > 2.35.1
> 
> Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

 Or we could drop the PRID_IMP_R6000/A check and the final `else' clause 
entirely, as we don't even pretend to support the R6k at all anymore, and 
this is the final reference remaining.  For one we no longer handle the 
CPU in `cpu_probe_legacy' so any attempt to boot on such a CPU would 
inevitably fail as no CPU options would be set (we probably should have a 
`panic' or suchlike as the default case for the switch statement there).

 Therefore I'm all for removing this piece instead, complementing commit 
3b2db173f012 ("MIPS: Remove unused R6000 support"), where it should have 
really happened.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
