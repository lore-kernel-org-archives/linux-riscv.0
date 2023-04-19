Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56264C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n2qQpppVZbzgl8aORqJ/H6fzIep2agBnpn0Qc8t+MjI=; b=SAaRoW6i35bNPV
	HRwUnkL5WiiJpNTJfxHGc6UxSMEV2XXnXdjzno7l5qAz0ni5/gOULzliNg3ff+hjnZazpzZ+LkGte
	CeWSdG5xo53lKamtEh2YcLmIb2Br7gsxJ+nLX13LmsAz629OiGHwp4LeRZ0iVoqWRV6RGHyoBKvA9
	3VNHV/bSy97hnKInkWL11wajKBc5L/A6GSX57jQH8PLvAq0Kr6RWDUGvokq6PTDSzjWCKQ80RHKy6
	CC9yN1DkfK9COGRKyRR3xoXDpPSQLknLt0n6GWzZIBmD4k87p48u3znEaNUcv80EBF6nQmz/Gx9l/
	4aFAnP+Xmdnor9n0TiXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGDq-006Up4-3C;
	Wed, 19 Apr 2023 22:24:18 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGDn-006Ue0-2d
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:24:17 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1a52667955dso5478005ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681943055; x=1684535055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTLerH+RJ52lhodOQfma/DJulVaHZ1rN37E2HPQ1gqk=;
        b=a1bnzxGWwIOEAkq+19MIVfBP/ZCFCZqLmC1UeQSHZvEerwM1InrDlC+CNQjLasRYNY
         TG6B+BEbccXViq3GxUGM1S1bKt08GMbNh8cu2/7uvz8TADG5izCLZidY7kyXryOk8Cc+
         amepc4YX9EhmwedHzdpQaI6iQRwH2jqt2DPucE98CEAfI6Pi8SQBLcJ1U0kFZji/jcS3
         poVKHT9OeJbpVpJ3SjBehUYSR58tbT8ZMpTvtdSUCQHzPMMVlmcC1HTTyDhFywITeMq2
         sEJhC6uIWIrcV3571Eqlwgn/Fm+q+fD6bbuTOkEai1g6rHX8oYaeAhJEcO5b4iPV/t6d
         oGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943055; x=1684535055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTLerH+RJ52lhodOQfma/DJulVaHZ1rN37E2HPQ1gqk=;
        b=cFqPj8FjY77+uYU+dKkM+cR39YjAhAUQ8ckXtf8TdTX6AZQ4bWC0+4j/RutquthpKM
         AUhwtH0J3fRSN71yeg8rlCSWU9lwRzUXzTp8Lxv0OrlEvnVX4P5cvH+7kpZVvrkL9jLf
         SR8c1Z9hmR8IY0eJB5Pc3AoMi8zJXQq/Virpp+C/1foCFtwRrierxLSXmk3rDAiMwQ0i
         CbtSSsbpd4E13WzGMdZmlp359lgMIWdu42izcP+kgLR9hTiv/eesuOWvD/3amRXWg737
         OQMhauF4kCizfrINcH4rK9uoPi+t/Ht2/1aNgDYgK22YiDhDQJD+x5N+grB+415rl3aj
         VNIQ==
X-Gm-Message-State: AAQBX9fqZ9/dZtAGzJTAsbWtsEJX6g2MgIaQG8WBFZ6jQj+okoQwioVV
	UZRwplWBKwNExQ87Ssj+Jmy2RQ==
X-Google-Smtp-Source: AKy350biCI2sFr3cWCmld5tDykr7Z5GZPcCxF2zAi1qUg8p1jfhx7EqRslonbApZT3U9aoxz+Y7avQ==
X-Received: by 2002:a17:902:e5c7:b0:1a8:1436:c892 with SMTP id u7-20020a170902e5c700b001a81436c892mr5044406plf.14.1681943055547;
        Wed, 19 Apr 2023 15:24:15 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902744400b001a681fb3e77sm11867810plt.44.2023.04.19.15.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:24:15 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC kvmtool 07/10] riscv: Define riscv specific vm_type function
Date: Wed, 19 Apr 2023 15:23:47 -0700
Message-Id: <20230419222350.3604274-8-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419222350.3604274-1-atishp@rivosinc.com>
References: <20230419222350.3604274-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_152415_867424_F89D208A 
X-CRM114-Status: GOOD (  10.84  )
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

RISC-V supports CoVE VMs now. It needs to setup correct VM type if the
user requests it.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 riscv/kvm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/riscv/kvm.c b/riscv/kvm.c
index 5f9b0d5..e728790 100644
--- a/riscv/kvm.c
+++ b/riscv/kvm.c
@@ -39,6 +39,18 @@ u64 kvm__arch_default_ram_address(void)
 	return RISCV_RAM;
 }
 
+int kvm__get_vm_type(struct kvm *kvm)
+{
+	if (kvm->cfg.arch.cove_vm) {
+		if (__riscv_xlen == 64)
+			return KVM_VM_TYPE_RISCV_COVE;
+		else
+			die("CoVE VM is not supported in RV32\n");
+	} else {
+		return KVM_VM_TYPE;
+	}
+}
+
 void kvm__arch_validate_cfg(struct kvm *kvm)
 {
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
