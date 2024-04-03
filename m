Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EADCD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 08:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TepjqFiB/wiOebsiHhAuP8NVGwi7FX73QEkvT+3KLYY=; b=QlpIN2X0Lk1lY0
	KJpgUEiXQZ8JhHlo02tbLWW5k/4qMHUAKfxIneyzbcKK6nqrXH3GUJQg5jqlUbnU8JQfSpKmpAIW3
	mF8hLOXkAfY/JjzZjlU3s/VW5tmTA4JQ8tOBN48OM8m89EY2OX4mmc9bDN6WGmRTNIyTpK1ptCusc
	ryz/JbNuphDu3AKKI0b6yStKcZ+joqXCpsmaYQUrwGC6eecrFWIlxpLZNZzEEWI7Gz9sJDUapnHQW
	DLd9MPewU2afdC5GiKKfb/unxfRHr3Rv7+n6lmYgnfrwqFiIHOB6WFKDWFVmK5mr7ttRvHRvMi/JG
	+fmb0sUXE/aBMsSRyXRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvd8-0000000Ej1n-2YQY;
	Wed, 03 Apr 2024 08:05:58 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvcv-0000000EinU-2SAu
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 08:05:48 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1e252f2bf23so24491185ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 01:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712131543; x=1712736343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwALXHKqCD9Iy5mIzImMbfILjpXmZkM44DIWXWIBe7w=;
        b=sD7UeOVLa771f4kLZcyhcrwrabBOL+pGjbTi6M6Jtfhrwxb8uIsyniif9OjhUVRkpZ
         jkaa8h05Ly43DbA+UPwO3cAJTc1wsxeL7yWQylctcrdSZsIPqlwY81SeoSbbZjsvWozz
         rEd6k0qFsnBf75cix6Xms92oPCEwNvFW+mzaMoLYKkNd2iTwis9c9qnJ6KKNsTmqg5mj
         Fh9Wq0qMN1ahct+pTFS9f5eeF1NIokpXL4bq3QESiIDn97ZIS3gYZ0GOOevcUmKI5sW7
         0YdDzmO821U4NmBH+ECFE/1wmTCI5MOth3v5EHfmk6mNIAlcwLdvzGBb2WacHUhio2fL
         w/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712131543; x=1712736343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwALXHKqCD9Iy5mIzImMbfILjpXmZkM44DIWXWIBe7w=;
        b=vqcx5Xg0RCs2kv1G4ex/sfBZz9/ui9EGiT6/UJYOFi4EyQkVM3dcHW31lUjst5dpy2
         3/gv/8ExnEZNo9HiX0vVATZpmtIXZGf48T8Wwll/Ec42UFYpHsAIM/xKbpQSRfa1IkJv
         rPiB7dGg51hegMtHOD7+R00EzHpevfqRPYorR9ure2MhoazFczwcZDgZqpmgn8fL5jat
         gwztx6YXW8ld+xoccRN99wnDRetHbVKdcBqt0SV3fABj8ah5Vl1mLnvr/KMTF0637ifm
         xxbGsyTsvLDhCHg4bqKLgVxHyQKQKVkm4RkRZ1dk5/EveGvZtEV5Ke4P2QcTf2kPN4R+
         pm2w==
X-Forwarded-Encrypted: i=1; AJvYcCVSPGE0qGQJ2DP6gtBsurSwpeTB26oijJKbhNRPC2fE7WSvk6CdSiZRm7Ii/v+87ik6iH8uEmfW9/LnT99KbaYJZY68HqhCmPSBoW3oK9t8
X-Gm-Message-State: AOJu0Yxw1STgX85A8rsKi8TQjZ8aUv8TCfQ87y/l5hd5rz8vsjbRV5YJ
	bQYskDEWYN55ZN22mWPbMWjj7tLftKbKS9x7tP4zh4GlsYC1D/FHQw00pRWpT/Q=
X-Google-Smtp-Source: AGHT+IFqbJuXOQnG+Kx5BB+hJvgv/ZybZvtn14tS9BuaWyH/U/F2Vi2RSE0rwqy3IKMxLYQ7u8QtTQ==
X-Received: by 2002:a17:903:2283:b0:1e0:b60e:1a33 with SMTP id b3-20020a170903228300b001e0b60e1a33mr2264737plh.31.1712131543069;
        Wed, 03 Apr 2024 01:05:43 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id c12-20020a170902d48c00b001e0b5d49fc7sm12557229plg.161.2024.04.03.01.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 01:05:42 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Ajay Kaher <akaher@vmware.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <amakhalov@vmware.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Juergen Gross <jgross@suse.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	virtualization@lists.linux.dev,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v5 15/22] RISC-V: KVM: Improve firmware counter read function
Date: Wed,  3 Apr 2024 01:04:44 -0700
Message-Id: <20240403080452.1007601-16-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403080452.1007601-1-atishp@rivosinc.com>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_010545_704650_130FC105 
X-CRM114-Status: GOOD (  12.43  )
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

Rename the function to indicate that it is meant for firmware
counter read. While at it, add a range sanity check for it as
well.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_pmu.h | 2 +-
 arch/riscv/kvm/vcpu_pmu.c             | 7 ++++++-
 arch/riscv/kvm/vcpu_sbi_pmu.c         | 2 +-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
index 55861b5d3382..fa0f535bbbf0 100644
--- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
+++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
@@ -89,7 +89,7 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 				     unsigned long ctr_mask, unsigned long flags,
 				     unsigned long eidx, u64 evtdata,
 				     struct kvm_vcpu_sbi_return *retdata);
-int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
+int kvm_riscv_vcpu_pmu_fw_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
 				struct kvm_vcpu_sbi_return *retdata);
 int kvm_riscv_vcpu_pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
 				      struct kvm_vcpu_sbi_return *retdata);
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index ff326152eeff..94efa88d054d 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -235,6 +235,11 @@ static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
 	u64 enabled, running;
 	int fevent_code;
 
+	if (cidx >= kvm_pmu_num_counters(kvpmu) || cidx == 1) {
+		pr_warn("Invalid counter id [%ld] during read\n", cidx);
+		return -EINVAL;
+	}
+
 	pmc = &kvpmu->pmc[cidx];
 
 	if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
@@ -747,7 +752,7 @@ int kvm_riscv_vcpu_pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
 	return 0;
 }
 
-int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
+int kvm_riscv_vcpu_pmu_fw_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
 				struct kvm_vcpu_sbi_return *retdata)
 {
 	int ret;
diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
index cf111de51bdb..e4be34e03e83 100644
--- a/arch/riscv/kvm/vcpu_sbi_pmu.c
+++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
@@ -62,7 +62,7 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		ret = kvm_riscv_vcpu_pmu_ctr_stop(vcpu, cp->a0, cp->a1, cp->a2, retdata);
 		break;
 	case SBI_EXT_PMU_COUNTER_FW_READ:
-		ret = kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, retdata);
+		ret = kvm_riscv_vcpu_pmu_fw_ctr_read(vcpu, cp->a0, retdata);
 		break;
 	case SBI_EXT_PMU_COUNTER_FW_READ_HI:
 		if (IS_ENABLED(CONFIG_32BIT))
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
