Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7A8C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0CeMuih/jSl8oion930i5ThrVw6AZTWEs84l+15tdg4=; b=NrmIVVZghpAXdE
	h61HOPXPBRn7VDlMD5QNY5sEXce0Mxsj3pax/zrbNbyCjdO+nEwhDuc+PQW+u15m6c5AIS6Ps9crQ
	zmggeFVo3PkjbstIdQrA5ex+tlo/Xk5xQTjSOiVDtkkl98PP46C9xnlvj56BMhCyWHw8n8W+J+scZ
	Z8UPlKYHS0fLNfpza6Yz8hC7KJV1/IyMynrZAxYxrn0VTd/+t/g+gRt7it3F8t8DCLyQPdNBSgzxj
	EmpAxVz82jHn3NqaMRqCgJJxxzXl9AzKYL0KzjSe/YIJWlGUFCaZlsWJwY1jGt4+jJc34/PH+Ytv5
	/6IyrwbAy6sD5VUvXJtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQr-006WuR-11;
	Wed, 19 Apr 2023 22:37:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQi-006WXV-2e
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Apr 2023 22:37:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Pex4ariWnXDdKnos4XH43DasA78+EqfUbH0Wh8CR5w4=; b=u9suVPhA7xhAu3RyYw05osEdde
	JfrgsBnyVat1wBHWYuPdhGKl8poMnYs2JezbG2fWcPhrMq7O7p2M63rEYU/o6xfB14FiQzO+yJsuZ
	++LOZjTf6gBq1VwtuKq2jrOLxeiksvhGil8KTHCNj9VDzc80UgidS1ErTNlCRQSuNMJ/Vsex3Ct8f
	Zaa46dn4elcDtgwB189LDVolJ7eJe6Rj2ysaJQAB+9o3gsLSzqgy/Qn92+dGXYdopom+FW+xurceg
	HFr9QM4KmLlyiwz3MX49M0BLwe07zstlFN/dIM40lkHeThQNqvmmhDkpYJ3jRCkK26hq4SP2Irz1x
	4rb6oeSw==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ppG82-00De9l-Ji
	for linux-riscv@lists.infradead.org; Wed, 19 Apr 2023 22:18:20 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1a66b9bd893so4666055ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942698; x=1684534698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pex4ariWnXDdKnos4XH43DasA78+EqfUbH0Wh8CR5w4=;
        b=di7chbqLiC3SvYTY8G+fGI2cGV6/NplXfCh5v5XyNgDlngesP2y27MIvOHwrp1X4yx
         4JsJle4v6NILzYjrBdQfclQHMQ1y+XkUvrnKfQUj0Ry5xsz9RSAaP7xk6bNe/vd52w3q
         C3nd14GGW5Qj94glYyk3NSDPRmLJqvozvF8lGdcOkQJDY2HZ2XGm6lNAbX6/JmUwtYhH
         cJH7ZmbN28BevOjXzCzDy6LpP/+8QR1qPGxigpkkPQjHRv6qA67df2bzJD5EJMK27xPT
         x2yJWlQYdkRTzgVvhswp/3TbWfU5x7nor5CBTVJeRFUg+I3fFtPgIMfjV7YwcmwCLtW3
         tRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942698; x=1684534698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pex4ariWnXDdKnos4XH43DasA78+EqfUbH0Wh8CR5w4=;
        b=OJA5qzgOOimxEOdTiRaU5zDGn/lCKP08L9pQ+O66DZzXg7n4r7cmZpgXciUQhYOnm3
         3wFbu/KAKPhdVWz4vXbkX8lKnf/8vAf54yl0ZaWQA0qpGduMvmCJ3BSyAin80iryONiK
         Azc1cnbRcsOU8QMD/cDIswgA+3RzWUv2UxXof7P+B0V6duimSjKgZ+ClhOHbSvQ2g7uQ
         +IzQQSzoAJy5RDOTZx26crlTA5wobzVAyUSmlzcSEsxSymY0gHE49Edgoksj1ZWqJD/7
         YdXjHF1F/ggCfaOxf6WVsbWM965HfGlBcJqiektW7BQcOm5UwOny/TBVvgxpMwW55P5m
         ccjg==
