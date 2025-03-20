Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9ABC36000
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 12:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R8re0Z94JfEB9L5U3EiWGMzCHNsVv/KyToMa6K8TA6Y=; b=S5dhVNGP/dhHJU
	RiXihfY8Mv940iqAKoqq4OPuOKFLvX9SbIhu3Fsw3SlTz4pJz6OvXQj7pPfCF26ZqQQmvePq+bkSY
	riaegjAA13lYb9BhUVuww+bBjcENm8Ib9zpYKOGO+QVtMVbpdg757nDoiP5x4tmzNkWu5qUxHQ9Hx
	O94bS0vxMrsmHFqmd30j++7yXYe4VeRCs8vFkPQcGSrgg1Dr6xbTWwKDt47fW5s4Zgs0BWL2bCEVX
	Awo6cfphmg/4xqAxS6uD1WZxOdYXAZpBeWcpNt6YAEQBHyg5pHQvzjEJ3Qy5q9RsJfgwg81TmCQD5
	+5C6ABAv+iF1tM9JEGAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvEgL-0000000C3S2-3ldt;
	Thu, 20 Mar 2025 12:07:29 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvESE-0000000C0Vi-0QAs
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 11:52:56 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3913b539aabso338545f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 04:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742471572; x=1743076372; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W7Q+Uv9PP7IrwTG/eBced107V/Y8wAy3D1YQ6SsCvek=;
        b=HSbyc88gp4B8KCrZ70Qqf/Kbo3ux3S1qU5Y3pu+ZyvQlbCHaMnXSrel/CH6HF2HDUF
         bmG+IcoeS4IrTDmzeHCOCrINDFzp0hCwEx8Bc/oybVVYaCW+0X+aZfmvbe4Zex6oPmeb
         Rsn+aURnFHGjyIy6tMcZW991qFdCx/RC4CyY4SxqBQuQWfzWGiOL4ls/9HLxruJX5pcA
         iXZgiB01ouiQmCltrSiCuEAsujdry58ptbbCyJH5y8wiFX1qlUPSS9cRW433zW17i4ez
         ZIZmnDH1+oK4ARFlILaqo9wiA0dNGwXsMpD0wjLMbXB0eftfGuZ2x6O7Fs/ZzSlO29eC
         UD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742471572; x=1743076372;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W7Q+Uv9PP7IrwTG/eBced107V/Y8wAy3D1YQ6SsCvek=;
        b=RuVOn+wGdMCUu5/Sat9+NAXude8VkghULPxiL+K1RE24ogOIg7q6qkhVFbtlEvKB53
         LoRW/OcIStVOhRBPOCHAESmKliZZfzq4GZNnvWpE32pCr1gtgI7rouyeIpg5/RXqiG6R
         KcQeVuSx1MpxgFmhbzc+ZIuXiNiuIPvn3k5vw0ACgM9m1mlScxeU15Om5Besp38Nj48G
         94AzGsG76lBPByoE4JF9xUXco/JWtqEAWK7GNG7+Gnu/VAjYjlXYhlP+68Lta+xwytwd
         cMjS8tI7xn0vquOCwMryZP6ESvlRoOOAixHXthYUfnotqmQupUm/pVaCtcsUkFNJQq6C
         hQWg==
X-Forwarded-Encrypted: i=1; AJvYcCXA80TRTga15tZeldRROI++a4yLLwnrOYVDIENbSC6I7ZINfQjwr8y8OQ8HklgtpCA5HmN//1Yxwf/x6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyP4qulkXv3eA1kI0K6CVDTQg9ehAp5zYeLCmoe/wuvD/8wXaOn
	hSwQN0vlRF0og3S1OSHmqd3iQJMtJjbmSs6dfdHcjZOiaB8Z6luv222qR28D8Jc=
X-Gm-Gg: ASbGncspWZEIqdKg/vBfTzFh0aVXJqgT0LcCE8PZ8y1K5om8VG+OcDB3mNDaeLIOc56
	AIqALQ3Zf88iVHliK+O2FcIoL3niZWAX2dPFrL5OVpZUGlH4JLI/PNSK9zZ2SQLYaqC/+DIX64z
	jqEoiIHirCQrGmnIt+uYhUJPIR4LEbwMGX2+SEdgh7Wu+ipMqZTDSsVnYU6Xy//fpOGrJW3CyLA
	QPI8BYiAxm7W/sSZ5CXd1ToLIiMgkGuDx65lQ2vq4TDyOBGT0gt7xEN44JrfWt6J015gRB/uqCE
	BefFOf4dDrVeUgpsozZy+vgHNdHtRA/2
X-Google-Smtp-Source: AGHT+IHeyTD2wSXlAOfdAKS53YepR+/8W8LiJeiUCHJdoX9DdjQszAGbC8mMUKoCZx6XO5JpwnfZmg==
X-Received: by 2002:a05:6000:188e:b0:391:2e6a:30de with SMTP id ffacd0b85a97d-399739beb10mr5536213f8f.19.1742471572182;
        Thu, 20 Mar 2025 04:52:52 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997e3eb672sm404452f8f.95.2025.03.20.04.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 04:52:51 -0700 (PDT)
Date: Thu, 20 Mar 2025 12:52:50 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Himanshu Chauhan <hchauhan@ventanamicro.com>, 
	Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>, 
	Atish Patra <atishp@atishpatra.org>
Subject: Re: [PATCH v3 2/4] riscv: add support for SBI Supervisor Software
 Events extension
Message-ID: <20250320-5f9612f1b503c79c9b185b10@orel>
References: <20241206163102.843505-1-cleger@rivosinc.com>
 <20241206163102.843505-3-cleger@rivosinc.com>
 <20250319-46b625cf8b771616d4c7c053@orel>
 <b3fbd730-295f-4491-b0d6-d4e258941ae5@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b3fbd730-295f-4491-b0d6-d4e258941ae5@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_045254_146697_6AA87C01 
