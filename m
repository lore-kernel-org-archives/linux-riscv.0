Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75297C00144
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jul 2022 14:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qqXLZXi40E0h1868XUbwgknfffhtYU3+CbCQLDizX30=; b=zQlCBWBZs4JH/I
	yA0BlLOfZQHGkMh3gypSduG7EEbNzQ4SX34G+X1oBTcDqllgEj7H7FOAxXiwB1RrSvoMYuTroZYY0
	tidUlIb1K4YjeA/qAA8BrdnHPvgq/ykyGwVqwqhzAKbuOEyGPfzSvOZXmUSs9s926NEgm99I56pT7
	/1fmng08lyU38I6y+ekCAPxG6xJXykWtiNtKcsCD29AY0cNAy4lPjQIFfP+5APq+DvB9rcyNV2k81
	vaA1xjs/Dk/IF5/ZknOvS/A2pPZGcQm8OecCdU/Zk/mSzmfxG21/LdOUMZiAn99w++qRkTzqzJJHG
	OxfBm+NSNNSdxCMmBc/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHQlH-005Qv7-4U; Fri, 29 Jul 2022 14:14:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHQlE-005Qsd-J9
	for linux-riscv@lists.infradead.org; Fri, 29 Jul 2022 14:14:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659104078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MCjF1rJs7ryCEf4nZSDoKmS9akQnz5+AnRQrkGVZ82I=;
	b=OAVR44BJvoS6FwnwCvlx4vgf8idms/HqVlGwtdHWQzyVutgJ3UFfHAcP/yYgZ7olHHyA1U
	9JkWvG8yBfkfY3COPy78IjnPSogzPdKRRa84oeWxCVvZYyav49/wtV3kTAyJdPaC0A5t0D
	3PFLJc5Nw1JyIwvTPOAY+Xxu2XjveWU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-iK79RVoyMZGu721iIJHUeA-1; Fri, 29 Jul 2022 10:14:36 -0400
X-MC-Unique: iK79RVoyMZGu721iIJHUeA-1
Received: by mail-ed1-f69.google.com with SMTP id t21-20020a056402525500b0043d267cedc7so927474edd.2
        for <linux-riscv@lists.infradead.org>; Fri, 29 Jul 2022 07:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MCjF1rJs7ryCEf4nZSDoKmS9akQnz5+AnRQrkGVZ82I=;
        b=zh1CyZBhcQaia1NEGQTQuhIyXYtXQLIIj2YAI30jRFAQ2krqovYCvQVmufpw9EEW09
         Zo5wonDmt57akej/bubDTMcIN/alI2fTA62grgoFmDXEDld7JfHdfJZnQIu71exouIot
         XrRpnxMDfphAlk9HbriBL/kpJ2I8h+B+ntF8nSx9tsy2lBPGvWKgfT16D5g8+gi4u+ky
         4L+JDx0AgDeJDH3uLlwLuB+tRBInfFXm6/gcFl0YH1o+ofPjI6tOCL4TuhAmcq8GJmRD
         Z12MZtY/t6mLFDbNZVlK4Q5N/i/h/gssRNEJyRuK787KG9UPCH0WzvMRFBIPcVJFhrlh
         AdJA==
X-Gm-Message-State: AJIora99M8oiLSMEfwgh9THHSY36mdVDb2OvW90V0+ST3+gTrGQxyjzV
	TQdYCYNynA+lVKDawttKc6j8uLJJ0yfBapCrskwSPxncg19jkTnHMbaHNAdSdumEBRZtjvFpP4X
	rlpfuDnkvNt+QZM+qHFEipvQSP/28
X-Received: by 2002:a05:6402:34c5:b0:43a:8f90:e643 with SMTP id w5-20020a05640234c500b0043a8f90e643mr3752698edc.88.1659104075259;
        Fri, 29 Jul 2022 07:14:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vptcnztXT72sCa4wMYMFIHhe1C7CEEkh5xLKL/oJogGO4q1bTGJImMUoTBn5uZAqjWgDHT9A==
X-Received: by 2002:a05:6402:34c5:b0:43a:8f90:e643 with SMTP id w5-20020a05640234c500b0043a8f90e643mr3752613edc.88.1659104074026;
        Fri, 29 Jul 2022 07:14:34 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id f11-20020a170906560b00b0072b2eab813fsm1733207ejq.75.2022.07.29.07.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Jul 2022 07:14:33 -0700 (PDT)
