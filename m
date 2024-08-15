Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FCBC3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 17:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hwLcZVSRb8A5OCkKgFVDtsFhCBPnrR7oEa1AjyXF8zM=; b=j+gjmWyznCbhR5
	w/rYbjsirLA3vrV7j9wv64Pv4Us+jKw1cuQDnBuRseiQiKtwas6zDbLLcXWrroYh/p9l0GNlbpNzC
	9OvPbtfRpYIoIPb0NwFg2gRDDE0p22KXDFgaSD2caPEvTjiRYIoFU2kG6uHdmgLcIcjtLT5EQUn52
	fl9u4w4bWcXjkxBHIbwjb6X7sAkz7YBN8K//zUJLJXKWvrMT/ViN2UVL57Ks8wgpiR/z8fFK91298
	OrfBBgF13O0TH+gtOPWJLFkJ9uvmopub1zshwScWmG2zA39Z/kUDuKjJGbMgN9i0X4CW2Km0MoDAo
	+h2FYf5Kxh7iFLFLp0Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sedyS-0000000AbLX-3MSm;
	Thu, 15 Aug 2024 17:09:20 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sedyP-0000000AbKd-13Dw
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 17:09:18 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-201fba05363so4619205ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Aug 2024 10:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723741756; x=1724346556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lVJxT5QcdO7Ui6miH35lV51PmIys+9/MJB+dZzASdvk=;
        b=j6sxOgko3lM0hd9IPmf+bglCeHkI46At80nIdLeeffO9rCOb6kueCU9+yS9MlcwevR
         vDS3F0XKCBBeMjNodSLsiqPaMxorvF3yvhXn05FX4HIaUe7fr1hWBvrbriVrqlBlTKSd
         gb3lokUy8qkCrGr7SsPCtwP+uhoJ6sUDSy7S2towjUTqT/jzIT46ccjnSbX8brsGBc/y
         s7ypqdjFCUOXtZodF4RiNfW5ljfCY87Vs1UkvlJnLRcXYCqe2geScED/PIriqsLiSAuE
         5W26FhToKpZA/Y8FaPOsJYvf9uaxKV4V8R7A3/UcOKPpH8AonJBD1m892HOpa1C5ywBR
         OrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723741756; x=1724346556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVJxT5QcdO7Ui6miH35lV51PmIys+9/MJB+dZzASdvk=;
        b=ca5V1IsD2oTPFZJZWIlQtkjIZ+GOr7EciBF94okt/H94dm5Cl10kQ8XK9daKqUzMky
         vBhbID4wZM1HSTFzsEFbkUv8x7esxKwfOi/yg/oiPxsjsTrnzuIMI6xaxoVeuPz3Ue8Q
         p/OZE9ely/3nFMtm2+BmTJvWDlr7tXHwNLR4oQ2vM2FhBRQehk+d6E2Qe7ouVU6mRUR3
         2WoygLmMVHjrU84EkOT9YabuF02CIZAmsnGMFJRwHzZujYMQcEoWrtQaTLTu67dUa2zv
         U73oh6UgB1uJdusTvOZ/jKUlpaHXSSJTQZq4EhQrj1v5NPOAuO1yhfrXLwzMXzPiF2vs
         me6A==
X-Forwarded-Encrypted: i=1; AJvYcCX6BPnt94ix32tROaddK+4oC1a6nhf7FpgeFbbFTNCQVK7ZAxs2WI7VI3XA6HrGL+Ec38oqpbhr5oQsssiZJ8fcc6Mt9t6131NVfaIPu8gD
X-Gm-Message-State: AOJu0YxAriLvUixoVfnfztG28hfL+ZhvKD09kk2MhSVoUOgORd7UGvdm
	O9BcXQ4CnJ+dSdsrUAqoPUT6IYLAX1K4XTycxQp75i6uckk6i7nJvnZtgAwvFz0=
