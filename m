Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E25EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 14:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CxDMVWB16nUrkXfW/cG8TC5/bQntZdAvyh/GlZoMZ/4=; b=C4mP/0+PhwqW5i
	ANslaT1aVNbo5yCSY7/cm8DJ/RtmaOcwDQ3+Utciy2kE0uN5K2ghU4oe/0/Vta3Ub5UyIlINL0LxI
	DNbQiewNXo/NI8jKSW/B9xfyTS0V1yDftNEmS1KSLdgwcGqkBjE/fdqvxc0zeVcl6BNC/JLsDngOb
	PPl5bMoClPZ0MEC/eWCyEpH/RI0BvlMlKADZzxfszQAWMqPEsOZw3VNr9aNkYxs+f/QkjOMX+0prw
	T/E3jdtomAxJj+DCk4wMII4WhrAFxA9HW1oU5O0MdQByC0onnyGFzfXbs1EK1VtljSsvJENU84HTf
	szNdyj6WhO7FM9vJwwzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAAL5-000nYs-0h;
	Fri, 16 Jun 2023 14:22:11 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAAL2-000nXe-2s;
	Fri, 16 Jun 2023 14:22:10 +0000
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1qAAKy-00G3KG-5o; Fri, 16 Jun 2023 15:22:04 +0100
Received: from ben by rainbowdash with local (Exim 4.96)
	(envelope-from <ben@rainbowdash>)
	id 1qAAKx-000hxx-2l;
	Fri, 16 Jun 2023 15:22:03 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH v2] riscv: kvm: define vcpu_sbi_ext_pmu in header
Date: Fri, 16 Jun 2023 15:22:03 +0100
Message-Id: <20230616142203.168996-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_072208_930949_1672B444 
X-CRM114-Status: GOOD (  11.45  )
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

Fixes: cbddc4c4cb9e ("RISC-V: KVM: Add SBI PMU extension support")
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
v2:
  - correct the fixes tag as suggested by Conor Dooley
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
