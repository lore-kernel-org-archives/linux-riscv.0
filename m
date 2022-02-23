Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24714C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 01:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2ZLZVWCoJXx27bIr6jBECh6n66Dbok8s0i8mjbHoB0s=; b=saHtMKKyyXEg5O
	jm6YgoaaFN0aJdirYzpDKdP6n3Eyit39G4nDs3WQ+klD/SSq3DVqZQs4fYW98zUtHw6YJFuhXXh4S
	O27Bnk9Bub0cjOyre4gbHoAOWtHStTn+TtH8I0SN7tLOhPk6HTxYoaIjiiPqKo/f8kRZxK5a577OQ
	uMWn2UXogWA8P17jw2XwKek0ZBPsQza7c1lZ5sOIXVYZDY5kdaWvmqGRpdvfC+rQff+E/8OSqu2Jp
	SPliM65vBjR7wHjfg2pfAEWiDIwN4IdYvcDc+jUbIONrkNRbtfV20PJ7QIW2Lgfy4e6Uu4zdVyEAY
	Vt/JGFET7JSmOUfPRH8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMgDz-00C4YJ-0E; Wed, 23 Feb 2022 01:13:47 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMgDw-00C4X0-2c
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 01:13:45 +0000
Received: by mail-pg1-x52a.google.com with SMTP id w37so12098209pga.7
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 17:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=96WbTPBlKoh9dpaBhV+cINPe1CinDJP3AmFsmZVPqq8=;
 b=QCz6YUnnNoVvjocGrodf/v0GZEOGGaA5+APBbxEyhyZ5MsJyt99QP5cZS0zbc3A+de
 d9+WzO6k0c4Kz/kkYrMYt0vm1jGP9pSMx4VTDpEm6MTTlzoctu7EfVv5+PnQyTb9UeIc
 26gjq02exwfTeisI/3GPPtgrDL1vjeDZJ34LnV2Z83u3fcODdzAtzNF6VuaDR121iHNj
 R7KZPy4AAgAHkZ07Vmw26M05w5d/uvXe2mPCZ5QHZagQU/eoU9B+uA00C9MZKcRuep91
 shH5XhTrxSY7+suhNPJ1DSnkZmh10XuHOELuHX8e+lBxu98JdA2IbbPlePuUHlszqD5x
 ORwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=96WbTPBlKoh9dpaBhV+cINPe1CinDJP3AmFsmZVPqq8=;
 b=2//maOR7mXpNo2pNwOowDFzhJLuwJ/jg36t+bcH2zwdtDxHLkGGn0puTW7GI3dqdk5
 0d1Hzp6043/VVPxZyUdVfk1+Ecto3vrVjib+vFAZV2bkpcbd66qCYVFOCDggQoqzhgcw
 +MFk9Kmsn0ulgOhxdHApzXwBreeAsJFYjCYlWF7eQj6/88Xp7+IeOh4O3G6w2T654VO0
 Z4xDtgE0RhgIXDyfv6ros5mMMnncssYwOqQkgtg9BMpxtSjHgYGm9XDTrkGVNpW5SLqZ
 0LEW1mJz8P2aBFexDsbK0Ua74LNdZqViwSLkUrV5IR3r4+uh8dwq96xBpHxu3IIsE9E9
 DOPw==
X-Gm-Message-State: AOAM533OpnajmjB8UvY+cFG/y3ASiVa+t9D52QWbMx49RjaOjZrxghE0
 psa/0NuyUyKSw+WNPk1ImH3esA==
X-Google-Smtp-Source: ABdhPJxKjioxOdPFQa+pKI0gjWxm65DoxeawObZ+NAn38dVHDob1xsBVDjrykI04R5tc2SosBuoVew==
X-Received: by 2002:a62:2902:0:b0:4ca:75a3:aa1c with SMTP id
 p2-20020a622902000000b004ca75a3aa1cmr27224267pfp.65.1645578822970; 
 Tue, 22 Feb 2022 17:13:42 -0800 (PST)
Received: from VincentChen-ThinkPad-T480s.hitronhub.home
 (36-226-224-164.dynamic-ip.hinet.net. [36.226.224.164])
 by smtp.gmail.com with ESMTPSA id pj14sm841247pjb.43.2022.02.22.17.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 17:13:42 -0800 (PST)
From: Vincent Chen <vincent.chen@sifive.com>
To: anup@brainfault.org, atishp@atishpatra.org, kvm-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, fu-ching.yang@sifive.com,
 hsinyi.lee@sifive.com, Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v2] RISC-V: KVM: Refine __kvm_riscv_switch_to() implementation
