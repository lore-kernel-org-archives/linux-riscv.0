Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5743EC369DC
	for <linux-riscv@archiver.kernel.org>; Thu,  1 May 2025 18:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XWu3oNI9gqDDF7kFwWdEqmAE65aoRTSKzYBm3kydofg=; b=Qnl+qoSifDiaCrX3wLV3Otglty
	WMtLAkHVpZDKmTgtfpkIR0rExzxdzFaFEgIMn393k8tv3aY8qkqlkIECot2N22gFvcCiOEjYbXrnt
	7ZL26t+GdSLfl99Vjjz61UgUPvWSIjpGJ8UQfdayJU9BhW9dNS5pNF57iJJGV9TMv/kl1sFYZ5EzQ
	lv4+e+gbnuFQvPk7srDoOZc9Mxh7WeDBPcCVKGYrlbNI+Ow8RL7nW81iKOTghXJCr+DluZWViKIxU
	FmsuO7IKqLkcjfyfQJe7arLgupNolfMA8DJdmqZZyjBOdCRrWUxNABkq4Ac7IE/G8mgd9winR4xve
	nSQtXPiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAYmZ-0000000GNuM-0UOf;
	Thu, 01 May 2025 18:37:15 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAYim-0000000GMwf-1euI
	for linux-riscv@lists.infradead.org;
	Thu, 01 May 2025 18:33:22 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3087a704c6bso1284395a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 May 2025 11:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746124399; x=1746729199; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6OIbU+P+6LX7gXLQRg/LGs6gF16rvs92LA9pz4G+MTw=;
        b=u5el3O9O+TR2f9esv2LLYG7Fce7zWDVGyV/sU1D8Dqf2VkiGtgMr7pZu9sQ/KLpdxl
         c2UcKKxOrrq7nZ2fVLciLdiCcEThYr6bCw7ZgjCjKpYqP9j4CIAr82oYJF+k4j+XFBjp
         GwgIb99DfBkiggSX+spPaN7hSw2vdZpZ78HCtQvGgRVbDqj61VxEOzPK2iQWkqypSe8k
         OtbA51b8xWtHX5viKhq7bZv775+IYeKtUZGd1oeeKqL546McmgO3GzvSbutNdWSLMsJO
         SMx6nePyJp5GG217YC8OebH6Wa+mPj4anAiWvO7vMYHMijfqNfpHYC8EcAEkzf8Qhu04
         CQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746124399; x=1746729199;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6OIbU+P+6LX7gXLQRg/LGs6gF16rvs92LA9pz4G+MTw=;
        b=j5EqvFyVPuyjTJztWRwVu8l98Rx1KUEbJbuh7ehm8ZzaABZgIY8OpD9kIX4bSCiySv
         BnyqSGkJSoiDC7x3hvRSwYHz5Ep8UQKmyK7vCaKx0FbJIG14ETaqa3AG3caA6DwJt0aD
         Tyh8px18v8gFXY/DXZrhpp+R6x64lnjSqepdWTVHLwHzKGXQO9do5vIfsGOJ/ECIMa3m
         9wfK6X3Lf0nYNbxRz6DeZSBzpBy8ei9mRVjv/hD8TJoUavi4JBxagqrPpdzUauKOs2fI
         czUvt1KAes/F8U0W+49/sJL0Px45ZphkpUL0Zxvv/v+Ij2JPCnPOQQRu/YImEE6BSB9L
         eXjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZHntFEQuW8hsggBmzEQFGYu992iOuf6g3cmfICqFh1K4Hc+PRiC52mUwFUPyYi0n+p7CvV3yYVsRREA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+zelqfYVXjNto+77Hk0ATerrfAmeADASCIYvV0VAhwiZfcnyO
	5p8UFN4M1br7stAy0TFqq/lJZfWV/ugzKTol86noBD7OqzHf4M4i5Oc9FTvoQXHyNP4xav/t5Hw
	uj0YR6Ka9Gg==
X-Google-Smtp-Source: AGHT+IFt78ttcTKk2SPQ8BT1FrQ1uThUJelTODuNzJi0Vzk5E6Lu1cEhiJVjoBqjNinGr2mXNSf2Udc+HEafiQ==
X-Received: from pjuj6.prod.google.com ([2002:a17:90a:d006:b0:2fa:2661:76ac])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:520f:b0:308:637c:74f2 with SMTP id 98e67ed59e1d1-30a4e5bc6dbmr294105a91.17.1746124399047;
 Thu, 01 May 2025 11:33:19 -0700 (PDT)
