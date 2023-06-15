Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E14EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 07:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i4FOchS+qMW+1NGtRO3Hg0hgIJ8Lptog80tAELwiZcU=; b=yx7uYbIY3SoWso
	2SW5Vo91Khl2sf334TUawo7Ab+wXGw+MG3eUJm+jefz6JpfBvWVBrGZVp3y5yxqVGNvM4slI7y9VQ
	zXcPDz3Cju4VOXCY6YlKCJADjapWhuA1zJAihERaNfXPkyWubXyfnp1J0GwmZYaIWsh1UT2Jvz+cb
	Ee8LKYF0tprs25sqNMe1T66dGmhecDqTXZgwqmPtxsNWRuFecC4xv2pvSuzLntnPGIQ4B7DhPBA4F
	zM/8RCODVQvnJIbGALE6B10lrbb8zsS7X9R0WNrufoeJfv1lJySIE7Ff8NBvEWC9cY3/UR2J6GwBB
	YyN6RWeYPQ4l+OByrwTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hUc-00E13x-01;
	Thu, 15 Jun 2023 07:34:06 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hUZ-00E12f-2H
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 07:34:05 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-666933f66cfso395070b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jun 2023 00:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686814443; x=1689406443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uSVZgRG5YqM/eFQOFzsv+7qQx2kR6U7K/exhbfh3iHo=;
        b=ZU5NKMa7G4ct8b3MBmjVWKrm9NhEKEL5tmHTacR2un8854Mv7M7pqhvPirLhVQlLKD
         yQJrWHCAeRXcVIuM2TcU0o7A0ieXOuLIj9mPpX0XJAvWzt397TT8XVjBsBEjPQmCjUHi
         G6wwzmRmXhg8W1M7ODggv7uVUuVaMsRhPBVt+shONlAZyFq4rVmMix++00q5mtjr/wK2
         rrsXFvjGIQZE5quFdViRsx8SRkNIb+eSdgUXVFzVNdJCEMBKlmIk39JaFHbnNrob+DWs
         TFLKaYjlcY2JbZxX3Ipx9OGlOT9J2DwPNPx4qP3MiX8qUURz0qzLsH3ZwbpHr1OFD3Gx
         2eVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686814443; x=1689406443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSVZgRG5YqM/eFQOFzsv+7qQx2kR6U7K/exhbfh3iHo=;
        b=R+ymrcXXENKyTwamFax+JodK95x+UA/33pp8aWud9E0T/rE+F4rUPbBffvfXf68DKP
         KBqzwy52C1gWobr55wZjniFUUj8aSySAcgKDk5K0LpVTB5Xayv8p7+IToRdcUQszuDlo
         2a+5H+aTRZ0/iYQVaXrmjh9VrlM2AwOjYMHewl6F2ESTle6CULuPphvL0JWtgMJDdxLF
         H3tf7x5voCP+M8ONRJOYrzzqswruaFUOe/J/9yc2Kj5oZlbHFtjL8yv4k515/xcNm29D
         v5LzVaiuzmx3H57s/1Eq8/h91Cj972GDr/Gx7TA27/FE0UdgJBZuhwM+xZr1xmNv4IB8
         e/Eg==
X-Gm-Message-State: AC+VfDxA0pduRVitNDtnLdB4DRNcyWresqqpNQpa91pUoXU6k6Pik701
	HALqBbmeu8xJ+38Q4GYH/a6yOAZRKS3mY2wam/0=
X-Google-Smtp-Source: ACHHUZ6bJonZw603lvIGfQwVjskavYnCDRr4u1S4D2EB7M7IA9w4wtMrIHM/wnYPsW3vFEEdT710hg==
X-Received: by 2002:a05:6a21:329a:b0:10b:cdb1:3563 with SMTP id yt26-20020a056a21329a00b0010bcdb13563mr4810645pzb.46.1686814442720;
        Thu, 15 Jun 2023 00:34:02 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id ji1-20020a170903324100b001b016313b1dsm8049855plb.86.2023.06.15.00.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 00:34:02 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 00/10] RISC-V KVM in-kernel AIA irqchip
Date: Thu, 15 Jun 2023 13:03:43 +0530
Message-Id: <20230615073353.85435-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_003403_745914_EA920487 
X-CRM114-Status: GOOD (  12.53  )
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

This series adds in-kernel AIA irqchip to KVM RISC-V which trap-n-emulate
IMSIC and APLIC MSI-mode for Guest. The APLIC MSI-mode trap-n-emulate is
optional so KVM user space can emulate APLIC entirely in user space.

The use of IMSIC HW guest files to accelerate IMSIC virtualization will be
done as separate series since this depends on AIA irqchip drivers to be
upstreamed. This series has no dependency on the AIA irqchip drivers.

There is also a KVM AIA irq-bypass (or device MSI virtualization) series
under development which depends on this series and upcoming IOMMU driver
series.

These patches (or this series) can also be found in the
riscv_kvm_aia_irqchip_v3 branch at: https://github.com/avpatel/linux.git

Changes since v2:
 - Added KVM_CAP_IRQCHIP in PATCH5
 - Fix check for KVM_DEV_RISCV_AIA_CONFIG_IDS write in PATCH6
 - Fix APLIC_IRQ_STATE_ENPEND usage in PATCH7

Changes since v1:
 - Rebased on Linux-6.4-rc6
 - Addressed Atish's comment in PATCH6
 - Added comments in arch/riscv/include/uapi/asm/kvm.h about APLIC and
   IMSIC device attribute type

Anup Patel (10):
  RISC-V: KVM: Implement guest external interrupt line management
  RISC-V: KVM: Add IMSIC related defines
  RISC-V: KVM: Add APLIC related defines
  RISC-V: KVM: Set kvm_riscv_aia_nr_hgei to zero
  RISC-V: KVM: Skeletal in-kernel AIA irqchip support
  RISC-V: KVM: Implement device interface for AIA irqchip
  RISC-V: KVM: Add in-kernel emulation of AIA APLIC
  RISC-V: KVM: Expose APLIC registers as attributes of AIA irqchip
  RISC-V: KVM: Add in-kernel virtualization of AIA IMSIC
  RISC-V: KVM: Expose IMSIC registers as attributes of AIA irqchip

 arch/riscv/include/asm/kvm_aia.h       |  107 ++-
 arch/riscv/include/asm/kvm_aia_aplic.h |   58 ++
 arch/riscv/include/asm/kvm_aia_imsic.h |   38 +
 arch/riscv/include/asm/kvm_host.h      |    4 +
 arch/riscv/include/uapi/asm/kvm.h      |   72 ++
 arch/riscv/kvm/Kconfig                 |    4 +
 arch/riscv/kvm/Makefile                |    3 +
 arch/riscv/kvm/aia.c                   |  274 +++++-
 arch/riscv/kvm/aia_aplic.c             |  619 ++++++++++++++
 arch/riscv/kvm/aia_device.c            |  673 +++++++++++++++
 arch/riscv/kvm/aia_imsic.c             | 1083 ++++++++++++++++++++++++
 arch/riscv/kvm/main.c                  |    3 +-
 arch/riscv/kvm/vcpu.c                  |    2 +
 arch/riscv/kvm/vm.c                    |  118 +++
 include/uapi/linux/kvm.h               |    2 +
 15 files changed, 3027 insertions(+), 33 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_aia_aplic.h
 create mode 100644 arch/riscv/include/asm/kvm_aia_imsic.h
 create mode 100644 arch/riscv/kvm/aia_aplic.c
 create mode 100644 arch/riscv/kvm/aia_device.c
 create mode 100644 arch/riscv/kvm/aia_imsic.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
