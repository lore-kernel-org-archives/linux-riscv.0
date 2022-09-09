Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E10C6FA86
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 14:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o/8BPDLQn9l4fsXDBB+StWjGJ/HpUMxwosPQ/xhjuLM=; b=H2xUhAydPTYTmp
	ZwdZmfS4p/3FahmVYo16nigp5Cf2EQ5jjPft2ofGym3gTkdNL1iCD645L1PmkqJaBRnFPOEU5B0b8
	DBl8mk/M7T8yEsPJxFy16tb0ZRLesueyTryHhozG+qV3irfx8DNSWfVtUieJEPjNffwnhe7NwCdy1
	B3tvxhqdLsR9aiOH79OJcY3qFQKmzvS1ukE66/w1ijh8ULZVMUtQX6LhTvTdzIXynLYyjAhhIAn0X
	VQSM6wbgRa/lsrS0atUqyC88wR+ckgJ9Ojy6rdOPKoo32m40Vn5UxP/63K0ql9xtPKYzkOBbKTBNo
	nsdPq0WsXiw6t6Q8azgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWfEr-00GpD1-E1; Fri, 09 Sep 2022 14:44:13 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWfEl-00Gp8w-IY
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 14:44:10 +0000
Received: by mail-ed1-x52f.google.com with SMTP id b35so2911051edf.0
        for <linux-riscv@lists.infradead.org>; Fri, 09 Sep 2022 07:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ZscIA4unI47g9cHmq9kCd1DJd3OFd3rFM2bFM5Fr5h0=;
        b=bUEc1xgI6l8DN1CzlFpXa8YLF1M0B48kmco3oQRvUFO1kYa89zPbb13XITjostxEE1
         Ca8EcywBzITy2unkM8bNGgCAIvvick+Wko60JarBNJhzToYu8WBoc9gIovmEWtnhUMHx
         ZUk4gMKRmvwTqIWzp710nuuDMe0wqIk4M0YLOTHmprws1qmYYliiRmp4HzMJwyDLLYes
         qOPqJ7pIGlk4J/PJvEUUGbWExRDDh1xuHLqULSkiTAVTmXPbCEE7MjlFPennFTgpaEa+
         3yI/mesmZO46swsS7M8aDmccI7maHouDSVgY361RrcPwwZfN56URAZ3jILkd5Qd0sj0b
         sp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZscIA4unI47g9cHmq9kCd1DJd3OFd3rFM2bFM5Fr5h0=;
        b=hSq1h1WyJ2iN9Zxkp5EaN7XB/3Jum59WVLIblOCB5JYxl4IITuqSICadkDdvnT+DRR
         oq0OF6KlK9AEREQjfgBBFt9180DSyKqK+b11GgYpo7osTRpETlTrCvJ1XYgkYAGZ5Y1L
         dl6lIn9SSSm8lDdQ4ybBL08bb5bZxYb8FjeWoGMcqudUYXvDgsZ3PXSjfcpNPSYQe1mS
         0I297kc9mwQm+wdvn4cH8hVEVIW4ijRnQWccUlvUus6IZeO9CV3bQY7fcPWENs6odPdN
         j4ZyJIjQMww+/k8wdTArW5zLujFnIltnaPNzIeBImY+lTlNCUybPyZ8ANdLcKnxa5hZx
         bkRA==
X-Gm-Message-State: ACgBeo0obxSu2boxZrMc6uX7/r0HcH98DQQrA6WCIE2kC3iRISeeKepf
	EbsUTAvUnREloQCjEXk8YtlIMA==
X-Google-Smtp-Source: AA6agR5e4/MGy+nOuVfr62aNL1Y0RJydMmpicm5Hig7pe02PAhMnTEg7SyDZ9RKwE8Cl5oZ6Bn4a2g==
X-Received: by 2002:a05:6402:2753:b0:43a:d6f2:9839 with SMTP id z19-20020a056402275300b0043ad6f29839mr11415019edd.73.1662734643701;
        Fri, 09 Sep 2022 07:44:03 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id l3-20020a056402344300b0044604ad8b41sm494613edc.23.2022.09.09.07.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 07:44:03 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] RISC-V: KVM: Provide UAPI for Zicbom block size
Date: Fri,  9 Sep 2022 16:43:59 +0200
Message-Id: <20220909144400.1114485-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220909144400.1114485-1-ajones@ventanamicro.com>
References: <20220909144400.1114485-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_074407_706908_ADDD944C 
X-CRM114-Status: GOOD (  14.17  )
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

We're about to allow guests to use the Zicbom extension. KVM
userspace needs to know the cache block size in order to
properly advertise it to the guest. Provide a virtual config
register for userspace to get it with the GET_ONE_REG API, but
setting it cannot be supported, so disallow SET_ONE_REG.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 8 ++++++++
 arch/riscv/mm/cacheflush.c        | 1 +
 3 files changed, 10 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 7351417afd62..b9a4cf36be4b 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -48,6 +48,7 @@ struct kvm_sregs {
 /* CONFIG registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
 struct kvm_riscv_config {
 	unsigned long isa;
+	unsigned long zicbom_block_size;
 };
 
 /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index d0f08d5b4282..2ef33d5d94d1 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -18,6 +18,7 @@
 #include <linux/fs.h>
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
+#include <asm/cacheflush.h>
 #include <asm/hwcap.h>
 
 const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
@@ -254,6 +255,11 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_CONFIG_REG(isa):
 		reg_val = vcpu->arch.isa[0] & KVM_RISCV_BASE_ISA_MASK;
 		break;
+	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
+		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOM))
+			return -EINVAL;
+		reg_val = riscv_cbom_block_size;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -311,6 +317,8 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 			return -EOPNOTSUPP;
 		}
 		break;
+	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
+		return -EOPNOTSUPP;
 	default:
 		return -EINVAL;
 	}
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index e5b087be1577..f318b2553612 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -90,6 +90,7 @@ void flush_icache_pte(pte_t pte)
 #endif /* CONFIG_MMU */
 
 unsigned int riscv_cbom_block_size;
+EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
 
 #ifdef CONFIG_RISCV_ISA_ZICBOM
 void riscv_init_cbom_blocksize(void)
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
