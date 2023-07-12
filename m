Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B528FC001DE
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 16:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IKljtDQNE3/MXkHy9gRoT0Yz5jhM0LJVMC2HU96RC10=; b=k2jeezDg/jPwj0
	vK4HJop9Rhc9xvyfuueCdhw+Q/1hBozlDoROuvC1UFUgmXkvOyYbvRAbiYQcOrHyHRqEsIw+xCDC5
	Z4vru9GfQSAzfflQ74KxH1OH2ni3PP3KJpI/qZQqEIZAZRjPWSby3QiWPT/HsKbd2QG0LwtjYIhYW
	nUPduTnBBN9C6tDxk70wXhqfQ2LC7AKK595wZs43mH1cYl2vpT5ONARoBESXQoNhtXPSR82xrQDKg
	usN2KlK4I4xBVBRObG/7HwGtZ4VdzTzFizcPCS4D9Q06Z2Q3DpWUllcy60q2GOBND9qFp1h6lUiRf
	1TvFX8rtxV2rfHIHE0JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcQr-000TZi-0u;
	Wed, 12 Jul 2023 16:11:13 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcQn-000TUk-1v
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 16:11:11 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-55b5a3915f5so4994750a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 09:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689178261; x=1691770261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P/gyHWRhdmt3W1ZOf5pRL6UNntD92OSXMXDmAzXvrNg=;
        b=fGAuAcLoInUfc0q3fFxWXNh784K2v5lXc+3MSoA4NM4bybLlq2A877Q95K6HPCvW9i
         S9PrgoE9ClCRf5R1/0nlUvszFDWskGWmxaLRyn6U+mvK6cGOHNG3QzCcA15MOd4qS2MD
         OJtKncBfjTZp/dtZdSfB6Y79/SxulIFkSPojn75EDVKeTnitLdCwvm2lEdtuzzfq/gqP
         WgwieP0Xy0H7L55RHFo3oyH4kuqlxT+6te6xDOc3zCzYjO3yerYeY6DGF8VaQC7y7Sjo
         udyKf12J7tGNllcGbv7sN3p3I7EUKSbpIMb+L6OF6oOhCDg1p7ZtWEyjTUOrd3JjZGPW
         EHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689178261; x=1691770261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/gyHWRhdmt3W1ZOf5pRL6UNntD92OSXMXDmAzXvrNg=;
        b=TB6xrjoDNMLPlFBpmvaDCL91epuGksE0lXHiedvftmeyNJ0vYQLqB4K/wEr0bYhXt+
         UdRe9zg+nhZzWtthD1Sue3eHfFD/ZZAvcVfmb+6vyzZfGWJxvKnkLAax+KMbBCEEyyLe
         jON7P41P1J5fcLLYnYiIm270bBR1g+IfVV6JWh5iubzrFzpw7a0s7ijizFfjHiRXgtT2
         4sT7ZBRGjcLfiBvOV5lGoQmfP5dCc++eYjQmYXzcnux7oGpqCy5ErnEhyR3gx9/dV63G
         vVq7QM6OznyM27ryn5MLzx89FJ25pmdQFlTwBjwTt2pups8AUtiG8+d3gym779W1FHcb
         KWtg==
X-Gm-Message-State: ABy/qLaVAJtHnXqxlWKEPoe7R2rcjhSdRlEUOPR56rnEc4bAKMMjpFsX
	RnS2chQNnlxExXnlMuR9AMRSlA==
X-Google-Smtp-Source: APBJJlFJQ/muT40Pd9YoRXcgQ+QCoBx9dXiJIoyQqgXxxQpDnA04YVdYrtkec+9jLWPYZIUFBi9Fcg==
X-Received: by 2002:a17:903:489:b0:1b8:6cae:4400 with SMTP id jj9-20020a170903048900b001b86cae4400mr15606614plb.37.1689178261471;
        Wed, 12 Jul 2023 09:11:01 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.82.173])
        by smtp.gmail.com with ESMTPSA id bc2-20020a170902930200b001b9f032bb3dsm3811650plb.3.2023.07.12.09.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 09:11:01 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Samuel Ortiz <sameo@rivosinc.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/7] KVM RISC-V ONE_REG ISA extension improvements
Date: Wed, 12 Jul 2023 21:40:40 +0530
Message-Id: <20230712161047.1764756-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_091109_633425_1104A2D7 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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

This series improves the ISA extension ONE_REG interface in following ways:
1) Move ONE_REG related code to dedicated source file
2) Allow multiple ISA extensions to be enabled/disabled in one ioctl
3) Add more ISA extensions to the ONE_REG interface

The series has following dependencies:
1) PATCH6 depends on
https://lore.kernel.org/linux-riscv/20230712084134.1648008-1-sameo@rivosinc.com/
2) PATCH7 depends on
https://lore.kernel.org/linux-riscv/20230711153743.1970625-1-heiko@sntech.de/

The PATCH1 to PATCH5 of this series don't depend on any patches.

These patches can also be found in the riscv_kvm_onereg_imp_v1 branch at:
https://github.com/avpatel/linux.git

Anup Patel (7):
  RISC-V: KVM: Factor-out ONE_REG related code to its own source file
  RISC-V: KVM: Extend ONE_REG to enable/disable multiple ISA extensions
  RISC-V: KVM: Allow Zba and Zbs extensions for Guest/VM
  RISC-V: KVM: Allow Zicntr, Zicsr, Zifencei, and Zihpm for Guest/VM
  RISC-V: KVM: Sort ISA extensions alphabetically in ONE_REG interface
  RISC-V: KVM: Allow Zbc, Zbk* and Zk* extensions for Guest/VM
  RISC-V: KVM: Allow Zvb* and Zvk* extensions for Guest/VM

 arch/riscv/include/asm/kvm_host.h |   6 +
 arch/riscv/include/uapi/asm/kvm.h |  35 ++
 arch/riscv/kvm/Makefile           |   1 +
 arch/riscv/kvm/vcpu.c             | 529 +----------------------
 arch/riscv/kvm/vcpu_onereg.c      | 695 ++++++++++++++++++++++++++++++
 5 files changed, 738 insertions(+), 528 deletions(-)
 create mode 100644 arch/riscv/kvm/vcpu_onereg.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
