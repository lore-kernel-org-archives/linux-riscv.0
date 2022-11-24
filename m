Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D363C43217
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 13:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AxovwF8ubPIPkxlWHsbYwN1dt7SYYkn4UuP+W4jhzoA=; b=I72P7oBRGnY9l6
	tV1bNu6sggQ0D9ukJ51gq5gzOPL2WDzRSUowa1gK4P4aqhnxBY2tGulPd5kcyJiY95xNNCi7Aea1M
	j0qWp1vu5ahQEhFo4CVZAOj0qYv5W4Wu9xE/vwHlVmUCFyWvqazDjHTWi7eOWm6j1mpXSwVlh8QMc
	erhBIyQyfy4tIx2cREcgLV4xVapA1M5AMSrPIvg1VmriTQkJUMZb89xgIwvrKXWgyXyUSWBZ5JDM6
	TtqnBcFnwt3p0XSC+HeZhz/5LVzqGOv+UAbDS3r/mFIATB6/wFEQpdKnqnmh+boSOEbFaHZTAmQjO
	2ZGknvv+SWIR29SEDqIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyC5t-008g7s-K6; Thu, 24 Nov 2022 13:16:45 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyBp2-008YAj-Fs
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 12:59:22 +0000
Received: by mail-oi1-x235.google.com with SMTP id c129so1530115oia.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 04:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jWhjZ8Ik6udAxmU7OrnkH0fp8I0zGCvkX7BlR9Epea8=;
        b=IC3tTQJtWUJQyjZrGL6F6TYNH5H29hlmfBUQkgCMCV/wz5PfN4ovrgjSXVW62CedRi
         QARU0pDSP2eRrKKPXeyJVL5Iuo2p7Zgxd0GtDE4j3fmQPMr/6YYTg+O0YkBYsab8T/tQ
         pdrDU0ljJOb85kDxDoU/GNjcYFxJO1APG9R/aaVJCCRqNw0NUld3q0P/3gDEugJqw80c
         1zYvWHi2PK9FyJt+tN8GjidSP+kggtDWAnklLwAyHXuXhK5SarF7ki1tYcWBkMXe6zFa
         pp+4OsdhAzd2LNEfaXIYcD5Tu5tx4Xx0y8u3fEBmG6CsIi6hg8GmIRZO5kqq6DeG7Xcy
         FJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jWhjZ8Ik6udAxmU7OrnkH0fp8I0zGCvkX7BlR9Epea8=;
        b=0X4Bdso2pBRKMKcju30ABmp2UoyS4+M4O8stxCANwNK/aLCEcz1S/dSN20zvLGzu2A
         uXrJ5t0CNXZRSuQg8C5IWh8VW9j5qrbrkHinVoKVaS6NIAW/rmI8NSZBoTUmFs+cFPka
         mNRV2gkMnOVYC1yhFcYan6waeqMeaXiJ2aqTxD7Q0Htlq2FCmKclskNR0Cdjw5FzjJnP
         OV2lz7Ilzk6VFrsVIQWutIc7osMc+W2AMadtXn6Eq+MAWO1/wj6gnElQYb45Mnmegm52
         Jl8iprdDBVFBPK/cp2JkXpNr4RbFB5ulRh2MXIKtKip7VZGuGKZK9PCH2G3XzAX108Q7
         O/nA==
X-Gm-Message-State: ANoB5pldXkznyGx0OawUg4tMbLb3LCUVa3RE9nIRI9mvFH4UdiQ+0Yyr
	HK+5aZpd2wmQxfqjLISv3HBUBCvLNzS5rqdMUzQ/ww==
X-Google-Smtp-Source: AA0mqf58ktcA3pHdBUjrxW6zFt+WYodi0RAr78fTSZX+SH39xGLFckk74X32aAuTirPTsS6SUqgoUXYBSEubV3jo5Ec=
X-Received: by 2002:a05:6808:2102:b0:359:ac8d:4227 with SMTP id
 r2-20020a056808210200b00359ac8d4227mr6186334oiw.17.1669294754893; Thu, 24 Nov
 2022 04:59:14 -0800 (PST)
MIME-Version: 1.0
References: <20220718170205.2972215-1-atishp@rivosinc.com> <20220718170205.2972215-7-atishp@rivosinc.com>
 <20221101142631.du54p4kyhlgf54cr@kamzik> <CAOnJCUJfakcoiWh4vFk5_BcTKfoSDbx+wtmh7MW4cPYog7q4BQ@mail.gmail.com>
 <20221123135842.uyw46kbybgb7unm2@kamzik> <CAOnJCUKZV+0Xts6C4QY7X+Wak0ZR_f8wPtEAtH4PEmh2-_AcWw@mail.gmail.com>
 <20221124105051.hbsavj3bgf4mvlzb@kamzik>
In-Reply-To: <20221124105051.hbsavj3bgf4mvlzb@kamzik>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 24 Nov 2022 18:29:04 +0530
Message-ID: <CAK9=C2XifUiOdA4cTFbQq7SNVJn+1Xup_giw4jo_z6bRdng4hQ@mail.gmail.com>
Subject: Re: [RFC 6/9] RISC-V: KVM: Add SBI PMU extension support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_045920_596045_3EDFE7BD 
X-CRM114-Status: GOOD (  32.33  )
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

On Thu, Nov 24, 2022 at 4:21 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Thu, Nov 24, 2022 at 02:18:26AM -0800, Atish Patra wrote:
> > On Wed, Nov 23, 2022 at 5:58 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> > > On Tue, Nov 22, 2022 at 03:08:34PM -0800, Atish Patra wrote:
> ...
> > > > Currently, ARM64 enables pmu from user space using device control APIs
> > > > on vcpu fd.
> > > > Are you suggesting we should do something like that ?
> > >
> > > Yes. Although choosing which KVM API should be used could probably be
> > > thought-out again. x86 uses VM ioctls.
> > >
> >
> > How does it handle hetergenous systems in per VM ioctls ?
>
> I don't think it does, but neither does arm64. Afaik, the only way to run
> KVM VMs on heterogeneous systems is to pin the VM to one set of the CPUs,
> i.e. make sure the system it runs on is homogeneous.
>
> I agree we shouldn't paint ourselves into a homogeneous-only corner for
> riscv, though, so if it's possible to use VCPU APIs, then I guess we
> should. Although, one thing to keep in mind is that if the same ioctl
> needs to be run on each VCPU, then, when we start building VMs with
> hundreds of VCPUs, we'll see slow VM starts.
>
> >
> > > >
> > > > If PMU needs to have device control APIs (either via vcpu fd or its
> > > > own), we can retrieve
> > > > the hpmcounter width and count from there as well.
> > >
> > > Right. We need to decide how the VM/VCPU + PMU user interface should look.
> > > A separate PMU device, like arm64 has, sounds good, but the ioctl
> > > sequences for initialization may get more tricky.
> > >
> >
> > Do we really need a per VM interface ? I was thinking we can just
> > continue to use
> > one reg interface for PMU as well. We probably need two of them.
> >
> > 1. To enable/disable SBI extension
> >     -- The probe function will depend on this
> > 2. PMU specific get/set
> >     -- Number of hpmcounters
> >     -- hpmcounter width
> >     -- enable PMU
>
> ONE_REG is good for registers and virtual registers, which means the
> number of hpmcounters and the hpmcounter width are probably good
> candidates, but I'm not sure we should use it for enable/init types of
> purposes.

We are already using ONE_REG interface to enable/disable
ISA extensions so we should follow the same pattern and have
ONE_REG interface to enable/disable SBI extensions as well.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
