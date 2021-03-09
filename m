Return-Path: <SRS0=trcm=IH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A86C433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Mar 2021 01:47:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBB7C65270
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Mar 2021 01:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBB7C65270
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xgSO5zoFu+Bh/1jyM58XsitCOIMSzRYuDewzP0blPPw=; b=DkbLBYQ9Vc48RRJeW7DCk8ZrV
	n19tCKDbyLjfZRxcn0pbmd/zjMyEe+Yi1BcT0djn2sLdtx27HKOm3rexdJioaQIfslPIjRd3HDLIW
	1n8B5X+ypJZUdmdWr4k/IKd9fw88SPQPMIgXeJizBm8OCesGApwbhSVVttiG/NwrsxOV+XTP3NZ9d
	qsFDRktu4Zafh2BsYGnjKHdsusc8gwH1TsSY0/rlDy1XFAd4uR/gokar4zsvJ2LHx0iNEiYq9X8DC
	gqxUZRthPJmFG1ly6ho4gjT7kmscDqRuYax56oQXV4+OB4x8RjaUc8kQXgjznP21C1ah/F/UexBXb
	R/l/ejzIQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJRSX-003byb-Lk; Tue, 09 Mar 2021 01:46:53 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJRST-003byI-8C
 for linux-riscv@lists.infradead.org; Tue, 09 Mar 2021 01:46:51 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 q2-20020a17090a2e02b02900bee668844dso4094515pjd.3
 for <linux-riscv@lists.infradead.org>; Mon, 08 Mar 2021 17:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u00rp68p0FxYWHZGypee+pTjHvxTgTTnWOQ1MrG57cs=;
 b=hR9EOU0KmlA3bKu+Vz2DWX14PQrwN20OOj3FMh1DoZUUyGOTqhq4RJpzXHzGlIEW2O
 yAaT0YwBOwa+1oSNV81BqFNPGT+ZMnOMfbaOitFkcH2lYQ2GvRb/eaanQ7GMOoI6RvMP
 rN8a81WrTTX2G/xfQXjJVrZYjMStFM9AW96OyRagxOTtj3GWAvNjzydIKQZ91Ml+aHYR
 j+eZIWhE2XuXLXaJU+xxjJBOuPQhwA5mZ810N2JjF9Vt7+S11J47ckx3eHNIb89/JmFP
 hOWYRtRM0XgF5WVy/TK+w0JkICVjq2xwfBhkgzKrwrv5b9K9pIaU7wWBjp0QXIKaWhEA
 TfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u00rp68p0FxYWHZGypee+pTjHvxTgTTnWOQ1MrG57cs=;
 b=AVUyCLCOcwIn+zf8J4Ry0Riuldk6Ykg8hGGxBBzu1oBzUSaT+3V8xQAADz95UDwyD3
 fg+CiFoIrfwhmhtlJiTDqUJ7tenn5wxiw8Gag5o2ItxCENAJMDhtC+2TvpVyg4ziKAcT
 VYJ1Xoifq/aN5cBDRzNj3cWJo98yRSQdnwo8zOT4XoxigpC+v0/1AZWyoc/cES9omVrW
 rPO6NaYjT7Qr3wrjtTVWJPmHQQqU0YPM4+ST0o1lbQwXh7b3ALEyyG/vjY2HvWLAAwV0
 DIxni6+0vdzymKZdJKD2wQkFHCMW2rn0WFgACf2Hb/0z9NneMlaWqRUNJ0yoen4s57Js
 HUXw==
X-Gm-Message-State: AOAM533KJGGyTv9ACbW+4p4Fz73go81/dthG5QODWYwPSvkg8pdj4qSx
 a10eH+OhMgz3pkTygSN3HUQWy6i3jD2szAROACVmimwafyhaiMNp
X-Google-Smtp-Source: ABdhPJwU4PBNhfVcSJA7Sr74gcYLcu2OhmIKdkky1hjkAo3lIiRq+9vk1dw6/jXYR14D74EMHso7B66V75JRAq47Za8=
X-Received: by 2002:a17:90b:2307:: with SMTP id
 mt7mr1993714pjb.37.1615254407659; 
 Mon, 08 Mar 2021 17:46:47 -0800 (PST)
MIME-Version: 1.0
References: <1615175897-23509-1-git-send-email-vincent.chen@sifive.com>
 <1615175897-23509-3-git-send-email-vincent.chen@sifive.com>
 <CAJF2gTR6e2=mL3BUt-QDt21RxJdxEPa7b+MMJ7TsDmmnDHCu1w@mail.gmail.com>
In-Reply-To: <CAJF2gTR6e2=mL3BUt-QDt21RxJdxEPa7b+MMJ7TsDmmnDHCu1w@mail.gmail.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Tue, 9 Mar 2021 09:46:36 +0800
Message-ID: <CABvJ_xgGHLZ6TRvic7vPgX1HLUmw0vbzjpogyPjUAxT2Lde=nw@mail.gmail.com>
Subject: Re: [RFC patch 2/4] riscv: Get CPU manufacturer information
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Frank.Zhao@starfivetech.com, Atish Patra <atish.patra@wdc.com>, 
 Anup Patel <anup.patel@wdc.com>, Alan Kao <alankao@andestech.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_014649_447054_A055739D 
X-CRM114-Status: GOOD (  14.69  )
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

> > +void riscv_fill_cpu_manufacturer_info(void)
> > +{
> > +#ifndef CONFIG_RISCV_M_MODE
> > +       cpu_mfr_info.vendor_id = sbi_get_vendorid();
> > +       cpu_mfr_info.arch_id = sbi_get_archid();
> > +       cpu_mfr_info.imp_id = sbi_get_impid();
> > +#else
> > +       cpu_mfr_info.vendor_id = csr_read(CSR_MVENDORID);
> > +       cpu_mfr_info.arch_id = csr_read(CSR_MARCHID);
> > +       cpu_mfr_info.imp_id = csr_read(CSR_MIMPID);
> > +#endif
> How about let opensbi emulate csr_read(CSR_MXXX) for S mode, then we
> needn't to define new sbi call.
>
Hi Guo Ren,
The SBI spec has defined 3 SBI calls for S-mode to get vendorid,
archid, and impid, so I do not define new SBI calls here. The 3
functions ( sbi_get_vendorid(), sbi_get_archid(), and sbi_get_impid())
are the new kernel API to issue these 3 SBI calls.


> > +}
> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > index e85bacff1b50..03621ce9092c 100644
> > --- a/arch/riscv/kernel/setup.c
> > +++ b/arch/riscv/kernel/setup.c
> > @@ -278,6 +278,8 @@ void __init setup_arch(char **cmdline_p)
> >  #endif
> >
> >         riscv_fill_hwcap();
> > +
> > +       riscv_fill_cpu_manufacturer_info();
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
> >
> >  /*
> >   * This is called extremly early, before parse_dtb(), to allow initializing
> > --
> > 2.7.4
> >
> How
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
