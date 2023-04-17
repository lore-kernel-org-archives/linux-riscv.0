Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AA7C77B72
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 11:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i2cEQ/J/fQlvJfTgr17E2D9IUbjLsQPJf/hmlaRwZDg=; b=Xc4KwCmNkH7V0K
	nXkMdZdALfnfbYXD1jASS4DBoX//L2qkFGRFgri3hG9tgs7nEzYf+SM31OhhHyIyj9f/WQLTM/O2h
	XSKAr4wMHWBH2+ZY8sJxOxUkGtUTCNR/34XixCvcOrQH18UNoorjmGU+i5lm0Ty2D8WAKsIM/y4pK
	A/w3Ur+qE/MF21GLc6KXmOE+O0Q0VZDAzArZZc5t73jhvJhTvt0ejPf0uhxukp7e3OdarfjRZ1lBU
	9ZF7WjKKWpY25RQ2ZoqsjPOM4ceM9UWSZ2rZfLsXHl3omnaW3a2MkLw+khCWdCjAwn0ZNGovm2PN+
	xwgcsFWbOrboMMI9uxxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poNJ1-00G1mL-0w;
	Mon, 17 Apr 2023 11:45:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poNIz-00G1lG-0A
	for linux-riscv@bombadil.infradead.org;
	Mon, 17 Apr 2023 11:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WkJys4lm5+ZfOkWQ3oapO0tEPanlfT+GFGijOs2spG0=; b=T7xP7PaIZoVI309lzo2z0Czalm
	T9G7NSLiaj0jnF9ZzGD9ytJ3fAXvdXvOt++xvCKC7FBlGRaIUEK7hqvz/H7r/PqBk0GppT4/qO/g3
	eqRWSumXcwkilEj5rhTpptGguQr+B0VV9+iBN6E3d8FH0xG0DbN+MmZXUenoMSrtztvntfb8qHDZ1
	SongSMUyvNgNUqB5YYYg9TMlVzMnAa6VCW5s98NFMbAKcYdtPD4ByptVK7DsrTPX6FkJ+b4J7ruvI
	9ZsqYpitomBJedG0SmIxkb8y9JNDXjbPSpmAwz7YE4mcW8PlQEmoAIhQwWHAj6dWUr47vZZBe1lg2
	0qYJcX2w==;
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poMBj-00HICY-1s
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 10:34:55 +0000
Received: by mail-ej1-x62f.google.com with SMTP id sz19so5728110ejc.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Apr 2023 03:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1681727661; x=1684319661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkJys4lm5+ZfOkWQ3oapO0tEPanlfT+GFGijOs2spG0=;
        b=mtE8JaeO1ZGwJX/0Lf0kYnQ+twRVaaKvz/YedjzBnP8SgUDssZ1nx7y7TrdmMV2EIe
         Mez9Jw6sZ7sxuvXuYfcd+rm1EY0acVXNIbTjbC+Ky5QP6QOn7WCzR6vUSPfN3JoopB38
         KGhTanJEkzZQGOS82TeUwoQ4h1DTBcqYptis8iRBrkdPhIJLM3ft50IIh1v6U3G+tig6
         8CLTy99PjU+w+Z0Ol0oz4C35uErTETfjCERb+c9Yy7JXf66fX75L6yyyw4NC4Mi39rXA
         MMBHkFbee0qbQ/92S3/Ryv5IPRAqTiqCGIZCchl3sgb2rxrB5AAXb8GpQjeNnt0FFZWc
         4ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681727661; x=1684319661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkJys4lm5+ZfOkWQ3oapO0tEPanlfT+GFGijOs2spG0=;
        b=Vx5FD42Xl4zNo0S5kx0/ICyignbK5MfqzkbfBHE8MFrW+cgDS3MrcwNpz3VzmHOP7e
         DyMBaveupZ9G42tuHqehKp8UOQ45Fl2k11OEqwrNmD9WyGIxldfLi40P70tdNiD46A67
         t9zyGT7+xVD4w90h11zb5VnkF/5YCJr7MOgtnTvIIIXeN54RFJ1QR/kSV3DdEHT5kMog
         2aICJ0+V7VtFweBqco6J7/IkEcTLiI1W/78NMsAmOw3AbYtkSRhtLTA1oMMTzvzFeQwi
         d42w6O4Qik8ZBcALVLGIMZ/hCiDzR45hk5AhPgS13bwaz6hzQiRyBxf4SHh1rVUqSZIj
         YCAA==
