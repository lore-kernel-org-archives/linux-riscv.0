Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B27C5B552
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 06:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJ3L7uVjHN1xabIUczQWANGbFeg+NHTzB7uUnNKhEr0=; b=Qx6HSAKvyYd78q
	CtRMO52XCyeksgxI8l4Hxjsxm8ynm5Iwo7hcIJ7GhRWGV5y4CbXk/lvcxPvZ6+HnQ3j5VDcRKn6XJ
	1mwMR0odNZVkjq/Ydc2TV4bw2M8Y2mRvgs/oDRq9ntBjTSxFdYAuBDXgwgB2W73gGKG6cm8iEwe/U
	WSU9p/OOnMe5p/pKjKGU2Fp0CrqAgtVOGW27MocDYsw28GaDn6vNQUXQcuCqy7/EURkVZaY2uyvKi
	8ulmp0BtV9PnYh/I+vMIcVsELgQVzN7ZxCPioNJMdfjKRvhbq/vTXxq+mWevz2Org6TDkYd4NjI2C
	EgVmqzVzFKGMGCARc7Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3sv-0000000Ep0I-1FXP;
	Thu, 05 Jun 2025 06:15:29 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3sn-0000000EorE-2Ypu
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 06:15:27 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2349f096605so7050005ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 23:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104121; x=1749708921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ete+JrWOt0QHSA4tomw5kPck/IlNBcpn3GaqoFoCnO0=;
        b=F+cHE0ljD0vc9aeQuK0pbcFehZe/weGQPGaDXbJlYAXLO6hkBJGorHHMA6+9CVffyb
         aV+WAOGl3KgvYf4q9FaGlpK6FQ93PY4TgYUtc04HyUiiLgSRTrrNxSRV2jn77tSLKHDm
         gkbSlOHCvP8Gnug8E6JeHplbwWFokuNmzhitZN+VoKg+IonwY9aG2xlKvoSERpuJdwIG
         xUvddA/HBpnCxHz3hlIn7qcEQab0oKW5vAE4XyY8SCLlyV6mSFpSfMXKHn3k3y1TW9Uv
         DMUZOWi66SLPX8PIu/3WDp6e+sHyNsE1UpMul9lWbOK2dweNSLu9V1nGcHX/3v5PfoOy
         JvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104121; x=1749708921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ete+JrWOt0QHSA4tomw5kPck/IlNBcpn3GaqoFoCnO0=;
        b=n3UjnQAMYBZt63Iv+Vg3u03FQsYtN7o/FDdkDMEyYV9fQdPCfhJK6e8GQAEv2TqZoC
         NP/E1saAl89hCm09MOREUpSILKbr1BdO5i3vTqNxXwNWZNO2rT5jnM9yeDZlmTAwd89V
         lDw+rWcDf11PRGgPxGTqaNCMgopgnvoAe4S/B+UJpzJNxAaTFEBabioTigMBh0rZODfi
         W6Ut4vLk0WffAMPK3/RtsWzt6dwWOpp87qtks4FDBcnk3kTyHrw0pSMJDOEVYpctQR+J
         jw4JD7xy2vadzVE1XZ+s4L6akK9c67AiZHzUPYb5Oimr2muI9h2G/I8z005UfseWq0MU
         pqGw==
X-Forwarded-Encrypted: i=1; AJvYcCX9ONnmtzU3ZC0cXKj/dYe9L9BMr2sA7jhkDVj39UkX7QQbJPPw0/4nks7oMF1Mh54UmjTI154IJhXxLg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/niF19YGG1Q1PsTq6txWFRqwrEaaJ9/aQRzeC3Yn1cSF89cPn
	+dH75Gnyff+PFMerGHWyG476QZ5P+4w9D3AhbmrRxug8LdnQpn2GB5ceDnDrfoI+oyQ=