Message-ID: <59b295a4-9a09-12a6-cf72-d5f0d4b20d7f@redhat.com>
Date: Fri, 29 Jul 2022 16:14:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [GIT PULL] KVM/riscv changes for 5.20
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>,
 KVM General <kvm@vger.kernel.org>,
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <CAAhSdy2iH-WpitweQ_nCYm6p0S5S_fmQ3x37FdAe7tEmu_np0A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAAhSdy2iH-WpitweQ_nCYm6p0S5S_fmQ3x37FdAe7tEmu_np0A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_071440_732506_CAA7418C 
X-CRM114-Status: GOOD (  16.43  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 7/29/22 14:31, Anup Patel wrote:
> Hi Paolo,
> 
> We have following KVM RISC-V changes for 5.20:
> 1) Track ISA extensions used by Guest using bitmap
> 2) Added system instruction emulation framework
> 3) Added CSR emulation framework
> 4) Added gfp_custom flag in struct kvm_mmu_memory_cache
> 5) Added G-stage ioremap() and iounmap() functions
> 6) Added support for Svpbmt inside Guest
> 
> Please pull.
> 
> Regards,
> Anup
> 
> The following changes since commit e0dccc3b76fb35bb257b4118367a883073d7390e:
> 
>    Linux 5.19-rc8 (2022-07-24 13:26:27 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/kvm-riscv/linux.git tags/kvm-riscv-5.20-1
> 
> for you to fetch changes up to 6bb2e00ea304ffc0446f345c46fe22713ce43cbf:
> 
>    RISC-V: KVM: Add support for Svpbmt inside Guest/VM (2022-07-29
> 17:15:18 +0530)
> 
> ----------------------------------------------------------------
> KVM/riscv changes for 5.20
> 
> - Track ISA extensions used by Guest using bitmap
> - Added system instruction emulation framework
> - Added CSR emulation framework
> - Added gfp_custom flag in struct kvm_mmu_memory_cache
> - Added G-stage ioremap() and iounmap() functions
> - Added support for Svpbmt inside Guest
> 
> ----------------------------------------------------------------
> Anup Patel (7):
>        RISC-V: KVM: Factor-out instruction emulation into separate sources
>        RISC-V: KVM: Add extensible system instruction emulation framework
>        RISC-V: KVM: Add extensible CSR emulation framework
>        KVM: Add gfp_custom flag in struct kvm_mmu_memory_cache
>        RISC-V: KVM: Add G-stage ioremap() and iounmap() functions
>        RISC-V: KVM: Use PAGE_KERNEL_IO in kvm_riscv_gstage_ioremap()
>        RISC-V: KVM: Add support for Svpbmt inside Guest/VM
> 
> Atish Patra (1):
>        RISC-V: KVM: Improve ISA extension by using a bitmap
> 
> Nikolay Borisov (2):
>        RISC-V: KVM: Make kvm_riscv_guest_timer_init a void function
>        RISC-V: KVM: move preempt_disable() call in kvm_arch_vcpu_ioctl_run
> 
> Zhang Jiaming (1):
>        RISC-V: KVM: Fix variable spelling mistake
> 
>   arch/riscv/include/asm/csr.h            |  16 +
>   arch/riscv/include/asm/kvm_host.h       |  24 +-
>   arch/riscv/include/asm/kvm_vcpu_fp.h    |   8 +-
>   arch/riscv/include/asm/kvm_vcpu_insn.h  |  48 ++
>   arch/riscv/include/asm/kvm_vcpu_timer.h |   2 +-
>   arch/riscv/include/uapi/asm/kvm.h       |   1 +
>   arch/riscv/kvm/Makefile                 |   1 +
>   arch/riscv/kvm/mmu.c                    |  28 +-
>   arch/riscv/kvm/vcpu.c                   | 203 ++++++---
>   arch/riscv/kvm/vcpu_exit.c              | 496 +--------------------
>   arch/riscv/kvm/vcpu_fp.c                |  27 +-
>   arch/riscv/kvm/vcpu_insn.c              | 752 ++++++++++++++++++++++++++++++++
>   arch/riscv/kvm/vcpu_timer.c             |   4 +-
>   arch/riscv/kvm/vm.c                     |   4 +-
>   include/linux/kvm_types.h               |   1 +
>   include/uapi/linux/kvm.h                |   8 +
>   virt/kvm/kvm_main.c                     |   4 +-
>   17 files changed, 1028 insertions(+), 599 deletions(-)
>   create mode 100644 arch/riscv/include/asm/kvm_vcpu_insn.h
>   create mode 100644 arch/riscv/kvm/vcpu_insn.c
> 

Pulled, thanks.  Because it's Friday and the pull brought in all the new 
x86 RETbleed stuff, it may be a couple days before I finish retesting 
and do push it out to kvm.git.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
