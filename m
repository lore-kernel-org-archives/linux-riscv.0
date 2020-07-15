Return-Path: <SRS0=uYfr=A2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1252CC433E1
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 10:43:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6D7D20656
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 10:43:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uHEqe8bC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="CxgsK7z+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6D7D20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DLczEjUEnOyErO1ycfYx55kBM8ciT+PySP385bDcr68=; b=uHEqe8bCUb8bqM72YlA9U3+39
	/GPEVnIK+EVDtYThbfZixYsmAtxFmd7QxtW5DkywPCMmV4+4NflcGmW2kwFspHPl0C8Ba4tGHWYVK
	iUx2MElb4wRyvoT57EJVtRZRVleq39a9FTWTwBX5SBQGWGOs3TiBoYi8UlI9hLY14okIYQEvlg3Lj
	z9Lj9yp4bSm+Jtx8513HctMx9olTuI2a3LXU/q9HlpvZ4A+idNbKZ9rSB/E/efa8ipCk6q6W0a4qS
	P+ZlY6AiG7LuVjYXxdF5bH5s9PL2mvDraD4is8qr1LSd6gO24ILnYYj2LJ+8W5dW38oJmBzL1E3Q2
	ZmhG4Mwsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvesL-0000d0-64; Wed, 15 Jul 2020 10:42:57 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvesI-0000cG-Lw
 for linux-riscv@lists.infradead.org; Wed, 15 Jul 2020 10:42:55 +0000
Received: by mail-wr1-x442.google.com with SMTP id k6so2074108wrn.3
 for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2020 03:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RMoJg0iwHXCKzoaQm24OqDN7mm5uxvqFCCrIZxIcI3U=;
 b=CxgsK7z+UwYBgoJlF//D64fKl2zoYe1rLiBIWxaKmUFy6RR3XQqNvhT2PPTmpSDLU+
 wu8zhlU5PIpyzNKrhGEdLkdDlOTZXumAbJ2pGwHo6UqmKmB9S6qXaKnpUbPZuZrEL8UI
 P0EZbWGs+O2PFGuJkrZzAopZnPeD4KspNsq0f4tys3ZnSGk+lG9PhCmBkmc0wPtHSlH9
 SXe3KDATj8a00yL/cuMS/R1gCdyQ3Olh+SATMIo0RmJFaYQlV2bQgXpwNG9CnOVrny7t
 bYe9qGTGP+jWT60tebE98NkVlqY9H1YVOEhhlAlK7WUIVdx6y/JGXoZigcFG6ctR8Axo
 qhlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RMoJg0iwHXCKzoaQm24OqDN7mm5uxvqFCCrIZxIcI3U=;
 b=MkgYrFPdT5BafD8g6bM1uU9HsnJiIvImueNngkAMdSfOVZ5WpxAQ63ceJpUwY1oQFy
 EKijVtmmu/NJ3lbA9E4be2MG4QFUMC+MjHbz8uPzqiRRo/PF/938eBX6TOr0hTWM5IMa
 uKACzHU4UoFsSMbCHQWT5ODxYM+sO4ZHs44ZdFE/GCWZHPxXc+/uToG9gW78/v2YAFqp
 BN9XdQP8bKyyaIPjmLNYwzuUamAWr+gmgnJmCX5NYHSrCbTjLBcj5Trf4hAP6/9dvyIS
 /M7Hyn1eRqZC7chjCPhE77taoI/bB1dZKQ39mPbp1y95xJFWgiemeaGU3SoK2jiXRavz
 74QQ==
X-Gm-Message-State: AOAM531oXK1INA0bE8NpMZ2Db1sDOIqXG3mVBV8UHUzLv0HzohWxP4O/
 9E2GOcMIFko0VIpIvoNA0M1A+g==
X-Google-Smtp-Source: ABdhPJxv0l68wRCEYAeGzveZKt/xu+hM6J2CDy20/QEAv04ewqEXjQi8ZDiNAKNZHoje3x1NrQvkMQ==
X-Received: by 2002:a5d:4e81:: with SMTP id e1mr10126799wru.22.1594809771755; 
 Wed, 15 Jul 2020 03:42:51 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:f693:9fff:fef4:a833])
 by smtp.gmail.com with ESMTPSA id n16sm2890572wrq.39.2020.07.15.03.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 03:42:51 -0700 (PDT)
Date: Wed, 15 Jul 2020 11:42:46 +0100
From: Will Deacon <willdeacon@google.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] asm-generic/mmiowb: Get cpu in mmiowb_set_pending
Message-ID: <20200715104246.GA3143299@google.com>
References: <CANBLGcw8nVvshaOxiBO3zSpjE2oEmWE7C4vuvDXYheRdFVLK0A@mail.gmail.com>
 <mhng-09237735-4773-4f28-bfb6-b619f1dd4e09@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-09237735-4773-4f28-bfb6-b619f1dd4e09@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_064254_785322_EBAF0AFE 
