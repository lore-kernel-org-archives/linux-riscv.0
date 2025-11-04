Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E505CCFA04
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 13:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U2N0mnhDE4MWrJwAO/I4y0daFchSfIW5qqwwjMFOgJg=; b=ba2YdDBqrTlSAa
	RmXhIEbwTZcqCeNTB9ddyocsT3M8f/DshdLzJQY0zuxDLUZz1D9xz1gKhO3ws/N3oSAhzEdxEFydv
	hVE0ATfQHQztAIZzzM16no+6zO8LzxgxdwGH9+T3Foe02iqTEfT/iErplNxJNBCzePLe0xUrqsrQ4
	ZEKs0hFq0Fc7XGLVHs+nYMetM5ZpxnJDkx+Dnxf7QyHdUohfvDel/ecZYi3Zfja/h0qZtomlGHyjW
	RzLYG9hFE8C9N7M/UEafBtY7mlhlkdx30RDMBRVMW5IaBZ25SL3kQb14kMFCe0dqWK4qlZRc5OOb7
	KpGW2YPdracpqk5ML2qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHMS-0000000BuHW-0jeS;
	Tue, 04 Nov 2025 13:46:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHML-0000000BuG4-0gpQ
	for linux-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 13:46:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762263962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qBb4JYjcOHMwFtnHDJyHLJFdY3oY5dMhkeGhI5Dhsqo=;
	b=ZtxIfP8OxR2qKPS62sHuMJsx9psPsSPwgIOqjuInzzGFIGdoOUp3a766upCpkD1jNFSTx9
	JxPug4bUSeS81NC0Xp/VZwZN8SK7liM3pgDNdS6DqAkoUuAyNOBkIryw2UzkNLEWmVj4MR
	kChaJtVrLxtdvLYf8U/le0fS0YGJdeU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-0AaXjVX0PaeHVTm_-rCn7w-1; Tue, 04 Nov 2025 08:46:01 -0500
X-MC-Unique: 0AaXjVX0PaeHVTm_-rCn7w-1
X-Mimecast-MFC-AGG-ID: 0AaXjVX0PaeHVTm_-rCn7w_1762263960
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3ecdb10a612so4380283f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Nov 2025 05:46:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762263960; x=1762868760;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qBb4JYjcOHMwFtnHDJyHLJFdY3oY5dMhkeGhI5Dhsqo=;
        b=iQ71cPPm3LY5+eSIocYs4Dp0fzAXw9vyAXDKHPO/QoaXKiinxaZKyI3B7FegTgmx3f
         rAeYSyehwvIdg9vqNUYnzBPD9tUb6q5xBnrhtUAQoO4O+NP27bUtovyMq8nws9uIh9KX
         qdxNvtWvAzbL0ZKSJYqRLlgZJeyyLozOBLuxnObIybomi1Lqni9+wVPfq6rpjNP9xfXt
         ykmP99NB2tKmxMZHQD8DrARgCAaEgParddDbty6/8kbIhRxjvogdev06PvexuY0Yn4Cg
         Y0MqNCBKEQ/zzSODS3EwrWjmNhtMcMqcSZA8bnoxqkkciWV8fp1JMqnLXxsc5j9u+yi4
         eUxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKbuM1tUVQcrtWXv5jMjyoqkCLjQQdWJF2U5EGL8OnG84zowcnlhNBgStea+U3MDczmkiTbODEyAIKdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjrVJAyQLjjfZMDPqvsV5ZTRgwtPWmnTe7sKlFZB9SMxoWSSK2
	5Ec7bayYDbPojVxDaia1KlA2t8uMxzX16vDb9LjM7R5Bt27ap2yqWIegQDYdNLxKO8QKv5SHhPj
	AoK55gq5+os82uop23Yx7YbHNs3cbNP1P0V9TJ/OCeii81utqvZFsyGCuxSiDfLtROhihtw==
X-Gm-Gg: ASbGnctYoB7ZnEXwDCwfN2dtxMMHExbqF1CEefb+S7JRLJ7YYUjKiJMYPKoxyhWhZnd
	NGldw92ReBu0de191tYr9N0JSUBHp/5r5YsdinQossIXpp9gyJoAXKCRkThte3e+1TVTfH2kaYL
	s/QulRCJkCyKDtsbeOXG8/ivkPpMj3vclZQ2cJeTsS4puTg9lL7+xDtVkJ7+uHlx41iAVHerpCd
	oy3F/F1RQJcEb8GlGAad4+JUzTzp5YjW2nwE/G0p2jqCzZFgE58svvCl03JGX1/FFt42TaMM1S1
	abVnc+7t5p53YCZzKagB6QXJfoGxAuocXqEWzCArUTgbq6R+LXaLBUXVJxedoSQang1JL6a/Mzj
	KGsFgLjuXrmI7MBhRmwKEEsKzhtwQZ0r9Jzw=
