Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B62C10F3DC6
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Mar 2026 09:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TlipBfN2l7zPaIfKr5OYxbpcUp6TAkpL2cIjXCu9MQE=; b=XYL6ZdPbzYTSzM
	D4YcoePI10CQ0WWnFWD2O+C9aZHia4A7DRb8uG38vqq7frwhcS3gG6IvURJZKFn1NmBPxFCtt1lqc
	mLBsp9r+YozcUqO1hlUdpLTG3OyPebf3bfQAYsh/zUhVHmNkW1MEgDKIyxxbnna3/xBtEFAvHlmyY
	aAGqWMYQyt/kCFlKWGJH8xBoXxFxeFHjXF8WdlrXTE3Zpm+uxwrJdOrcVBvc22ZXXsvHqxoFvXLKN
	eyYnz0vc4NoMJpcSB+vF65HAKwzWwtYLpgMcZx76vd46vhwRnQwhwtr4lXo3ufGXo5Zap1jKMXgZw
	qWBGD0yfZ8eGdgCOi86g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6PsJ-00000008mOA-3afz;
	Sat, 28 Mar 2026 09:22:35 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6PsI-00000008mMn-0DR5
	for linux-riscv@lists.infradead.org;
	Sat, 28 Mar 2026 09:22:35 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774689729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=32F5mTJaAj0N/FgsyqUyjOrOpTIx3iyjz27Gm160YI0=;
	b=LQGQxLsPWUUKNiS9izD994OcRD4Qe8YmBJ2/6ybuHVLl7MGGBjWOElR2BGUgGHwfKmhtoT
	R48X4U/8G/SXxkly0CEAYbRZp/Aq9ovHcrfpLetqhPUx4ueSZOW3aZ6snWawrqEkigCePS
	lZf3p0VeRPJJHlDhgHnoU/ejGS4ypwU=
From: Yufan Chen <yufan.chen@linux.dev>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: yufan.chen@linux.dev,
	Yufan Chen <ericterminal@gmail.com>
Subject: [PATCH] riscv/kvm: fix guest vector leak on host alloc failure
Date: Sat, 28 Mar 2026 17:21:57 +0800
Message-ID: <20260328092157.75058-1-yufan.chen@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1515; i=ericterminal@gmail.com; h=from:subject; bh=NyfQPU3Jx0krdL2ohrnV2JS3MQSaKsafKvtyKGDOgko=; b=owGbwMvMwCXWM/dCzeS3H+sZT6slMWQen8OyTu1PtO8cubJjyjckVnkk+E65Zah1/P09Th+OB U7rTWz1OiayMIhxMViKKbLc/b9vbq7XrTnXuQ/nwsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6 hkY6BjrGDFycAjDVU2MZGd4zLJKIWpTyzoVD/cjFfqWSN2ZpJjwVPv6+73b6bcgL9waqOHGO1yO s/cU5sdtR5p/XBW9Mjp9gr+62/dNR/4aaC0ksAA==
X-Developer-Key: i=ericterminal@gmail.com; a=openpgp; fpr=DDFFBE9D6D4ADA9CD70BC36D8C9DD07C93EDF17F
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_022234_224339_F24760F8 
X-CRM114-Status: UNSURE (   7.73  )
X-CRM114-Notice: Please train this message.
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

From: Yufan Chen <ericterminal@gmail.com>

When allocating vector context for a vCPU, guest_context.vector.datap is allocated before host_context.vector.datap. If the second allocation fails, the function returns -ENOMEM directly and leaks the guest buffer.

Switch the failure path to centralized cleanup. On host allocation failure, free guest_context.vector.datap, clear the pointer, and return -ENOMEM through a shared exit label.

Signed-off-by: Yufan Chen <ericterminal@gmail.com>
---
 arch/riscv/kvm/vcpu_vector.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 05f3cc2d8..4c2f92dce 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -75,15 +75,23 @@ void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx)
 
 int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *vcpu)
 {
+	int rc = -ENOMEM;
+
 	vcpu->arch.guest_context.vector.datap = kzalloc(riscv_v_vsize, GFP_KERNEL);
 	if (!vcpu->arch.guest_context.vector.datap)
-		return -ENOMEM;
+		goto out;
 
 	vcpu->arch.host_context.vector.datap = kzalloc(riscv_v_vsize, GFP_KERNEL);
 	if (!vcpu->arch.host_context.vector.datap)
-		return -ENOMEM;
+		goto free_guest_vector_datap;
 
 	return 0;
+
+free_guest_vector_datap:
+	kfree(vcpu->arch.guest_context.vector.datap);
+	vcpu->arch.guest_context.vector.datap = NULL;
+out:
+	return rc;
 }
 
 void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu)
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
