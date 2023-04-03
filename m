Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBBCC76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 09:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D4LMt4RS4DZ0NgHcXDWjCHNOrhslEYK076y86Qx3eLg=; b=i0tJpFvC9n2aNp
	IbLutYRYXYfXbVoJnqumuNmSwbrVus6YfiYAMvjWR2DhuRN7kIh1Vn7/61igFG21AIXUaFgSxv3mc
	Y5urFhnaahYuJyW/iCib68wH1sh0Ri5J6BQXRc0pGObLAQ39qc6EdMH2+066cF7e8peOKMJtA2fbQ
	YzqnagS67GP6/5fgU089ktadozaPuZ+/t99OztOZnCDSEm/HrFXPGoEvkkAN0vz8Up8gkQfNHXOuB
	7YfPvqt1NcFZSdcnEoYfisKfXQSV0yt2DejOgAeaTAePAGxIU3wOrY14cFLcA7IgKQVkZEA4TgjfT
	xcCJYUB/A8v8S3DnVjiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjGZL-00EjWD-0d;
	Mon, 03 Apr 2023 09:33:43 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjGZI-00EjRB-2K
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 09:33:42 +0000
Received: by mail-ot1-x335.google.com with SMTP id r17-20020a05683002f100b006a131458abfso12686198ote.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Apr 2023 02:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680514404; x=1683106404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DZznhaLgkR5BAQNz1oF8xOUpsQ8iqxB7L0RTGOfw/xU=;
        b=UbT8vAYvDN6OqpJ+R+oA5J2u0aFC3YpjFuymekDS1vJOIssNIUqJ/Pr3rv0yghLjmE
         nIxx6L1TUeuDgIDJ019Jf0UeIZ58zJdh6Y2grtRYP1XtOThcq/pq/rx9rxRNbPw5qF1V
         4nuDEeWZz/UVV7pTd1am8hEkRAUheoHcXvbHlNyStdimjkD1sooaunPwp7euGstILn3n
         +mY3ZBa5sLKAA5EGL8LopqgiC1TeAMnE+6/66rwt9TGtsPu1M3P9ot92vCMhj5h7q6sw
         mpmfQYgdfVIH9aSIKIjwU0fOBTTMTg4ynSFui75ag+jt6eXYFd+bKHPVU1SdwYvfwI76
         gcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680514404; x=1683106404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZznhaLgkR5BAQNz1oF8xOUpsQ8iqxB7L0RTGOfw/xU=;
        b=6GSuEPsqa5UPt8dyBk539vwDMXAIw1OvqdudE2TWY3HZRyDqROCAXvzdZalpbA5PEG
         e0x8CEF5QPzKS9Ypx2dIVBtYvy/J3NLMGPp8H6U39P7vOMoO/HYh6kT+f9lWGCmE7DbQ
         r7aFPLaa00idQlnIjX6Nu7jQJngaiNCv8iihBFTJM6ebSb/d6c5RSPb6ryWKYLQy8rDX
         +eYHr2EtxfD4ktUJgcL+KJZy+nvlbwAWn2HnuGFpTzAfg+XAmgmPviPBzbb2484mfI7Q
         N/+Rm/wbXD2w6mGxv526ksHnPJB0PVmLSPTCcesAhMRNiwXhR8iOkdM9B6Zu9KKYA9MH
         +mow==
X-Gm-Message-State: AAQBX9dh2ZYE3PhtiVmFYWN8aKFdutJSlitnxjZOOSe6BdsDhnnRD84j
	kL+14LZd+TcyqlFK8M95ShIHBQ==
X-Google-Smtp-Source: AKy350aA5Ixs2WBzjri+SklllWtPpSloyccBIm2AHc49ql1/dCwqDARVWDxRF+zMDpQSH0NUaUW7RQ==
X-Received: by 2002:a9d:668:0:b0:6a3:7e52:c3ae with SMTP id 95-20020a9d0668000000b006a37e52c3aemr434930otn.13.1680514404560;
        Mon, 03 Apr 2023 02:33:24 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id f5-20020a9d6c05000000b006a154373578sm3953953otq.39.2023.04.03.02.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 02:33:24 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 0/8] RISC-V KVM virtualize AIA CSRs
Date: Mon,  3 Apr 2023 15:03:02 +0530
Message-Id: <20230403093310.2271142-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_023340_759284_DA3AEA5C 
X-CRM114-Status: GOOD (  10.91  )
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

The RISC-V AIA specification is now frozen as-per the RISC-V international
process. The latest frozen specifcation can be found at:
https://github.com/riscv/riscv-aia/releases/download/1.0-RC3/riscv-interrupts-1.0-RC3.pdf

This series implements first phase of AIA virtualization which targets
virtualizing AIA CSRs. This also provides a foundation for the second
phase of AIA virtualization which will target in-kernel AIA irqchip
(including both IMSIC and APLIC).

The first two patches are shared with the "Linux RISC-V AIA Support"
series which adds AIA driver support.

To test this series, use AIA drivers from the "Linux RISC-V AIA Support"
series and use KVMTOOL from the riscv_aia_v1 branch at:
https://github.com/avpatel/kvmtool.git

These patches can also be found in the riscv_kvm_aia_csr_v3 branch at:
https://github.com/avpatel/linux.git

Changes since v2:
 - Rebased on Linux-6.3-rc5
 - Split PATCH5 into two separate patches as suggested by Atish.

Changes since v1:
 - Addressed from Drew and Conor in PATCH1
 - Use alphabetical ordering for SMAIA and SSAIA enum in PATCH2
 - Use GENMASK() in PATCH3

Anup Patel (8):
  RISC-V: Add AIA related CSR defines
  RISC-V: Detect AIA CSRs from ISA string
  RISC-V: KVM: Drop the _MASK suffix from hgatp.VMID mask defines
  RISC-V: KVM: Initial skeletal support for AIA
  RISC-V: KVM: Implement subtype for CSR ONE_REG interface
  RISC-V: KVM: Add ONE_REG interface for AIA CSRs
  RISC-V: KVM: Virtualize per-HART AIA CSRs
  RISC-V: KVM: Implement guest external interrupt line management

 arch/riscv/include/asm/csr.h      | 107 ++++-
 arch/riscv/include/asm/hwcap.h    |   8 +
 arch/riscv/include/asm/kvm_aia.h  | 137 +++++++
 arch/riscv/include/asm/kvm_host.h |  14 +-
 arch/riscv/include/uapi/asm/kvm.h |  18 +-
 arch/riscv/kernel/cpu.c           |   2 +
 arch/riscv/kernel/cpufeature.c    |   2 +
 arch/riscv/kvm/Makefile           |   1 +
 arch/riscv/kvm/aia.c              | 624 ++++++++++++++++++++++++++++++
 arch/riscv/kvm/main.c             |  23 +-
 arch/riscv/kvm/mmu.c              |   3 +-
 arch/riscv/kvm/vcpu.c             | 185 +++++++--
 arch/riscv/kvm/vcpu_insn.c        |   1 +
 arch/riscv/kvm/vm.c               |   4 +
 arch/riscv/kvm/vmid.c             |   4 +-
 15 files changed, 1077 insertions(+), 56 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_aia.h
 create mode 100644 arch/riscv/kvm/aia.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
