Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF03C71153
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 14:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwAYwgbbZpRhDVt82osQLy+gnVgKSmAUEwjzBhcbgug=; b=g4fHL6CT/b44Gn
	xAueKLV2Cdm06qKkEhHYYVtIesu0wcwpWMizco+4Uy8M4YNndxwFIaYaL5SSpwI0CfZV9D9SXjfnX
	LhuYnzFCYdSvzIlYMq64eLbogs//+mGMK3ERYTaJpNZw/ehNhmSGEoa6iYcaG8GibpJlPi7C4vt9y
	TdOr9OKOSQDciU6pDMsoBOadKjiTVxosTE1XwW4fVqygMo4aEDbmbnDTKq5XbkqDXKFWik4ijdn1V
	s9Outk797CVsPcpGwQ+Ox//BUrenDfCZhEgB58dHacTEPA173Wrm0grsjCPfWRU5JfOYwiHA+EA5l
	kq2prUHSIzptjqWmyU4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdB28-004JI5-1R;
	Mon, 04 Sep 2023 14:58:32 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdB25-004JHG-0H
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 14:58:31 +0000
Received: by mail-lf1-x143.google.com with SMTP id 2adb3069b0e04-5009969be25so2405354e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Sep 2023 07:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693839506; x=1694444306; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ptqzv4ayBjIPdisSrQw2nrBp2o1Gw+YL2f9zUrCDrOc=;
        b=bC3h6Hg+gMstnSzxW/pY6EV7/4RP1Y5NsykyBYWSNYseuXIgmBZFYqILj7qmv4b20Y
         CSc+cITaA+yv1mKNcW2/fh9xHJQmn/3+vj1dDLWigVeN/1x0yVAguR9Zz5vCc1zwNA++
         9dy3JvS+pW7kmyDSXdjHSVWdz+f0dHqBn1Ley5qHoktymdKQqqzJIfK5C0PdIGP2VtPN
         uM1q3VlmsJjJMxlHoHIn/BUSd6zToJ93fHaqEYfdkfIvL4vhdSeiQqP5NMOSstmghtLF
         gkn4UluGzXuzCj47yPGJ4HQ/GucWb0rF9dxT9WrjWTnmQUDgSP6fxmdD4dwjxEGPIP0V
         kEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693839506; x=1694444306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptqzv4ayBjIPdisSrQw2nrBp2o1Gw+YL2f9zUrCDrOc=;
        b=Lwy8iHR7cF2qSh/tnNuXfjYDhLq0HNfNG5LKKmCCnaRSimOz6AiuAF/Wz4jXaXXEKG
         2KrG/oVSfpyCa3oG1Fkn76C5wJMWB7Ygw64tQBLoR/jyhLy/1PaWi9WkQeMCuXopqyJ8
         eEtISyT6g9BWHWdP8BjWTXi5GSPVg6t5l3KUBlxYBX/1uOaOqbZ7JUig82/nZxVOx+oZ
         ealO/TB9sVh5rLnTuERIizOXQywJlrvya8pRidwkbhs1ipmlrFBJRLKbMhEeKX2bxD59
         kbrxIAAkzGc9sOMS4/wvQBLL2+IIFN7J4NWnYYE/+/Nixtqvf2c21VLX7ZwcvIb3mHJK
         rjfw==
X-Gm-Message-State: AOJu0YxSZN4e7VGtuh42q4HYBUJFX4tAIPBhg4Ngmov6eraHC/Yw5BfM
	70zXuzkzB0w1AplRmyW/t454PQ==
X-Google-Smtp-Source: AGHT+IHvs+sfgm2fUOigaFb+tlwHMast1Vg4P3gXZwLs/phxD9msCjOeg6jS/jGm718qoTDic/HzjQ==
X-Received: by 2002:ac2:4d8e:0:b0:4fe:d0f:b4f7 with SMTP id g14-20020ac24d8e000000b004fe0d0fb4f7mr5699909lfe.65.1693839506018;
        Mon, 04 Sep 2023 07:58:26 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id c21-20020aa7df15000000b005254b41f507sm5945194edy.32.2023.09.04.07.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 07:58:25 -0700 (PDT)
