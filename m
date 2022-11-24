Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6B2C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 10:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=23ppNtmjYTYmse+86Af1hmjiD2pTvOPcgYT9e6K458E=; b=V7PAa6jMOORSl2
	bb9RKP/STOvFmRxRf52eKZ41YRTY4rEfY1dRgbAVIUu9LWdFMi/rK0fPmqryJPdmdBiiprBmFiYoN
	xyoDHIfVlD0akg3KQKk5kW2Ag3d8EU/TUp0xBEeMGTbQOnDOOFyKjCspLw/dhB3lnOrIPp7e7+VRD
	7xIk+kOxl8JpgKfhuMKTuuUFnP1mHBDUJLTFSw3cRw+cwDuBFwJJRHUmGUlEOY7eP5anJ/ijU1gfx
	lClf/UpHK3/YWFCao63x9svcAt7OIrt0Q7LXsMU1HORiQLHdpVlY5La6ZD/po/HrBb8AAK7CnzjmQ
	F51uVmEkDU/yeEyqpPUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy9Ja-007ZGB-Kx; Thu, 24 Nov 2022 10:18:42 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy9JW-007ZDx-Rz
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 10:18:40 +0000
Received: by mail-oi1-x22d.google.com with SMTP id v82so1142306oib.4
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 02:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zGiZlBvNiwhpkqsR+b3pszQBQ7Auh+g6CaM/s8BUrYg=;
        b=YDyoj+Zi8XAnNDRzcGL99v05D7zM8bWz+3OqIzyD2w4N2pJALRtx8fJ8jFEHjuO6DL
         Mu+mYCeMpo/gbYQ5WroHlgcWIZHJ69btnS3eLz5Ww0okQo6qof1zG2bsnzX7kNEOJJ/z
         6wUTLbB8asyfYc7hleNjb2knO4EabRB9LnoeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGiZlBvNiwhpkqsR+b3pszQBQ7Auh+g6CaM/s8BUrYg=;
        b=aA4VqOqRIg11jLc5ivMTb9ApVqcI3MfHkv864BKRqci6B8n+rSgi+SlvSr3jNnN7rZ
         26yMfPUAjVVHs1nooI5yKQg5yboaKf3Yfg4ugDJa3jYb2k+YKXK4nQqr6RctM4PMzN5j
         zbpEjqz5kPBbz7Hfis34Ky8uThya87PT9eqpaZLxeMoVw82EhWr/Rua9uQwF+OUPvZZP
         WPeKwixaFYxTJgnMcUkjP0WpGfGoqZioXyv7WS93vzHnPZOMXrNtnttfK7tjsAo2A93v
         s16ZIXEGOUqFLpU7kbLtC0MF4fgGbC9QVQQ9rDpeiXYTHx4iAm6FIlsL68cJ8eAqDgVV
         FitA==
X-Gm-Message-State: ANoB5pnhtSa5Yy23vxUHRMU35Db7dmqQXhTLfDloTGxaZWuNXNJKEUoi
	5Gz/cBK4Xuggtl2FdMzz7W+f1SZt3Dscxk+yIarB
X-Google-Smtp-Source: AA0mqf6C5dlDvnPsT44KvSrCnZApXT9e7P7KCYteZn1aOOsjl4G37U/m6ORn0KcUFQTwHGkePw8WKf/CRMGz0a8DiPo=
X-Received: by 2002:a05:6808:51:b0:359:f091:104 with SMTP id
 v17-20020a056808005100b00359f0910104mr19097584oic.274.1669285117693; Thu, 24
 Nov 2022 02:18:37 -0800 (PST)
MIME-Version: 1.0
References: <20220718170205.2972215-1-atishp@rivosinc.com> <20220718170205.2972215-7-atishp@rivosinc.com>
 <20221101142631.du54p4kyhlgf54cr@kamzik> <CAOnJCUJfakcoiWh4vFk5_BcTKfoSDbx+wtmh7MW4cPYog7q4BQ@mail.gmail.com>
 <20221123135842.uyw46kbybgb7unm2@kamzik>
