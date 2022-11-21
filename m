Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BA4C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 23:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UV1AyATgjrKBfEDivaISq5Q9qW0ltD+LsyEAHTUG500=; b=AJit3uyxW1bhvD
	3ju4L/oQhiFOVS66CYcn7WBDCZL15/PwFcI2FDne3Eg+QXHuOlNmI+lJOT7LZM79t2+Yim0tZooew
	yVZg835ffHUS4Y+KQoaO62z8ycNJ6o/6AQATtE+I7Ty4dttrWEKqpOxFMEjphkqmZvVpNZcD03+AS
	+FIMTx7yy3zIt45cqUiHbVqyDVwdL5nGZblHX47v86FjU2AUwSpAmmgzsbTozK+H6btAP8gETbRQG
	RW1S3hO+VHB8UYMX9+HC+HsGkv0f02fUqA9knPZE4G4DsQsEaqnG9o/G39ysem9ldiPjM6eVbyIx+
	y86FImw2HNPRM3ZYNzGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxGYv-001S8D-NG; Mon, 21 Nov 2022 23:50:53 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxGYs-001S6g-CM
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 23:50:51 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46-20020a9d0631000000b00666823da25fso8360906otn.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 15:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9qJGSmI/PVM4rhm2z0vPY9+1OW24z6YeaOBoyxuNZ2Y=;
        b=pZeRXuaDR4YUAfk9pdiqFA9TNENllOMQJLmkdrsc2MdWnAAdd30cd7c7ROFGKUDQf6
         +ZNNNZ6KQrQS7mXrU5dtHljL+yC4zTULQH3K6B1tf9UZpkaXG5sbD0ytAKxL8yhOTF1I
         veCJvHxCJEFLT1214Au5yOvydOw7ieR3Csaxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qJGSmI/PVM4rhm2z0vPY9+1OW24z6YeaOBoyxuNZ2Y=;
        b=qfjS8vm8AEvSvh9eA5cmR1r7xlokPtKP+MnzQB8n0HYQAiEpo3oGdD8z+L/Hn7MB64
         nYQOKxj44jGGKxlC4gsNkMMRTIJJAt4ErEvZEKWi9YDj6uWN+b0qewcPThopEOccGerd
         ajvVke6nSu1IubCxSnGrsMWAi+Gtcffhl2cshbOgAjx3NKfX9jJN5wXL4CB0hzH/oVqo
         D+gil9j3zOaPF9S9f20cksxCaS7dJ9Smdwsy/VwrNnYYHcmJLocm4H31TWeLvMEXni6O
         cVnCJ/heO/tYJFCsJ/MjGAzF8aBQc7hVgsvu+CtzQcCXWgFnpQdoL0S0d3L+/6lNW3Hv
         vABA==
X-Gm-Message-State: ANoB5plpkrDlurjvIihryR57WG4Zd7lbXVrp3YiXGTvrZcTqjvvne11p
	mmi20CaROtf0wpk/bNFz2ShSNN0pu7Zv8vFb4kwW
X-Google-Smtp-Source: AA0mqf7kgYx54Yys6ETxvNQky+UEeKJ5p7LWh6nQdHq65TGyGvoY5M23v26YV+tFfDLtE9o9NFgqlU+8tlQQZEuniNM=
X-Received: by 2002:a05:6830:22f2:b0:669:3797:c1b4 with SMTP id
 t18-20020a05683022f200b006693797c1b4mr10436192otc.293.1669074648514; Mon, 21
 Nov 2022 15:50:48 -0800 (PST)
MIME-Version: 1.0
References: <20220718170205.2972215-1-atishp@rivosinc.com> <20220718170205.2972215-2-atishp@rivosinc.com>
 <20221101123008.e3bwen6f2yxi3whi@kamzik>
In-Reply-To: <20221101123008.e3bwen6f2yxi3whi@kamzik>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 21 Nov 2022 15:50:37 -0800
Message-ID: <CAOnJCU+wf=CR12GONjBougZGs+ZQV1MoDAK-w+ALQatEECoFBQ@mail.gmail.com>
Subject: Re: [RFC 1/9] RISC-V: Define a helper function to probe number of
 hardware counters
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_155050_686803_A7D5D693 
X-CRM114-Status: GOOD (  24.61  )
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

On Tue, Nov 1, 2022 at 5:30 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Mon, Jul 18, 2022 at 10:01:57AM -0700, Atish Patra wrote:
> > KVM module needs to know how many hardware counters the platform supports.
> > Otherwise, it will not be able to show optimal value of virtual
>                                         ^ the
> > counters to the guest.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  drivers/perf/riscv_pmu_sbi.c   | 23 +++++++++++++++++------
> >  include/linux/perf/riscv_pmu.h |  4 ++++
> >  2 files changed, 21 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> > index 24124546844c..1723af68ffa1 100644
> > --- a/drivers/perf/riscv_pmu_sbi.c
> > +++ b/drivers/perf/riscv_pmu_sbi.c
> > @@ -27,6 +27,7 @@
> >   */
> >  static union sbi_pmu_ctr_info *pmu_ctr_list;
> >  static unsigned int riscv_pmu_irq;
> > +static struct riscv_pmu *rvpmu;
>
> Do we really need rvpmu? From a quick scan of the series it's only used
> for num_hw_counters, which has to be added to struct riscv_pmu, and
> num_counters. How about instead creating a static global for num_counters

Yes. I added rvpmu just for future usage if any.

> and then getting num_hw_counters by iterating pmu_ctr_list. If we want

iteration is fine as we are doing that for hpm_width anyways.

> riscv_pmu_sbi_get_num_hw_ctrs() to be faster, then we can cache the value
> in a static variable in the function.
>

We have cmask now which can be cached in a static variable. We need to
retrieve the
counter width and the hardware counters for kvm. I have combined PATCH
1 & PATCH 2
to return both the values in one function.

> Thanks,
> drew



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
