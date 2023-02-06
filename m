Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE1AC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 09:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzwuOKD0MoYbuzHfaeH4INl8WejK/DPVebtKEacGtPo=; b=m/T9ITgu8D+AjL
	chBFI1UV+ypXfxciaJyWeZrtB1PIZczg8Fo9FgjleRdBZIXDbqbo7uhjjd9z+eXTtQ1KWxvpk/Agj
	90f3I1lBifkPwzNcx7Ju9p9fp5SzhkFb5QBx6Cq7y/XroxFzErk0SZOds0jFl5fFpa3ZgxB1ElcCN
	HarDED21q5+tyrtNoSKJ1cz3j1mwneecIEh79rKbs5TV5NcgPMyByYmX9DdNTj3bxRB3EHVdXOTn2
	ggKcBJ94IIe5VPoGk9tbSuROA4kdh/bZW0bRJagtlqGWiHRJKXbU2vyBWbuA+Iwm47vqUmLA6VTr3
	i94OpCsmsa2uQC8Oq/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOxhT-007qtL-Lo; Mon, 06 Feb 2023 09:22:11 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOxhQ-007qrg-V0
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 09:22:10 +0000
Received: by mail-wm1-x32c.google.com with SMTP id z13so679711wmp.2
        for <linux-riscv@lists.infradead.org>; Mon, 06 Feb 2023 01:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h3/29hABhm9XLu3Rv4E2s416ZzobvTLA9/Se1Cqam/I=;
        b=WI4D8Out1HjIQVrO/FV9gjJNBFw7MjrXUgijfPA13egtBA1GHPTZXvsBLROC5JtR8Q
         fbWdPu9tLzA+KlMHzJcHOfwUVbMQ/AkRgQztMcSyfGfkWZFsgFz077cgBGq8Kf9WpAya
         BR/3SwJcYVPatEVrXi927F4xH78Sq0otcGlqBBaDyu3+Vuhui3Lx/sy0zyQlAkek2pRF
         wGA5W6RuODcPJFwKmeZnUTy9lRMCR+zr5rpRVv1jOrnDYUrITHFZcmELB3io5LSAqUh9
         JacHCtXTyUUImDe+M4hG7pVZSOii1zmFJ84qGdsb7+qbFvEn6R5t+oM8OCviytDfrd2i
         JI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3/29hABhm9XLu3Rv4E2s416ZzobvTLA9/Se1Cqam/I=;
        b=qddyWYPkEEY3gPzKK7sUWrivsORwpr8cvM3PjYc42XhAn+q/N2tUKnYtwoR4xGdmex
         a/M2bK0Y7sFsJ6h8Pe/ECBIgUm4/1W9mhR9UhV4ykVZYpfMO6C9UkzhbfHQRDUGNNF2E
         luFwP4gJTKh2Jo36mit9xJim/f21nyb7rOmLAmrnl2/AmzlBRMmNeY7vHz1A1jJcJ2vw
         O1yExvBg7a8/IoU4Xf4nxePJ36aAuwMQ/GyYHuqerIBgYV2B1xBGoTDCCLW6DTCcwQCe
         GVABaK3PrXKVImzABqHhkfODdTQYS33k78s5U9eJ3hNHFNV26rJfAgmS3LsfNvAJ5mL0
         rOcQ==
X-Gm-Message-State: AO0yUKXaHFIE6R0VBh18JTSVpigKzoDZg9frAQPAWKoU6Kr3O6SCWNPH
	/oPQ3ac4wsQTTanAxlAJzGAKpg==
X-Google-Smtp-Source: AK7set81zyYOD4pHEoWMQOkNV1bM2HP8Wb+ewmqDF1dAPQAsKrrMrfEeL1eYsVwOIFBZTQL6TkdbNw==
X-Received: by 2002:a05:600c:3c9a:b0:3dc:c5c:b94f with SMTP id bg26-20020a05600c3c9a00b003dc0c5cb94fmr18269461wmb.39.1675675325243;
        Mon, 06 Feb 2023 01:22:05 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id h16-20020a05600c351000b003dc521f336esm10868423wmq.14.2023.02.06.01.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 01:22:04 -0800 (PST)
Date: Mon, 6 Feb 2023 10:22:04 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@atishpatra.org>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Eric Lin <eric.lin@sifive.com>, Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 07/14] RISC-V: KVM: Add skeleton support for perf
Message-ID: <20230206092204.aiyo43uxlm4xdmgn@orel>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
 <20230201231250.3806412-8-atishp@rivosinc.com>
 <20230202170345.uwi72dauzunlzxex@orel>
 <CAOnJCUJfc8y729GiUdtqhv+PZu8v9rH+kfpwPwdW=GQPEs9FNw@mail.gmail.com>
 <CAOnJCUKn_pLKqYO71S6MrZd=rnTdSShZk+XksX2uxTiVtthmTA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCUKn_pLKqYO71S6MrZd=rnTdSShZk+XksX2uxTiVtthmTA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_012209_004271_56CC51CB 
