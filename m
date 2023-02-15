Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1140EC636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 17:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DiXzECMSaXYSYqQoTm/CZrz8iLgFnfnqp2hL2J84uA4=; b=0dsedFLL255cpr
	+asD9Z8WcxKm4aDhQWNcC7ZtyWyJbJ9r22jvaFYLIJWBU3f19UP8tA+AWeDRumdqVHdHs+jZV9zGQ
	0I9l8Uiu2ftqD2N56hus4HwV6s0+vdr8iwWEHZcMaKfri5Lcdoge7P4l70lx/IfMv+oKDCnmRMfiv
	tMFYhQ4KrWSy/c0zcxftonnXF8PxuphxQcnyWBMIoCVnJI5fFewvR0RnGI6BVs6ystoGPJ/4fMOAD
	V/ix8FDYNOn09p59NJ59MY/cCy8WKBMgUonP8wkK0X+oF5PfIieKM/kNK1YVUTLFQgbNbq3tCVRtO
	mAHBoPDN/+8eDU84jyJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSLgX-006iB5-N3; Wed, 15 Feb 2023 17:35:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSLgT-006i8n-Vi
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 17:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676482508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5tf+V8DJIKLh2c8kinjZQV06pVM49sC8W88QF7Olf/c=;
	b=hd599kpAlbCl4QhLgONCTRhKlf8oMZXJc3yMB62UdS3Ggrd7Z/VeBlgeCtubMeR1kKz4tK
	kvr96d6k58qmZbvQUYwP3SjdtIT0K/aANka2KyYA+TXdkXpc1sWAXYW8FIjFhH6HJc3riE
	+8OEbJZva1nC1lsZ2hKIHFjaE1le9WY=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-146-qMt8JPN2NOCADJ3IWvkw6w-1; Wed, 15 Feb 2023 12:35:07 -0500
X-MC-Unique: qMt8JPN2NOCADJ3IWvkw6w-1
Received: by mail-vk1-f200.google.com with SMTP id n21-20020ac5c895000000b00401b81d313bso2566740vkl.6
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 09:35:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5tf+V8DJIKLh2c8kinjZQV06pVM49sC8W88QF7Olf/c=;
        b=HcLovMyDhP5aZh7UFspxv1a9uxRaKq8s4LqMxvowIY6KmTls89dcbUjSbYUnVMJ8AI
         LXV+/JJ64/bBZPADb9CWbCIUZdKmh9vSnmUZ+59n9xmurPh6eTrQqrw4RdhHMDvQdkxf
         +G2VKxGsIoLmcbcC2oN9yFthLWmgO/AXteFq7Td8TicHkaRZ5pEfsdLJwiA6jGmqA+rv
         gjoQSRZ4+rwYnAjsQHkeDqSZt+60P2FMM685dVilNcOLVJu8zZdbKYtoqtgIlim+j126
         1qNpgTakz6jYKHVi4sykNfRWUf27w4vuYO1a6tAyVuCWh2DeQl9D8Y29EKkozrjuth2v
         SN8Q==
X-Gm-Message-State: AO0yUKWaOo2EuXwGeqLNs88Gq3zQlvdDeUEmTS9kqmkZdubUpxkhW3Gw
	S8Dql0D5XLkVMeA0e4Yi1lVe78S6CEgn71eUBHBB7YEWU+/jtLLil94FPUGZisEYn/gs3Qm2Szt
	kIaDTsViRayoBlel0N0ITW/8EVP22SkF824AnkFCYBBjr
X-Received: by 2002:a05:6102:5c17:b0:412:c97:4ac8 with SMTP id ds23-20020a0561025c1700b004120c974ac8mr501648vsb.53.1676482506628;
        Wed, 15 Feb 2023 09:35:06 -0800 (PST)
X-Google-Smtp-Source: AK7set+AYx/JnyU2pU6bd3Lzl+4J3wYF3yJk48DOVfDOD8nXYixJemGpjfVpYcAQrXAoAoxcjoDZwnuK40Ze7IoLFgs=
X-Received: by 2002:a05:6102:5c17:b0:412:c97:4ac8 with SMTP id
 ds23-20020a0561025c1700b004120c974ac8mr501643vsb.53.1676482506333; Wed, 15
 Feb 2023 09:35:06 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy25NgCY23u=icRgcZpEZzNgJkyEN92KEVL8D-SvUwTBXg@mail.gmail.com>
In-Reply-To: <CAAhSdy25NgCY23u=icRgcZpEZzNgJkyEN92KEVL8D-SvUwTBXg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 15 Feb 2023 18:34:55 +0100
Message-ID: <CABgObfbkCP7gciYaBQ38Qqkryx_k=RcV_Egvv_UE28EO1CnOew@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.3
To: anup@brainfault.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	Andrew Jones <ajones@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_093510_124273_D7B551C5 
X-CRM114-Status: GOOD (  18.62  )
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

