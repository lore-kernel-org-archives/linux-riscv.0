Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18862EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 11:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xk2b1hs6EHeCavIOlUMF2xebEfCqWK8FA9QMiIk9Uro=; b=DRvo8RF6MPZn6J
	KpnS3/gL0C81PdsszBczr4VTNKstKJVqKgNPv7qNFB5qWCtk+p/4A0D+MK4NTMpgxqDzYCWLcw5o2
	lEoRXSAzBe2D25zbJ2z4nPLFhkeRTHfLSSZktgGA8yu1rLoj8bUsSOm/RW5M4BpDOoqAmN5e10ejt
	FXPwSL0IV/7wh/T7lzhqyqzGK5ncas9OY8270XM9Lh6aOA014iMdFA8qP7H1r3gYzx1Jl97Hjxg5z
	wiDCnCV1p8a7ck03JHRNcNaMaJefr8+8k8InVX95psU4K3j7crdqh/KsSPTTyAYod+4OP3K4NqWcl
	A9gdSdO8mEZ8T85DSpvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA822-000TOi-1Z;
	Fri, 16 Jun 2023 11:54:22 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA81z-000TM1-0j;
	Fri, 16 Jun 2023 11:54:20 +0000
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1qA81t-00Fyk4-4P; Fri, 16 Jun 2023 12:54:13 +0100
Received: from ben by rainbowdash with local (Exim 4.96)
	(envelope-from <ben@rainbowdash>)
	id 1qA81s-000hFZ-2d;
	Fri, 16 Jun 2023 12:54:12 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.or,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] riscv: kvm: define vcpu_sbi_ext_pmu in header
Date: Fri, 16 Jun 2023 12:54:10 +0100
Message-Id: <20230616115410.166244-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_045419_262387_4D62B3B7 
X-CRM114-Status: GOOD (  11.29  )
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

Sparse is giving a warning about vcpu_sbi_ext_pmu not being
defined, so add a definition to the relevant header to fix
the following:

arch/riscv/kvm/vcpu_sbi_pmu.c:81:37: warning: symbol 'vcpu_sbi_ext_pmu' was not declared. Should it be static?

Fixes: 3e5e56c60a1477 ("riscv: kvm: move extern sbi_ext declarations to a header")
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 3 +++
 arch/riscv/kvm/vcpu_sbi.c             | 4 +---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 4278125a38a5..b94c7e958da7 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -66,4 +66,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
 
+#ifdef CONFIG_RISCV_PMU_SBI
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu;
+#endif
 #endif /* __RISCV_KVM_VCPU_SBI_H__ */
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index e52fde504433..c973d92a0ba5 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -20,9 +20,7 @@ static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
 };
 #endif
 
-#ifdef CONFIG_RISCV_PMU_SBI
-extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu;
-#else
+#ifndef CONFIG_RISCV_PMU_SBI
 static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
 	.extid_start = -1UL,
 	.extid_end = -1UL,
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