Date: Mon, 4 Sep 2023 16:58:24 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Greentime Hu <greentime.hu@sifive.com>, 
	wchen <waylingii@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, David Matlack <dmatlack@google.com>, 
	Aaron Lewis <aaronlewis@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Vipin Sharma <vipinsh@google.com>, Maxim Levitsky <mlevitsk@redhat.com>, 
	Peter Gonda <pgonda@google.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Like Xu <likexu@tencent.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, Michal Luczaj <mhal@rbox.co>, 
	zhang songyi <zhang.songyi@zte.com.cn>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 8/8] KVM: riscv: selftests: Add sstc timer test
Message-ID: <20230904-a69c6a228bf4553cc58bca17@orel>
References: <cover.1693659382.git.haibo1.xu@intel.com>
 <d2b3c53537fef3f0a2d27d8be663a64123d4bc3c.1693659382.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d2b3c53537fef3f0a2d27d8be663a64123d4bc3c.1693659382.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_075829_746986_EDEB65FC 
X-CRM114-Status: GOOD (  36.16  )
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

On Sat, Sep 02, 2023 at 08:59:30PM +0800, Haibo Xu wrote:
> Add a KVM selftest to validate the Sstc timer functionality.
> The test was ported from arm64 arch timer test.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/testing/selftests/kvm/Makefile          |   1 +
>  tools/testing/selftests/kvm/arch_timer.c      |   9 ++
>  .../selftests/kvm/include/riscv/arch_timer.h  |  80 +++++++++++
>  .../selftests/kvm/include/riscv/processor.h   |  10 ++
>  .../selftests/kvm/include/timer_test.h        |   6 +
>  .../testing/selftests/kvm/riscv/arch_timer.c  | 130 ++++++++++++++++++
>  6 files changed, 236 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/include/riscv/arch_timer.h
>  create mode 100644 tools/testing/selftests/kvm/riscv/arch_timer.c
> 
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> index 01638027d059..7897d8051d8c 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -179,6 +179,7 @@ TEST_GEN_PROGS_s390x += rseq_test
>  TEST_GEN_PROGS_s390x += set_memory_region_test
>  TEST_GEN_PROGS_s390x += kvm_binary_stats_test
>  
> +TEST_GEN_PROGS_riscv += arch_timer
>  TEST_GEN_PROGS_riscv += demand_paging_test
>  TEST_GEN_PROGS_riscv += dirty_log_test
>  TEST_GEN_PROGS_riscv += get-reg-list
> diff --git a/tools/testing/selftests/kvm/arch_timer.c b/tools/testing/selftests/kvm/arch_timer.c
> index 529024f58c98..691bd454e362 100644
> --- a/tools/testing/selftests/kvm/arch_timer.c
> +++ b/tools/testing/selftests/kvm/arch_timer.c
> @@ -66,8 +66,13 @@ static void *test_vcpu_run(void *arg)
>  		break;
>  	case UCALL_ABORT:
>  		sync_global_from_guest(vm, *shared_data);
> +#ifdef __aarch64__
>  		fprintf(stderr, "Guest assert failed,  vcpu %u; stage; %u; iter: %u\n",
>  		        vcpu_idx, shared_data->guest_stage, shared_data->nr_iter);
> +#else
> +		fprintf(stderr, "Guest assert failed,  vcpu %u; iter: %u\n",
> +		        vcpu_idx, shared_data->nr_iter);
> +#endif

We can avoid this #ifdef by just letting guest_stage output as zero for
riscv.

>  		REPORT_GUEST_ASSERT(uc);
>  		break;
>  	default:
> @@ -190,7 +195,9 @@ static void test_print_help(char *name)
>  		TIMER_TEST_PERIOD_MS_DEF);
>  	pr_info("\t-m: Frequency (in ms) of vCPUs to migrate to different pCPU. 0 to turn off (default: %u)\n",
>  		TIMER_TEST_MIGRATION_FREQ_MS);
> +#ifdef __aarch64__
>  	pr_info("\t-o: Counter offset (in counter cycles, default: 0)\n");
> +#endif

