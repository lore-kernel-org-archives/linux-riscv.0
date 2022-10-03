Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B7AC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Oct 2022 19:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IkpEakPu9IatLvFwJuJ4F7oM3UQERORa2XKpYLZDCrQ=; b=qIOm3ibZlHl2X4
	AuhNbCUWD7UoQCk0lyAZ1F5haUrqhcTmHlQQBk8ajjqouqB60kdIQZjTWC3YzwSx4WIPbJGV6tNhH
	TTlbaCms+F9Kfbm/Q8uh6D5zZ8WHqJwKv7varE3qkrHcCYp+VEcGhp+BU4scz+GkSEdrt4VtSwkq9
	KmnyxGz6yqyGP7ICfdpXAJeib+Ug/+2GC7ifDNlFLyZ733vZLbneKsQTpyTcygBIc1bwkpPgvYflF
	XGoZBpUJrqmIne+6OC2V+gfvnUqIf0A/hYpqo0smhlD7zAMM7mmhbhcEfrk5Y1MnaQEOFWvqJ94Zr
	Q/h1t6qJ8nDrI7vLQ2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofRDK-007NZt-7B; Mon, 03 Oct 2022 19:34:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofRDG-007NVd-Sb
	for linux-riscv@lists.infradead.org; Mon, 03 Oct 2022 19:34:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664825665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BHdWi/paqmDBqfitK3aVupNcHyNAIYCtrWUImZTD18E=;
	b=aAoQt+sqbJzlwnfnwcubSnd0i2K4mhAPP/mht51iP/yrty6U859MwwP2sYtp/EZAJvHML1
	/aM2J1HinZcPh3imlueQEkGWtnCUQ+Zilii9ECTmxrpBZKpSl1Vh5cLLHNPqb2Po85R4xa
	H9SfFhWbNSapdHgweX+9KQHuljhmEno=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-103-VlzPUa2UMPKQonuXOFbc6w-1; Mon, 03 Oct 2022 15:34:24 -0400
X-MC-Unique: VlzPUa2UMPKQonuXOFbc6w-1
Received: by mail-vk1-f198.google.com with SMTP id t125-20020a1f7883000000b003a9d400434aso981058vkc.20
        for <linux-riscv@lists.infradead.org>; Mon, 03 Oct 2022 12:34:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=BHdWi/paqmDBqfitK3aVupNcHyNAIYCtrWUImZTD18E=;
        b=k8jK6eIdjYpRCyahtDMYEQmp9JMBbZWgA5w3dd7LASUFhVEHVyZ6Y6sf/t14RFrSvS
         rW47IaZkLix9kLVgHr/xf73fL8BKAHK8wZccNmBfPteKUYO5kcwXzszcV4MYAQTHFhzJ
         lHvs4rVR0q7W4sbiTiVk+xaZaXw/B8wTi9jExaFGOWfcPxvf/gL2G9C+rNbU5V/p7l++
         CCXlvXgUvOQ9yGM+ds6ke6dG+eZYDGL0ZXeGQifyUzll5bdc5Sb2yLmYGfo52+EoDvh/
         3BJpvE1z+T6sYSALS6F/J1h8GuK0ehw2Z6B4YL9AqJhz3OMr3PogD9DeBAMs8cYCRG90
         mpQQ==
X-Gm-Message-State: ACrzQf0ALeHJfcHlNrTiXtCOdJcFoQD3cB/s+7p+qRynHP/7yyDgFMG6
	kS/fCnL2Vr763lkI8HObiJloX72wyWS9IHXp347exGStM0Vijfd+62SlgmN52ly8h8PUqaxcsHE
	JvfSbPI/DgMaHp20eHXS4VkXGpC738qANFG7plNXwqTlb
X-Received: by 2002:a67:ac4c:0:b0:3a4:b881:4490 with SMTP id n12-20020a67ac4c000000b003a4b8814490mr10400728vsh.42.1664825663533;
        Mon, 03 Oct 2022 12:34:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5afW8fzwWcvUW0EWcnh/TOcV2BXPkjmI6SJlLvWnhUGyqDx+Vr03c9bkyIxGVENeT92rJRXvPExkNB5noBgvE=
