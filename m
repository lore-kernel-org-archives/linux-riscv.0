Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD8BE7717D
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 05:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=whVTbc/FQx7BptHBKHTIYBMxcRwPCJ9fjqC+VZwmLtM=; b=qTfG0mwg7L6G0B
	DP7nSxJekBGFE+6zgq7togfgJdFqxniFHM/ilEicIbtaowDjT/gkTs/cgMg7Rxgk8hYxmrlBjGPEn
	vqB+NiPgAkgBIFWJEi2yMgwelECcfmiSM/upygKzorHrjXpB/QtbZ0db96RONouqw9Az2f37xcuJR
	b7XkT6vCi70bKH4s5UI3onB0+mPKCkAF+DGLEh2j7HBv/oG5QV4+tqQLeeEIzKBh88jW5zMUgomhX
	vtShB9ekklovn0KqbnrNtY4zim22m2fBSPrZmMRazdPJSyVueEHmdHuVQNIK5f+quZwb5kBuBbudg
	UpkvwoFjtq7tyVtswdfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLxqD-00000002jY0-1iSr;
	Fri, 13 Dec 2024 05:03:53 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLxqA-00000002jXF-1IpY
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 05:03:51 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-725f4025e25so1131836b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Dec 2024 21:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734066229; x=1734671029; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NXNevEN0n9qVncZh5Qf4Le7HtbaM6bdBPRxi3/t0UF4=;
        b=nHEBejUiF0wQJI14VmqQc2Bifieu/RtV+D7NcixZTcxSVDmX6OalkFxEhM6d8B+lBt
         7PFOasMBH+i4cxEj2J9UXcnVOVziAFsiMCZtFezV3KYkf0nTH1urwgFW7T5rDFuUDSat
         q6RAShbRSGSDDkgzmRnq5MJIRZSCIsxPPSJD8xSoSozxmE1GH8HMCT1/azTN8vXbj/Gz
         iF+V6bmGRuHfjL0Rp5aOJlw7jnG/BSqTcQqelS/WkfifKlHa5wOPOjiPlMR/TBb1pZHf
         aLrR/JM8nfmAFDX+MGcixZryEEsmIWjunzdzjUJPPaw7qseAgXk42qtEfQYGbkCFIfEO
         2hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734066229; x=1734671029;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NXNevEN0n9qVncZh5Qf4Le7HtbaM6bdBPRxi3/t0UF4=;
        b=KNoQf6rvCv5Q3lyKdF2KHPXwXiVPIRNAkaAOkv7lH+/8+tQ7psaJob25B91NWllt3N
         uNOL5gr4foNpDT/CGrzAZv0d0VesaVRypI1m7jhFYB9bbk5mdBp9Dmd8cfknlGAnM2er
         JZGKY3yNCNoegPKxCVq6dhC030P5OBan4n6qABr1/tVPcuY8/DwWqGRJJ6Y4gJUOzh/x
         i1C8ny3D/L4l+erieH/cDBqivxgYmYHfPVce5YiBCqv3InSUwfqFAWtt5TDivlRtUgxQ
         Hfc7bKrZ6BlVZYuyk7TCLKqfzfv4FZQe9Dtw7aVS3z9QywABMvotOZDWRZRT5VzJjS9J
         tjhA==
X-Forwarded-Encrypted: i=1; AJvYcCX4Pe4ccUR3ZtPvFWgdSYHtqfdLpJSmv8t+AEJd0oOuop7Sd10zaUGCWpLUpFp1mCqzIAYSZccqCmjSiA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUwSi1EIo3SDSbiLUSowdAIV44yoQwWCdOwdq45/LrfY+vzzQm
	S2JKVED+x2z/SkG1mg6gqwtTwcjvEUqM5ZIR3OmLBudviYNCCpslx4VuB6N0CR8=
X-Gm-Gg: ASbGncvQhrdi2McVWSyydokLaBbqnJasHQgLGBqEt1E1B+ydIMi3jb45NQFQ01pLCf1
	uDSU/cBXgvH5OjbEaDEVrd3UQggk2v1n+yQcZ71h9iKN62RLlLxN/rt8q11izkKQ6PzJ8k2d2FH
	CsBVRfZzPx+8ULYRpucSzJMcWtMwzhdMXTfhecD/1gjGGnjHlNd1uxvWpyYT34r5k1ryexm4s66
	0rS0luUQDYbfW24BYrVRsDBz5qbDUuCZ7wBV9q5gbkEwwIHYQRqeJI=