We can avoid this and the next #ifdef by changing this pr_info to

 "\t-o: Counter offset (in counter cycles, default: 0) [aarch64-only]\n"

>  	pr_info("\t-h: print this help screen\n");
>  }
>  
> @@ -217,10 +224,12 @@ static bool parse_args(int argc, char *argv[])
>  		case 'm':
>  			test_args.migration_freq_ms = atoi_non_negative("Frequency", optarg);
>  			break;
> +#ifdef __aarch64__
>  		case 'o':
>  			test_args.offset.counter_offset = strtol(optarg, NULL, 0);
>  			test_args.offset.reserved = 0;
>  			break;
> +#endif
>  		case 'h':
>  		default:
>  			goto err;
> diff --git a/tools/testing/selftests/kvm/include/riscv/arch_timer.h b/tools/testing/selftests/kvm/include/riscv/arch_timer.h
> new file mode 100644
> index 000000000000..897edcef8fc2
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/include/riscv/arch_timer.h
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * RISC-V Arch Timer(sstc) specific interface
> + *
> + * Copyright (c) 2023 Intel Corporation
> + */
> +
> +#ifndef SELFTEST_KVM_ARCH_TIMER_H
> +#define SELFTEST_KVM_ARCH_TIMER_H
> +
> +#include <asm/csr.h>
> +
> +static unsigned long timer_freq;
> +
> +#define msec_to_cycles(msec)	\
> +	((timer_freq) * (uint64_t)(msec) / 1000)
> +
> +#define usec_to_cycles(usec)	\
> +	((timer_freq) * (uint64_t)(usec) / 1000000)
> +
> +#define cycles_to_usec(cycles) \
> +	((uint64_t)(cycles) * 1000000 / (timer_freq))
> +
> +static inline uint64_t timer_get_cntct(void)
> +{
> +	return csr_read(CSR_TIME);
> +}
> +
> +static inline void timer_set_cval(uint64_t cval)
> +{
> +	csr_write(CSR_STIMECMP, cval);
> +}
> +
> +static inline uint64_t timer_get_cval(void)
> +{
> +	return csr_read(CSR_STIMECMP);
> +}

The names in the above functions with cntct/cval are aarch64-isms. I'd
name the functions more explicitly: timer_get_cycles(), timer_set/get_cmp()

> +
> +static inline void timer_irq_enable(void)
> +{
> +	csr_set(CSR_SIE, IE_TIE);
> +}
> +
> +static inline void timer_irq_disable(void)
> +{
> +	csr_clear(CSR_SIE, IE_TIE);
> +}
> +
> +static inline void timer_set_next_cval_ms(uint32_t msec)

timer_set_next_cmp_ms()

