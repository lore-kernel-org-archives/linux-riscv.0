Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34C9C77B73
	for <linux-riscv@archiver.kernel.org>; Tue,  2 May 2023 03:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=1A6yDh9rLH6G+h4s4kJHzkFA1vTiQo+kKL2KH4KgVMU=; b=oVsDNBW5Ugdsphg5YkqCLcXGrw
	w3ubrpSp5izO1YgLrj8b6yXABdCzx90RF+FKMUCrY+tjdLzFQn3McgdNvfSzUOU+g2CRIY2Kgnbu6
	EYrTn6xX6H8hIjLdk9fmx1FlygaYj8hFSVjmm3WRpKMPXEWyLStg7q5+7zgs0wlBzZKLMXkepRB8f
	eqdBNq+ICajXF9tvonDAOZ8UkFdmlz7KybsNwsqQW57kQRpK7H9tvT6sJrIFWZgzHFkjDel1+3Xl0
	cGHiKqzrQ8oz8vKd3O+7LOt34+JgSgSysfG3UgKTTV7WD1cRJXSxw+QKCeF02PfxwaLoAFyPFUf33
	MEnkO3XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptgU9-00HXxG-1j;
	Tue, 02 May 2023 03:15:25 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptdN8-00HEVT-2X
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 23:56:00 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-63b60365f53so3703399b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 16:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682985354; x=1685577354;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QuwyJlMhOzHc7pD19rcBJm7YGGdkgt4st5TSnBpxtCA=;
        b=u7Fbet5GsM/a+tKDG1jIQjylhg8yDIGsEfB3R3METzXxmxTlMfZIrKJcjG1Eg5BKJj
         MlFOPCIdB1Kzok6k4VO3kofHLnjOICQw4gU2tuQOBg05zhDbFsggy6hJcjAmZMRGAXf0
         rUtZb8K8J1C2NtGocYCnTuPL/7q8UuOvuWeleHqtXMOc3hyp4VTgoMKde+PprRxEq3U9
         3NCfHp5mczh1hPm51YYXtT/w0nBzMFK+Xv4D4Xzjfds97FS7WzOT/O5styDeQpozCahx
         aw/N9G2On9yOd5m0BdC1sLbhcBfoO3yIW/1WaAekonzfxEBWX3WbGIXs9NTSCve1lAj1
         n8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682985354; x=1685577354;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuwyJlMhOzHc7pD19rcBJm7YGGdkgt4st5TSnBpxtCA=;
        b=dYOi2v5AEWn9W7tfgW0V14W2L8aAp7nqgvOBfrL6YZEBVOICU7ltK60ud24k9qJmb7
         yqZeog1Vwuxp/0sw3/zlS06ccoGsxZv5v6fijKjepj+HeY0hrq5J3BHnsqolGhhKwk4y
         GIoMAiQS0QkdbLEpv5MN5zlXM1lefUWHQd8wsBvKtI5pg1Zkao7bDxs1zBpEyqnm2hQv
         3K1MSId3awd72t8eRdoOF4P9C7R3okfZr8dAghChqNrUJa+1c3JHDADN9a0XCTIWx5nY
         IK2lEk1B3RQLhR5eMwfWH5/zvrK1zym5cvDoNbNAw1syQ7fH92Y4bZ6wVifsxxeK7rIa
         ZVig==
X-Gm-Message-State: AC+VfDwoEbx9esb+LHYpeMIwBNdKTS8VUziGSA5B+c7uP+hM4ocbaY2g
	YKiPx7ILwx1rqcazThXNdZu4Yw==
X-Google-Smtp-Source: ACHHUZ4SgBzSoTxFJ9j/mzMx+FBKsdjE/IfAfq6NZWT2hwrYFJsUY4cczelg66bWFkmYBXKaJT4LqQ==
X-Received: by 2002:a05:6a20:6f03:b0:f8:b39b:b24e with SMTP id gt3-20020a056a206f0300b000f8b39bb24emr16225285pzb.11.1682985354255;
        Mon, 01 May 2023 16:55:54 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id t2-20020a628102000000b0063b1e7ffc5fsm20413877pfd.39.2023.05.01.16.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 16:55:53 -0700 (PDT)
