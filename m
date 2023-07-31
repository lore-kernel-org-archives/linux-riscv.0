Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392E4C001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 20:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hBIw0zIF/U1seouI+SA/oiyNA1nh89f5lnxKdJdGzVI=; b=bPIVRItMtUApmY
	nn16Jbd9+O3Kk1jKgs4Km1KWxLwTNABf+8g1HXVhdmfxAjlInw9aFZh2IrBKDJBewahYlAIlpiFpK
	NSrTpP9ZXgTM4W8D/vIBWjbqesx9ELfFz0ykEd60zavhRAXhl4xMwa1ix4tR1bB7ODAjOt+fYO5eM
	GLg84dRxUwMhEeixKumonzOM9J19qwOH0ZwEJb1N1UKpHljmi9FErpHpa7RUkdBqiqLVgdJ5F4V+Q
	PLqweN8WV6/4v2DhYD+fPYAyaGoBUa9IRDMbTPFV21uhosen6dY77o/P+05vyX5Q/tuTAHTChXgVI
	lKEklQVMVF3Bdm6vHfbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQZXb-00HHVa-0q;
	Mon, 31 Jul 2023 20:30:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQZXZ-00HHUC-2T
	for linux-riscv@bombadil.infradead.org;
	Mon, 31 Jul 2023 20:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=j/i9xkXUzFsa6Pkem09fqHIKArwnqvvallRasjUEu/Q=; b=EfuIp+Bl5HsDrIQMsVO5PKZX/B
	gm9IYuT4Dfu8EEi1QOf+VokIey7yZVetE6SK8b30jabf8Y8ymluMBcMm/2EPSte/OTxzcsAJFi6qA
	WM1WHVBz/C2xKAQLly72njpxCueqPuJ6KbJgtL0t4Qz1ubwVtX9qNDH9u4z5eGNRxsqmxZ/l0lz1z
	bWNc1lfFcRXljyg6hv2Tp6kNLaEI4zdLMHv0VxvuZPacUrkbQHRZ5E2QLfTTEdGPU0o4RUgz8T204
	vo0OG2ip3J12KmOz9Bl7xVMZ55QxV3ec+u22PaQTSxR3ZssTvpMREcAxxtsJ6jCERUqGzfyhAQ7jv
	AXY1dWqg==;
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQZXT-00D3bJ-34
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 20:30:52 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-585fb08172bso30712737b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 13:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690835433; x=1691440233;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=j/i9xkXUzFsa6Pkem09fqHIKArwnqvvallRasjUEu/Q=;
        b=ol/D1vn18oUZ3ioRq0LZxOfrfi4QKNP+IZMw82UVNYZJEQrg2p9TSQdhmZ557zjjK8
         YNLay9PTTld/yHQCES78q6zZA15L8qfGm2yWGPxnyouCaj3qwYLG7n+hX9/Z/TiGB1XH
         ZVFtjTev1VmpfWObXi4tKIdIa0k97i1lFZRWxpr9fL/ucywTEMv5u1QquYLWoaag9TDq
         steoZtkQhU1j9PzEHd09Pwvd+ClCnQ4gbS1TpSLnbEIoJaoWg5RhujHskm+ScEWrcmpE
         OhllDSmtXMn5tlecwjurFBTPTPfmxFpH32EowR/qsMrK7SL96pfS+/1oBQPBcKz4O17M
         evGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690835433; x=1691440233;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/i9xkXUzFsa6Pkem09fqHIKArwnqvvallRasjUEu/Q=;
        b=LRIkY/Empu0mpv+7TuCrxTn93MqsN80My6E7B6RlqMAEN4sUzxtxa7qIdetZ7nckbM
         mL8OIR/lf6k6Vy6aeQ5hNEsqufOs3lctsobi8ChDIjeme5egnoBlPodYksSKPR8BlKmn
         3T0EpWRR962bS2jQrvy1VarcOXWsRjSo7DXrCahx3cl9CdeNoYvlzCqWNaaVBXpBAH2J
         UPN3Y6iO+7H1AF1+v/uhR2XLddBs4AhQqDeMUvtiCtgaebPkHxnRyyRgmES7BTjqQtrV
         ePcZHcyFpKscgZqWBqKaSCnWHMWEwvhfq2OtyZOFth5t3N+NYpP0ZZWfTLJdfGpt9RRV
         Zdqg==
