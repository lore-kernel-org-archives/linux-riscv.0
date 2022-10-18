Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FF2C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 14:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TQSe96X9GadGiUXesPARtX3QpB6i0yfeNzBhSkKqo+Q=; b=cMMRG4j9R2yAgv
	CsKxoo3ikQD6HiDPV1hVnbVEcOTY79ysN7n/CgJkKrMDQfL9LEGI2AZRlzPoUdngsnEdtTrFaKl9v
	DBsJkeG2kHAX/qjsi50JW2Cd1jwKRvaj85Fsykquf3u29AezIPIT5oaO7T3gMQ675SGk5UCUQkE33
	YAXqgKTcRiUYU0iw/ACxFRMGkomrD9aW2sIEt+bcERpwvszYNtxLLKOiJstIDiMscCsTXU9kuWXSI
	8fRWvNu0hc6Bub8yiS/Ktfdssga7zbKRiMqw14dv3CvZBYnM6mcvljEk2QAgWrCW+W3TVuS5/L0qO
	YKmbcbwJZADW0iHchBcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oknpO-007M7H-T9; Tue, 18 Oct 2022 14:44:22 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oknpL-007M5Z-Iq
	for linux-riscv@lists.infradead.org; Tue, 18 Oct 2022 14:44:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666104259; x=1697640259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SUwj3kGASYH7/krxPp8za6uw30Nuoq25jipn3cGnyp8=;
  b=XjexgCr17fhDIs4CZey8ekTTOfmswdtoAfUzRHxfVFh5kCu9MCLOlzUJ
   fs+Nuqii+d4n9eoCSv0evuPvX4BQq/A7IJpR4joTMvPAxzXJxeFu4dq0J
   uUaw+9aekX0B0IFZfgPHjqbO9MnzrSN7vOsa6yrgXnzYc2SAuM3GabsMJ
   5q8BgADtndHGpqMLPTPiTbDJrgQmZcBtP4/RKJHyXXiOgXBbW7jK9g+EN
   L3hd7aB/miIMl9gE9jWWrFb5WsYzeXs8z3oURttGg/WO9UFgrjaBJjL0v
   JHhtoDCF4e8cmicFByuMa8u9LoKek85Q1GTg54mTOMmwmM3JWoyWsItMn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="307785251"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; 
   d="scan'208";a="307785251"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2022 07:44:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="754074895"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; 
   d="scan'208";a="754074895"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 18 Oct 2022 07:44:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oknpB-009QfO-1q;
	Tue, 18 Oct 2022 17:44:09 +0300
Date: Tue, 18 Oct 2022 17:44:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Andreas Schwab <schwab@suse.de>, linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Dmitry Vyukov <dvyukov@google.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Sander Vanheule <sander@svanheule.net>,
	Alexey Klimov <klimov.linux@gmail.com>,
	Eric Biggers <ebiggers@google.com>,
	linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 5/5] lib/cpumask: add FORCE_NR_CPUS config option
Message-ID: <Y067uYGTaA93Hn3z@smile.fi.intel.com>
References: <20220905230820.3295223-1-yury.norov@gmail.com>
 <20220905230820.3295223-6-yury.norov@gmail.com>
 <CAMuHMdUL0WxYjfRDxLWZG7Xu=2xTQkueathvpwWfLpqhG6NkFQ@mail.gmail.com>
 <CAMuHMdW2H4egcmv238Q_5LBeu9BE=H1fm=n4vZGCGYzhg2VN1A@mail.gmail.com>
 <mvmlepdb66h.fsf@suse.de>
 <CAMuHMdVeHPR_JH0dJ+WSddjd8_hax70JRzd4pqHLNvgbh+-znw@mail.gmail.com>
 <Y065nbfVQwZhwt51@yury-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y065nbfVQwZhwt51@yury-laptop>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_074419_696810_84B40F55 
X-CRM114-Status: GOOD (  14.88  )
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

On Tue, Oct 18, 2022 at 07:35:09AM -0700, Yury Norov wrote:
> On Tue, Oct 18, 2022 at 03:50:31PM +0200, Geert Uytterhoeven wrote:

...

> For those who choose FORCE_NR_CPUS, it's required to set NR_CPUS
> to a value that matches to what's parsed from DT.
> 
> Can you please look at the draft below that disables FORCE_NR_CPUS
> in allmodconfig? If it's OK with you, I'll send a patch. If you think
> that there are architectures where it's not possible to set correct
> NR_CPUS at compile time for some reason, I'll add ARCH_UNFORCE_NR_CPUS
> option.

Instead you may simply add

	depends on CONFIG_$ARCH/$MACHINE=n

and so on to the FORCE_NR_CPUS, no?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
