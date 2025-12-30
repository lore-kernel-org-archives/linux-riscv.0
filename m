Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D345DEE01F6
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 23:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1AnnnU8ShheMshWVoClrfkITDh1o7cPfYeTu1/xffL8=; b=28mISGFF0FcHaH
	M6oVd/JdSA5a+5+omaA9emx0Crc04HoLt9GNZrTNqZpU/brglLEkNSI1mr3AzrsNlpuBGLoelqKGi
	4ntl3/T7RkjxGr3eTgwG7sdCFrzaZIM8MaW2itHO43jval32xPiR3QRPrfrvrhHOJXYWXesD/MTLn
	tRyCH4nLXB9mDl/7MCfvaJHpZP3Vy3u67SpTdZCbxQGfLtXGeHQTIJMxGqcjUKeoh9quU4tuR4cNg
	PwvsWAMA+ESEGcJ4gQkvlyILFd0Kc518nxcN95mb5Y+//buc4Tm6VtX0vLUK2cMWKHih8AO7PeLZ4
	0gqZiWB0l63BExiVIxoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaiji-00000005NPR-14O3;
	Tue, 30 Dec 2025 23:02:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijE-00000005MnH-4BRt
	for linux-riscv@bombadil.infradead.org;
	Tue, 30 Dec 2025 23:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sUaPNsiWybrsN14UDe2YJDAR+cxy5ZbGWPMbDaaniZw=; b=qxCk1MwNKapf2BEz/O01cSu8s8
	QSD6rTJchMab4xAHftW+ugIyLJin+EbzwdgoGrtuwFXAZe16/yeTb2ty7dwsScAP/DpzqrtFCvxbb
	8U5aRCsc/dYv3AyzFmvxL1/SwoGDvgZd6roNRcgCbGQ+F3cUvZPmxlgYEjxOoY9wnPmRVEtJgDxxn
	MLOLmcUL9aeZta+lEkNQJtuBM/A9DpSXUHLe2CTo4KWqzpsZW0OA3jxXXIlQBhOImsFKTvPDTQr1F
	Vo/uWNDW35wQzr1mfQYj3YSiDpW7cQL+BGT/ekyQIg/KrCz8RpSczeEqjbfsnTN+EUkWZuKsfDVH+
	pPgS/TwQ==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijB-00000004C06-0QMx
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:11 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2a07fa318fdso192970495ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Dec 2025 15:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135727; x=1767740527; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=sUaPNsiWybrsN14UDe2YJDAR+cxy5ZbGWPMbDaaniZw=;
        b=prUf8gqqWPTg/PGNDZscUaIf19NKpi8t5zStZLfTyLym266YdqPAUgKp8rLa78ycJE
         6lNeY1pW+OIO4bFbCuOFil4CY7O+dIMlMZ5M97YvEeluDwwUactWM9gjnu3c2JUWATU+
         W8GxPXsMe9PdfFdiUNsnsAfCxpHEMXGwQNUhLatTDB6S4CeBgH9rHSdJ0eW7rSUeJXUZ
         y2mPtEE5pH+mE8dR6aRfpxL5crTGx3+BKJUGDcRfo6N3+O88O8DeUenyHm4J/bm5aBNr
         YlZ45Q3EsCS+R/C6iJCauyh6+XVLw8sQsc5FZEPzlOrdvzc7TLVkSMaELSISv4tr3VgP
         WNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135727; x=1767740527;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUaPNsiWybrsN14UDe2YJDAR+cxy5ZbGWPMbDaaniZw=;
        b=ivHIt6+FxoiC43WQBT/4YqyKxtBpJdg521NKHgAUPsBx2S7SpuevtuN/t83YpvTFh1
         hQzBVLMuO5d993uHuikv9avAo1UlL1NBlSK8rRnljQ+fym9eqXdwHalSdyP+gVYKl9hA
         nJg9wgNn3VngRjWW/gYDXgD34g3CQqm5N3MoQ7LykzKmHx06Zg0DO6HXnOFbhVmnk7Rw
         9rwHUyk+n3UQaROqrbVYoQMS2MxizCO1bMS95+3DYs1tQjSTqg6rFYP3vET3ImHTW1kX
         qE1MazERjIDI+/b9jRavlmQNEmAkmLJkZvXYD7/Mn7zXjk8pYVp4to2c9dg7xJfegzDB
         ow0w==
