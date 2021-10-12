Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB8EC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 16:46:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E32560F21
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 16:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E32560F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bykS85ZSHa+PIhmac04glNLHVwXeQGfdgS1hqzDFnPA=; b=sJKOxqVcsgjn+e
	G56E9AxcqCr1qZXuBtARP26PNg6yybqhNbsUdecSEn5zJvsbiBnKaOndzLlVcNFRjxSnxmrjR7lLl
	Cami13za9vSi1ksYoBswwUwuEdiQf9ydxQxsjHUmEa4DJq04FrpFu/A137pDnekTlg9VHUtsTJkk2
	cpITpZoACvIx+YLTyehFzJnZA0FmdGl6nkAdzYQgjevDHz732GzmE6/NxrW3w082fZDx2245yDBIC
	Tnn7PzdWuUf5htzbyFEHAtUFEuLm0CzztyQtJJNHpI+n2beFhgXeHQiwWB/xjo6iRAtG+CBW2lrcC
	nYwx8DCZfRjf5YXXEQvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maKut-00DY5g-6w; Tue, 12 Oct 2021 16:46:15 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maKuq-00DY4c-6H
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 16:46:13 +0000
Received: by mail-pg1-x533.google.com with SMTP id r201so14401624pgr.4
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 09:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=WxtJ6kTMjB335FQT7eQ0eT+70TQDiMjlEAzZlxMqe30=;
 b=bKOflXsLFzC3VU2LBpYLCOQSqWZeASP6ZYpwtMXyXCQ24DvBTaHGYfF64wgjZDKsla
 LpPBv3FFCMFYsmS+evB4X2EmqUiQKWI7oaGecXjhcm4t10DJpJr2vmOVqhi9jQY9eJXi
 9a6BmBu4332+d7Ju7hIbBp1ZnLa2LGcKGoTyDvfvwICGsr9y4cx2bX3A4DiwdeDSleK6
 ADuM4LSQ5VFYhTx9WO6iia8tKPWVl1qqkwJiMW8Bt/75nqycZwR4exTh/O2RXjV8cMPx
 kBII7YI8Dhm4R3Hr2cD4FnOV4Ddw1flpexyUS8KyOwUiN8m8eaoqUtQ2eqAhi9HeeGkk
 8HoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=WxtJ6kTMjB335FQT7eQ0eT+70TQDiMjlEAzZlxMqe30=;
 b=qEM1QT2AGwpEf0Hvjm/sPEruGw+f6apXYFw0dfaagXuFzw5eyLQR0ASwUM1k2+ZW+f
 yhvvh5UL7h79l4lA7XYssLr78V1OukejT9CmdoJVTbGZRjf2lLPx9EYpNY6VtC9US3aG
 NSdvoP07xFzdmmbnUzqcirmkpQfbE8NORqnpZVmR/CgJlD1XD4sOfMhsu2ejkWO38bXI
 /dheLvTGWt4Mkjh7b3ltKgUnQBGByc9e1Gpntr5snOJ3NeeCQ5weXcx9WXjV+3UBmYaR
 A73sbximgI1GD7SXX7JfpZcuMAdMNBapJgARQYeKXKNI/tLR5mFvabal+9WX5uAeWsV9
 sJqA==
X-Gm-Message-State: AOAM531Xkwb2/p0abF4H9SrrkcgR2G5uqGzCqEYwNCFDIYZGiWcZhAGq
 GAd0tvFpxeOSv4nIXI+SET6L5g==
X-Google-Smtp-Source: ABdhPJwqjQYiIu9GVaeWoRMdEp/IOLk9KZQUl3zIehqyu0N4NWB1pHgyw7wIiEOvLESAmyrDCLnUww==
X-Received: by 2002:a63:564a:: with SMTP id g10mr23601412pgm.199.1634057168886; 
 Tue, 12 Oct 2021 09:46:08 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id z19sm11467471pfj.156.2021.10.12.09.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:46:08 -0700 (PDT)
Date: Tue, 12 Oct 2021 16:46:04 +0000
From: Sean Christopherson <seanjc@google.com>
To: Atish Patra <Atish.Patra@wdc.com>
Cc: "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "vincent.chen@sifive.com" <vincent.chen@sifive.com>,
 Anup Patel <Anup.Patel@wdc.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/5] RISC-V: Add SBI HSM extension in KVM
