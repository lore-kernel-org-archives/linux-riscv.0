Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C996C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Apr 2022 08:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pykS8C+mDmdbF2KIzeeFkWqR3VhiCPzGbsShVoSAV2c=; b=SVC5WvIq73k69U
	mUFwU69wMUX4bg0wcQVkzXWyLp458NsY3MyTW/zmCo2TvWIXSvcopcoAj/F2YJxIXTSpPkc35c8W8
	U3LID/gdhGeEaLNCHlGwh/vo5QC6kbrrSfWOY+ZsOQqqA5LfXrCrMSeRs3avuCmhT7ju+RKpOCtow
	TFAE2+mM3/39dpO8h0coBP2FCDL7MUUEOGZ81sPGwHKJkZJX3SkW/XpNEubhPB8k5f4A8uSPVJ0bt
	lzO4gf2Zr5bDxaBzN/MtKDfa/AMzuKXpoD+J9ZCme32vOygbe6KYPkkOud8nx641UrwubM3D4UZIo
	hAlqoXSaw9E0MjfOh+Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niXOv-0066vh-QG; Sun, 24 Apr 2022 08:15:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niXOk-0066u1-9n; Sun, 24 Apr 2022 08:15:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 964646129B;
 Sun, 24 Apr 2022 08:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B901C385A9;
 Sun, 24 Apr 2022 08:15:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="QQ7PQLbi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1650788106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zz5BWAECMqgYeyzIQatgn1YdaIX48xI6Btjx4R/QQM8=;
 b=QQ7PQLbiv6h5RMKfyhPz+0uFS/QEk6cKxIFEdT/4w1vomvJYaek1ix2z1YnXUltNn4JNWs
 ns72gMmUvnu2yAgEipWd73LYk7yThx0ACLC9UkoUd4mMs7onmV4qUH+mMgtRSeZCBhTJ5t
 iZcOlpmCAAcVo/uGzHHPVJkmoTKoYzY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a4e3a24b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Sun, 24 Apr 2022 08:15:06 +0000 (UTC)
Date: Sun, 24 Apr 2022 10:15:00 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
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
 Johannes Berg <johannes@sipsolutions.net>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, John Stultz <john.stultz@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 X86 ML <x86@kernel.org>, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH v4 04/11] mips: use fallback for random_get_entropy()
 instead of zero
Message-ID: <YmUHBKPC0bAbs4Vj@zx2c4.com>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2204220029590.9383@angie.orcam.me.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_011514_637542_6A55D914 
X-CRM114-Status: GOOD (  12.80  )
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

On Sun, Apr 24, 2022 at 12:33:44AM +0100, Maciej W. Rozycki wrote:
> unconditionally.  I think this discovery asks for code optimisation, which 
> I'll try to cook up sometime.

At some point too, by the way, we might also consider putting that into
a .c file rather than a static inline in the .h, since that function is
starting to get sort of big.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