Date: Wed, 23 Feb 2022 09:13:31 +0800
Message-Id: <20220223011331.12254-1-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_171344_147838_CF277813 
X-CRM114-Status: UNSURE (   8.53  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Kernel uses __kvm_riscv_switch_to() and __kvm_switch_return() to switch
the context of host kernel and guest kernel. Several CSRs belonging to the
context will be read and written during the context switch. To ensure
atomic read-modify-write control of CSR and ordering of CSR accesses, some
hardware blocks flush the pipeline when writing a CSR. In this
circumstance, grouping CSR executions together as much as possible can
reduce the performance impact of the pipeline. Therefore, this commit
reorders the CSR instructions to enhance the context switch performance..

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Suggested-by: Hsinyi Lee <hsinyi.lee@sifive.com>
Suggested-by: Fu-Ching Yang <fu-ching.yang@sifive.com>
---
 arch/riscv/kvm/vcpu_switch.S | 60 ++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 26 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_switch.S b/arch/riscv/kvm/vcpu_switch.S
index 029a28a195c6..d74df8eb4d71 100644
--- a/arch/riscv/kvm/vcpu_switch.S
+++ b/arch/riscv/kvm/vcpu_switch.S
@@ -41,33 +41,37 @@ ENTRY(__kvm_riscv_switch_to)
 	REG_S	s10, (KVM_ARCH_HOST_S10)(a0)
 	REG_S	s11, (KVM_ARCH_HOST_S11)(a0)
 
-	/* Save Host and Restore Guest SSTATUS */
+	/* Load Guest CSR values */
 	REG_L	t0, (KVM_ARCH_GUEST_SSTATUS)(a0)
+	REG_L	t1, (KVM_ARCH_GUEST_HSTATUS)(a0)
+	REG_L	t2, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
+	la	t4, __kvm_switch_return
+	REG_L	t5, (KVM_ARCH_GUEST_SEPC)(a0)
+
+	/* Save Host and Restore Guest SSTATUS */
 	csrrw	t0, CSR_SSTATUS, t0
-	REG_S	t0, (KVM_ARCH_HOST_SSTATUS)(a0)
 
 	/* Save Host and Restore Guest HSTATUS */
-	REG_L	t1, (KVM_ARCH_GUEST_HSTATUS)(a0)
 	csrrw	t1, CSR_HSTATUS, t1
-	REG_S	t1, (KVM_ARCH_HOST_HSTATUS)(a0)
 
 	/* Save Host and Restore Guest SCOUNTEREN */
-	REG_L	t2, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
 	csrrw	t2, CSR_SCOUNTEREN, t2
-	REG_S	t2, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
-
-	/* Save Host SSCRATCH and change it to struct kvm_vcpu_arch pointer */
-	csrrw	t3, CSR_SSCRATCH, a0
-	REG_S	t3, (KVM_ARCH_HOST_SSCRATCH)(a0)
 
 	/* Save Host STVEC and change it to return path */
-	la	t4, __kvm_switch_return
 	csrrw	t4, CSR_STVEC, t4
-	REG_S	t4, (KVM_ARCH_HOST_STVEC)(a0)
+
+	/* Save Host SSCRATCH and change it to struct kvm_vcpu_arch pointer */
+	csrrw	t3, CSR_SSCRATCH, a0
 
 	/* Restore Guest SEPC */
-	REG_L	t0, (KVM_ARCH_GUEST_SEPC)(a0)
-	csrw	CSR_SEPC, t0
+	csrw	CSR_SEPC, t5
+
+	/* Store Host CSR values */
+	REG_S	t0, (KVM_ARCH_HOST_SSTATUS)(a0)
+	REG_S	t1, (KVM_ARCH_HOST_HSTATUS)(a0)
+	REG_S	t2, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
+	REG_S	t3, (KVM_ARCH_HOST_SSCRATCH)(a0)
+	REG_S	t4, (KVM_ARCH_HOST_STVEC)(a0)
 
 	/* Restore Guest GPRs (except A0) */
 	REG_L	ra, (KVM_ARCH_GUEST_RA)(a0)
@@ -145,32 +149,36 @@ __kvm_switch_return:
 	REG_S	t5, (KVM_ARCH_GUEST_T5)(a0)
 	REG_S	t6, (KVM_ARCH_GUEST_T6)(a0)
 
+	/* Load Host CSR values */
+	REG_L	t1, (KVM_ARCH_HOST_STVEC)(a0)
+	REG_L	t2, (KVM_ARCH_HOST_SSCRATCH)(a0)
+	REG_L	t3, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
+	REG_L	t4, (KVM_ARCH_HOST_HSTATUS)(a0)
+	REG_L	t5, (KVM_ARCH_HOST_SSTATUS)(a0)
+
 	/* Save Guest SEPC */
 	csrr	t0, CSR_SEPC
-	REG_S	t0, (KVM_ARCH_GUEST_SEPC)(a0)
-
-	/* Restore Host STVEC */
-	REG_L	t1, (KVM_ARCH_HOST_STVEC)(a0)
-	csrw	CSR_STVEC, t1
 
 	/* Save Guest A0 and Restore Host SSCRATCH */
-	REG_L	t2, (KVM_ARCH_HOST_SSCRATCH)(a0)
 	csrrw	t2, CSR_SSCRATCH, t2
-	REG_S	t2, (KVM_ARCH_GUEST_A0)(a0)
+
+	/* Restore Host STVEC */
+	csrw	CSR_STVEC, t1
 
 	/* Save Guest and Restore Host SCOUNTEREN */
-	REG_L	t3, (KVM_ARCH_HOST_SCOUNTEREN)(a0)
 	csrrw	t3, CSR_SCOUNTEREN, t3
-	REG_S	t3, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
 
 	/* Save Guest and Restore Host HSTATUS */
-	REG_L	t4, (KVM_ARCH_HOST_HSTATUS)(a0)
 	csrrw	t4, CSR_HSTATUS, t4
-	REG_S	t4, (KVM_ARCH_GUEST_HSTATUS)(a0)
 
 	/* Save Guest and Restore Host SSTATUS */
-	REG_L	t5, (KVM_ARCH_HOST_SSTATUS)(a0)
 	csrrw	t5, CSR_SSTATUS, t5
+
+	/* Store Guest CSR values */
+	REG_S	t0, (KVM_ARCH_GUEST_SEPC)(a0)
+	REG_S	t2, (KVM_ARCH_GUEST_A0)(a0)
+	REG_S	t3, (KVM_ARCH_GUEST_SCOUNTEREN)(a0)
+	REG_S	t4, (KVM_ARCH_GUEST_HSTATUS)(a0)
 	REG_S	t5, (KVM_ARCH_GUEST_SSTATUS)(a0)
 
 	/* Restore Host GPRs (except A0 and T0-T6) */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
