Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E82C3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gaal0x3xeObiJXmCOVqKJ5vxXrhmAkAgADvNunhtv30=; b=NYRYlrE5uHzA+W
	OSCaeLXkK4c5JGOQGvYMqX89pFTF5U4fqARAJiWm6sfSEdEgS1YlP09e0KZn1yWeC5NqaKRRdORUA
	YHI/Jc1fpGBAe3OnL2Foa9xfZfoH28hFG8rFSLEWZwYmyoCwE9nZnmB23ErrO6i/ti8g+GURoMRsh
	0DffhxuKQ9O2WBkxTWyKhTgU4vXM3QikfSl4Z/aKSBbvBXNnDtT/XHRSshuCuIC1sNyspQr7xaOaD
	mabDKaPoqYhsFrxapUSC9kT0V9bGOax6cAa3C/zdmC2GiGxILZ3zEt0d73Msw7+yV9bxflpp5PRGy
	M9nulbTNax0pVhSLMUAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqAy-00000003BHu-2ZzH;
	Fri, 19 Jul 2024 16:09:44 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqAu-00000003BD0-22QF
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:09:42 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1fc56fd4de1so16472735ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721405379; x=1722010179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmGpyKIpsYjD2Un1YAAjNQazrOZv5LQO9NnpLjromTA=;
        b=BJmy4OPYfQxvdi+iEU/jLoBscEI0I8sIVqxuKwVZP7pFaUK2LSM86Qs2KjSoPwMTgF
         M8IpuSxM2IT+nLfBiSHEsK1bui/xyj2Rq0eua/+DKkDHSl4kjILImVsUXMCE8VZuQSyr
         LsGYv+QlOHxnvp5koqa3roVtSmFzn+4nmoh3hmdeUBHg+kpSthOOTxp8LnQY3w5olzgl
         G8yMtGx7mNkzfRIr/tK6HBoaCEoMsiaUsMII/wAHwNL0bKlcuc42fuPU3A4j1ic9doGY
         O009+cxK8+43+MNFShVtkX6ofbOYgxHyxR0da5AlAR89uewEY+Plk9kUUKc0mv59gx/9
         cx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405379; x=1722010179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmGpyKIpsYjD2Un1YAAjNQazrOZv5LQO9NnpLjromTA=;
        b=ZRaFPB3ly6hZgcS0PL5+7I7V47cufjSYAZjoG1erGV/g1gSrYWuL8RK86H4FgF4Sa7
         n+6dHyiQLkFBhK1RsN1vPzy0bglzIkF45B3+OyA03jx07yOD2Zs4FBJDBgndjU2Nwznf
         AREnKnhcMILdLhePofBXrhe4J2+7AkABKFFosPOTOVRVkQ36LZKIARVNi+DweuNgkJBg
         z0c2d7hVnKmKzVemeUD2v5pzjGjcBXYYar8j0S/OpTnfLwCi63Bj4LG9T1HwtjXmtj8I
         qsi6SdFRC8j7LMwO68I72trNEfVC1c/jtK2pUy00Wo3qvaMJO7tftTq4BsKXEvMvQK1i
         bMig==
X-Forwarded-Encrypted: i=1; AJvYcCU7pA7YpAAGdR/9ZV8rIJYa+9zwbEh8DbqUtj7B6+a6JP8uwhlG/41gK/IPcX+kcEzjgBphQMR7YhoAbeZ2pG2YHF9TqG+B7hQqOg/wLnHK
X-Gm-Message-State: AOJu0Yy1tzgs4jlok5dyFa1YilSK3KVzSVxgRLGvT88UiZtHVEslatmm
	h69+k/zQFcI8FPaYjtxH61KyIWWiD2hVJnRsZ4xFL5fjE8CVJ+HuRoHfTxmbmgg=
