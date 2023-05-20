Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D46C77B7D
	for <linux-riscv@archiver.kernel.org>; Sat, 20 May 2023 15:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U1mKReu+nRC3js0EVN0FafTmFPmklo6951KuDLiVKV0=; b=kpUzvhHnb30kSu
	4nc33w+qHiGwOcOWoeCqxymTFuTSouO/QenbQO0miOqcve+d2N+N1Qzb5+KFe3DuCF/tyjThUhit6
	/x4U5IhUqxjLtrb2AwqcFcZtMxYK5rJwviCFPzui9Boa792WLZdmRw4uox+Zg3L1vMrS2n3dqJsWZ
	TbL0ZOJrl5pNuSMx7hMI1FnXHvFHMKL3YQb6obhvPxxtKbUuL3caMLi+42cKTM2i4HL401BnvfykS
	/s+qittSUgucgUo3XeMIi0Z73i/SIMYx7ocZDHqoDuiV582ES1ajvlckozWUMxEc7EYpVBSbojtp+
	9ChddXpiiqPBZ+KqA3/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0O5F-001jl3-2B;
	Sat, 20 May 2023 15:01:25 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0O5C-001jjz-2p;
	Sat, 20 May 2023 15:01:24 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-64d3e5e5980so1613418b3a.2;
        Sat, 20 May 2023 08:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684594881; x=1687186881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JngrVDzUb7onTZW8kbY61V0gOKYCqFmRyyUS95xUVKQ=;
        b=OFj5rEl+qVxZn2gEAREcEKPNqxdvf88EZUo7G+ne53NX+LW/JtyWB733CSy9AHNZmH
         dhMCfpbCHjOHp6QQd5oDYFL+v+iWeY/3tMeDUjepOUz+jbpdL2Db7dKdtpWLjKVeRvG6
         98QHLmg7w+5qSxyC6jYAUha2bVXfz0KNof4+vHpn7e3EC9IrGyPFHT1d9zEvK/FV/a0L
         xMVyY01ospb8E4kmm1IrlJ1EU4T5zlO1TY8jDuAM0o7zW+6bMYEh8tkfo0fNOXFNvDE1
         yefPPuperLrwpIMP5wzwtTdwzcky5e6w31/TCGRMZjN30IGjZv/JAbpP6Ub1FocTRNrL
         KQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684594881; x=1687186881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JngrVDzUb7onTZW8kbY61V0gOKYCqFmRyyUS95xUVKQ=;
        b=kwtp2LVHXlzfsw1c2RQ1OD1UtUrfU+1EbUReXKTGsgHH8RV0JPqMKiU0wg8FXnhr94
         r/zDF8hVWg2HMcwPsMcxbGKj1omE/f6ZoiV4JkeYd5/jBpGYt5K+uxEU2Gy8+i2A4ifB
         A73pMn4w2fiIaVUuP7PIEsZoNXClK0uLExPobIKscMkD+XDtKu+tkeaL3+nGK56i6/n8
         e6eXpo97vmLglOU3rBnnwwqwyEMt6NI6k26+tNWogV0ap3zgvvr68LiGZKe0j7WVe2vR
         IMK7AkiLEtT4ILEhyjJb8Pd9IPEWIjJkLI3n2mIpk2gpa4EQ77CZRkFoNdR1mmfbgdNt
         RVhg==
X-Gm-Message-State: AC+VfDwTxSjXOhTODEtJuuCagKnnQz5UxOORppuQYTm2XhDiIjnHXJ3M
	KSzkL9hcLk8zGOAZi0l3Kog=
X-Google-Smtp-Source: ACHHUZ6CCAoiklTOJARIxoSJqUydx1h76n10uIK/FXaLDlt/SmrCT0Ili+NK9Fui7i35MaBf3nuMpQ==
X-Received: by 2002:a05:6a00:804:b0:645:b13e:e674 with SMTP id m4-20020a056a00080400b00645b13ee674mr7529666pfk.26.1684594880737;
        Sat, 20 May 2023 08:01:20 -0700 (PDT)
Received: from localhost.localdomain (36-230-227-109.dynamic-ip.hinet.net. [36.230.227.109])
        by smtp.gmail.com with ESMTPSA id j17-20020a62e911000000b0064d413caea6sm1387355pfh.179.2023.05.20.08.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 May 2023 08:01:20 -0700 (PDT)
From: wchen <waylingii@gmail.com>
X-Google-Original-From: wchen <waylingII@gmail.com>
To: anup@brainfault.org
Cc: atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	ajones@ventanamicro.com,
	wchen <waylingII@gmail.com>
Subject: [PATCH] RISC-V: KVM: Redirect AMO load/store misaligned traps to guest
Date: Sat, 20 May 2023 23:01:16 +0800
Message-Id: <20230520150116.7451-1-waylingII@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_080122_936190_CBB9021A 
X-CRM114-Status: UNSURE (   9.64  )
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

The M-mode redirects an unhandled misaligned trap back
to S-mode when not delegating it to VS-mode(hedeleg).
However, KVM running in HS-mode terminates the VS-mode
software when back from M-mode.
The KVM should redirect the trap back to VS-mode, and
let VS-mode trap handler decide the next step.
Here is a way to handle misaligned traps in KVM,
not only directing them to VS-mode or terminate it.

Signed-off-by: wchen <waylingII@gmail.com>
---
 arch/riscv/include/asm/csr.h | 2 ++
 arch/riscv/kvm/vcpu_exit.c   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index b6acb7ed1..917814a0f 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -82,7 +82,9 @@
 #define EXC_INST_ACCESS		1
 #define EXC_INST_ILLEGAL	2
 #define EXC_BREAKPOINT		3
+#define EXC_LOAD_MISALIGNED	4
 #define EXC_LOAD_ACCESS		5
+#define EXC_STORE_MISALIGNED	6
 #define EXC_STORE_ACCESS	7
 #define EXC_SYSCALL		8
 #define EXC_HYPERVISOR_SYSCALL	9
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 4ea101a73..2415722c0 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -183,6 +183,8 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	run->exit_reason = KVM_EXIT_UNKNOWN;
 	switch (trap->scause) {
 	case EXC_INST_ILLEGAL:
+	case EXC_LOAD_MISALIGNED:
+	case EXC_STORE_MISALIGNED:
 		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV) {
 			kvm_riscv_vcpu_trap_redirect(vcpu, trap);
 			ret = 1;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
