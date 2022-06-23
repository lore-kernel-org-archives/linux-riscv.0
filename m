Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD78DC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jun 2022 18:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w942ntk1YZNXm6suivXBLywteStK8ZMfaBviMNAI+J8=; b=GtHFyunlBHDw7S
	U9zIBhE+GuEvjUZTfQV+sqPQ1XiteGNPwekBAlw9kXpCYHQNYkRMmNsRpqqrv/0iPzmU7eitAx4NN
	ijFu83Plcq+6FYzJtVlh8+UPQuu9zdT1tvypGPrrfmFeCS8e3JXtvMsm21WcdxNVwU5Em9hBHTZ1i
	hqH8ZdzpD1xV08sBCxzLSi19Ecwgf5AOkds5fOGx79Cg9o+5MTkYcLcOjfCAFsR9bJE/0Ht2PGo/J
	cqPokWeqlkB1SzCTkE+FWr3imXIMs6jp25PGCDflviyFZ5Vz2+su4yc9wNf6nqvmil0j2n3Zk7yyg
	biTgOlGwwsC5rJeCo4zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4RIa-00GH7G-RV; Thu, 23 Jun 2022 18:11:24 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4RIY-00GH68-A2
	for linux-riscv@lists.infradead.org; Thu, 23 Jun 2022 18:11:23 +0000
Received: by mail-lf1-x133.google.com with SMTP id z13so283696lfj.13
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 11:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=goIJpSPii4Rv1Y9r/f5LIUhTchHgln+zZ20Pyldf3yc=;
        b=W6OO5ofJhyPgB/F91c/rAwQd8ANJ83sIVf7vs0H/E1K7K8UxWJjvdxoL4LfZ6Geu8R
         LQ/wcsL1y3Df0JuQz/geW4V6yWrVKKDUtpYtaVRfcFG/a+uakZwB2QO/wJ8syZX/3Wzk
         70cwc/3adMSDQq5N3NZjBR+ObQ4UbEoXvvuashtKlS2ZI+6M5gHgRYLYqFj6aJuHfrNs
         YxTMVHEDcq7fQm+9eRy68Hmbqu1fPHKL6L1ARyjyvIBxA2Il4FscGTL8tCnQ+fRQ1Ky9
         e2Xc2dvRO6StYW70yBEXfmIxCz4cWfnpPB+0x0r4HQmDIw29HmJDWZTN1dth8KWzyyvv
         Indw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=goIJpSPii4Rv1Y9r/f5LIUhTchHgln+zZ20Pyldf3yc=;
        b=uOctFjbQjs7x+dlKoxq0CmFBH4lwj2upSGtTlTKGDsk2PiAe/QTAsFDUQccLOnyZLK
         6IH7Xl3X+QyjfpGPjEtHU6OjXrH4WaXe1pwEszQpZRhf3HILgG40GvuOjfWVhejMUYv9
         cSE8c8gImdqUrElnephMfYbC9+ZyDHfsRMbZVYnKvWM757DfM/hOD//oL4fdv4H1+yZ8
         or/8ADIrYIfLdBNhknnP9q9CvYrYhj/c0FbA9Q5zGDTp7yxZVuKG6/p9640sWP/HKLrR
         gR3HVkYvikM8FHLADM2h+opXEr5IoJvOLG8XMvH9TrD9XXJXZHrjMBY8pZnnq9gwYZdo
         4Ieg==
X-Gm-Message-State: AJIora/3XCbT2Af9O/qE1MVJFhv5DvUkBuRnEzAZ3J0fuyxVRzNyIWyY
	GQPcipTZ18VOqYVRvQkUn4mfBfGdWR5BpQ==
X-Google-Smtp-Source: AGRyM1tjGjDOiFw/RHqkaixW5XGwDbrTr06NAHU58sN8Z5mgzIIzVKMxPFZh4r0BlL6NTacfB+Kqbw==
X-Received: by 2002:a19:9209:0:b0:47d:bb62:9103 with SMTP id u9-20020a199209000000b0047dbb629103mr6419647lfd.314.1656007879800;
        Thu, 23 Jun 2022 11:11:19 -0700 (PDT)
Received: from curiosity ([80.211.22.60])
        by smtp.gmail.com with ESMTPSA id o4-20020ac24e84000000b0047f8cb94004sm1036173lfr.35.2022.06.23.11.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 11:11:19 -0700 (PDT)
Date: Thu, 23 Jun 2022 21:10:58 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
	Anup Patel <anup@brainfault.org>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Subject: Re: [PATCH 1/3] perf: RISC-V: fix access beyond allocated array
Message-ID: <YrSssrZ2XP9PYOXt@curiosity>
References: <20220623112735.357093-1-geomatsi@gmail.com>
 <20220623112735.357093-2-geomatsi@gmail.com>
 <CAOnJCULorBMqCSjV8+s_5EhfNUgz7yS_BO-etC=7_NmTF8Sf1w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCULorBMqCSjV8+s_5EhfNUgz7yS_BO-etC=7_NmTF8Sf1w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_111122_396585_02CC5E9D 
X-CRM114-Status: GOOD (  21.30  )
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

> > Both OpenSBI and Linux driver explicitly assume that pmu counter IDs are
> > not expected to be contiguous. Namely, there is no hardware counter with
> > index 1: hardware uses that bit for TM control. However counter array is
> > allocated without that assumption. As a result, memory beyond allocated
> > array is accessed. Fix this by adding unused array element for index 1.
> >
> > Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> > ---
> >  drivers/perf/riscv_pmu_sbi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> > index dca3537a8dcc..3e0ea564b9b8 100644
> > --- a/drivers/perf/riscv_pmu_sbi.c
> > +++ b/drivers/perf/riscv_pmu_sbi.c
> > @@ -453,7 +453,7 @@ static int pmu_sbi_get_ctrinfo(int nctr)
> >         int i, num_hw_ctr = 0, num_fw_ctr = 0;
> >         union sbi_pmu_ctr_info cinfo;
> >
> > -       pmu_ctr_list = kcalloc(nctr, sizeof(*pmu_ctr_list), GFP_KERNEL);
> > +       pmu_ctr_list = kcalloc(nctr + 1, sizeof(*pmu_ctr_list), GFP_KERNEL);
> >         if (!pmu_ctr_list)
> >                 return -ENOMEM;
> >
> > --
> > 2.36.1
> >
> 
> instead of this, get_info for loop should be restricted nctr as it
> should be zero indexed.
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index f9cf6c62aaea..0722fe2869aa 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -491,7 +491,7 @@ static int pmu_sbi_get_ctrinfo(int nctr, int *num_hw_ctrs)
>         if (!pmu_ctr_list)
>                 return -ENOMEM;
> 
> -       for (i = 0; i <= nctr; i++) {
> +       for (i = 0; i < nctr; i++) {
>                 ret = sbi_ecall(SBI_EXT_PMU,
> SBI_EXT_PMU_COUNTER_GET_INFO, i, 0, 0, 0, 0, 0);
>                 if (ret.error)
>                         /* The logical counter ids are not expected to
> be contiguous */

Well, this is going to fix immediate issue. But array size will have to
be increased by one to enable access to the highest index counter (see
the 2nd patch).

Regards,
Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