On Tue, Feb 7, 2023 at 6:36 PM Anup Patel <anup@brainfault.org> wrote:
>
> Hi Paolo,
>
> We have the following KVM RISC-V changes for 6.3:
> 1) Fix wrong usage of PGDIR_SIZE to check page sizes
> 2) Fix privilege mode setting in kvm_riscv_vcpu_trap_redirect()
> 3) Redirect illegal instruction traps to guest
> 4) SBI PMU support for guest
>
> Please pull.
>
> I will send another PR for 6.3 containing AIA CSR
> virtualization after Palmer has sent his first PR for 6.3
> so that I can resolve conflicts with arch/riscv changes.
> I hope you are okay with this ??

Yes, it's fine to have it separate.

But please send it now, solving the conflicts is either my task or Linus's.

Paolo


> Regards,
> Anup
>
> The following changes since commit 4ec5183ec48656cec489c49f989c508b68b518e3:
>
>   Linux 6.2-rc7 (2023-02-05 13:13:28 -0800)
>
> are available in the Git repository at:
>
>   https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.3-1
>
> for you to fetch changes up to c39cea6f38eefe356d64d0bc1e1f2267e282cdd3:
>
>   RISC-V: KVM: Increment firmware pmu events (2023-02-07 20:36:08 +0530)
>
> ----------------------------------------------------------------
> KVM/riscv changes for 6.3
>
> - Fix wrong usage of PGDIR_SIZE to check page sizes
> - Fix privilege mode setting in kvm_riscv_vcpu_trap_redirect()
> - Redirect illegal instruction traps to guest
> - SBI PMU support for guest
>
> ----------------------------------------------------------------
> Alexandre Ghiti (1):
>       KVM: RISC-V: Fix wrong usage of PGDIR_SIZE to check page sizes
>
> Andy Chiu (1):
>       RISC-V: KVM: Redirect illegal instruction traps to guest
>
> Anup Patel (1):
>       RISC-V: KVM: Fix privilege mode setting in kvm_riscv_vcpu_trap_redirect()
>
> Atish Patra (14):
>       perf: RISC-V: Define helper functions expose hpm counter width and count
>       perf: RISC-V: Improve privilege mode filtering for perf
>       RISC-V: Improve SBI PMU extension related definitions
>       RISC-V: KVM: Define a probe function for SBI extension data structures
>       RISC-V: KVM: Return correct code for hsm stop function
>       RISC-V: KVM: Modify SBI extension handler to return SBI error code
>       RISC-V: KVM: Add skeleton support for perf
>       RISC-V: KVM: Add SBI PMU extension support
>       RISC-V: KVM: Make PMU functionality depend on Sscofpmf
>       RISC-V: KVM: Disable all hpmcounter access for VS/VU mode
>       RISC-V: KVM: Implement trap & emulate for hpmcounters
>       RISC-V: KVM: Implement perf support without sampling
>       RISC-V: KVM: Support firmware events
>       RISC-V: KVM: Increment firmware pmu events
>
>  arch/riscv/include/asm/kvm_host.h     |   4 +
>  arch/riscv/include/asm/kvm_vcpu_pmu.h | 107 ++++++
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  13 +-
>  arch/riscv/include/asm/sbi.h          |   7 +-
>  arch/riscv/kvm/Makefile               |   1 +
>  arch/riscv/kvm/main.c                 |   3 +-
>  arch/riscv/kvm/mmu.c                  |   8 +-
>  arch/riscv/kvm/tlb.c                  |   4 +
>  arch/riscv/kvm/vcpu.c                 |   7 +
>  arch/riscv/kvm/vcpu_exit.c            |   9 +
>  arch/riscv/kvm/vcpu_insn.c            |   4 +-
>  arch/riscv/kvm/vcpu_pmu.c             | 633 ++++++++++++++++++++++++++++++++++
>  arch/riscv/kvm/vcpu_sbi.c             |  72 ++--
>  arch/riscv/kvm/vcpu_sbi_base.c        |  27 +-
>  arch/riscv/kvm/vcpu_sbi_hsm.c         |  28 +-
>  arch/riscv/kvm/vcpu_sbi_pmu.c         |  86 +++++
>  arch/riscv/kvm/vcpu_sbi_replace.c     |  50 +--
>  arch/riscv/kvm/vcpu_sbi_v01.c         |  17 +-
>  drivers/perf/riscv_pmu_sbi.c          |  64 +++-
>  include/linux/perf/riscv_pmu.h        |   5 +
>  20 files changed, 1035 insertions(+), 114 deletions(-)
>  create mode 100644 arch/riscv/include/asm/kvm_vcpu_pmu.h
>  create mode 100644 arch/riscv/kvm/vcpu_pmu.c
>  create mode 100644 arch/riscv/kvm/vcpu_sbi_pmu.c
>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
