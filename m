Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA23C54EAA
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 11:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LDXOM2v/lTN4lfVvB1Sy50JnS8I7wjNbv9pi/Uc7gz8=; b=dGXPBAicihHbqm
	s0nsXh839VHWXIBQJIuQUB47rFJ43xjWMmbpU6HZLLK43FcxTzgOIzY8+TF9vjsLi+80tamsRCHWt
	DNRbX5+jQOiJ+DznTg83LJE8KIPGWPJu0vuujXF9WaARHXxhOqAvzhWgzsNQlGS6f/u7YaNc3C4b8
	/uj3JjIafy0gKsFAvIZe2A0Q0d21geS3S+BLiYADCmqSIhti5CQgRi3DV8TciA0rQqdFMGsudx188
	vuQSqYWMpIyPfwIM1hWAK2AwFQWr6OdyIxnfc6V6c2x5JQ/tgOp6/pEgysv9smcWiPXRJfcLq/ZQR
	w/ehSYcGBPSxo/hHAzgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLN4O-00ECE7-P3; Fri, 27 Jan 2023 11:39:00 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLMvb-00E7vo-SA
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 11:29:57 +0000
Received: by mail-pl1-x636.google.com with SMTP id g23so4611217plq.12
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 03:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ba3H0Jv5D/YGUkRP3LoEJju4yx/M3VQLseaE6FBWtQ=;
        b=fNWxbBCxDLMICiRNBvmigvDVed4NsKEIn0as/dW/01VrXNsvx4+HKf99XPFmU4Qro9
         gAO4rZTDO5pDFMXIkAbPdVLlFEAjv3goiC78HODs5nuj4pOZ9lMDbcmIMQXbdiiwZfv/
         caCljnb/NH9BpcdP2Oj9kxmQ9jiJAFireTJz344qGOvh1d4/f8LANxcxB74DAvNvnI0S
         so0hCsTAKt0VhyZdy1s10Qr9xK7/ffL6gRTNnCuF5mnsG5ktOblyQyVdmzeINYS75zFy
         tMSQIpnNSMM2YLQbt10XjNg8xRnp61OnWbLzaDD+AHfmdbtFCVZVhK+LPRmXJGNGYaJi
         1DGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ba3H0Jv5D/YGUkRP3LoEJju4yx/M3VQLseaE6FBWtQ=;
        b=5w4t2Fe9hl4G8KLKUDiwPYDrnuZ3RAghsTHaA2Uw6ul6mUf8LY/ktgsozbp9ByKKY7
         xw209RuCcQK+TsAlsShuSuWBOK4N5dC05jxzQA8mGxWtzY8zlEIyZMJS0LWVEC+79mES
         zZWzdBPBqOjGF2vFFP3paSmw9cFWUgw8Q2jZ3P77Cz0/Cw68sKH5Cmtj5bbSA/VWRjOU
         6EabHQCX92sjtwhHSiImXQVpjaobnKmqrQm6hajYl9SqWkCJRNOvwRZcqEEST+UMEIHu
         zo1/V/4WlqXWW60L77lf8DNQXCtvmARKTwbpwBYFeIYAXCYj9AcZqwWbNswOZmTsNDMe
         5tdg==
X-Gm-Message-State: AFqh2kowNXWya3rBeEp56PHcsOSMQuVOVLrIWbRSyctNao6zDx9KbLqD
	pZn4shZrkUUD1CStpUzYB1jblA==
X-Google-Smtp-Source: AMrXdXskYvkrjZYR/AZWCt8tfG+6SAbzCrcFxanXm2GWzvtyXE0s3axugA2Cg23Mtfnsfr56nItvhg==
X-Received: by 2002:a17:902:aa04:b0:194:6253:d69c with SMTP id be4-20020a170902aa0400b001946253d69cmr35240186plb.2.1674818994327;
        Fri, 27 Jan 2023 03:29:54 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id t7-20020a170902b20700b00192e1590349sm2605953plr.216.2023.01.27.03.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 03:29:53 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2] RISC-V: KVM: Redirect illegal instruction traps to guest
Date: Fri, 27 Jan 2023 16:59:34 +0530
Message-Id: <20230127112934.2749592-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_032955_966604_AD037444 
X-CRM114-Status: UNSURE (   9.88  )
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

From: Andy Chiu <andy.chiu@sifive.com>

The M-mode redirects an unhandled illegal instruction trap back
to S-mode. However, KVM running in HS-mode terminates the VS-mode
software when it receives illegal instruction trap. Instead, KVM
should redirect the illegal instruction trap back to VS-mode, and
let VS-mode trap handler decide the next step. This futher allows
guest kernel to implement on-demand enabling of vector extension
for a guest user space process upon first-use.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_exit.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index c9f741ab26f5..4ea101a73d8b 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -160,6 +160,9 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
 
 	/* Set Guest PC to Guest exception vector */
 	vcpu->arch.guest_context.sepc = csr_read(CSR_VSTVEC);
+
+	/* Set Guest privilege mode to supervisor */
+	vcpu->arch.guest_context.sstatus |= SR_SPP;
 }
 
 /*
@@ -179,6 +182,12 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	ret = -EFAULT;
 	run->exit_reason = KVM_EXIT_UNKNOWN;
 	switch (trap->scause) {
+	case EXC_INST_ILLEGAL:
+		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV) {
+			kvm_riscv_vcpu_trap_redirect(vcpu, trap);
+			ret = 1;
+		}
+		break;
 	case EXC_VIRTUAL_INST_FAULT:
 		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
 			ret = kvm_riscv_vcpu_virtual_insn(vcpu, run, trap);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
