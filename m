Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4502BC43219
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 10:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hPpQOo40k/UZeQgim5naHeGThzwQvdzuC3eqnbDDtzs=; b=sLsD7EtRDOwsUW
	m865w1EpyMPW1oimnsT+HZCQ9BSzqMdcp4+sDsNvYmQmNG8YmqnAQGo1KXuWTssKGtOfyb5IMdJx+
	tgUerjTZQ/QNlTlF6a6iQbGOfbSFguHvaigte2HAYp658P+5z+P2xfp7yzU+XTGsGl3FI2iQ3jQss
	6aBI7lIWcZOmR/LbFPlrqCfHpTQ57XUaKu8v4x1W6WzjB/PzCVJTe+97qho0K93B6Ph7kbBipsN6A
	uNac6HvSbMdpjhzf6t0Pk3nFdju6ehReQipRzes4yH40wezlSct/tvSy1e31BdjMudNs7qONBHu+4
	OPpuH3PQ7NQiGl4/h26Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy9C8-007VaW-AQ; Thu, 24 Nov 2022 10:11:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy9C7-007VTg-2L
	for linux-riscv@bombadil.infradead.org; Thu, 24 Nov 2022 10:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lL7gdTpCNiKpeiKlTVZOoHHb+mH3E43X9VCyLiDvIVI=; b=ZMKZxjjuak1Re/5CCDXDWsOQJ1
	t95XnHXwqswDul5pcPzM4K51n5RWklc5rWUTUMd7grtc+pIVK6ilH1Mk9xgpbCBZm/r6IVVdp4Ij7
	vOxMNVPE6VB0PeHnScx9Tr3J6r2R8kloZvNi3u/rERlnL/ofqaxUYyQ47wSwHE8N6Y9QVZ26yhmzX
	Qud9GlxFw7ojp87PPzAlZ7OEjqnNdZvfkJolyFmU6zH/1QFbjBVxFPeT3r65VrPbdCAeCpS2m3+4W
	P5maeqmBve/NkYR744AMxNgnQYV96EkzHRAUaGZbZPuihRtbjanyz1czbk+EiWijm4mVknns3PgqP
	96xBbt6g==;
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy8EQ-0047ZC-8F
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 09:09:21 +0000
Received: by mail-ot1-x32b.google.com with SMTP id g51-20020a9d12b6000000b0066dbea0d203so574697otg.6
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 01:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lL7gdTpCNiKpeiKlTVZOoHHb+mH3E43X9VCyLiDvIVI=;
        b=XAEBxd6zFeZMWT09hA1sp4UtdtJIgi3oHr3R+60kZhZDYNWX5QqftD8ETthMbErJFN
         Q57WPdj89Ut97SoctXJkPc1a58dZeEI+2pA4m5s2UwGnwPgFrSAjh9m1MtW2JHUPgvGk
         CvxcvmlTr1bw9aS6pVUw41X/EWNEY4m2H09xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lL7gdTpCNiKpeiKlTVZOoHHb+mH3E43X9VCyLiDvIVI=;
        b=wKzSjNYOeqpb3njtbiPkd73XE2AzFS7a8J60fYyM8h4O+vTRobH9SCLYpe3kfzLHak
         /dJr54UcMDah3GyKNcqBW+Q0R4LQVcdroZ9+96RAsndNVvIskx8hvI6cEIBgEQLhqkBC
         A4qMe2jb3owSuG5uIFtcWFgpcywqcphyLS+lnAj+VhUgRPaP5osnHdxLlZYO24phUATT
         Z03R8Zb7bn7DM+scvkAWioguF6Wy5bO1bCifcG1y6naliHt1FjhAj3Y8a6n1hFpwy9xL
         rcqpDHtqkenk0Mtq7DuLsbSQKkaVNr52pewkwA1mwZOfGY5AQ0j84Pmj0PMt/zdqRoBY
         MRmA==
X-Gm-Message-State: ANoB5pmxpY56XPb10K5CtE26QeKYEJKvXZHQNYCKvBI/52LF1EKWnir8
	lNiToBp3OvAenEKs40tSyP4dXjCvLYo874WrNR/P
X-Google-Smtp-Source: AA0mqf4A90at0hGw7uFrk/vHI3ASzvDpqG1jZS+ElZMyGTWmbGCzjTmbNB/1dzUwPeHb3xtj5+s885kLmAHTKag5fPc=
X-Received: by 2002:a9d:4812:0:b0:66d:1e19:684b with SMTP id
 c18-20020a9d4812000000b0066d1e19684bmr16755831otf.44.1669280954244; Thu, 24
 Nov 2022 01:09:14 -0800 (PST)
MIME-Version: 1.0
References: <20220718170205.2972215-1-atishp@rivosinc.com> <20220718170205.2972215-6-atishp@rivosinc.com>
 <20221101141329.j4qtvjf6kmqixt2r@kamzik> <CAOnJCULMbTp6WhVRWHxzFnUgCJJV01hcyukQxSEih-sYt5TJWg@mail.gmail.com>
 <20221123131104.zglb3osa5tsgkkkb@kamzik>
In-Reply-To: <20221123131104.zglb3osa5tsgkkkb@kamzik>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 24 Nov 2022 01:09:03 -0800
Message-ID: <CAOnJCUK0PcSXxt-Qvomy-4UoP5993-bVfPvWn_Rd5=ELC9n1gA@mail.gmail.com>
Subject: Re: [RFC 5/9] RISC-V: KVM: Add skeleton support for perf
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_090918_487351_A871A359 
X-CRM114-Status: GOOD (  21.50  )
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

On Wed, Nov 23, 2022 at 5:11 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Tue, Nov 22, 2022 at 04:46:14PM -0800, Atish Patra wrote:
> ...
> > > > +     kvpmu->num_hw_ctrs = num_hw_ctrs;
> > > > +     kvpmu->num_fw_ctrs = num_fw_ctrs;
> > >
> > > Maybe it's coming later, but we need to give KVM userspace control over
> > > the number of counters to allow it to migrate to a larger set of hosts.
> > > Also, a previous patch said the virtual width must be the same as the
> > > host width for the hw counters, so we need userspace to know what that
> > > is in order to determine to which hosts it can migrate a guest.
> > >
> >
> > Yes. The entire user space access control needs to be sketched out.
> > We probably need another one reg interface to set/get the number of
> > counters/width.
> >
> > However, Is it a common to migrate a guest between different hosts
> > with different PMU capabilities ?
> >
>
> Ideally we'd be able to define a virtual CPU+PMU which represents the
> least common denominator of a set of hosts, allowing VMs which use that
> VCPU model to migrate among all the hosts. x86 pulls this off pretty well,
> but arm64 doesn't. In the least, I think a goal should be to enable
> migration of VMs from hosts with less extensions and less PMU counters to
> hosts with more, as that would support host upgrades without having to
> recreate VMs.
>

We also have hpmwidth to worry about. I guess the policy details will be
VMM specific one. We need to think through the parameters that can be
varied between
hosts. As you pointed out earlier,

1. hpmcounter wdith
2. Number of hpmcounters
3. PMU related ISA extension - this will be applicable for all the extensions.

Anything else ?


> Thanks,
> drew



--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
