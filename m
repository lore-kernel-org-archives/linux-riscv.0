Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE83C4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 04:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tVZfnDC/GoOQiN3XhUkAeq52aj8cBSDVdjrgVNQ5Sr8=; b=hgIJeUOf7wD5L+
	gNY3KDjWBDiedlym7oKtH8j+RxTWrHIENGpH0dEmbghjduYB6kGEVRXSQJfPEEMU5ULmoXwXquAbE
	fEU7phPTpmHGUynhA5iltSQxCgnCOtITW5QJ8wBPBhd2tWKnQ/8ZHnT1zUsAEhbmc/+2aKKq3IC2l
	EZDhCG7p09s4L6SeTBuVigcWH6O+3upTRFWttD/Q6GbWIec9yzjJTBtg7UB+kU0Pq5q3qSzHcnQzt
	QtXlqaqS1ORp2FdxPqNDfsdJa/R6X6QRfzNPW3JFi/i4j2vDzWWNeg+OaS7txIOdEZSeGq0wCTvtS
	pwckTQ4qG4lriPe7r2xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQgiB-004Sq2-0p;
	Fri, 19 Jan 2024 04:42:35 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQgi5-004Sox-2m;
	Fri, 19 Jan 2024 04:42:33 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5ff821b9acfso3359607b3.1;
        Thu, 18 Jan 2024 20:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705639347; x=1706244147; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QUbzb1YsPTuj5pO3yS3gRXNyLqhUcfVQnRjTyZebgdY=;
        b=D4J4YySK2qufVtgsgVuep42sKQy6TEIajnUdk9cOprDXsa448cyoPaY7r/Qrowzkug
         +Da1lQ3+Dg/0aysDbTvixzyIktAL1JBg6W/kcXz74AbKjvsjQPA7dv8Oi1oRmaOamLmE
         gmcWPZ1MQ7qUSD5y8hGww5JGIXv3wEbk7Eglu4S7kDcE5KtvWodLaE42Beskr/BhPVQQ
         WzOk/tO2XzFliq9v7Uxo3UdW8CqFqv/+XtadZLKuWprw8Yp9fVjquOCqLxy60JDa+Dam
         1Qv57NDegM3XAn78N51yW2EbWpB4l+0D9yu1w9ydBCp1rQvpQrPt3a+9lufEivYA8Zmq
         a/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705639347; x=1706244147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUbzb1YsPTuj5pO3yS3gRXNyLqhUcfVQnRjTyZebgdY=;
        b=XHmwYnrpaS5+V4hkLzsPKgSVedxcv/h/7WD9tWg/q7fGZcwJlWNIWfDm+7iSS1VqaY
         gbYaKasDn62mcT1X9vpcVm+YFKeVoemCR+gCn2UAQCbU3zN0zV7xwjQhnpE2kRpRYhxK
         7lzhlWIFWTXrtop0Frvtuc7gI5j8m5s3j3Q/YUsGvGhLUJtarckxlBXZS9gC2kSNkKCh
         eGzBJh1/kgP0MPmvuoEkvKVBl/q77ufQbV0eFrnuDbU4JIrSbz8h2obuA5UInuqbsthx
         zDm14k6OIbIdjaorLMF5y3GQRjtDTwL3lngTLH1r7jLPlocdKlTkKOshqkQdGXjqxEy5
         ViQA==
X-Gm-Message-State: AOJu0YxYKyHmmstOc1k1pX74UdxKZtXHlQ8ZzXJGnB6Rp9EcN91BrBim
	JBCggFMcb8GeH4Mz+18xKoMz0IfLaNkaxW9kC1EKOWiy12JgHgx9gOMk7XiFm44=
X-Google-Smtp-Source: AGHT+IHLrd8uaTT0OOHdcytJ8iHjmKPtxYqdGqH2+DZik5pfzx5cxI60sO/qbir/GslTPLU+qYhC/Q==
X-Received: by 2002:a81:4e85:0:b0:5ff:3087:a378 with SMTP id c127-20020a814e85000000b005ff3087a378mr1746436ywb.13.1705639347074;
        Thu, 18 Jan 2024 20:42:27 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:b45f:9648:c2e:2e36])
        by smtp.gmail.com with ESMTPSA id b6-20020a0dd906000000b005f941afab71sm21362ywe.30.2024.01.18.20.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 20:42:26 -0800 (PST)
Date: Thu, 18 Jan 2024 20:42:25 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Huang Shijie <shijie@os.amperecomputing.com>
Cc: gregkh@linuxfoundation.org, patches@amperecomputing.com,
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
	jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org,
	cl@os.amperecomputing.com
Subject: Re: [PATCH] NUMA: Early use of cpu_to_node() returns 0 instead of
 the correct node id
Message-ID: <Zan9sb0vtSvVvQeA@yury-ThinkPad>
References: <20240119033227.14113-1-shijie@os.amperecomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240119033227.14113-1-shijie@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_204229_926772_308EB05A 
X-CRM114-Status: GOOD (  28.92  )
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