X-Gm-Message-State: AAQBX9e/31PJiWrkfBkrWw1BfNYZwx/2G0MBX9YhQgvRUBLZWmIlbz+S
	fxNJSd6pDfZYTReZQIyAclxV1w==
X-Google-Smtp-Source: AKy350bLHjWenflvlkr2fY8irVGusSmu0BqFcNw3ayPOtmh85JDlyFKtj3Wo2DkozwMbaCQeLvV4Hw==
X-Received: by 2002:a17:906:c798:b0:94f:32ed:637e with SMTP id cw24-20020a170906c79800b0094f32ed637emr5736067ejb.59.1681727660978;
        Mon, 17 Apr 2023 03:34:20 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id y15-20020a170906524f00b0094e1026bc66sm6530926ejm.140.2023.04.17.03.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 03:34:20 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paolo Bonzini ' <pbonzini@redhat.com>,
	'Juergen Gross ' <jgross@suse.com>,
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: [RFC PATCH 09/14] RISC-V: KVM: Add support for SBI extension registers
Date: Mon, 17 Apr 2023 12:33:57 +0200
Message-Id: <20230417103402.798596-10-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417103402.798596-1-ajones@ventanamicro.com>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_113423_757761_8D7534AF 
X-CRM114-Status: GOOD (  11.59  )
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

Some SBI extensions have state that needs to be saved / restored
when migrating the VM. Provide a get/set-one-reg register type
for SBI extension registers. Each SBI extension that uses this type
will have its own subtype. There are currently no subtypes defined.
The next patch introduces the first one.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  3 ++
 arch/riscv/kvm/vcpu.c             | 62 +++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 5b6723c13301..172dc565e01a 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -186,6 +186,9 @@ enum KVM_RISCV_SBI_EXT_ID {
 #define KVM_REG_RISCV_SBI_MULTI_REG_LAST	\
 		KVM_REG_RISCV_SBI_MULTI_REG(KVM_RISCV_SBI_EXT_MAX - 1)
 
+/* Registers for specific SBI extensions are mapped as type 9 */
+#define KVM_REG_RISCV_SBI		(0x09 << KVM_REG_RISCV_TYPE_SHIFT)
+
 #endif
 
 #endif /* __LINUX_KVM_RISCV_H */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 72b4b3ef6ab3..56aec4c2521e 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -585,6 +585,64 @@ static int kvm_riscv_vcpu_set_reg_isa_ext(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+static int kvm_riscv_vcpu_get_reg_sbi(struct kvm_vcpu *vcpu,
+				      const struct kvm_one_reg *reg)
+{
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    KVM_REG_RISCV_SBI);
+	unsigned long reg_subtype, reg_val;
+	int ret;
+
+	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
+		return -EINVAL;
+
+	reg_subtype = reg_num & KVM_REG_RISCV_SUBTYPE_MASK;
+	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
+
+	switch (reg_subtype) {
+	default:
+		return -EINVAL;
+	}
+
+	if (ret)
+		return ret;
+
+	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu,
+				      const struct kvm_one_reg *reg)
+{
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    KVM_REG_RISCV_SBI);
+	unsigned long reg_subtype, reg_val;
+
+	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
+		return -EINVAL;
+
+	if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	reg_subtype = reg_num & KVM_REG_RISCV_SUBTYPE_MASK;
+	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
+
+	switch (reg_subtype) {
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 				  const struct kvm_one_reg *reg)
 {
@@ -607,6 +665,8 @@ static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 		return kvm_riscv_vcpu_set_reg_isa_ext(vcpu, reg);
 	case KVM_REG_RISCV_SBI_EXT:
 		return kvm_riscv_vcpu_set_reg_sbi_ext(vcpu, reg);
+	case KVM_REG_RISCV_SBI:
+		return kvm_riscv_vcpu_set_reg_sbi(vcpu, reg);
 	default:
 		break;
 	}
@@ -636,6 +696,8 @@ static int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
 		return kvm_riscv_vcpu_get_reg_isa_ext(vcpu, reg);
 	case KVM_REG_RISCV_SBI_EXT:
 		return kvm_riscv_vcpu_get_reg_sbi_ext(vcpu, reg);
+	case KVM_REG_RISCV_SBI:
+		return kvm_riscv_vcpu_get_reg_sbi(vcpu, reg);
 	default:
 		break;
 	}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