X-Google-Smtp-Source: AGHT+IE2uIF/uxgtYtuLqbH276nU5dfIbzVoT0gqYVwEFkKaRaQqe1w7myZtuVqmqyjoTvwzoz9YyQ==
X-Received: by 2002:a05:6a20:6a03:b0:1e0:d867:c880 with SMTP id adf61e73a8af0-1e1dfe3eb61mr1781927637.42.1734066229289;
        Thu, 12 Dec 2024 21:03:49 -0800 (PST)
Received: from ventana ([49.37.251.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725c9ec7217sm11162179b3a.60.2024.12.12.21.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 21:03:48 -0800 (PST)
Date: Fri, 13 Dec 2024 10:33:43 +0530
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Atish Patra <atishp@atishpatra.org>
Subject: Re: [PATCH v3 3/4] drivers: firmware: add riscv SSE support
Message-ID: <Z1vALzeks+6Fkf9/@ventana>
References: <20241206163102.843505-1-cleger@rivosinc.com>
 <20241206163102.843505-4-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241206163102.843505-4-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_210350_577592_9E4FF81E 
X-CRM114-Status: GOOD (  28.65  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Clement,

On Fri, Dec 06, 2024 at 05:30:59PM +0100, Cl=E9ment L=E9ger wrote:
> Add driver level interface to use RISC-V SSE arch support. This interface
> allows registering SSE handlers, and receive them. This will be used by
> PMU and GHES driver.
> =

> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> Co-developed-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  MAINTAINERS                        |  14 +
>  drivers/firmware/Kconfig           |   1 +
>  drivers/firmware/Makefile          |   1 +
>  drivers/firmware/riscv/Kconfig     |  15 +
>  drivers/firmware/riscv/Makefile    |   3 +
>  drivers/firmware/riscv/riscv_sse.c | 691 +++++++++++++++++++++++++++++
>  include/linux/riscv_sse.h          |  56 +++
>  7 files changed, 781 insertions(+)
>  create mode 100644 drivers/firmware/riscv/Kconfig
>  create mode 100644 drivers/firmware/riscv/Makefile
>  create mode 100644 drivers/firmware/riscv/riscv_sse.c
>  create mode 100644 include/linux/riscv_sse.h
> =

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 686109008d8e..a3ddde7fe9fb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20125,6 +20125,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel=
/git/iommu/linux.git
>  F:	Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
>  F:	drivers/iommu/riscv/
>  =

> +RISC-V FIRMWARE DRIVERS
> +M:	Conor Dooley <conor@kernel.org>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
> +F:	drivers/firmware/riscv/*
> +
>  RISC-V MICROCHIP FPGA SUPPORT
>  M:	Conor Dooley <conor.dooley@microchip.com>
>  M:	Daire McNamara <daire.mcnamara@microchip.com>
> @@ -20177,6 +20184,13 @@ F:	drivers/perf/riscv_pmu.c
>  F:	drivers/perf/riscv_pmu_legacy.c
>  F:	drivers/perf/riscv_pmu_sbi.c
>  =

> +RISC-V SSE DRIVER
> +M:	Cl=E9ment L=E9ger <cleger@rivosinc.com>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +F:	drivers/firmware/riscv/riscv_sse.c
> +F:	include/linux/riscv_sse.h
> +

I request you to add me as a reviewer to these SSE files.
Himanshu Chauhan <himanshu@thechauhan.dev>

Thanks
Regards
Himanshu

>  RISC-V THEAD SoC SUPPORT
>  M:	Drew Fustini <drew@pdp7.com>
>  M:	Guo Ren <guoren@kernel.org>
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index 71d8b26c4103..9e996a1fd511 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -267,6 +267,7 @@ source "drivers/firmware/meson/Kconfig"
>  source "drivers/firmware/microchip/Kconfig"
>  source "drivers/firmware/psci/Kconfig"
>  source "drivers/firmware/qcom/Kconfig"
> +source "drivers/firmware/riscv/Kconfig"
>  source "drivers/firmware/smccc/Kconfig"
>  source "drivers/firmware/tegra/Kconfig"
>  source "drivers/firmware/xilinx/Kconfig"
> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> index 7a8d486e718f..c0f5009949a8 100644
> --- a/drivers/firmware/Makefile
> +++ b/drivers/firmware/Makefile
> @@ -33,6 +33,7 @@ obj-y				+=3D efi/
>  obj-y				+=3D imx/
>  obj-y				+=3D psci/
>  obj-y				+=3D qcom/
> +obj-y				+=3D riscv/
>  obj-y				+=3D smccc/
>  obj-y				+=3D tegra/
>  obj-y				+=3D xilinx/
> diff --git a/drivers/firmware/riscv/Kconfig b/drivers/firmware/riscv/Kcon=
fig
> new file mode 100644
> index 000000000000..8056ed3262d9
> --- /dev/null
> +++ b/drivers/firmware/riscv/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +menu "Risc-V Specific firmware drivers"
> +depends on RISCV
> +
> +config RISCV_SSE
> +	bool "Enable SBI Supervisor Software Events support"
> +	depends on RISCV_SBI
> +	default y
> +	help
> +	  The Supervisor Software Events support allow the SBI to deliver
> +	  NMI-like notifications to the supervisor mode software. When enable,
> +	  this option provides support to register callbacks on specific SSE
> +	  events.
> +
> +endmenu
> diff --git a/drivers/firmware/riscv/Makefile b/drivers/firmware/riscv/Mak=
efile
> new file mode 100644
> index 000000000000..4ccfcbbc28ea
> --- /dev/null
> +++ b/drivers/firmware/riscv/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_RISCV_SSE)		+=3D riscv_sse.o
> diff --git a/drivers/firmware/riscv/riscv_sse.c b/drivers/firmware/riscv/=
riscv_sse.c
> new file mode 100644
> index 000000000000..c165e32cc9a5
> --- /dev/null
> +++ b/drivers/firmware/riscv/riscv_sse.c
> @@ -0,0 +1,691 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2024 Rivos Inc.
> + */
> +
> +#define pr_fmt(fmt) "sse: " fmt
> +
> +#include <linux/cpu.h>
> +#include <linux/cpuhotplug.h>
> +#include <linux/cpu_pm.h>
> +#include <linux/hardirq.h>
> +#include <linux/list.h>
> +#include <linux/percpu-defs.h>
> +#include <linux/reboot.h>
> +#include <linux/riscv_sse.h>
> +#include <linux/slab.h>
> +
> +#include <asm/sbi.h>
> +#include <asm/sse.h>
> +
> +struct sse_event {
> +	struct list_head list;
> +	u32 evt;
> +	u32 priority;
> +	sse_event_handler *handler;
> +	void *handler_arg;
> +	bool is_enabled;
> +	/* Only valid for global events */
> +	unsigned int cpu;
> +
> +	union {
> +		struct sse_registered_event *global;
> +		struct sse_registered_event __percpu *local;
> +	};
> +};
> +
> +static int sse_hp_state;
> +static bool sse_available;
> +static DEFINE_SPINLOCK(events_list_lock);
> +static LIST_HEAD(events);
> +static DEFINE_MUTEX(sse_mutex);
> +
> +struct sse_registered_event {
> +	struct sse_event_arch_data arch;
> +	struct sse_event *evt;
> +	unsigned long attr_buf;
> +};
> +
> +void sse_handle_event(struct sse_event_arch_data *arch_event,
> +		      struct pt_regs *regs)
> +{
> +	int ret;
> +	struct sse_registered_event *reg_evt =3D
> +		container_of(arch_event, struct sse_registered_event, arch);
> +	struct sse_event *evt =3D reg_evt->evt;
> +
> +	ret =3D evt->handler(evt->evt, evt->handler_arg, regs);
> +	if (ret)
> +		pr_warn("event %x handler failed with error %d\n", evt->evt,
> +			ret);
> +}
> +
> +static bool sse_event_is_global(u32 evt)
> +{
> +	return !!(evt & SBI_SSE_EVENT_GLOBAL);
> +}
> +
> +static
> +struct sse_event *sse_event_get(u32 evt)
> +{
> +	struct sse_event *sse_evt =3D NULL, *tmp;
> +
> +	scoped_guard(spinlock, &events_list_lock) {
> +		list_for_each_entry(tmp, &events, list) {
> +			if (tmp->evt =3D=3D evt) {
> +				return sse_evt;
> +			}
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
> +static phys_addr_t sse_event_get_phys(struct sse_registered_event *reg_e=
vt,
> +				      void *addr)
> +{
> +	phys_addr_t phys;
> +
> +	if (sse_event_is_global(reg_evt->evt->evt))
> +		phys =3D virt_to_phys(addr);
> +	else
> +		phys =3D per_cpu_ptr_to_phys(addr);
> +
> +	return phys;
> +}
> +
> +static int sse_sbi_event_func(struct sse_event *event, unsigned long fun=
c)
> +{
> +	struct sbiret ret;
> +	u32 evt =3D event->evt;
> +
> +	ret =3D sbi_ecall(SBI_EXT_SSE, func, evt, 0, 0, 0, 0, 0);
> +	if (ret.error)
> +		pr_debug("Failed to execute func %lx, event %x, error %ld\n",
> +			 func, evt, ret.error);
> +
> +	return sbi_err_map_linux_errno(ret.error);
> +}
> +
> +static int sse_sbi_disable_event(struct sse_event *event)
> +{
> +	return sse_sbi_event_func(event, SBI_SSE_EVENT_DISABLE);
> +}
> +
> +static int sse_sbi_enable_event(struct sse_event *event)
> +{
> +	return sse_sbi_event_func(event, SBI_SSE_EVENT_ENABLE);
> +}
> +
> +static int sse_event_attr_get_no_lock(struct sse_registered_event *reg_e=
vt,
> +				      unsigned long attr_id, unsigned long *val)
> +{
> +	struct sbiret sret;
> +	u32 evt =3D reg_evt->evt->evt;
> +	unsigned long phys;
> +
> +	phys =3D sse_event_get_phys(reg_evt, &reg_evt->attr_buf);
> +
> +	sret =3D sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_READ, evt,
> +				     attr_id, 1, phys, 0, 0);
> +	if (sret.error) {
> +		pr_debug("Failed to get event %x attr %lx, error %ld\n", evt,
> +			 attr_id, sret.error);
> +		return sbi_err_map_linux_errno(sret.error);
> +	}
> +
> +	*val =3D reg_evt->attr_buf;
> +
> +	return 0;
> +}
> +
> +static int sse_event_attr_set_nolock(struct sse_registered_event *reg_ev=
t,
> +				     unsigned long attr_id, unsigned long val)
> +{
> +	struct sbiret sret;
> +	u32 evt =3D reg_evt->evt->evt;
> +	unsigned long phys;
> +
> +	reg_evt->attr_buf =3D val;
> +	phys =3D sse_event_get_phys(reg_evt, &reg_evt->attr_buf);
> +
> +	sret =3D sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_WRITE, evt,
> +				     attr_id, 1, phys, 0, 0);
> +	if (sret.error && sret.error !=3D SBI_ERR_INVALID_STATE) {
> +		pr_debug("Failed to set event %x attr %lx, error %ld\n", evt,
> +			 attr_id, sret.error);
> +		return sbi_err_map_linux_errno(sret.error);
> +	}
> +
> +	return 0;
> +}
> +
> +static int sse_event_set_target_cpu_nolock(struct sse_event *event,
> +					   unsigned int cpu)
> +{
> +	unsigned int hart_id =3D cpuid_to_hartid_map(cpu);
> +	struct sse_registered_event *reg_evt =3D event->global;
> +	u32 evt =3D event->evt;
> +	bool was_enabled;
> +	int ret;
> +
> +	if (!sse_event_is_global(evt))
> +		return -EINVAL;
> +
> +	was_enabled =3D event->is_enabled;
> +	if (was_enabled)
> +		sse_sbi_disable_event(event);
> +	do {
> +		ret =3D sse_event_attr_set_nolock(reg_evt,
> +						SBI_SSE_ATTR_PREFERRED_HART,
> +						hart_id);
> +	} while (ret =3D=3D -EINVAL);
> +
> +	if (ret =3D=3D 0)
> +		event->cpu =3D cpu;
> +
> +	if (was_enabled)
> +		sse_sbi_enable_event(event);
> +
> +	return 0;
> +}
> +
> +int sse_event_set_target_cpu(struct sse_event *event, unsigned int cpu)
> +{
> +	int ret;
> +
> +	scoped_guard(mutex, &sse_mutex) {
> +		cpus_read_lock();
> +
> +		if (!cpu_online(cpu))
> +			return -EINVAL;
> +
> +		ret =3D sse_event_set_target_cpu_nolock(event, cpu);
> +
> +		cpus_read_unlock();
> +	}
> +
> +	return ret;
> +}
> +
> +static int sse_event_init_registered(unsigned int cpu,
> +				     struct sse_registered_event *reg_evt,
> +				     struct sse_event *event)
> +{
> +	reg_evt->evt =3D event;
> +	arch_sse_init_event(&reg_evt->arch, event->evt, cpu);
> +
> +	return 0;
> +}
> +
> +static void sse_event_free_registered(struct sse_registered_event *reg_e=
vt)
> +{
> +	arch_sse_free_event(&reg_evt->arch);
> +}
> +
> +static int sse_event_alloc_global(struct sse_event *event)
> +{
> +	int err;
> +	struct sse_registered_event *reg_evt;
> +
> +	reg_evt =3D kzalloc(sizeof(*reg_evt), GFP_KERNEL);
> +	if (!reg_evt)
> +		return -ENOMEM;
> +
> +	event->global =3D reg_evt;
> +	err =3D sse_event_init_registered(smp_processor_id(), reg_evt,
> +					event);
> +	if (err)
> +		kfree(reg_evt);
> +
> +	return err;
> +}
> +
> +static int sse_event_alloc_local(struct sse_event *event)
> +{
> +	int err;
> +	unsigned int cpu, err_cpu;
> +	struct sse_registered_event *reg_evt;
> +	struct sse_registered_event __percpu *reg_evts;
> +
> +	reg_evts =3D alloc_percpu(struct sse_registered_event);
> +	if (!reg_evts)
> +		return -ENOMEM;
> +
> +	event->local =3D reg_evts;
> +
> +	for_each_possible_cpu(cpu) {
> +		reg_evt =3D per_cpu_ptr(reg_evts, cpu);
> +		err =3D sse_event_init_registered(cpu, reg_evt, event);
> +		if (err) {
> +			err_cpu =3D cpu;
> +			goto err_free_per_cpu;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_free_per_cpu:
> +	for_each_possible_cpu(cpu) {
> +		if (cpu =3D=3D err_cpu)
> +			break;
> +		reg_evt =3D per_cpu_ptr(reg_evts, cpu);
> +		sse_event_free_registered(reg_evt);
> +	}
> +
> +	free_percpu(reg_evts);
> +
> +	return err;
> +}
> +
> +static struct sse_event *sse_event_alloc(u32 evt,
> +					 u32 priority,
> +					 sse_event_handler *handler, void *arg)
> +{
> +	int err;
> +	struct sse_event *event;
> +
> +	event =3D kzalloc(sizeof(*event), GFP_KERNEL);
> +	if (!event)
> +		return ERR_PTR(-ENOMEM);
> +
> +	event->evt =3D evt;
> +	event->priority =3D priority;
> +	event->handler_arg =3D arg;
> +	event->handler =3D handler;
> +
> +	if (sse_event_is_global(evt)) {
> +		err =3D sse_event_alloc_global(event);
> +		if (err)
> +			goto err_alloc_reg_evt;
> +	} else {
> +		err =3D sse_event_alloc_local(event);
> +		if (err)
> +			goto err_alloc_reg_evt;
> +	}
> +
> +	return event;
> +
> +err_alloc_reg_evt:
> +	kfree(event);
> +
> +	return ERR_PTR(err);
> +}
> +
> +static int sse_sbi_register_event(struct sse_event *event,
> +				  struct sse_registered_event *reg_evt)
> +{
> +	int ret;
> +
> +	ret =3D sse_event_attr_set_nolock(reg_evt, SBI_SSE_ATTR_PRIO,
> +					event->priority);
> +	if (ret)
> +		return ret;
> +
> +	return arch_sse_register_event(&reg_evt->arch);
> +}
> +
> +static int sse_event_register_local(struct sse_event *event)
> +{
> +	int ret;
> +	struct sse_registered_event *reg_evt =3D per_cpu_ptr(event->local,
> +							   smp_processor_id());
> +
> +	ret =3D sse_sbi_register_event(event, reg_evt);
> +	if (ret)
> +		pr_debug("Failed to register event %x: err %d\n", event->evt,
> +			 ret);
> +
> +	return ret;
> +}
> +
> +
> +static int sse_sbi_unregister_event(struct sse_event *event)
> +{
> +	return sse_sbi_event_func(event, SBI_SSE_EVENT_UNREGISTER);
> +}
> +
> +struct sse_per_cpu_evt {
> +	struct sse_event *event;
> +	unsigned long func;
> +	atomic_t error;
> +};
> +
> +static void sse_event_per_cpu_func(void *info)
> +{
> +	int ret;
> +	struct sse_per_cpu_evt *cpu_evt =3D info;
> +
> +	if (cpu_evt->func =3D=3D SBI_SSE_EVENT_REGISTER)
> +		ret =3D sse_event_register_local(cpu_evt->event);
> +	else
> +		ret =3D sse_sbi_event_func(cpu_evt->event, cpu_evt->func);
> +
> +	if (ret)
> +		atomic_set(&cpu_evt->error, ret);
> +}
> +
> +static void sse_event_free(struct sse_event *event)
> +{
> +	unsigned int cpu;
> +	struct sse_registered_event *reg_evt;
> +
> +	if (sse_event_is_global(event->evt)) {
> +		sse_event_free_registered(event->global);
> +		kfree(event->global);
> +	} else {
> +		for_each_possible_cpu(cpu) {
> +			reg_evt =3D per_cpu_ptr(event->local, cpu);
> +			sse_event_free_registered(reg_evt);
> +		}
> +		free_percpu(event->local);
> +	}
> +
> +	kfree(event);
> +}
> +
> +int sse_event_enable(struct sse_event *event)
> +{
> +	int ret =3D 0;
> +	struct sse_per_cpu_evt cpu_evt;
> +
> +	scoped_guard(mutex, &sse_mutex) {
> +		cpus_read_lock();
> +		if (sse_event_is_global(event->evt)) {
> +			ret =3D sse_sbi_enable_event(event);
> +		} else {
> +			cpu_evt.event =3D event;
> +			atomic_set(&cpu_evt.error, 0);
> +			cpu_evt.func =3D SBI_SSE_EVENT_ENABLE;
> +			on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
> +			ret =3D atomic_read(&cpu_evt.error);
> +			if (ret) {
> +				cpu_evt.func =3D SBI_SSE_EVENT_DISABLE;
> +				on_each_cpu(sse_event_per_cpu_func, &cpu_evt,
> +					    1);
> +			}
> +		}
> +		cpus_read_unlock();
> +
> +		if (ret =3D=3D 0)
> +			event->is_enabled =3D true;
> +	}
> +
> +	return ret;
> +}
> +
> +static void sse_events_mask(void)
> +{
> +	sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_HART_MASK, 0, 0, 0, 0, 0, 0);
> +}
> +
> +static void sse_events_unmask(void)
> +{
> +	sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_HART_UNMASK, 0, 0, 0, 0, 0, 0);
> +}
> +
> +static void sse_event_disable_nolock(struct sse_event *event)
> +{
> +	struct sse_per_cpu_evt cpu_evt;
> +
> +	if (sse_event_is_global(event->evt)) {
> +		sse_sbi_disable_event(event);
> +	} else {
> +		cpu_evt.event =3D event;
> +		cpu_evt.func =3D SBI_SSE_EVENT_DISABLE;
> +		on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
> +	}
> +}
> +
> +void sse_event_disable(struct sse_event *event)
> +{
> +	scoped_guard(mutex, &sse_mutex) {
> +		cpus_read_lock();
> +		sse_event_disable_nolock(event);
> +		event->is_enabled =3D false;
> +		cpus_read_unlock();
> +	}
> +}
> +
> +struct sse_event *sse_event_register(u32 evt, u32 priority,
> +				     sse_event_handler *handler, void *arg)
> +{
> +	struct sse_per_cpu_evt cpu_evt;
> +	struct sse_event *event;
> +	int ret =3D 0;
> +
> +	if (!sse_available)
> +		return ERR_PTR(-EOPNOTSUPP);
> +
> +	mutex_lock(&sse_mutex);
> +	if (sse_event_get(evt)) {
> +		pr_debug("Event %x already registered\n", evt);
> +		ret =3D -EEXIST;
> +		goto out_unlock;
> +	}
> +
> +	event =3D sse_event_alloc(evt, priority, handler, arg);
> +	if (IS_ERR(event)) {
> +		ret =3D PTR_ERR(event);
> +		goto out_unlock;
> +	}
> +
> +	cpus_read_lock();
> +	if (sse_event_is_global(evt)) {
> +		unsigned long preferred_hart;
> +
> +		ret =3D sse_event_attr_get_no_lock(event->global,
> +						 SBI_SSE_ATTR_PREFERRED_HART,
> +						 &preferred_hart);
> +		if (ret)
> +			goto err_event_free;
> +		event->cpu =3D riscv_hartid_to_cpuid(preferred_hart);
> +
> +		ret =3D sse_sbi_register_event(event, event->global);
> +		if (ret)
> +			goto err_event_free;
> +
> +	} else {
> +		cpu_evt.event =3D event;
> +		atomic_set(&cpu_evt.error, 0);
> +		cpu_evt.func =3D SBI_SSE_EVENT_REGISTER;
> +		on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
> +		ret =3D atomic_read(&cpu_evt.error);
> +		if (ret) {
> +			cpu_evt.func =3D SBI_SSE_EVENT_UNREGISTER;
> +			on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
> +			goto err_event_free;
> +		}
> +	}
> +	cpus_read_unlock();
> +
> +	scoped_guard(spinlock, &events_list_lock)
> +		list_add(&event->list, &events);
> +
> +	mutex_unlock(&sse_mutex);
> +
> +	return event;
> +
> +err_event_free:
> +	cpus_read_unlock();
> +	sse_event_free(event);
> +out_unlock:
> +	mutex_unlock(&sse_mutex);
> +
> +	return ERR_PTR(ret);
> +}
> +
> +static void sse_event_unregister_nolock(struct sse_event *event)
> +{
> +	struct sse_per_cpu_evt cpu_evt;
> +
> +	if (sse_event_is_global(event->evt)) {
> +		sse_sbi_unregister_event(event);
> +	} else {
> +		cpu_evt.event =3D event;
> +		cpu_evt.func =3D SBI_SSE_EVENT_UNREGISTER;
> +		on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
> +	}
> +}
> +
> +void sse_event_unregister(struct sse_event *event)
> +{
> +	scoped_guard(mutex, &sse_mutex) {
> +		cpus_read_lock();
> +		sse_event_unregister_nolock(event);
> +		cpus_read_unlock();
> +
> +		scoped_guard(spinlock, &events_list_lock)
> +			list_del(&event->list);
> +
> +		sse_event_free(event);
> +	}
> +}
> +
> +static int sse_cpu_online(unsigned int cpu)
> +{
> +	struct sse_event *sse_evt;
> +
> +	scoped_guard(spinlock, &events_list_lock) {
> +		list_for_each_entry(sse_evt, &events, list) {
> +			if (sse_event_is_global(sse_evt->evt))
> +				continue;
> +
> +			sse_event_register_local(sse_evt);
> +			if (sse_evt->is_enabled)
> +				sse_sbi_enable_event(sse_evt);
> +		}
> +	}
> +
> +	/* Ready to handle events. Unmask SSE. */
> +	sse_events_unmask();
> +
> +	return 0;
> +}
> +
> +static int sse_cpu_teardown(unsigned int cpu)
> +{
> +	unsigned int next_cpu;
> +	struct sse_event *sse_evt;
> +
> +	/* Mask the sse events */
> +	sse_events_mask();
> +
> +	scoped_guard(spinlock, &events_list_lock) {
> +		list_for_each_entry(sse_evt, &events, list) {
> +			if (!sse_event_is_global(sse_evt->evt)) {
> +
> +				if (sse_evt->is_enabled)
> +					sse_sbi_disable_event(sse_evt);
> +
> +				sse_sbi_unregister_event(sse_evt);
> +				continue;
> +			}
> +
> +			if (sse_evt->cpu !=3D smp_processor_id())
> +				continue;
> +
> +			/* Update destination hart for global event */
> +			next_cpu =3D cpumask_any_but(cpu_online_mask, cpu);
> +			sse_event_set_target_cpu_nolock(sse_evt, next_cpu);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void sse_reset(void)
> +{
> +	struct sse_event *event =3D NULL;
> +
> +	list_for_each_entry(event, &events, list) {
> +		sse_event_disable_nolock(event);
> +		sse_event_unregister_nolock(event);
> +	}
> +}
> +
> +static int sse_pm_notifier(struct notifier_block *nb, unsigned long acti=
on,
> +			   void *data)
> +{
> +	WARN_ON_ONCE(preemptible());
> +
> +	switch (action) {
> +	case CPU_PM_ENTER:
> +		sse_events_mask();
> +		break;
> +	case CPU_PM_EXIT:
> +	case CPU_PM_ENTER_FAILED:
> +		sse_events_unmask();
> +		break;
> +	default:
> +		return NOTIFY_DONE;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +static struct notifier_block sse_pm_nb =3D {
> +	.notifier_call =3D sse_pm_notifier,
> +};
> +
> +/*
> + * Mask all CPUs and unregister all events on panic, reboot or kexec.
> + */
> +static int sse_reboot_notifier(struct notifier_block *nb, unsigned long =
action,
> +				void *data)
> +{
> +	cpuhp_remove_state(sse_hp_state);
> +
> +	sse_reset();
> +
> +	return NOTIFY_OK;
> +}
> +
> +static struct notifier_block sse_reboot_nb =3D {
> +	.notifier_call =3D sse_reboot_notifier,
> +};
> +
> +static int __init sse_init(void)
> +{
> +	int cpu, ret;
> +
> +	if (sbi_probe_extension(SBI_EXT_SSE) <=3D 0) {
> +		pr_err("Missing SBI SSE extension\n");
> +		return -EOPNOTSUPP;
> +	}
> +	pr_info("SBI SSE extension detected\n");
> +
> +	for_each_possible_cpu(cpu)
> +		INIT_LIST_HEAD(&events);
> +
> +	ret =3D cpu_pm_register_notifier(&sse_pm_nb);
> +	if (ret) {
> +		pr_warn("Failed to register CPU PM notifier...\n");
> +		return ret;
> +	}
> +
> +	ret =3D register_reboot_notifier(&sse_reboot_nb);
> +	if (ret) {
> +		pr_warn("Failed to register reboot notifier...\n");
> +		goto remove_cpupm;
> +	}
> +
> +	ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/sse:online",
> +				sse_cpu_online, sse_cpu_teardown);
> +	if (ret < 0)
> +		goto remove_reboot;
> +
> +	sse_hp_state =3D ret;
> +	sse_available =3D true;
> +
> +	return 0;
> +
> +remove_reboot:
> +	unregister_reboot_notifier(&sse_reboot_nb);
> +
> +remove_cpupm:
> +	cpu_pm_unregister_notifier(&sse_pm_nb);
> +
> +	return ret;
> +}
> +arch_initcall(sse_init);
> diff --git a/include/linux/riscv_sse.h b/include/linux/riscv_sse.h
> new file mode 100644
> index 000000000000..c73184074b8c
> --- /dev/null
> +++ b/include/linux/riscv_sse.h
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2024 Rivos Inc.
> + */
> +
> +#ifndef __LINUX_RISCV_SSE_H
> +#define __LINUX_RISCV_SSE_H
> +
> +#include <linux/types.h>
> +#include <linux/linkage.h>
> +
> +struct sse_event;
> +struct pt_regs;
> +
> +typedef int (sse_event_handler)(u32 event_num, void *arg, struct pt_regs=
 *regs);
> +
> +#ifdef CONFIG_RISCV_SSE
> +
> +struct sse_event *sse_event_register(u32 event_num, u32 priority,
> +				     sse_event_handler *handler, void *arg);
> +
> +void sse_event_unregister(struct sse_event *evt);
> +
> +int sse_event_set_target_cpu(struct sse_event *sse_evt, unsigned int cpu=
);
> +
> +int sse_event_enable(struct sse_event *sse_evt);
> +
> +void sse_event_disable(struct sse_event *sse_evt);
> +
> +#else
> +static inline struct sse_event *sse_event_register(u32 event_num, u32 pr=
iority,
> +						   sse_event_handler *handler,
> +						   void *arg)
> +{
> +	return ERR_PTR(-EOPNOTSUPP);
> +}
> +
> +static inline void sse_event_unregister(struct sse_event *evt) {}
> +
> +static inline int sse_event_set_target_cpu(struct sse_event *sse_evt,
> +					   unsigned int cpu)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline int sse_event_enable(struct sse_event *sse_evt)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline void sse_event_disable(struct sse_event *sse_evt) {}
> +
> +
> +#endif
> +
> +#endif /* __LINUX_RISCV_SSE_H */
> -- =

> 2.45.2
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