On Fri, Jan 19, 2024 at 11:32:27AM +0800, Huang Shijie wrote:
> hZ7bkEvc+Z19RHkS/HVG3KMg
> X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR01MB7144
> Status: O
> Content-Length: 3779
> Lines: 126
> 
> During the kernel booting, the generic cpu_to_node() is called too early in
> arm64, powerpc and riscv when CONFIG_NUMA is enabled.
> 
> There are at least four places in the common code where
> the generic cpu_to_node() is called before it is initialized:
> 	   1.) early_trace_init()         in kernel/trace/trace.c
> 	   2.) sched_init()               in kernel/sched/core.c
> 	   3.) init_sched_fair_class()    in kernel/sched/fair.c
> 	   4.) workqueue_init_early()     in kernel/workqueue.c
> 
> In order to fix the bug, the patch changes generic cpu_to_node to
> function pointer, and export it for kernel modules.
> Introduce smp_prepare_boot_cpu_start() to wrap the original
> smp_prepare_boot_cpu(), and set cpu_to_node with early_cpu_to_node.
> Introduce smp_prepare_cpus_done() to wrap the original smp_prepare_cpus(),
> and set the cpu_to_node to formal _cpu_to_node().

This adds another level of indirection, I think. Currently cpu_to_node
is a simple inliner. After the patch it would be a real function with
all the associate overhead. Can you share a bloat-o-meter output here?

Regardless, I don't think that the approach is correct. As per your
description, some initialization functions erroneously call
cpu_to_node() instead of early_cpu_to_node() which exists specifically
for that case.

If the above correct, it's clearly a caller problem, and the fix is to
simply switch all those callers to use early version.

I would also initialize the numa_node with NUMA_NO_NODE at declaration,
so that if someone calls cpu_to_node() before the variable is properly
initialized at runtime, he'll get NO_NODE, which is obviously an error.

Thanks,
Yury
 
> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
> ---
>  drivers/base/arch_numa.c | 11 +++++++++++
>  include/linux/topology.h |  6 ++----
>  init/main.c              | 29 +++++++++++++++++++++++++++--
>  3 files changed, 40 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
> index 5b59d133b6af..867a477fa975 100644
> --- a/drivers/base/arch_numa.c
> +++ b/drivers/base/arch_numa.c
> @@ -61,6 +61,17 @@ EXPORT_SYMBOL(cpumask_of_node);
>  
>  #endif
>  
> +#ifdef CONFIG_USE_PERCPU_NUMA_NODE_ID
> +#ifndef cpu_to_node
> +int _cpu_to_node(int cpu)
> +{
> +	return per_cpu(numa_node, cpu);
> +}
> +int (*cpu_to_node)(int cpu);
> +EXPORT_SYMBOL(cpu_to_node);
> +#endif
> +#endif
> +
>  static void numa_update_cpu(unsigned int cpu, bool remove)
>  {
>  	int nid = cpu_to_node(cpu);
> diff --git a/include/linux/topology.h b/include/linux/topology.h
> index 52f5850730b3..e7ce2bae11dd 100644
> --- a/include/linux/topology.h
> +++ b/include/linux/topology.h
> @@ -91,10 +91,8 @@ static inline int numa_node_id(void)
>  #endif
>  
>  #ifndef cpu_to_node
> -static inline int cpu_to_node(int cpu)
> -{
> -	return per_cpu(numa_node, cpu);
> -}
> +extern int (*cpu_to_node)(int cpu);
> +extern int _cpu_to_node(int cpu);
>  #endif
>  
>  #ifndef set_numa_node
> diff --git a/init/main.c b/init/main.c
> index e24b0780fdff..b142e9c51161 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -870,6 +870,18 @@ static void __init print_unknown_bootoptions(void)
>  	memblock_free(unknown_options, len);
>  }
>  
> +static void __init smp_prepare_boot_cpu_start(void)
> +{
> +	smp_prepare_boot_cpu();	/* arch-specific boot-cpu hooks */
> +
> +#ifdef CONFIG_USE_PERCPU_NUMA_NODE_ID
> +#ifndef cpu_to_node
> +	/* The early_cpu_to_node should be ready now. */
> +	cpu_to_node = early_cpu_to_node;
> +#endif
> +#endif
> +}
> +
>  asmlinkage __visible __init __no_sanitize_address __noreturn __no_stack_protector
>  void start_kernel(void)
>  {
> @@ -899,7 +911,7 @@ void start_kernel(void)
>  	setup_command_line(command_line);
>  	setup_nr_cpu_ids();
>  	setup_per_cpu_areas();
> -	smp_prepare_boot_cpu();	/* arch-specific boot-cpu hooks */
> +	smp_prepare_boot_cpu_start();
>  	boot_cpu_hotplug_init();
>  
>  	pr_notice("Kernel command line: %s\n", saved_command_line);
> @@ -1519,6 +1531,19 @@ void __init console_on_rootfs(void)
>  	fput(file);
>  }
>  
> +static void __init smp_prepare_cpus_done(unsigned int setup_max_cpus)
> +{
> +	/* Different ARCHs may override smp_prepare_cpus() */
> +	smp_prepare_cpus(setup_max_cpus);
> +
> +#ifdef CONFIG_USE_PERCPU_NUMA_NODE_ID
> +#ifndef cpu_to_node
> +	/* Change to the formal function. */
> +	cpu_to_node = _cpu_to_node;
> +#endif
> +#endif
> +}
> +
>  static noinline void __init kernel_init_freeable(void)
>  {
>  	/* Now the scheduler is fully set up and can do blocking allocations */
> @@ -1531,7 +1556,7 @@ static noinline void __init kernel_init_freeable(void)
>  
>  	cad_pid = get_pid(t

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
