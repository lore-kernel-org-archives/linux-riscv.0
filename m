Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BAEC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Oct 2022 15:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Tdce92aNe21knGtBrXSCoowuswejXHV+xcE9/y8WS0=; b=1w26osQZ7MpE4z
	UhdxfaPcApcqEbgtyh0nFsK1MNBjR/jaOYEIQYIuwyyfuRLJtOp8TVEOWd3W2hO8sttymzq/iirer
	Cex+JQjtgb7aqbJbLVW6/8Rp0Q7Np88jTmwBOAPK2WS/U1SeG+C+Ezf4pxVmPhFjPPrtiL2mOzQ/z
	l+ZIzQAq8uInEd85Ue67VKCEZeaXE0l96wDAmtRlJXJZCmmU5k22QvipW3CjTr0sfNAXI3iMSrDtw
	S772xaRBJgfoRScWBOuXZG3TJfIOhnptLCR2Ij/Xr8d88tzboWG85SJXIXmLwO4fdEEgZvDJPJT/b
	BrcIOT4d89Psq+dYZxiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oko6A-007QEy-FH; Tue, 18 Oct 2022 15:01:42 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oko67-007QCD-AO
	for linux-riscv@lists.infradead.org; Tue, 18 Oct 2022 15:01:40 +0000
Received: by mail-ot1-x329.google.com with SMTP id a16-20020a056830101000b006619dba7fd4so7755663otp.12
        for <linux-riscv@lists.infradead.org>; Tue, 18 Oct 2022 08:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BI7ij/O+BSLU/t/Hdd+xrpFJ0CCm9rH48Y2X7l03iy8=;
        b=W/eRXiRCD8z9KFyxp5NwSjDvAORN/Uqo67mkzrL2ojeDzzj7SQrDsrefZIL1w5EBIR
         S9ZBS5oi+0JoWJXcsX2A6jmMbx5WrqVMHNbu1r7dYdxvUgZ3J+BndBdL9JlFf2VzL2Si
         PY149hfGF5eXBv9Ntw1dXU8wa5llaJT6EYOSHhC0eVz1Grto7dghBYr/R5U/U9ahJr1L
         MBhnfZR/FNtygbC5vU7Rv4hGuzINRZhgjqETMuzzZaFgMoNSG0dS2oFyIUMPeI9cLX5/
         7Dp6h9wEEmHxlmc3HwM0LHZ1oYsWgizQABze6A1w47shY/RNbiMIzYPkXw+3ZRssedXk
         z15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BI7ij/O+BSLU/t/Hdd+xrpFJ0CCm9rH48Y2X7l03iy8=;
        b=o4MJYbpD5lV8y7LHmV8GRbHqdGBg+S71r0/imq0DPxEIwXdSn99e6B91Y+7HXHlair
         RQDLs6ILlQczkyRnYvQf2nUgrM3Gn+gM7l9ll/OmC04mC5A3hMulRI92WljarHLAW2OS
         kQwwBFh9dYR4LrR0TcS4TZ5N7iEMnHJ38kt5xna4+jzdZQ/QO5qvEAhzDCjOjI8xzBgh
         NfUPEEIbDj5IJbrumfUEfpzBqktk+LTrEEPDa/FAOVuuxUbnb5r4u/DSH+aA4y6TiF1a
         tuY4b+U+hC4dgkT2iHo6KVbUf5boJKPE56L1DlMHh9mOcJTO5P4UTvnkFh7XPntbw6MD
         qYTw==
X-Gm-Message-State: ACrzQf3WJ7mbGNgjxwVaZw6MEe33faXhdA/Mypu6RnZBtPZojJH2hWi+
	5YSB1FV4NvAVN6ZU888BPD4=
X-Google-Smtp-Source: AMsMyM5dxqvwl2xST5anu3oixMG5EhIq4rZx1LRoGSjUdGxEjruYBC6VxddSypGolpxyRDThAvGxIw==
X-Received: by 2002:a05:6830:4120:b0:661:d839:cc63 with SMTP id w32-20020a056830412000b00661d839cc63mr1559640ott.51.1666105294679;
        Tue, 18 Oct 2022 08:01:34 -0700 (PDT)
Received: from localhost ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id x27-20020a056870a79b00b001372c1902afsm6224450oao.52.2022.10.18.08.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 08:01:33 -0700 (PDT)
Date: Tue, 18 Oct 2022 07:59:22 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Message-ID: <Y06/SipcWdh4uIqd@yury-laptop>
References: <20220905230820.3295223-1-yury.norov@gmail.com>
 <20220905230820.3295223-6-yury.norov@gmail.com>
 <CAMuHMdUL0WxYjfRDxLWZG7Xu=2xTQkueathvpwWfLpqhG6NkFQ@mail.gmail.com>
 <CAMuHMdW2H4egcmv238Q_5LBeu9BE=H1fm=n4vZGCGYzhg2VN1A@mail.gmail.com>
 <mvmlepdb66h.fsf@suse.de>
 <CAMuHMdVeHPR_JH0dJ+WSddjd8_hax70JRzd4pqHLNvgbh+-znw@mail.gmail.com>
 <Y065nbfVQwZhwt51@yury-laptop>
 <Y067uYGTaA93Hn3z@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y067uYGTaA93Hn3z@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_080139_424063_82A04DDB 
X-CRM114-Status: GOOD (  19.96  )
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

On Tue, Oct 18, 2022 at 05:44:09PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 18, 2022 at 07:35:09AM -0700, Yury Norov wrote:
> > On Tue, Oct 18, 2022 at 03:50:31PM +0200, Geert Uytterhoeven wrote:
> 
> ...
> 
> > For those who choose FORCE_NR_CPUS, it's required to set NR_CPUS
> > to a value that matches to what's parsed from DT.
> > 
> > Can you please look at the draft below that disables FORCE_NR_CPUS
> > in allmodconfig? If it's OK with you, I'll send a patch. If you think
> > that there are architectures where it's not possible to set correct
> > NR_CPUS at compile time for some reason, I'll add ARCH_UNFORCE_NR_CPUS
> > option.
> 
> Instead you may simply add
> 
> 	depends on CONFIG_$ARCH/$MACHINE=n
> 
> and so on to the FORCE_NR_CPUS, no?

Yes, if there's just one machine like that. If there's many of them, the
'depends' list would be too long.

I hope there's no such a weird machines, and we don't need that at
all. Let's see what Geert will say.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