X-Google-Smtp-Source: AGHT+IEJsKSb7GMBEJwKRJb18oE3FCx/YFCHoyOQ+/rTrCh0U70ekG6XQEIGyKSA9piI909Jdbh/YA==
X-Received: by 2002:a17:903:32c8:b0:201:f44d:6f00 with SMTP id d9443c01a7336-20203f51592mr4328345ad.57.1723741755569;
        Thu, 15 Aug 2024 10:09:15 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([223.185.130.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f03022d9sm12369535ad.25.2024.08.15.10.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 10:09:14 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] RISC-V: KVM: Don't zero-out PMU snapshot area before freeing data
Date: Thu, 15 Aug 2024 22:39:07 +0530
Message-Id: <20240815170907.2792229-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_100917_320324_4344C0EF 
X-CRM114-Status: GOOD (  12.97  )
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

With the latest Linux-6.11-rc3, the below NULL pointer crash is observed
when SBI PMU snapshot is enabled for the guest and the guest is forcefully
powered-off.

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000508
  Oops [#1]
  Modules linked in: kvm
  CPU: 0 UID: 0 PID: 61 Comm: term-poll Not tainted 6.11.0-rc3-00018-g44d7178dd77a #3
  Hardware name: riscv-virtio,qemu (DT)
  epc : __kvm_write_guest_page+0x94/0xa6 [kvm]
   ra : __kvm_write_guest_page+0x54/0xa6 [kvm]
  epc : ffffffff01590e98 ra : ffffffff01590e58 sp : ffff8f80001f39b0
   gp : ffffffff81512a60 tp : ffffaf80024872c0 t0 : ffffaf800247e000
   t1 : 00000000000007e0 t2 : 0000000000000000 s0 : ffff8f80001f39f0
   s1 : 00007fff89ac4000 a0 : ffffffff015dd7e8 a1 : 0000000000000086
   a2 : 0000000000000000 a3 : ffffaf8000000000 a4 : ffffaf80024882c0
   a5 : 0000000000000000 a6 : ffffaf800328d780 a7 : 00000000000001cc
   s2 : ffffaf800197bd00 s3 : 00000000000828c4 s4 : ffffaf800248c000
   s5 : ffffaf800247d000 s6 : 0000000000001000 s7 : 0000000000001000
   s8 : 0000000000000000 s9 : 00007fff861fd500 s10: 0000000000000001
   s11: 0000000000800000 t3 : 00000000000004d3 t4 : 00000000000004d3
   t5 : ffffffff814126e0 t6 : ffffffff81412700
  status: 0000000200000120 badaddr: 0000000000000508 cause: 000000000000000d
  [<ffffffff01590e98>] __kvm_write_guest_page+0x94/0xa6 [kvm]
  [<ffffffff015943a6>] kvm_vcpu_write_guest+0x56/0x90 [kvm]
  [<ffffffff015a175c>] kvm_pmu_clear_snapshot_area+0x42/0x7e [kvm]
  [<ffffffff015a1972>] kvm_riscv_vcpu_pmu_deinit.part.0+0xe0/0x14e [kvm]
  [<ffffffff015a2ad0>] kvm_riscv_vcpu_pmu_deinit+0x1a/0x24 [kvm]
  [<ffffffff0159b344>] kvm_arch_vcpu_destroy+0x28/0x4c [kvm]
  [<ffffffff0158e420>] kvm_destroy_vcpus+0x5a/0xda [kvm]
  [<ffffffff0159930c>] kvm_arch_destroy_vm+0x14/0x28 [kvm]
  [<ffffffff01593260>] kvm_destroy_vm+0x168/0x2a0 [kvm]
  [<ffffffff015933d4>] kvm_put_kvm+0x3c/0x58 [kvm]
  [<ffffffff01593412>] kvm_vm_release+0x22/0x2e [kvm]

Clearly, the kvm_vcpu_write_guest() function is crashing because it is
being called from kvm_pmu_clear_snapshot_area() upon guest tear down.

To address the above issue, simplify the kvm_pmu_clear_snapshot_area() to
not zero-out PMU snapshot area from kvm_pmu_clear_snapshot_area() because
the guest is anyway being tore down.

The kvm_pmu_clear_snapshot_area() is also called when guest changes
PMU snapshot area of a VCPU but even in this case the previous PMU
snaphsot area must not be zeroed-out because the guest might have
reclaimed the pervious PMU snapshot area for some other purpose.

Fixes: c2f41ddbcdd7 ("RISC-V: KVM: Implement SBI PMU Snapshot feature")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index bcf41d6e0df0..2707a51b082c 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -391,19 +391,9 @@ int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
 static void kvm_pmu_clear_snapshot_area(struct kvm_vcpu *vcpu)
 {
 	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
-	int snapshot_area_size = sizeof(struct riscv_pmu_snapshot_data);
 
-	if (kvpmu->sdata) {
-		if (kvpmu->snapshot_addr != INVALID_GPA) {
-			memset(kvpmu->sdata, 0, snapshot_area_size);
-			kvm_vcpu_write_guest(vcpu, kvpmu->snapshot_addr,
-					     kvpmu->sdata, snapshot_area_size);
-		} else {
-			pr_warn("snapshot address invalid\n");
-		}
-		kfree(kvpmu->sdata);
-		kvpmu->sdata = NULL;
-	}
+	kfree(kvpmu->sdata);
+	kvpmu->sdata = NULL;
 	kvpmu->snapshot_addr = INVALID_GPA;
 }
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