X-Received: by 2002:a05:6000:22c9:b0:429:d11b:9ec4 with SMTP id ffacd0b85a97d-429d11ba360mr6284599f8f.41.1762263959567;
        Tue, 04 Nov 2025 05:45:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRnKz3y+r5XoY3ls/nBZPt8sht5PzwdeS+jf9m1q52xASXswgB53muxrTyL7Mvrv/sZwgkKw==
X-Received: by 2002:a05:6000:22c9:b0:429:d11b:9ec4 with SMTP id ffacd0b85a97d-429d11ba360mr6284574f8f.41.1762263959010;
        Tue, 04 Nov 2025 05:45:59 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb ([2a01:e0a:36d:2b80:e937:44f0:a96a:94f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1a8528sm4959089f8f.21.2025.11.04.05.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 05:45:58 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Nicolas Saenz Julienne <nsaenzju@redhat.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Josh
 Poimboeuf <jpoimboe@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Arnd
 Bergmann <arnd@arndb.de>, Frederic Weisbecker <frederic@kernel.org>, "Paul
 E. McKenney" <paulmck@kernel.org>, Jason Baron <jbaron@akamai.com>, Steven
 Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, Sami
 Tolvanen <samitolvanen@google.com>, "David S. Miller"
 <davem@davemloft.net>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>,
 Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mel Gorman
 <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Masahiro
 Yamada <masahiroy@kernel.org>, Han Shen <shenhan@google.com>, Rik van Riel
 <riel@surriel.com>, Jann Horn <jannh@google.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v6 23/29] context-tracking: Introduce work deferral
 infrastructure
In-Reply-To: <dee4dc13-b187-42df-93ce-f738cfab32ea@linux.ibm.com>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <20251010153839.151763-24-vschneid@redhat.com>
 <dee4dc13-b187-42df-93ce-f738cfab32ea@linux.ibm.com>
Date: Tue, 04 Nov 2025 14:45:56 +0100
Message-ID: <xhsmhjz05ud0r.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: usH8HizWNobr5tszoey4_XSUgMoF0gHjhiJxNKCYpTI_1762263960
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_054605_613281_0BB75EC6 
X-CRM114-Status: GOOD (  20.79  )
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

On 03/11/25 14:02, Shrikanth Hegde wrote:
> Hi Valentin.
>
> On 10/10/25 9:08 PM, Valentin Schneider wrote:
>> +++ b/include/linux/context_tracking_work.h
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _LINUX_CONTEXT_TRACKING_WORK_H
>> +#define _LINUX_CONTEXT_TRACKING_WORK_H
>> +
>> +#include <linux/bitops.h>
>> +
>> +enum {
>> +	CT_WORK_n_OFFSET,
>> +	CT_WORK_MAX_OFFSET
>> +};
>> +
>> +enum ct_work {
>> +	CT_WORK_n        = BIT(CT_WORK_n_OFFSET),
>> +	CT_WORK_MAX      = BIT(CT_WORK_MAX_OFFSET)
>> +};
>> +
>> +#include <asm/context_tracking_work.h>
>> +
>
> It fails to compile on powerpc (likey any arch other than x86)
>

Woops, thanks for testing!

> In file included from ./include/linux/context_tracking_state.h:8,
>                   from ./include/linux/hardirq.h:5,
>                   from ./include/linux/interrupt.h:11,
>                   from ./include/linux/kernel_stat.h:8,
>                   from ./include/linux/cgroup.h:27,
>                   from ./include/linux/memcontrol.h:13,
>                   from ./include/linux/swap.h:9,
>                   from ./include/linux/suspend.h:5,
>                   from arch/powerpc/kernel/asm-offsets.c:21:
> ./include/linux/context_tracking_work.h:17:10: fatal error:
> asm/context_tracking_work.h: No such file or directory
>     17 | #include <asm/context_tracking_work.h>
>        |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>
> Gating works for compile, but no benefit of the series.
>
> +#ifdef HAVE_CONTEXT_TRACKING_WORK
>   #include <asm/context_tracking_work.h>
> +#endif
>

Huh, looking at this I wonder why I shoved that here. That include belongs
in context_tracking.c itself; I'll fix that.

>
> I have been trying to debug/understand the issue seen with isolcpus= and
> nohz_full=. system is idle, even then it occasionally woken up to do
> some work. So I was interesting if this series can help.

Is there some ongoing thread for this particular issue or is this just
something you're experimenting with?

If you suspect stray IPIs hitting isolated CPUs I'd recommend tracing with
these events enabled:
  ipi_send_cpu
  ipi_send_cpumask


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
