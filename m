Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E24FC4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 18:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U4v65wXRReehNesDH1VXZP75PlV6AzLOzefJD6nDHJU=; b=tGoM4XTFabmeUz
	Oyu5eGVLvcHaiy7nVeFz+TPzVamVYSHGme/c0PgCUMNXArXHUdUjbKOT1O4mivATqYzApHrRvFlCe
	r+hkmBoHxPFWvNJQ2xLcbNjfL8bs4bJT9pX8RrlRDC3MZx+suIHUOoPRcWfVU+HupW+sO/3YnCmrw
	iNSx1rTyhtVxAlqiCZ5W/fCYLXkR2gZ2+F4t48rMWMpMvPSRvKG2+9qJDShrKmu8VcCKs/QE8JMID
	RJ/N2fZX6RNgJ0De1BKybkkXPomjgwjzKjxMhgLfGGmNCZaE1w7gPC8OLPTxi9v7OFlHYFhjcnofN
	lPiNg9iRp5j9RVl4d+kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZtf-00878x-0A;
	Tue, 05 Dec 2023 18:11:51 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZtT-0086oI-0R
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 18:11:41 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-54cfb03f1a8so1977137a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 10:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701799893; x=1702404693; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGYCF0lYfFZwlAJNLQySsaw2USjAgJVMDSNsMt1px+E=;
        b=ZCIX81Z0+OTLDrfFgRb9DT/9LUhptsqpt6D76Q07wAsdO91Y6O781TssLdn4LzJOVC
         TeriWhRL6n8zbooKyGby4GXcBqC+ltuSJYXjOLrKN/nue72hWD8mPGtooD6sflFlE9qJ
         t4Hs+ZU+Jqavsz+cYJYOVa+v1Ci3iez9SmFM8sHYktYbXtM0pldJwQAblyWLEDuRkaEF
         yS3vIFHWeqTpwIvb9mWXdB3VYaLuNmgYVfYc+kM9Z9q3U18gE/JZoUTfk6hDPstfHinZ
         2/QueRmYdespaR6WlekBjBQz7ak1BT8hmTnjWNoTRv0I6zBlURQ970CnP2YwJ6EFNDHw
         5ITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701799893; x=1702404693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UGYCF0lYfFZwlAJNLQySsaw2USjAgJVMDSNsMt1px+E=;
        b=VIVdg9+zVovZBUxStMEXvjOdBsNkgitp3tBfhE8mAciJSY0zMe5382lZ8MZeSKPA2Q
         P2gG4mXonbAW6PLm7PGjyjJwkLZMTwum/gxDTipwGLL4+HAkqeTxpB0NQgC8MWJY+iYY
         ncapgz9SNHUeU6Ose9K9VSidtZgLLhy9ZczZoDpv7iLHBkcmMutviyM7aLYp4QQjTmFf
         9YOo+UMae+vyP147NWJxw9mBsBK+Pce3MPkn++N02LvwXnuODaO5UWqWPhSoasxuFLWo
         6Ft9TL+Yy0Lv0BMJ6QaMVRTM6+ZAtOzEqvw6mt5nuCZGISF+XYyzfdJIAS8g3IKC3VUg
         uI8Q==
X-Gm-Message-State: AOJu0Yxz2n29O0yGwsduqQ69Lo3Pb0vHwchuX66UpGoYmZqOQowu71Gp
	yWh8YuJZvIqNDoF9OZ+MENu6yA==
X-Google-Smtp-Source: AGHT+IFXhQJgd4WuDK0vqiDOs2z5hzODiEbavQ83FAvF1/ZACRsn/G4hREGAaD8sLd+7Kvzj8A4axA==
X-Received: by 2002:a17:906:29c7:b0:a19:2f9b:5058 with SMTP id y7-20020a17090629c700b00a192f9b5058mr739678eje.73.1701799893545;
        Tue, 05 Dec 2023 10:11:33 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id i14-20020a170906090e00b009fd77d78f7fsm7039570ejd.116.2023.12.05.10.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 10:11:33 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	pbonzini@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgross@suse.com,
	srivatsa@csail.mit.edu,
	guoren@kernel.org
Subject: [PATCH v1 09/14] RISC-V: KVM: Add support for SBI STA registers
Date: Tue,  5 Dec 2023 19:11:29 +0100
Message-ID: <20231205181119.207204-25-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205181119.207204-16-ajones@ventanamicro.com>
References: <20231205181119.207204-16-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_101139_219492_779A7710 
X-CRM114-Status: GOOD (  19.64  )
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

KVM userspace needs to be able to save and restore the steal-time
shared memory address. Provide the address through the get/set-one-reg
interface with two ulong-sized SBI STA extension registers (lo and hi).
64-bit KVM userspace must not set the hi register to anything other
than zero and is allowed to completely neglect saving/restoring it.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  5 +++
 arch/riscv/include/uapi/asm/kvm.h     |  9 +++++
 arch/riscv/kvm/vcpu_onereg.c          | 41 +++++++++++++-------
 arch/riscv/kvm/vcpu_sbi_sta.c         | 55 +++++++++++++++++++++++++++
 4 files changed, 96 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 99c23bb37a37..ef56b850d46f 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -66,6 +66,11 @@ bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx);
 int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
 void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
 
+int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu, unsigned long reg_num,
+				   unsigned long *reg_val);
+int kvm_riscv_vcpu_set_reg_sbi_sta(struct kvm_vcpu *vcpu, unsigned long reg_num,
+				   unsigned long reg_val);
+
 #ifdef CONFIG_RISCV_SBI_V01
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01;
 #endif
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 86df125ef17f..8d4f15f1b189 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -188,6 +188,12 @@ enum KVM_RISCV_SBI_EXT_ID {
 	KVM_RISCV_SBI_EXT_MAX,
 };
 
