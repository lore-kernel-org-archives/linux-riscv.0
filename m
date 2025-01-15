Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CCBC02183
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 18:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G2df07Gp20Wb5mbkZY+zqY4ABsy+o2G/Am8s8B+avj4=; b=nQIKlJ3s5wSVF4
	1xkpBW68RRRjgLKtCCLFUsJhgEX2AOKQb1k4wHexDpCN5+KkO6T0gdzI5Z23oJ0OS4axHQ5SiFYJx
	74ww7c2VYpA7kt8Z46nzqQwb0jxFwuOzaaMLwZDA5458HTSrUEC2HhKfpozz+WYGFReiKjPR3K3Nh
	0xuDmI1UZ7DWZ4rDtAeqpMm0etcmpqBSVzXpcfSPHDbQDW4qe8YorPO7TvNJj1lQfW+j+2jP3Objc
	tMlb8hPOcLiJ/U17MCznyazm1tv368Y1ydHGeQ32XwkyKT9VSht3yavQdKR1rQbPruCiA2kfirrJG
	a3Ym/FYIdNMGrd7a4ZmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8KS-0000000Cnka-3Hvy;
	Wed, 15 Jan 2025 18:41:24 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8AT-0000000ClI7-0SsJ
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 18:31:06 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21649a7bcdcso123382475ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jan 2025 10:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736965864; x=1737570664; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BvcM8pFAUo8mVZOX2xDK8xE/vCf4z0GzB3iMLovGRHA=;
        b=M9W09/dKxI6LTQas8wJ64Ut2YHTk7Lf4hfud8ORhJV/3znMghwTMSKmCS2zEzfJlWY
         uYc9J5fBYTtkXeE8Ht/d696k4Rrp9lazC+H3qleknHJjvSygPy3/oM0v6xIjSA5ZzDAi
         tQPXG+A/z+cvU2Yg8t0fnfxK42cWb6ildgeMId4+mCmxTl5am+PiFEcK3IdJ5n1eQLRN
         YwIJaVZHP458ilWG73D9xDbDaeqmxnDcfGCSmvSVpLQJkcJhNr8KXQljy4TfbSmA03Co
         tbQThIfcHafI1rhsqskmJv1fiZqEdkxGWBQsEJ8SmOAemqXju7vKoT+800gP+qRfizHU
         cu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736965864; x=1737570664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvcM8pFAUo8mVZOX2xDK8xE/vCf4z0GzB3iMLovGRHA=;
        b=DTeyuRdDwyuyfdzO4hRpagtQsatvIxrQctg35PNVqEzENdH0T48rxErgyNF83tv8/x
         UpxA3/gWoBZfbGz9pzLvql9JAcCdmhsx7DsyoiiMIcddecOKiei0JmmVQwBxZFV1ev5O
         RawD24Nc376t4AzmA5GGen1ArlLoo7iS4r9YXe1hvi6eD4WKbOH2O8lMzZ7Vke7eMv2i
         lH6BRqdnjavAB+ubZI9RKeMPI5ofNQJ8gpYlY2mklOk2KGcml8gqisF6GSeeEroZhFhh
         P2LVLFWhOvT8Y1xDnN4jthOXLDEJoQf+3kjGu1S9GVGLG9JXD4XELSlEoi8aOmJHhgr9
         0Frg==
X-Gm-Message-State: AOJu0Yxdvh1i6X1qpMyVl/6qRPj6+pQS5ibSijSaNrSBg186DGyTN2Ej
	L0n2aIPl3VgWLxgzjE0GZ4yE2lFOasUPV7b0ioOETu9THvWKwQV44coPg7S78BQ=
X-Gm-Gg: ASbGnct9a+4tWiFIret+k/PTun88VIRbnwlfjn08E6Ocwyba4DrtYDRDLmWDvaUBTro
	rzhtR8cgWDsOA0yUJVqNFHfSnVIxhgTcnstlKIL/bBZXoZK/frpqOSwrCU7NdwbRvQkBWsg4A41
	XYSEmsPrdYiCqFgUDwTXCmUjIFLjfXwwUGsjwpVrqUIwPqBW07ZRkbB8WBD2IzU64SpjTSHu0/D
	ioOjc66NwTty7IFYGJvkadDsuRWs1l4iITm0DBdRRid2HpGyiqs7gJmZ6xP9GSYSnXS1g==
X-Google-Smtp-Source: AGHT+IGGezhqE5JLeDYHWhClhyZY1cGsFLOXrLsdEJgU2ElrVE/deMFlurFTVr/XKSOcI7Wz9ZYvgg==
X-Received: by 2002:a17:902:e5ce:b0:216:386e:dd8 with SMTP id d9443c01a7336-21a83f54a51mr373139315ad.17.1736965864561;
        Wed, 15 Jan 2025 10:31:04 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219f0dsm85333195ad.139.2025.01.15.10.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 10:31:04 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 15 Jan 2025 10:30:48 -0800
Subject: [PATCH v2 8/9] RISC-V: KVM: Implement get event info function
MIME-Version: 1.0
Message-Id: <20250115-pmu_event_info-v2-8-84815b70383b@rivosinc.com>
References: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
In-Reply-To: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_103105_200584_7B70C13B 
X-CRM114-Status: GOOD (  15.02  )
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
index ca23427edfaa..23dedf4c9313 100644
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
