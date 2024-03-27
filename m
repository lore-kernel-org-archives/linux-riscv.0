Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97978C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 14:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=kkisZ91URKGiEwXIXtgWWE6Zhlox0R59yvPpyVnIhuM=; b=U9DR1oo1PSoVHdv/pIlIAHNDbB
	cfMpofFc0EMEmPzTp79Me7ugMjsaVecb9MIAKGlztFEnuMuNTnO22K6X6taC4G63engzs0yJQDrGA
	1mTCDsZjMFwOejAjqNKwaa9ukzY0qNm7Eha0gzxVSlIkMHsjsZkUrcVhPGyugnABQoVqN2bO4GWg0
	nTkqmTYfrzb9jgkTmTSbuDZxabjAPkBOmLyOLEggrIdgv1cU0R7EfTuUvHV0JvNFvHtJFkq7mEIbu
	ZCwkf1ONpwHKFNHtT2BtVV260zzw4seXCgX5eYZdFQ9Xli3pV4EA9FUc2Kk5ws78XLWOlMI2efKpS
	+PV91Qxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUUS-00000009YWP-21TO;
	Wed, 27 Mar 2024 14:42:56 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUUO-00000009YVa-1hUk
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 14:42:54 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-dd045349d42so6016985276.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 07:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1711550571; x=1712155371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FpFxvHTXaRgOadbX9mzZ5uaOaEjiGzDAUYCRyVAS/i4=;
        b=K3yQ7H9MoDDFGEfgapniBtCHz395tS3r1G8gDJulMpbvFWnTboYX3WsUv8wmnuqeur
         OsMLB+gqdckJukqDKv8LcNkPXU+ndjKs5Yuc2XekFrPini9co9AzMBSTFOJj/pLw2CEB
         iNDokNyr6TPetR6rot9QR0IpmTEMMBo3cp7hq9uSF12vJAyA9tPfwb3RR1BhUNpeU35W
         2pQDQLGdDAYoBdu6H4bbICLUOfYMQNLKnzUgx0gnln1+m9PEvQmpgZIpt25nphYPpQA8
         D0k7NN8uiPsC2BUS8V77GPpeujahaWvGh2+LtXYipCVrIGsZK2C9BljKiZd1uGb68T/p
         PduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711550571; x=1712155371;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpFxvHTXaRgOadbX9mzZ5uaOaEjiGzDAUYCRyVAS/i4=;
        b=Y/IzUha7smkVFpV3tbJsjj+zafyZ2N46gSYA9HdcfFsJUtV7jS2gpV+9IspHXjh9bh
         a1IURAqk5kmMGXWNSYrPyeGH/p6GS9AIsF9q3jAJbWS6SjziIj+dawI5SoL7/6XEVUoK
         BHvsCWaVqdaXmxh/Mhd2Rkiz7UYt5qvNkkHGcFw0RR1nQI8zPNy2DeLHe4/RrFUCI9cd
         uJlE7uc9cHgZW465Z7gkBNgdjTAjk266jnXgzDI+O4u4qfg8kOeHs15mlQ6MBAbiH5N7
         3XTUbJG8ZUMH1MCSodH82xf+ToUTUks/NfLQa5/e0rDRLLAfBAac5o+2euNzX6Ckkr9s
         3KvA==
X-Forwarded-Encrypted: i=1; AJvYcCVpwpqnTOqmW7iq4J27eKoIogd9O7BCxNLnyLH8ZVxLfm1GOobTETZUds4JAd0YaAgTmx2gtFwpjcd5NcOgJzHpCujMX92r5gydaW4VUn0n
X-Gm-Message-State: AOJu0Yw/YK2oepV8L68ZMBq6AoJpiVvEzcc+dTBJYzZPRYljRroJxlEg
	QyHdppNMBuIzXJEhlUw3SNebSGeO8gfR8rHKAH9/pSw2Cu9vsc5JaVbSOv9NNMc27mJ+Zg2+x1C
	p