X-Forwarded-Encrypted: i=1; AJvYcCWSO/sjSL0eGAt/FN1eESpBCOez2/ZcNEuXsJfDXoUqg5L3p+k/wRBtpIf4icdBDJ/4kDeznaVvkLeebQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyES2iRngqC1jKbbPiJ0kZeAMhcHavYYZoYODgBNnMMumTV9XiX
	I7pKpIago/oknHJwcLvqb/Vr5s89NFpFubz39roViasRK7IlgJe07e9wo8m7UUhiYWXXBGwL/jY
	1ITcpXA==
X-Google-Smtp-Source: AGHT+IFQnOuwYC0g4+LirB1coBfKvkA6ZwCBuTM8ay+vZ/F6ieVjqX4SvnIiidBDol06ehcl6JagnUzMopM=
X-Received: from plxx9.prod.google.com ([2002:a17:902:e049:b0:2a0:9ab8:a28d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2f0b:b0:2a0:9970:13fd
 with SMTP id d9443c01a7336-2a2f293cf1emr298922605ad.43.1767135726838; Tue, 30
 Dec 2025 15:02:06 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:37 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-9-seanjc@google.com>
Subject: [PATCH v4 08/21] KVM: selftests: Add a "struct kvm_mmu_arch arch"
 member to kvm_mmu
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
X-CRM114-CacheID: sfid-20251230_230209_321339_21ACA079 
X-CRM114-Status: UNSURE (   7.23  )
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

Add an arch structure+field in "struct kvm_mmu" so that architectures can
track arch-specific information for a given MMU.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h     | 2 ++
 tools/testing/selftests/kvm/include/kvm_util.h                | 2 ++
 tools/testing/selftests/kvm/include/loongarch/kvm_util_arch.h | 1 +
 tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h     | 1 +
 tools/testing/selftests/kvm/include/s390/kvm_util_arch.h      | 1 +
 tools/testing/selftests/kvm/include/x86/kvm_util_arch.h       | 2 ++
 6 files changed, 9 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h b/tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h
index b973bb2c64a6..4a2033708227 100644
--- a/tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h
@@ -2,6 +2,8 @@
 #ifndef SELFTEST_KVM_UTIL_ARCH_H
 #define SELFTEST_KVM_UTIL_ARCH_H
 
+struct kvm_mmu_arch {};
+
 struct kvm_vm_arch {
 	bool	has_gic;
 	int	gic_fd;
diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 39558c05c0bf..c1497515fa6a 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -92,6 +92,8 @@ struct kvm_mmu {
 	bool pgd_created;
 	uint64_t pgd;
 	int pgtable_levels;
+
+	struct kvm_mmu_arch arch;
 };
 
 struct kvm_vm {
diff --git a/tools/testing/selftests/kvm/include/loongarch/kvm_util_arch.h b/tools/testing/selftests/kvm/include/loongarch/kvm_util_arch.h
index e43a57d99b56..d5095900e442 100644
--- a/tools/testing/selftests/kvm/include/loongarch/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/loongarch/kvm_util_arch.h
@@ -2,6 +2,7 @@
 #ifndef SELFTEST_KVM_UTIL_ARCH_H
 #define SELFTEST_KVM_UTIL_ARCH_H
 
+struct kvm_mmu_arch {};
 struct kvm_vm_arch {};
 
 #endif  // SELFTEST_KVM_UTIL_ARCH_H
diff --git a/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h b/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
index e43a57d99b56..d5095900e442 100644
--- a/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
@@ -2,6 +2,7 @@
 #ifndef SELFTEST_KVM_UTIL_ARCH_H
 #define SELFTEST_KVM_UTIL_ARCH_H
 
+struct kvm_mmu_arch {};
 struct kvm_vm_arch {};
 
 #endif  // SELFTEST_KVM_UTIL_ARCH_H
diff --git a/tools/testing/selftests/kvm/include/s390/kvm_util_arch.h b/tools/testing/selftests/kvm/include/s390/kvm_util_arch.h
index e43a57d99b56..d5095900e442 100644
--- a/tools/testing/selftests/kvm/include/s390/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/s390/kvm_util_arch.h
@@ -2,6 +2,7 @@
 #ifndef SELFTEST_KVM_UTIL_ARCH_H
 #define SELFTEST_KVM_UTIL_ARCH_H
 
+struct kvm_mmu_arch {};
 struct kvm_vm_arch {};
 
 #endif  // SELFTEST_KVM_UTIL_ARCH_H
diff --git a/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h b/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h
index 972bb1c4ab4c..456e5ca170df 100644
--- a/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h
@@ -10,6 +10,8 @@
 
 extern bool is_forced_emulation_enabled;
 
+struct kvm_mmu_arch {};
+
 struct kvm_vm_arch {
 	vm_vaddr_t gdt;
 	vm_vaddr_t tss;
-- 
2.52.0.351.gbe84eed79e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
