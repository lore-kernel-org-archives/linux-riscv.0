Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195EFC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 16:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lR38NgIBRki3N/Vm1bYOK+8yCPKZVuuLKZh2/7rcQ8o=; b=h0ogDaM49FmB1B
	ifenOHHclj54v4vxZPBH5FYJ5+fYKpTcpTKf2Kpdgwx6js7PRcvcGUHiTb4gePgqcl0rt2MqEYuAk
	Chjvnw3Ho03AY+7bfSBEItwuSDv9dxsnJV4Qx//6RUU4No/6Z1cR//pf3qPrsUsF6/1+bOy2/B9j3
	hRUcL3sjRmbUZPRQ+AQyX7Dfgtdym2EDPUsMFVwBVcHK/gx4uug63u5gffO8UgBeqPjG67xmzLFNw
	A7xQCpjzmZlyktuYokLQT4OXxnJrZXlCB6yzQ1eRaeXlA5hzIP4/aNkegxhlP0n82mTm1cid+hjVN
	71eW+QOkqCxIeAq7l0Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgmm-002jLO-DP; Mon, 28 Nov 2022 16:15:12 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgmi-002jGQ-W2
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 16:15:10 +0000
Received: by mail-pl1-x62a.google.com with SMTP id jn7so10608498plb.13
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 08:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1jSlqGdECL73YnDzNqagg9psRJkFm1roQJKa2djZKM=;
        b=L6a6o+4S9rBnv86Payvu0dzLCpF3lYvbi9NgJKV1CXCbWK/dyxbBu12WF2ZSV1keFB
         Be5L4CQlc7zjqpjF6lzrgrLKhGpxAdOBzvySlGKafYVqSgKttpVsj1iLemVo1nzzntgN
         adrM1WO3AfzgiuPqku8d6jS/TcuLI6wFqlCiL2toC0f0oEceRHbBRVpTlDsES0hjt864
         fHMJji5dsKGR0hIfMjMzZqqaTDbprry/wE7FcXdxWIZLl63ov42CGsb46Ec2kk6xA0wh
         211lCV2nNEEp/sQsDC2VVRnSPgg4aUVEnoUBcPgJcRATQeaiDIrVZv2n+d5zzrYJVl9H
         Qi/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1jSlqGdECL73YnDzNqagg9psRJkFm1roQJKa2djZKM=;
        b=OZEjK+s293prs2+xQt1u5rvZ/iiLx1ahVMze09KUgg4t7KoAsKNsWqG+aPlq3QRdiq
         jYODiwcHK0dHWPOPqKjjQGltWYNuVE4GV/flkmx10BItyAZk5mFXjBF9WV911d+omx05
         V965RhDlxwFxKymeJu2zN6e+yViB6muen68IVMj5KAMzu6VDRcL/SqNyUkxw42l4f74z
         yJO1Bx/h4bI3OJQbYPUgortvY1GMT1NkHAUqTq5DVWFau9JrRL7J6keGOjbLS2fov71H
         kCab/EOWrJJVs9a0f7zVNk+zIh8NNN6NcehIweIYctDnTsBxBIRYXWwIxOAQxHSHCZ7R
         X/kw==
X-Gm-Message-State: ANoB5pkyy82pl+tEWJsUqI6zbb+zBThzcNoQLZO/PoNYwmDhb1nGW9/N
	gTHS+jPzRBUGrvJPJzFfooUcVw==
X-Google-Smtp-Source: AA0mqf44Bf/aZc5leADbIBCjjLqyV0qnD7yKtTFR/swOhVKlth1mxLaJYewfn3xuWt7GGhaAU1AJZg==
X-Received: by 2002:a17:90a:5801:b0:218:90b5:d1f2 with SMTP id h1-20020a17090a580100b0021890b5d1f2mr46721362pji.142.1669652108111;
        Mon, 28 Nov 2022 08:15:08 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.0])
        by smtp.gmail.com with ESMTPSA id k145-20020a628497000000b0056246403534sm8210805pfd.88.2022.11.28.08.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 08:15:07 -0800 (PST)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 8/9] RISC-V: KVM: Add ONE_REG interface for mvendorid, marchid, and mimpid
Date: Mon, 28 Nov 2022 21:44:23 +0530
Message-Id: <20221128161424.608889-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128161424.608889-1-apatel@ventanamicro.com>
References: <20221128161424.608889-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_081509_081732_B7120B57 
X-CRM114-Status: GOOD (  10.33  )
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

We add ONE_REG interface for VCPU mvendorid, marchid, and mimpid
so that KVM user-space can change this details to support migration
across heterogeneous hosts.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  3 +++
 arch/riscv/kvm/vcpu.c             | 27 +++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 8985ff234c01..92af6f3f057c 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -49,6 +49,9 @@ struct kvm_sregs {
 struct kvm_riscv_config {
 	unsigned long isa;
 	unsigned long zicbom_block_size;
+	unsigned long mvendorid;
+	unsigned long marchid;
+	unsigned long mimpid;
 };
 
 /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 312a8a926867..7c08567097f0 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -276,6 +276,15 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 			return -EINVAL;
 		reg_val = riscv_cbom_block_size;
 		break;
+	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
+		reg_val = vcpu->arch.mvendorid;
+		break;
+	case KVM_REG_RISCV_CONFIG_REG(marchid):
+		reg_val = vcpu->arch.marchid;
+		break;
+	case KVM_REG_RISCV_CONFIG_REG(mimpid):
+		reg_val = vcpu->arch.mimpid;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -338,6 +347,24 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
 		return -EOPNOTSUPP;
+	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
+		if (!vcpu->arch.ran_atleast_once)
+			vcpu->arch.mvendorid = reg_val;
+		else
+			return -EBUSY;
+		break;
+	case KVM_REG_RISCV_CONFIG_REG(marchid):
+		if (!vcpu->arch.ran_atleast_once)
+			vcpu->arch.marchid = reg_val;
+		else
+			return -EBUSY;
+		break;
+	case KVM_REG_RISCV_CONFIG_REG(mimpid):
+		if (!vcpu->arch.ran_atleast_once)
+			vcpu->arch.mimpid = reg_val;
+		else
+			return -EBUSY;
+		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
