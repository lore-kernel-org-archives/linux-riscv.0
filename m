Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FF2C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 10:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TcNrb5klmOsS7zD8QB0sVn2G5rF216WKfwE5h5YKRrw=; b=zo8/sjLekjfFaY
	5fI30bz3XJAPYYAeXe9glqlpTckkjQhGabeAEoSPentUA8GFxsuOs0Dg91hhOhiYnk4q3JBeiG4dI
	uRCU5/PJBr1v86lzL0DSd/EGvjIuHgfNs23yKhnQavPaUrR7/Efaw+v828BqmZXxz+sw3cNmCLOTB
	dPCfP0rbHwvWHs/a8ZbRe+yw93EwmdYRvU31Ji+ID2uJA90CDIcABM4aq0MsA2LM7GMvniW31xGyG
	k4nDaSZsm+DzAe6b5F3L1dAmFFL1j0DkNPYuz4OqcS+HFb2UnDX+xGsfW55vJQJ2V508ZWTfpVpni
	dAbWrXkAQaFYr1iZ0vCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neDRq-00DAYD-AI; Tue, 12 Apr 2022 10:08:34 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neDRl-00DAVG-Pq
 for linux-riscv@lists.infradead.org; Tue, 12 Apr 2022 10:08:31 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 mm4-20020a17090b358400b001cb93d8b137so2326965pjb.2
 for <linux-riscv@lists.infradead.org>; Tue, 12 Apr 2022 03:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y8/JYtLwGTr+r9WhKddIHXBLC5TCTeFp3FTZ8BAk6HA=;
 b=BWQF6hyEhV41fw/Vfjf8js/WHVuO3KDWVkQ8iaSse8fQWRUMxww5Qo6CNykQ17EiqJ
 R9plY4ivF9hhzBQTg1z4+y6mKIq64h787PG2tMSkM21BHRwuDGku3NMVlkP3l2pUgZOr
 0uS52KvkqEcGka6JR8QD5Suprc65T9w/aFdLzxiyKHmZYNHvqkwYPzD3ZC1QXAMSuioi
 oxCseOUn1dQARtF/OdcH0P1WWbsgSOSymXv1WylLOHKcVTOM1K+1+5zNFRKwXh3K8CHw
 P2lU4Oksd7J26mj5hEnZmKUemEGP293GCRcM9Ix94AXPVy8w6j8ZGMy7mTjFDfuo4kOt
 j01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y8/JYtLwGTr+r9WhKddIHXBLC5TCTeFp3FTZ8BAk6HA=;
 b=ersvLQd1R7oLU0FarKaZjPgmYqpHMiB4tz/EsBCUQIcykws7+C6TsnHzKnBtmai0NJ
 urfd0OfDozzkPg4juuA6FdC08r8rgYP2rXQS9ZsEjTatvkGxZHLt8sd0LoArhJoYWhfs
 COCJ/GaCYouyJbQeoxxz3KkUHshi15mRh5kXvV6bJa8BbITpsop9CdrUdeWJPfb7Mogx
 yiceKMRN9Mek/+eXPLedj0n+75I09M7Z7KF5yP2N04ADZCAeHpoBeXLe04ZH6401OZmT
 mqU48F1asZW2DLWiK0F4mg3xUHNSKUBBpzJhb6AdyVIUzISkFCQAqb2G9Uls65W9KOnr
 znzw==
X-Gm-Message-State: AOAM533tBELVxw7/Lk03MXIln0VRwT7mOtOP8XCOEFT/rWU3DGbJVwga
 zHUV+S/qg5Qy0I2ck842bLK8Yw==
X-Google-Smtp-Source: ABdhPJz9BsX5BLP589MLDfJnGsKt1qLr3mtq0HfL/T8EgEobf38Mq+9s+26t59TCgZOSJxq3Z6xS9g==
X-Received: by 2002:a17:902:8684:b0:154:af35:82ce with SMTP id
 g4-20020a170902868400b00154af3582cemr37178055plo.137.1649758106758; 
 Tue, 12 Apr 2022 03:08:26 -0700 (PDT)
Received: from localhost.localdomain ([122.182.197.47])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a056a00130900b004f73df40914sm37515088pfu.82.2022.04.12.03.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 03:08:25 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/6] KVM RISC-V Sv57x4 support and HFENCE improvements
Date: Tue, 12 Apr 2022 15:37:07 +0530
Message-Id: <20220412100713.1415094-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_030829_928831_CDE883EC 
X-CRM114-Status: UNSURE (   9.33  )
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

This series adds Sv57x4 support for KVM RISC-V G-stage and various
HFENCE related improvements.

These patches can also be found in riscv_kvm_sv57_plus_v1 branch at:
https://github.com/avpatel/linux.git

Anup Patel (6):
  RISC-V: KVM: Use G-stage name for hypervisor page table
  RISC-V: KVM: Add Sv57x4 mode support for G-stage
  RISC-V: KVM: Treat SBI HFENCE calls as NOPs
  RISC-V: KVM: Introduce range based local HFENCE functions
  RISC-V: KVM: Reduce KVM_MAX_VCPUS value
  RISC-V: KVM: Add remote HFENCE functions based on VCPU requests

 arch/riscv/include/asm/csr.h      |   1 +
 arch/riscv/include/asm/kvm_host.h | 119 ++++++--
 arch/riscv/kvm/main.c             |  11 +-
 arch/riscv/kvm/mmu.c              | 264 ++++++++---------
 arch/riscv/kvm/tlb.S              |  74 -----
 arch/riscv/kvm/tlb.c              | 456 ++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu.c             |  34 ++-
 arch/riscv/kvm/vcpu_exit.c        |   6 +-
 arch/riscv/kvm/vcpu_sbi_replace.c |  40 ++-
 arch/riscv/kvm/vcpu_sbi_v01.c     |  35 ++-
 arch/riscv/kvm/vm.c               |   8 +-
 arch/riscv/kvm/vmid.c             |  30 +-
 12 files changed, 791 insertions(+), 287 deletions(-)
 delete mode 100644 arch/riscv/kvm/tlb.S
 create mode 100644 arch/riscv/kvm/tlb.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
