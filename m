Return-Path: <SRS0=D0Wr=CO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE291C433E2
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2020 01:18:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27F0320797
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2020 01:18:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="evBiVFNs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="WF/ZjbSv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27F0320797
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=l/ErKxsVdi7t2u8GpyX+z5xOOPgXfd+xtWL9W7hE7g4=; b=evBiVFNsco7Ps/Il274FCArt4
	gTdxg77krTw8qnMcbPUgwmi3PsCgpNyhFXcF209EevdgfVFQhCUMn8r0XT3fkoeq/HGYMOLrve2UW
	7Sm5hZeSHxISL65J8UMq/IlkKYlVz/+KAzlAJSYAYfrN2rU+Zwu8jWNNZSRXLQpK0p5zBmqXH2SCo
	pWr8+B0K4WA2iPcxL6tQNiHmDfKMUk/6EX74TIb2wByv2/Y+Fg6RKZyK7gpYABWwtiM/wlClkOnaT
	dn2QxeeVhGjy8JseThPJh2pvYgVf2yZUfhCR4sXPpAxQisizX8rd/S89DoxI7O/JgC1TDWOrW39z8
	k3MmKGB7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEMq8-0005K2-Je; Sat, 05 Sep 2020 01:18:00 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEMq6-0005JT-LZ
 for linux-riscv@lists.infradead.org; Sat, 05 Sep 2020 01:17:59 +0000
Received: by mail-pl1-x641.google.com with SMTP id q3so57949plr.13
 for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2020 18:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=6m0dbKyQXxeXLEzMXpg1ctlvtrEkR+VkffHMyqwyVzk=;
 b=WF/ZjbSvfAnFulSMTnjvqvM9DeHHhYL3gq4V2UQTBh/KOkxGxFhnroWUztIlfK1saf
 q7TlVALn6ZbmB4L8/EpjFwEN8Mix3GNxBPWTLkST6ld58gXY6eeicawv4a2d0TwDg27I
 3tRAUoPpyCvpAxozykIYhItAU62gK8l3dyoqGHuTd4ZZMW6RnAx9LLTtkjfiQuEbECVx
 Yi1wXYcjBJSddZGLoRKGhPPvc2yBRyt2CqY8GjelWceU86MOvKNkeFlqeIpZAonuiWMD
 6f9nwfWui4Mt/cHJ0GSo6IFks/F9FjDyK+IiRaTo3o7D3FlZDARe2CbJHzhBlv5wzpAM
 XD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=6m0dbKyQXxeXLEzMXpg1ctlvtrEkR+VkffHMyqwyVzk=;
 b=MNC5lftzdgaFIobuqG5MegtHlvggZtjI7VTw6/t3i5ZJqyKKfYjt3A2qsZSaCd3NYe
 ColO6QQ42MWKuI7bRhN2QUDEGb+WQtypu868pKzJ1qNsDusnhkOB70/fs87wZBVbpxb1
 rnKBi7jhwJWmFLj+nEyjjIlwg0rEryQS4v2bgHdsGAPSZu1YeoPlbpGvIYNdCQxy29tC
 3lB84OGsTp9f+j/8Uaj0cN1GzihKDuNwTP3WB7xtiW2SO6LXsYvosj8DMuKjgvkEPooA
 JPtA/WcNfvP8u5Y42CIhgB0VtaoKRj9qGhWZn9lBJjivAbk3Ec6GwFNfnNsiZWHRxBgd
 X/iw==
X-Gm-Message-State: AOAM5326gS49mLWxcHVSXFSwtRL/WqBbsmVYnCA3sr5N6egzAuAjM9dE
 /lQGBmgkwi/XmTr2fOZ4vf+gZdSmlHg/QfAI
X-Google-Smtp-Source: ABdhPJykmXEN6n39UTPlMwiMnIXK4xvARKqrLOwEKYSy06DZN/Fx1xgeBYR5M+l/xXsQYWYxP6/BXA==
X-Received: by 2002:a17:90a:e795:: with SMTP id
 iz21mr10377074pjb.8.1599268672105; 
 Fri, 04 Sep 2020 18:17:52 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u22sm6401781pgi.85.2020.09.04.18.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 18:17:51 -0700 (PDT)
Date: Fri, 04 Sep 2020 18:17:51 -0700 (PDT)
X-Google-Original-Date: Fri, 04 Sep 2020 18:17:48 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Allow drivers to provide custom read_cycles64 for
 M-mode kernel
In-Reply-To: <20200904165709.GA32667@lst.de>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-5249e999-3e82-417d-8d39-dcb4a159bd83@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_211758_741897_B925B8CD 
X-CRM114-Status: GOOD (  38.26  )
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
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 04 Sep 2020 09:57:09 PDT (-0700), Christoph Hellwig wrote:
> On Fri, Sep 04, 2020 at 10:13:18PM +0530, Anup Patel wrote:
>> I respectfully disagree. IMHO, the previous code made the RISC-V
>> timer driver convoluted (both SBI call and CLINT in one place) and
>> mandated CLINT for NoMMU kernel. In fact, RISC-V spec does not
>> mandate CLINT or PLIC. The RISC-V SOC vendors are free to
>> implement their own timer device, IPI device and interrupt controller.
>
> Yes, exactly what we need is everyone coming up with another stupid
> non-standard timer and irq driver.

