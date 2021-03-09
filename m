Return-Path: <SRS0=trcm=IH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8013C433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Mar 2021 01:25:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DA4A651B7
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Mar 2021 01:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DA4A651B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F6pEv3ZOy1WS08GG6n464TERuNY8WmoON4rj+7DYwjw=; b=IWKsbLJTE5mp0zhZ8/+AY3XbU
	vtbIbDmznpFGBMQcSwCv+pUgHDFL2PdbT4zkuj4z0jefSLoDFvfDvyeuJMrcsczRMFBWg8nz2sj9B
	Lfow3ZZ4M8UjAZU+hMpPMcgxAypEMvqa/QUvFIGh/WYlVRfEx5fCywYfd6mYLK1F5PY+mK8UfoELo
	NebHoKhqY5Tz2jqTsiUsdS2WsHphbHVmtaRhuyuq0iNAOeuCTLuWSVvS3G6sm9xVMynURWjnJ649y
	qiJ5sorE+En8/egryn9kFY3x2MzWuBhrLd69CmU7IYe+T8HG6yvwnYLlFCTtnV4d3CKb1/0EZb3V3
	5qLqHlwkw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJR7b-003aW5-Vp; Tue, 09 Mar 2021 01:25:17 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJR7X-003aV5-4U
 for linux-riscv@lists.infradead.org; Tue, 09 Mar 2021 01:25:13 +0000
Received: by mail-pg1-x533.google.com with SMTP id g4so7648173pgj.0
 for <linux-riscv@lists.infradead.org>; Mon, 08 Mar 2021 17:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wmUqbn0Wuknn5GaOsXoSPDB5ldWkp/qEgo6VPI7oasA=;
 b=WNrZ5RW/hXk9rg5IgX9/TVw4jKTpQqUpTvjuqrw2A6Znix6OQuAEwQBbf85mYkI0ju
 EpreGgzle8Ekg/wicon2a9O/x3HVauu5iG9HZwJKZisaN8MU0qfz4FcJXe/eo1VT7WXy
 HOjZIOgElZECmKb/SPeI1vQ3kSp0zMjW7xv9yuM/pi/nG6jdVJg/tHhxeeZOnlpBBR+X
 +7emIqCKOQgUr1mCWpMRyneoMBAA2yxpxarhm0byGOe5aUTia3di8vO0h/ky6FQXJJEn
 u+XYRYC/HGM2jBGSAZBQa3Ldj00a5IbLtVFNi9v26EKrZRedMAJKO3jL/jBkfaNmP8+U
 7mUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wmUqbn0Wuknn5GaOsXoSPDB5ldWkp/qEgo6VPI7oasA=;
 b=Ulcd2qwhpLuxKHy08PESZM75GbTbUTjTuM3T5SFQ4pFn7+mbxYVaYYGqIAQXbYPgrH
 Hi5Xi8tiyhmEN+2Qtf6Cugjcm5v2FJI6x/zixysohg/GCWuRn9grARmhefZ3DahO4Y6p
 eDb8aIlwwsYJHL1wzdOp7AKPbSY5WKRH/Xy0F9Da6cbT7dS+9Pf2k1cvXEmVe1+IUUGB
 JJhw3dsCCjt85SthY1o7EtiiaBkBqZqWBUSJwHyOA1cBZW5Cx+xu+sgT9Rnf/bc5aW3K
 Mm7G/rxo2WMqUn6CVuL6DqmN1AUj5qgYw0iysz50n70dS4INBfa+K6VJXsj1eyPo6lYE
 8mdw==
X-Gm-Message-State: AOAM530PhSrAOVHI7g00k0fOacwLmNSLztbVuLzbpQf/ZuZZHOdJvFvX
 M0TMtFoi4JVA1J5FZc9ThfID8zsU4HGRwx0xk0gKYA==
X-Google-Smtp-Source: ABdhPJxBBXNLyIhGcuBqC3G64pzpLHyDZ/iXpqxkzQwbUZLUPUjdhuNeEPZtUOy4OB/WUUVjIlIqDBUUkiOzVtsM6VI=
X-Received: by 2002:a63:f311:: with SMTP id l17mr23243853pgh.349.1615253108319; 
 Mon, 08 Mar 2021 17:25:08 -0800 (PST)
MIME-Version: 1.0
References: <1615175897-23509-1-git-send-email-vincent.chen@sifive.com>
 <1615175897-23509-3-git-send-email-vincent.chen@sifive.com>
 <BL0PR04MB6514006678BE79B275DCE744E7939@BL0PR04MB6514.namprd04.prod.outlook.com>
