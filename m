Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5B2C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 09:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ecdYDpuWzsl+57bqNQhcsju0KQfAZzeBLLI25SM5iFk=; b=sqLjkOGY01pqsr
	4CGvMmAe0EWiU38kcnTxPl6nH/yO9lLYbiagLmVP7HodNLy81TTcnBQGXGwVELdZK8ux69ZcGQTOl
	8TGmEqTV7KFNbC8wXeza2ylNkOsW0k/EAVxIzKPV6HoFmyqEx4vSx/JOBqM9UhsYUBLxgS4xOOS5F
	roxzfqgzkinT/JugwM3/fCM8VgeuetjjMPD2aeFVcjJA4H2RPMIETdAMFMxOoFn6aJx9gi6HK7C0H
	U0Yd6kmaRQ7ZLXd67FTMg77Cs1OWOrJOjoE0OdJlGOl1651tgsx+XupCZy/VQwqVfAmfqY9YfHPaO
	NReK1oOOIffn1YzM9UgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCyxL-00BAlA-24;
	Tue, 12 Dec 2023 09:21:35 +0000
Received: from mgamail.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCyxI-00BAiv-0e;
	Tue, 12 Dec 2023 09:21:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702372892; x=1733908892;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QhUq9FlvTvIr7jwQydmT4vM1c+dwWoHc5WAb4PAhk+o=;
  b=E2G3CUkrKXIsSRPCPQVv2cRaitQpnW42sYFbY4DWnL+cvM5L2VOYm1m6
   RzAWhSp9sUm/hmgxoXzaMbsbCO/8i3tyNiegtln0blaX0U+vXNYFHQcKp
   uuzIvV8g3F+tPFdBGS8O3+rcJEe2t/siE55nK7c/0FMCr86tTnv8FQYcq
   wneP0ZPq2MH2BLoWkxTUlrGxYb9YFKRi0JxdpE8QjYkPAvyrlfOwGmvU3
   URiqMi02ZgMrJc8eXl4lC1EvNGMAUt3XVSTsxKdNIm0lQoy7NQANQdTNY
   nbusEiM/5b8cTZzIiM57LGaf/wLZl4nUzfgiH/du0hEY1lTBrZELzZQ01
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="480974455"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="480974455"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 01:21:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="917213519"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="917213519"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 01:21:23 -0800
From: Haibo Xu <haibo1.xu@intel.com>
To: 
Cc: xiaobo55x@gmail.com,
	haibo1.xu@intel.com,
	ajones@ventanamicro.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Minda Chen <minda.chen@starfivetech.com>,
	Samuel Holland <samuel@sholland.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Peter Xu <peterx@redhat.com>,
	Like Xu <likexu@tencent.com>,
	Vipin Sharma <vipinsh@google.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Aaron Lewis <aaronlewis@google.com>,
	Thomas Huth <thuth@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v4 09/11] KVM: riscv: selftests: Change vcpu_has_ext to a common function
Date: Tue, 12 Dec 2023 17:31:18 +0800
Message-Id: <3972ba512474a0a3c492877db82d19e988d7095e.1702371136.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702371136.git.haibo1.xu@intel.com>
References: <cover.1702371136.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_012132_297367_0A097A36 
X-CRM114-Status: GOOD (  11.77  )
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

Move vcpu_has_ext to the processor.c and rename it to __vcpu_has_ext
so that other test cases can use it for vCPU extension check.

Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/kvm/include/riscv/processor.h |  2 ++
 tools/testing/selftests/kvm/lib/riscv/processor.c     | 10 ++++++++++
 tools/testing/selftests/kvm/riscv/get-reg-list.c      | 11 +----------
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index b68b1b731a34..bd27e1c67579 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -42,6 +42,8 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t idx,
 #define RISCV_ISA_EXT_REG(idx)	__kvm_reg_id(KVM_REG_RISCV_ISA_EXT, \
 					     idx, KVM_REG_SIZE_ULONG)
 
+bool __vcpu_has_ext(struct kvm_vcpu *vcpu, int ext);
+
 struct ex_regs {
 	unsigned long ra;
 	unsigned long sp;
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index 39a1e9902dec..dad73ce18164 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -15,6 +15,16 @@
 
 static vm_vaddr_t exception_handlers;
 
+bool __vcpu_has_ext(struct kvm_vcpu *vcpu, int ext)
+{
+	unsigned long value = 0;
+	int ret;
+
+	ret = __vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(ext), &value);
+
+	return !ret && !!value;
+}
+
 static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
 {
 	return (v + vm->page_size) & ~(vm->page_size - 1);
diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 6bedaea95395..5da230e86728 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -75,15 +75,6 @@ bool check_reject_set(int err)
 	return err == EINVAL;
 }
 
-static inline bool vcpu_has_ext(struct kvm_vcpu *vcpu, int ext)
-{
-	int ret;
-	unsigned long value;
-
-	ret = __vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(ext), &value);
-	return (ret) ? false : !!value;
-}
-
 void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 {
 	unsigned long isa_ext_state[KVM_RISCV_ISA_EXT_MAX] = { 0 };
@@ -111,7 +102,7 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 		__vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(s->feature), 1);
 
 		/* Double check whether the desired extension was enabled */
-		__TEST_REQUIRE(vcpu_has_ext(vcpu, s->feature),
+		__TEST_REQUIRE(__vcpu_has_ext(vcpu, s->feature),
 			       "%s not available, skipping tests\n", s->name);
 	}
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