X-CRM114-Status: GOOD (  27.19  )
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

On Thu, Mar 20, 2025 at 09:16:07AM +0100, Cl=E9ment L=E9ger wrote:
> =

> =

> On 19/03/2025 18:08, Andrew Jones wrote:
> > On Fri, Dec 06, 2024 at 05:30:58PM +0100, Cl=E9ment L=E9ger wrote:
> > ...
> >> +int arch_sse_init_event(struct sse_event_arch_data *arch_evt, u32 evt=
_id, int cpu)
> >> +{
> >> +	void *stack;
> >> +
> >> +	arch_evt->evt_id =3D evt_id;
> >> +	stack =3D sse_stack_alloc(cpu, SSE_STACK_SIZE);
> >> +	if (!stack)
> >> +		return -ENOMEM;
> >> +
> >> +	arch_evt->stack =3D stack + SSE_STACK_SIZE;
> >> +
> >> +	if (sse_init_scs(cpu, arch_evt))
> >> +		goto free_stack;
> >> +
> >> +	if (is_kernel_percpu_address((unsigned long)&arch_evt->interrupted))=
 {
> >> +		arch_evt->interrupted_state_phys =3D
> >> +				per_cpu_ptr_to_phys(&arch_evt->interrupted);
> >> +	} else {
> >> +		arch_evt->interrupted_state_phys =3D
> >> +				virt_to_phys(&arch_evt->interrupted);
> >> +	}
> >> +
> >> +	return 0;
> > =

> > Hi Cl=E9ment,
> > =

> > Testing SSE support with tools/testing/selftests/kvm/riscv/sbi_pmu_test
> > led to an opensbi sbi_trap_error because the output_phys_lo address pas=
sed
> > to sbi_sse_read_attrs() wasn't a physical address. The reason is that
> > is_kernel_percpu_address() can only be used on static percpu addresses,
> > but local sse events get their percpu addresses with alloc_percpu(), so
> > is_kernel_percpu_address() was returning false even for local events. I
> > made the following changes to get things working.
> =

> Hi Andrew,
> =

> Did something changed recently ? Because I tested that when it was send
> (PMU + some kernel internal testsuite) and didn't saw that. Anyway, I'll
> respin it with your changes as well.

It depends on the kernel config. Configs that don't have many
alloc_percpu() calls prior to the one made by sse can work, because,
iiuc, alloc_percpu() will get its allocation from the percpu allocator's
first chunk until that chunck fills up. The first chunck is shared with
the static allocations.

Thanks,
drew

> =

> Thanks !
> =

> Cl=E9ment
> =

> > =

> > Thanks,
> > drew
> > =

> > diff --git a/arch/riscv/kernel/sse.c b/arch/riscv/kernel/sse.c
> > index b48ae69dad8d..f46893946086 100644
> > --- a/arch/riscv/kernel/sse.c
> > +++ b/arch/riscv/kernel/sse.c
> > @@ -100,12 +100,12 @@ int arch_sse_init_event(struct sse_event_arch_dat=
a *arch_evt, u32 evt_id, int cp
> >         if (sse_init_scs(cpu, arch_evt))
> >                 goto free_stack;
> > =

> > -       if (is_kernel_percpu_address((unsigned long)&arch_evt->interrup=
ted)) {
> > +       if (sse_event_is_global(evt_id)) {
> >                 arch_evt->interrupted_state_phys =3D
> > -                               per_cpu_ptr_to_phys(&arch_evt->interrup=
ted);
> > +                               virt_to_phys(&arch_evt->interrupted);
> >         } else {
> >                 arch_evt->interrupted_state_phys =3D
> > -                               virt_to_phys(&arch_evt->interrupted);
> > +                               per_cpu_ptr_to_phys(&arch_evt->interrup=
ted);
> >         }
> > =

> >         return 0;
> > diff --git a/drivers/firmware/riscv/riscv_sse.c b/drivers/firmware/risc=
v/riscv_sse.c
> > index 511db9ad7a9e..fef375046f75 100644
> > --- a/drivers/firmware/riscv/riscv_sse.c
> > +++ b/drivers/firmware/riscv/riscv_sse.c
> > @@ -62,11 +62,6 @@ void sse_handle_event(struct sse_event_arch_data *ar=
ch_event,
> >                         ret);
> >  }
> > =

> > -static bool sse_event_is_global(u32 evt)
> > -{
> > -       return !!(evt & SBI_SSE_EVENT_GLOBAL);
> > -}
> > -
> >  static
> >  struct sse_event *sse_event_get(u32 evt)
> >  {
> > diff --git a/include/linux/riscv_sse.h b/include/linux/riscv_sse.h
> > index 16700677f1e8..06b757b036b0 100644
> > --- a/include/linux/riscv_sse.h
> > +++ b/include/linux/riscv_sse.h
> > @@ -8,6 +8,7 @@
> > =

> >  #include <linux/types.h>
> >  #include <linux/linkage.h>
> > +#include <asm/sbi.h>
> > =

> >  struct sse_event;
> >  struct pt_regs;
> > @@ -16,6 +17,11 @@ struct ghes;
> > =

> >  typedef int (sse_event_handler)(u32 event_num, void *arg, struct pt_re=
gs *regs);
> > =

> > +static inline bool sse_event_is_global(u32 evt)
> > +{
> > +       return !!(evt & SBI_SSE_EVENT_GLOBAL);
> > +}
> > +
> >  #ifdef CONFIG_RISCV_SSE
> > =

> >  struct sse_event *sse_event_register(u32 event_num, u32 priority,
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
