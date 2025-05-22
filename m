Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8570CC54E90
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 19:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v2CGzkhULjSqjCL6TJQ6pbbFBsJWyl2sNN5CmLHPWro=; b=ypb4CIl1AFslO3
	hXmOZxYCY2MdWazLj2zk9bsZNTWbCxKSlnMjCNJbGvyWdk/Ep84m4qFsNfxQSKE1a7qcSK89T29MR
	JGfzQQtL+ozh7T0Mu7h5snuKjZjVSpI5zQMoW22t/wDl1GpuKDHUkyPyJHWCeZ6ZY9ySdHXKnvNhI
	Pe9fr1nvUsO42UEH9b/hroxBFeDkng5DliTgWANP+XYZx+HkgN/9Aorjd1+ZmSXx1JfQHWmZY+Cah
	7DlgoFQj1V2BUe+IQKyi7kGRqqtj5Fpv5FMfrZ0s+k5BXHG1U/VIfAo3CBqB/VO2ZDfu4eA26q+Da
	+vYl4/qLXPS7ZLUTH6Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBRG-000000020Pd-1Q2j;
	Thu, 22 May 2025 19:18:46 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBCs-00000001wUG-1DrL
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 19:03:56 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22e16234307so1796805ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 12:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940633; x=1748545433; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DF8qwdvQiSR8ZsqVN4u28RN14jUMJY3Pi0vpFa2D75A=;
        b=wS2PmPhwaB9PNbzPeKs14jcBYJ3bwTYfTJTaScWf2UVAsAcmxfuDxCOI1fqGE18CSL
         CnoGPqtOLG1HUPU24AlKUmAMRw7Etfq2ZZuSBgqr3Ns62o5w90FKDgbQWXZmu8HPdwDq
         FtmzTwOfFtChQxYLo6Mc+5yBKtf+sGT1JnUFbHB9QQ8wapIQl2PriisHDx1/fU9giA1C
         DXCD+PWVWBNtbC5RqtFA0aJN8cy6Hk/l+U4rlndrKl2edAY/97GagBOl5/OmaLThQaOs
         YodBwpJ2HIurU43fcKMH/8VZc4fd3fywmDqt4ocuGjmqGVxeNY0vG+CtoynRxv7XjsQh
         2Law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940633; x=1748545433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DF8qwdvQiSR8ZsqVN4u28RN14jUMJY3Pi0vpFa2D75A=;
        b=uL3m0lqlWxpzDlDIQpnYmOW5vJDyg5fOwJeSU0lzm2R0v79PqW9hv3iJlVG3uEJCzT
         8leuow6iN81RJDG/AlP8UYpgNpaB1oPVIlVipcF7CIz9YVrod+dl6O8Fp76pUlGbSOnm
         z6LXOTC3JbUaR5JaYW/R2rTdQIgZmiGoyNy2R8yfg9TLNjuBH7xApmIx1GlpX6SABE9X
         o61EYJoHCjOSDLEmZaPpZHwO7Mt47+mJ+jKp/DzLThRZJlpRjgOhIMXFV7mh6TOuP4ui
         TqjudUQwQSHza9+QRSDddBbXgAPd/aZJjZ++jNw9p46X9bvYq90oBU8/0wlGK6TYibQu
         y8cA==
X-Gm-Message-State: AOJu0Yyd+OWYpD52qDCHUG80oUXOuoLWfO0kt8jYjsZLh/YRhfZSs+s9
	Ji+GpRL+fHE9mK5940g3ELr62pORMUIax/GYz/C/1nmc7vbKYUdYCmcuKff4WGN2BwY=
X-Gm-Gg: ASbGnctWbrNh9dktcaTT3o6Gbcu4tk52TbcqoxnNllsGW5F2fhowvnnLhJJnKJ3P3hU
	qiCQLyF+5rbnXjAlXi9rnM7SZzEQA08yKweEnOYmp81V+F7kNZInGIi8YWH+4QpUZFwE1psYG5v
	faWafKlqYwfRJbrP+cjvNfKQj4rFXU3CO0IiIB6qA8HQb7NtSkl8l6LO7xWPC7Yfs9HMojYIXtU
	ANgU2BEYSeaNFge10SQEFWJWSkM/vhrBTYrK3QT91UrVTKK+EyqxYFTEQFiwX2GEfddoBk+GWNw
	TJdZGtwEyz/DQS/21qe67XKynZFZbLEEpiokI6IcL4ZtMEBElfB56c/e3UYkj/6H
