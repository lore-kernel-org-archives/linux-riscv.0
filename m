Return-Path: <SRS0=Cgvv=JL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FFCC433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 21:04:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE88561132
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 21:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE88561132
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3wdJJ9SRgHUcnyFMV5CjkLdzKFmuQFeft/3M/TM9mMY=; b=ILWM7wpwRSrALISkTSHxMFsHQ
	hdp6gDNqS2eczqYPsLp7l2psGMrD+CRqRpH3MojpTRahqaoTwyheI4CKWKeoiuMGe4AsJR6nTXcvX
	tEIrdcX8NmObkvwqrmjsnbIp0JdQ4qhxNWfscuhzsGpmNESdu3WoZtO2i511gxQ9Mwzh9EYRbGtBP
	xWJMhOi+7FMfmTa9WcRNcNYBlwBNxkrru1uzioqIFAs8lD0mB1U0Al8aNPm/WuNtRFXJEOM3aRz9n
	qGje9xehDGoasSFp/dOwkT8mCPggyebb3nIomTjUe7t1juoZut2P7hrz6IZtlZ25IdWtHmvDgcXna
	p2Elt3Hyg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWmg7-00Dn5E-Sq; Wed, 14 Apr 2021 21:04:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWmf2-00Dmzd-FD
 for linux-riscv@desiato.infradead.org; Wed, 14 Apr 2021 21:02:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UNiXmh33gM3qS0FOiDfXRI3gMFMKu7/rvgZO8KzNOiY=; b=agnHMX0ZIWrop+7AJsBdTozX13
 x882TS/NZh7Hzx4BV+nUG/bQtxxUXhMsXtX8cFh6VpQf5lF/5AwDr+GWLLAbjxRx6Xn2JZqDVZ8sv
 4DFljU9FOhKu5YRbxLlm1dRzfyuf/SZwluQTQM64+9FO9Renkjc+ay8VpfKLZpgr7+JjFi5KT+Om0
 2Ku+zWijEP0std5fjiU62Rsjbq0Wcuhy8Mx05RjpALsBZa/flgyxTpz1QfZ3X1fvdtVyFin2dTGVd
 1M5t9/HyRHnbJrPVDV10I4J60jyodHBtExQZ0t/y4W/AvTvB/qpAAh8G8KRCzJmLjjqEtKmmxeNu6
 ZHfmPdiA==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWmf0-0086Qs-0d
 for linux-riscv@lists.infradead.org; Wed, 14 Apr 2021 21:02:55 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so13171753pjb.4
 for <linux-riscv@lists.infradead.org>; Wed, 14 Apr 2021 14:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UNiXmh33gM3qS0FOiDfXRI3gMFMKu7/rvgZO8KzNOiY=;
 b=u0fnXTpVsEGoPFPkAh/6LfZAlBoxyym0Rocaxk498N+SwZO8Xqr08r04o/3l9YTIDo
 7Au3zL4IVXAB9lLFQowD/3rOM3XXNnls5l5Klql07LDxyGs7w0obH3Mtlmzg1+C7CVpb
 pqqn38DnhiIcpsBEEams4qrdh+SWeAqKvCW2B731ShKGovLsS4gWVS83dNehow8U1B0v
 A1mhVbjSDX8PTrz10Bxu2pxVM5J7HytFdAOOelBEwgF14mG96ieXlxxB0y5y09Jw1x/y
 t0PEyuVoSGvgFh3l9DEMCPrLdiDaKOmFhlFqsYTng7QVk8txDN+eBpuuy44hRhYog1Ql
 4ENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UNiXmh33gM3qS0FOiDfXRI3gMFMKu7/rvgZO8KzNOiY=;
 b=ubjRYvQtqRxAmmXH242Hwp2EBgSCorN9OP2Y5hRfYVrDqCWGjLneH3VrJcuO7gzLN/
 rgG/gTuxjKHtC+Byg55c3mrirZLtv/v28rJQsIujqxgXFrTp+ZCvshmuM4XH+a3+c4/B
 cetfGVDzLc1FrsfE5KpwtF3qCuBNk3dtRktSOMvBKtdtiPqspOW5HYDMi1okCZsXpJ9D
 laCuXc2Dy8rahuAfwhWIuOJG1duHOvosKVpYZzCQJo1eJ8+b7/EpbEgpKeZlifskpoYs
 zDp8otLM3ihbBVXESte6mJuqa11QQieXdeDUXOcsWOGj82Lu2+uRdVm8iUpW0uAmO/9U
 YnGg==