Date: Thu,  1 May 2025 11:32:57 -0700
In-Reply-To: <20250501183304.2433192-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20250501183304.2433192-1-dmatlack@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501183304.2433192-4-dmatlack@google.com>
Subject: [PATCH 03/10] KVM: selftests: Use gpa_t for GPAs in Hyper-V selftests
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	David Hildenbrand <david@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	David Matlack <dmatlack@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Eric Auger <eric.auger@redhat.com>, James Houghton <jthoughton@google.com>, 
	Colin Ian King <colin.i.king@gmail.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_113320_450139_7C1FFCEF 
X-CRM114-Status: GOOD (  12.07  )
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

Fix various Hyper-V selftests to use gpa_t for variables that contain
guest physical addresses, rather than gva_t.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/kvm/x86/hyperv_evmcs.c    | 2 +-
 tools/testing/selftests/kvm/x86/hyperv_features.c | 2 +-
 tools/testing/selftests/kvm/x86/hyperv_ipi.c      | 6 +++---
 tools/testing/selftests/kvm/x86/hyperv_svm_test.c | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/hyperv_evmcs.c b/tools/testing/selftests/kvm/x86/hyperv_evmcs.c
index 58f27dcc3d5f..9fa91b0f168a 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_evmcs.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_evmcs.c
@@ -76,7 +76,7 @@ void l2_guest_code(void)
 }
 
 void guest_code(struct vmx_pages *vmx_pages, struct hyperv_test_pages *hv_pages,
-		gva_t hv_hcall_page_gpa)
+		gpa_t hv_hcall_page_gpa)
 {
 #define L2_GUEST_STACK_SIZE 64
 	unsigned long l2_guest_stack[L2_GUEST_STACK_SIZE];
diff --git a/tools/testing/selftests/kvm/x86/hyperv_features.c b/tools/testing/selftests/kvm/x86/hyperv_features.c
index 5cf19d96120d..b3847b5ea314 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_features.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_features.c
@@ -82,7 +82,7 @@ static void guest_msr(struct msr_data *msr)
 	GUEST_DONE();
 }
 
-static void guest_hcall(gva_t pgs_gpa, struct hcall_data *hcall)
+static void guest_hcall(gpa_t pgs_gpa, struct hcall_data *hcall)
 {
 	u64 res, input, output;
 	uint8_t vector;
diff --git a/tools/testing/selftests/kvm/x86/hyperv_ipi.c b/tools/testing/selftests/kvm/x86/hyperv_ipi.c
index 865fdd8e4284..85c2948e5a79 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_ipi.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_ipi.c
@@ -45,13 +45,13 @@ struct hv_send_ipi_ex {
 	struct hv_vpset vp_set;
 };
 
-static inline void hv_init(gva_t pgs_gpa)
+static inline void hv_init(gpa_t pgs_gpa)
 {
 	wrmsr(HV_X64_MSR_GUEST_OS_ID, HYPERV_LINUX_OS_ID);
 	wrmsr(HV_X64_MSR_HYPERCALL, pgs_gpa);
 }
 
-static void receiver_code(void *hcall_page, gva_t pgs_gpa)
+static void receiver_code(void *hcall_page, gpa_t pgs_gpa)
 {
 	u32 vcpu_id;
 
@@ -85,7 +85,7 @@ static inline void nop_loop(void)
 		asm volatile("nop");
 }
 
-static void sender_guest_code(void *hcall_page, gva_t pgs_gpa)
+static void sender_guest_code(void *hcall_page, gpa_t pgs_gpa)
 {
 	struct hv_send_ipi *ipi = (struct hv_send_ipi *)hcall_page;
 	struct hv_send_ipi_ex *ipi_ex = (struct hv_send_ipi_ex *)hcall_page;
diff --git a/tools/testing/selftests/kvm/x86/hyperv_svm_test.c b/tools/testing/selftests/kvm/x86/hyperv_svm_test.c
index 436c16460fe0..b7f35424c838 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_svm_test.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_svm_test.c
@@ -67,7 +67,7 @@ void l2_guest_code(void)
 
 static void __attribute__((__flatten__)) guest_code(struct svm_test_data *svm,
 						    struct hyperv_test_pages *hv_pages,
-						    gva_t pgs_gpa)
+						    gpa_t pgs_gpa)
 {
 	unsigned long l2_guest_stack[L2_GUEST_STACK_SIZE];
 	struct vmcb *vmcb = svm->vmcb;
-- 
2.49.0.906.g1f30a19c02-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