X-Google-Smtp-Source: AGHT+IGLuMfOxHoUUSwMhDNHhwql3lBke6oQWy3bRJJ6cohj97NT5b6r2v+pJbgeqG89zEtueJAL5Q==
X-Received: by 2002:a17:90a:178c:b0:29d:dfae:4fac with SMTP id q12-20020a17090a178c00b0029ddfae4facmr1468543pja.23.1711550178089;
        Wed, 27 Mar 2024 07:36:18 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id m3-20020a17090b068300b002a0981a7af5sm1742902pjz.32.2024.03.27.07.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 07:36:17 -0700 (PDT)
Date: Wed, 27 Mar 2024 07:36:17 -0700 (PDT)
X-Google-Original-Date: Wed, 27 Mar 2024 07:36:15 PDT (-0700)
Subject: Re: [PATCH v3] NUMA: Early use of cpu_to_node() returns 0 instead of the correct node id
In-Reply-To: <20240126064451.5465-1-shijie@os.amperecomputing.com>
CC: Greg KH <gregkh@linuxfoundation.org>, patches@amperecomputing.com,
  rafael@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  yury.norov@gmail.com, kuba@kernel.org, vschneid@redhat.com, mingo@kernel.org,
  akpm@linux-foundation.org, vbabka@suse.cz, rppt@kernel.org, tglx@linutronix.de, jpoimboe@kernel.org,
  ndesaulniers@google.com, mikelley@microsoft.com, mhiramat@kernel.org, Arnd Bergmann <arnd@arndb.de>,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
  Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
  mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
  linux-mips@vger.kernel.org, cl@os.amperecomputing.com, shijie@os.amperecomputing.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: shijie@os.amperecomputing.com, akpm@linux-foundation.org
Message-ID: <mhng-13c5ed78-333f-4cfd-b1d5-828dabbe510c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_074252_455818_16BB2509 
X-CRM114-Status: GOOD (  25.83  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 25 Jan 2024 22:44:51 PST (-0800), shijie@os.amperecomputing.com wrote:
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
> In order to fix the bug, the patch introduces early_numa_node_init()
> which is called after smp_prepare_boot_cpu() in start_kernel.
> early_numa_node_init will initialize the "numa_node" as soon as
> the early_cpu_to_node() is ready, before the cpu_to_node() is called
> at the first time.
>
> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
> ---
> v2 --> v3:
> 	Do not change the cpu_to_node to function pointer.
> 	Introduce early_numa_node_init() which initialize
> 	the numa_node at an early stage.
>
> 	v2: https://lore.kernel.org/all/20240123045843.75969-1-shijie@os.amperecomputing.com/
>
> v1 --> v2:
> 	In order to fix the x86 compiling error, move the cpu_to_node()
>        	from driver/base/arch_numa.c to driver/base/node.c.
>
> 	v1: http://lists.infradead.org/pipermail/linux-arm-kernel/2024-January/896160.html
>
> 	An old different title patch:
> 	http://lists.infradead.org/pipermail/linux-arm-kernel/2024-January/895963.html
>
> ---
>  init/main.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/init/main.c b/init/main.c
> index e24b0780fdff..39efe5ed58a0 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -870,6 +870,19 @@ static void __init print_unknown_bootoptions(void)
>  	memblock_free(unknown_options, len);
>  }
>
> +static void __init early_numa_node_init(void)
> +{
> +#ifdef CONFIG_USE_PERCPU_NUMA_NODE_ID
> +#ifndef cpu_to_node
> +	int cpu;
> +
> +	/* The early_cpu_to_node() should be ready here. */
> +	for_each_possible_cpu(cpu)
> +		set_cpu_numa_node(cpu, early_cpu_to_node(cpu));
> +#endif
> +#endif
> +}
> +
>  asmlinkage __visible __init __no_sanitize_address __noreturn __no_stack_protector
>  void start_kernel(void)
>  {
> @@ -900,6 +913,7 @@ void start_kernel(void)
>  	setup_nr_cpu_ids();
>  	setup_per_cpu_areas();
>  	smp_prepare_boot_cpu();	/* arch-specific boot-cpu hooks */
> +	early_numa_node_init();
>  	boot_cpu_hotplug_init();
>
>  	pr_notice("Kernel command line: %s\n", saved_command_line);

Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V

I don't really understand the init/main.c stuff all that well, I'm 
adding Andrew as it looks like he's been merging stuff here.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
