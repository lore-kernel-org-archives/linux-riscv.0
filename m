Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5051EEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=29hdrHgMrixoY6s8s6KintFFT4D0oIkQfQlFaI7ScZ4=; b=boEd2t+1sdqhyc
	PYGNvGgexG0DhBe9rXYiO85olS4D819m+oA+LZA6JDCgx9Zrcc/PmFVbcndwS2q0Vv1jhprdQYxQu
	ZgZkB1XQdXWtZBnJ2tz2NjhAHz5+751r6/XxS/GnU8lGpbUJVCh+eXnaFMe9yFxgIOOwNptxiuDBn
	aytI24RzNu5xrW0idWcRNHsCIgMV+RN51yi8Ns3/GrR87/5EI/YM79k2tXd7xuUCpKmlJeKc4cWNK
	rw4P/YzJlUzN1MCrP09a7UMYsUpAiJMZyN+Bc52boe4NEmwK/rh0bb9baluORQpbujhalnhQqxAaC
	H0Iv/mJ5Ae0qdhqTOVTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Sy-005ct4-0k;
	Wed, 19 Jul 2023 06:15:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Sw-005crE-15
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PjdXTr3dzdMnu6+stW9Y5PEi63LoYA7/O+Nyj8BgZrY=; b=dSE172Xnhzcye/2L+ZGM/pQfXt
	JxlVe4m+UimrQvTIazI78XHnDfFjxiZguzXuLcWYXwTdACE4q73rC8BS6ol9lKnBeWoGGzKrSSLDP
	o/+wbsik/c6o7J38iS4/92g3V4EpsxceV2kdXZdESbwM9Q2z/BEQhXhQcB/zfT0V0sVN4rOKTdYn9
	DLfxeHy4AVjDAPoS863xq2K/41THcJEhB3O3XukYd5ddnWFMLWg/eXCcTcfpoqbokWyp3D4FgXNBt
	nr/7/lxm0b2iNWXwMW2GmYuxBKeCljka8zElU/xeJHcgS62J0UU2lfBLi6QVD2/BOTjnbgqDKib1E
	3nNxAajA==;
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLXHW-009RJ2-1H
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 23:07:31 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3466725f0beso32117795ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jul 2023 16:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689635008; x=1692227008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PjdXTr3dzdMnu6+stW9Y5PEi63LoYA7/O+Nyj8BgZrY=;
        b=SyUJj9UQ5JKSbq5aGKdl7F8lU7/HvBXqqMKwPkKeMQ4OPLzE8gXoxdsey+TNu390dX
         OBsUIL6CJbQ8DJyyFVHdtcHmaNrr/FZRNq5FE/QMStS2AXwa6ftzIkFxwq04ymOvNa7D
         pA7r0PileKY3gYLY5GQIxh5X/YdMk04u2rsTwPZ5uhAR8TiNP+CKuj2guPwi71NDWs2D
         fY6kKi9qymexTjSILhiKdGTFQDoowd+qjeaihThZA5BTwyzrrBcBOdov9Jiv1WqRxOeK
         cBn9RGkM+N27LuNXh5axwOCrWgamHn55RMhrqiDBbfZ9PZwF5X5C/Oek+U/j3GXuucQv
         kOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689635008; x=1692227008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PjdXTr3dzdMnu6+stW9Y5PEi63LoYA7/O+Nyj8BgZrY=;
        b=Gifze5JUvg0lPggG17DiDJn3oQmmb57l8Uf9Q4w4dDUeiqr8jxdpVqeY2P3UQCUV/E
         iClyjKKaU/v07+Xul7wgVnyNHcSVTgsPii34H5c/CBZxxg/A8n5P7ucOjsjZcPJ53AjR
         iZDKrJOQ6vumRf7KAwFCsf5nkj5giN3jIg10M4LWxIv5+kTESJxGdHP9Bp+xeBG7cQta
         zYQjf4lVSBywnwps41xfj4mB9Iw/o62kUNEwZ+huzehSoRXKSonM7+jkDcZlZydk6M5M
         hiOwLPyFUzexBvSkMqjpk5uFzRCQ6+Mh7/qIqqO9HOjvSyNlmyno8N5pAK46+RW6dGfJ
         87lA==
