Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89359CEE326
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 15:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/NMQK4v9b+SIS+zpqH955iWrYyKtyqw2sYJFtGUngWk=; b=hyppl21G9m45Q6
	AGUB9eqBA9nJEh0iC1vF0MspLredlrXnQMUGOef5DrqibseVekXAywROlRGt2aMSWCee6XyO3Ilt2
	Hg7AESwUUum7ztjIKYSrjL/yQhlgBxBfg7ahfYQyyQAyPwFBVLfO3ZFh59pdXezAxHAK9NNzxzlnE
	a0H4zLly97mdzm+B/M1IuQKUJoCG/rLuwm5uOGLdTE1ggIstKt9+38BViMX7/EWLbRG1TARriHknD
	UD8H/BBM99zMjJVtiZiuQdtPc27oWjvAle/1qYxrdO24dX7hG4Qa+3X4mKUFBorCQnmBN5L9UQ7Ea
	wcNytpuS8ZafNcFNu4Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syZ0S-00000009opu-05RX;
	Wed, 09 Oct 2024 15:53:44 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syYwp-00000009o0r-3t50
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 15:50:01 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e20e22243dso95817b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 08:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728488998; x=1729093798; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=+3zZkwU+2EpnRGguJhn2Ww+Ghmvy6uOMqwsBdHy8Row=;
        b=o1SM8sUi3uyBKzD0RS9Hdc1tAy5RixVodCwIsX9rKdvgZfvcxEOBbdeJaEd1+yr8O/
         aeYHRfGSF2lTN2B41ZzkI7MGa6kC7Iise15c0uuYG8+KJk0PZ8BVLVa7v6puxu26hv0q
         0XQP5l8AW4eCjFq1oYE+qt5dVGU7zREjE0GxDKrLDEwp2kMXd0Bqiik+l+1O1CeHINim
         NnzKbAZ7UY3WRfYVNkFcbWboAWsjGmNzGFQcO8PIkoZDD8H7R6UmaN/Zwmr4SFk8u6KL
         c9BySFciw56BJTDaxsmV4+pDEnT5VLVtKguEEXAxl2quKFRQd1dRid4pPS6usJzoBR4f
         90gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728488998; x=1729093798;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3zZkwU+2EpnRGguJhn2Ww+Ghmvy6uOMqwsBdHy8Row=;
        b=Qil0CkUGTjq5Um4bVU+WoxSjzRSXlmrxGNXduQGOOUDAGYq7oJjrgvreDkymMsPsiW
         Kj5uo7JCAdqqcxL73rkUcpXXfa3SAx7OYpXaq3xnPeeQm8v5vZM0wX4qMaWzLP+2HWBK
         Xq/6WheuLwwGfnssni8V3P5H/q/N2lC0Md/sQZjKNJeXovlQlt5eG5PBp6YZxi9hNfYB
         f7f1+modNOv5zL/t5qYJOmwhDI1I9TLIt+QNi73mszI3nH6Sj/tes7QF06si5QqvDNrX
         sOu+OVuc/lRUrxtI1oaeZfIWZRuWYxKLBec0tAn1B2wELyAFol5EI2Qh993AHkcCx9Uf
         YsVA==
X-Forwarded-Encrypted: i=1; AJvYcCXoeAdCBZpPqDPklXqAImXdmsrjQ9t37G19m6vz+QLG2WQ9SbvXGEmIIgyycPT0oNWp+jIR3SmjKrTkOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ4gqGceeTc9gVaUB79PvPDeSS//gkviU7oVj0t9LfoW39ePR/
	+UXxbp7hEWQ55MiZOJI+vYVDTzLSRwEFL3kAXfvEldpwg47gBhLM00H1QIDnq5s4EBAULQjG+uJ
	F6A==
X-Google-Smtp-Source: AGHT+IGq8S+cJ3hbYyw4prFkdU6bbiVB3Ddo6czJU4p6VUDHrgM9P6PS5yQttOYl+xpjVaNBwpEpnchtMNk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:460d:b0:6db:89f0:b897 with SMTP id
 00721157ae682-6e3221683d8mr69407b3.4.1728488997664; Wed, 09 Oct 2024 08:49:57
 -0700 (PDT)
Date: Wed,  9 Oct 2024 08:49:40 -0700
In-Reply-To: <20241009154953.1073471-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241009154953.1073471-2-seanjc@google.com>
Subject: [PATCH v3 01/14] KVM: Move KVM_REG_SIZE() definition to common uAPI header
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	James Houghton <jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_084959_977953_1FAF3321 
X-CRM114-Status: GOOD (  11.26  )
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

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/uapi/asm/kvm.h | 3 ---
 arch/riscv/include/uapi/asm/kvm.h | 3 ---
 include/uapi/linux/kvm.h          | 4 ++++
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
index 964df31da975..80b26134e59e 100644
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
index e97db3296456..4f8d0c04a47b 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -207,9 +207,6 @@ struct kvm_riscv_sbi_sta {
 #define KVM_RISCV_TIMER_STATE_OFF	0
 #define KVM_RISCV_TIMER_STATE_ON	1
 
-#define KVM_REG_SIZE(id)		\
-	(1U << (((id) & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT))
-
 /* If you need to interpret the index values, here is the key: */
 #define KVM_REG_RISCV_TYPE_MASK		0x00000000FF000000
 #define KVM_REG_RISCV_TYPE_SHIFT	24
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 637efc055145..9deeb13e3e01 100644
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
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
