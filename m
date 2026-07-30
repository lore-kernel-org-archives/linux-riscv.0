Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D37C54FD2
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 09:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=URpkylWx7Qo8Q6r20cmwjhOysEeaNCJ0Ga27e1uALA4=; b=2k9lnouD3dZE79
	C5UwLfA563tZr/Fp7uIl/QafD7XJgxa4x75AV1vFv/OF5C250SRVXzSqTRQMfuzfOWQYMWehSV/rP
	kdNRet2xMnKdAF4Q7PxXnH6ziW76kWVZboMTcHmdp7DaueNdLx7nVLK6C+CJRN19FapXQXwtRvVmq
	HxMZrA79XtyoGETBp8T5p34k0UuF6OL30wB3EdFYW9cXPxyQd1LWia4NzEvN7yJv+FfaDO5MdiQeT
	HmRo/6MhOI9Ufy93573qlzO5KgP5QjUvSgHpshUSSDK3K7lviAtFUDZi3lq447zje7OQnzaBqlGNO
	jLHA4j6JIjmu61CgZoVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpN1M-00000009zqX-0m8s;
	Thu, 30 Jul 2026 09:25:44 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpN1J-00000009zpN-0Khp
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 09:25:42 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-848479c9bd5so1643642b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jul 2026 02:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785403540; x=1786008340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O9A8tKmgH/5kniasHlafAxdvgLATzr/Vyh67WvhGtfs=;
        b=D4mXTgLvcr8GEwsC/UnovD710KXf7GuqPKT1RuhhjXSUwJe+fulkP1QDLQpI27mgpY
         94TIO4Phwd/FRVcS6M53/okIuvou4DQ0LPa89tSRypzy5iyHZo5gSUND9UftT+hfaobK
         xoLPOICGDtX0d1DukVO7s58ZTcCReM8u76JbnxA7tlnI36hX4m1fUoG+0f7lCVXhbgKA
         PMOmV0OTNpmHyB8hVRk9laKKNTdiUVtXL1FhRV3d5r63xE2dJwksmvJVgKETzo5Oqn3W
         YlSFlQNFmW8TEnosowgkJCa6XlCFYU3YJwayiZihKpjURVjSeN+l7V1/hKOtR7Maeey1
         MZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785403540; x=1786008340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O9A8tKmgH/5kniasHlafAxdvgLATzr/Vyh67WvhGtfs=;
        b=TARhC+D1JXcVpnAqUNPisVoeD855rMLX2n0Q01B6Fii4zSMCHrtP7KiM7QTV3bNI7d
         r9g9eoYkwBFNVZHv/8IanWq9sqsiKE6T93AH02/RHfGsgX3pM9Y2cDelBZ9wqPYgFDiN
         78xY+AMT1WHF7FYstDDmgKTABYDr+Qy4d5a3eGvcjkaHZ0Dy+ncTuxTrpENNrN6LL4ZP
         xcistlQJ1fPRHE7MYqKartwSjySusHKVj4mi1vlprt7dHbRZt8FSv3k1bSmJ4275QlVU
         kv6Yd4Vz3pqkgNer35S7YrVZljeL/Pd9cg0H76+nvc2DAa4FO2QSqhmAIAZicwiwgNP8
         seAQ==
X-Forwarded-Encrypted: i=1; AHgh+RoQ1B6SAPt3a0143k44fy0WM4BhO8Y4AvYABxeyJ6Ynk3CIn+X9AVuGC09hYExX4syP81q60sM5luzUHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzajRUAD92mnWoUCQqxMg0gAvPXse1x881Fb2cdgcDd182Dfj2y
	9ybMaejev2X1cPbEGTnaBMRjiGYCvTFel/4Xjs6a1L/KaMtmNdRvsjAK
X-Gm-Gg: AR+sD12MuinXyx4OH8RGTP5podYcSbkSLBkgfOXn6sCbrwhsagMDZ7XZPtp7Z1hSV71
	2K1tVIudKE2/kyCNryIqRuwUtZRJflxctbVXQdlEAl2KhHjQlqIP+B/1xNjn3EBwTnq2dc6Q9NJ
	GpJHnlA6qghT393qi7ZpcHIWV6N5Ur9D98Yt57FigKLIVxdnCcR9lvnIHmQXJ6X88wWBD5u6Yvb
	eUZ1mP8QBpJ6Hscewjuh1XhHuhxTptHV/TxyPNE6w2cBPq61+RB8h5hTSy88coi0dufhDipVIdg
	8f50QTvW2PgYqCVi7FEgvjPsMdKf/gempwRo9Yevq8k45kZkfSkiyM2HnwETpT9cPrlgxNtn9Ze
	26x8LhrujcOHtOTrJzsfhcKZy27L4LuRpi8QZXkTD3iSl2GPkgj8qasJz/iCC9B6tfx2x4NN1Uj
	XhrIVuvyUecZ/L4ZuKVjv4K0wnYrzpwfhFZR+fDqfR6nE/DY9M6RtBZy9pJpn96sBbmXlXdRQ5y
	6LQ3g==
X-Received: by 2002:a05:6a00:2e1e:b0:848:2f74:d8da with SMTP id d2e1a72fcca58-84ebc48638emr1624244b3a.75.1785403539951;
        Thu, 30 Jul 2026 02:25:39 -0700 (PDT)
