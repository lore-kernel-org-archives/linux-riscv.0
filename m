Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F3BC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 22:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bfvHVdYpqs5xuQIRMiJaQCG6mD1RDnDhQaNB34aSGmI=; b=lAjt5AThcZ5djF
	NLvS+mTfnntUPK/DNebK/mZPKXqCVSeHBKMTmULBVxfWWo4ix2AwogpQTVyjCc91FF9OqGILVqhDN
	NRpPEmAnTfZWslpss5u1Z6UU05B1ugGR6r83WXdWFC35RMvzZkHqKvbyaiKSfq4RrzO9TZ0fjeM2G
	lb4pZ2kMZs6uymSulLdLO/rMgDW9T85/+tRd7eq0u7b/vR7CUEhN8iJTGQj2ACWDDAPxly27tZnDN
	nT6ynKnUiFXU+9XqvGInZlCDrMzwZRAJqkU4Z8xVQdH0bz4WgyJ0YpDH7YYivOCEuHJz+smtkUKS1
	ezZV0fUDlkhpkv9HgUPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nelbT-002xC4-Au; Wed, 13 Apr 2022 22:36:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nelay-002x23-K1; Wed, 13 Apr 2022 22:36:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1372AB82792;
 Wed, 13 Apr 2022 22:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B850C385A3;
 Wed, 13 Apr 2022 22:36:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="L6N8f/L5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1649889372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i/qY7Q5+txJsN2VM3hmo/BuFNHf1fzlowER9ysRVbtU=;
 b=L6N8f/L5F3kc27L5o6JVNnhsxnbpeD3yfPb4LOVd9RcmKfwdi9uZ32ZoNZhmpPx/MqCytQ
 kwF+OZfB0NQboS48NK1NWsY9l+2Mt7lMBfMBzNDUNMXeqrYrrrdzjfH5Arns3xY0tdJ0cG
 mM05NTh/aMQpJvnzU+TE3BbzmmseXYE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cfdbc358
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 13 Apr 2022 22:36:12 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id f17so6303378ybj.10;
 Wed, 13 Apr 2022 15:36:11 -0700 (PDT)
X-Gm-Message-State: AOAM531yWSQHCeM+A3b4YDtjUBhh9RX40p3C7sM4nJwRFy81jzjCh0OV
 3RTBKVSwaJvINsqYiT8phjOkkNfSCSUor5woyJE=
X-Google-Smtp-Source: ABdhPJzIgqKFKpMhZPLEtAEhlDJTJz5RK85xvL5Zr9EJ3NPhLwoCvgqk5B4Jz+dLnTIilLBy7lbr9KCRJA+XIbc15b8=
X-Received: by 2002:a81:1a49:0:b0:2eb:f4cd:b3f1 with SMTP id
 a70-20020a811a49000000b002ebf4cdb3f1mr976064ywa.231.1649889360067; Wed, 13
 Apr 2022 15:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220413115411.21489-1-Jason@zx2c4.com>
 <20220413115411.21489-5-Jason@zx2c4.com>
 <20220413122546.GA11860@alpha.franken.de>
 <alpine.DEB.2.21.2204131331450.9383@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2204131331450.9383@angie.orcam.me.uk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 14 Apr 2022 00:35:49 +0200
X-Gmail-Original-Message-ID: <CAHmME9pQ4xdeTUDxAdrOu=S9NRTonYzJVk50fa0Zfz4knZt5WA@mail.gmail.com>
Message-ID: <CAHmME9pQ4xdeTUDxAdrOu=S9NRTonYzJVk50fa0Zfz4knZt5WA@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] mips: use fallback for random_get_entropy()
 instead of zero
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 LKML <linux-kernel@vger.kernel.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Arnd Bergmann <arnd@arndb.de>, "Theodore Ts'o" <tytso@mit.edu>, 
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "David S . Miller" <davem@davemloft.net>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
 John Stultz <john.stultz@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Dinh Nguyen <dinguyen@kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
 X86 ML <x86@kernel.org>, linux-xtensa@linux-xtensa.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_153616_994118_3E9ED2A1 
X-CRM114-Status: GOOD (  29.72  )
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

Hi Maciej,

On Wed, Apr 13, 2022 at 2:46 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
> On Wed, 13 Apr 2022, Thomas Bogendoerfer wrote:
>
> > > diff --git a/arch/mips/include/asm/timex.h b/arch/mips/include/asm/timex.h
> > > index b05bb70a2e46..abc60a6395e3 100644
> > > --- a/arch/mips/include/asm/timex.h
> > > +++ b/arch/mips/include/asm/timex.h
> > > @@ -94,7 +94,7 @@ static inline unsigned long random_get_entropy(void)
> > >     else if (likely(imp != PRID_IMP_R6000 && imp != PRID_IMP_R6000A))
> > >             return read_c0_random();
> > >     else
> > > -           return 0;       /* no usable register */
> > > +           return random_get_entropy_fallback();   /* no usable register */
> > >  }
> > >  #define random_get_entropy random_get_entropy
> > >
> > > --
> > > 2.35.1
> >
> > Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>
>  Or we could drop the PRID_IMP_R6000/A check and the final `else' clause
> entirely, as we don't even pretend to support the R6k at all anymore, and
> this is the final reference remaining.  For one we no longer handle the
> CPU in `cpu_probe_legacy' so any attempt to boot on such a CPU would
> inevitably fail as no CPU options would be set (we probably should have a
> `panic' or suchlike as the default case for the switch statement there).
>
>  Therefore I'm all for removing this piece instead, complementing commit
> 3b2db173f012 ("MIPS: Remove unused R6000 support"), where it should have
> really happened.

That's fine with me, if that's what Thomas wants to do, and I can
submit a v5 with that in it. Indeed, from our previous conversations,
I'm aware that the `else` there is probably never hit.

However, one thing that I've been thinking about is that the c0 random
register is actually kind of garbage. In my fuzzy decade-old memory of
MIPS, I believe the c0 random register starts at the maximum number of
TLB entries (16?), and then counts down cyclically, decrementing once
per CPU cycle. Is that right?

If it is, there are some real pros and cons here to consider:
- Pro: decrementing each CPU cycle means pretty good granularity
- Con: wrapping at, like, 16 or something really is very limited, to
the point of being almost bad

Meanwhile, on systems without the c0 cycles counter, what is the
actual resolution of random_get_entropy_fallback()? Is this just
falling back to jiffies?

IF (a) the fallback is jiffies AND (b) c0 wraps at 16, then actually,
what would be really nice would be something like:

    return (jiffies << 4) | read_c0_random();

It seems like that would give us something somewhat more ideal than
the status quo. Still crap, of course, but undoubtedly better.

Unfortunately, I don't know enough about whether assumptions (a) and
(b) hold for all hardware that doesn't have the c0 cycle counter. Can
you or Thomas confirm/deny this? And if it is more nuanced than my
optimistic assumption above, can we think of some scheme together that
nicely combines jiffies or the fallback function with the c0 random
register that would be sensible?

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