X-Gm-Gg: ASbGnctET8WQtgygW4F0+RKiphtKuMNYF/vi5OU8uGfuTzcmt/3zLNSYPyRqIyt5qzY
	A27EtNjs5Db6tGAlFo9MXvulEYWDCk5GL4FYdy6+ZGCVoQEphVbbOSFdrGO8shnQUFvkgljq8FQ
	P5CSB95fJMqBmuZrVJk936/hmugHtZfKlhEOxb7SfP+ye3k/uEPLaeU05FSYirB60bsdU3YT8wB
	vOtkHIcoQUjEE0XIIaCKZ0uJAz69iydMZ04UcUWzy2jxg3KkxBz0BHavheunLXZ3vdszJk2EOaq
	rBnNPlG6klg5krLDF0AOmDKURQSV1GvSUqZhfaE33Nfg1lOicSy0wdd9tDZK4N/grO6AI+9EGSD
	wAM1X4w==
X-Google-Smtp-Source: AGHT+IH4OBU+MycjQPriNgZTJHSLbifpeWqdkPpUgu3tCEdkhvV1zsaXs7ozI9xOz34l1HXvk8nshQ==
X-Received: by 2002:a17:902:da8f:b0:235:f078:4733 with SMTP id d9443c01a7336-235f078524emr28994305ad.8.1749104120604;
        Wed, 04 Jun 2025 23:15:20 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:20 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 04/13] RISC-V: KVM: Drop the return value of kvm_riscv_vcpu_aia_init()
Date: Thu,  5 Jun 2025 11:44:49 +0530
Message-ID: <20250605061458.196003-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605061458.196003-1-apatel@ventanamicro.com>
References: <20250605061458.196003-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_231521_661337_1C622F0D 
X-CRM114-Status: GOOD (  11.32  )
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

The kvm_riscv_vcpu_aia_init() does not return any failure so drop
the return value which is always zero.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_aia.h | 2 +-
 arch/riscv/kvm/aia_device.c      | 6 ++----
 arch/riscv/kvm/vcpu.c            | 4 +---
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
index 3b643b9efc07..0a0f12496f00 100644
--- a/arch/riscv/include/asm/kvm_aia.h
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -147,7 +147,7 @@ int kvm_riscv_vcpu_aia_rmw_ireg(struct kvm_vcpu *vcpu, unsigned int csr_num,
 
 int kvm_riscv_vcpu_aia_update(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_aia_reset(struct kvm_vcpu *vcpu);
-int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_aia_deinit(struct kvm_vcpu *vcpu);
 
 int kvm_riscv_aia_inject_msi_by_id(struct kvm *kvm, u32 hart_index,
diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index 43e472ff3e1a..5b7ed2d987db 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -539,12 +539,12 @@ void kvm_riscv_vcpu_aia_reset(struct kvm_vcpu *vcpu)
 	kvm_riscv_vcpu_aia_imsic_reset(vcpu);
 }
 
-int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
+void kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vcpu_aia *vaia = &vcpu->arch.aia_context;
 
 	if (!kvm_riscv_aia_available())
-		return 0;
+		return;
 
 	/*
 	 * We don't do any memory allocations over here because these
@@ -556,8 +556,6 @@ int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
 	/* Initialize default values in AIA vcpu context */
 	vaia->imsic_addr = KVM_RISCV_AIA_UNDEF_ADDR;
 	vaia->hart_index = vcpu->vcpu_idx;
-
-	return 0;
 }
 
 void kvm_riscv_vcpu_aia_deinit(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 6a1914b21ec3..f98a1894d55b 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -160,9 +160,7 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	kvm_riscv_vcpu_pmu_init(vcpu);
 
 	/* Setup VCPU AIA */
-	rc = kvm_riscv_vcpu_aia_init(vcpu);
-	if (rc)
-		return rc;
+	kvm_riscv_vcpu_aia_init(vcpu);
 
 	/*
 	 * Setup SBI extensions
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