> +{
> +	uint64_t now_ct = timer_get_cntct();
> +	uint64_t next_ct = now_ct + msec_to_cycles(msec);
> +
> +	timer_set_cval(next_ct);
> +}
> +
> +static inline void cpu_relax(void)
> +{
> +#ifdef __riscv_zihintpause
> +	asm volatile("pause" ::: "memory");
> +#else
> +	/* Encoding of the pause instruction */
> +	asm volatile(".4byte 0x100000F" ::: "memory");
> +#endif
> +}
> +
> +static inline void __delay(uint64_t cycles)
> +{
> +	uint64_t start = timer_get_cntct();
> +
> +	while ((timer_get_cntct() - start) < cycles)
> +		cpu_relax();
> +}
> +
> +static inline void udelay(unsigned long usec)
> +{
> +	__delay(usec_to_cycles(usec));
> +}
> +
> +#endif /* SELFTEST_KVM_ARCH_TIMER_H */
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index 6087c8fc263a..c69f36302d41 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -161,4 +161,14 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>  			unsigned long arg3, unsigned long arg4,
>  			unsigned long arg5);
>  
> +static inline void local_irq_enable(void)
> +{
> +	csr_set(CSR_SSTATUS, SR_SIE);
> +}
> +
> +static inline void local_irq_disable(void)
> +{
> +	csr_clear(CSR_SSTATUS, SR_SIE);
> +}
> +
>  #endif /* SELFTEST_KVM_PROCESSOR_H */
> diff --git a/tools/testing/selftests/kvm/include/timer_test.h b/tools/testing/selftests/kvm/include/timer_test.h
> index 109e4d635627..091c05a14c93 100644
> --- a/tools/testing/selftests/kvm/include/timer_test.h
> +++ b/tools/testing/selftests/kvm/include/timer_test.h
> @@ -18,6 +18,7 @@
>  
>  #define msecs_to_usecs(msec)    ((msec) * 1000LL)
>  
> +#ifdef __aarch64__
>  #define GICD_BASE_GPA    0x8000000ULL
>  #define GICR_BASE_GPA    0x80A0000ULL
>  
> @@ -28,6 +29,7 @@ enum guest_stage {
>  	GUEST_STAGE_PTIMER_TVAL,
>  	GUEST_STAGE_MAX,
>  };
> +#endif

No need for this #ifdef, just move these aarch64 things to
aarch64/arch_timer.c

>  
>  /* Timer test cmdline parameters */
>  struct test_args
> @@ -36,13 +38,17 @@ struct test_args
>  	int nr_iter;
>  	int timer_period_ms;
>  	int migration_freq_ms;
> +#ifdef __aarch64__
>  	struct kvm_arm_counter_offset offset;
> +#endif

test_args shouldn't have aarch64 stuff in it. We can change it to
uint64_t offset, which riscv won't use, and aarch64 will pack it
into a struct kvm_arm_counter_offset when it needs to use it.

>  };
>  
>  /* Shared variables between host and guest */
>  struct test_vcpu_shared_data {
>  	int nr_iter;
> +#ifdef __aarch64__
>  	enum guest_stage guest_stage;
> +#endif

No need for #ifdef. Each arch can define it's own guest_stage enum in its
own test file. riscv won't have any stages defined.

>  	uint64_t xcnt;
>  };
>  
> diff --git a/tools/testing/selftests/kvm/riscv/arch_timer.c b/tools/testing/selftests/kvm/riscv/arch_timer.c
> new file mode 100644
> index 000000000000..c50a33c1e4f9
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/riscv/arch_timer.c
> @@ -0,0 +1,130 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * arch_timer.c - Tests the riscv64 sstc timer IRQ functionality
> + *
> + * The test validates the sstc timer IRQs using vstimecmp registers.
> + * It's ported from the aarch64 arch_timer test.
> + *
> + * Copyright (c) 2023, Intel Corporation.
> + */
> +
> +#define _GNU_SOURCE
> +
> +#include "arch_timer.h"
> +#include "kvm_util.h"
> +#include "processor.h"
> +#include "timer_test.h"
> +
> +extern struct test_args test_args;
> +extern struct kvm_vcpu *vcpus[];
> +extern struct test_vcpu_shared_data vcpu_shared_data[];
> +
> +static int timer_irq = IRQ_S_TIMER;
> +
> +static void
> +guest_configure_timer_action(struct test_vcpu_shared_data *shared_data)
> +{
> +	timer_set_next_cval_ms(test_args.timer_period_ms);
> +	shared_data->xcnt = timer_get_cntct();
> +	timer_irq_enable();
> +}
> +
> +static void guest_validate_irq(unsigned int intid,
> +				struct test_vcpu_shared_data *shared_data)
> +{
> +	uint64_t xcnt = 0, xcnt_diff_us, cval = 0;

Don't need to initialize xcnt and cval, they get overwritten right away.
(cval should be renamed to cmp)

> +
> +	timer_irq_disable();
> +	xcnt = timer_get_cntct();
> +	cval = timer_get_cval();
> +
> +	xcnt_diff_us = cycles_to_usec(xcnt - shared_data->xcnt);
> +
> +	/* Make sure we are dealing with the correct timer IRQ */
> +	GUEST_ASSERT_EQ(intid, timer_irq);
> +
> +	__GUEST_ASSERT(xcnt >= cval,
> +	               "xcnt = 0x%llx, cval = 0x%llx, xcnt_diff_us = 0x%llx",
> +	               xcnt, cval, xcnt_diff_us);
> +
> +	WRITE_ONCE(shared_data->nr_iter, shared_data->nr_iter + 1);
> +}
> +
> +static void guest_irq_handler(struct ex_regs *regs)
> +{
> +	unsigned int intid = regs->cause & ~CAUSE_IRQ_FLAG;
> +	uint32_t cpu = guest_get_vcpuid();
> +	struct test_vcpu_shared_data *shared_data = &vcpu_shared_data[cpu];
> +
> +	guest_validate_irq(intid, shared_data);
> +}
> +
> +static void guest_run(struct test_vcpu_shared_data *shared_data)
> +{
> +	uint32_t irq_iter, config_iter;
> +
> +	shared_data->nr_iter = 0;
> +
> +	for (config_iter = 0; config_iter < test_args.nr_iter; config_iter++) {
> +		/* Setup the next interrupt */
> +		guest_configure_timer_action(shared_data);
> +
> +		/* Setup a timeout for the interrupt to arrive */
> +		udelay(msecs_to_usecs(test_args.timer_period_ms) +
> +			TIMER_TEST_ERR_MARGIN_US);
> +
> +		irq_iter = READ_ONCE(shared_data->nr_iter);
> +		GUEST_ASSERT_EQ(config_iter + 1, irq_iter);
> +	}
> +}