X-Google-Smtp-Source: AGHT+IFOp5NbQAetfcmDIrzFN/H7GeRjVktpIXFM9JpmrYmqufWq4+kFSWRLQINNJ6B0dpiY8ak3gg==
X-Received: by 2002:a17:902:e78b:b0:231:7fbc:19f3 with SMTP id d9443c01a7336-233f0680998mr8028135ad.12.1747940633282;
        Thu, 22 May 2025 12:03:53 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:53 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:42 -0700
Subject: [PATCH v3 8/9] RISC-V: KVM: Implement get event info function
MIME-Version: 1.0
Message-Id: <20250522-pmu_event_info-v3-8-f7bba7fd9cfe@rivosinc.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_120354_401304_0A9D55FD 
X-CRM114-Status: GOOD (  14.94  )
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

The new get_event_info funciton allows the guest to query the presence
of multiple events with single SBI call. Currently, the perf driver
in linux guest invokes it for all the standard SBI PMU events. Support
the SBI function implementation in KVM as well.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_pmu.h |  3 ++
 arch/riscv/kvm/vcpu_pmu.c             | 66 +++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi_pmu.c         |  3 ++
 3 files changed, 72 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
index 1d85b6617508..9a930afc8f57 100644
--- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
+++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
@@ -98,6 +98,9 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long saddr_low,
 				      unsigned long saddr_high, unsigned long flags,
 				      struct kvm_vcpu_sbi_return *retdata);
+int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low,
+				  unsigned long saddr_high, unsigned long num_events,
+				  unsigned long flags, struct kvm_vcpu_sbi_return *retdata);
 void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
 
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 163bd4403fd0..70a6bdfc42f5 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -453,6 +453,72 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 	return 0;
 }
 
+int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low,
+				  unsigned long saddr_high, unsigned long num_events,
+				  unsigned long flags, struct kvm_vcpu_sbi_return *retdata)
+{
+	struct riscv_pmu_event_info *einfo;
+	int shmem_size = num_events * sizeof(*einfo);
+	gpa_t shmem;
+	u32 eidx, etype;
+	u64 econfig;
+	int ret;
+
+	if (flags != 0 || (saddr_low & (SZ_16 - 1))) {
+		ret = SBI_ERR_INVALID_PARAM;
+		goto out;
+	}
+
+	shmem = saddr_low;
+	if (saddr_high != 0) {
+		if (IS_ENABLED(CONFIG_32BIT)) {
+			shmem |= ((gpa_t)saddr_high << 32);
+		} else {
+			ret = SBI_ERR_INVALID_ADDRESS;
+			goto out;
+		}
+	}
+
+	if (kvm_vcpu_validate_gpa_range(vcpu, shmem, shmem_size, true)) {
+		ret = SBI_ERR_INVALID_ADDRESS;
+		goto out;
+	}
+
+	einfo = kzalloc(shmem_size, GFP_KERNEL);
+	if (!einfo)
+		return -ENOMEM;
+
+	ret = kvm_vcpu_read_guest(vcpu, shmem, einfo, shmem_size);
+	if (ret) {
+		ret = SBI_ERR_FAILURE;
+		goto free_mem;
+	}
+
+	for (int i = 0; i < num_events; i++) {
+		eidx = einfo[i].event_idx;
+		etype = kvm_pmu_get_perf_event_type(eidx);
+		econfig = kvm_pmu_get_perf_event_config(eidx, einfo[i].event_data);
+		ret = riscv_pmu_get_event_info(etype, econfig, NULL);
+		if (ret > 0)
+			einfo[i].output = 1;
+		else
+			einfo[i].output = 0;
+	}
+
+	kvm_vcpu_write_guest(vcpu, shmem, einfo, shmem_size);
+	if (ret) {
+		ret = SBI_ERR_FAILURE;
+		goto free_mem;
+	}
+
+free_mem:
+	kfree(einfo);
+out:
+	retdata->err_val = ret;
+
+	return 0;
+}
+
 int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu,
 				struct kvm_vcpu_sbi_return *retdata)
 {
diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
index e4be34e03e83..a020d979d179 100644
--- a/arch/riscv/kvm/vcpu_sbi_pmu.c
+++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
@@ -73,6 +73,9 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	case SBI_EXT_PMU_SNAPSHOT_SET_SHMEM:
 		ret = kvm_riscv_vcpu_pmu_snapshot_set_shmem(vcpu, cp->a0, cp->a1, cp->a2, retdata);
 		break;
+	case SBI_EXT_PMU_EVENT_GET_INFO:
+		ret = kvm_riscv_vcpu_pmu_event_info(vcpu, cp->a0, cp->a1, cp->a2, cp->a3, retdata);
+		break;
 	default:
 		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
 	}

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
