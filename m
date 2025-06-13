Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4777DC71151
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 11:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZTTZL3vS94oM4ZYtY/JO+sZfygTgGSISILXDoF3eU0=; b=MhUiox0Y31J8l/
	gKf6NnjV036/Py8aRvhLsh6atFU5gwMjOmjcbtAAt11JQGBOJVsHPBQPa+159UCJwXuPGMJ/cJaMe
	iLS983pPA7ZS14hZMSMcIwCOUeppFSTbBc1JriNyIHBDjrdzd11RO0Id+kuKfC+mdZ9vbcIitXgJl
	z2/7z10ybAPQkSTeYMhKzS0DqwpPSHm4ZIn542yOFTODBajo27j/83PRL8xP9FMQX6ApttLI77cn5
	rj+BrfMVYKqg7B58ygFH8d23Ia1KW1pDBzBYWYo4AtoMcBe3rKDwIIk36Ty1BE8dpopvmVyaVIbTY
	o8t5rZFc7WM9yeih44wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2cD-0000000GAVL-4Bz5;
	Fri, 13 Jun 2025 11:30:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyNB-0000000FXoX-1EC6
	for linux-riscv@bombadil.infradead.org;
	Fri, 13 Jun 2025 06:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FTUNizeD4GAwjamuleDEZyMo3f2gr2d8rHj6sva7l/8=; b=QXkMz1X51WsDeX12aP5vgJIBss
	OqHkeYnE+z2R85LM8C3unpfXXEvkBzUM9tDpvGlLibMsdxozUrMXGtuMa/C55vhDJFd+bDKNy6IYR
	JCSRKxl/KI3NJZyu6oFAEin5EllzGBNZ2clzCEq677KDv/s+ycNNCTxPJl20HhEunC9BhNMAMYX9M
	xUX/HlsvvZVlQn6VoXUAnhMGPNOHh0NodBQsC5C6mY4zS2p6FXrRqf/SRdcHFqTZpig1rbpe3LR0h
	TxdvgToVeFzf2o59L8xyGZPos2rt1nhFFPTtubCOElP6Q7MI9fhvHeEg3orkRtexQibnxVpPIzAnX
	Y9jsYaNA==;
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyN9-00000002ryD-0TcP
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 06:58:44 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so1677666a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 23:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749797920; x=1750402720; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTUNizeD4GAwjamuleDEZyMo3f2gr2d8rHj6sva7l/8=;
        b=J8w+6ye3Y1DVMjOFFbZgEMNzyUzyh0traYYLRhMJl1RSFMmAA0FReFkK5bZwid782j
         0ygOFg7/tBZG6c03Y2OMLN+HKHI2tP++swHyorSTNtWcN/EcVxgjMVj7kkha26lLO3oa
         F8hSPgqw0nNrt7+sHwDx4AHUww6Ut5wEmOgXBJZv9XqbRvYXMb18xZLkUfJSmr7mi37S
         9r4epNNQWNC7gNuJojZEEdZECm7QUVfqMgNJMelWpowLKOYltRxmGBe/jaRTxef/D39v
         A2Ng5dsjih86Jguwjxf3CLMNUCTKhToLyl0vhLdSVVgak706qz+ramLS/c/YqHeUV/uf
         shHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749797920; x=1750402720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTUNizeD4GAwjamuleDEZyMo3f2gr2d8rHj6sva7l/8=;
        b=dzng1wYsjRt3/zp8imYsB4OSuVJ0mQNDKVcYxWwtbYc77fFMNzz/gi9sZ/nf3CBl4U
         2WKAONqcLdriZSkGdRS++neAhFcziRlrpWK+Ek5qw90XzxRjzefvgdZY+xxQ89+8aXHp
         GWb1NT93rvv1fA4vEW3jABZuI1NY9b3FDdQPEw1wwjxwlZEj+AZL99djQMlRE3+CRv2k
         0BEGZN9EnrhRxPh3dDo2JmT2xUtEXauQoXnnDrne2seDzLHA63Iy0nLOEDCsUw+hRj3E
         J1U7ZP6K3kkyIce2TlAdA8BnkebK3fnYw2tvecWzl9vvXONxyE5wBC2PZt7+N0vfi24f
         ZxQg==
