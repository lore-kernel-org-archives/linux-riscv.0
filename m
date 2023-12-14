Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22424C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 10:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3zyH0DFEyo1tsMhY0M/uiIK7/mFjplySlEKAyJ1RSs=; b=GbcaZ/UeYtJGBZ
	suvCS7UYxAyD9iSafRjDOfKfPTGtWp8HVTLYxgaN6Ttza0O8JqArQihp0lLiWQCNJbAy03r4JrSym
	+MVXyJZ+qcwaR5fUvHnm2RaMvK652RNz5fuAn+zgbeGr5dIhrl+cQ5m83tGgTn55v2tqGLH3EesRX
	+VRs28m5XLRc7GAOmlAj8CL0mlcteW7Wczx+9w9L1IXxaNNU96uuJDCGHCluTA17UPhTJITnTGS2E
	P0Hd1R103e7QG1zK+zI6DBLWdG6R7k70xluwBXkWD4PfhpQynC+93BrdM6ZqL/YYDK1bUEIxjXGNA
	mFz8scqdKGqLFTTbXaFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDilG-00HRSy-1P;
	Thu, 14 Dec 2023 10:16:10 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDil9-00HRKa-1v
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 10:16:04 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-333536432e0so7173906f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 02:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702548962; x=1703153762; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hx79abP2JnQDv60fnp0e25hp/gEQsdJWCSNhtAMvtKE=;
        b=VeH4R7uTFA9dlY1GLTX6qh15Cl6DJRzV1atThSRmPs62O15yRWT/qGiksJJPFFbJlL
         3QyCI8F/U2X1RdMQee0gJMuTOPnIyDAALaDeT9p6jCD7iHK9Jw+FxjsqwWR5ZDXsMYFb
         WjkyTf3fuIpSzdP7XEHks5pc5H/PH6e/mhx/Qu5LVBp+Yd0rGQ72x26xNGzOkWu4TLyY
         C+lVU3/UeoNVIZnC8Q0zwbUPiqKHzxLSMQD+6BZdLLr1WNuxgv5LEGex1KDhs9aTDWv1
         fFay0XUfuNTQc/knJ/tP1FAoTFNiItvFN6gVBEhxQf/FBAnhz2bLU2+D+o3gihUCcu9u
         lWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702548962; x=1703153762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hx79abP2JnQDv60fnp0e25hp/gEQsdJWCSNhtAMvtKE=;
        b=PJPcxOfswonVFLD+K+f7A6Kor63gYWCYxiO2fyDuz3T8qzLj5OiR+DsFbmgXZfte7G
         YIbPMIzDgD4VkrOIgDkNKTfDLsEBDMY5XKjEgDH9BYskU/gOnJiSayGt9xTC6GtoinjB
         HSoj06Eev7j3z7uOSqryUa92tocZQBxoXNjq536/bs1B0zZFRounlzDf6IF4667Bm90H
         BcBfPKceUhI5X3jTJeEXWUzh9Xjx/Z7HeitKrNw/Zg2L/PPOR+DN9j3PTxLuuSlU5jMt
         7p2kDc6jCCXhEQ0l4dhZr0mP4qo5dl68NnVTCdRGkHT+HOqYJG94z6yEzEPvm9sRJ6d4
         IfyA==
X-Gm-Message-State: AOJu0YyyfBdKyY8i9iKgaY8wz8TpmYL8ps74LncuZZXbKF7Oxt76YZwG
	1GgF8QFlGN1fxKE4RNMVJXPNH1c/3XbR42wXph0=
X-Google-Smtp-Source: AGHT+IFF4leJuBes4jdP4P+sdaOzCkkm+rXp4maTBymg0v5E5HnoiVKGX/tmKr5qr6ESyYY5Yk0quQ==
X-Received: by 2002:a1c:7906:0:b0:40b:5e21:ec30 with SMTP id l6-20020a1c7906000000b0040b5e21ec30mr5270280wme.98.1702548962368;
        Thu, 14 Dec 2023 02:16:02 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id j8-20020a05600c190800b0040c58e410a3sm6758401wmq.14.2023.12.14.02.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:16:01 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	pbonzini@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgross@suse.com,
	srivatsa@csail.mit.edu,
	guoren@kernel.org,
	conor.dooley@microchip.com
Subject: [PATCH v2 06/13] RISC-V: KVM: Add SBI STA info to vcpu_arch
Date: Thu, 14 Dec 2023 11:15:58 +0100
Message-ID: <20231214101552.100721-21-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214101552.100721-15-ajones@ventanamicro.com>
References: <20231214101552.100721-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_021603_642860_4DCF2B6C 
X-CRM114-Status: GOOD (  12.21  )
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

KVM's implementation of SBI STA needs to track the address of each
VCPU's steal-time shared memory region as well as the amount of
stolen time. Add a structure to vcpu_arch to contain this state
and make sure that the address is always set to INVALID_GPA on
vcpu reset. And, of course, ensure KVM won't try to update steal-
time when the shared memory address is invalid.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h | 6 ++++++
 arch/riscv/kvm/vcpu.c             | 2 ++
 arch/riscv/kvm/vcpu_sbi_sta.c     | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 230b82c3118d..b10026fb6412 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -263,6 +263,12 @@ struct kvm_vcpu_arch {
 
 	/* 'static' configurations which are set only once */
 	struct kvm_vcpu_config cfg;
+
+	/* SBI steal-time accounting */
+	struct {
+		gpa_t shmem;
+		u64 last_steal;
+	} sta;
 };
 
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 6995b8b641e4..fec4f5fd0fa7 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -83,6 +83,8 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 	vcpu->arch.hfence_tail = 0;
 	memset(vcpu->arch.hfence_queue, 0, sizeof(vcpu->arch.hfence_queue));
 
+	vcpu->arch.sta.shmem = INVALID_GPA;
+
 	/* Reset the guest CSRs for hotplug usecase */
 	if (loaded)
 		kvm_arch_vcpu_load(vcpu, smp_processor_id());
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index e28351c9488b..157c199be0b4 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -10,6 +10,10 @@
 
 void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
 {
+	gpa_t shmem = vcpu->arch.sta.shmem;
+
+	if (shmem == INVALID_GPA)
+		return;
 }
 
 static int kvm_sbi_sta_steal_time_set_shmem(struct kvm_vcpu *vcpu)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