X-CRM114-Status: GOOD (  23.15  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, kernel@esmil.dk, Arnd Bergmann <arnd@arndb.de>,
 guoren@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 14, 2020 at 11:45:11PM -0700, Palmer Dabbelt wrote:
> > > > > > > > [<ffffffe00047365e>] regmap_mmio_write32le+0x18/0x46
> > > > > > > > [<ffffffe0005c4c26>] check_preemption_disabled+0xa4/0xaa
> > > > > > > > [<ffffffe00047365e>] regmap_mmio_write32le+0x18/0x46
> > > > > > > > [<ffffffe0004737c8>] regmap_mmio_write+0x26/0x44
> > > > > > > > [<ffffffe0004715c4>] regmap_write+0x28/0x48
> > > > > > > > [<ffffffe00043dccc>] sifive_gpio_probe+0xc0/0x1da
> > > > > > > > [<ffffffe00000113e>] rdinit_setup+0x22/0x26
> > > > > > > > [<ffffffe000469054>] platform_drv_probe+0x24/0x52
> > > > > > > > [<ffffffe000467e16>] really_probe+0x92/0x21a
> > > > > > > > [<ffffffe0004683a8>] device_driver_attach+0x42/0x4a
> > > > > > > > [<ffffffe0004683ac>] device_driver_attach+0x46/0x4a
> > > > > > > > [<ffffffe0004683f0>] __driver_attach+0x40/0xac
> > > > > > > > [<ffffffe0004683ac>] device_driver_attach+0x46/0x4a
> > > > > > > > [<ffffffe000466a3e>] bus_for_each_dev+0x3c/0x64
> > > > > > > > [<ffffffe000467118>] bus_add_driver+0x11e/0x184
> > > > > > > > [<ffffffe00046889a>] driver_register+0x32/0xc6
> > > > > > > > [<ffffffe00000e5ac>] gpiolib_sysfs_init+0xaa/0xae
> > > > > > > > [<ffffffe0000019ec>] do_one_initcall+0x50/0xfc
> > > >
> > > > Hmm.. the problem is that preemption is *not* disabled when
> > > > smp_processor_id is called, right?
> > > 
> > > Yes!
> > > 
> > > smp_processor_id is defined as:
> > > 
> > >  * This is the normal accessor to the CPU id and should be used
> > >  * whenever possible.
> > >  *
> > >  * The CPU id is stable when:
> > >  *
> > >  *  - IRQs are disabled;
> > >  *  - preemption is disabled;
> > >  *  - the task is CPU affine.
> > >  *
> > >  * When CONFIG_DEBUG_PREEMPT; we verify these assumption and WARN
> > >  * when smp_processor_id() is used when the CPU id is not stable.
> > > 
> > > So regmap_write->regmap_mmio_write should be PREEMPT disabled in
> > > sifive_gpio_probe().
> > 
> > Ah! Sorry, now I think I understand. So you're saying that the real
> > problem is that the driver framework should have disabled preemption
> > before calling any .probe functions, but for some reason that doesn't
> > happen on RISC-V?
> 
> I think it's actually an issue with the generic mmiowb stuff and that we should
> just elide the check.  I'm adding Will, for context.  I'll send out a patch.

Hmm. Although I _think_ something like the diff below ought to work, are you
sure you want to be doing MMIO writes in preemptible context? Setting
'.disable_locking = true' in 'sifive_gpio_regmap_config' implies to me that
you should be handling the locking within the driver itself, and all the
other regmap writes are protected by '&gc->bgpio_lock'.

Given that riscv is one of the few architectures needing an implementation
of mmiowb(), doing MMIO in a preemptible section seems especially dangerous
as you have no way to ensure completion of the writes without adding an
mmiowb() to the CPU migration path (i.e. context switch).

Will

--->8

diff --git a/include/asm-generic/mmiowb.h b/include/asm-generic/mmiowb.h
index 9439ff037b2d..5698fca3bf56 100644
--- a/include/asm-generic/mmiowb.h
+++ b/include/asm-generic/mmiowb.h
@@ -27,7 +27,7 @@
 #include <asm/smp.h>
 
 DECLARE_PER_CPU(struct mmiowb_state, __mmiowb_state);
-#define __mmiowb_state()       this_cpu_ptr(&__mmiowb_state)
+#define __mmiowb_state()       raw_cpu_ptr(&__mmiowb_state)
 #else
 #define __mmiowb_state()       arch_mmiowb_state()
 #endif /* arch_mmiowb_state */
@@ -35,7 +35,9 @@ DECLARE_PER_CPU(struct mmiowb_state, __mmiowb_state);
 static inline void mmiowb_set_pending(void)
 {
        struct mmiowb_state *ms = __mmiowb_state();
-       ms->mmiowb_pending = ms->nesting_count;
+
+       if (likely(ms->nesting_count))
+               ms->mmiowb_pending = ms->nesting_count;
 }
 
 static inline void mmiowb_spin_lock(void)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
