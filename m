Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89BDC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 20:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sCrcLsTpVjeEPEsMueWiHTTWBQKA4XrDTVqy71vYJN4=; b=PmGX0WiqISNyf4
	r8vVsxpyFfVxvdskG0VE+ubAXO3xvebP6UDbHTToQcqgKCAeLmusuomrkemqhVD3VsaSL2S5jJwJ9
	5VxApPJc4C5dVu8Dt7iphGAdbClSzq86S5pxZwf8NMVSodKHWehWraMelT9UNCgEVmexUE2YZHBrx
	5E8TZ1L7Qd+TnpG0TeVwq4Cl3/FYi2wPcWKqf2f8eBsIq6EWaxCgcFF3/MnNrFtLuxlhMA5bfCII1
	jkzIRHzVSZ6rwxP6xbXf3CUI15zMq6HLf7u17I9Hv95GYiZNZ6naPBM08kYJt3zUKt1ai7UuLd0Il
	bw29umipjrz2wR7DO0EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhczp-00Er6f-D8; Thu, 21 Apr 2022 20:01:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhcze-00Er4w-3A; Thu, 21 Apr 2022 20:01:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A5BB361CC4;
 Thu, 21 Apr 2022 20:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 993E0C385A7;
 Thu, 21 Apr 2022 20:01:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="p1rCsstD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1650571288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IVI0f+ocmJtlhFxk/uZrvdqDTyR8lckMkgJ5ub79Rvw=;
 b=p1rCsstDY+JGXxBzBD8RxnwrQNMMzB+WgcwwNQro9w0FkVEZFIk2MgsTUS/eNnBXBF3xe5
 SNtQCAeqBggun1Zp7cddgyOMf16AtiU/ka3vJK97HlPHcJ0PDUUcQkm4mUz5D/r/Ip6EZH
 JiN/EEeSnlDeeOtjIcu/cEePG27U+0Q=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6139d1eb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 21 Apr 2022 20:01:27 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 y27-20020a4a9c1b000000b0032129651bb0so1035831ooj.2; 
 Thu, 21 Apr 2022 13:01:27 -0700 (PDT)
X-Gm-Message-State: AOAM532SEr0Qs5sCC4M0Fb66VtSv4yezi+DgY4QZE2TJl+aMQG1XFCco
 GHqzLVgdg4cTGhRn5cnQ7yGB3TRPe+E89suehjw=
X-Google-Smtp-Source: ABdhPJw1yKUuvp2WFU2NDFEJJ0fy26Ib6CtYqZu+dI6yF4MSf/3YsV3ORuUj8k41EwOAXPlE3IINgUUtio0oQHxF65c=
X-Received: by 2002:a81:1a49:0:b0:2eb:f4cd:b3f1 with SMTP id
 a70-20020a811a49000000b002ebf4cdb3f1mr1435082ywa.231.1650571274982; Thu, 21
 Apr 2022 13:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220419111650.1582274-1-Jason@zx2c4.com>
 <20220419111650.1582274-5-Jason@zx2c4.com>
 <alpine.DEB.2.21.2204212018540.9383@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2204212018540.9383@angie.orcam.me.uk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 21 Apr 2022 22:01:03 +0200
X-Gmail-Original-Message-ID: <CAHmME9o5D93M3P_xcewOBfPisbC2d-x3HYvJPFGUoC6oG_RkgA@mail.gmail.com>
Message-ID: <CAHmME9o5D93M3P_xcewOBfPisbC2d-x3HYvJPFGUoC6oG_RkgA@mail.gmail.com>
Subject: Re: [PATCH v5 04/11] mips: use fallback for random_get_entropy()
 instead of just c0 random
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: LKML <linux-kernel@vger.kernel.org>, 
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
 Stephen Boyd <sboyd@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 sparclinux <sparclinux@vger.kernel.org>, linux-um@lists.infradead.org, 
 X86 ML <x86@kernel.org>, linux-xtensa@linux-xtensa.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_130134_235235_6918EEF5 
X-CRM114-Status: GOOD (  22.83  )
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

On Thu, Apr 21, 2022 at 9:25 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
> On Tue, 19 Apr 2022, Jason A. Donenfeld wrote:
>
> > For situations in which we don't have a c0 counter register available,
> > we've been falling back to reading the c0 "random" register, which is
> > usually bounded by the amount of TLB entries and changes every other
> > cycle or so. This means it wraps extremely often. We can do better by
> > combining this fast-changing counter with a potentially slower-changing
> > counter from random_get_entropy_fallback() in the more significant bits.
> > This commit combines the two, taking into account that the changing bits
> > are in a different bit position depending on the CPU model. In addition,
> > we previously were falling back to 0 for ancient CPUs that Linux does
> > not support anyway; remove that dead path entirely.
>
> Tested-by: Maciej W. Rozycki <macro@orcam.me.uk>
>
>  I've pushed the algorithm through testing with a number of suitable
> systems:
>
> - an R2000A and an R3000A with no timer of any kind, only jiffies,
>
> - an R3400 with a chipset timer only,
>
> - an R4400SC with a usable buggy CP0 counter and a chipset timer,
>
> - a 5Kc with a good CP0 counter only,
>
> with no obvious issues spotted.  Thank you for working on this!

Thanks for all the testing!

ThomasB - I think maybe you can re-"Acked-by" this now if you're on
board with the strategy here?

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
