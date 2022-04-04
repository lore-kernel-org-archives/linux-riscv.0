Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169E5C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 03:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ys7XVUsYAOsrByca7UCNZByD7xR3eM77RUsGb+nQjJo=; b=x1PWZTqogWQmEC
	aakZzdozU1f/Oz0qtWuNwEIfxvGr5pJPMQ5CR83MV8GV4Agj8fsIYil5ps4+u3slV1AGejR85OAUc
	8bh/hOWeA/3JzUOBTT17uSpHQOMi80hsoVGIJV9LYzqKF0NwcHG2RQ8puaBNi9Qy8I7otO5E+A/JF
	a8VObcgzMXyVLsU+FUl5vftbcLqAmlVnWP9rUHARqIX+mlB6lNokb9PdqNG5gRaTM8i/B+yFXMrC7
	oEGTu+z55PTHRRgm0ps/idjjmy6AN892W9UKND+u8L8AHdU2C0IBVXMaWlkGSPt0YSejvr2RGQUyb
	GrXETJIFnkK0xKU3ZjOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbDZ6-00CvAv-6V; Mon, 04 Apr 2022 03:39:40 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbDZ3-00Cv9t-I9
 for linux-riscv@lists.infradead.org; Mon, 04 Apr 2022 03:39:38 +0000
Received: by mail-wr1-x42e.google.com with SMTP id v30so4640371wra.8
 for <linux-riscv@lists.infradead.org>; Sun, 03 Apr 2022 20:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U8/aVwpSbq6P9VWydiIc4i/5KLXIXBAm03QUmehMn90=;
 b=lvqfyewAeZVZqnq38NmTEFXQ21z8cKjlNzK3dv5woldXyrCqvq1J7jEQEA5dPfELwR
 DI8ctTyRcE/aoMdkRHYV0PCd0WM99O9wl2WEI7ZO613MqLOz7aXq8C/JTpJXdvL4piF5
 BJTr6R9edkG1Aj9Yj9vLqS/hGQVmverEBL88kWQPvnGPhUFIF0VTDuZHXqjZhjfd10qy
 kgifni6hKujgSDPN3/ita0Px+guu9OHnsDxggxD9jXZqhEY4aUu9zYucgbed9Lnen2Cx
 JaqtT0skohJQtlUlwTjTLPPogHDPuS90d9c5XEoNzSL2sfknfpvo6smUyrBNJyXzBcJt
 UPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U8/aVwpSbq6P9VWydiIc4i/5KLXIXBAm03QUmehMn90=;
 b=uywwQ+IqC92tcKFRHFqKB9FxUkJOLhdnZ8y5WDKey7YwEmp2EFVQyYujM8L5EJuXoe
 e4ijeI3/LhiO4/js5nQvluhnh6gjX75EkNu7uEMLHzkPDHboHjMiFAbBu+se/Mlx11l0
 JputtR6VcfI1/1iOfBJm8v4TyltXymbab/lO+/iJpYDd6cwQ1r0604aM2mAigQs3ssuz
 rQ7XuXgZxK+GwOTKC21RYb6aaIBNSvD+6YuqgvJ6X/dwJMjMAajimsHFJ3ezh1IpbWvD
 NKYfJkmQJ3JgrMXaAs8i2HXm25JawRG69xetp8IANGpPZ3vddNgaCN3NGFDkY1g3+sJ8
 LbLA==
X-Gm-Message-State: AOAM531FlnCGKTozzA5Oxuo8vzODCStID2nD997N0DKCiQ4v1WqmgDpb
 i16JUl2I8M1ExRhxGmV3Ph/LBezkS4e/8wIRPAC1Nw==
X-Google-Smtp-Source: ABdhPJzq3a5wx76W4hZJ3J/Mqk4N79e3BhGOpuIKHRDsBWV6w0TtjQ7B7qXfQE/JSCz5Zy3uS6iFbskTIXO+XI2G6I4=
X-Received: by 2002:adf:db86:0:b0:205:bccf:8cbf with SMTP id
 u6-20020adfdb86000000b00205bccf8cbfmr15183666wri.346.1649043575307; Sun, 03
 Apr 2022 20:39:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220403031355.20894-1-rdunlap@infradead.org>
 <CAAhSdy2CJMeD_JhvwkEKShtYxyLGVRme8rE4cmCcDFfO90_D-Q@mail.gmail.com>
 <61196f88-7306-058d-7b9b-21e32f1fca92@infradead.org>
In-Reply-To: <61196f88-7306-058d-7b9b-21e32f1fca92@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 4 Apr 2022 09:08:25 +0530
Message-ID: <CAAhSdy3w2tXVtD9jBO7xFx8F_CbhKZDs6PfFF44CRhVfXmBbNg@mail.gmail.com>
Subject: Re: [PATCH -next] cpuidle: riscv: support non-SMP config
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kernel test robot <lkp@intel.com>, 
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_203937_623498_6A29C486 
X-CRM114-Status: GOOD (  20.28  )
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

On Mon, Apr 4, 2022 at 9:07 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 4/3/22 20:05, Anup Patel wrote:
> > (Removed my WDC email because it does not exist anymore)
> >
> > On Sun, Apr 3, 2022 at 8:44 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> >>
> >> Add <asm/smp.h> for cpuid_to_hartid_map etc.
> >> This is needed for both SMP and non-SMP builds, but not having it
> >> causes a build error for non-SMP:
> >>
> >> drivers/cpuidle/cpuidle-riscv-sbi.c: In function 'sbi_cpuidle_init_cpu':
> >> drivers/cpuidle/cpuidle-riscv-sbi.c:350:26: error: implicit declaration of function 'cpuid_to_hartid_map' [-Werror=implicit-function-declaration]
> >>
> >> Fixes: 6abf32f1d9c5 ("cpuidle: Add RISC-V SBI CPU idle driver")
> >> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Cc: Anup Patel <anup.patel@wdc.com>
> >> Cc: Anup Patel <anup@brainfault.org>
> >> Cc: Anup Patel <apatel@ventanamicro.com>
> >> Cc: Atish Patra <atishp@rivosinc.com>
> >> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> >> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> >> Cc: linux-pm@vger.kernel.org
> >> Cc: linux-riscv@lists.infradead.org
> >> Cc: Palmer Dabbelt <palmer@rivosinc.com>
> >> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> >> Cc: Albert Ou <aou@eecs.berkeley.edu>
> >> ---
> >>  drivers/cpuidle/cpuidle-riscv-sbi.c |    1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> --- linux-next-20220401.orig/drivers/cpuidle/cpuidle-riscv-sbi.c
> >> +++ linux-next-20220401/drivers/cpuidle/cpuidle-riscv-sbi.c
> >> @@ -22,6 +22,7 @@
> >>  #include <linux/pm_runtime.h>
> >>  #include <asm/cpuidle.h>
> >>  #include <asm/sbi.h>
> >> +#include <asm/smp.h>
> >
> > I suggest include linux/smp.h here instead of asm/smp.h
> >
> > Otherwise it looks good to me.
> >
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> >
>
> Yeah, checkpatch also suggested that but it does not work.
> Yes, I tested it.
>
> linux/smp.h only #includes <asm/smp.h> if CONFIG_SMP is enabled,
> and this patch needs <asm/smp.h> for the non-SMP case.

Okay, sounds good to me.

No changes needed in this patch.

Regards,
Anup

>
> >
> >>  #include <asm/suspend.h>
> >>
> >>  #include "dt_idle_states.h"
>
> thanks.
> --
> ~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
