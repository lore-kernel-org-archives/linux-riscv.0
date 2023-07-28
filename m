Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142B0EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 21:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=25/05tYZXStRQxklcuur2V3+qavXT0C2E7vLOh8eD/A=; b=Hs9oXTD0NdSIu1
	pHa5lV9FggAyYKSAVNQ2dXDMh9Ml20uQPx5L9q1Dl8ClO/auHZmI6PJ3j12sb5yEey78rH/5Yjxjc
	JbYWYLueHqOGf9TyT7m7OriAPDkNUmLifOk6zChY9evinGOgzQqtvQf0T8uUCkPZd5MzqZI/8uWQ5
	ONI1i+aiU3OQzLsEMQiQYaMKzVbbzNjL0L4IfTZsPppTbknmVymBOl5JLedxAhK9Pw5WiiuWd20z7
	M0kTIBD3XbdKj953GNO3nXqQFJz1FU+VhOzqzS8mVror6oQVXqnJfRoswhaf85qI/0ukhg9Ffqh1a
	kVaBji2nek1LowWLCU2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPUae-0051zy-1W;
	Fri, 28 Jul 2023 21:01:36 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPUaa-0051xO-3B
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 21:01:34 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6bb0cadd3ccso2173940a34.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 14:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690578090; x=1691182890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFtwvHzLUf5NSAoO+eWuJDzHkMB9r0GqcjuVDz6J8fc=;
        b=pAaNQW24ZWjKwIrSX3bM+7any3SzG9Dcg/xEkCSEiBAO5Ntnzn3EE6uuAmnjYdYk2Q
         JfXb2u/mScYaWtJ7UbstMvTt90gKUK00vEIE/7fEwWVS519+pNY7gykuXFiuo2u7mgDZ
         gq1aJA9eVriNzZkkpARBuIMhujzWmaGhhlKLKBt6G1j5nn+7maMTkKREjauCd3WOvy5M
         mAGOySSIB7YmRlxoBEGH8gqkIYhzzrgRw6aEFswVc2xoEaQnpegUBaLbXK2WnMHwerfK
         WEn7hz/+LSdn6NJz+e/93Xs+yrtRm7Zl6LTyphS0QAkh7chyXjjTRNg7h6WaVbihrOcp
         aGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690578090; x=1691182890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFtwvHzLUf5NSAoO+eWuJDzHkMB9r0GqcjuVDz6J8fc=;
        b=dz55oOn7JhfykEtvDqC10L0OhNJJKHowFyaYRm4kWDGFtRY4KKA5wSppvAXi1lNcgJ
         BKVm+2lViPom+FbKsDGz5+vvIv/y76S7iQ3PSEF3qLhSW4iRsHGpDEkAzZQSeipRyB5a
         bCh+hYuxN4GYnRP4Mk3xfE//G24FJB9+oAYwCBANmHcPs0US48Js6KT36Lm8xTVGp+22
         teTNMNlZ/0XdX6CyW503RF6C1phZc339D5/7mUkseTX7x0re8cTCKeG5yEcboIK84nhv
         +onGvdAgYhP+xYrO/N6Q/JWD2YCDtTuu/v6V1SNHolJyWwGt7yVLKN8FWjoFldGPWu2C
         MOEQ==
X-Gm-Message-State: ABy/qLafHuHUp2RW5pgSJmTG+g+LFe6Dgg25l6DiluYymb9k5CuQJU5e
	bLTfsEXXczqRuDudEfDjAkAb95eIuVhUFltmfvReUQ==
X-Google-Smtp-Source: APBJJlGFxN5w1wqhoG4W9fTYv9xNGtBCO8MiWkbh5KrryNE8D3Qf7sgMmcNODSyqTqQRMmSPsaELMw==
X-Received: by 2002:a05:6830:1e71:b0:6bb:1c21:c52e with SMTP id m17-20020a0568301e7100b006bb1c21c52emr3676325otr.15.1690578090156;
        Fri, 28 Jul 2023 14:01:30 -0700 (PDT)
Received: from grind.. (201-69-66-36.dial-up.telesp.net.br. [201.69.66.36])
        by smtp.gmail.com with ESMTPSA id n11-20020a9d740b000000b006b9c87b7035sm1987769otk.18.2023.07.28.14.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 14:01:29 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 1/1] RISC-V: KVM: provide UAPI for host SATP mode
Date: Fri, 28 Jul 2023 18:01:22 -0300
Message-ID: <20230728210122.175229-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230728210122.175229-1-dbarboza@ventanamicro.com>
References: <20230728210122.175229-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_140133_036793_58D7C0E4 
X-CRM114-Status: GOOD (  12.84  )
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

KVM userspaces need to be aware of the host SATP to allow them to
advertise it back to the guest OS.

Since this information is used to build the guest FDT we can't wait for
the SATP reg to be readable. We just need to read the SATP mode, thus
we can use the existing 'satp_mode' global that represents the SATP reg
with MODE set and both ASID and PPN cleared. E.g. for a 32 bit host
running with sv32 satp_mode is 0x80000000, for a 64 bit host running
sv57 satp_mode is 0xa000000000000000, and so on.

Add a new userspace virtual config register 'satp_mode' to allow
userspace to read the current SATP mode the host is using with
GET_ONE_REG API before spinning the vcpu.

'satp_mode' can't be changed via KVM, so SET_ONE_REG is allowed as long
as userspace writes the existing 'satp_mode'.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/csr.h      | 2 ++
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 7 +++++++
 3 files changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 7bac43a3176e..777cb8299551 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -54,6 +54,7 @@
 #ifndef CONFIG_64BIT
 #define SATP_PPN	_AC(0x003FFFFF, UL)
 #define SATP_MODE_32	_AC(0x80000000, UL)
+#define SATP_MODE_SHIFT	31
 #define SATP_ASID_BITS	9
 #define SATP_ASID_SHIFT	22
 #define SATP_ASID_MASK	_AC(0x1FF, UL)
@@ -62,6 +63,7 @@
 #define SATP_MODE_39	_AC(0x8000000000000000, UL)
 #define SATP_MODE_48	_AC(0x9000000000000000, UL)
 #define SATP_MODE_57	_AC(0xa000000000000000, UL)
+#define SATP_MODE_SHIFT	60
 #define SATP_ASID_BITS	16
 #define SATP_ASID_SHIFT	44
 #define SATP_ASID_MASK	_AC(0xFFFF, UL)
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 9c35e1427f73..992c5e407104 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -55,6 +55,7 @@ struct kvm_riscv_config {
 	unsigned long marchid;
 	unsigned long mimpid;
 	unsigned long zicboz_block_size;
+	unsigned long satp_mode;
 };
 
 /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 0dc2c2cecb45..85773e858120 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -152,6 +152,9 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_CONFIG_REG(mimpid):
 		reg_val = vcpu->arch.mimpid;
 		break;
+	case KVM_REG_RISCV_CONFIG_REG(satp_mode):
+		reg_val = satp_mode >> SATP_MODE_SHIFT;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -234,6 +237,10 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 		else
 			return -EBUSY;
 		break;
+	case KVM_REG_RISCV_CONFIG_REG(satp_mode):
+		if (reg_val != (satp_mode >> SATP_MODE_SHIFT))
+			return -EINVAL;
+		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