X-Gm-Message-State: ABy/qLZwpgO8IhsCdOjIMzcdg/lLEE6Vkc6rD7K2R/PhikoClrYkc3Dy
	Xc5pH3NAS6Hpk9v9DM+QWME=
X-Google-Smtp-Source: APBJJlFC6SX/VCeG/MeX057j4EOjP0lF4J3jcfQ3edgXjMjcygGdQA4pJA+cbFryNUtJs9NdzCdVQg==
X-Received: by 2002:a05:6e02:1b07:b0:346:189a:1b74 with SMTP id i7-20020a056e021b0700b00346189a1b74mr1436604ilv.0.1689635007204;
        Mon, 17 Jul 2023 16:03:27 -0700 (PDT)
Received: from localhost (dhcp-72-235-13-41.hawaiiantel.net. [72.235.13.41])
        by smtp.gmail.com with ESMTPSA id w5-20020a92d605000000b0034628814e66sm254216ilm.40.2023.07.17.16.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 16:03:26 -0700 (PDT)
Date: Mon, 17 Jul 2023 13:03:25 -1000
From: Tejun Heo <tj@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
	"torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	kernel-team@meta.com, Linux PM list <linux-pm@vger.kernel.org>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	linux-rtc@vger.kernel.org,
	linux-riscv <linux-riscv@lists.infradead.org>,
	netdev <netdev@vger.kernel.org>,
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
	Linux MMC List <linux-mmc@vger.kernel.org>,
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: Consider switching to WQ_UNBOUND messages (was: Re: [PATCH v2
 6/7] workqueue: Report work funcs that trigger automatic CPU_INTENSIVE
 mechanism)
Message-ID: <ZLXIvXBvhsnL-ik_@slm.duckdns.org>
References: <20230511181931.869812-1-tj@kernel.org>
 <20230511181931.869812-7-tj@kernel.org>
 <ZF6WsSVGX3O1d0pL@slm.duckdns.org>
 <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
 <CAMuHMdW1kxZ1RHKTRVRqDNAbj1Df2=v0fPn5KYK3kfX_kiXR6A@mail.gmail.com>
 <ZK3MBfPS-3-tJgjO@slm.duckdns.org>
 <ZK30CR196rs-OWLq@slm.duckdns.org>
 <CAMuHMdUCXPi+aS-7bR3qRetKF9T3W9jk_HKjvaXmfHv5SEeuFg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUCXPi+aS-7bR3qRetKF9T3W9jk_HKjvaXmfHv5SEeuFg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_000729_620855_7A7E31FB 
X-CRM114-Status: GOOD (  27.17  )
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

Hello, Geert.

Can you please the following patch and see how many reports you get? Looking
back at your reports, I think some of them probably should be converted to
UNBOUND but we should have a better idea with the adjusted threshold.

Thanks.

From 8555cbd4b22e5f85eb2bdcb84fd1d1f519a0a0d3 Mon Sep 17 00:00:00 2001
From: Tejun Heo <tj@kernel.org>
Date: Mon, 17 Jul 2023 12:50:02 -1000
Subject: [PATCH] workqueue: Scale up wq_cpu_intensive_thresh_us if BogoMIPS is
 below 1000

wq_cpu_intensive_thresh_us is used to detect CPU-hogging per-cpu work items.
Once detected, they're excluded from concurrency management to prevent them
from blocking other per-cpu work items. If CONFIG_WQ_CPU_INTENSIVE_REPORT is
enabled, repeat offenders are also reported so that the code can be updated.

The default threshold is 10ms which is long enough to do fair bit of work on
modern CPUs while short enough to be usually not noticeable. This
unfortunately leads to a lot of, arguable spurious, detections on very slow
CPUs. Using the same threshold across CPUs whose performance levels may be
apart by multiple levels of magnitude doesn't make whole lot of sense.