X-Gm-Message-State: AOAM530abJ+OjzgccsMBd81s2XfnRnr1BovbUF7Y21UP06Exw0Omt4YK
 CzRuOAr8ViHgw9ZnFN5/qtI=
X-Google-Smtp-Source: ABdhPJyXSDeamwRRE3yl4KyzbzFQqsCd3zzVg9u6w2eCOFpVC1eGMY23VQF30b979LhymEFZBKok/w==
X-Received: by 2002:a17:903:308b:b029:eb:5fd0:87ea with SMTP id
 u11-20020a170903308bb02900eb5fd087eamr144494plc.47.1618434172885; 
 Wed, 14 Apr 2021 14:02:52 -0700 (PDT)
Received: from localhost (g191.124-44-145.ppp.wakwak.ne.jp. [124.44.145.191])
 by smtp.gmail.com with ESMTPSA id
 b21sm255987pji.39.2021.04.14.14.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 14:02:52 -0700 (PDT)
Date: Thu, 15 Apr 2021 06:02:49 +0900
From: Stafford Horne <shorne@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Guo Ren <guoren@kernel.org>,
 Christoph =?iso-8859-1?Q?M=FCllner?= <christophm30@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 jonas@southpole.se, stefan.kristiansson@saunalahti.fi
Subject: Re: [RFC][PATCH] locking: Generic ticket-lock
Message-ID: <20210414210249.GK3288043@lianli.shorne-pla.net>
References: <CAHB2gtS9J09VaY9ZxDJYVo2fTgS-u6p7e89aLCnwOHnYEOJR=g@mail.gmail.com>
 <mhng-03d1655e-090e-4afb-a4e3-12b4b8f0e6bf@palmerdabbelt-glaptop>
 <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
 <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
 <YHVTgfCpxpINc8sM@hirez.programming.kicks-ass.net>
 <CAJF2gTQaF8wBCp-L6vgJPcu6EnFRWmh_qZMX2PiEfj0Z70-Ykg@mail.gmail.com>
 <YHaU4uxr6emrivuu@hirez.programming.kicks-ass.net>
 <YHawVOIHmDPbTmoB@hirez.programming.kicks-ass.net>
 <YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net>
 <YHbj987Ks0JOKw/X@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YHbj987Ks0JOKw/X@hirez.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_140254_081163_6FC7F241 
X-CRM114-Status: GOOD (  25.79  )
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

On Wed, Apr 14, 2021 at 02:45:43PM +0200, Peter Zijlstra wrote:
> On Wed, Apr 14, 2021 at 12:16:38PM +0200, Peter Zijlstra wrote:
> > On Wed, Apr 14, 2021 at 11:05:24AM +0200, Peter Zijlstra wrote:
> > 
> > > That made me look at the qspinlock code, and queued_spin_*lock() uses
> > > atomic_try_cmpxchg_acquire(), which means any arch that uses qspinlock
> > > and has RCpc atomics will give us massive pain.
> > > 
> > > Current archs using qspinlock are: x86, arm64, power, sparc64, mips and
> > > openrisc (WTF?!).
> > > 
> > > Of those, x86 and sparc are TSO archs with SC atomics, arm64 has RCsc
> > > atomics, power has RCtso atomics (and is the arch we all hate for having
> > > RCtso locks).
> > > 
> > > Now MIPS has all sorts of ill specified barriers, but last time looked
> > > at it it didn't actually use any of that and stuck to using smp_mb(), so
> > > it will have RCsc atomics.
> > > 
> > > /me goes look at wth openrisc is..  doesn't even appear to have
> > > asm/barrier.h :-/ Looking at wikipedia it also doesn't appear to
> > > actually have hardware ...
> > 
> > FWIW this is broken, anything SMP *MUST* define mb(), at the very least.
> 
> As near as I can tell this should do. The arch spec only lists this one
> instruction and the text makes it sound like a completion barrier.

Yes, I will submit this patch.

The l.msync instruction completes all load/store operations.
The l.lwa/l.swa pair (used for xchg/cmpxchg) also implies l.msync.

> ---
>  arch/openrisc/include/asm/barrier.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/openrisc/include/asm/barrier.h b/arch/openrisc/include/asm/barrier.h
> new file mode 100644
> index 000000000000..7538294721be
> --- /dev/null
> +++ b/arch/openrisc/include/asm/barrier.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_BARRIER_H
> +#define __ASM_BARRIER_H
> +
> +#define mb() asm volatile ("l.msync" ::: "memory")
> +
> +#include <asm-generic/barrier.h>
> +
> +#endif /* __ASM_BARRIER_H */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