Well, we don't have a standard one so there's really no way around people
coming up with their own.  It doesn't seem reasonable to just say "SiFive's
driver landed first, so we will accept no other timer drivers for RISC-V
systems".

> But the point is this crap came in after -rc1, and it adds totally
> pointless indirect calls to the IPI path, and with your "fix" also
> to get_cycles which all have exactly one implementation for MMU or
> NOMMU kernels.
>
> So the only sensible thing is to revert all this crap.  And if at some
> point we actually have to deal with different implementations do it
> with alternatives or static_branch infrastructure so that we don't
> pay the price for indirect calls in the super hot path.

I'm OK reverting the dynamic stuff, as I can buy it needs more time to bake,
but I'm not sure performance is the right argument -- while this is adding an
indirection, decoupling MMU/NOMMU from the timer driver is the first step
towards getting rid of the traps which are a way bigger performance issue than
the indirection (not to mention the issue of relying on instructions that don't
technically exist in the ISA we're relying on any more).

I'm not really convinced the timers are on such a hot path that an extra load
is that bad, but I don't have that much experience with this stuff so you may
be right.  I'd prefer to keep the driver separate, though, and just bring back
the direct CLINT implementation in timex.h -- we've only got one implementation
for now anyway, so it doesn't seem that bad to just inline it (and I suppose I
could buy that the ISA says this register has to behave this way, though I
don't think that's all that strong of an argument).

I'm not convinced this is a big performance hit for IPIs either, but we could
just do the same thing over there -- though I guess I'd be much less convinced
about any arguments as to the ISA having a say in that as IIRC it's a lot more
hands off.

Something like this seems to fix the rdtime issue without any extra overhead,
but I haven't tested it 

diff --git a/arch/riscv/include/asm/clint.h b/arch/riscv/include/asm/clint.h
new file mode 100644
index 000000000000..51909ab60ad0
--- /dev/null
+++ b/arch/riscv/include/asm/clint.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 Google, Inc
+ */
+
+#ifndef _ASM_RISCV_CLINT_H
+#define _ASM_RISCV_CLINT_H
+
+#include <linux/types.h>
+#include <asm/mmio.h>
+
+#ifdef CONFIG_RISCV_M_MODE
+/*
+ * This lives in the CLINT driver, but is accessed directly by timex.h to avoid
+ * any overhead when accessing the MMIO timer.
+ */
+extern u64 __iomem *clint_time_val;
+#endif
+
+#endif
diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
index a3fb85d505d4..7f659dda0032 100644
--- a/arch/riscv/include/asm/timex.h
+++ b/arch/riscv/include/asm/timex.h
@@ -10,6 +10,31 @@
 
 typedef unsigned long cycles_t;
 
+#ifdef CONFIG_RISCV_M_MODE
+
+#include <asm/clint.h>
+
+#ifdef CONFIG_64BIT
+static inline cycles_t get_cycles(void)
+{
+	return readq_relaxed(clint_time_val);
+}
+#else /* !CONFIG_64BIT */
+static inline u32 get_cycles(void)
+{
+	return readl_relaxed(((u32 *)clint_time_val));
+}
+#define get_cycles get_cycles
+
+static inline u32 get_cycles_hi(void)
+{
+	return readl_relaxed(((u32 *)clint_time_val) + 1);
+}
+#define get_cycles_hi get_cycles_hi
+#endif /* CONFIG_64BIT */
+
+#else /* CONFIG_RISCV_M_MODE */
+
 static inline cycles_t get_cycles(void)
 {
 	return csr_read(CSR_TIME);
@@ -41,6 +66,8 @@ static inline u64 get_cycles64(void)
 }
 #endif /* CONFIG_64BIT */
 
+#endif /* !CONFIG_RISCV_M_MODE */
+
 #define ARCH_HAS_READ_CURRENT_TIMER
 static inline int read_current_timer(unsigned long *timer_val)
 {
diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index 8eeafa82c03d..43ae0f885bfa 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -19,6 +19,11 @@
 #include <linux/interrupt.h>
 #include <linux/of_irq.h>
 #include <linux/smp.h>
+#include <linux/timex.h>
+
+#ifndef CONFIG_MMU
+#include <asm/clint.h>
+#endif
 
 #define CLINT_IPI_OFF		0
 #define CLINT_TIMER_CMP_OFF	0x4000
@@ -31,6 +36,10 @@ static u64 __iomem *clint_timer_val;
 static unsigned long clint_timer_freq;
 static unsigned int clint_timer_irq;
 
+#ifdef CONFIG_RISCV_M_MODE
+u64 __iomem *clint_time_val;
+#endif
+
 static void clint_send_ipi(const struct cpumask *target)
 {
 	unsigned int cpu;
@@ -184,6 +193,14 @@ static int __init clint_timer_init_dt(struct device_node *np)
 	clint_timer_val = base + CLINT_TIMER_VAL_OFF;
 	clint_timer_freq = riscv_timebase;
 
+#ifdef CONFIG_RISCV_M_MODE
+	/*
+	 * Yes, that's an odd naming scheme.  time_val is public, but hopefully
+	 * will die in favor of something cleaner.
+	 */
+	clint_time_val = clint_timer_val;
+#endif
+
 	pr_info("%pOFP: timer running at %ld Hz\n", np, clint_timer_freq);
 
 	rc = clocksource_register_hz(&clint_clocksource, clint_timer_freq);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
