Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F04C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 14:27:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEF8460E75
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 14:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CEF8460E75
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NIOlSfqK8ElFGACFhxxzMMGiM0GOU0Ecv59JBROMRB4=; b=oF6aE9gKe4Gsve
	r2XQAgmHarHTG38gF8jhbK2FE+AMlbTsX8iJ5hR5Kjzyt9SoIfAOv/cVOUT32FnPyBiZoYvQGBz8J
	WAM2V6zICWNfOMRedGX1p5dZ37Rv93LMdk3q0hmfEULkmSO9N+ujPaX06cf0Nv1LSa/1x3KjO9Sjb
	QJ5MUJ9AxdXGwJEC3pP0zCO/zJBeZHgHizGZG2S/K6VFRDAH0VovkJhPmX8f4oAqWcrzehKwb9fMA
	BmWRgfpwEBKyklgUksREFYnv91uLEY2/B8+EQs2euhONtVie+ly71emMNTTgS3EG9ZYaTEr4Tww/g
	+kpKXlftJTWN408tQF8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfjtJ-0056tW-VP; Wed, 27 Oct 2021 14:26:58 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfjt6-0056q8-BA
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 14:26:45 +0000
Received: by mail-pl1-x631.google.com with SMTP id r5so2144647pls.1
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 07:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LMqODRZlF8nHhJs02sWnsNzJB8DCwjwV772Lcvk4X9o=;
 b=iWwrbnSH9Fky5OxBApAzRFVpTKOaMHDs7Xrzkqa4bfHRvpB9pNrmqtwX5XStYSbIol
 NG6pr6of1LmRK/X8yeBvBQ0Fz8uYI6sCKWIvgmckbalOjA8rZIStxifaaVVG+5EdlLz8
 2ckfTI/AHFWKc1rHQsrwcPVdrkLnqwK/drtGVgppY9agtMGjOEk436kI8PMz0SqSkGNT
 dkWDCvrzCBVDPIbGEr6AdGS2sCg8RuoXUFOHg6zS7uI1OSE10fKTNRuuwKsMoNZNiFkf
 iPVMGJAgypYBjZDhK8mjFm7rCt98R0DWG7pkzdEiPhkk3mMy819HFjaZfkrakLKQ8KAR
 Wy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LMqODRZlF8nHhJs02sWnsNzJB8DCwjwV772Lcvk4X9o=;
 b=D4/umAHs5Mv5uf4RZFTJUsc3zrSOALHZ38aLAh4r2hu73LK2szhMycvuLOn3/OQSxR
 gsECMX6su/MKDpH1dsXWFUtofi6PXk1/yOIlsYDJDZdohD2uz6yEP3vvbtgJ3tp7Z0nb
 ytX5Sha+rasrPFbsEBOoDDnu4qijSGApR9c2Gyz9IRh3NfLHwIDkNSh6JNjGWZ70LdgK
 Yufk0Nq/EKIL1ASLbxI9n0TRi/vyFuyQxI+ShrIbEiSxGPpKUqrRoJaC4rAafZzyZMxo
 KU3UZv8X03g6Rf0/7WCwRT/d2+axuv2rxHvY5K/kBVfHY4rQ2kgovlQD4uZxJtIa7s9Z
 Dhdw==
X-Gm-Message-State: AOAM531nQeC+7Kj34yZslqJZW5D427A4gvlSQDQ32LOA5N/36B3azPoP
 /MkhSO5qIC+uYJc2XtFqr0BxBg==
X-Google-Smtp-Source: ABdhPJzNj2nhULmp/RR7LS0ShzDRkQdxHUhFj7X33pr1fS/jZmoi4Y5oDiGoEdEWKdZH8tXcKWxvmw==
X-Received: by 2002:a17:90b:11c2:: with SMTP id
 gv2mr5997881pjb.133.1635344802985; 
 Wed, 27 Oct 2021 07:26:42 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id n12sm37080pgh.55.2021.10.27.07.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 07:26:42 -0700 (PDT)
Date: Wed, 27 Oct 2021 14:26:38 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, James Morse <james.morse@arm.com>,
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
Subject: Re: [PATCH v2 24/43] KVM: VMX: Drop pointless PI.NDST update when
 blocking
Message-ID: <YXlhnkp4/XJCCO0R@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-25-seanjc@google.com>
 <18e6a656-f583-0ad4-6770-9678be3f5cf4@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18e6a656-f583-0ad4-6770-9678be3f5cf4@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_072644_421005_C270D091 
X-CRM114-Status: GOOD (  26.77  )
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

On Mon, Oct 25, 2021, Paolo Bonzini wrote:
> On 09/10/21 04:12, Sean Christopherson wrote:
> > Don't update Posted Interrupt's NDST, a.k.a. the target pCPU, in the
> > pre-block path, as NDST is guaranteed to be up-to-date.  The comment
> > about the vCPU being preempted during the update is simply wrong, as the
> > update path runs with IRQs disabled (from before snapshotting vcpu->cpu,
> > until after the update completes).
> 
> Right, it didn't as of commit bf9f6ac8d74969690df1485b33b7c238ca9f2269 (when
> VT-d posted interrupts were introduced).
> 
> The interrupt disable/enable pair was added in the same commit that
> motivated the introduction of the sanity checks:

Ya, I found that commit when digging around for different commit in the series
and forgot to come back to this changelog.  I'll incorporate this info into the
next version.

>     commit 8b306e2f3c41939ea528e6174c88cfbfff893ce1
>     Author: Paolo Bonzini <pbonzini@redhat.com>
>     Date:   Tue Jun 6 12:57:05 2017 +0200
> 
>     KVM: VMX: avoid double list add with VT-d posted interrupts
> 
>     In some cases, for example involving hot-unplug of assigned
>     devices, pi_post_block can forget to remove the vCPU from the
>     blocked_vcpu_list.  When this happens, the next call to
>     pi_pre_block corrupts the list.
> 
>     Fix this in two ways.  First, check vcpu->pre_pcpu in pi_pre_block
>     and WARN instead of adding the element twice in the list.  Second,
>     always do the list removal in pi_post_block if vcpu->pre_pcpu is
>     set (not -1).
> 
>     The new code keeps interrupts disabled for the whole duration of
>     pi_pre_block/pi_post_block.  This is not strictly necessary, but
>     easier to follow.  For the same reason, PI.ON is checked only
>     after the cmpxchg, and to handle it we just call the post-block
>     code.  This removes duplication of the list removal code.
> 
> At the time, I didn't notice the now useless NDST update.
> 
> Paolo
> 
> > The vCPU can get preempted_before_  the update starts, but not during.
> > And if the vCPU is preempted before, vmx_vcpu_pi_load() is responsible
> > for updating NDST when the vCPU is scheduled back in.  In that case, the
> > check against the wakeup vector in vmx_vcpu_pi_load() cannot be true as
> > that would require the notification vector to have been set to the wakeup
> > vector_before_  blocking.
> > 
> > Opportunistically switch to using vcpu->cpu for the list/lock lookups,
> > which presumably used pre_pcpu only for some phantom preemption logic.
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
