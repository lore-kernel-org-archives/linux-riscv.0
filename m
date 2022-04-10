Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A2BC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Apr 2022 14:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pXKE3Et/1f1VqRjXOEp3CKBzrgS/QogoORb0bNKgjkk=; b=qnPB5eDSFXTqc4
	7aZNBdP0qGM+YpZUyHWL6iwjwDOshgFsPxUlJwzs7eBqNwXc8iy0HbKmkaevS6lSmZebljr9vRfU2
	/FpUSogDobCYwr+bA3IxsCwYej8Zt5odrbnOfoXbYAlCICvCKgrbnvERwSA4aPBCuPMQGpl1f6my1
	eea6MFRQ3axvVbNzj1fFX0f1VO0NstTef7ZHe1WpRfetWZE8MtS82cau7wWNDnv3+Fxgxgu1e5T/2
	Mv0FWd7YvvVqL5rk7HT9KPp06WLc+RishNNCDc6Gp6gzgSoQkxX85SoUkjtQIPv3ONPEJJhCNmgk5
	KI4nPSyLk3+Ty7auFI/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndYWG-004y7M-Cz; Sun, 10 Apr 2022 14:26:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndYW4-004y4n-Gd; Sun, 10 Apr 2022 14:26:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 12ED66097C;
 Sun, 10 Apr 2022 14:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C1C7C385A4;
 Sun, 10 Apr 2022 14:26:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Xd0Enayl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1649600764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ACW34jCdChesB8O9mr3A3gFQd+fZkgemUpW2KIQGTs8=;
 b=Xd0Enayl8UdMOLK8hb+p9ElFGR/nkOk182JQ3t/5PAWGrTN3GF03N95qlf3rrZl/Mt+RZI
 7g+OoLToQKHdL9+kdXKajZ1a3hsadEW5sVaIiDYC9L5V8y9LrnjV28ZvqwgrOh6rFPazES
 NrUCO3Ev2CsBJg7e3SN1A3lzDB/MMQU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8a808d78
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Sun, 10 Apr 2022 14:26:04 +0000 (UTC)
Date: Sun, 10 Apr 2022 16:25:52 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 arnd@arndb.de, Theodore Ts'o <tytso@mit.edu>,
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
 Johannes Berg <johannes@sipsolutions.net>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, John Stultz <john.stultz@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, x86@kernel.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH RFC v1 00/10] archs/random: fallback to using
 sched_clock() if no cycle counter
Message-ID: <YlLo8JVOS6FDmWUM@zx2c4.com>
References: <20220408182145.142506-1-Jason@zx2c4.com>
 <87wnfxhm3n.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87wnfxhm3n.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_072612_878574_D1F22340 
X-CRM114-Status: GOOD (  19.37  )
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

Hi Thomas,

On Sun, Apr 10, 2022 at 01:29:32AM +0200, Thomas Gleixner wrote:
> But the below uncompiled hack gives you access to the 'best' clocksource
> of a machine, i.e. the one which the platform decided to be the one
> which is giving the best resolution. The minimal bitwidth of that is
> AFAICT 20 bits. In the jiffies case this will at least advance every
> tick.

Oh, huh, that's pretty cool. I can try to make a commit out of that. Are
you suggesting I use this as the fallback for all platforms that
currently return zero, or just for m68k per Arnd's suggestion, and then
use sched_clock() for the others? It sounds to me like you're saying
this would be best for all of them. If so, that'd be quite nice.


> The price, e.g. on x86 would be that RDTSC would be invoked via an
> indirect function call. Not the end of the world...

Well on x86, random_get_entropy() is overridden in the arch/ code to
call get_cycles(). So this would really just be for 486 and for other
architectures with no cycle counter that are currently returning zero.
However, this brings up a good point: if your proposed
ktime_read_raw_clock() function really is so nice, should it be used
everywhere unconditionally with no arch-specific overrides? On x86, is
it really guaranteed to be RDTSC, and not, say, some off-core HPET
situation? And is this acceptable to call from the hard irq handler?

Not yet having too much knowledge, I'm tentatively leaning toward the
safe side, of just using ktime_read_raw_clock() in the current places
that return zero all the time -- that is, for the purpose this patchset
has.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