Received: from 2045L.tailb1cd6d.ts.net ([36.112.122.101])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-84e9fe2153csm2753324b3a.3.2026.07.30.02.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:25:39 -0700 (PDT)
From: Guidong Han <2045gemini@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Naveed Khan <naveed@digiscrypt.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guidong Han <2045gemini@gmail.com>
Subject: [PATCH v2 RESEND] RISC-V: KVM: Fix PMU event info array size overflow
Date: Thu, 30 Jul 2026 17:25:33 +0800
Message-ID: <20260730092533.1369531-1-2045gemini@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_022541_129890_6FF670C4 
X-CRM114-Status: GOOD (  13.09  )
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

SBI PMU EVENT_GET_INFO stores guest-controlled
num_events * sizeof(*einfo) in an int. On RV64, num_events = 0x10000001
makes 0x100000010 truncate to 16. KVM then allocates one entry but loops
over the original num_events, causing out-of-bounds reads and writes. A
nested guest triggered:

BUG: KASAN: slab-out-of-bounds in kvm_riscv_vcpu_pmu_event_info+0xa4/0x142
Read of size 4 at addr ff600000074d46b0 by task init/1
Call Trace:
[<ffffffff8006471c>] kvm_riscv_vcpu_pmu_event_info+0xa4/0x142
[<ffffffff800690c0>] kvm_sbi_ext_pmu_handler+0xca/0x268
[<ffffffff8006779e>] kvm_riscv_vcpu_sbi_ecall+0xec/0x1e6
[<ffffffff8006008c>] kvm_riscv_vcpu_exit+0x48c/0x540
[<ffffffff8005ea0a>] kvm_arch_vcpu_ioctl_run+0x37e/0xc80
Allocated by task 1:
 __kmalloc_noprof+0x19e/0x4b0
 kvm_riscv_vcpu_pmu_event_info+0x72/0x142
 kvm_sbi_ext_pmu_handler+0xca/0x268
 kvm_riscv_vcpu_sbi_ecall+0xec/0x1e6
 kvm_riscv_vcpu_exit+0x48c/0x540
 kvm_arch_vcpu_ioctl_run+0x37e/0xc80
The buggy address is located 0 bytes to the right of
 allocated 16-byte region [ff600000074d46a0, ff600000074d46b0)

Store the shared-memory size in size_t and reject multiplication overflow.
Allocate the guest-driven array with GFP_KERNEL_ACCOUNT so it is charged
to kmemcg, and use __GFP_NOWARN to suppress allocation failure warnings.
Use kvcalloc() to allow vmalloc fallback and an unsigned long loop index
to match num_events.

Reported-by: Naveed Khan <naveed@digiscrypt.com>
Closes: https://lore.kernel.org/kvm/178345245327.72065.13249716450708539854@digiscrypt.com/
Fixes: e309fd113b9f ("RISC-V: KVM: Implement get event info function")
Cc: stable@vger.kernel.org
Signed-off-by: Guidong Han <2045gemini@gmail.com>
---
RESEND:
- Send v2 as a new top-level thread instead of replying to v1.

Changes in v2:
- Use an accounted, no-warning kvcalloc() allocation and kvfree(), as
  suggested by Sashiko.
- Naveed Khan reported the issue before v1. I missed his report at the
  time, so add Reported-by and Closes tags to credit him.

Link to v1: https://lore.kernel.org/kvm/20260718153620.829378-1-2045gemini@gmail.com/
---
 arch/riscv/kvm/vcpu_pmu.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index bb46dcbfb24d..8e1f6abb84e2 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -12,7 +12,9 @@
 #include <linux/err.h>
 #include <linux/kvm_host.h>
 #include <linux/nospec.h>
+#include <linux/overflow.h>
 #include <linux/perf/riscv_pmu.h>
+#include <linux/slab.h>
 #include <asm/csr.h>
 #include <asm/kvm_isa.h>
 #include <asm/kvm_vcpu_sbi.h>
@@ -479,13 +481,14 @@ int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low
 				  unsigned long flags, struct kvm_vcpu_sbi_return *retdata)
 {
 	struct riscv_pmu_event_info *einfo = NULL;
-	int shmem_size = num_events * sizeof(*einfo);
+	size_t shmem_size;
 	gpa_t shmem;
 	u32 eidx, etype;
 	u64 econfig;
 	int ret;
 
-	if (flags != 0 || (saddr_low & (SZ_16 - 1) || num_events == 0)) {
+	if (flags != 0 || (saddr_low & (SZ_16 - 1)) || num_events == 0 ||
+	    check_mul_overflow(num_events, sizeof(*einfo), &shmem_size)) {
 		ret = SBI_ERR_INVALID_PARAM;
 		goto out;
 	}
@@ -500,7 +503,8 @@ int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low
 		}
 	}
 
-	einfo = kzalloc(shmem_size, GFP_KERNEL);
+	einfo = kvcalloc(num_events, sizeof(*einfo),
+			 GFP_KERNEL_ACCOUNT | __GFP_NOWARN);
 	if (!einfo) {
 		ret = SBI_ERR_FAILURE;
 		goto out;
@@ -512,7 +516,7 @@ int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low
 		goto free_mem;
 	}
 
-	for (int i = 0; i < num_events; i++) {
+	for (unsigned long i = 0; i < num_events; i++) {
 		eidx = einfo[i].event_idx;
 		etype = kvm_pmu_get_perf_event_type(eidx);
 		econfig = kvm_pmu_get_perf_event_config(eidx, einfo[i].event_data);
@@ -525,7 +529,7 @@ int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low
 		ret = SBI_ERR_INVALID_ADDRESS;
 
 free_mem:
-	kfree(einfo);
+	kvfree(einfo);
 out:
 	retdata->err_val = ret;
 
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