X-Forwarded-Encrypted: i=1; AJvYcCXyQjvBGJwlCvpRg9JFU+hAYHxmu/9++bnPk5tW/hBMFEx0NWLHpJU2zbLHUzycYhrCLDvs/ALu3IUcsA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBTIrgIgz4XmSGUjDhW0/OPtGrgJB1TVSqsTXi8B7cn105ihR8
	bUwXZ6nwC63gJ7V/FKdj6ZXgVJDiHEk+Q2uwjEW4uBaws8OkYBjY8T4g6s44QwgkE8g=
X-Gm-Gg: ASbGncvzic7HKCP+Jj03TUKuPPeFKf8PbhkU3ywbzqnW2QQPn9lQDGEu61h+ReiuFCq
	kYYJj15MOgnoRdcJWHNWt2YfBtSZ3T0qlhK0ZJZ8eI+p9HmQTWW6xwIHS+9kg1cEeFTyvB9fWtg
	DyErDlRIITKlOKkzhI3EqtaMPgamkKbaag+8CswAfRZ6+MV9rMLJXpqRxzHtZ0IcpscVdnPrjhY
	eXYeO/WjGS1iJt74sp+l0ai47oUTLdK34W5BaNQqUBPw5BmIziWjfVPUlIm36pTLIJUA8/GBAyk
	V5xSyb1qmOwKrbLIJHB73R9ur/GxV+13MpR/nMOVipPNAKP/vooWUfXCLYYXA8GXLHfc7aot4y2
	ZNHaWqDkSWLpQtS1rqyU=
X-Google-Smtp-Source: AGHT+IFD7ruLh4VfkVxEKY4I/hEXtNaiVk7YH6BljPh0dx2E18jMzd9JyHkdwcF8Bn4qR1nr7HznMQ==
X-Received: by 2002:a17:90b:4a4f:b0:312:639:a058 with SMTP id 98e67ed59e1d1-313d9ec4df9mr3120299a91.27.1749797920164;
        Thu, 12 Jun 2025 23:58:40 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49b7fsm2653022a91.24.2025.06.12.23.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:58:39 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 10/12] RISC-V: KVM: Add vmid field to struct kvm_riscv_hfence
Date: Fri, 13 Jun 2025 12:27:41 +0530
Message-ID: <20250613065743.737102-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613065743.737102-1-apatel@ventanamicro.com>
References: <20250613065743.737102-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_075843_350278_A506AF8F 
X-CRM114-Status: GOOD (  12.37  )
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

