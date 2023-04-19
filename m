Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32093C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PezAG/1NFSiGHgoxeIgl1Yr95JlpIVTNnfaKn8Ky0kA=; b=D+2Vb585cvxmvm
	zLt0ua0Cmbi5OIBMN7pUPvaK396fkzN0o7fhFqvwcgOIHNd/qbpx8i/vPrqcjugJz6CgzhaBZNmrA
	Mn18NDQRklDAkNO8s+JVe3LYAw6oQAV0z7AVEKdkTtxLpP51NWscMT4lJAbHrKV3+Km/6JchLPhd/
	77z15d0XEuO8L3Dk9z3L4GBKL493dtB2D6txLWnYSBRJiW5lA8iXBb0KDMlyQqkSXQCyDH8iVbHV7
	nKt9zqT2mstPRJSxbiSM3NXGLf6ILPvOTUpdrjSbMDOlxgpG3p7lkdmX/7hviFuhVgz7cpovDP3eI
	qy7ceU4m0K+sNI9lUrzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGF9-006V8i-0q;
	Wed, 19 Apr 2023 22:25:39 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGF5-006V6w-0N
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:25:37 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-54fe25c2765so3754127b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681943132; x=1684535132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojiAvkB2QjgGX0WuePfTk5AH+Ftof3ihRnPYCRhXfys=;
        b=nFNsj5scFi/GRqkwMsKxCwS1liPDLGmDdauVHvD6dFHHZzCgrY/5HEG29GXiDyavv9
         kRd/WBDjtO0uulVis3EeAvDE5qT5rfJIvJ2gEKENIjOLjGP0Z8tKKdHdHwQImxPQFMRB
         t8kYP/O06d6/pAygirZs6WL8SIH4R8uMfl9QqMQ447z9nfC8pamfDqG7z+90q58oYMfR
         pkUGNBEiPX4jRWJAzizbaIj+DkeiIr+LBqMXRMXDcO5agbkdB+ky6vjY+GOzqsWBD0jX
         ZwZbZ8FU/+jgMr+MZiW7QgF6l4PO0ZVCmko6Gx0TciTUWkKH+Oh2F5Zf+vMea7cEtRjF
         lzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943132; x=1684535132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojiAvkB2QjgGX0WuePfTk5AH+Ftof3ihRnPYCRhXfys=;
        b=kXhWUchIEO4yB++GxkEShLSR1MIGkxVJZg8c4ap3nbX+bs3gdWvMt+Os+PEJwyaTkL
         LfxgeYYTm97/J2noW3Ol3W4626E2RD7DbN/ezACHFwZxuGQYcYKzHKwBAG9Pw9sEazfQ
         IGdksNSeCLOWQG8ss3OSm8e1FQV436r16RB3mviF7qqKJrg8kAN1icDI+LTl/ioLVgUC
         CVTE4tToZ5yg9NbMdiqo4VhfF/BqCAl8phwsJijXVrUvX06I+9KZLKznvBSrqRpVqf8a
         PCkY2vXRIu+eLdVurvhjahpFQf7feFGqPhgLcUQgCRKZ2rePzjISOk22xoEQ1DMpS83C
         ASHA==
X-Gm-Message-State: AAQBX9fj2z1XP2fZ3r5LJ0Ox9oDmU9CA/Po9c1l0CtrThXh+DUs66hDO
	+QtZ4SRnP4Yagns4YMuvKgviz52T1IOYMr2A0HI=
X-Google-Smtp-Source: AKy350aUmxK/wzp1xvJIpKWslK3gwGr/UxzJX5snN5ZgZlPl8MyALzkERpVzHjZpOuQ6botaKIIVqg==
X-Received: by 2002:a17:903:22c1:b0:1a1:c3eb:afd with SMTP id y1-20020a17090322c100b001a1c3eb0afdmr7315223plg.65.1681942684832;
        Wed, 19 Apr 2023 15:18:04 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:04 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 16/48] RISC-V: KVM: Skip most VCPU requests for TVMs
Date: Wed, 19 Apr 2023 15:16:44 -0700
Message-Id: <20230419221716.3603068-17-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_152535_157880_9ABDEFAE 
X-CRM114-Status: GOOD (  13.78  )
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

Currently, KVM manages TLB shootdown, hgatp updates and
fence.i through vcpu requests.

TLB shootdown for the TVMs happens in co-ordination with TSM.
The fence.i & hgatp updates are directly managed by the TSM.
There is no need to issue these requests directly for TVMs.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index c53bf98..3b600c6 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -22,6 +22,7 @@
 #include <asm/kvm_nacl.h>
 #include <asm/hwcap.h>
 #include <asm/sbi.h>
+#include <asm/kvm_cove.h>
 
 const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
@@ -1078,6 +1079,15 @@ static void kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
 		if (kvm_check_request(KVM_REQ_VCPU_RESET, vcpu))
 			kvm_riscv_reset_vcpu(vcpu);
 
+		if (is_cove_vcpu(vcpu)) {
+			/*
+			 * KVM doesn't need to do anything special here
+			 * as the TSM is expected track the tlb version and issue
+			 * hfence when vcpu is scheduled again.
+			 */
+			return;
+		}
+
 		if (kvm_check_request(KVM_REQ_UPDATE_HGATP, vcpu))
 			kvm_riscv_gstage_update_hgatp(vcpu);
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