X-Google-Smtp-Source: AGHT+IEx43SWMSduBJ80D+hDqdhh6L1kpIV5ped9Bm8n1yHsWnthT/wrpUHAZQLMRgacJBPbKhUTgw==
X-Received: by 2002:a17:902:f651:b0:1fb:5f9c:a86c with SMTP id d9443c01a7336-1fd74cfeddamr2369965ad.3.1721405378979;
        Fri, 19 Jul 2024 09:09:38 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([223.185.135.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f28f518sm6632615ad.69.2024.07.19.09.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:09:38 -0700 (PDT)
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
Subject: [PATCH 04/13] RISC-V: KVM: Break down the __kvm_riscv_switch_to() into macros
Date: Fri, 19 Jul 2024 21:39:04 +0530
Message-Id: <20240719160913.342027-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719160913.342027-1-apatel@ventanamicro.com>
References: <20240719160913.342027-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_090940_640812_94E65395 
X-CRM114-Status: UNSURE (   9.05  )
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

Break down the __kvm_riscv_switch_to() function into macros so that
these macros can be later re-used by SBI NACL extension based low-level
switch function.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_switch.S | 52 +++++++++++++++++++++++++++---------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_switch.S b/arch/riscv/kvm/vcpu_switch.S
index 3f8cbc21a644..9f13e5ce6a18 100644
--- a/arch/riscv/kvm/vcpu_switch.S
+++ b/arch/riscv/kvm/vcpu_switch.S
@@ -11,11 +11,7 @@
 #include <asm/asm-offsets.h>
 #include <asm/csr.h>
 
-	.text
-	.altmacro
-	.option norelax
-
-SYM_FUNC_START(__kvm_riscv_switch_to)
+.macro SAVE_HOST_GPRS
 	/* Save Host GPRs (except A0 and T0-T6) */
 	REG_S	ra, (KVM_ARCH_HOST_RA)(a0)
 	REG_S	sp, (KVM_ARCH_HOST_SP)(a0)
@@ -40,10 +36,12 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
 	REG_S	s9, (KVM_ARCH_HOST_S9)(a0)
 	REG_S	s10, (KVM_ARCH_HOST_S10)(a0)
 	REG_S	s11, (KVM_ARCH_HOST_S11)(a0)
+.endm
 
+.macro SAVE_HOST_AND_RESTORE_GUEST_CSRS __resume_addr
 	/* Load Guest CSR values */
 	REG_L	t0, (KVM_ARCH_GUEST_SSTATUS)(a0)
-	la	t1, .Lkvm_switch_return
+	la	t1, \__resume_addr
 	REG_L	t2, (KVM_ARCH_GUEST_SEPC)(a0)
 
 	/* Save Host and Restore Guest SSTATUS */
@@ -62,7 +60,9 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
 	REG_S	t0, (KVM_ARCH_HOST_SSTATUS)(a0)
 	REG_S	t1, (KVM_ARCH_HOST_STVEC)(a0)
 	REG_S	t3, (KVM_ARCH_HOST_SSCRATCH)(a0)
+.endm
 
+.macro RESTORE_GUEST_GPRS
 	/* Restore Guest GPRs (except A0) */
 	REG_L	ra, (KVM_ARCH_GUEST_RA)(a0)
 	REG_L	sp, (KVM_ARCH_GUEST_SP)(a0)
@@ -97,13 +97,9 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
 
 	/* Restore Guest A0 */
 	REG_L	a0, (KVM_ARCH_GUEST_A0)(a0)
+.endm
 
-	/* Resume Guest */
-	sret
-
-	/* Back to Host */
-	.align 2
-.Lkvm_switch_return:
+.macro SAVE_GUEST_GPRS
 	/* Swap Guest A0 with SSCRATCH */
 	csrrw	a0, CSR_SSCRATCH, a0
 
@@ -138,7 +134,9 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
 	REG_S	t4, (KVM_ARCH_GUEST_T4)(a0)
 	REG_S	t5, (KVM_ARCH_GUEST_T5)(a0)
 	REG_S	t6, (KVM_ARCH_GUEST_T6)(a0)
+.endm
 
+.macro SAVE_GUEST_AND_RESTORE_HOST_CSRS
 	/* Load Host CSR values */
 	REG_L	t0, (KVM_ARCH_HOST_STVEC)(a0)
 	REG_L	t1, (KVM_ARCH_HOST_SSCRATCH)(a0)
@@ -160,7 +158,9 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
 	REG_S	t1, (KVM_ARCH_GUEST_A0)(a0)
 	REG_S	t2, (KVM_ARCH_GUEST_SSTATUS)(a0)
 	REG_S	t3, (KVM_ARCH_GUEST_SEPC)(a0)
+.endm
 
+.macro RESTORE_HOST_GPRS
 	/* Restore Host GPRs (except A0 and T0-T6) */
 	REG_L	ra, (KVM_ARCH_HOST_RA)(a0)
 	REG_L	sp, (KVM_ARCH_HOST_SP)(a0)
@@ -185,6 +185,34 @@ SYM_FUNC_START(__kvm_riscv_switch_to)
 	REG_L	s9, (KVM_ARCH_HOST_S9)(a0)
 	REG_L	s10, (KVM_ARCH_HOST_S10)(a0)
 	REG_L	s11, (KVM_ARCH_HOST_S11)(a0)
+.endm
+
+	.text
+	.altmacro
+	.option norelax
+
+	/*
+	 * Parameters:
+	 * A0 <= Pointer to struct kvm_vcpu_arch
+	 */
+SYM_FUNC_START(__kvm_riscv_switch_to)
+	SAVE_HOST_GPRS
+
+	SAVE_HOST_AND_RESTORE_GUEST_CSRS .Lkvm_switch_return
+
+	RESTORE_GUEST_GPRS
+
+	/* Resume Guest using SRET */
+	sret
+
+	/* Back to Host */
+	.align 2
+.Lkvm_switch_return:
+	SAVE_GUEST_GPRS
+
+	SAVE_GUEST_AND_RESTORE_HOST_CSRS
+
+	RESTORE_HOST_GPRS
 
 	/* Return to C code */
 	ret
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
