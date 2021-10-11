Return-Path: <SRS0=mni0=O7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91579C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 14:34:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CD0E6023F
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 14:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5CD0E6023F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vzc4fAPP1YSAaOIlDn4Nv4stdTubpgIda8mCBUN0gLA=; b=in5vTrAE28gwGv
	XcQrYNwpEcKjS60ew5Cqs712OZXPY7zDMm37MMOuhLIOM6MnrXk3eR7JnaPWC7Mv0K7UcLCnmkBHh
	689b8EuGJ/8EhlU3HHPS986pqIWrui8UTwsnvN9PYTHnOEQnvgsH2Px7+zudJ0BagrAUkiSv2TT9x
	bhI4tzKGmqt4U+6qR1/8swBiAW3OWGnBlBpo1YDkCA9wmA61GYFRSmM4oY0skxGKrDhep6gBzicv7
	f6mFR2pZBydhwjvFC/XxjF1jMw6nDdKrSJh85f5mXeVqA8T7jsmJp7NAYSAVmjJghNFNmU5LJvdkk
	SsAUSScdnd/3UBZsX7cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZwME-009mTL-4F; Mon, 11 Oct 2021 14:32:50 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZwMA-009mRm-T4
 for linux-riscv@lists.infradead.org; Mon, 11 Oct 2021 14:32:48 +0000
Received: by mail-pl1-x62e.google.com with SMTP id g9so1032537plo.12
 for <linux-riscv@lists.infradead.org>; Mon, 11 Oct 2021 07:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=s41J4gSx8D3bzBDjJMiyT/KrwuNQffb89ch9ukkyO/U=;
 b=dkgqEWcPlRS4Nai7Df0sFprljiky8nMSvMqDR2iH3PR+cYjTrNHjJlFcHlXeJOIV1c
 n811IBHO5C88AAlUbmf1Jp7fV9hGDAxakFqJOvJllhFgO0WsWBMi9VQL85KdeDOzBmtt
 sDfH4HwVyW4+TOUvSw28WZjGHoRTiJYOnHPubooyEsscqCFMU4+qslqjaYed1f3sjP2C
 r5/zdowCmuMBDhl2x6/xJVW8wr8JKBlyCsFjkUlAd50PCwbQ3rwA5MRK441VtnM78dCK
 xW8xBHZgTzuaLzrBQCp9bnevlHJloGQ1eQsGFB3bzepnCG4R6yxgopw5AqwGCaVtaBfw
 x0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=s41J4gSx8D3bzBDjJMiyT/KrwuNQffb89ch9ukkyO/U=;
 b=49pxv+s8EwOh9Ct6c0g/oSGETweKseSryOUwiplfSAruy/eSElNZ+4SQ6d5FRdmNHb
 YxvkUwONiYU1f+9iwxEUf8UdN/EVDQIzfuSZfJehCp5ooEuGnULb/mJ6GuF1+h8BYtMc
 toH0L7bhNVnfM30HLporwwjD0MkDvmVW04O3zf0R08Xb7N6BOJMvW7ZJ0v1t2IlOJ1HC
 hlvnvw6UY1kLmiYznuWT339Y4SKP7x6rMiR9muN2T8LfHSaq2x/43aU9wjb1iNo4GmRu
 r0uwNgHjTDF14W7bVTwUYzv2HsLuMviHL08yCiAd1wMC9FXAo+FKZXICV49w1xEQedSD
 2gfA==
X-Gm-Message-State: AOAM5305py5a2qL6q1t6gGqmtrtT84/BGzykCyHIKP/ZkLBHkvSQ8H/I
 nu+Sa2xT0kJfqWp4rrYad/k4eQ==
X-Google-Smtp-Source: ABdhPJyTiWm2sJgS0g6mab8UytWvP9tV7766ExecZivuBqMaHXBpfFTMPSNnWZQ2UdWfqiOMh7UqCw==
X-Received: by 2002:a17:90b:388a:: with SMTP id
 mu10mr31019836pjb.0.1633962762598; 
 Mon, 11 Oct 2021 07:32:42 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id d14sm8083832pfr.123.2021.10.11.07.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 07:32:42 -0700 (PDT)
Date: Mon, 11 Oct 2021 14:32:38 +0000
From: Sean Christopherson <seanjc@google.com>
To: Atish Patra <Atish.Patra@wdc.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>,
 "vincent.chen@sifive.com" <vincent.chen@sifive.com>,
 "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/5] RISC-V: Add SBI HSM extension in KVM
