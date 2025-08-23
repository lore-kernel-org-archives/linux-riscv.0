Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7F6CA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 16:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3UA3IKCtFlLSqCDFqdYh8HzToMMWw6QWaCQkIa+aods=; b=gZ10ttvY3yIyFg
	sBAMOKAxqtFurXyjal5h+gKG7+dgmgeXAKBgNuhDaxWISO/DQsgXXBp80YQkUR+12yxnW5kpE7Kgo
	XGiuieD/wYlTSBLAFjlWNKbn5ELbhrlpCnl4FmUglyQjUPZodabkKsD7kEEwM7MliRdIpd3mjSr4+
	ervkqKhaKKv6lhaWmvKoUHRfiTJRwP76l1zOD44vq/RJXubLVsVfkzMyHI0sdLtqR4qEBD/cuOuDE
	SbKu5p97Cjga75IPClIjYBuEuk0rLuno3vAom34VNgajXQa9YaVgZm/WM2i59g3eEhxgT+FJexmnE
	Ap32s9PG7MVsVNAjs0zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uprFa-000000052ux-2vsm;
	Sat, 23 Aug 2025 16:37:54 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqew-00000004xOO-1Pgp
	for linux-riscv@lists.infradead.org;
	Sat, 23 Aug 2025 16:00:04 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-76e2eb6ce24so2425086b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 23 Aug 2025 09:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755964801; x=1756569601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H24QVG/T3cxixN5Hjl4PI98/BCvc+2mgYT4CjAn1N5o=;
        b=j7up+h5dyQnh8jJz6fueYS4ngmCqgbIIVhNSm+thxyRj+hgdoyOfvk/+9t1XxQK3Dy
         iamsLt0gWg4TjpupzBV4AKFvmiv77pybw61/5D/FUcIOFgUYIXPhbZQnMISQFvWnS500
         R7kGSsC40LgUIKIIvIW5RePkdKvOgkAD89/4T3xan1I359Kca+S1i0XwD4vA9r2dV7MS
         D5H9dr5odzoCZlCKXhM3T3Ao/JGvYCAYKDzZ5m/qDzx43dfqPeEVzod3cRhJi+EAiN+T
         +KzdmIQA40LEmbUd0vMFsjFX93ax5msGadRxuQkPn1imh74mbIj9D5dBept32MJfGAGg
         etGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755964801; x=1756569601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H24QVG/T3cxixN5Hjl4PI98/BCvc+2mgYT4CjAn1N5o=;
        b=Gz09DMUKEwVkHWwqjsc6n+NNZ/dceuHbgHALX16ruxIquATbEl5jVXAh4J2N9AjtVV
         1v8EOvdeQFAev14CVBoS6MfqPBz3rK5BGxe1+wFuJv+R1ri54cQUxiZQmWYEWqGeydK+
         tsNU8CK+j5kCKC2gZJxyCP5M4oBrgow6cq2Ub8RjD33pj1dloQuwRfhvbEMMei8dCxrC
         bKhyZm7DlmsEcF2Nq0KxEOLbwKuwErInLW+htqbhTD+ZF7yMpApVce1h5ej444mILurP
         IGCiN29QX78bRx+VilVTqui5Jt9JXrcuXX9zfuuPSQq92gPzfzbEGSUpy5mLAe+j/xyQ
         QBHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGOkImNrx8pw6Zmfph/Nk6RVin7S/Anz/7ofkBwqtK5A5/fj+a5qyDA720SKZ69WwVLVBU+iJ+Lyra0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmHJ013/uBW9rTg/ymHPnsyiINedngS4Ri+Z+d7+wmucDCH+XY
	XljNAE5lqSbzaAeVOtMnPhrCDMkjuRI4IwVdSSZ/aJcnagtEPXuyciHsi6HwLnA8ZK8=
X-Gm-Gg: ASbGnct941pGo6o0EYne4eqU/kSXNKgh1yyWOOO9q+NbX6c/DKutvMZOA0Z8umuFw2u
	wZreIAF2NI1hD/99hecdIo6uptakxSsJAVZs1uL/BB0eKlpZI0SPzG1JsMN+V4nmp+jOhJukJLV
	A2cW/LlbqD7khN9eldUqArvuIJWSjKRzTs0IQOAqo6F/pLEDpmX7TwZ5Z4pGMkpet51cmp3res6
	RrZJXw1Sbsi9pmI429LnUPzCrhLsOAG5sI/WT1C/qpV2v+a6OMiiF0nibo8fvNyUoYpdqwoDaNH
	T833mOIOWPkhZwM+zxK+1ly4Q2scwNtYuzvrnI1H2/QL57qAcIKRvgL1As8cH4W+eSfBTGpYWFr
	d8w3333SO5AO+DpGkgtlpKT7rYBuuDym7aBuibokj0tgAJN7Zcp9+Oxq9v6mKF/0DzcNva5RZ
X-Google-Smtp-Source: AGHT+IHHBn4yz0Tv2mtxye/b3d+njwhsYjSP/E2IAAVTTBKNql/cK/uY7eFReM62Y2BttpdFYMcwWg==
X-Received: by 2002:a05:6a20:1592:b0:23f:fe66:5d2a with SMTP id adf61e73a8af0-24340bce2c1mr9575921637.27.1755964800673;
        Sat, 23 Aug 2025 09:00:00 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77040214b81sm2804464b3a.93.2025.08.23.08.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 09:00:00 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 0/6] ONE_REG interface for SBI FWFT extension
Date: Sat, 23 Aug 2025 21:29:41 +0530
Message-ID: <20250823155947.1354229-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_090002_383759_EE0133E3 
X-CRM114-Status: UNSURE (   8.87  )
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

This series adds ONE_REG interface for SBI FWFT extension implemented
by KVM RISC-V. This was missed out in accepted SBI FWFT patches for
KVM RISC-V.

These patches can also be found in the riscv_kvm_fwft_one_reg_v3 branch
at: https://github.com/avpatel/linux.git

Changes since v2:
 - Re-based on latest KVM RISC-V queue
 - Improved FWFT ONE_REG interface to allow enabling/disabling each
   FWFT feature from KVM userspace

Changes since v1:
 - Dropped have_state in PATCH4 as suggested by Drew
 - Added Drew's Reviewed-by in appropriate patches

Anup Patel (6):
  RISC-V: KVM: Set initial value of hedeleg in kvm_arch_vcpu_create()
  RISC-V: KVM: Introduce feature specific reset for SBI FWFT
  RISC-V: KVM: Introduce optional ONE_REG callbacks for SBI extensions
  RISC-V: KVM: Move copy_sbi_ext_reg_indices() to SBI implementation
  RISC-V: KVM: Implement ONE_REG interface for SBI FWFT state
  KVM: riscv: selftests: Add SBI FWFT to get-reg-list test

 arch/riscv/include/asm/kvm_vcpu_sbi.h         |  22 +-
 arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h    |   1 +
 arch/riscv/include/uapi/asm/kvm.h             |  15 ++
 arch/riscv/kvm/vcpu.c                         |   3 +-
 arch/riscv/kvm/vcpu_onereg.c                  |  60 +----
 arch/riscv/kvm/vcpu_sbi.c                     | 172 +++++++++++--
 arch/riscv/kvm/vcpu_sbi_fwft.c                | 227 ++++++++++++++++--
 arch/riscv/kvm/vcpu_sbi_sta.c                 |  63 +++--
 .../selftests/kvm/riscv/get-reg-list.c        |  32 +++
 9 files changed, 467 insertions(+), 128 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