X-Gm-Message-State: ABy/qLZlJULjcQtBI058pjL1BhRmST3xhFDKc1+JrL+Rvx215yoXaq37
	Dm8zpt5o5+YkqWrItDHxynCLlXMBhQ4=
X-Google-Smtp-Source: APBJJlHnKeYGeke3T6jeKytixQbOPuqvl7ziFDlXl7orfIvlptiiMkpoyewzKifvDo54ZaWDy8BplTeEvh0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:70a:b0:581:3939:59a2 with SMTP id
 bs10-20020a05690c070a00b00581393959a2mr85126ywb.3.1690835433789; Mon, 31 Jul
 2023 13:30:33 -0700 (PDT)
Date: Mon, 31 Jul 2023 13:30:25 -0700
In-Reply-To: <20230731203026.1192091-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230731203026.1192091-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
Message-ID: <20230731203026.1192091-3-seanjc@google.com>
Subject: [PATCH v4.1 2/3] KVM: selftests: Add #define of expected KVM exit
 reason for ucall
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Aaron Lewis <aaronlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_213048_569872_15AD81D2 
X-CRM114-Status: UNSURE (   8.50  )
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

Define the expected architecture specific exit reason for a successful
ucall so that common tests can assert that a ucall occurred without the
test needing to implement arch specific code.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/aarch64/ucall.h | 2 ++
 tools/testing/selftests/kvm/include/riscv/ucall.h   | 2 ++
 tools/testing/selftests/kvm/include/s390x/ucall.h   | 2 ++
 tools/testing/selftests/kvm/include/x86_64/ucall.h  | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/aarch64/ucall.h b/tools/testing/selftests/kvm/include/aarch64/ucall.h
index fe65fdf4f0d3..4b68f37efd36 100644
--- a/tools/testing/selftests/kvm/include/aarch64/ucall.h
+++ b/tools/testing/selftests/kvm/include/aarch64/ucall.h
@@ -4,6 +4,8 @@
 
 #include "kvm_util_base.h"
 
+#define UCALL_EXIT_REASON       KVM_EXIT_MMIO
+
 /*
  * ucall_exit_mmio_addr holds per-VM values (global data is duplicated by each
  * VM), it must not be accessed from host code.
diff --git a/tools/testing/selftests/kvm/include/riscv/ucall.h b/tools/testing/selftests/kvm/include/riscv/ucall.h
index 86ed0500972b..be46eb32ec27 100644
--- a/tools/testing/selftests/kvm/include/riscv/ucall.h
+++ b/tools/testing/selftests/kvm/include/riscv/ucall.h
@@ -4,6 +4,8 @@
 
 #include "processor.h"
 
+#define UCALL_EXIT_REASON       KVM_EXIT_RISCV_SBI
+
 static inline void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
 {
 }
diff --git a/tools/testing/selftests/kvm/include/s390x/ucall.h b/tools/testing/selftests/kvm/include/s390x/ucall.h
index 47ad4b1fbccb..b231bf2e49d6 100644
--- a/tools/testing/selftests/kvm/include/s390x/ucall.h
+++ b/tools/testing/selftests/kvm/include/s390x/ucall.h
@@ -4,6 +4,8 @@
 
 #include "kvm_util_base.h"
 
+#define UCALL_EXIT_REASON       KVM_EXIT_S390_SIEIC
+
 static inline void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
 {
 }
diff --git a/tools/testing/selftests/kvm/include/x86_64/ucall.h b/tools/testing/selftests/kvm/include/x86_64/ucall.h
index 05cc69b0d550..06b244bd06ee 100644
--- a/tools/testing/selftests/kvm/include/x86_64/ucall.h
+++ b/tools/testing/selftests/kvm/include/x86_64/ucall.h
@@ -4,6 +4,8 @@
 
 #include "kvm_util_base.h"
 
+#define UCALL_EXIT_REASON       KVM_EXIT_IO
+
 static inline void ucall_arch_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
 {
 }
-- 
2.41.0.585.gd2178a4bd4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
