Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46E0C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 14:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=rMvXSNfzo1SjYvqk+UiD6HNopt84IgC0SZFufBVyW38=; b=oitnW6jkVw7UJc9c4EJ76rZqlm
	UHGW/vamYnXHp6Ue3GrUQX5TDsifwBTs2tUDOfOGCuuzuCvEIha9JzdkRu0WPhU1dYF2Xt+7CHsZB
	Vj0I5yzK2utfm/gegQG9w7Oxr97DWlxC4gOkmF/8YAFcmsUJm+BLmL5UPxYoitWSrEvoMIn2cUn1k
	x4oOQlvcbDFQkYldq8MOKnZIdwYhGWGTydb7yannuegjpwbEy5HqwicTsTX6+aZuQezep/3QZm7NK
	TpNJr9Zuj7FYexdP9xRFZHstbmndFYJWtViHglyj2xgIby5FuPgwrrbAsdTkT8uq1AIN+9C8ydj7n
	+T9eOOng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8hZ-005dmX-22;
	Wed, 19 Apr 2023 14:22:29 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8hW-005diL-0M
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 14:22:27 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-246eebbde1cso3329505a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 07:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1681914141; x=1684506141;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AZVoE4cKl5QalUTwIQY3oWUmaoZBRuHIhA+cy8XC/s=;
        b=Uf44G7eShP45n3mvQsLaHp0FYljwSoqFn6ycGUo7jd19P0ovDq0zYsO0ygVV7IKtio
         62GMonB9A3vjZu1wyukptFhBL0UVngK7V1lKn91S6YHJ9GKWhxd2JJSCkJgX/wqWtIWq
         vdMtgwI9BniFnWkT/DM8X4F7S0AoBst+qlNVr7aMrthHGVnBzZ8mHmYnMX/BvLizCfaf
         Op6DDgLsT2wxXL+ei+EhK2jh9XRwQejhOSQ3f/JkW3Zr2x0MF7G9eAHbJ/+1yNMXNskk
         Sv/hclJBzlFlROh6qKbo40F7WQvNJ2OONsVjtIzOodYF+GmVl0Ubw7jvMEEarc5i+L2h
         Pq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681914141; x=1684506141;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AZVoE4cKl5QalUTwIQY3oWUmaoZBRuHIhA+cy8XC/s=;
        b=JTSZlL/wfqVmDeqleFC43fPKbL4G/Tjo+WR2qOIl+BsFiurhQUhnDhhR1fE+wNvW9R
         hKid5weFFmBY2XEfehPTf394fE3dmBIxVcu3z6W6IwOcdamiaTwpFLJcDUe0VijL09jG
         spIUhSx1+Tl7IlZ35+aRnN47EsD0BSh2KzOzzARII2cZ367JPTQ1MI9eOfVBcuPV+Dy/
         9HWe09krB4gl9iadeXEtuRADSp5f0gJ5azx7qLZx4aUYQb4jg23jX45r56/JFEGovTZZ
         SwksWQ4FPPOZxNsGWdOe16UWipbDQaGqEsgBp4ivReTSqVEgrI/Dyb5hbrDgD6aL0Ia6
         GtYg==
X-Gm-Message-State: AAQBX9dIJMNtUUfAauSeSZtygTFviFIn3iK/KCrRasxFgz3YA6RNbUVO
	m0TXs/YuRowQ98Ziv0ZOxQ3QuQ==
X-Google-Smtp-Source: AKy350ZTJwE2aWSzstOmJ0YW285PJ4i358w4phfkGLXLXpb0SQnSrIkea7QeQB4AECwuoTp9GpufSA==
X-Received: by 2002:a17:90a:f196:b0:236:73d5:82cf with SMTP id bv22-20020a17090af19600b0023673d582cfmr3147217pjb.9.1681914141039;
        Wed, 19 Apr 2023 07:22:21 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id x1-20020a1709029a4100b001a687c505e9sm11329933plv.237.2023.04.19.07.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 07:22:20 -0700 (PDT)
Date: Wed, 19 Apr 2023 07:22:20 -0700 (PDT)
X-Google-Original-Date: Wed, 19 Apr 2023 07:22:13 PDT (-0700)
Subject: Re: [PATCH v4 0/9] RISC-V KVM virtualize AIA CSRs
In-Reply-To: <20230404153452.2405681-1-apatel@ventanamicro.com>
CC: pbonzini@redhat.com, atishp@atishpatra.org,
  Paul Walmsley <paul.walmsley@sifive.com>, ajones@ventanamicro.com, anup@brainfault.org, kvm@vger.kernel.org,
  kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  apatel@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: apatel@ventanamicro.com