X-Gm-Message-State: AAQBX9cNHDU4x3Xp1rjiSD0/oysbe+mGWfr4077z8PsfvfIwMaf5iL9G
	6zTkxpKhKQy0xuRiYov5jkcUcA==
X-Google-Smtp-Source: AKy350bAGBT2wDySHdJsoaBivRKAhhoN6FGmg4/i0kk3x7CE/96pMKWgvriPwXlMHgJNkHUROr/6AQ==
X-Received: by 2002:a17:903:1210:b0:1a6:4a64:4d27 with SMTP id l16-20020a170903121000b001a64a644d27mr7784281plh.40.1681942697893;
        Wed, 19 Apr 2023 15:18:17 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:17 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 22/48] RISC-V: KVM: Implement vcpu load/put functions for CoVE guests
Date: Wed, 19 Apr 2023 15:16:50 -0700
Message-Id: <20230419221716.3603068-23-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_231818_674321_26A65EDF 
X-CRM114-Status: GOOD (  12.62  )
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

The TSM takes care of most of the H extension CSR/fp save/restore
for any guest running in CoVE. It may choose to do the fp save/restore
lazily as well. The host has to do minimal operations such timer
save/restore and interrupt state restore during vcpu load/put.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/cove.c | 12 ++++++++++--
 arch/riscv/kvm/vcpu.c | 12 +++++++++++-
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/cove.c b/arch/riscv/kvm/cove.c
index 87fa04b..c93de9b 100644
--- a/arch/riscv/kvm/cove.c
+++ b/arch/riscv/kvm/cove.c
@@ -139,12 +139,20 @@ __always_inline bool kvm_riscv_cove_enabled(void)
 
 void kvm_riscv_cove_vcpu_load(struct kvm_vcpu *vcpu)
 {
-	/* TODO */
+	kvm_riscv_vcpu_timer_restore(vcpu);
 }
 
 void kvm_riscv_cove_vcpu_put(struct kvm_vcpu *vcpu)
 {
-	/* TODO */
+	void *nshmem;
+	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+
+	kvm_riscv_vcpu_timer_save(vcpu);
+	/* NACL is mandatory for CoVE */
+	nshmem = nacl_shmem();
+
+	/* Only VSIE needs to be read to manage the interrupt stuff */
+	csr->vsie = nacl_shmem_csr_read(nshmem, CSR_VSIE);
 }
 
 int kvm_riscv_cove_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 8cf462c..3e04b78 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -972,6 +972,11 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	u64 henvcfg = kvm_riscv_vcpu_get_henvcfg(vcpu->arch.isa);
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
+	if (is_cove_vcpu(vcpu)) {
+		kvm_riscv_cove_vcpu_load(vcpu);
+		goto skip_load;
+	}
+
 	if (kvm_riscv_nacl_sync_csr_available()) {
 		nshmem = nacl_shmem();
 		nacl_shmem_csr_write(nshmem, CSR_VSSTATUS, csr->vsstatus);
@@ -1010,9 +1015,9 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	kvm_riscv_vcpu_host_fp_save(&vcpu->arch.host_context);
 	kvm_riscv_vcpu_guest_fp_restore(&vcpu->arch.guest_context,
 					vcpu->arch.isa);
-
 	kvm_riscv_vcpu_aia_load(vcpu, cpu);
 
+skip_load:
 	vcpu->cpu = cpu;
 }
 
@@ -1023,6 +1028,11 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 
 	vcpu->cpu = -1;
 
+	if (is_cove_vcpu(vcpu)) {
+		kvm_riscv_cove_vcpu_put(vcpu);
+		return;
+	}
+
 	kvm_riscv_vcpu_aia_put(vcpu);
 
 	kvm_riscv_vcpu_guest_fp_save(&vcpu->arch.guest_context,
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