Date: Mon, 01 May 2023 16:55:53 -0700 (PDT)
X-Google-Original-Date: Mon, 01 May 2023 16:55:31 PDT (-0700)
Subject: Re: [patch 26/37] riscv: Switch to hotplug core state synchronization
In-Reply-To: <20230414232310.817955867@linutronix.de>
CC: linux-kernel@vger.kernel.org, x86@kernel.org, dwmw@infradead.org,
  andrew.cooper3@citrix.com, brgerst@gmail.com, arjan@linux.intel.com, pbonzini@redhat.com,
  paulmck@kernel.org, thomas.lendacky@amd.com, seanjc@google.com, oleksandr@natalenko.name,
  pmenzel@molgen.mpg.de, gpiccoli@igalia.com, lucjan.lucjanov@gmail.com,
  Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, dwmw@amazon.co.uk, usama.arif@bytedance.com,
  jgross@suse.com, boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org,
  linux@armlinux.org.uk, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
  Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, guoren@kernel.org, linux-csky@vger.kernel.org,
  tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, James.Bottomley@HansenPartnership.com,
  deller@gmx.de, linux-parisc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
  sabrapan@amazon.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tglx@linutronix.de
Message-ID: <mhng-fd944caa-93db-40e0-8ea8-bc52772a261a@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_165559_089795_59718D7A 
X-CRM114-Status: GOOD (  21.47  )
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

On Fri, 14 Apr 2023 16:44:55 PDT (-0700), tglx@linutronix.de wrote:
> Switch to the CPU hotplug core state tracking and synchronization
> mechanim. No functional change intended.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: linux-riscv@lists.infradead.org
> ---
>  arch/riscv/Kconfig              |    1 +
>  arch/riscv/include/asm/smp.h    |    2 +-
>  arch/riscv/kernel/cpu-hotplug.c |   14 +++++++-------
>  3 files changed, 9 insertions(+), 8 deletions(-)
>
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -116,6 +116,7 @@ config RISCV
>  	select HAVE_RSEQ
>  	select HAVE_STACKPROTECTOR
>  	select HAVE_SYSCALL_TRACEPOINTS
> +	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
>  	select IRQ_DOMAIN
>  	select IRQ_FORCED_THREADING
>  	select MODULES_USE_ELF_RELA if MODULES
> --- a/arch/riscv/include/asm/smp.h
> +++ b/arch/riscv/include/asm/smp.h
> @@ -64,7 +64,7 @@ asmlinkage void smp_callin(void);
>
>  #if defined CONFIG_HOTPLUG_CPU
>  int __cpu_disable(void);
> -void __cpu_die(unsigned int cpu);
> +static inline void __cpu_die(unsigned int cpu) { }
>  #endif /* CONFIG_HOTPLUG_CPU */
>
>  #else
> --- a/arch/riscv/kernel/cpu-hotplug.c
> +++ b/arch/riscv/kernel/cpu-hotplug.c
> @@ -8,6 +8,7 @@
>  #include <linux/sched.h>
>  #include <linux/err.h>
>  #include <linux/irq.h>
> +#include <linux/cpuhotplug.h>
>  #include <linux/cpu.h>
>  #include <linux/sched/hotplug.h>
>  #include <asm/irq.h>
> @@ -48,17 +49,15 @@ int __cpu_disable(void)
>  	return ret;
>  }
>
> +#ifdef CONFIG_HOTPLUG_CPU
>  /*
> - * Called on the thread which is asking for a CPU to be shutdown.
> + * Called on the thread which is asking for a CPU to be shutdown, if the
> + * CPU reported dead to the hotplug core.
>   */
> -void __cpu_die(unsigned int cpu)
> +void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
>  {
>  	int ret = 0;
>
> -	if (!cpu_wait_death(cpu, 5)) {
> -		pr_err("CPU %u: didn't die\n", cpu);
> -		return;
> -	}
>  	pr_notice("CPU%u: off\n", cpu);
>
>  	/* Verify from the firmware if the cpu is really stopped*/
> @@ -75,9 +74,10 @@ void arch_cpu_idle_dead(void)
>  {
>  	idle_task_exit();
>
> -	(void)cpu_report_death();
> +	cpuhp_ap_report_dead();
>
>  	cpu_ops[smp_processor_id()]->cpu_stop();
>  	/* It should never reach here */
>  	BUG();
>  }
> +#endif

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
