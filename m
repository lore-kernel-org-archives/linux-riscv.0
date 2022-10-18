Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE301C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 13:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ZN6Eca/UYogP3kWYvfJvxCD6zX6yrwost/k9m2sl28=; b=cArBJzQQYaaxil
	Fg21kAQDzHBeBxXierwRehWrPZJGbcrnb69EmKULyrJCqDOy13KHOriW4LOcpN9h9sC6cYS0si0iG
	kPmgBVKoxMqd5TyPF8eWVtJMwA8fDZL7yCuamGgqoZn9idrwMOSNlNfBXHt2FiadtB1NCYUbTXtDr
	kCIyro8SVR2T7Kgm/RAxfyTRbcYIz2N0wclGFLQ83hmg+n4MvDPM0cPjppCDV5j5Wj88qbEpUJQi6
	puSQXy82RGFkTUmV/zlCW3z9yYk0SX7gR19GGNfGK/BwWTfJ7VmtrbZySjQMO89Tv3qyoJeqIoXlF
	c18LWO3l88HYmdKkJPzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okmqP-0077cc-8P; Tue, 18 Oct 2022 13:41:21 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okmqL-0077ZN-P2
	for linux-riscv@lists.infradead.org; Tue, 18 Oct 2022 13:41:19 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 4B2901F979;
	Tue, 18 Oct 2022 13:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1666100472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D4dDktYe9CWTuDjVFyx2lG5Orw7IVVi7YQYZYlzAxtE=;
	b=kKf7ZGOaFs/KIm0RKTGud/5VpSOKQAXeBF7PnID19n3RsbwKGDdueBX/lDmae3Q5L7U9y3
	PzZFMapQzo/RjjZSAGcFQ0tGgEnoHoRKRx91+kwuMZK7ufIXPpF9T58YwmiTlS9TToueCY
	HveMR6U2RWq+7v0eGu0p/zLkTfxCU3k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1666100472;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D4dDktYe9CWTuDjVFyx2lG5Orw7IVVi7YQYZYlzAxtE=;
	b=dKe7OWEZYUOHmGUThCL+gCUv70X2KBzV/e5p5X1a8o642CgogF12GN5dYgyli4S+eMd8RV
	f44YOmD4OVImbnBQ==
Received: from hawking.suse.de (unknown [10.168.4.11])
	by relay2.suse.de (Postfix) with ESMTP id CC5772C141;
	Tue, 18 Oct 2022 13:41:10 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
	id 51DE34401F8; Tue, 18 Oct 2022 15:41:10 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yury Norov <yury.norov@gmail.com>,  linux-kernel@vger.kernel.org,  Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>,  Rasmus Villemoes
 <linux@rasmusvillemoes.dk>,  Andrew Morton <akpm@linux-foundation.org>,
  Stephen Rothwell <sfr@canb.auug.org.au>,  Peter Zijlstra
 <peterz@infradead.org>,  Thomas Gleixner <tglx@linutronix.de>,  "Paul E .
 McKenney" <paulmck@kernel.org>,  Vlastimil Babka <vbabka@suse.cz>,  Dmitry
 Vyukov <dvyukov@google.com>,  Valentin Schneider <vschneid@redhat.com>,
  Sander Vanheule <sander@svanheule.net>,  Alexey Klimov
 <klimov.linux@gmail.com>,  Eric Biggers <ebiggers@google.com>,
  linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 5/5] lib/cpumask: add FORCE_NR_CPUS config option
References: <20220905230820.3295223-1-yury.norov@gmail.com>
	<20220905230820.3295223-6-yury.norov@gmail.com>
	<CAMuHMdUL0WxYjfRDxLWZG7Xu=2xTQkueathvpwWfLpqhG6NkFQ@mail.gmail.com>
	<CAMuHMdW2H4egcmv238Q_5LBeu9BE=H1fm=n4vZGCGYzhg2VN1A@mail.gmail.com>
X-Yow: I Know A Joke
Date: Tue, 18 Oct 2022 15:41:10 +0200
In-Reply-To: <CAMuHMdW2H4egcmv238Q_5LBeu9BE=H1fm=n4vZGCGYzhg2VN1A@mail.gmail.com>
	(Geert Uytterhoeven's message of "Tue, 18 Oct 2022 15:15:32 +0200")
Message-ID: <mvmlepdb66h.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_064117_996114_434FA362 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

On Okt 18 2022, Geert Uytterhoeven wrote:

> Moreover, this cannot be used on all systems.  E.g. on Icicle Kit with
> Microchip PolarFire SoC, CONFIG_NR_CPUS needs to be larger than 4,
> as the system has actually 5 CPU cores (1xE51 and 4xU54), but Linux
> runs only on 4 of them.  So you cannot use FORCE_NR_CPUS=y.

But does Linux acually see the E51 core?  On the Hifive boards it is
disabled in the device tree, and the cpu probing just skips it,
effectively resulting in only four cpus.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
