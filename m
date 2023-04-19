Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA93C77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DlliyQO6ed8lKVKE+vb49pVw80HWT9nCDvBE/4C4W+4=; b=uaqJHHuZEIvJ9A
	7CBT55U7oFdcODKHq7HrEHh72TcU9mVNwXAV2qhjV3QDhX9+bVRRaEjlSxwR8pgWOunozDsJ77ivP
	TGyPdk3t5XJcYh9qHnXeGCAScrTkhfRKxTIDKAHlQxXuZWpYc+nyTTsEKKJoiqqBOoUribyckf9AR
	8U1hAdrfsx6T+NntjW5zmSKS1NXM0x3LG9J1N5q7uHW037uTREMPzw61w0d8MV8qgg2Fow/3sxBld
	wKzjBeqkbO3mwwRAdWHFZvK0VmobkZtoMvR2VlIwVKc6U9OrNHR3MjHY9jo1IGJ59xLsKGnLIxl1G
	tfjLoox0IMRPPtlbzZXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGDk-006Ujg-2j;
	Wed, 19 Apr 2023 22:24:12 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGDg-006Ue0-2H
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:24:10 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1a52667955dso5477365ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681943048; x=1684535048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sx5yCGWct6pM6GpC/mvdByE459bnHS7kFRJEEmvmIAE=;
        b=3p9iTgdU1fM6SCFnmbdU2SRrkZIz70XAXwuZckkQOMwQBsxli9xyQOj3eelNgilUbh
         Ys8/7Ew5TPJfNpxVGDr0CtIGeK0FA4rEB+OIcbXgq5wyTLnVYPvSZ8aMalLarGl9SYQB
         5RACL91+xtTKghPY756sehNtiuCKsCnVWuoe+lw1F03ENQxtWOfB9WS65O7GV37PILFO
         Dk35L2JW1UKZe1fvGcD1U01nAz5TPWWbGAHGpwD1ZT3uAJFTUyTj5jlwZGRm00f0H14O
         tl+5fi2Hb+F0OmZuIVTWcPUeShVBuC5Hht10Q7j0AV8S9TF+U8wIpbjtIc2XL8zQkszI
         EVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943048; x=1684535048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sx5yCGWct6pM6GpC/mvdByE459bnHS7kFRJEEmvmIAE=;
        b=OswX5YYCg/ptp8BP8w0rkXyadV8odsxJQyqhn3gMsqk4RNs3VYJtl3/irFU0send9a
         QGBrSX4p/ywRXXovbIh44iRpHhAJ/Et7MbKPiJXCIA/3vZSGRbA7rh6cACLEpPCaXtIg
         IJaX9MDFxGIV80zHVGUk1DH1l0UipS/BKxkafVhhwVUUD4QarR40zhFichkA/Yh0+Rgy
         2klroadVE6iFhf+HSKBuxKOEUUlSDbwetmWpVqQo4K50qMi4zB8Ezt6wTkEDkO0DoFxj
         EGEpO4kYf1ST7vLitwF1RvVWYAEqqnnIdjWIYXfEOotjoZCvmJ6yTzEEg0j63CxCPizh
         nKuQ==
X-Gm-Message-State: AAQBX9fG+DMDO2ZLf1+4oqyekky67m1ocJqRrbeXJoVX5/tUX8TAhRjc
	t8uHlz9kOTnoG0IxklnR2G/eKg==
X-Google-Smtp-Source: AKy350YPzGRajmyQ2O5tL/h5sOqIMWA3WFpT3qCLbVNDZ6itlq+/cjeCHlrQkCoL9IBGQLSaGxxwuA==
X-Received: by 2002:a17:903:2905:b0:19a:b869:f2f8 with SMTP id lh5-20020a170903290500b0019ab869f2f8mr5951568plb.21.1681943047880;
        Wed, 19 Apr 2023 15:24:07 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902744400b001a681fb3e77sm11867810plt.44.2023.04.19.15.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:24:07 -0700 (PDT)
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
Subject: [RFC kvmtool 03/10] riscv: Define a measure region IOCTL
Date: Wed, 19 Apr 2023 15:23:43 -0700
Message-Id: <20230419222350.3604274-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419222350.3604274-1-atishp@rivosinc.com>
References: <20230419222350.3604274-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_152408_747975_9431D2F4 
X-CRM114-Status: GOOD (  15.56  )
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

