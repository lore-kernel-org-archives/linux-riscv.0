Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6199C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 13:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Th6V5B12ae9TEAJnwpkmciK+Tx4mboiNWArqPb3kzGI=; b=AUG4IVRsLZdJ8+
	BVMbyECoWsEd2TWwmqSD/HrzaSdHzyRPCxl1B8PTHVUw/HWowLz1ZBQHCGJhZEsAMZSRddn8bi80z
	+IH+7AFHaA0e+DvMZTs1JVL8GKv9OnACxH9ImM+PL+aHU3mJL2/yxlkd0vVa0G8ZCeksfTbao/CWN
	1ve/90/jFRxnKKhWvQ+hJnFayNVstWO3d73dSqc6BDUA5qJv+peeok3LHNojGvYPKyBj+75H/pHk0
	/xrL2ewEKVBuswrRtHHCD0gkr6FF5mFPxf+DC6BAz23dlAOPM62P/U/3Ll1DUDBcwbUuNOTF/zAJ8
	9usG97xkC251vOVlhsBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqH3-00HRVb-Ny; Wed, 23 Nov 2022 13:58:49 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqGz-00HRTN-SR
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 13:58:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id r9-20020a1c4409000000b003d02dd48c45so1167089wma.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Nov 2022 05:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b1Quh2S4Mqiz+mnmyB9nbm+e1ppPa6f3UhLHFNBAwqA=;
        b=RtArgD6+Z8rmyrUSFbh8yCVa5eEuQ0iy1z/3lv/Pmpd0w0tSDdpujqmsSNJX0x4mmd
         WIqT4YBwZWrDyaCzY1bdpaGY+t7jMv9Pmu8HJe4Ndtz5E587A2I0rUl3lg5TwjHg/xPH
         yYn/G0QQkQ52ZgshAgQCyG0Ebv3wSa1WZWYBwjQJxwIssdAKD9kSMNAAuet4myzGnmBB
         RIfNzvIIMxrxOIKnK6F0MMkFixiH8KV09xVtHfISjKrgPaerVMMXn6TFlMfNteX48vha
         Ly17fqLt5ylR2IGFfF3VVsfXofaivmpU9lSqRo2pxgwVH54gPAxL/HT55x90YlejspCV
         GZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1Quh2S4Mqiz+mnmyB9nbm+e1ppPa6f3UhLHFNBAwqA=;
        b=AOkNcaqW4NPyNEcioMH2C3ybfN6iXAOv41CPcUaZE4QrUavlahlCokr1DQPb6nfOIx
         ZSzSEDODUVH5eJF88IEVN1GGUtRzKheOrO21y+mCHWj6t91sxGyq+XL9G3eUdrs9Vx3b
         Bx5yhiPM7npCrsyPm8WZfMY3A+NUqutV4S6IJIEd3q4ex3UQeqH1zELO3Uc+xbulR5rQ
         OLUksQTxjYmowWemAP+k/YsceC0whtETXEvjdihpQp1oBM9QVD0e87Xy4fTiejQ65JUj
         lFbYk8XxB9vyd0/KwssvmzColCHiW6raWd+IkLZibCMFMqJpQ+4/5Aow6tpDGoLxjgi2
         xx4A==
X-Gm-Message-State: ANoB5pm4Xo1iPQf7U9Vkm8T0DJINPKDKs02I/QK+NFAsti1ZqqKl7sHL
	u7idx37VC1reDtbQauKhViELJw==
X-Google-Smtp-Source: AA0mqf4VrPbtxMqRs2lUsgDIfzAcYJfq1GzhGZj+v9rkaPfsGzHMCFlz1vXX8UzjKJAqIn3aEELWwg==
X-Received: by 2002:a05:600c:4f55:b0:3cf:729b:d4b4 with SMTP id m21-20020a05600c4f5500b003cf729bd4b4mr14142344wmq.48.1669211923651;
        Wed, 23 Nov 2022 05:58:43 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id y10-20020a5d620a000000b002366dd0e030sm16751799wru.68.2022.11.23.05.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 05:58:43 -0800 (PST)
Date: Wed, 23 Nov 2022 14:58:42 +0100
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
Message-ID: <20221123135842.uyw46kbybgb7unm2@kamzik>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
 <20220718170205.2972215-7-atishp@rivosinc.com>
 <20221101142631.du54p4kyhlgf54cr@kamzik>
 <CAOnJCUJfakcoiWh4vFk5_BcTKfoSDbx+wtmh7MW4cPYog7q4BQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCUJfakcoiWh4vFk5_BcTKfoSDbx+wtmh7MW4cPYog7q4BQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_055845_941079_72D79B49 
X-CRM114-Status: GOOD (  27.26  )
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

On Tue, Nov 22, 2022 at 03:08:34PM -0800, Atish Patra wrote:
> On Tue, Nov 1, 2022 at 7:26 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Mon, Jul 18, 2022 at 10:02:02AM -0700, Atish Patra wrote:
...
> > > +static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> > > +                                unsigned long *out_val,
> > > +                                struct kvm_cpu_trap *utrap,
> > > +                                bool *exit)
> > > +{
> > > +     int ret = -EOPNOTSUPP;
> > > +     struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> > > +     unsigned long funcid = cp->a6;
> > > +     uint64_t temp;
> >
> > I think we need something like
> >
> >    if (!vcpu_to_pmu(vcpu)->enabled)
> >       return -EOPNOTSUPP;
> >
> > here. Where 'enabled' is only true when we successfully initialize
> > the pmu. And, successful initialization depends on
> 
> Yes. I have added the flag. But should we do the check here or
> respective function
> as a paranoia sanity check ?

I think something like above that returns a not-supported error should be
in all the entry points, like the top level SBI call handler. Functions
that should never be called unless the PMU is active could have WARNs
added for sanity checks.

> 
> > IS_ENABLED(CONFIG_RISCV_PMU_SBI) and
> 
> Why do we need to guard under CONFIG_RISCV_PMU_SBI ?
> vcpu_sbi_pmu.c is only compiled under CONFIG_RISCV_PMU_SBI
> 
> If CONFIG_RISCV_PMU_SBI is not enabled, probe function will return failure.

You're right. We don't need explicit config checks for things that can't
exist without the config.

> 
> In fact, I think we should also add the pmu enabled check in the probe function
> itself. Probe function(kvm_sbi_ext_pmu_probe) should only true when
> both vcpu_to_pmu(vcpu)->enabled and
> riscv_isa_extension_available(NULL, SSCOFPMF) are true.
> 
> Thoughts?

Agreed.

> 
> > riscv_isa_extension_available(NULL, SSCOFPMF) as well as not
> > failing other things. And, KVM userspace should be able to
> > disable the pmu, which keep enabled from being set as well.
> >
> We already have provisions for disabling sscofpmf from guests via ISA
> one reg interface.
> Do you mean disable the entire PMU from userspace ?

Yes. We may need to configure a VM without a PMU to increase its
migratability, workaround errata, or just for testing/debugging purposes.

> 
> Currently, ARM64 enables pmu from user space using device control APIs
> on vcpu fd.
> Are you suggesting we should do something like that ?

Yes. Although choosing which KVM API should be used could probably be
thought-out again. x86 uses VM ioctls.

> 
> If PMU needs to have device control APIs (either via vcpu fd or its
> own), we can retrieve
> the hpmcounter width and count from there as well.

Right. We need to decide how the VM/VCPU + PMU user interface should look.
A separate PMU device, like arm64 has, sounds good, but the ioctl
sequences for initialization may get more tricky.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
