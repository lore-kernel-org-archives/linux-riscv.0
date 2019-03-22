Return-Path: <SRS0=cI7w=RZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9968C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 17:02:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98AB32190A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 17:02:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ju1U1cGD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EQb0PJgI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98AB32190A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sEFx9rBh3R1QynZqU2WJs194sIE8szVlSaiTubvFpSc=; b=Ju1U1cGDe8Swbj
	8gtelPFIUunZmdTy7ZwceL08YmOXj4WHVmN3h6C4Yvb7ofZVVsow5wVg9nu8/plip9vaZguJqaI90
	Qn3Mrf/Aino+2bSXY46Q0sxOkdciq7y3M9EuM0V3Kw8KMe1QbutO7qiZBa79xTdlax1mjoowNHHxR
	BFS5bIaPH4EfLmEZ2BavD2rRKSI3xWAoOiveCD8LEw13oqp71uFkVIXnbANHMV81vw+UsSF89CZmK
	KYBydp3QQOeiogojcqsq/RNGikOYK9vXKonjUYOhHiXqyCP4RCq2a15PR2pPwHPjwZZab8KSZtRxk
	I+0//1B9OWc/8GLkWciA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7NYh-0003OX-DQ; Fri, 22 Mar 2019 17:02:19 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7NYd-0003No-PJ
 for linux-riscv@lists.infradead.org; Fri, 22 Mar 2019 17:02:17 +0000
Received: by mail-lf1-x143.google.com with SMTP id 5so1857769lft.12
 for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2019 10:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vz3qEaERAPywi/7ygEvysJD/ZMRj5JWoH5GTAfYhS9M=;
 b=EQb0PJgIUrxIFWDmv2d+roZcOdf47m4oWDh2aF9nqiM4xcdszNPdjlEZ6XBCZ7EETk
 1IfpVzYln8LpimAQjhRDAkW3OaV5XXtB4BOqOTWHoOqa+CwXq49WMc62V63vMcFKOgKB
 AUA6dt7kp1lq7E8yacEVhDOuhsd4cjNkTZNrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vz3qEaERAPywi/7ygEvysJD/ZMRj5JWoH5GTAfYhS9M=;
 b=e5ZM8zcnjCZnqbFLS5+rx3bccINr0c3Tcz6OyqkVdC2aOCKKZI285dexGDnFwf+6oS
 fj9HtDI/Z75ALYqImBngt4Sohh1gRAq8kPhdLbwyoiYrAvjbrG1lWupm1f00yKd8HO3e
 27+wajG2ACxxKGidVCQ+DFI6l9AV84LTs7/30OEuRDP6B5gQG83QtaSGAcUfrO653/mq
 HAhpZK+UuHcKJciHj9WAtIKPlsl3b+zfyX1TZA34QM5vOW0kBPcmHisHl9IY/dl0Sn4Y
 thkbYvqIEnfb2RoJSqn+bVy4G/0GKF/++AwewFdMYmw8CuJQvVst8OE2IgVJITKkhCEp
 YF5Q==
X-Gm-Message-State: APjAAAWVwA6k6sFTZP5YMuSdA28X+4qAZL1mkBtZglVnUE53l2C7fm5u
 9bwVGhCs4MD8dPiBX9ud97BzX7M3wJ0=
X-Google-Smtp-Source: APXvYqwr3F47CUWXdnBA1goCJJsFWBKIYrsUfuDlhf44vySJY2ua5BPnfhEPbKdW7lNKSjp7NQHVrA==
X-Received: by 2002:ac2:5921:: with SMTP id v1mr5822997lfi.135.1553274131712; 
 Fri, 22 Mar 2019 10:02:11 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173])
 by smtp.gmail.com with ESMTPSA id b26sm1774999lfa.47.2019.03.22.10.02.10
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Mar 2019 10:02:10 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id j89so2673155ljb.1
 for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2019 10:02:10 -0700 (PDT)
X-Received: by 2002:a2e:94ca:: with SMTP id r10mr5731037ljh.118.1553274129929; 
 Fri, 22 Mar 2019 10:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190322143008.21313-1-longman@redhat.com>
 <20190322143008.21313-2-longman@redhat.com>
In-Reply-To: <20190322143008.21313-2-longman@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 22 Mar 2019 10:01:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=wikkO-1f1=FEOEzkSnaDg3yJLP=4Vd59UCuLBztFd0KOw@mail.gmail.com>
Message-ID: <CAHk-=wikkO-1f1=FEOEzkSnaDg3yJLP=4Vd59UCuLBztFd0KOw@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] locking/rwsem: Remove arch specific rwsem files
To: Waiman Long <longman@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_100215_847848_15335498 
X-CRM114-Status: GOOD (  12.99  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will.deacon@arm.com>,
 linux-mips@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org,
 Davidlohr Bueso <dave@stgolabs.net>, linux-c6x-dev@linux-c6x.org,
 linux-hexagon@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, uclinux-h8-devel@lists.sourceforge.jp,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 linux-um@lists.infradead.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-alpha@vger.kernel.org" <linux-arm-kernel@lists.infradead.org>,
 linux-parisc@vger.kernel.org, Tim Chen <tim.c.chen@linux.intel.com>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 nios2-dev@lists.rocketboards.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 22, 2019 at 7:30 AM Waiman Long <longman@redhat.com> wrote:
>
>  19 files changed, 133 insertions(+), 930 deletions(-)

Lovely. And it all looks sane to me.

So ack.

The only comment I have is about __down_read_trylock(), which probably
isn't critical enough to actually care about, but:

> +static inline int __down_read_trylock(struct rw_semaphore *sem)
> +{
> +       long tmp;
> +
> +       while ((tmp = atomic_long_read(&sem->count)) >= 0) {
> +               if (tmp == atomic_long_cmpxchg_acquire(&sem->count, tmp,
> +                                  tmp + RWSEM_ACTIVE_READ_BIAS)) {
> +                       return 1;
> +               }
> +       }
> +       return 0;
> +}

So this seems to

 (a) read the line early (the whole cacheline in shared state issue)

 (b) read the line again unnecessarily in the while loop

Now, (a) might be explained by "well, maybe we do trylock even with
existing readers", although I continue to think that the case we
should optimize for is simply the uncontended one, where we don't even
have multiple readers.

But (b) just seems silly.

So I wonder if it shouldn't just be

        long tmp = 0;

        do {
                long new = atomic_long_cmpxchg_acquire(&sem->count, tmp,
                        tmp + RWSEM_ACTIVE_READ_BIAS);
                if (likely(new == tmp))
                        return 1;
               tmp = new;
        } while (tmp >= 0);
        return 0;

which would seem simpler and solve both issues. Hmm?

But honestly, I didn't check what our uses of down_read_trylock() look
like. We have more of them than I expected, and I _think_ the normal
case is the "nobody else holds the lock", but that's just a gut
feeling.

Some of them _might_ be performance-critical. There's the one on
mmap_sem in the fault handling path, for example. And yes, I'd expect
the normal case to very much be "no other readers or writers" for that
one.

NOTE! The above code snippet is absolutely untested, and might be
completely wrong. Take it as a "something like this" rather than
anything else.

                   Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
