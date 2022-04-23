Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C84C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Apr 2022 23:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z//4svl72BgE4bpulZOVog6PSr5qgfMqIPcr3lTt45E=; b=uWYjPEmsGJaqBJ
	5RHWGU5/Z2nT9NaXeQGsctpiL3PXluHHnkudWUtfePxbj1NwIJvLJ6ytgABx2vmJdBiizBkYwa265
	yLzBhFlbar41R2LYhNfkJOpeK67zSI1B8mVoAreJwcRsUxiMT9qbuyBglEXbucITd7oDoIx3T/lpw
	GiTO7GIMl3RO2/0J/JAhntoBtp8F2wDu8nio4g1ayZ1aEdgg7gPTCfayoyAzXfEeHhS7uRafgK4rS
	a9tho4rnymqh8GHako+XkwhX+aGCqsnQco0uLBlczi2fkZt7duPtt+he4XHfkw2tjUcF9gA7xvdG/
	Y0w72da/wuelFJVS770w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niPGQ-005J9c-8V; Sat, 23 Apr 2022 23:34:06 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niPGD-005J4U-VB; Sat, 23 Apr 2022 23:33:55 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id AD45492009C; Sun, 24 Apr 2022 01:33:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 9D31992009B;
 Sun, 24 Apr 2022 00:33:44 +0100 (BST)
Date: Sun, 24 Apr 2022 00:33:44 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, 
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
In-Reply-To: <20220418071005.GA4075@alpha.franken.de>
Message-ID: <alpine.DEB.2.21.2204220029590.9383@angie.orcam.me.uk>
References: <20220413115411.21489-1-Jason@zx2c4.com>
 <20220413115411.21489-5-Jason@zx2c4.com>
 <20220413122546.GA11860@alpha.franken.de>
 <alpine.DEB.2.21.2204131331450.9383@angie.orcam.me.uk>
 <CAHmME9pQ4xdeTUDxAdrOu=S9NRTonYzJVk50fa0Zfz4knZt5WA@mail.gmail.com>
 <alpine.DEB.2.21.2204140014580.9383@angie.orcam.me.uk>
 <YlfoeGRM6w2O+eXA@zx2c4.com>
 <alpine.DEB.2.21.2204142349180.9383@angie.orcam.me.uk>
 <20220418071005.GA4075@alpha.franken.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_163354_212759_28EAC165 
X-CRM114-Status: GOOD (  21.57  )
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

On Mon, 18 Apr 2022, Thomas Bogendoerfer wrote:

> >  Also the systems I have in mind and that lack a counter in the chipset 
> > actually can make use of the buggy CP0 timer, because it's only when CP0 
> > timer interrupts are used that the erratum matters, but they use a DS1287 
> > RTC interrupt instead unconditionally as the clock event (see the comment 
> > at the bottom of arch/mips/dec/time.c).  But this has not been factored in 
> > with `can_use_mips_counter' (should it just check for `mips_hpt_frequency' 
> > being zero perhaps, meaning the timer interrupt not being used?).
> > 
> >  Thomas, do you happen to know if any of the SGI systems that we support 
> > had buggy early R4k chips?
> 
> IP22 has probably seen all buggy MIPS chips produced, so yes I even own
> Indy/Indigo2 CPU boards with early R4k chips.

 Do they actually use the CP0 timer as a clock event device?  Do they have 
an alternative high-precision timer available?

 In the course of verifying this change I have noticed my DECstation
5000/260, which has a high-precision timer in the chipset available as a 
clock source device, does register the CP0 timer as a clock source device 
regardless.  Upon a closer inspection I have noticed that the CP0 timer 
interrupt is non-functional in this machine, which I have then confirmed 
as a valid CPU hardware configuration via the TimIntDis/TimerIntDis (the 
R4k CPU manual is inconsistent in naming here) boot-mode bit.  It allows 
IP7 to be used as an external interrupt source instead.  I used not to be 
aware of the presence of this boot-mode bit.

 I find this arrangement odd, because IP7 used to be wired internally as 
the FPU interrupt with the 5000/240's CPU module, so it's not usable as an 
external interrupt anyway with this system's mainboard.

 That means however that this machine (and possibly the 5000/150 as well, 
but I'll have to verify that once I get at the KN04 CPU module I have in a 
drawer at my other place) can use the CP0 timer as a clock source device 
unconditionally.  I think this discovery asks for code optimisation, which 
I'll try to cook up sometime.

 I don't expect the IP22 to have a similar arrangement with the CP0 timer 
interrupt given that the CPU was an in-house design at SGI, but who knows?  
Do you?

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
