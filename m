Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A69C4321E
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 21:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jZGjHLIz4WuWuVa9oOWKebxdmyNpll9XNq976/I6qkM=; b=Ld7jAN9ZOzQHyv
	DKmFGJKEZVkMz5xC+y/nTftKO10JmDwo61ilekoQn3nhD0LsiZz90MERxyVxv+dmkQtsJm6qHeetM
	QjLtEtv/xoDlsgSFi5I0rESD7Rkv26Y3BJRHm7xSAova3acUOy2tPf18y8NPqlh6RyE8TizJM4a0v
	oRW86IksjVAhaTULuJFZhuPwIheo+mq/sQ15a/9zmfClaPB7eZPS1hMv7msZwyHy9Ty79B9F/0xHU
	0fvmHuclvcrGK0FXTZrtZ/xNxN0SRsQYfNJahhxphRGKl52PKNjMn0wf5iQ+3d5cFeQ965LfYfAdm
	Cc5k+1JuDNUiLPXpeYeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlFY-004Pfq-MO; Mon, 28 Nov 2022 21:01:12 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlFR-004PbX-9G
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 21:01:10 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-142306beb9aso14567231fac.11
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 13:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C0LXIJI7Jwrp9irbYPVuZ/zATeld30E9BF4kDpuOTMY=;
        b=sychVsIuyCs1J6sBN39fZaWelxUucVukYj9mRGoF1TcGNnYpdd/Yeb/uvh6XlBjUWD
         +XvcyKtqpdr9+WPiouT7bCvHKPAfcsqUB8ouoz8ATXbrAmLyWmW+IATIRgfOCUamzen4
         A3AERg4lfY92/gZfNXiNubTPsFjR4uDuhDyZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0LXIJI7Jwrp9irbYPVuZ/zATeld30E9BF4kDpuOTMY=;
        b=ghD9ad32U8D9LxFoWefqeGR8U7WJ9izg7MPf8KeFyqa5er5nUthnEGMTve4vOI7XsQ
         lgjf4MSf2ZccHkTNi1BjWCTwxE3br3sCS7jqZyKRJa7QQxLJzc8ts+0MILgppdwen5RU
         jjiXvxKUhA4mh/TM2bRdr8FdzybjRQlpWAjpmEp8lQ6WTJSDZ6Whlw2okX1iR8xkVbU0
         4c3vQvi+Jv9AQSJkNrG/LLCR6pmItlHItWj4S8L4eAuq/qIx4Wh00iiKk8mGZs21clxY
         jJL6CR9AbS3Uuec/eR29Q41lU6HRTyGE3/Wdo9VjwbcYaa4FO/VSaVKeFDxejbGAq1RS
         1RQQ==
X-Gm-Message-State: ANoB5pkTOra++lr/+WGQ6SBymv0C8BWl7PzNfA8jp3ouej0k7GrUXauG
	WZKF2N1z42hqQe2NDEi+zu73X585rtv0QyNKDSKN
X-Google-Smtp-Source: AA0mqf5V4JXvrkWngJfl026KheDUhSJ3FXXcX5xGXvT8T4Cp3XBlpcG+E3IH/EnL11AB0oCM+6HqccSMUkRa7wiMuuE=
X-Received: by 2002:a05:6870:c18a:b0:142:870e:bd06 with SMTP id
 h10-20020a056870c18a00b00142870ebd06mr26790617oad.181.1669669261652; Mon, 28
 Nov 2022 13:01:01 -0800 (PST)
MIME-Version: 1.0
References: <20220718170205.2972215-1-atishp@rivosinc.com> <20220718170205.2972215-7-atishp@rivosinc.com>
 <20221101142631.du54p4kyhlgf54cr@kamzik> <CAOnJCUJfakcoiWh4vFk5_BcTKfoSDbx+wtmh7MW4cPYog7q4BQ@mail.gmail.com>
 <20221123135842.uyw46kbybgb7unm2@kamzik> <CAOnJCUKZV+0Xts6C4QY7X+Wak0ZR_f8wPtEAtH4PEmh2-_AcWw@mail.gmail.com>
 <20221124105051.hbsavj3bgf4mvlzb@kamzik> <CAK9=C2XifUiOdA4cTFbQq7SNVJn+1Xup_giw4jo_z6bRdng4hQ@mail.gmail.com>
