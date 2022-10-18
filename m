Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C74BC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 16:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CovwF2OtdPOE4pDEcz06/sc1Mr5DM/XVYrklCF1MQ+k=; b=zVJXfGZDoKf5/L
	x7ysHdTAHGkKAGNHhguNFwlaDgvCssnUxAqwhgktr9+ZqG+uV/CyWkJztdlG0HejWZCCJFNnSFfnM
	FAkkWhCLijch7gBOxJsOSrP5inud27BBdFPsxWsZYTaK9jPKBLLsDRygGUIn4rnxT9nYASgy2gZPo
	Vs0AfsIoxsnQ7Y4SKUtswkwk1wqqGP9oTQc5TlTSNCQEa0ajawgLJR45SieVz3NTsZdKW1GJ4Q724
	vyb6xJhwbTATMAGYJ0YjS3QWWsa3K144x5NYTnDP46InQ39TFRiNexKHejJc736dvJeLb4/qtL/qf
	IQVB/q1JV+sGbWW3cWog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okpJ2-008wBz-BB; Tue, 18 Oct 2022 16:19:04 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okpIz-008wBD-89
	for linux-riscv@lists.infradead.org; Tue, 18 Oct 2022 16:19:02 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1324e7a1284so17385945fac.10
        for <linux-riscv@lists.infradead.org>; Tue, 18 Oct 2022 09:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sYZUlYSc4gqOFVsv65NI7ueFvWbNl7EItsPw2lHJXQw=;
        b=Y3/2lP+Avek2tukwyTqj0uIy/k7FtQYKk4gtgtZ6T7mQnIutVxW7DJL/HnLchhsfZJ
         eH9y+63dZ7JkujYGZrB5FmbyTX9T1X6sBR9pxHnn47l7ieY7ECGfiLzyQquF+H73uYSh
         g4AeCz8XeiTMn+fDRwwTAmFkvMNta8CsxD4DKszYPmC0gEbGSxlJskmlg8akTeLbu7qZ
         oQBDFzb31Qjms5s6XltPR51zOBG/17DZ4NhkusmHwo+WDg2SMf+9DM04FmhwzaZSBQ17
         lLdzil5PdBA6LO4edNQWOLSKz9Jg4TGD/7coimHXXkw1MOu6xti/VsgvHXpsRVFKDYxr
         v9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYZUlYSc4gqOFVsv65NI7ueFvWbNl7EItsPw2lHJXQw=;
        b=RdphDIM06K3yrlZQJRhRxfatTrKc9G4kT4TVfnl9bkVA7EQatSUA8UnbXQWrA9yAEW
         PDh5CyUn0JPt9Hp/JH5WlwdFsYEvQLcNEJ28cbgoQzKhbfNImrDTqQpyGHq0N3TYbFCO
         P6Xtha8rQPvD/ygNImMpgyqpuibCFV+cSsNnu7Z1iWx7xCKoQM27SU41vYm3GU15D3nZ
         LWZZMozi8iemONaFF0Wau0HQVyBvdZpp1uHuzSFah0NZw5wxRf7mqVwBEBI1HDnCxW2J
         sOOW9xsZT+SbSXkDnbDxE17qH/MLAHh3wG1gujoSJ7/T7ZEPi+yXqjvIPCcVQcqombCc
         oOiA==
X-Gm-Message-State: ACrzQf21RmhsUhMDLCK6uWY4XL/yNiIgFRq+nv7I98PWQ6GVZaOJt2ZX
	vgKUeGCo7eMYS2rETvSCbmE=
X-Google-Smtp-Source: AMsMyM5lJjgYUQFrRHJqWw43YYndHirFZjvWBIiuqwHjhwDGAD3TjW7vuvznUnWaUTkcDIbEXP1CiQ==
X-Received: by 2002:a05:6870:b528:b0:134:75d:c87d with SMTP id v40-20020a056870b52800b00134075dc87dmr19011221oap.22.1666109938897;
        Tue, 18 Oct 2022 09:18:58 -0700 (PDT)
