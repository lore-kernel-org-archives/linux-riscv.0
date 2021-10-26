Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91595C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 14:48:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4942A603E5
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 14:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4942A603E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ot4dwqfRWHwcfZf2s9d5d4mTvVIgd9cbYA5aVN1nyM=; b=nmngw/3RtQgYLo
	vLwB7og23Kr8J2uUaG6REPcNFC74j0K2CCln1MVpEwTYPXeGO42WHCnRhbGysD6BclFr3mN8lPSSb
	5gbTHuoXkj7Crlw+dn3W3zFZunv5ke1YOC3i5MaO3HJ6CR8MV3dOTYGAPS1PTJJ+ZDnIh3jKJKHcI
	WvyA50pezT7BwLxGDN8ubOzZDPs/d1p3eIetMlvD5HeyC2jnObatodO5OpsbzH3SdrzW/A3Zw76cZ
	XIr7xNP7r8AdGkUG89Z8TQ/JczjoGXwP0KkMuT1suVs4jW8ctXkbTSMdB1w+tp1JAouqXPJPlUnS+
	VhZMlzp+rN4sr9ZvbbgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfNkI-0023KE-UM; Tue, 26 Oct 2021 14:48:10 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfNkG-0023Ij-2B
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 14:48:09 +0000
Received: by mail-pl1-x633.google.com with SMTP id n11so10498905plf.4
 for <linux-riscv@lists.infradead.org>; Tue, 26 Oct 2021 07:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=t+GavL7jaDIOLO9+HWOF0JpCL4n+9982OXgOJJO3B68=;
 b=mMtlNqAGEx5moOXiuoulPA91tzGA7QXfJoC+FMrgS7kXKDaeQEPhlrtU0/6hIAVeF6
 4XgOag3S8f64bxtieFkoj/CBTBoyg71uy6bYxr2fBQK7J8y0qvj3yp4nxsZiGo0ugwoy
 chqWhQbdF2M/ss8dRD5cMeGRjF2i7TFbnWAE4XD/Gn+/ew4eCp8tBNWFi6mKqTjGiuSB
 4K+eMtDT8TA09mAfuKwzPO/bGE/KLqBK8ggRwFAk21MDpCSdzSupIOVWDECUMDk9Gucp
 WDZDdD8wswuh2DToiC42rEb1Gvw+Zc82wwd7L/2Pn0t+7EwhXqTAcJo8pcrg6fGfmqKg
 9NUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t+GavL7jaDIOLO9+HWOF0JpCL4n+9982OXgOJJO3B68=;
 b=CG0p5V/wjNklCt4z5qLa2LUo4eYwUenNv8T+saoW4mdt5xoJErx4vBF0C4GdglmgOC
 nqDxgeywgCIaP9Uvx8UJCM7IulcliSHGSnpqA6OYxy0s468v1WEVFLIcsCJk5nVlYOBk
 N30OXRozoWkrYAJ4DChqazxiWFXK4kBfNdwDW+DlI+zAd18k+mqEiA0hK5xaqNscN+Es
 /v0zVx9if3x6Z3qMQvscFoKi+Uic/KViNOKRUXTB1XlbB+GyFbyRgtYfudIWwjsa/Pn8
 YhPY++K6WdtjKgp8eZ1wCro82n/IbouAv4hN8t9ujqMaXTBAn0hGx/D/YAOG4pytSXCi
 +1Kg==
X-Gm-Message-State: AOAM531yDgtr6l+YqZlGjfgIlOJwVfUGsXOziSKKDcFOxQ29bdw9uDyP
 TPhtKhmiZ0LRqlKoxuooFu80Gw==
X-Google-Smtp-Source: ABdhPJwehmwFySoaS1hi2p+T+LiAO8upF6izWYrpOOMtkZkPW5L2hiCqpK0gC/Rhqd0TA7qN0BGQqw==
X-Received: by 2002:a17:902:e88a:b0:140:25a7:4a1b with SMTP id
 w10-20020a170902e88a00b0014025a74a1bmr22402882plg.67.1635259687236; 
 Tue, 26 Oct 2021 07:48:07 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id fy8sm186294pjb.47.2021.10.26.07.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 07:48:06 -0700 (PDT)
Date: Tue, 26 Oct 2021 14:48:02 +0000
From: Sean Christopherson <seanjc@google.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
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
Subject: Re: [PATCH v2 00/43] KVM: Halt-polling and x86 APICv overhaul
Message-ID: <YXgVIvYhABnrP2Jo@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <04b1a72e-47b4-4bde-eb9e-ba36c156ff0d@de.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <04b1a72e-47b4-4bde-eb9e-ba36c156ff0d@de.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_074808_145533_D342EFF6 
X-CRM114-Status: GOOD (  18.31  )
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

On Tue, Oct 26, 2021, Christian Borntraeger wrote:
> Am 09.10.21 um 04:11 schrieb Sean Christopherson:
> > This is basically two series smushed into one.  The first "half" aims
> > to differentiate between "halt" and a more generic "block", where "halt"
> > aligns with x86's HLT instruction, the halt-polling mechanisms, and
> > associated stats, and "block" means any guest action that causes the vCPU
> > to block/wait.
> > 
> > The second "half" overhauls x86's APIC virtualization code (Posted
> > Interrupts on Intel VMX, AVIC on AMD SVM) to do their updates in response
> > to vCPU (un)blocking in the vcpu_load/put() paths, keying off of the
> > vCPU's rcuwait status to determine when a blocking vCPU is being put and
> > reloaded.  This idea comes from arm64's kvm_timer_vcpu_put(), which I
> > stumbled across when diving into the history of arm64's (un)blocking hooks.
> > 
> > The x86 APICv overhaul allows for killing off several sets of hooks in
> > common KVM and in x86 KVM (to the vendor code).  Moving everything to
> > vcpu_put/load() also realizes nice cleanups, especially for the Posted
> > Interrupt code, which required some impressive mental gymnastics to
> > understand how vCPU task migration interacted with vCPU blocking.
> > 
> > Non-x86 folks, sorry for the noise.  I'm hoping the common parts can get
> > applied without much fuss so that future versions can be x86-only.
> > 
> > v2:
> >   - Collect reviews. [Christian, David]
> >   - Add patch to move arm64 WFI functionality out of hooks. [Marc]
> >   - Add RISC-V to the fun.
> >   - Add all the APICv fun.
> 
> Have we actually followed up on the regression regarding halt_poll_ns=0 no longer disabling
> polling for running systems?

No, I have that conversation flagged but haven't gotten back to it.  I still like
the idea of special casing halt_poll_ns=0 to override the capability.  I can send
a proper patch for that unless there's a different/better idea?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
