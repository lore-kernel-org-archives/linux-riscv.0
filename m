Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBDACA0EE9
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Aug 2025 12:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tU2VmWSUulLcB7j17HqzoMJ4MnBDSiPtRju6tFf6fac=; b=At+uv18ZjsVSYx
	Uw2FsJPHbtDi1tFYqxc9DCzOwsO/JZmQsWSakz2jIhF5d5DsOWfFZvK7VYzZPbjkNPEp2Vm9zQMs8
	yJtoEZvYCMjPP233HuTPfZpjUUHINF2ZcHBu3G6Hejlcpd6YiUCJNyASTNBIE5lVe4+v5eMnrNVhV
	bEHdWFQ/UjQZ0qYlW8tyQxPYo7BBpf+a83Sp40zE/0m9yiVN42K9/MrEeWKpgGxxukKA3wu+IQXcC
	tkpwKqRyP/OVJW5SDF3LSnmlBnBGcBdBO08vVzEVdPQ95H6ysLi1UsX+pWFSRIopNBK534M0kqcvz
	WQ5eW5G7f7TEJxVk2J0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unca0-00000005etO-1Kgh;
	Sun, 17 Aug 2025 12:33:44 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uncZx-00000005esd-2gkQ
	for linux-riscv@lists.infradead.org;
	Sun, 17 Aug 2025 12:33:42 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-321cfa7ad29so3146627a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 05:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755434021; x=1756038821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7WbiJIeRAyXPasTR+StFJQvgx7M5MTQOS33x2RRGox8=;
        b=cP6hU/rVgCPnLmgZfjagw6kygp/XbuBcHkCn92L6OT3WgMWLPFJ/xnqQYlEXuotkSv
         gNfFGp1sIrWxyRlKHbXl03rRcDGJRgTMlLzSKnx6PTaucoKz+eqxxLq1ArTxojKf77SZ
         gnSRTl8nY9KoRM/6u1UUPswSuCZjsgzmO1gSZ+jr96rFAq1js1y+CllDyV1fjvbzjbay
         C6RRc86vx5f7h3f1dZWF0p3IF/wrEe73FRDUYNHsHqhODnUfZ7vX+hGFMGJIh2qDjETI
         ndvQwYvjuMLaG6AVq/25zpXbvGmtpL3qtz4SAQmlXOB7mwNqFMtK+bs6zGqxE+BHYKQf
         cM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755434021; x=1756038821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WbiJIeRAyXPasTR+StFJQvgx7M5MTQOS33x2RRGox8=;
        b=m/jnRo7WA2+pDnf0n3oCQMO5AKDc2GL+F0zM+DxfmBv7FQdkUUZD7RJKx14VtKG7GK
         EGbEjeipjxwGKvUeNSFJVcagLkm8faj3ZY7v46OUkISrvEFm/XYnUK2JW4/ryzS8JQAq
         kDJjPEdLMlSNik5/HQk7V9R+dEBAtavtNBQlThipYVfa2X4GJLQ3h3p/ws8/NHN7D3D8
         W28UUrJdCY11ITNO1malWF8aXEoVYhbp5vGBFa2Xtt8UN4K2QkUlcXa8+YjdFXCUcMHU
         cH6mA98Ro0MPHUho3TJPHnOGDoH186zL4vi+2LS8QY9YafKtK2KcI/bdAnuBhba8KQyC
         1/ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVR8wZUnJkrYYQXyz381bp99vyHtAIR1+TeOXVOM42OWvwm4KBDriJnFSvmlozCAM45zu+auICVTloG3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLbLpyUU+e8mAIBdROIVhzvpIq6lWG46J35GM77XHBPgDNSz4l
	lzDf2q9yP9+V3mynFoQlwRXm6y20WYNIy74/dnybyvbMWWfJwKjSNKz0hY32INDF0DY=
X-Gm-Gg: ASbGncsdJ10MKH6sru6Lt5NRMrBnMoaloNxcZZ3HSYGUVW5mr+GWs5nNZjfoPHaOwOB
	F887DHC5XDngOH2c3B90eXYDboRCbgdxd9KohSqdMjium3sv5MxStc8hcQKM6PeCPSHjroJAbHK
	0y7l2uN5ZrJzp2tA2IM+XE6SionAe+ccsHPueQuuvV83GAY0a9uKjwm8n+MlWNnqHZK8cTleiPA
	tGMl8Svary8Z+qwB/VUun3p64aDPzJ4BekmL3NRzrZcwJGju5ULVtEpNY8a7JYU4oEe5gthvZwy
	VLKpu0hjGOVc5SBNUi+oupDux6F5Ob37p8DgrSP/O7KlWqdNyxmkiFhnWhwoIaOvxoU1mZ6/LVI
	TP8DNj2mD8tAleffLw9sgETc+jHU0qTmOKveOSk8+DDSYios59zvIjXw+W8ZpR1V97Q==
X-Google-Smtp-Source: AGHT+IFVbDDjII11gSvR9Q4jewkTQtbKL3ViUFZFZq0yfpKxvIKgRxHNfx519E/5M9iV986Io2UJ3g==
X-Received: by 2002:a17:90b:3c8c:b0:320:e145:26f3 with SMTP id 98e67ed59e1d1-323296f24bdmr20313460a91.8.1755434020703;
        Sun, 17 Aug 2025 05:33:40 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3232b291449sm4480912a91.0.2025.08.17.05.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 05:33:40 -0700 (PDT)
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
Subject: [PATCH v2 0/6] ONE_REG interface for SBI FWFT extension
Date: Sun, 17 Aug 2025 18:03:18 +0530
Message-ID: <20250817123324.239423-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_053341_676929_7D962E07 
X-CRM114-Status: UNSURE (   7.72  )
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

These patches can also be found in the riscv_kvm_fwft_one_reg_v2 branch
at: https://github.com/avpatel/linux.git

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
 arch/riscv/include/uapi/asm/kvm.h             |  14 ++
 arch/riscv/kvm/vcpu.c                         |   3 +-
 arch/riscv/kvm/vcpu_onereg.c                  |  60 +-----
 arch/riscv/kvm/vcpu_sbi.c                     | 172 ++++++++++++---
 arch/riscv/kvm/vcpu_sbi_fwft.c                | 198 ++++++++++++++++--
 arch/riscv/kvm/vcpu_sbi_sta.c                 |  63 ++++--
 .../selftests/kvm/riscv/get-reg-list.c        |  28 +++
 8 files changed, 433 insertions(+), 127 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