+/* SBI STA extension registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+struct kvm_riscv_sbi_sta {
+	unsigned long shmem_lo;
+	unsigned long shmem_hi;
+};
+
 /* Possible states for kvm_riscv_timer */
 #define KVM_RISCV_TIMER_STATE_OFF	0
 #define KVM_RISCV_TIMER_STATE_ON	1
@@ -271,6 +277,9 @@ enum KVM_RISCV_SBI_EXT_ID {
 
 /* Registers for specific SBI extensions are mapped as type 10 */
 #define KVM_REG_RISCV_SBI		(0x0a << KVM_REG_RISCV_TYPE_SHIFT)
+#define KVM_REG_RISCV_SBI_STA		(0x0 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+#define KVM_REG_RISCV_SBI_STA_REG(name)		\
+		(offsetof(struct kvm_riscv_sbi_sta, name) / sizeof(unsigned long))
 
 /* Device Control API: RISC-V AIA */
 #define KVM_DEV_RISCV_APLIC_ALIGN		0x1000
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index dbd8cedfd556..c2819c99988d 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -1033,6 +1033,9 @@ static int kvm_riscv_vcpu_get_reg_sbi(struct kvm_vcpu *vcpu,
 	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
 
 	switch (reg_subtype) {
+	case KVM_REG_RISCV_SBI_STA:
+		ret = kvm_riscv_vcpu_get_reg_sbi_sta(vcpu, reg_num, &reg_val);
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1066,6 +1069,8 @@ static int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu,
 	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
 
 	switch (reg_subtype) {
+	case KVM_REG_RISCV_SBI_STA:
+		return kvm_riscv_vcpu_set_reg_sbi_sta(vcpu, reg_num, reg_val);
 	default:
 		return -EINVAL;
 	}
@@ -1073,27 +1078,35 @@ static int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
-static inline unsigned long num_sbi_regs(struct kvm_vcpu *vcpu)
-{
-	return 0;
-}
-
 static int copy_sbi_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
 {
-	int n = num_sbi_regs(vcpu);
+	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
+	int total = 0;
 
-	for (int i = 0; i < n; i++) {
-		u64 reg = KVM_REG_RISCV | KVM_REG_SIZE_U64 |
-			  KVM_REG_RISCV_SBI | i;
+	if (scontext->ext_status[KVM_RISCV_SBI_EXT_STA] == KVM_RISCV_SBI_EXT_STATUS_ENABLED) {
+		u64 size = IS_ENABLED(CONFIG_32BIT) ? KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
+		int n = sizeof(struct kvm_riscv_sbi_sta) / sizeof(unsigned long);
 
-		if (uindices) {
-			if (put_user(reg, uindices))
-				return -EFAULT;
-			uindices++;
+		for (int i = 0; i < n; i++) {
+			u64 reg = KVM_REG_RISCV | size |
+				  KVM_REG_RISCV_SBI | KVM_REG_RISCV_SBI_STA | i;
+
+			if (uindices) {
+				if (put_user(reg, uindices))
+					return -EFAULT;
+				uindices++;
+			}
 		}
+
+		total += n;
 	}
 
-	return n;
+	return total;
+}
+
+static inline unsigned long num_sbi_regs(struct kvm_vcpu *vcpu)
+{
+	return copy_sbi_reg_indices(vcpu, NULL);
 }
 
 /*
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index 157c199be0b4..073bc47013b7 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2023 Ventana Micro Systems Inc.
  */
 
+#include <linux/kconfig.h>
+#include <linux/kernel.h>
 #include <linux/kvm_host.h>
 
 #include <asm/kvm_vcpu_sbi.h>
@@ -53,3 +55,56 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta = {
 	.handler = kvm_sbi_ext_sta_handler,
 	.probe = kvm_sbi_ext_sta_probe,
 };
+
+int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu,
+				   unsigned long reg_num,
+				   unsigned long *reg_val)
+{
+	switch (reg_num) {
+	case KVM_REG_RISCV_SBI_STA_REG(shmem_lo):
+		*reg_val = (unsigned long)vcpu->arch.sta.shmem;
+		break;
+	case KVM_REG_RISCV_SBI_STA_REG(shmem_hi):
+		if (IS_ENABLED(CONFIG_32BIT))
+			*reg_val = upper_32_bits(vcpu->arch.sta.shmem);
+		else
+			*reg_val = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int kvm_riscv_vcpu_set_reg_sbi_sta(struct kvm_vcpu *vcpu,
+				   unsigned long reg_num,
+				   unsigned long reg_val)
+{
+	switch (reg_num) {
+	case KVM_REG_RISCV_SBI_STA_REG(shmem_lo):
+		if (IS_ENABLED(CONFIG_32BIT)) {
+			gpa_t hi = upper_32_bits(vcpu->arch.sta.shmem);
+
+			vcpu->arch.sta.shmem = reg_val;
+			vcpu->arch.sta.shmem |= hi << 32;
+		} else {
+			vcpu->arch.sta.shmem = reg_val;
+		}
+		break;
+	case KVM_REG_RISCV_SBI_STA_REG(shmem_hi):
+		if (IS_ENABLED(CONFIG_32BIT)) {
+			gpa_t lo = lower_32_bits(vcpu->arch.sta.shmem);
+
+			vcpu->arch.sta.shmem = ((gpa_t)reg_val << 32);
+			vcpu->arch.sta.shmem |= lo;
+		} else if (reg_val != 0) {
+			return -EINVAL;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