In-Reply-To: <CAK9=C2XifUiOdA4cTFbQq7SNVJn+1Xup_giw4jo_z6bRdng4hQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 28 Nov 2022 13:00:50 -0800
Message-ID: <CAOnJCU+fxyLbLMEPbo+FA_DK+R872rJTeXrEeZGXwzxh6LyR0A@mail.gmail.com>
Subject: Re: [RFC 6/9] RISC-V: KVM: Add SBI PMU extension support
To: Anup Patel <apatel@ventanamicro.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_130105_607494_D2A077DE 
X-CRM114-Status: GOOD (  39.50  )
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

On Thu, Nov 24, 2022 at 4:59 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> On Thu, Nov 24, 2022 at 4:21 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Thu, Nov 24, 2022 at 02:18:26AM -0800, Atish Patra wrote:
> > > On Wed, Nov 23, 2022 at 5:58 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > > >
> > > > On Tue, Nov 22, 2022 at 03:08:34PM -0800, Atish Patra wrote:
> > ...
> > > > > Currently, ARM64 enables pmu from user space using device control APIs
> > > > > on vcpu fd.
> > > > > Are you suggesting we should do something like that ?
> > > >
> > > > Yes. Although choosing which KVM API should be used could probably be
> > > > thought-out again. x86 uses VM ioctls.
> > > >
> > >
> > > How does it handle hetergenous systems in per VM ioctls ?
> >
> > I don't think it does, but neither does arm64. Afaik, the only way to run
> > KVM VMs on heterogeneous systems is to pin the VM to one set of the CPUs,
> > i.e. make sure the system it runs on is homogeneous.
> >
> > I agree we shouldn't paint ourselves into a homogeneous-only corner for
> > riscv, though, so if it's possible to use VCPU APIs, then I guess we
> > should. Although, one thing to keep in mind is that if the same ioctl
> > needs to be run on each VCPU, then, when we start building VMs with
> > hundreds of VCPUs, we'll see slow VM starts.
> >
> > >
> > > > >
> > > > > If PMU needs to have device control APIs (either via vcpu fd or its
> > > > > own), we can retrieve
> > > > > the hpmcounter width and count from there as well.
> > > >
> > > > Right. We need to decide how the VM/VCPU + PMU user interface should look.
> > > > A separate PMU device, like arm64 has, sounds good, but the ioctl
> > > > sequences for initialization may get more tricky.
> > > >
> > >
> > > Do we really need a per VM interface ? I was thinking we can just
> > > continue to use
> > > one reg interface for PMU as well. We probably need two of them.
> > >
> > > 1. To enable/disable SBI extension
> > >     -- The probe function will depend on this
> > > 2. PMU specific get/set
> > >     -- Number of hpmcounters
> > >     -- hpmcounter width
> > >     -- enable PMU
> >
> > ONE_REG is good for registers and virtual registers, which means the
> > number of hpmcounters and the hpmcounter width are probably good
> > candidates, but I'm not sure we should use it for enable/init types of
> > purposes.
>
> We are already using ONE_REG interface to enable/disable
> ISA extensions so we should follow the same pattern and have
> ONE_REG interface to enable/disable SBI extensions as well.
>

Thinking about it more, it may end up in vcpus with heterogeneous
capabilities (different SBI extension).
Most likely, it will be a bug and incorrect configuration from VMM but
it's a possibility.
For example: There will be two different scenarios for PMU extension

1. Boot vcpu disabled PMU extension - probably okay as guest queries
the PMU extension on boot cpu only.
The PMU extension won't be available for any other vcpu.

2. Boot vcpu has PMU extension enabled but others have it disabled.
The run time SBI PMU calls will
fail with EOPNOTSUPP and the user gets confused.

There will be similar cases for HSM extension as well.

As the entire extension won't be available to the guest if the SBI
extension is disabled for the boot cpu only.
There is also a slow VM start issue Andrew pointed about earlier.

This makes me think if a VM ioctl to disable/enable the SBI extension
for all vcpus makes more sense in this case.


> Regards,
> Anup



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
