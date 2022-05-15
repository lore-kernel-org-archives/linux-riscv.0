Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B263C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 15 May 2022 05:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t//S5Mhd1NjwXK+7+55C+Z8j0Mqd9XPWCf2ilUACgZ8=; b=eWHObzoYDEi0/u
	fKA0sUNi1a1JLToaTPqtNMcTAD/20f6SH7Hbvgu3IvuWr02Or95UWGHEne/8OH5HLfqIpIdFENuYf
	LJuHMa+s4M7LarfsB7lI/GkcMnNqAS2nEayYHVLSKnaA7ImUKeR7brrgqZ6Yff3TDChMSn8kazAsw
	5obXRkZ48uYCqgxWNvKAhDf56EZUfILKfwJWmPq3L49XgOmmkHKs3uFm8ie4f9liYDI0ZUi/R6eQ9
	xcTOZyI1/1aogic8/NBqLblAOQQbs43I6PU290Mt3GKd3yK2rn4LW0lu7RP4E7IOjJKwynBvS6s50
	N6zj7LXqRLPP/UdtRddw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nq6oM-003DQR-Vu; Sun, 15 May 2022 05:28:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nq6oJ-003DQ6-WE
 for linux-riscv@lists.infradead.org; Sun, 15 May 2022 05:28:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D95D7B80B2A;
 Sun, 15 May 2022 05:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91874C385B8;
 Sun, 15 May 2022 05:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652592532;
 bh=SpKDu6aHLnyStI7ayt2jfV3MbCZDcJojYH368H8D2ow=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z0rOVFNTMYqljGG8dTDdzAGnekqM0MDikIwjJ9XF+1zVBpl6k8f2tiJy7TTDrLN1Q
 Yza5uVixAuAhtxoR8DHtP778uJaiWzIxs3jiRuUEJDUQPNY0yLfVTnrao77p3EKMLk
 JtiPWUVJhbZDV57AXyZCwJn1a1Ds6vvukvpp0Hcb93j0G30ez2gxaniNqzbgPRb8E6
 s+TCYbOCqv6XaSsVqDwA0LPvME/IoWyCAs7Kbvci4a6zUBY6mLTOWkoIGOfVhdnbXn
 kRcuRDk1aIW1adt33P5QXHPeNF+WcJQ7YtNX0AaErZnPBgWwJVEsaNNhWdraHxuZuI
 Byor57WxNJt3A==
Date: Sun, 15 May 2022 13:20:21 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: David Laight <David.Laight@aculab.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] riscv: add irq stack support
Message-ID: <YoCNlWGUp02hgP27@xhacker>
References: <20220307140804.1400-1-jszhang@kernel.org>
 <f7f46323619e4084b4cfc551cdb47dd0@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f7f46323619e4084b4cfc551cdb47dd0@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220514_222856_230330_64B101ED 
X-CRM114-Status: GOOD (  26.55  )
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

On Mon, Mar 07, 2022 at 02:32:34PM +0000, David Laight wrote:
> From: Jisheng Zhang
> > Sent: 07 March 2022 14:08
> > Currently, IRQs are still handled on the kernel stack of the current
> > task on riscv platforms. If the task has a deep call stack at the time
> > of interrupt, and handling the interrupt also requires a deep stack,
> > it's possible to see stack overflow.
> > 
> ...
> I'd have thought that a single page is (probably) enough for the
> IRQ stack.
> Certainly its sizing isn't really related to the normal thread
> stack size.
> 
> > From another side, after this patch, it's possible to reduce the
> > THREAD_SIZE to 8KB for RV64 platforms. This is especially useful for
> > those systems with small memory size, e.g the Allwinner D1S platform
> > which is RV64 but only has 64MB DDR.
> 
> Are you sure?
> Is the stack use likely to be very much less than that of x86-64?
> The real problem isn't the stack use of the test you are doing,
> but the horrid worst case stack of some path that has multiple
> 1k+ buffers on stack.

Hi David,

Sorry for delay. I think you are right, at least I should not
put the confusing "it's possible to reduce the THREAD_SIZE to 8KB
for RV64 platforms..." in the commit msg. For one thing, the 8KB
IRQ stack isn't available in the mainline w/o a small patch; For
another, I only do tests on Allwinner D1 platform. So I remove the
section in V3's commit msg.

Thanks

> 
> Apart from compiler fubar (which usually hit KASAN) that stack
> is actually likely to be architecture independent.
> (The difference between 32bit and 64bit is also likely to be
> relatively small - unless there are on-stack arrays of 'long'.)
> 
> For VMAP stacks is there a 'guard' KVA page allocated below
> all of the stacks?
> 64bit systems should have lots of KVA so this shouldn't be
> a problem.
> Then stack overruns will fault and panic rather than trashing
> another data area - which is really hard to debug.
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