Message-ID: <YWRLBknWXjzPnF1w@google.com>
References: <20211008032036.2201971-1-atish.patra@wdc.com>
 <20211008032036.2201971-6-atish.patra@wdc.com>
 <YWBdbCNQdikbhhBq@google.com>
 <0383b5cacb25e9dc293d891284df9f4cbc06ee3a.camel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0383b5cacb25e9dc293d891284df9f4cbc06ee3a.camel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_073246_969651_7BCCD843 
X-CRM114-Status: GOOD (  31.90  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 11, 2021, Atish Patra wrote:
> On Fri, 2021-10-08 at 15:02 +0000, Sean Christopherson wrote:
> > On Thu, Oct 07, 2021, Atish Patra wrote:
> > > +=A0=A0=A0=A0=A0=A0=A0preempt_disable();
> > > +=A0=A0=A0=A0=A0=A0=A0loaded =3D (vcpu->cpu !=3D -1);
> > > +=A0=A0=A0=A0=A0=A0=A0if (loaded)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0kvm_arch_vcpu_put(vcpu);
> > =

> > Oof.=A0 Looks like this pattern was taken from arm64.=A0
> =

> Yes. This part is similar to arm64 because the same race condition can
> happen in riscv due to save/restore of CSRs during reset.
> =

> =

> >  Is there really no better approach to handling this?=A0 I don't see an=
ything
> >  in kvm_riscv_reset_vcpu() that will obviously break if the vCPU is
> >  loaded.=A0 If the goal is purely to effect a CSR reset via
> >  kvm_arch_vcpu_load(), then why not just factor out a helper to do exac=
tly
> >  that?

What about the question here?

> > =

> > > =A0
> > > =A0=A0=A0=A0=A0=A0=A0=A0memcpy(csr, reset_csr, sizeof(*csr));
> > > =A0
> > > @@ -144,6 +151,11 @@ static void kvm_riscv_reset_vcpu(struct
> > > kvm_vcpu *vcpu)
> > > =A0
> > > =A0=A0=A0=A0=A0=A0=A0=A0WRITE_ONCE(vcpu->arch.irqs_pending, 0);
> > > =A0=A0=A0=A0=A0=A0=A0=A0WRITE_ONCE(vcpu->arch.irqs_pending_mask, 0);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0/* Reset the guest CSRs for hotplug usecase */
> > > +=A0=A0=A0=A0=A0=A0=A0if (loaded)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0kvm_arch_vcpu_load(vcpu=
, smp_processor_id());
> > =

> > If the preempt shenanigans really have to stay, at least use
> > get_cpu()/put_cpu().
> > =

> =

> Is there any specific advantage to that ? get_cpu/put_cpu are just
> macros which calls preempt_disable/preempt_enable.
> =

> The only advantage of get_cpu is that it returns the current cpu. =

> vcpu_load function uses get_cpu because it requires the current cpu id.
> =

> However, we don't need that in this case. I am not against changing it
> to get_cpu/put_cpu. Just wanted to understand the reasoning behind your
> suggestion.

It would make the code a bit self-documenting, because AFAICT it doesn't tr=
uly
care about being preempted, it cares about keeping the vCPU on the correct =
pCPU.

> > > +=A0=A0=A0=A0=A0=A0=A0preempt_enable();
> > > =A0}
> > > =A0
> > > =A0int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
> > > @@ -180,6 +192,13 @@ int kvm_arch_vcpu_create(struct kvm_vcpu
> > > *vcpu)
> > > =A0
> > > =A0void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
> > > =A0{
> > > +=A0=A0=A0=A0=A0=A0=A0/**
> > > +=A0=A0=A0=A0=A0=A0=A0 * vcpu with id 0 is the designated boot cpu.
> > > +=A0=A0=A0=A0=A0=A0=A0 * Keep all vcpus with non-zero cpu id in power=
-off state
> > > so that they
> > > +=A0=A0=A0=A0=A0=A0=A0 * can brought to online using SBI HSM extensio=
n.
> > > +=A0=A0=A0=A0=A0=A0=A0 */
> > > +=A0=A0=A0=A0=A0=A0=A0if (vcpu->vcpu_idx !=3D 0)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0kvm_riscv_vcpu_power_of=
f(vcpu);
> > =

> > Why do this in postcreate?
> > =

> =

> Because we need to absolutely sure that the vcpu is created. It is
> cleaner in this way rather than doing this here at the end of
> kvm_arch_vcpu_create. create_vcpu can also fail after
> kvm_arch_vcpu_create returns.

But kvm_riscv_vcpu_power_off() doesn't doesn't anything outside of the vCPU=
.  It
clears vcpu->arch.power_off, makes a request, and kicks the vCPU.  None of =
that
has side effects to anything else in KVM.  If the vCPU isn't created succes=
sfully,
it gets deleted and nothing ever sees that state change.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
