Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2571AC43334
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 14:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y3rfz/aUTBpFgM6oRqFLAAYyDO4f7EDftIDDImDtBa0=; b=Rspx0PWcVwOUWF
	CY9JnuRDabY188Sr+HWNbGspkte3gP1LpeNLObFjDUQcANxmfcIweCu+B6h3Q67otooOPe73BTUMS
	xLoiqPiAn0tH3ght15EqPEvtc04x3QGAxezb6AojP+wDzLnf7uOUU33PcJncRlmBQ5NtrruuZFgXP
	Kc4Zsyb+5jGiCJfvrBf45ScoHyatqZN5mGzXBOxxF7h2MFrTz7mNld3QC8xMeqHpXGwP4nAf+g1dT
	J7RVawYQB9KoPy+U4L06wfTrRSqrk7uiROmj6WZD7nQT/WfMC9RxMpMoRX79D3qSVjAFroagHkwMj
	evWOiXvsiiG/ayrVWNfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Ssb-00GdB4-E3; Thu, 07 Jul 2022 14:53:21 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9SsY-00Gd9O-65
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 14:53:20 +0000
Received: by mail-pf1-x433.google.com with SMTP id g126so5455324pfb.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 Jul 2022 07:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2/cSQRYg50JuMF0k4CiBLOOMScUk3mXsGoE8DMLTmGQ=;
        b=er9nqWUP8eP6usOXt23apNRzaB+sp9s0z7ZvXZctGj3Om3+CrQ463jXIqaq0Olo7cA
         eLVU8m4qvUPEKhD35qoudlMRRWzhftZF2RzvL1qICwipTKw6ml05b8wHU8hudZEuGfON
         +xDaFvG1KOiNdB6l6W4oYPYwTd3zUsifB5zQzeTYpLjCnllDQv9fv4dSmKe5BQIPOInq
         juBSjYjMYn3KOEJKZGUW/wKoq0bI1MT2nuOZ3Wa43ilVxvbgUDkKdKBBAYtJq5UewcQg
         nCDZMgk0ulSCy9Ded1j4Vm1hK33lAQREgPfY7MB3Wh3rBZjOfUpWcmfX2KahyaibpiRz
         fZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2/cSQRYg50JuMF0k4CiBLOOMScUk3mXsGoE8DMLTmGQ=;
        b=ygC988a8EcTmK6YouVSJw9/MxvJUvnn69rRGcW7dKLr5/ehuSi/ZnR+//WmbbyT+g0
         GXj0ql6IRQSb6c1rRllaTH8W/7EvaSDJRn9uiJxpiEo0lml5TAay9FwgqeT59zBeM6OX
         q/YFK6jFq+gbrRR3WgZh3bDf2yWbBmobwy2qGsjarAYufmbI7saEKwuxOvNK6sRCbstK
         UeXlSGCWwlzDFsKaSQDmisq/NfbxMl7WuZ6dW7HGtk1FSG/zR1rOwqZrsgOGOVSm2Vuw
         0nNK80dgGf3qdpPUu7mUWC5K+hQfjAl6DjMwV/q2nMkhTFzwCwAxis+eoNDywh/aIhlr
         jnTQ==
X-Gm-Message-State: AJIora9AqNjJyjhA/7QsqT6CmhxO5tjNKrcOYrB+uNMelNCl3z/BvPkV
	Vre2D6Ey3naWRtSHJtPvwLTRnw==
X-Google-Smtp-Source: AGRyM1vOJj+bmEomGF03XvBXPTdyrfwYNBaHdnZBlfX7sgIfcCWLhyRtqza8tkvG3CxVepetxWkL0Q==
X-Received: by 2002:a17:903:110c:b0:168:fa61:1440 with SMTP id n12-20020a170903110c00b00168fa611440mr52729714plh.149.1657205596753;
        Thu, 07 Jul 2022 07:53:16 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([223.226.40.162])
        by smtp.gmail.com with ESMTPSA id b26-20020aa7951a000000b0052535e7c489sm27144231pfp.114.2022.07.07.07.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 07:53:16 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/5] KVM RISC-V Svpbmt support
Date: Thu,  7 Jul 2022 20:22:43 +0530
Message-Id: <20220707145248.458771-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_075318_251588_39D0A749 
X-CRM114-Status: UNSURE (   9.65  )
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

This series extends KVM RISC-V to detect and use Svpbmt for both
G-stage (hypervisor) and VS-stage (guest) page table.

The corresponding KVMTOOL patches used for testing this series
can be found in riscv_svpbmt_sstc_v1 branch at:
https://github.com/avpatel/kvmtool.git

These patches can also be found in riscv_kvm_svpbmt_v1 branch at:
https://github.com/avpatel/linux.git

Alexandre Ghiti (1):
  riscv: Fix missing PAGE_PFN_MASK

Anup Patel (4):
  KVM: Add gfp_custom flag in struct kvm_mmu_memory_cache
  RISC-V: KVM: Add G-stage ioremap() and iounmap() functions
  RISC-V: KVM: Use PAGE_KERNEL_IO in kvm_riscv_gstage_ioremap()
  RISC-V: KVM: Add support for Svpbmt inside Guest/VM

 arch/riscv/include/asm/csr.h        | 16 ++++++++++++++++
 arch/riscv/include/asm/kvm_host.h   |  5 +++++
 arch/riscv/include/asm/pgtable-64.h | 12 ++++++------
 arch/riscv/include/asm/pgtable.h    |  6 +++---
 arch/riscv/include/uapi/asm/kvm.h   |  1 +
 arch/riscv/kvm/mmu.c                | 22 ++++++++++++++++------
 arch/riscv/kvm/vcpu.c               | 16 ++++++++++++++++
 include/linux/kvm_types.h           |  1 +
 virt/kvm/kvm_main.c                 |  4 +++-
 9 files changed, 67 insertions(+), 16 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