X-Received: by 2002:a67:ac4c:0:b0:3a4:b881:4490 with SMTP id
 n12-20020a67ac4c000000b003a4b8814490mr10400710vsh.42.1664825663189; Mon, 03
 Oct 2022 12:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy134Ve1mbeK+TNRx-pWpQ=nVzNLptDcUyPaDU4v18Qyaw@mail.gmail.com>
In-Reply-To: <CAAhSdy134Ve1mbeK+TNRx-pWpQ=nVzNLptDcUyPaDU4v18Qyaw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 3 Oct 2022 21:34:12 +0200
Message-ID: <CABgObfZ08HQMqPVGRa8_viSzWKWizQGU3K_9u20FBUToEjQR5A@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_123451_024796_393247ED 
X-CRM114-Status: GOOD (  15.75  )
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

Pulled, thanks!

On Sun, Oct 2, 2022 at 7:46 AM Anup Patel <anup@brainfault.org> wrote:
>
> Hi Paolo,
>
> We have the following KVM RISC-V changes for 6.1:
> 1) Improved instruction encoding infrastructure for
>     instructions not yet supported by binutils
> 2) Svinval support for both KVM Host and KVM Guest
> 3) Zihintpause support for KVM Guest
> 4) Zicbom support for KVM Guest
> 5) Record number of signal exits as a VCPU stat
> 6) Use generic guest entry infrastructure
>
> Please pull.
>
> Regards,
> Anup
>
> The following changes since commit f76349cf41451c5c42a99f18a9163377e4b364ff:
>
>   Linux 6.0-rc7 (2022-09-25 14:01:02 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.1-1
>
> for you to fetch changes up to b60ca69715fcc39a5f4bdd56ca2ea691b7358455:
>
>   riscv: select HAVE_POSIX_CPU_TIMERS_TASK_WORK (2022-10-02 10:19:31 +0530)
>
> ----------------------------------------------------------------
> KVM/riscv changes for 6.1
>
> - Improved instruction encoding infrastructure for
>   instructions not yet supported by binutils
> - Svinval support for both KVM Host and KVM Guest
> - Zihintpause support for KVM Guest
> - Zicbom support for KVM Guest
> - Record number of signal exits as a VCPU stat
> - Use generic guest entry infrastructure
>
> ----------------------------------------------------------------
> Andrew Jones (7):
>       riscv: Add X register names to gpr-nums
>       riscv: Introduce support for defining instructions
>       riscv: KVM: Apply insn-def to hfence encodings
>       riscv: KVM: Apply insn-def to hlv encodings
>       RISC-V: KVM: Make ISA ext mappings explicit
>       RISC-V: KVM: Provide UAPI for Zicbom block size
>       RISC-V: KVM: Expose Zicbom to the guest
>
> Anup Patel (3):
>       RISC-V: KVM: Change the SBI specification version to v1.0
>       RISC-V: KVM: Use Svinval for local TLB maintenance when available
>       RISC-V: KVM: Allow Guest use Svinval extension
>
> Jisheng Zhang (3):
>       RISC-V: KVM: Record number of signal exits as a vCPU stat
>       RISC-V: KVM: Use generic guest entry infrastructure
>       riscv: select HAVE_POSIX_CPU_TIMERS_TASK_WORK
>
> Mayuresh Chitale (2):
>       RISC-V: Probe Svinval extension form ISA string
>       RISC-V: KVM: Allow Guest use Zihintpause extension
>
> Xiu Jianfeng (1):
>       RISC-V: KVM: add __init annotation to riscv_kvm_init()
>
>  arch/riscv/Kconfig                    |   4 +
>  arch/riscv/include/asm/gpr-num.h      |   8 ++
>  arch/riscv/include/asm/hwcap.h        |   4 +
>  arch/riscv/include/asm/insn-def.h     | 137 ++++++++++++++++++++++++++++++
>  arch/riscv/include/asm/kvm_host.h     |   1 +
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |   4 +-
>  arch/riscv/include/uapi/asm/kvm.h     |   4 +
>  arch/riscv/kernel/cpu.c               |   1 +
>  arch/riscv/kernel/cpufeature.c        |   1 +
>  arch/riscv/kvm/Kconfig                |   1 +
>  arch/riscv/kvm/main.c                 |   2 +-
>  arch/riscv/kvm/tlb.c                  | 155 +++++++++++-----------------------
>  arch/riscv/kvm/vcpu.c                 |  60 ++++++++-----
>  arch/riscv/kvm/vcpu_exit.c            |  39 ++-------
>  arch/riscv/mm/dma-noncoherent.c       |   2 +
>  15 files changed, 260 insertions(+), 163 deletions(-)
>  create mode 100644 arch/riscv/include/asm/insn-def.h
>

On Sun, Oct 2, 2022 at 7:46 AM Anup Patel <anup@brainfault.org> wrote:
>
> Hi Paolo,
>
> We have the following KVM RISC-V changes for 6.1:
> 1) Improved instruction encoding infrastructure for
>     instructions not yet supported by binutils
> 2) Svinval support for both KVM Host and KVM Guest
> 3) Zihintpause support for KVM Guest
> 4) Zicbom support for KVM Guest
> 5) Record number of signal exits as a VCPU stat
> 6) Use generic guest entry infrastructure
>
> Please pull.
>
> Regards,
> Anup
>
> The following changes since commit f76349cf41451c5c42a99f18a9163377e4b364ff:
>
>   Linux 6.0-rc7 (2022-09-25 14:01:02 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.1-1
>
> for you to fetch changes up to b60ca69715fcc39a5f4bdd56ca2ea691b7358455:
>
>   riscv: select HAVE_POSIX_CPU_TIMERS_TASK_WORK (2022-10-02 10:19:31 +0530)
>
> ----------------------------------------------------------------
> KVM/riscv changes for 6.1
>
> - Improved instruction encoding infrastructure for
>   instructions not yet supported by binutils
> - Svinval support for both KVM Host and KVM Guest
> - Zihintpause support for KVM Guest
> - Zicbom support for KVM Guest
> - Record number of signal exits as a VCPU stat
> - Use generic guest entry infrastructure
>
> ----------------------------------------------------------------
> Andrew Jones (7):
>       riscv: Add X register names to gpr-nums
>       riscv: Introduce support for defining instructions
>       riscv: KVM: Apply insn-def to hfence encodings
>       riscv: KVM: Apply insn-def to hlv encodings
>       RISC-V: KVM: Make ISA ext mappings explicit
>       RISC-V: KVM: Provide UAPI for Zicbom block size
>       RISC-V: KVM: Expose Zicbom to the guest
>
> Anup Patel (3):
>       RISC-V: KVM: Change the SBI specification version to v1.0
>       RISC-V: KVM: Use Svinval for local TLB maintenance when available
>       RISC-V: KVM: Allow Guest use Svinval extension
>
> Jisheng Zhang (3):
>       RISC-V: KVM: Record number of signal exits as a vCPU stat
>       RISC-V: KVM: Use generic guest entry infrastructure
>       riscv: select HAVE_POSIX_CPU_TIMERS_TASK_WORK
>
> Mayuresh Chitale (2):
>       RISC-V: Probe Svinval extension form ISA string
>       RISC-V: KVM: Allow Guest use Zihintpause extension
>
> Xiu Jianfeng (1):
>       RISC-V: KVM: add __init annotation to riscv_kvm_init()
>
>  arch/riscv/Kconfig                    |   4 +
>  arch/riscv/include/asm/gpr-num.h      |   8 ++
>  arch/riscv/include/asm/hwcap.h        |   4 +
>  arch/riscv/include/asm/insn-def.h     | 137 ++++++++++++++++++++++++++++++
>  arch/riscv/include/asm/kvm_host.h     |   1 +
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |   4 +-
>  arch/riscv/include/uapi/asm/kvm.h     |   4 +
>  arch/riscv/kernel/cpu.c               |   1 +
>  arch/riscv/kernel/cpufeature.c        |   1 +
>  arch/riscv/kvm/Kconfig                |   1 +
>  arch/riscv/kvm/main.c                 |   2 +-
>  arch/riscv/kvm/tlb.c                  | 155 +++++++++++-----------------------
>  arch/riscv/kvm/vcpu.c                 |  60 ++++++++-----
>  arch/riscv/kvm/vcpu_exit.c            |  39 ++-------
>  arch/riscv/mm/dma-noncoherent.c       |   2 +
>  15 files changed, 260 insertions(+), 163 deletions(-)
>  create mode 100644 arch/riscv/include/asm/insn-def.h
>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