Message-ID: <YWW7zGWUpqXLXE/4@google.com>
References: <20211008032036.2201971-1-atish.patra@wdc.com>
 <20211008032036.2201971-6-atish.patra@wdc.com>
 <YWBdbCNQdikbhhBq@google.com>
 <0383b5cacb25e9dc293d891284df9f4cbc06ee3a.camel@wdc.com>
 <YWRLBknWXjzPnF1w@google.com>
 <a762f0263090d7e818e58873d63139d7b6829d87.camel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a762f0263090d7e818e58873d63139d7b6829d87.camel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_094612_258890_497AE58D 
X-CRM114-Status: GOOD (  29.93  )
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
> On Mon, 2021-10-11 at 14:32 +0000, Sean Christopherson wrote:
> > On Mon, Oct 11, 2021, Atish Patra wrote:
> > > On Fri, 2021-10-08 at 15:02 +0000, Sean Christopherson wrote:
> > > > On Thu, Oct 07, 2021, Atish Patra wrote:
> > > > > +=A0=A0=A0=A0=A0=A0=A0preempt_disable();
> > > > > +=A0=A0=A0=A0=A0=A0=A0loaded =3D (vcpu->cpu !=3D -1);
> > > > > +=A0=A0=A0=A0=A0=A0=A0if (loaded)
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0kvm_arch_vcpu_put(v=
cpu);
> > > > =

> > > > Oof.=A0 Looks like this pattern was taken from arm64.=A0
> > > =

> > > Yes. This part is similar to arm64 because the same race condition
> > > can
> > > happen in riscv due to save/restore of CSRs during reset.
> > > =

> > > =

> > > > Is there really no better approach to handling this?=A0 I don't see
> > > > anything =A0in kvm_riscv_reset_vcpu() that will obviously break if =
the
> > > > vCPU is =A0loaded.=A0 If the goal is purely to effect a CSR reset v=
ia
> > > > kvm_arch_vcpu_load(), then why not just factor out a helper to do
> > > > exactly that?
> > =

> > What about the question here?
> =

> Are you suggesting to factor the csr reset part to a different function?

More or less.  I'm mostly asking why putting the vCPU is necessary.

> > > > > =A0void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
> > > > > =A0{
> > > > > +=A0=A0=A0=A0=A0=A0=A0/**
> > > > > +=A0=A0=A0=A0=A0=A0=A0 * vcpu with id 0 is the designated boot cp=
u.
> > > > > +=A0=A0=A0=A0=A0=A0=A0 * Keep all vcpus with non-zero cpu id in p=
ower-off
> > > > > state
> > > > > so that they
> > > > > +=A0=A0=A0=A0=A0=A0=A0 * can brought to online using SBI HSM exte=
nsion.
> > > > > +=A0=A0=A0=A0=A0=A0=A0 */
> > > > > +=A0=A0=A0=A0=A0=A0=A0if (vcpu->vcpu_idx !=3D 0)
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0kvm_riscv_vcpu_powe=
r_off(vcpu);
> > > > =

> > > > Why do this in postcreate?
> > > > =

> > > =

> > > Because we need to absolutely sure that the vcpu is created. It is
> > > cleaner in this way rather than doing this here at the end of
> > > kvm_arch_vcpu_create. create_vcpu can also fail after
> > > kvm_arch_vcpu_create returns.
> > =

> > But kvm_riscv_vcpu_power_off() doesn't doesn't anything outside of the
> > vCPU.=A0 It clears vcpu->arch.power_off, makes a request, and kicks the
> > vCPU.=A0 None of that has side effects to anything else in KVM.=A0 If t=
he vCPU
> > isn't created successfully, it gets deleted and nothing ever sees that
> > state change.
> =

> I am assuming that you are suggesting to add this logic at the end of
> the kvm_arch_vcpu_create() instead of kvm_arch_vcpu_postcreate().
> =

> vcpu_idx is assigned after kvm_arch_vcpu_create() returns in the
> kvm_vm_ioctl_create_vcpu. kvm_arch_vcpu_postcreate() is the arch hookup
> after vcpu_idx is assigned.

Ah, it's the consumption of vcpu->vcpu_idx that's problematic.  Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
