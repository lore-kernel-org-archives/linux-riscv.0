Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA70C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 16:08:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DFDF60D07
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 16:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4DFDF60D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yqXZeCOZ/9b0UXhJ/NDLip9vxWyoY9gm7OQ/P//qkhA=; b=YZAqBogPuRk5ov
	Ip/mXDDUKpb+CRJWSNscK27jUSDI7ixZwwDmxw8IWAgGoNCaiqg0NTHtHcLmMRngqs9+QR7ekrO04
	sDHsxmF4sYuQPx+PLH9614wvSqYAlRseCa28bRZfwOOP54Z4G/An8N72ZjKhO4ufI1pDaYXJSWurT
	WvtepJU3pysVnoYMFck8upj0Xz+HkMKgvclp+pQ4GejWwPdz4zWP/r/tMELt/9w039QADQd8XXPH7
	mCdDLdwY0/tU3lmQoa5MC/QjDUpHbfRxQ2rAjExKEJ9ZDVFy+fFmU6N58mzotkvcJYGROfWj4TQpg
	Cp15QDifa7Ar5QBTo8Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mflTS-005PKW-EH; Wed, 27 Oct 2021 16:08:22 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mflTP-005PIY-By
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 16:08:20 +0000
Received: by mail-pl1-x630.google.com with SMTP id n11so2336590plf.4
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 09:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nuCG2sDmKSazCUE8+q7TBUWWroJna3waN17Ediudyfo=;
 b=WayoYs/G9RdOkLoLrW/BVqQ6VHPjU7g6BiG68joHyMmGiaL20yIAm/sjYdgZ0AcKJs
 34UBgRu//I/mwxBVohule4Yths3kAXuGugB26iPsHfMV54dBZzCrAdfuAma3wIvwLeK6
 5skY2C5JFSSaU21tpOr7VxrfykS9z8ABV/qEMvBoTKNuCyH2eBt8P1cnnpOyhrcPdGo+
 3TUr8nLyCGNKiIm+cC1pm1SLzFfEEKhREJTeZJJEMdJpd9SDcl6sMun3hCIhWgt/3aha
 W9nnj4Eu9amjlrLiAUIeygQ3FCEkFDEH7LYoF5wU+epaInjt/QY5/ndeDbqHbN0vOY3t
 ydmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nuCG2sDmKSazCUE8+q7TBUWWroJna3waN17Ediudyfo=;
 b=y6UDln/aL8ApMcxAD4SCCh1TbKlRZGrvVFTMNOup0J8+IjgMXJnHSaRNJMuLZAMkZl
 I80NMvZ9V2ynY4Cu7HpsT6vu1dtOGeu3IiSEKt/5JDisWq8kj/KVJcpiiLOchw0WQHZP
 QpbLkzWCE4mhNAU1dtZ/6Vko0G/VDkMHAPds1PhzmuRlnDqSfwOem0zTZJ7qzyTFQZSq
 FoASAGHMfvjbYltnJOwMhg1pM7/S5cCvV2DV2T4ft5Vfxmpl9vXhijsB05w/OaqkSUVC
 jC+1dxNFNyu/Lbne4byU7RImMsjyKd7XASQ1RCxOuqRCH6nwS/F1ouDn6IirgeOnvmES
 lSUQ==
X-Gm-Message-State: AOAM530m/+1g/SOvwBiNzV5J4UgVWpkp6xywblseyuJouL/azHxgzpui
 3AeZLnMb3QmYSeutFEO+yxnXcw==
X-Google-Smtp-Source: ABdhPJyPOfADHe2BvEKrk8mpN6Tt9+dFmmc+qUaNZEHu6/XAOEzQt/0dcBcXvuMjJIUFdj/Jqau95A==
X-Received: by 2002:a17:90b:3ecc:: with SMTP id
 rm12mr6856073pjb.48.1635350894901; 
 Wed, 27 Oct 2021 09:08:14 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id lb5sm205466pjb.11.2021.10.27.09.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 09:08:14 -0700 (PDT)
Date: Wed, 27 Oct 2021 16:08:10 +0000
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
Subject: Re: [PATCH v2 35/43] KVM: SVM: Signal AVIC doorbell iff vCPU is in
 guest mode
Message-ID: <YXl5anv0Lyjx1cws@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-36-seanjc@google.com>
 <0333be2a-76d8-657a-6c82-3bb5c9ff2e3b@redhat.com>
 <YXlrEWmBohaDXmqL@google.com>
 <185502d7-861e-fa5c-b225-419710fe77ed@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <185502d7-861e-fa5c-b225-419710fe77ed@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_090819_474613_F08D2DAA 
X-CRM114-Status: GOOD (  19.82  )
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

On Wed, Oct 27, 2021, Paolo Bonzini wrote:
> On 27/10/21 17:06, Sean Christopherson wrote:
> > > Does this still need to check the "running" flag?  That should be a strict
> > > superset of vcpu->mode == IN_GUEST_MODE.
> > 
> > No.  Signalling the doorbell when "running" is set but the vCPU is not in the
> > guest is just an expensive nop.  So even if KVM were to rework its handling of
> > "running" to set the flag immediately before VMRUN and clear it immediately after,
> > keying off IN_GUEST_MODE and not "running" would not be wrong, just sub-optimal.
> > 
> > I doubt KVM will ever make the "running" flag super precise, because keeping the
> > flag set when the vCPU is loaded avoids VM-Exits on other vCPUs due to undelivered
> > IPIs.
> 
> Right, so should we drop the "if (running)" check in this patch, at the same
> time as it's adding the IN_GUEST_MODE check?

LOL, I think we have a Three^WTwo Stooges routine going on.  This patch does
remove avic_vcpu_is_running() and replaces it with the vcpu->mode check.  Or am
I completely misunderstanding what your referring to?

-       if (avic_vcpu_is_running(vcpu)) {
+       /*
+        * Signal the doorbell to tell hardware to inject the IRQ if the vCPU
+        * is in the guest.  If the vCPU is not in the guest, hardware will
+        * automatically process AVIC interrupts at VMRUN.
+        */
+       if (vcpu->mode == IN_GUEST_MODE) {
                int cpu = READ_ONCE(vcpu->cpu);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