Received: from localhost ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id w13-20020a056870430d00b0012d939eb0bfsm6250920oah.34.2022.10.18.09.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 09:18:58 -0700 (PDT)
Date: Tue, 18 Oct 2022 09:16:48 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
Message-ID: <Y07RcE3fgoGLpNZz@yury-laptop>
References: <20220905230820.3295223-1-yury.norov@gmail.com>
 <20220905230820.3295223-6-yury.norov@gmail.com>
 <CAMuHMdUL0WxYjfRDxLWZG7Xu=2xTQkueathvpwWfLpqhG6NkFQ@mail.gmail.com>
 <CAMuHMdW2H4egcmv238Q_5LBeu9BE=H1fm=n4vZGCGYzhg2VN1A@mail.gmail.com>
 <mvmlepdb66h.fsf@suse.de>
 <CAMuHMdVeHPR_JH0dJ+WSddjd8_hax70JRzd4pqHLNvgbh+-znw@mail.gmail.com>
 <Y065nbfVQwZhwt51@yury-laptop>
 <Y067uYGTaA93Hn3z@smile.fi.intel.com>
 <Y06/SipcWdh4uIqd@yury-laptop>
 <CAMuHMdVjViT8-VMPuKZz2O1sudy5ogHpzVYM_P+isjRRUNgirw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVjViT8-VMPuKZz2O1sudy5ogHpzVYM_P+isjRRUNgirw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_091901_310604_30BF5269 
X-CRM114-Status: GOOD (  20.43  )
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

On Tue, Oct 18, 2022 at 05:15:41PM +0200, Geert Uytterhoeven wrote:
> Hi Yuri,
> 
> On Tue, Oct 18, 2022 at 5:01 PM Yury Norov <yury.norov@gmail.com> wrote:
> > On Tue, Oct 18, 2022 at 05:44:09PM +0300, Andy Shevchenko wrote:
> > > On Tue, Oct 18, 2022 at 07:35:09AM -0700, Yury Norov wrote:
> > > > On Tue, Oct 18, 2022 at 03:50:31PM +0200, Geert Uytterhoeven wrote:
> > >
> > > ...
> > >
> > > > For those who choose FORCE_NR_CPUS, it's required to set NR_CPUS
> > > > to a value that matches to what's parsed from DT.

...

> I haven't tried the patch from your other email yet, but I did try
> CONFIG_NR_CPUS=4 and CONFIG_FORCE_NR_CPUS=y on
> Icicle earlier today.
> 
> There was no warning, as the number of CPUs did match, but the
> fourth CPU (cpu@4, i.e. the fifth core in DT) failed to come online:
> 
>     CPU3: failed to come online
>     smp: Brought up 1 node, 3 CPUs
> 
> BTW, it behaves the same with CONFIG_FORCE_NR_CPUS=n.
> Increasing CONFIG_NR_CPUS (before I used 8) makes the fourth
> CPU core come online again.

The problem is seemingly unrelated to CONFIG_FORCE_NR_CPUS...
If so, we don't need ARCH_UNFORCE_NR_CPUS. Is that right?

This all looks weird. RISCV hasn't an arch code to setup nr_cpu_ids,
and therefore should use generic setup_nr_cpu_ids(), which is:

  void __init setup_nr_cpu_ids(void)
  {
          set_nr_cpu_ids(find_last_bit(cpumask_bits(cpu_possible_mask), NR_CPUS) + 1);
  }

Where:

  static inline void set_nr_cpu_ids(unsigned int nr)
  {
  #if (NR_CPUS == 1) || defined(CONFIG_FORCE_NR_CPUS)
          WARN_ON(nr != nr_cpu_ids);
  #else
          nr_cpu_ids = nr;
  #endif
  }


As you can see, at this point cpu_possible_mask is initialized based
on DT, and even if arch has non-dense cpu_possible_mask, the logic
should still be correct.

Wish I could tell more, if I had an access to the hardware...

Thanks,
Yury

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