This patch scales up wq_cpu_intensive_thresh_us upto 1 second when BogoMIPS
is below 1000. This is obviously very inaccurate but it doesn't have to be
accurate to be useful. The mechanism is still useful when the threshold is
fully scaled up and the benefits of reports are usually shared with everyone
regardless of who's reporting, so as long as there are sufficient number of
fast machines reporting, we don't lose much.

Some (or is it all?) ARM CPUs systemtically report significantly lower
BogoMIPS. While this doesn't break anything, given how widespread ARM CPUs
are, it's at least a missed opportunity and it probably would be a good idea
to teach workqueue about it.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
---
 kernel/workqueue.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 02a8f402eeb5..0d7a3d29762f 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -52,6 +52,7 @@
 #include <linux/sched/debug.h>
 #include <linux/nmi.h>
 #include <linux/kvm_para.h>
+#include <linux/delay.h>
 
 #include "workqueue_internal.h"
 
@@ -338,8 +339,10 @@ static cpumask_var_t *wq_numa_possible_cpumask;
  * Per-cpu work items which run for longer than the following threshold are
  * automatically considered CPU intensive and excluded from concurrency
  * management to prevent them from noticeably delaying other per-cpu work items.
+ * ULONG_MAX indicates that the user hasn't overridden it with a boot parameter.
+ * The actual value is initialized in wq_cpu_intensive_thresh_init().
  */
-static unsigned long wq_cpu_intensive_thresh_us = 10000;
+static unsigned long wq_cpu_intensive_thresh_us = ULONG_MAX;
 module_param_named(cpu_intensive_thresh_us, wq_cpu_intensive_thresh_us, ulong, 0644);
 
 static bool wq_disable_numa;
@@ -6513,6 +6516,42 @@ void __init workqueue_init_early(void)
 	       !system_freezable_power_efficient_wq);
 }
 
+static void __init wq_cpu_intensive_thresh_init(void)
+{
+	unsigned long thresh;
+	unsigned long mips;
+
+	/* if the user set it to a specific value, keep it */
+	if (wq_cpu_intensive_thresh_us != ULONG_MAX)
+		return;
+
+	/*
+	 * The default of 10ms is derived from the fact that most modern (as of
+	 * 2023) processors can do a lot in 10ms and that it's just below what
+	 * most consider human-perceivable. However, the kernel also runs on a
+	 * lot slower CPUs including microcontrollers where the threshold is way
+	 * too low.
+	 *
+	 * Let's scale up the threshold upto 1 second if BogoMips is below 1000.
+	 * This is by no means accurate but it doesn't have to be. The mechanism
+	 * is still useful even when the threshold is fully scaled up. Also, as
+	 * the reports would usually be applicable to everyone, some machines
+	 * operating on longer thresholds won't significantly diminish their
+	 * usefulness.
+	 */
+	thresh = 10 * USEC_PER_MSEC;
+
+	/* see init/calibrate.c for lpj -> BogoMIPS calculation */
+	mips = max_t(unsigned long, loops_per_jiffy / 500000 * HZ, 1);
+	if (mips < 1000)
+		thresh = min_t(unsigned long, thresh * 1000 / mips, USEC_PER_SEC);
+
+	pr_debug("wq_cpu_intensive_thresh: lpj=%lu mips=%lu thresh_us=%lu\n",
+		 loops_per_jiffy, mips, thresh);
+
+	wq_cpu_intensive_thresh_us = thresh;
+}
+
 /**
  * workqueue_init - bring workqueue subsystem fully online
  *
@@ -6528,6 +6567,8 @@ void __init workqueue_init(void)
 	struct worker_pool *pool;
 	int cpu, bkt;
 
+	wq_cpu_intensive_thresh_init();
+
 	/*
 	 * It'd be simpler to initialize NUMA in workqueue_init_early() but
 	 * CPU to node mapping may not be available that early on some
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