In-Reply-To: <BL0PR04MB6514006678BE79B275DCE744E7939@BL0PR04MB6514.namprd04.prod.outlook.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Tue, 9 Mar 2021 09:24:57 +0800
Message-ID: <CABvJ_xid8CoOV5p4aUL-t-wzj_h6cXB+zOJOGsKm9a1+ASFewg@mail.gmail.com>
Subject: Re: [RFC patch 2/4] riscv: Get CPU manufacturer information
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "palmer@dabbelt.com" <palmer@dabbelt.com>, 
 "Frank.Zhao@starfivetech.com" <Frank.Zhao@starfivetech.com>,
 Atish Patra <Atish.Patra@wdc.com>, 
 Anup Patel <Anup.Patel@wdc.com>, "guoren@kernel.org" <guoren@kernel.org>, 
 "alankao@andestech.com" <alankao@andestech.com>, 
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_012511_303737_2AF7A49C 
X-CRM114-Status: GOOD (  19.58  )
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

> >  #endif /* _ASM_RISCV_PROCESSOR_H */
> > diff --git a/arch/riscv/include/asm/soc.h b/arch/riscv/include/asm/soc.h
> > index f494066051a2..03dee6db404c 100644
> > --- a/arch/riscv/include/asm/soc.h
> > +++ b/arch/riscv/include/asm/soc.h
> > @@ -10,6 +10,7 @@
> >  #include <linux/of.h>
> >  #include <linux/linkage.h>
> >  #include <linux/types.h>
> > +#include <asm/hwcap.h>
> >
> >  #define SOC_EARLY_INIT_DECLARE(name, compat, fn)                     \
> >       static const struct of_device_id __soc_early_init__##name       \
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index ac202f44a670..389162ee19ea 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -12,6 +12,8 @@
> >  #include <asm/hwcap.h>
> >  #include <asm/smp.h>
> >  #include <asm/switch_to.h>
> > +#include <asm/sbi.h>
> > +#include <asm/csr.h>
> >
> >  unsigned long elf_hwcap __read_mostly;
> >
> > @@ -22,6 +24,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
> >  bool has_fpu __read_mostly;
> >  #endif
> >
> > +struct cpu_manufacturer_info_t cpu_mfr_info;
> > +
> >  /**
> >   * riscv_isa_extension_base() - Get base extension word
> >   *
> > @@ -149,3 +153,16 @@ void riscv_fill_hwcap(void)
> >               has_fpu = true;
> >  #endif
> >  }
> > +
> > +void riscv_fill_cpu_manufacturer_info(void)
> > +{
> > +#ifndef CONFIG_RISCV_M_MODE
> > +     cpu_mfr_info.vendor_id = sbi_get_vendorid();
> > +     cpu_mfr_info.arch_id = sbi_get_archid();
> > +     cpu_mfr_info.imp_id = sbi_get_impid();
> > +#else
> > +     cpu_mfr_info.vendor_id = csr_read(CSR_MVENDORID);
> > +     cpu_mfr_info.arch_id = csr_read(CSR_MARCHID);
> > +     cpu_mfr_info.imp_id = csr_read(CSR_MIMPID);
> > +#endif
>
> Why ? reading the registers will work with M-Mode too. It was there before when
> we temporarily had the builtin DTB lookup based on vendor/arch/imp (see defunct
> soc_lookup_builtin_dtb() in 5.11).
>
Sorry, I cannot fully catch what you mean.
I agree that reading these registers will work with M-Mode, so I used
the macro csr_read() to read these three registers when the kernel run
in the M-mode.
The definition of csr_read() is here:
#define csr_read(csr)                                           \
({                                                              \
        register unsigned long __v;                             \
        __asm__ __volatile__ ("csrr %0, " __ASM_STR(csr)        \
                              : "=r" (__v) :                    \
                              : "memory");                      \
        __v;                                                    \
})
I guess that #if"n"def CONFIG_RISCV_M_MODE may mislead you. #ifndef is
really unfriendly to read. I will change #ifndef to #ifdef in my next
version patch.


> > +}
> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > index e85bacff1b50..03621ce9092c 100644
> > --- a/arch/riscv/kernel/setup.c
> > +++ b/arch/riscv/kernel/setup.c
> > @@ -278,6 +278,8 @@ void __init setup_arch(char **cmdline_p)
> >  #endif
> >
> >       riscv_fill_hwcap();
> > +
>
> Nit: I do not think the white libe is really necessary here.
>
OK, I will remove it.
> > +     riscv_fill_cpu_manufacturer_info();
> >  }
> >
> >  static int __init topology_init(void)
> > diff --git a/arch/riscv/kernel/soc.c b/arch/riscv/kernel/soc.c
> > index a0516172a33c..58f6fd91743a 100644
> > --- a/arch/riscv/kernel/soc.c
> > +++ b/arch/riscv/kernel/soc.c
> > @@ -6,6 +6,7 @@
> >  #include <linux/libfdt.h>
> >  #include <linux/pgtable.h>
> >  #include <asm/soc.h>
> > +#include <asm/hwcap.h>
>
> Why is this necessary ?

I forgot to remove it when doing code cleanup. Thank you for the
reminder. I will remove it

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
