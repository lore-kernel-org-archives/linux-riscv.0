Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A167C5516D
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 09:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nIuvBT3J+xKbxLxTfjhHcNH1M0L1sAkLwX6tVdkjPb0=; b=EB57J8HNtXPH4x
	/F0zl63wSQji5Ei1cAaCa3FFASv+Yddnfrm8DO0sn8Ha/rT57nsRleB8t0b+abuLDpXIl879u8OBP
	qleQLXv19ifXDDR0iS4qUaewOgSp4wCyK0cOd09sS5Aro58KcLAsE7v4WGFhpDRu9/bjLw/jcKts6
	ujEonuNSa/gat5xNElj3UFznbkhkfhGTusNo1OWVGrevNtH7zlL5VsUTgeDTL5wm3WiBCoba0hA/I
	WFqpvQTo0CBQA/SSf2x9OEbrAmeZ8gsmbV5dXv1oXmB8Bn6WnUlepn3dSA2rHYdCmQ57lryx5wNRH
	2ZDr53s7X1KYMcq1R0FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjkq-0000000CD4d-3q5Y;
	Fri, 31 Jul 2026 09:42:12 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjkl-0000000CD1F-2Vzs;
	Fri, 31 Jul 2026 09:42:08 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hBLgx2dvcz8Xrrq;
	Fri, 31 Jul 2026 17:42:05 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl2.zte.com.cn with SMTP id 66V9fvqc009430;
	Fri, 31 Jul 2026 17:41:57 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from localhost.localdomain (unknown [10.234.74.162])
	by smtp (Zmail) with SMTP;
	Fri, 31 Jul 2026 17:42:00 +0800
X-Zmail-TransId: 3e816a6c6de7010-3f327
X-Zmail-LocalSMTP: 1
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-Zmail-RealSender: wang.yechao255@zte.com.cn
From: Wang Yechao <wang.yechao255@zte.com.cn>
To: Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@linux.dev>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Wang Yechao <wang.yechao255@zte.com.cn>
Subject: [PATCH v3 2/2] RISC-V: KVM: Introduce make_xfence_request_nodata for FENCE.I requests
Date: Fri, 31 Jul 2026 17:38:28 +0800
Message-ID: <20260731093833.1551341-3-wang.yechao255@zte.com.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20260731093833.1551341-1-wang.yechao255@zte.com.cn>
References: <20260731093833.1551341-1-wang.yechao255@zte.com.cn>
MIME-Version: 1.0
X-MAIL: mse-fl2.zte.com.cn 66V9fvqc009430
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Fri, 31 Jul 2026 17:42:05 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A6C6DED.000/4hBLgx2dvcz8Xrrq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_024207_795086_A0A97748 
X-CRM114-Status: GOOD (  11.43  )
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

FENCE.I does not need hfence data, but it currently goes through the
generic make_xfence_request() path with NULL data, incurring unnecessary
per-VCPU checks.

Split out a separate make_xfence_request_nodata() function to handle
FENCE.I directly, and move the data validity check to the top of the
generic function to avoid redundant checks.

Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
---
 arch/riscv/kvm/tlb.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index c54522decaa64..fd445e9fa3f94 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -325,6 +325,29 @@ void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu)
 	}
 }
 
+static void make_xfence_request_nodata(struct kvm *kvm, unsigned long hbase,
+				       unsigned long hmask, unsigned int req)
+{
+	unsigned long i;
+	struct kvm_vcpu *vcpu;
+	DECLARE_BITMAP(vcpu_mask, KVM_MAX_VCPUS);
+
+	bitmap_zero(vcpu_mask, KVM_MAX_VCPUS);
+	kvm_for_each_vcpu(i, vcpu, kvm) {
+		if (hbase != -1UL) {
+			if (vcpu->vcpu_id < hbase ||
+				vcpu->vcpu_id >= hbase + BITS_PER_LONG)
+				continue;
+			if (!(hmask & (1UL << (vcpu->vcpu_id - hbase))))
+				continue;
+		}
+
+		bitmap_set(vcpu_mask, i, 1);
+	}
+
+	kvm_make_vcpus_request_mask(kvm, req, vcpu_mask);
+}
+
 static void make_xfence_request(struct kvm *kvm,
 				unsigned long hbase, unsigned long hmask,
 				unsigned int req, unsigned int fallback_req,
@@ -335,6 +358,9 @@ static void make_xfence_request(struct kvm *kvm,
 	DECLARE_BITMAP(req_vcpu_mask, KVM_MAX_VCPUS);
 	DECLARE_BITMAP(fallback_req_vcpu_mask, KVM_MAX_VCPUS);
 
+	if (!data || !data->type)
+		return;
+
 	bitmap_zero(req_vcpu_mask, KVM_MAX_VCPUS);
 	bitmap_zero(fallback_req_vcpu_mask, KVM_MAX_VCPUS);
 	kvm_for_each_vcpu(i, vcpu, kvm) {
@@ -346,11 +372,6 @@ static void make_xfence_request(struct kvm *kvm,
 				continue;
 		}
 
-		if (!data || !data->type) {
-			bitmap_set(req_vcpu_mask, i, 1);
-			continue;
-		}
-
 		/*
 		 * Enqueue hfence data to VCPU hfence queue. If we don't
 		 * have space in the VCPU hfence queue then fallback to
@@ -369,8 +390,7 @@ static void make_xfence_request(struct kvm *kvm,
 void kvm_riscv_fence_i(struct kvm *kvm,
 		       unsigned long hbase, unsigned long hmask)
 {
-	make_xfence_request(kvm, hbase, hmask, KVM_REQ_FENCE_I,
-			    KVM_REQ_FENCE_I, NULL);
+	make_xfence_request_nodata(kvm, hbase, hmask, KVM_REQ_FENCE_I);
 }
 
 void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
-- 
2.39.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
