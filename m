Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5749C77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0MnGhUfWqjknEQ8s4nhsl/eVfna39ujMRVZxh5R3Wgw=; b=vTR5b8Lg+psD6W
	KKdxxFAeoK9ICAY/uMbU4KLLjFm4FJVH1miTvmu22sJ0je7kN6WYotNT3Qq5JaZc93JqqZL5dlxsb
	7EsGg48KawE4SF6+0e8BTpyvQxAxRryR4/JSXvdy0PttiKfa21DIC6tKZUOrSAvD+ZN0SH6Hppzao
	X7uHU5wkYMwGDsmWr4BDm+TSzXNGAxHfj3HngXq6taUN+sHnoJiSxe5SKAPvE42X2RXOn5H0gR9Kp
	NTD9DQ3foF2Lw8o1cLShGq61IvCCglhB+2whiA0Yf2mvb+4+O+4aDGtzjZ7hbUmxHd+YUowD2j5yH
	DtqQpUcSMvHlNJGL2wuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQt-006Wx2-1t;
	Wed, 19 Apr 2023 22:37:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQk-006WXV-2F
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Apr 2023 22:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gRHTy1c+Pl7OVrg4l834g5VjRWcSWQwGhgEvJAPkg+w=; b=HKRCdjqxkUofja+gDpkfK5KD44
	xqYsmkcRlGmck/YCxlTHpmmCHW29ILlJtak7vy2W2LRONr/2beTgRvutOP9v/5AHFPodturYkwoft
	nWreSAEUjMguWYF1DswYZ5oZ5fBL5d2NleS+X0yNTqgmsTja7eAD3xuU0c7pk5YdyiV1mv8bqdnGj
	2OKjT1MRimyVcru/rRIqkyyQ6kck/X5PTFsH0PB9eX3CBiLxvaSKZFw0qHY6z14Ad757pZKdl5f7U
	zaUuk9vg5kDAPpHWFZxVuEI39rMgw7bjOQRMU2CiroyxaYnXACzr/ibKjxv7uA79UC01Jtbg8tUGD
	1ShNq5ZA==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ppG7p-00DeCA-8X
	for linux-riscv@lists.infradead.org; Wed, 19 Apr 2023 22:18:09 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1a66888cb89so4502975ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942682; x=1684534682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRHTy1c+Pl7OVrg4l834g5VjRWcSWQwGhgEvJAPkg+w=;
        b=kmEcD4YfOAFXGG17QX3KsyUFIzwyUfrsKZ1wYGSvZgqODlY6mzST437Sn9HGEmF2e4
         2a2a47FJD8fRdSNkrzKWkWk+t1hYBGWo5RKv/QKbDEChEI7DPntySLvvhVENeLXEvAzZ
         Yi9hf+mn4OFq02nwK3TFnSe2tJbzQbrAKkpWS2zkyUDSsMGzPeY61HsFbh3a25B058l+
         uUA1pt3+Fbza1RQ2lPxN0ghz2+DhS82u09mOfYSZt3cX82Z63iV2DNRddUax6jZ/SlYZ
         5R7VI8q/CylWQy7dmPwpqmG5M0g3aSf6g2QGsKHX2ECmbls1SK5jLS9FX181LfzlvClk
         L9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942682; x=1684534682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gRHTy1c+Pl7OVrg4l834g5VjRWcSWQwGhgEvJAPkg+w=;
        b=SN+F8MD82/wqdt9EbxWPGTliiGFR5ZkTdFHQLeOjjHg1XsJz/84plPpHj7ifnEdUAd
         gp+VFziqk288TJnMlGipSpXCB9YzB6HaBWafZRqr2dqjN9FzCvg18nRppPOyU4wJ4JwP
         U4yOmjwAfUFlQdgoqlcBvdq8YJvJHBqBil5DxU6vU03vNP9saq91akNoizXZmcQ0N3Ie
         GRNIF6YuTnhp2X/XimEnlJ7lJ8cB/JdnVchcnSeR8boeoEYzV0sh3B9MyPz50n82hZHA
         49xPG+u5XkVHOrQ+FMhmz743CkuX7P6u3lOap98sHysxlCrHk8KCCMLIAcJnGHU+72qK
         0faA==
