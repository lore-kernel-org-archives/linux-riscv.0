Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDA1CD1299
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 14:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=80YwVXIy8HpLaXDd0C58nVKv1gQDeBZuak5M1Q72MyY=; b=UrZ6XmuRDFDbqo
	AUjzJYsYw7zGPoEoYHya6tqhiAbPJypLjFE84oyJDT/T9kn/wk1YZ7trmETs2+G+rvdPnYZZDkbfQ
	heBRzzKlDrFzOxHbFN1MJxXyGu9h0E2TLYupbpHK6h8/lMK7+HwxomWLYAMzIFPQ8Z9t8UGuo8X9J
	RdVOO66B9iNrxa+mKPhEVXqhm7ptw8gFYDvE0SrBlsAL1CGve7tozUMi+/5Dg0mvHJHecOhUKpaLO
	8NdGGWf4h4KEnl9HMxSO3PVmIPVXv3cF8D8nizkosfEgRuFRcSNDdCUOP1x0IbCFqRIzwxmDlP+PD
	RoTV9QRO01v53eocjSLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rskrV-00000007Z28-2gRh;
	Fri, 05 Apr 2024 14:48:13 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rskrR-00000007Yz0-2BP2;
	Fri, 05 Apr 2024 14:48:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712328490; x=1743864490;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=LreOfBm3nT3gJWEyzyhSzgs3L/UNn7htcugC08IxS+o=;
  b=Dwol0GCPWx+Us9Nc1oDUYLAbXkYQJcB5drZ+e/z/NKeBnRPKlHflWqwg
   Yw4hfY96xZ99qi69FRx5ApTzn4s2dFblzbbBBZNmELoBZmGrLsyqtM1Tt
   7XjrCxjQMHslh/maB2ZlqYKL/yOQMjvgJRfWGYWnGNV7Vntchhy9rR8TZ
   Bb2dQ7D0gvEJ7yATUvatm8poVjm9GIXwUZIigfZX2E2sxkH557mmMjsO5
   rZ7L7bNjJUz2yHE8sx+31QYnqvC2LiTeEdXaUSgSRysjyX39H+VV/136X
   wLuzAh2SxZvbL9cXjjV9ut1CJiMFoQgDWGkSykGgExg565dSBn0UcBDyS
   g==;
X-CSE-ConnectionGUID: KoPIlzfFRkCrWVie8svT0w==
X-CSE-MsgGUID: LpkZ/NDZTrSNhIBnXUfuFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="11478924"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="11478924"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 07:48:09 -0700
X-CSE-ConnectionGUID: H55LyW5ASaqr4vhL9J0MYQ==
X-CSE-MsgGUID: +963A5O0TASYUpMZv+tuJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="23821308"
Received: from dtorrice-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.41.202])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 07:47:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, linux-xtensa@linux-xtensa.org, Arnd
 Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 loongarch@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Intel-gfx] [PATCH v5 0/7] Introduce __xchg, non-atomic xchg
In-Reply-To: <Y/y0/VoPAVCXGKp3@hirez.programming.kicks-ass.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <Y/ZLH5F8LA3H10aL@hirez.programming.kicks-ass.net>
 <17f40b7c-f98d-789d-fa19-12ec077b756a@intel.com>
 <Y/y0/VoPAVCXGKp3@hirez.programming.kicks-ass.net>
Date: Fri, 05 Apr 2024 17:47:56 +0300
Message-ID: <87r0fjc1cz.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_074809_624635_3FFD5AB7 
X-CRM114-Status: GOOD (  17.51  )
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

On Mon, 27 Feb 2023, Peter Zijlstra <peterz@infradead.org> wrote:
> On Thu, Feb 23, 2023 at 10:24:19PM +0100, Andrzej Hajda wrote:
>> On 22.02.2023 18:04, Peter Zijlstra wrote:
>> > On Wed, Jan 18, 2023 at 04:35:22PM +0100, Andrzej Hajda wrote:
>> > 
>> > > Andrzej Hajda (7):
>> > >    arch: rename all internal names __xchg to __arch_xchg
>> > >    linux/include: add non-atomic version of xchg
>> > >    arch/*/uprobes: simplify arch_uretprobe_hijack_return_addr
>> > >    llist: simplify __llist_del_all
>> > >    io_uring: use __xchg if possible
>> > >    qed: use __xchg if possible
>> > >    drm/i915/gt: use __xchg instead of internal helper
>> > 
>> > Nothing crazy in here I suppose, I somewhat wonder why you went through
>> > the trouble, but meh.
>> 
>> If you are asking why I have proposed this patchset, then the answer is
>> simple, 1st I've tried to find a way to move internal i915 helper to core
>> (see patch 7).
>> Then I was looking for possible other users of this helper. And apparently
>> there are many of them, patches 3-7 shows some.
>> 
>> 
>> > 
>> > You want me to take this through te locking tree (for the next cycle,
>> > not this one) where I normally take atomic things or does someone else
>> > want this?
>> 
>> If you could take it I will be happy.
>
> OK, I'll go queue it in tip/locking/core after -rc1. Thanks!

Is this where the series fell between the cracks, or was there some
follow-up that I missed?

I think this would still be useful. Andrzej, would you mind rebasing and
resending if there are no objections?

BR,
Jani.


-- 
Jani Nikula, Intel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