CoVE VM images needs to be measured by the TSM. The VMM updates
the host about these images via a new IOCTL. The host makes appropriate
ecalls for TSM to perform the measurement.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 include/linux/kvm.h          |  2 ++
 riscv/include/asm/kvm.h      |  6 ++++++
 riscv/include/kvm/kvm-arch.h |  2 ++
 riscv/kvm.c                  | 21 +++++++++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/include/linux/kvm.h b/include/linux/kvm.h
index 000d2b9..d4969a0 100644
--- a/include/linux/kvm.h
+++ b/include/linux/kvm.h
@@ -1547,6 +1547,8 @@ struct kvm_s390_ucas_mapping {
 #define KVM_PPC_SVM_OFF		  _IO(KVMIO,  0xb3)
 #define KVM_ARM_MTE_COPY_TAGS	  _IOR(KVMIO,  0xb4, struct kvm_arm_copy_mte_tags)
 
+#define KVM_RISCV_COVE_MEASURE_REGION _IOR(KVMIO, 0xb5, struct kvm_riscv_cove_measure_region)
+
 /* ioctl for vm fd */
 #define KVM_CREATE_DEVICE	  _IOWR(KVMIO,  0xe0, struct kvm_create_device)
 
diff --git a/riscv/include/asm/kvm.h b/riscv/include/asm/kvm.h
index 1dce9a4..2bacc38 100644
--- a/riscv/include/asm/kvm.h
+++ b/riscv/include/asm/kvm.h
@@ -98,6 +98,12 @@ struct kvm_riscv_timer {
 	__u64 state;
 };
 
+struct kvm_riscv_cove_measure_region {
+	unsigned long user_addr;
+	unsigned long gpa;
+	unsigned long size;
+};
+
 /*
  * ISA extension IDs specific to KVM. This is not the same as the host ISA
  * extension IDs as that is internal to the host and should not be exposed
diff --git a/riscv/include/kvm/kvm-arch.h b/riscv/include/kvm/kvm-arch.h
index 9f2159f..08ac54a 100644
--- a/riscv/include/kvm/kvm-arch.h
+++ b/riscv/include/kvm/kvm-arch.h
@@ -120,4 +120,6 @@ void riscv__generate_irq_prop(void *fdt, u8 irq, enum irq_type irq_type);
 
 void riscv__irqchip_create(struct kvm *kvm);
 
+void kvm_cove_measure_region(struct kvm *kvm, unsigned long uaddr,
+			      unsigned long gpa, unsigned long rsize);
 #endif /* KVM__KVM_ARCH_H */
diff --git a/riscv/kvm.c b/riscv/kvm.c
index a9ade1f..99b253e 100644
--- a/riscv/kvm.c
+++ b/riscv/kvm.c
@@ -13,6 +13,27 @@ struct kvm_ext kvm_req_ext[] = {
 	{ 0, 0 },
 };
 
+void kvm_cove_measure_region(struct kvm *kvm, unsigned long uaddr,
+			      unsigned long gpa, unsigned long rsize)
+{
+	int ret;
+
+	if (!kvm->cfg.arch.cove_vm)
+		return;
+
+	struct kvm_riscv_cove_measure_region mr = {
+		.user_addr = uaddr,
+		.gpa = gpa,
+		.size = rsize,
+	};
+
+	ret = ioctl(kvm->vm_fd, KVM_RISCV_COVE_MEASURE_REGION, &mr);
+	if (ret < 0) {
+		ret = -errno;
+		die("Setting measure region failed for CoVE VM\n");
+	}
+}
+
 u64 kvm__arch_default_ram_address(void)
 {
 	return RISCV_RAM;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