Message-ID: <mhng-72b96cbf-6edd-4b37-9549-200e2a3cb35d@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_072226_152542_6D8F84DA 
X-CRM114-Status: GOOD (  18.74  )
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

On Tue, 04 Apr 2023 08:34:43 PDT (-0700), apatel@ventanamicro.com wrote:
> The RISC-V AIA specification is now frozen as-per the RISC-V international
> process. The latest frozen specifcation can be found at:
> https://github.com/riscv/riscv-aia/releases/download/1.0-RC3/riscv-interrupts-1.0-RC3.pdf
>
> This series implements first phase of AIA virtualization which targets
> virtualizing AIA CSRs. This also provides a foundation for the second
> phase of AIA virtualization which will target in-kernel AIA irqchip
> (including both IMSIC and APLIC).
>
> The first two patches are shared with the "Linux RISC-V AIA Support"
> series which adds AIA driver support.
>
> To test this series, use AIA drivers from the "Linux RISC-V AIA Support"
> series and use KVMTOOL from the riscv_aia_v1 branch at:
> https://github.com/avpatel/kvmtool.git
>
> These patches can also be found in the riscv_kvm_aia_csr_v4 branch at:
> https://github.com/avpatel/linux.git
>
> Based-on: 20230401112730.2105240-1-apatel@ventanamicro.com
> (https://lore.kernel.org/lkml/20230401112730.2105240-1-apatel@ventanamicro.com/)
>
> Based-on: 20230403121527.2286489-1-apatel@ventanamicro.com
> (https://lore.kernel.org/lkml/20230403121527.2286489-1-apatel@ventanamicro.com/)
>
> Changes since v3:
>  - Split PATCH7 into two patches
>  - Addressed comments in PATCH7, PATCH8 and PATCH9
>
> Changes since v2:
>  - Rebased on Linux-6.3-rc5
>  - Split PATCH5 into two separate patches as suggested by Atish.
>
> Changes since v1:
>  - Addressed from Drew and Conor in PATCH1
>  - Use alphabetical ordering for SMAIA and SSAIA enum in PATCH2
>  - Use GENMASK() in PATCH3
>
> Anup Patel (9):
>   RISC-V: Add AIA related CSR defines
>   RISC-V: Detect AIA CSRs from ISA string
>   RISC-V: KVM: Drop the _MASK suffix from hgatp.VMID mask defines
>   RISC-V: KVM: Initial skeletal support for AIA
>   RISC-V: KVM: Implement subtype for CSR ONE_REG interface
>   RISC-V: KVM: Add ONE_REG interface for AIA CSRs
>   RISC-V: KVM: Use bitmap for irqs_pending and irqs_pending_mask
>   RISC-V: KVM: Virtualize per-HART AIA CSRs
>   RISC-V: KVM: Implement guest external interrupt line management
>
>  arch/riscv/include/asm/csr.h      | 107 ++++-
>  arch/riscv/include/asm/hwcap.h    |   8 +
>  arch/riscv/include/asm/kvm_aia.h  | 137 +++++++
>  arch/riscv/include/asm/kvm_host.h |  14 +-
>  arch/riscv/include/uapi/asm/kvm.h |  18 +-
>  arch/riscv/kernel/cpu.c           |   2 +
>  arch/riscv/kernel/cpufeature.c    |   2 +
>  arch/riscv/kvm/Makefile           |   1 +
>  arch/riscv/kvm/aia.c              | 627 ++++++++++++++++++++++++++++++
>  arch/riscv/kvm/main.c             |  23 +-
>  arch/riscv/kvm/mmu.c              |   3 +-
>  arch/riscv/kvm/vcpu.c             | 190 +++++++--
>  arch/riscv/kvm/vcpu_insn.c        |   1 +
>  arch/riscv/kvm/vm.c               |   4 +
>  arch/riscv/kvm/vmid.c             |   4 +-
>  15 files changed, 1083 insertions(+), 58 deletions(-)
>  create mode 100644 arch/riscv/include/asm/kvm_aia.h
>  create mode 100644 arch/riscv/kvm/aia.c

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