guest_run[_stage]() can be shared with aarch64, we just have a single
stage=0 for riscv.

> +
> +static void guest_code(void)
> +{
> +	uint32_t cpu = guest_get_vcpuid();
> +	struct test_vcpu_shared_data *shared_data = &vcpu_shared_data[cpu];
> +
> +	local_irq_disable();
> +	timer_irq_disable();
> +	local_irq_enable();

I don't think we need to disable all interrupts when disabling the timer
interrupt.

> +
> +	guest_run(shared_data);
> +
> +	GUEST_DONE();
> +}
> +
> +static void test_init_timer_freq(struct kvm_vm *vm)
> +{
> +	/* Timer frequency should be same for all the vCPUs, so query only vCPU-0 */
> +	vcpu_get_reg(vcpus[0], RISCV_TIMER_REG(frequency), &timer_freq);
> +	sync_global_to_guest(vm, timer_freq);
> +
> +	pr_debug("timer_freq: %lu\n", timer_freq);
> +}
> +
> +struct kvm_vm *test_vm_create(void)
> +{
> +	struct kvm_vm *vm;
> +	int nr_vcpus = test_args.nr_vcpus;
> +
> +	vm = vm_create_with_vcpus(nr_vcpus, guest_code, vcpus);
> +	__TEST_REQUIRE(vcpu_has_ext(vcpus[0], KVM_RISCV_ISA_EXT_SSTC),
> +				   "SSTC not available, skipping test\n");

This will assert on get-one-reg rather than skip the test.

> +
> +	vm_init_vector_tables(vm);
> +	vm_install_interrupt_handler(vm, guest_irq_handler);
> +
> +	for (int i = 0; i < nr_vcpus; i++)
> +		vcpu_init_vector_tables(vcpus[i]);
> +
> +	test_init_timer_freq(vm);
> +
> +	/* Make all the test's cmdline args visible to the guest */
> +	sync_global_to_guest(vm, test_args);
> +
> +	return vm;
> +}
> +
> +void test_vm_cleanup(struct kvm_vm *vm)
> +{
> +	kvm_vm_free(vm);
> +}
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
