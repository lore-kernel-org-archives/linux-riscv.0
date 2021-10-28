Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3586C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 16:12:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98F426058D
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 16:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98F426058D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xaeiVVKOyddRDYAf5f/eF8nEi/QOvguDCzH79x0RXOo=; b=sipF6p998sJeTj
	uRAoBMxz2QkiEspYRx8Fw/xJ/Q8eEE5wRr5vZvdm0U9Wz0m5LrTnqU6/byEGAtXbjZvGm0X6KL01n
	LSMKSaVDtzhqgp9QQlLBeUgr0smn41gBdeRlUXxaTDfCWiSLXDhfGh7+PErcosXqlVSVDa6ILi5Sb
	oq7SIylRzZWwPwL9WYsk4dwwo9mauPw7F4nY/lcH426QxoelNoOyVCVOcsIN1DJfCHFz4IXZ58BiX
	OnA6c9y45mog9kJpmKnVLB4NMTaxTtTlFR7QOZ132bLgo1I4/ytdG71A3tEoBw+p7oWCFZ2hYUMkj
	ONrwah1+2bKwDtyOuhqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg80x-008XKg-BD; Thu, 28 Oct 2021 16:12:27 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg80i-008XE7-Hf
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 16:12:13 +0000
Received: by mail-pf1-x429.google.com with SMTP id b1so2915085pfm.6
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 09:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uDFUXcWiQOAZszlFDFiKgSiJL9HB/WuFg2qPOmsqC9E=;
 b=s8JT5njEusSpDvvGXpDQ9LZlankma9a4yiSWD9KOohfnBHlxyPNl/U/08pekLcb/bC
 ovoSobTTd28f9TmLEDOEfxcyphCFmhjuM9+ON0HPn4qn8BCTN2ldIPxu2jDowg4XqJu6
 3xH28lP4FssgtQ0ca7hD6ajCl1FxkivUDYuXRLmLx2Yi3tCCzZXargRA7TY8R9VN5f+Z
 OVvgBrcUFyQ3a4VjcEcymihbaDJ3t1+Gwm46k3BuLJXPbEryRKF1JBLikEHoHCefGv/7
 I7zNR4Q9EXiCvnW7HnxhjPhNdV9zeEX0aTdpBRV58BMvHDUDx6AGdT+87VVv7qJ97TcC
 uARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uDFUXcWiQOAZszlFDFiKgSiJL9HB/WuFg2qPOmsqC9E=;
 b=WzNm9GpXMy4BG9Av44Zj14yYfjYGYYAYIKITSlFICn+6QW2GeDoWpJyxgXbdYsUGUI
 JDJbm3d11mfP4Kcx1+DIbe/wMRTJKnBol8IDXxFRVgAZIu5WV6tvRvk49EDh7hUaUXWX
 St7imtj3p6pS6bmdg/gqPKOcNPn2vbLP5SzApb+jKQMvYWNhY39VG71qrjiEuw7pfabD
 A5O3v1wyERPHCOhg5YA2nkyqi85OTqLDrQYE28ZqrdPhTdmCjJpLO15PDERBaQf3ZAaq
 899sjggmmIH3XlB4ZPZsD9t8+13o6MLZ5SvLVnORMb2a/+MTOgw/IS5IweIaYCzeO6BO
 rQAQ==
X-Gm-Message-State: AOAM531maMeqriYPWv6a88iA5T49kH9mA3teprv2IqXZFV2m161am8PS
 ExIbbOeEG5Uxg1Hhxoa2btR07g==
X-Google-Smtp-Source: ABdhPJzctFKuSMS4ABMglKZzvBYXQnPOjA4L7dQsvoAPPXlll55VtYD46hr5Zh0pXIPugFNW+Dl/hA==
X-Received: by 2002:a05:6a00:1709:b0:47e:493e:ca5f with SMTP id
 h9-20020a056a00170900b0047e493eca5fmr4461870pfc.60.1635437528216; 
 Thu, 28 Oct 2021 09:12:08 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id f7sm4329616pfv.152.2021.10.28.09.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 09:12:07 -0700 (PDT)
Date: Thu, 28 Oct 2021 16:12:04 +0000
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Atish Patra <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Matlack <dmatlack@google.com>, Oliver Upton <oupton@google.com>,
 Jing Zhang <jingzhangos@google.com>
Subject: Re: [PATCH v2 27/43] KVM: VMX: Move Posted Interrupt ndst
 computation out of write loop
Message-ID: <YXrL1EuzZtTR4J1Q@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-28-seanjc@google.com>
 <643d9c249b5863f04290a6f047ea1a2d98bd75f9.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <643d9c249b5863f04290a6f047ea1a2d98bd75f9.camel@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_091212_617042_AEF0FB64 
X-CRM114-Status: GOOD (  12.51  )
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

On Thu, Oct 28, 2021, Maxim Levitsky wrote:
> On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> > Hoist the CPU => APIC ID conversion for the Posted Interrupt descriptor
> > out of the loop to write the descriptor, preemption is disabled so the
> > CPU won't change, and if the APIC ID changes KVM has bigger problems.
> > 
> > No functional change intended.
> 
> Is preemption always disabled in vmx_vcpu_pi_load? vmx_vcpu_pi_load is called
> from vmx_vcpu_load, which is called indirectly from vcpu_load which is called
> from many ioctls, which userspace does. In these places I don't think that
> preemption is disabled.

Preemption is disabled in vcpu_load() by the get_cpu().  The "cpu" param that's
passed around the vcpu_load() stack is also why I think it's ok to _not_ assert
that preemption is disabled in vmx_vcpu_pi_load(); if preemption is enabled,
"cpu" is unstable and thus the entire "load" operation is busted.


#define get_cpu()		({ preempt_disable(); __smp_processor_id(); })
#define put_cpu()		preempt_enable()


void vcpu_load(struct kvm_vcpu *vcpu)
{
	int cpu = get_cpu();

	__this_cpu_write(kvm_running_vcpu, vcpu);
	preempt_notifier_register(&vcpu->preempt_notifier);
	kvm_arch_vcpu_load(vcpu, cpu);
	put_cpu();
}
EXPORT_SYMBOL_GPL(vcpu_load);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
