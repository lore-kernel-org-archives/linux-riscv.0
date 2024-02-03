Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CF9C48297
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 00:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YprCgYI7mH+prWyUWEjyqu4U1WaoGhty8Yob28oTs0o=; b=GoL+GTZiMAnw8x
	zw36Q4t5gmBFGn+aNkTVP1juLwjo3kvFwyMe61mfAPy53qwkx9HU44Jp5hQ9r2U0Ily6Uw2FnHNpf
	bNKwurg5xgaZIuXrh3K1jSL+TAxQ3P3jJJm41BYag+rlfJ+MCcT4tNUWQf42iBQJVgO/dq0JDUqIb
	9XO/rbZQ4ShZzqA8fGFg9wZmFugGwDdLjlh5QifUeGEz//fffFoRO+VWNnKA27OMvm+LyN2uB5r1z
	r9tfe4cw488vz7JlwJgjyqlEr+6CVaRdhSJsQhnhKeiWkIjKr4tky7JCGZzrK1moatWTb7KOtYln8
	Js4k5roty3Q1aLMmckzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3b5-0000000DsXn-0Olw;
	Sat, 03 Feb 2024 00:09:27 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3b2-0000000DsVG-0PAB
	for linux-riscv@lists.infradead.org;
	Sat, 03 Feb 2024 00:09:25 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dbf216080f5so4180069276.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 16:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706918962; x=1707523762; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=OEEHd6q2TChurvVJ9QWQDtWt/fR7D+phxscUNFsCU/w=;
        b=2693572nlouLpI/pq1ue1Jz/zQxAPZCEDnpEQ4i2Itg0gv/LSQVYzQp43kY3cHKdY+
         kD+HcHbAIdB+egwZjLaQ1kYRBlRpSWQ3H7Y6aswWYe4r+037eS9h8dkh0BdtQw0npUb8
         TPpmsPRz5T5FpMHTFm3awwZA1t7n+qggwwrG8uGciBkU3t9Geyjx9UqmryAHhcBWPcDO
         l/JpNA1+pBXe34QbqY6YRdsWf/MnrzVfbokbOtX5RBQ+6aGxCeL+zR66qsy+Bsu5NZho
         neH4N9bbs51VfPDmBZxw0gdJEEMfS9pRJnFHwE6ifrK5Yc2wrYmBQ1uGDk/1BKvnHAXb
         xj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706918962; x=1707523762;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OEEHd6q2TChurvVJ9QWQDtWt/fR7D+phxscUNFsCU/w=;
        b=cwEGFZUJajcRSTZMpArMkVuj/qtBxzaiggmxdho6ZyTnxDFRnECbAFRnO820HQpNzf
         8UMgfUTXpYCUl2aVQjMD/G5LvS22o/6IkIPmXkoV3t7dO5MSk3XDdMiQs19AGFLV5Rp3
         3nHpJq69xfPViInGGVYH5AJCjhqGAGSJf8idH3W0oCXwmXGPWIfmGy2CgH+NrALeulKC
         8J2+tXdv1c7pfsvNjM6EzQRokJjDsswIUwCDDniEUPtDAN1f378LghzESlDrY/lbIJpH
         oTcVPG6658GhZeF2eZB7XGiWL0O1pPUfPXPfOZ3GhPRHR0lWPEntatBQIZcoC+tgOXVP
         o6wg==
X-Gm-Message-State: AOJu0Yy3RAsxQlO+vTafkUPRPKV/x+tLNcuebt1Vx6FSjSQdSa1DVoN9
	rO3Qu9rrmvqqUNYDt6Xxrz+hurI4W7BD8T5MYUxnlXwaJevJ7ykBSh/Y5HqnXXkxKU2ncuZoPWj
	law==
X-Google-Smtp-Source: AGHT+IEcnlTVvkgM/agP2AI7SK0XtZwpf1RNWRzpnYbOzQzjKWA86nEjOukuZ0+7uKPyvsge0rWvGPAYF88=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:2402:b0:dc6:e7e8:caae with SMTP id
 dr2-20020a056902240200b00dc6e7e8caaemr1059362ybb.0.1706918962763; Fri, 02 Feb
 2024 16:09:22 -0800 (PST)
Date: Fri,  2 Feb 2024 16:09:07 -0800
In-Reply-To: <20240203000917.376631-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240203000917.376631-1-seanjc@google.com>
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
Message-ID: <20240203000917.376631-2-seanjc@google.com>
Subject: [PATCH v8 01/10] KVM: selftests: Extend VM creation's @shape to allow
 control of VM subtype
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Andrew Jones <andrew.jones@linux.dev>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Peter Gonda <pgonda@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_160924_152580_9F06DDA8 
X-CRM114-Status: GOOD (  11.13  )
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

Carve out space in the @shape passed to the various VM creation helpers to
allow using the shape to control the subtype of VM, e.g. to identify x86's
SEV VMs (which are "regular" VMs as far as KVM is concerned).

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Vishal Annapurve <vannapurve@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>
Cc: Andrew Jones <andrew.jones@linux.dev>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Michael Roth <michael.roth@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util_base.h | 9 +++++++--
 tools/testing/selftests/kvm/lib/kvm_util.c          | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index 070f250036fc..d9dc31af2f96 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -90,6 +90,7 @@ enum kvm_mem_region_type {
 struct kvm_vm {
 	int mode;
 	unsigned long type;
+	uint8_t subtype;
 	int kvm_fd;
 	int fd;
 	unsigned int pgtable_levels;
@@ -191,10 +192,14 @@ enum vm_guest_mode {
 };
 
 struct vm_shape {
-	enum vm_guest_mode mode;
-	unsigned int type;
+	uint32_t type;
+	uint8_t  mode;
+	uint8_t  subtype;
+	uint16_t padding;
 };
 
+kvm_static_assert(sizeof(struct vm_shape) == sizeof(uint64_t));
+
 #define VM_TYPE_DEFAULT			0
 
 #define VM_SHAPE(__mode)			\
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 4994afbdab40..a53caf81eb87 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -276,6 +276,7 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
 
 	vm->mode = shape.mode;
 	vm->type = shape.type;
+	vm->subtype = shape.subtype;
 
 	vm->pa_bits = vm_guest_mode_params[vm->mode].pa_bits;
 	vm->va_bits = vm_guest_mode_params[vm->mode].va_bits;
-- 
2.43.0.594.gd9cf4e227d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
