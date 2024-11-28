Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D5ED6D250
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 00:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oqnGreosi1rQ9EB3fMiorj5yiDopt3M9SjAOsCf0uG0=; b=tyeGF/X1SrmHzG
	3xMK45j30cD7wzsjS563vn4UgAWpCjCFzHSWVZ1b6c9xChcBZMOBsmS+ecoIgz5S0Ghk2b/pwiGkE
	RTs689Nf/+Ti+WhienEbX5bdsoUcxkty0RJuXL84stLjgf36qtloYBv+j4Qet6W8SRqOB853yx25Z
	/jCTN4wMb9Wra1PEf9dlDY3YsCTEPcsu4dH/uYqcv5fV4phMBEug69sgflY0nQ4QKdgy0OgGRwFw0
	K7uLNyfonFAfHZPoZ58PAF1uGLf+XQ5JFiSviAcpII8vDvN5QLA2kA9IhFbua/jxACn7/EfdN3YrE
	OXpybxf80TFpiMlY6CYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSqw-0000000EMe8-3jdk;
	Thu, 28 Nov 2024 00:57:54 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSoz-0000000ELlG-2EM6
	for linux-riscv@lists.infradead.org;
	Thu, 28 Nov 2024 00:55:54 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7251d77d277so394799b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 16:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732755352; x=1733360152; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ziTWoMDGGemt4FbzSlGzzl5MJ7+5E+c66t+aoBco/o8=;
        b=xsB7Fz/qgcFYgYqlDgj8OprR1sfmiZ4uZemOZH0knmdMRSTHHAKI5WfhBIwON6BoP0
         Ua1dB1Plc9Y3t/y+/O5B5VuIm4xAF2/n3ULrJTKorBKcw8JKQxHreg3fMXDQ22qaMdJs
         O8EaKb6JMcj3PPsMvV9fwSzRww7Zt++hfTGv49JVxxEA3Yw+Rha03FOEVuxmBLSdOlmn
         cqNVV2nrhmiJcZQiPS97dyJgjUEA5WlaRvP6hbDKslpLRdei9Buw5arm61bWGYvgTVbR
         rilkgr4e+LeILCEhR829+3RnNGUfp7mdbjMT+8pm4E6TYGP6svR2sgge6wJFkLhHrzCf
         WSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732755352; x=1733360152;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ziTWoMDGGemt4FbzSlGzzl5MJ7+5E+c66t+aoBco/o8=;
        b=bK3FFxKuqRQBc8fEmgDPY6f/Z6axgxo/JU3t08JCAsu/i6OMlVJitV1/e08YcsXZGn
         h1vtYyCzgAyAbl/3XiTqtEG4kxb+s9NXOeFRyA56JYH/gudNQCrOj83qI1AsKQwRyO08
         YDZQOO1D3yEuz902o6JoT00Nln0C6OjXct8kTAkV0iXH1iRIgOnpDZXQX0WWnGjNhxxT
         +VVU40+upFTPTn7LpdICRcBdwQyipa/fScmcQCx6veLJ4WuZM9I2J3Nany1uEQV2AY5/
         TiqS3ngPpqfRIZ/Ue1ZbKipHFJLHGw+j/kBWHTPCUK87GODg6fa5D+DNMXe8bSF3D1ig
         6Tsw==
X-Forwarded-Encrypted: i=1; AJvYcCUifomss2jjg9Hs5Kj/iZ+Yl7/LcEjYoMteQEHzioADggNci5eCRDfmoTfn8z68N87jCyPFKht8XuohWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDOXLrTtzEDyCPS69oN+Fs3Cz/RTQcL8fUGyDYgyVLIaujFZ9p
	JSHrfrAsAmGCaf+VP7r637KIB5npgznEmQl8s1m7Xq/9AXZcV6M+15EIx0DQ0nwPqC6DBMYoc/D
	5VA==
X-Google-Smtp-Source: AGHT+IGFU4JhoxY8Wl9h7ACp8Vt7EFu0qd1J8Nu7Xlwl+xjZW64YiOpSApDQOPp2K//2LZM+CyuzFG/tlB0=
X-Received: from pjbnc6.prod.google.com ([2002:a17:90b:37c6:b0:2e2:93e2:fe46])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2252:b0:2ea:8b06:ffcb
 with SMTP id 98e67ed59e1d1-2ee08eb2b91mr6443403a91.14.1732755351961; Wed, 27
 Nov 2024 16:55:51 -0800 (PST)
Date: Wed, 27 Nov 2024 16:55:32 -0800
In-Reply-To: <20241128005547.4077116-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241128005547.4077116-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128005547.4077116-2-seanjc@google.com>
Subject: [PATCH v4 01/16] KVM: Move KVM_REG_SIZE() definition to common uAPI header
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_165553_560975_20B06E1E 
X-CRM114-Status: GOOD (  10.28  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Define KVM_REG_SIZE() in the common kvm.h header, and delete the arm64 and
RISC-V versions.  As evidenced by the surrounding definitions, all aspects
of the register size encoding are generic, i.e. RISC-V should have moved
arm64's definition to common code instead of copy+pasting.

Acked-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/uapi/asm/kvm.h | 3 ---
 arch/riscv/include/uapi/asm/kvm.h | 3 ---
 include/uapi/linux/kvm.h          | 4 ++++
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index 66736ff04011..568bf858f319 100644
--- a/arch/arm64/include/uapi/asm/kvm.h
+++ b/arch/arm64/include/uapi/asm/kvm.h
@@ -43,9 +43,6 @@
 #define KVM_COALESCED_MMIO_PAGE_OFFSET 1
 #define KVM_DIRTY_LOG_PAGE_OFFSET 64
 
-#define KVM_REG_SIZE(id)						\
-	(1U << (((id) & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT))
-
 struct kvm_regs {
 	struct user_pt_regs regs;	/* sp = sp_el0 */
 
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 3482c9a73d1b..9f60d6185077 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -211,9 +211,6 @@ struct kvm_riscv_sbi_sta {
 #define KVM_RISCV_TIMER_STATE_OFF	0
 #define KVM_RISCV_TIMER_STATE_ON	1
 
-#define KVM_REG_SIZE(id)		\
-	(1U << (((id) & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT))
-
 /* If you need to interpret the index values, here is the key: */
 #define KVM_REG_RISCV_TYPE_MASK		0x00000000FF000000
 #define KVM_REG_RISCV_TYPE_SHIFT	24
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 502ea63b5d2e..343de0a51797 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1070,6 +1070,10 @@ struct kvm_dirty_tlb {
 
 #define KVM_REG_SIZE_SHIFT	52
 #define KVM_REG_SIZE_MASK	0x00f0000000000000ULL
+
+#define KVM_REG_SIZE(id)		\
+	(1U << (((id) & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT))
+
 #define KVM_REG_SIZE_U8		0x0000000000000000ULL
 #define KVM_REG_SIZE_U16	0x0010000000000000ULL
 #define KVM_REG_SIZE_U32	0x0020000000000000ULL
-- 
2.47.0.338.g60cca15819-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
