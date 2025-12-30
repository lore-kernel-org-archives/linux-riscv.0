Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE4BEE57C2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 23:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b3xI4YNuT/Ryn2RQJ6ZX0hmAtpMXUP05+7aRFCgxM1E=; b=bKV7fJPlFP4n7q
	FBCORFqW9ty5Ap15hTsTDfFU6zlJ1+HsNqct4VVVX3fgoELNEwClIkzkAN2uum80ADXBImtwCaK9w
	Sg1nRIePoUTFnoLiH5W/k5jHpHbkQ+Y+ONm0BaemBmkAA6AotM/csIJrKZ3x01pglwKs5hJHM6YWk
	oDcyMONK5wj7157uoyqZwe8xzat053kyn2LzANn6lNqIHW6z8CMt9AHjCNHxwfI9Whpi+f5tbJv1D
	hEVLKFtKncCBG+jgrAnmS0tYCZJA/7YJGEG5P+qsdFEFJpzZEaL4TdI3c0yz4KyHbyq5InSQBiN5m
	g8bE+d9liiuyFQ7StYfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijF-00000005MoX-1Gll;
	Tue, 30 Dec 2025 23:02:13 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaiix-00000005MfM-3Om1
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:10 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-34c7d0c5ed2so10826331a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Dec 2025 15:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135714; x=1767740514; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=DRWkfiIT0OBRt/HR5AGE/0OZHtoELcBJ5J9uDz4mIeY=;
        b=us5FCwSLRVbM0IxAjY3C/CRp4RRruc/fisb1aRwA7SNHTQIaWWFgxlHAeaw+y8bBFp
         Tn9txB1HKQJw5fbY8f6hSGFbwBN4AI6uIMj2Dh2hc5LqivlH2pm4WrQsw4+5AQspnOTA
         pTWzfEFjRAECWNmagBi4AU+kFNviYozZVkoRHgWDxiH96wLq0EA0X63j2NQNH8YWaIB0
         7lFvmXj9dbMNlKjZK+08aseWs6AyclP1fvXidqgi7203ytcDMND2MQViDNFtOgacNRPK
         TWI2tMmVsuSq1/emPgooiJ3odA8GMBqI/dtgMfV5vTVa23MbD16GwYrYBtWNVeC02sIP
         E9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135714; x=1767740514;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRWkfiIT0OBRt/HR5AGE/0OZHtoELcBJ5J9uDz4mIeY=;
        b=LVEMpwIn8pPR5oBWpf3gBQ+sPqYrubHHBdlb9d+zA2CfLkJ9zCLazUCu01RWoGZZRL
         CXt5KSkG04HLZebDwUyBqH5vKDtUXnVgSFo69INyGD0ZniF4h6xSembFvqpoJmNbJucp
         x82t6nIYL4ElyfxDg3o9xwH7OGG4x61ze+8Jyq0L7HtokBaViIjZRVpkFpdwsC5jP/Fc
         jmvUYpE0sbVBMUNoxVVtuCuGkKzlidvaXmEN0TokaizPre0k8vZhbVjUbX6DrBfXpYpP
         P/AX7aEktz1fWi/NAQbWlRIbsVMV3Sy/3uFqpGNvmNwZn/VRGGkjgsPdQIIOWWXjPC+a
         Jrpw==
X-Forwarded-Encrypted: i=1; AJvYcCU04yR2mqKqOH8T93L91eyQ6CohXIORIJ36OiTq2OSvDsO9GYAp43Xg7wSugWZpdHQiPrc/WZSrveGPdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjI1LiKoZu3YbbQ2AXzs7HNkzsP6WfNy3sRdLeHV4wt+9N/t6x
	n7CqKtOsKypI/gxhL2LUkOj3uwFB5J+xwtZPH4QXbHoOVFKi9XdxIe2D5YzcYIvsSerlT5b53XZ
	euh6auA==
X-Google-Smtp-Source: AGHT+IFqovkU/eUlOykY6HWolLjXCahq1FJtAZ+GEK7lClBpAjuVhdcXVPtQL/MTMKhhYaxAhrGpJ6Ohw/A=
X-Received: from pjmm16.prod.google.com ([2002:a17:90b:5810:b0:34b:fe89:512c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2f47:b0:34c:3501:d118
 with SMTP id 98e67ed59e1d1-34e9211d455mr26888073a91.1.1767135714342; Tue, 30
 Dec 2025 15:01:54 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:30 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-2-seanjc@google.com>
Subject: [PATCH v4 01/21] KVM: selftests: Make __vm_get_page_table_entry() static
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry.ahmed@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_150155_840226_36EB2864 
X-CRM114-Status: UNSURE (   8.69  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Yosry Ahmed <yosry.ahmed@linux.dev>

The function is only used in processor.c, drop the declaration in
processor.h and make it static.

No functional change intended.

Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/x86/processor.h | 2 --
 tools/testing/selftests/kvm/lib/x86/processor.c     | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 57d62a425109..c00c0fbe62cd 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1367,8 +1367,6 @@ static inline bool kvm_is_ignore_msrs(void)
 	return get_kvm_param_bool("ignore_msrs");
 }
 
-uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr,
-				    int *level);
 uint64_t *vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr);
 
 uint64_t kvm_hypercall(uint64_t nr, uint64_t a0, uint64_t a1, uint64_t a2,
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 36104d27f3d9..c14bf2b5f28f 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -306,8 +306,8 @@ static bool vm_is_target_pte(uint64_t *pte, int *level, int current_level)
 	return *level == current_level;
 }
 
-uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr,
-				    int *level)
+static uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr,
+					   int *level)
 {
 	int va_width = 12 + (vm->pgtable_levels) * 9;
 	uint64_t *pte = &vm->pgd;
-- 
2.52.0.351.gbe84eed79e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