X-Gm-Message-State: AAQBX9ef5o9unW0NBjjPsfGpLtpS/kXm/b1WwSGKJxFkJyyqVl4X9bnr
	wrnJ4hduEqgkSn9WbbiXhVJjGw==
X-Google-Smtp-Source: AKy350YWY4zn6DitmSoPXPvjQSlrg5vxaeh3mQBYR6TvOk3ni0Mxh3KE27JFZrBKZBdZgegUV17R1Q==
X-Received: by 2002:a17:902:ec8b:b0:1a9:23b7:9182 with SMTP id x11-20020a170902ec8b00b001a923b79182mr2673903plg.27.1681942682652;
        Wed, 19 Apr 2023 15:18:02 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:02 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
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
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 15/48] RISC-V: KVM: Add a helper function to trigger fence ops
Date: Wed, 19 Apr 2023 15:16:43 -0700
Message-Id: <20230419221716.3603068-16-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_231805_388629_4A94850A 
X-CRM114-Status: GOOD (  16.82  )
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

When Cove is enabled in RISC-V, the TLB shootdown happens in co-ordination
with TSM. The host must not issue hfence directly. It relies on TSM
to do that instead. It just needs to initiate the process and make
sure that all the running vcpus exit the guest mode. As a result, it
traps to TSM and TSM issues hfence on behalf of the host.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_cove.h |  2 ++
 arch/riscv/kvm/cove.c             | 36 +++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_cove.h b/arch/riscv/include/asm/kvm_cove.h
index 4ea1df1..fc8633d 100644
--- a/arch/riscv/include/asm/kvm_cove.h
+++ b/arch/riscv/include/asm/kvm_cove.h
@@ -130,6 +130,8 @@ void kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_trap *tr
 int kvm_riscv_cove_vm_measure_pages(struct kvm *kvm, struct kvm_riscv_cove_measure_region *mr);
 int kvm_riscv_cove_vm_add_memreg(struct kvm *kvm, unsigned long gpa, unsigned long size);
 int kvm_riscv_cove_gstage_map(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long hva);
+/* Fence related function */
+int kvm_riscv_cove_tvm_fence(struct kvm_vcpu *vcpu);
 #else
 static inline bool kvm_riscv_cove_enabled(void) {return false; };
 static inline int kvm_riscv_cove_init(void) { return -1; }
diff --git a/arch/riscv/kvm/cove.c b/arch/riscv/kvm/cove.c
index 5b4d9ba..4efcae3 100644
--- a/arch/riscv/kvm/cove.c
+++ b/arch/riscv/kvm/cove.c
@@ -78,6 +78,42 @@ static int kvm_riscv_cove_fence(void)
 	return rc;
 }
 
+int kvm_riscv_cove_tvm_fence(struct kvm_vcpu *vcpu)
+{
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_cove_tvm_context *tvmc = kvm->arch.tvmc;
+	DECLARE_BITMAP(vcpu_mask, KVM_MAX_VCPUS);
+	unsigned long i;
+	struct kvm_vcpu *temp_vcpu;
+	int ret;
+
+	if (!tvmc)
+		return -EINVAL;
+
+	spin_lock(&tvmc->tvm_fence_lock);
+	ret = sbi_covh_tvm_initiate_fence(tvmc->tvm_guest_id);
+	if (ret) {
+		spin_unlock(&tvmc->tvm_fence_lock);
+		return ret;
+	}
+
+	bitmap_clear(vcpu_mask, 0, KVM_MAX_VCPUS);
+	kvm_for_each_vcpu(i, temp_vcpu, kvm) {
+		if (temp_vcpu != vcpu)
+			bitmap_set(vcpu_mask, i, 1);
+	}
+
+	/*
+	 * The host just needs to make sure that the running vcpus exit the
+	 * guest mode and traps into TSM so that it can issue hfence.
+	 */
+	kvm_make_vcpus_request_mask(kvm, KVM_REQ_OUTSIDE_GUEST_MODE, vcpu_mask);
+	spin_unlock(&tvmc->tvm_fence_lock);
+
+	return 0;
+}
+
+
 static int cove_convert_pages(unsigned long phys_addr, unsigned long npages, bool fence)
 {
 	int rc;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
