Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14382C04A94
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 21:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4M+hssYZNk2Zc8gs7BPSQEpfDOsDb11VMon+SU8gjjM=; b=arRr1hvKfw4FWO94SJ+Xy9npVN
	HE00kpkFbgsZrOKRM2moho3PjE3opDE+tHs1iIvO88Ibyp/u9VYKAYMsFg2hu/QstopcWJffcBrNl
	5Qum7y9gB2YB8sSHHW02EXCTTc10vV0QCxjrbtm3lmfHcOAxVoaoANUooB0aaYj7AyrlKwDRALXDh
	8h5kPn9O4Q2XqVkc1l2IrclAmyEPbPT+wVKxzlbZUBVf76uhKuzKfTe5ykhljkHuSwAyG/dny8G2y
	VQ/8dEl8gi8bFyq1xia+92ql3f3wfjCBN+uqou4RONFPTJcnvmsaDn9CsF2mtUWiAOKzUMzadx9Xd
	PHjtavqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQamM-00HQV5-1n;
	Mon, 31 Jul 2023 21:50:14 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQamJ-00HQSx-18
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 21:50:13 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1bba5626342so52164975ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 14:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690840209; x=1691445009;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R2QJFD2XHgTI1kJ5wD8vqBTFZZRvLtV3pZ4w1UH3Oa8=;
        b=tSLTmu+DLBufAzFzbicDIcqEm2TuolEf1DapzPi+gTM4FHXli52KWx81A5zuk/YCxr
         l/OlTy/M2QsL/+aaVuZ/hYb5nYSSERYjNp13FI8HYqXm9WQmG25RmZxIsRM/Z7zSspZU
         JeMXBEyXp4E2GhE+/oU7uxeo5vA7VEgDwo3z8s1TIqOjvBy9PB/UOIPUcDQqZ2yvrlDS
         tD1vLJn5szUm3mkfyZtKLdz/qI26XfZV9AjJ3HuKY1kp9JjckDUfZYJ6zw6f2Uc034NJ
         WHPzXkiGbDSZiEmxmUdXhZElFyFTVHyycIhHVC0+v52tpuADk55LDDgQL5cDUbXmgDrC
         Rygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690840209; x=1691445009;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R2QJFD2XHgTI1kJ5wD8vqBTFZZRvLtV3pZ4w1UH3Oa8=;
        b=UYgGMffjNgV8bpANy8hEB2AEbdpeuiS84/SiHR4F5bpYEiPQSJZEAAaihggWNDCjrr
         AIRjUe2ZSyeXqGeconnF6ge6AIlB7Nq5aKuFSFJewRtrkZ1oHs8u2Fln8VNwuwSvV/q4
         VbrOEEafUapjrhnqEmytZH1T9miUnAwVXlU+Zv6iHxVrfH7xBOchgujITQRCUN+uG/3x
         SzxFYBgMCD5EouvtfOQVcNJD9PUUsgFB4ZZ5uhpWp1YM+5BunJXN/vq819mpMrNDhxnE
         P1W3klgUW+lp1QpHmY+ASCF5Pl+B6geTIceFSZDl2pDIP6cgEaS1PQbtuiD1EyVvi264
         9f4A==
X-Gm-Message-State: ABy/qLbM4aXjNjZA0TI4NfxToa0KzPXwCR7FkWVvVRU6hdjLLOJmNlXb
	S0b8XZO58ulVY2/ZH6gMmBEbB8d12+g=
X-Google-Smtp-Source: APBJJlHF5b1qBy7lIC09fHisk5z7a6GWyFDId8WOrl6w4SB5XD3HwWcrOpZcO/fkStMRmvg1ofrSPaEq5SU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f68b:b0:1b8:a552:c8c9 with SMTP id
 l11-20020a170902f68b00b001b8a552c8c9mr47142plg.13.1690840209652; Mon, 31 Jul
 2023 14:50:09 -0700 (PDT)
Date: Mon, 31 Jul 2023 14:50:07 -0700
In-Reply-To: <87tttpr6qy.wl-maz@kernel.org>
Mime-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-3-rananta@google.com>
 <87tttpr6qy.wl-maz@kernel.org>
Message-ID: <ZMgsjx8dwKd4xBGe@google.com>
Subject: Re: [PATCH v7 02/12] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Ananta <rananta@google.com>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Jing Zhang <jingzhangos@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_145011_431548_FDEDFE03 
X-CRM114-Status: GOOD (  12.83  )
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

On Thu, Jul 27, 2023, Marc Zyngier wrote:
> On Sat, 22 Jul 2023 03:22:41 +0100,
> Raghavendra Rao Ananta <rananta@google.com> wrote:
> > 
> > Stop depending on CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL and opt to
> > standardize on kvm_arch_flush_remote_tlbs() since it avoids
> > duplicating the generic TLB stats across architectures that implement
> > their own remote TLB flush.
> > 
> > This adds an extra function call to the ARM64 kvm_flush_remote_tlbs()
> > path, but that is a small cost in comparison to flushing remote TLBs.
> 
> Well, there is no such thing as a "remote TLB" anyway. We either have
> a non-shareable or inner-shareable invalidation. The notion of remote
> would imply that we track who potentially has a TLB, which we
> obviously don't.

Maybe kvm_arch_flush_vm_tlbs()?  The "remote" part is misleading even on x86 when
running on Hyper-V, as the flush may be done via a single hypercall and by kicking
"remote" vCPUs.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