X-CRM114-Status: GOOD (  34.27  )
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

On Sat, Feb 04, 2023 at 11:37:47PM -0800, Atish Patra wrote:
> On Fri, Feb 3, 2023 at 12:47 AM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > On Thu, Feb 2, 2023 at 9:03 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> > > On Wed, Feb 01, 2023 at 03:12:43PM -0800, Atish Patra wrote:
> > > > This patch only adds barebone structure of perf implementation. Most of
> > > > the function returns zero at this point and will be implemented
> > > > fully in the future.
> > > >
> > > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > > ---
> > > >  arch/riscv/include/asm/kvm_host.h     |   4 +
> > > >  arch/riscv/include/asm/kvm_vcpu_pmu.h |  78 +++++++++++++++
> > > >  arch/riscv/kvm/Makefile               |   1 +
> > > >  arch/riscv/kvm/vcpu.c                 |   7 ++
> > > >  arch/riscv/kvm/vcpu_pmu.c             | 136 ++++++++++++++++++++++++++
> > > >  5 files changed, 226 insertions(+)
> > > >  create mode 100644 arch/riscv/include/asm/kvm_vcpu_pmu.h
> > > >  create mode 100644 arch/riscv/kvm/vcpu_pmu.c
> > > >
> > > > diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> > > > index 93f43a3..b90be9a 100644
> > > > --- a/arch/riscv/include/asm/kvm_host.h
> > > > +++ b/arch/riscv/include/asm/kvm_host.h
> > > > @@ -18,6 +18,7 @@
> > > >  #include <asm/kvm_vcpu_insn.h>
> > > >  #include <asm/kvm_vcpu_sbi.h>
> > > >  #include <asm/kvm_vcpu_timer.h>
> > > > +#include <asm/kvm_vcpu_pmu.h>
> > > >
> > > >  #define KVM_MAX_VCPUS                        1024
> > > >
> > > > @@ -228,6 +229,9 @@ struct kvm_vcpu_arch {
> > > >
> > > >       /* Don't run the VCPU (blocked) */
> > > >       bool pause;
> > > > +
> > > > +     /* Performance monitoring context */
> > > > +     struct kvm_pmu pmu_context;
> > > >  };
> > > >
> > > >  static inline void kvm_arch_hardware_unsetup(void) {}
> > > > diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > > > new file mode 100644
> > > > index 0000000..e2b4038
> > > > --- /dev/null
> > > > +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > > > @@ -0,0 +1,78 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > +/*
> > > > + * Copyright (c) 2023 Rivos Inc
> > > > + *
> > > > + * Authors:
> > > > + *     Atish Patra <atishp@rivosinc.com>
> > > > + */
> > > > +
> > > > +#ifndef __KVM_VCPU_RISCV_PMU_H
> > > > +#define __KVM_VCPU_RISCV_PMU_H
> > > > +
> > > > +#include <linux/perf/riscv_pmu.h>
> > > > +#include <asm/kvm_vcpu_sbi.h>
> > > > +#include <asm/sbi.h>
> > > > +
> > > > +#ifdef CONFIG_RISCV_PMU_SBI
> > > > +#define RISCV_KVM_MAX_FW_CTRS        32
> > > > +
> > > > +#if RISCV_KVM_MAX_FW_CTRS > 32
> > > > +#error "Maximum firmware counter can't exceed 32 without increasing the RISCV_MAX_COUNTERS"
> > >
> > > "The number of firmware counters cannot exceed 32 without increasing RISCV_MAX_COUNTERS"
> > >
> > > > +#endif
> > > > +
> > > > +#define RISCV_MAX_COUNTERS      64
> > >
> > > But instead of that message, what I think we need is something like
> > >
> > >  #define RISCV_KVM_MAX_HW_CTRS  32
> > >  #define RISCV_KVM_MAX_FW_CTRS  32
> > >  #define RISCV_MAX_COUNTERS     (RISCV_KVM_MAX_HW_CTRS + RISCV_KVM_MAX_FW_CTRS)
> > >
> > >  static_assert(RISCV_MAX_COUNTERS <= 64)
> > >
> > > And then in pmu_sbi_device_probe() should ensure
> > >
> > >   num_counters <= RISCV_MAX_COUNTERS
> > >
> > > and pmu_sbi_get_ctrinfo() should ensure
> > >
> > >   num_hw_ctr <= RISCV_KVM_MAX_HW_CTRS
> > >   num_fw_ctr <= RISCV_KVM_MAX_FW_CTRS
> > >
> > > which has to be done at runtime.
> > >
> >
> > Sure. I will add the additional sanity checks.
> >
> 
> As explained above, I feel we shouldn't mix the firmware number of
> counters that the host gets and it exposes to a guest.
> So I have not included this suggestion in the v5.
> I have changed the num_fw_ctrs to PMU_FW_MAX though to accurately
> reflect the firmware counters KVM is actually using.

Sounds good

> I don't know if there is any benefit of static_assert over #error.
> Please let me know if you feel strongly about that.

One "normal" line vs. three #-lines?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
