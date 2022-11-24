Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42B5C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 10:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=636DZ80hWMyVcik4b+O+uYXYM/ntAAf4Up6LAoouZ1I=; b=dvtFc48ItUaPjp
	zhfFUvicA3AmS+R5VAvDzdvGZx7Qa9X9NyMT6sDQIZ7CUZgBz8M4rTGAP27udc2g4895ZzPqM2p+W
	DAQFmaOUvJi/pEli23IckKhzHwqlnbESUiwId2qBMUwanCjciMKaO2NYWhTScyl7HuSCpV6QBIzfI
	kmLinIXYRau7YT2M1wSqIZhjy8/Uei7nbreuzBXtMcbVdgQYPPzweYm/l6giaWZLATUeewee1trtu
	zp0viD/grdjg2QEYkiYlQ+8RNiTM7Dz8EFkpRvgfC2wRJNwtEYqHdWn/kMPveBBcoPPqhm6WysuuV
	uNq+kFMIKU+isDjz96RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy9oq-007ou9-80; Thu, 24 Nov 2022 10:51:00 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy9om-007ors-Nd
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 10:50:58 +0000
Received: by mail-ej1-x633.google.com with SMTP id vv4so3330949ejc.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 02:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7EpHqZSb89Ze6YQ2yo72O8+0pB4IQzPJGKW2B32FbcY=;
        b=Pk8qWjYgThmkUH55ahwT7r++QkroUX2mKPPGCB42y6xGyBk7NGPZEyJyTGUbo2V93l
         JTvGPrRRG29bpeUV8227yH/wQ++vwqMTyYmcg0atcAcfp9+0aaC4W9a3uV9b1FAMan1c
         PNG72cPrt8etKQ8upv4zZu9f+apnL3mx1jbIiK6Dy0yVm4HQaz2jY8vfWzgmJWF+OvNu
         5lbhAP6N0mcfXspdTYpvMrdcCNe5Sk6ka7+E9lW+0Q8Uh9xpYOoBEemceeDJEPasWqpg
         eApbOaHuKFvcXXqFCC1lCuwGuKcMa4MZ/6fYlycda8Nh7S0gpX1LP6TkCsxAfzl/4497
         GMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EpHqZSb89Ze6YQ2yo72O8+0pB4IQzPJGKW2B32FbcY=;
        b=g70+MeGh3EzPKqIkRJ4BDFo42vhOecRemgsi3KW7LxWfT7krVc+ExHXG13ThMQ4v17
         si5iRf3FVq1WIdk44xeDgxGPMho8PUhOqJ0g/Sh5R24qah+Djs0txycztY/QjtrGzldS
         l67SvNn3pvrou3F9Dk5P/1T7DrQZ3a5SL5vvzwuN6NOq7WkXWCNNNeX3faBbgFkY1clm
         /ahnQo5jbhyNclQbrSoAPlR2aHeQHrI+me4p9JlgByRW/T5rOjOLXXAYX8Ya4U/K44CU
         PJaghRTQIOTLvZpyFaOnF7AgCKKwpaqRaP4AmP1VO9+BKH6iHLC0ResL4mOwS8ZKxfE/
         oU5A==
X-Gm-Message-State: ANoB5pnRGIVNx24oMcbxOcwdnQQfeH6cGat2T3DjCUlhHMiHVxpTj9MW
	QPySt9XX0Kon0kkhrV4aeqg/pg==
X-Google-Smtp-Source: AA0mqf4C7a8msWcEL+e4aUXZWxwRSJFXJSxQmq0StXpEkqceLuWKrbz0d7MQc7OQXqOX4aChnNPp6w==
X-Received: by 2002:a17:907:c20d:b0:7b8:882d:43fc with SMTP id ti13-20020a170907c20d00b007b8882d43fcmr10034499ejc.0.1669287053134;
        Thu, 24 Nov 2022 02:50:53 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id f15-20020a50fc8f000000b00462e1d8e914sm365978edq.68.2022.11.24.02.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 02:50:52 -0800 (PST)
Date: Thu, 24 Nov 2022 11:50:51 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@atishpatra.org>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC 6/9] RISC-V: KVM: Add SBI PMU extension support
Message-ID: <20221124105051.hbsavj3bgf4mvlzb@kamzik>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
 <20220718170205.2972215-7-atishp@rivosinc.com>
 <20221101142631.du54p4kyhlgf54cr@kamzik>
 <CAOnJCUJfakcoiWh4vFk5_BcTKfoSDbx+wtmh7MW4cPYog7q4BQ@mail.gmail.com>
 <20221123135842.uyw46kbybgb7unm2@kamzik>
 <CAOnJCUKZV+0Xts6C4QY7X+Wak0ZR_f8wPtEAtH4PEmh2-_AcWw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCUKZV+0Xts6C4QY7X+Wak0ZR_f8wPtEAtH4PEmh2-_AcWw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_025056_775616_792C8C94 
X-CRM114-Status: GOOD (  27.85  )
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

On Thu, Nov 24, 2022 at 02:18:26AM -0800, Atish Patra wrote:
> On Wed, Nov 23, 2022 at 5:58 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Tue, Nov 22, 2022 at 03:08:34PM -0800, Atish Patra wrote:
...
> > > Currently, ARM64 enables pmu from user space using device control APIs
> > > on vcpu fd.
> > > Are you suggesting we should do something like that ?
> >
> > Yes. Although choosing which KVM API should be used could probably be
> > thought-out again. x86 uses VM ioctls.
> >
> 
> How does it handle hetergenous systems in per VM ioctls ?

I don't think it does, but neither does arm64. Afaik, the only way to run
KVM VMs on heterogeneous systems is to pin the VM to one set of the CPUs,
i.e. make sure the system it runs on is homogeneous.

I agree we shouldn't paint ourselves into a homogeneous-only corner for
riscv, though, so if it's possible to use VCPU APIs, then I guess we
should. Although, one thing to keep in mind is that if the same ioctl
needs to be run on each VCPU, then, when we start building VMs with
hundreds of VCPUs, we'll see slow VM starts.

> 
> > >
> > > If PMU needs to have device control APIs (either via vcpu fd or its
> > > own), we can retrieve
> > > the hpmcounter width and count from there as well.
> >
> > Right. We need to decide how the VM/VCPU + PMU user interface should look.
> > A separate PMU device, like arm64 has, sounds good, but the ioctl
> > sequences for initialization may get more tricky.
> >
> 
> Do we really need a per VM interface ? I was thinking we can just
> continue to use
> one reg interface for PMU as well. We probably need two of them.
> 
> 1. To enable/disable SBI extension
>     -- The probe function will depend on this
> 2. PMU specific get/set
>     -- Number of hpmcounters
>     -- hpmcounter width
>     -- enable PMU

ONE_REG is good for registers and virtual registers, which means the
number of hpmcounters and the hpmcounter width are probably good
candidates, but I'm not sure we should use it for enable/init types of
purposes.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
