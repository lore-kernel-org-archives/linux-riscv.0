Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2200C47E49
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 17:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZaPlBg2gOi0BFlzSQa1N7G2DiXEn/0R/c6ixqcyXIi8=; b=Ot9jZv0i57h5zM
	+dDwOqhXLmD0wKBzeXI8oDFpWT1j1iJxWFfvwzlbgZaII24dWaqIuhkxQTQxLA88P/AN1ssebitBK
	ED040wEkY1vnkk8SEs0gCqk175tBzEeraT+YKe3EX20gwOz1wlQqgqkSdogKE+jvhwpS1gQQlvrYS
	MPyrBR0UIKbSO89k3DQepbQFWPMqzFz3KjmIGGzuEncKPAKA0FYIsRpQIgB00ountPblB015FAoNp
	P5+98TqTlFvWs/lWSUXK6VtW8ASTpOmkzDxuFvKmGnHUsfk9S27/XF78fNQKD6/0HS8texSseN495
	jpnwe8e9PxWeoWycJZSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rShFc-004Xjb-1g;
	Wed, 24 Jan 2024 17:41:24 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rShFZ-004XiE-2H;
	Wed, 24 Jan 2024 17:41:23 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5ffe7e7b7b3so35083647b3.3;
        Wed, 24 Jan 2024 09:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706118080; x=1706722880; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HrKSWjAPLury0l0O07YwABLahdqYSfqu/vkyFWYooQ8=;
        b=QtvDdF6NbEp67GtnOb1eHAGDtrCkUCiIx0tJwG0zcWGNiq8eAPC1vz6rwWTk0Xkyt/
         K34/eaIj4PaV0sVVIAM4sHQYwRdZZlpD/Tdu3tAbVDAQofD7hoEoSmPXxNGlPT1iEs2c
         /h7LEC0cq6BVv/G/IuCbjpbdHlTH2xFf1U0EP8NIjrnIXumeoWIxT3zE9BuYnwhR3iu8
         wnRItB8McOUp6fc868J2Chlu2AVGlAJWwkZ+RQjYEC9UN40Hk1TfJCY+XYHo5R9S/DGC
         jTAJAtT+ITFybzMB6Vimi1x7dQ7TAUOjrZxoecFoN8aJnP5+kzfAR+kzPae2C+Hkatom
         vNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706118080; x=1706722880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrKSWjAPLury0l0O07YwABLahdqYSfqu/vkyFWYooQ8=;
        b=DB0TVe5LnR/fg83wQmZ9ZMh4zngnkPzzV2SeVQAapJwWMjSvofd05JANNx/wx81AyX
         ZYH3l9YnuT8ofW48Hn+c72tkokoq6X1yRZS0cZsPZW6P11lQyY0F5YAONPJgPXvvchYR
         U0pIKRaTMJzA7eumDU0nlU2LbJh9MhZGHikyTkHQoq5q+4A1PsTRMSo0JwTAEmETgh9D
         irBi6xrY/OFFE72HyQOfsz99TETlhofHkz4xGDAt3dgOOgxEGpQFB3AjhuHJmrHlum/T
         WMoM/KCLRCMBNw+fKBUv3gUBi/J3M45UxDxHfH+qN+UASsARbzb5dEj43yWQm6znuZ+5
         IylA==
X-Gm-Message-State: AOJu0Yzna7W9bT5pigVSxqL4E/DBvzMmyBYHr0fokTMHO5PH5tYRY3g3
	/lz9l8QBEw4SjW7hZj5KuVYeBOgE3OwK+FIl0Fv3FBade21r/Zc8IeG0+uSYSl0=
X-Google-Smtp-Source: AGHT+IG8FJ68JYgvol2vsYmkZB9x7Cw6vyk82+V1soudJ0xN7Bq1azDGVFF6zVhVo1ZMyf65R6wE/A==
X-Received: by 2002:a0d:d70b:0:b0:5ff:9f2c:1299 with SMTP id z11-20020a0dd70b000000b005ff9f2c1299mr1077412ywd.65.1706118079707;
        Wed, 24 Jan 2024 09:41:19 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:abdb:7236:6977:9ab5])
        by smtp.gmail.com with ESMTPSA id t140-20020a0dea92000000b005ffb2815960sm77564ywe.45.2024.01.24.09.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 09:41:19 -0800 (PST)
Date: Wed, 24 Jan 2024 09:41:18 -0800
From: Yury Norov <yury.norov@gmail.com>
To: "Lameter, Christopher" <cl@os.amperecomputing.com>
Cc: Huang Shijie <shijie@os.amperecomputing.com>,
	gregkh@linuxfoundation.org, patches@amperecomputing.com,
	rafael@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, kuba@kernel.org, vschneid@redhat.com,
	mingo@kernel.org, akpm@linux-foundation.org, vbabka@suse.cz,
	rppt@kernel.org, tglx@linutronix.de, jpoimboe@kernel.org,
	ndesaulniers@google.com, mikelley@microsoft.com,
	mhiramat@kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, mark.rutland@arm.com, mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org, chenhuacai@kernel.org,
	jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2] NUMA: Early use of cpu_to_node() returns 0 instead of
 the correct node id
Message-ID: <ZbFLvnMQ3wsQ0pIF@yury-ThinkPad>
References: <20240123045843.75969-1-shijie@os.amperecomputing.com>
 <4a13353c-cf4b-a388-5776-389c61c63ec0@os.amperecomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a13353c-cf4b-a388-5776-389c61c63ec0@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_094121_742843_FB7E3977 
X-CRM114-Status: GOOD (  22.57  )
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

On Wed, Jan 24, 2024 at 09:19:00AM -0800, Lameter, Christopher wrote:
> On Tue, 23 Jan 2024, Huang Shijie wrote:
> 
> > During the kernel booting, the generic cpu_to_node() is called too early in
> > arm64, powerpc and riscv when CONFIG_NUMA is enabled.
> > 
> > For arm64/powerpc/riscv, there are at least four places in the common code
> > where the generic cpu_to_node() is called before it is initialized:
> > 	   1.) early_trace_init()         in kernel/trace/trace.c
> > 	   2.) sched_init()               in kernel/sched/core.c
> > 	   3.) init_sched_fair_class()    in kernel/sched/fair.c
> > 	   4.) workqueue_init_early()     in kernel/workqueue.c
> > 
> > In order to fix the bug, the patch changes generic cpu_to_node to
> > function pointer, and export it for kernel modules.
> > Introduce smp_prepare_boot_cpu_start() to wrap the original
> > smp_prepare_boot_cpu(), and set cpu_to_node with early_cpu_to_node.
> > Introduce smp_prepare_cpus_done() to wrap the original smp_prepare_cpus(),
> > and set the cpu_to_node to formal _cpu_to_node().
> 
> Would  you please fix this cleanly without a function pointer?
> 
> What I think needs to be done is a patch series.
> 
> 1. Instrument cpu_to_node so that some warning is issued if it is used too
> early. Preloading the array with NUMA_NO_NODE would allow us to do that.

By preloading do you mean compile-time initialization?
 
> 2. Implement early_cpu_to_node on platforms that currently do not have it.
> 
> 3. A series of patches that fix each place where cpu_to_node is used too
> early.

Agree. This is the right way to go. And pretty well all of it was discussed
in v1, isn't?

Thanks,
Yury

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
