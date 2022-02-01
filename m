Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8A4C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 08:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SB06brhfO8YvANkU2Is8kRKRzA/cC3qcbW4q7ciQsr4=; b=YLqu6iAnif3Zxn
	te6R7ILU/0k+oPxSaPIDzFhQHNsHON3J8Z9sywE/AFlQPU+wFEq0lIA1s6MlBolwSlIkRQr+6JrpD
	fNvWOVk0o5iJQwQvEDFwq/vftDy6dKkOHW9RPbLhGbkHoPOjxtLxGR92h7EHsPIL69VLIHKYvb3fj
	YTe4A+6V2h9Msqd5CeMocbTmqTUPHhA//NN578JphqA1bD+RBH1RRqqL+e7OO0deuprd4HQD8h++R
	FY2wO3faKsC9C5d8uRvhQEqCmfcP99jbAznQfYxjK+IoyqO+uTLZHbwl38ClMWA8GETXFF8cWOqBa
	rJCOZEOcYJb5qZrV6seA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEoSW-00BWMB-4t; Tue, 01 Feb 2022 08:24:16 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEoSR-00BWHk-8B
 for linux-riscv@lists.infradead.org; Tue, 01 Feb 2022 08:24:14 +0000
Received: by mail-ej1-x636.google.com with SMTP id ka4so51497039ejc.11
 for <linux-riscv@lists.infradead.org>; Tue, 01 Feb 2022 00:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GHl1OHNEBsppykLL0FZwPbFOi9foYqykYD+EcFet6qM=;
 b=a7BBFEww46WyfPzbomNQG+Oqq2IlwS7J9fIC6wz4AdhnC7RyJpr/rJWZYYt2vAhObW
 iKEwMUG4feE/X4hSNAxQoRtiComrQv51VvEEYRla9+kWV86j1LQbU6kx+vhGqEd61/cy
 G2t3i2xZvnCqkVzIfZzQU2C62mnetTUKDAhzxiaYd34pcr2HvKXqAO0uOCOFqYacHePO
 vs923UsYq5I2ob+UgyHh5m1WF0yrD59QYadBvnneQAQcj857TlY7IXviNdvZDwFw7Noa
 sOmaqrashQAOt4ECeqnuo5hVWsTR85qX0g8Zx9Gh9fKZdbFMM1vrATkT2ORx5IRqOcsY
 mpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GHl1OHNEBsppykLL0FZwPbFOi9foYqykYD+EcFet6qM=;
 b=dGXV5+5VFaDGtG8XhclmEfdiyVXAOipcrL8wak3+whiZZmgnZq7z898/v5OdRbWhJY
 mnozEi+jnPUVjJpmyv/IkwmF4SUTZVS+h49xXAWGuNu3Zpw1jif/T98tuvi3xeyoCH9q
 kefOG/WKWV9I6eu8uWMpzhVJPQjSOJi5vBh14zMsEAL8N9Z28NK8kbKjJrNvTqRQv0Y6
 1DkRU5fy4lCe9tP1h+xraYUS32Mvlds4Wy4pbhrfA2IkfGBe3CxRU3j9SAtSAb+BFakD
 inzWCmJ0Qsq8RkheS/VmLQCiE1C8a8ukBpH1Nm0NU/WYGp1fqhPWPnQJNWDGvQ0ul/dL
 enJA==
X-Gm-Message-State: AOAM530+ThlQQkK+5ouh8rr1TcWPvmwPTKRisECXp2o80ByrCLWFb8Jb
 AeDcQtwCvqk33oSdBC1pQJnZiQ==
X-Google-Smtp-Source: ABdhPJzCelwQYB0QuYOqiku+n7scTy7gUb/hHhHhs6GEaaroLB9AmfUKIaKTwSM1jvGPR/SYoABrkA==
X-Received: by 2002:a17:906:58c6:: with SMTP id
 e6mr19318243ejs.733.1643703849679; 
 Tue, 01 Feb 2022 00:24:09 -0800 (PST)
Received: from localhost.localdomain ([122.179.76.38])
 by smtp.gmail.com with ESMTPSA id w8sm14312133ejq.220.2022.02.01.00.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 00:24:09 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 6/6] RISC-V: KVM: Implement SBI HSM suspend call
Date: Tue,  1 Feb 2022 13:52:27 +0530
Message-Id: <20220201082227.361967-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201082227.361967-1-apatel@ventanamicro.com>
References: <20220201082227.361967-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_002411_320269_3FD85B4D 
X-CRM114-Status: GOOD (  11.07  )
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

The SBI v0.3 specification extends SBI HSM extension by adding SBI HSM
suspend call and related HART states. This patch extends the KVM RISC-V
HSM implementation to provide KVM guest a minimal SBI HSM suspend call
which is equivalent to a WFI instruction.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi_hsm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
index 1ac4b2e8e4ec..239dec0a628a 100644
--- a/arch/riscv/kvm/vcpu_sbi_hsm.c
+++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
@@ -61,6 +61,8 @@ static int kvm_sbi_hsm_vcpu_get_status(struct kvm_vcpu *vcpu)
 		return -EINVAL;
 	if (!target_vcpu->arch.power_off)
 		return SBI_HSM_STATE_STARTED;
+	else if (vcpu->stat.generic.blocking)
+		return SBI_HSM_STATE_SUSPENDED;
 	else
 		return SBI_HSM_STATE_STOPPED;
 }
@@ -91,6 +93,18 @@ static int kvm_sbi_ext_hsm_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			ret = 0;
 		}
 		break;
+	case SBI_EXT_HSM_HART_SUSPEND:
+		switch (cp->a0) {
+		case SBI_HSM_SUSPEND_RET_DEFAULT:
+			kvm_riscv_vcpu_wfi(vcpu);
+			break;
+		case SBI_HSM_SUSPEND_NON_RET_DEFAULT:
+			ret = -EOPNOTSUPP;
+			break;
+		default:
+			ret = -EINVAL;
+		}
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 	}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