Currently, the struct kvm_riscv_hfence does not have vmid field
and various hfence processing functions always pick vmid assigned
to the guest/VM. This prevents us from doing hfence operation on
arbitrary vmid hence add vmid field to struct kvm_riscv_hfence
and use it wherever applicable.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_tlb.h |  1 +
 arch/riscv/kvm/tlb.c             | 30 ++++++++++++++++--------------
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_tlb.h b/arch/riscv/include/asm/kvm_tlb.h
index cd00c9a46cb1..f67e03edeaec 100644
--- a/arch/riscv/include/asm/kvm_tlb.h
+++ b/arch/riscv/include/asm/kvm_tlb.h
@@ -19,6 +19,7 @@ enum kvm_riscv_hfence_type {
 struct kvm_riscv_hfence {
 	enum kvm_riscv_hfence_type type;
 	unsigned long asid;
+	unsigned long vmid;
 	unsigned long order;
 	gpa_t addr;
 	gpa_t size;
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index 6fc4361c3d75..349fcfc93f54 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -237,49 +237,43 @@ static bool vcpu_hfence_enqueue(struct kvm_vcpu *vcpu,
 
 void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu)
 {
-	unsigned long vmid;
 	struct kvm_riscv_hfence d = { 0 };
-	struct kvm_vmid *v = &vcpu->kvm->arch.vmid;
 
 	while (vcpu_hfence_dequeue(vcpu, &d)) {
 		switch (d.type) {
 		case KVM_RISCV_HFENCE_UNKNOWN:
 			break;
 		case KVM_RISCV_HFENCE_GVMA_VMID_GPA:
-			vmid = READ_ONCE(v->vmid);
 			if (kvm_riscv_nacl_available())
-				nacl_hfence_gvma_vmid(nacl_shmem(), vmid,
+				nacl_hfence_gvma_vmid(nacl_shmem(), d.vmid,
 						      d.addr, d.size, d.order);
 			else
-				kvm_riscv_local_hfence_gvma_vmid_gpa(vmid, d.addr,
+				kvm_riscv_local_hfence_gvma_vmid_gpa(d.vmid, d.addr,
 								     d.size, d.order);
 			break;
 		case KVM_RISCV_HFENCE_VVMA_ASID_GVA:
 			kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD);
-			vmid = READ_ONCE(v->vmid);
 			if (kvm_riscv_nacl_available())
-				nacl_hfence_vvma_asid(nacl_shmem(), vmid, d.asid,
+				nacl_hfence_vvma_asid(nacl_shmem(), d.vmid, d.asid,
 						      d.addr, d.size, d.order);
 			else
-				kvm_riscv_local_hfence_vvma_asid_gva(vmid, d.asid, d.addr,
+				kvm_riscv_local_hfence_vvma_asid_gva(d.vmid, d.asid, d.addr,
 								     d.size, d.order);
 			break;
 		case KVM_RISCV_HFENCE_VVMA_ASID_ALL:
 			kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD);
-			vmid = READ_ONCE(v->vmid);
 			if (kvm_riscv_nacl_available())
-				nacl_hfence_vvma_asid_all(nacl_shmem(), vmid, d.asid);
+				nacl_hfence_vvma_asid_all(nacl_shmem(), d.vmid, d.asid);
 			else
-				kvm_riscv_local_hfence_vvma_asid_all(vmid, d.asid);
+				kvm_riscv_local_hfence_vvma_asid_all(d.vmid, d.asid);
 			break;
 		case KVM_RISCV_HFENCE_VVMA_GVA:
 			kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_RCVD);
-			vmid = READ_ONCE(v->vmid);
 			if (kvm_riscv_nacl_available())
-				nacl_hfence_vvma(nacl_shmem(), vmid,
+				nacl_hfence_vvma(nacl_shmem(), d.vmid,
 						 d.addr, d.size, d.order);
 			else
-				kvm_riscv_local_hfence_vvma_gva(vmid, d.addr,
+				kvm_riscv_local_hfence_vvma_gva(d.vmid, d.addr,
 								d.size, d.order);
 			break;
 		default:
@@ -336,10 +330,12 @@ void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
 				    gpa_t gpa, gpa_t gpsz,
 				    unsigned long order)
 {
+	struct kvm_vmid *v = &kvm->arch.vmid;
 	struct kvm_riscv_hfence data;
 
 	data.type = KVM_RISCV_HFENCE_GVMA_VMID_GPA;
 	data.asid = 0;
+	data.vmid = READ_ONCE(v->vmid);
 	data.addr = gpa;
 	data.size = gpsz;
 	data.order = order;
@@ -359,10 +355,12 @@ void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
 				    unsigned long gva, unsigned long gvsz,
 				    unsigned long order, unsigned long asid)
 {
+	struct kvm_vmid *v = &kvm->arch.vmid;
 	struct kvm_riscv_hfence data;
 
 	data.type = KVM_RISCV_HFENCE_VVMA_ASID_GVA;
 	data.asid = asid;
+	data.vmid = READ_ONCE(v->vmid);
 	data.addr = gva;
 	data.size = gvsz;
 	data.order = order;
@@ -374,10 +372,12 @@ void kvm_riscv_hfence_vvma_asid_all(struct kvm *kvm,
 				    unsigned long hbase, unsigned long hmask,
 				    unsigned long asid)
 {
+	struct kvm_vmid *v = &kvm->arch.vmid;
 	struct kvm_riscv_hfence data;
 
 	data.type = KVM_RISCV_HFENCE_VVMA_ASID_ALL;
 	data.asid = asid;
+	data.vmid = READ_ONCE(v->vmid);
 	data.addr = data.size = data.order = 0;
 	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE,
 			    KVM_REQ_HFENCE_VVMA_ALL, &data);
@@ -388,10 +388,12 @@ void kvm_riscv_hfence_vvma_gva(struct kvm *kvm,
 			       unsigned long gva, unsigned long gvsz,
 			       unsigned long order)
 {
+	struct kvm_vmid *v = &kvm->arch.vmid;
 	struct kvm_riscv_hfence data;
 
 	data.type = KVM_RISCV_HFENCE_VVMA_GVA;
 	data.asid = 0;
+	data.vmid = READ_ONCE(v->vmid);
 	data.addr = gva;
 	data.size = gvsz;
 	data.order = order;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