In-Reply-To: <20221123135842.uyw46kbybgb7unm2@kamzik>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 24 Nov 2022 02:18:26 -0800
Message-ID: <CAOnJCUKZV+0Xts6C4QY7X+Wak0ZR_f8wPtEAtH4PEmh2-_AcWw@mail.gmail.com>
Subject: Re: [RFC 6/9] RISC-V: KVM: Add SBI PMU extension support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_021838_924311_2AC0B532 
X-CRM114-Status: GOOD (  34.39  )
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

On Wed, Nov 23, 2022 at 5:58 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Tue, Nov 22, 2022 at 03:08:34PM -0800, Atish Patra wrote:
> > On Tue, Nov 1, 2022 at 7:26 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> > > On Mon, Jul 18, 2022 at 10:02:02AM -0700, Atish Patra wrote:
> ...
> > > > +static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> > > > +                                unsigned long *out_val,
> > > > +                                struct kvm_cpu_trap *utrap,
> > > > +                                bool *exit)
> > > > +{
> > > > +     int ret = -EOPNOTSUPP;
> > > > +     struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> > > > +     unsigned long funcid = cp->a6;
> > > > +     uint64_t temp;
> > >
> > > I think we need something like
> > >
> > >    if (!vcpu_to_pmu(vcpu)->enabled)
> > >       return -EOPNOTSUPP;
> > >
> > > here. Where 'enabled' is only true when we successfully initialize
> > > the pmu. And, successful initialization depends on
> >
> > Yes. I have added the flag. But should we do the check here or
> > respective function
> > as a paranoia sanity check ?
>
> I think something like above that returns a not-supported error should be
> in all the entry points, like the top level SBI call handler. Functions
> that should never be called unless the PMU is active could have WARNs
> added for sanity checks.
>

Sure. Will add those checks.

> >
> > > IS_ENABLED(CONFIG_RISCV_PMU_SBI) and
> >
> > Why do we need to guard under CONFIG_RISCV_PMU_SBI ?
> > vcpu_sbi_pmu.c is only compiled under CONFIG_RISCV_PMU_SBI
> >
> > If CONFIG_RISCV_PMU_SBI is not enabled, probe function will return failure.
>
> You're right. We don't need explicit config checks for things that can't
> exist without the config.
>
> >
> > In fact, I think we should also add the pmu enabled check in the probe function
> > itself. Probe function(kvm_sbi_ext_pmu_probe) should only true when
> > both vcpu_to_pmu(vcpu)->enabled and
> > riscv_isa_extension_available(NULL, SSCOFPMF) are true.
> >
> > Thoughts?
>
> Agreed.
>
> >
> > > riscv_isa_extension_available(NULL, SSCOFPMF) as well as not
> > > failing other things. And, KVM userspace should be able to
> > > disable the pmu, which keep enabled from being set as well.
> > >
> > We already have provisions for disabling sscofpmf from guests via ISA
> > one reg interface.
> > Do you mean disable the entire PMU from userspace ?
>
> Yes. We may need to configure a VM without a PMU to increase its
> migratability, workaround errata, or just for testing/debugging purposes.
>
> >
> > Currently, ARM64 enables pmu from user space using device control APIs
> > on vcpu fd.
> > Are you suggesting we should do something like that ?
>
> Yes. Although choosing which KVM API should be used could probably be
> thought-out again. x86 uses VM ioctls.
>

How does it handle hetergenous systems in per VM ioctls ?

> >
> > If PMU needs to have device control APIs (either via vcpu fd or its
> > own), we can retrieve
> > the hpmcounter width and count from there as well.
>
> Right. We need to decide how the VM/VCPU + PMU user interface should look.
> A separate PMU device, like arm64 has, sounds good, but the ioctl
> sequences for initialization may get more tricky.
>

Do we really need a per VM interface ? I was thinking we can just
continue to use
one reg interface for PMU as well. We probably need two of them.

1. To enable/disable SBI extension
    -- The probe function will depend on this
2. PMU specific get/set
    -- Number of hpmcounters
    -- hpmcounter width
    -- enable PMU


> Thanks,
> drew



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
