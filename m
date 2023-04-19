Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EA9C77B7F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 23:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YEjE6taHPy8Wr14O02gnbjXmv0/QA7rEP2pBVZlpOIw=; b=wZU2hwWFcn3V9Q
	I4y/t0zv9F2Htp9h+Dks+M48PULRv+4Vl3v1RX5wAESaolbzdexVwvn/J5NW7ScmGcbUIZp/M+JPw
	Y5kCMSzpV2sahUmdn41ivLrzKXOVH0hpufX7VGkOp2UmWjifDzDENptOymB8wxSvGSG6J7GGmP3vD
	t/lhPWKdN0sHtRCrpeys7zkgINHXvwNsbpUZS6UtUxNnfR2I598cE/D8hjYre6mfNqIOfKZRriGmW
	YtiIXOy9shNi+ZVLuVLjEslDOSVUE3NeBbUkLa/lQawd/eR96r+KehrmYZJzLoY63IpYO0uTvKFBV
	l4yXCO04wFld6bRy2xLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppHG9-006eYo-1I;
	Wed, 19 Apr 2023 23:30:45 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG8R-006TQD-1G
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:18:44 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1a920d4842bso4244125ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942723; x=1684534723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQCEa95xde61G0+g1spWAS5gSK9slN4MB0K1b9QrdE8=;
        b=Ynw03ruOG3PNfgG00HUUd7HJCh15VY3aEZKHBX+JvWIZqAaPdtZJFMNC9sQ+7tdyNf
         gQij1krIXgqHn6c3FKneR90d+ObOiz01SLEvx89Co8mtqMDidl42AKlK9b8IeRrjhkVj
         wFMRWmBw0WyiUKSEW2tAX/U5AjDnycCzdvc7/5XQe2CDXdqSpATkNcRDmxBB2iAZSbfO
         Qe8Etb6nnDF5lWA9UfVwL0EYoHqQHL5jKdNdyJEbe8jXSsaw1PcWzy6qONpwtJLTmV1a
         iWDDSsLQLNxRbxPSgzzxgbkJX9sxpOs3jDYDbGE18ziPonHZ9Lw5ZRGoMLwBsGOpngcC
         aTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942723; x=1684534723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQCEa95xde61G0+g1spWAS5gSK9slN4MB0K1b9QrdE8=;
        b=Vi9xwkYG2MjT+IOoZGiaFqeHtFzX7trcImTle00uaCgbHlFHndp1XiAUM5hq14KLWT
         e30kg//iQkqyOg5WxqKADSt+ROsCGOc2IauySuyQVtEiwaNzMJs/XMc+ZOPrcasFt3BH
         5Zo312kqOzUrr/9x14PkyrmdbILeDhvVZ+tUWrlu9DYeeN4AnBy8HRjHfMTz/mjeNi3z
         g9y8Nx9b7ZdiNahKyeke7FJMaACO9b3r4FLx5cI4PLlg8Pjs007hLIgIpzrO0luiOgyh
         CRVo3kchVFebPj81S3m6Q2OwcE9rKiA7zeTgPhh75w2yLMhn60d+A8cMUPO6R0DSKIu9
         Y1pg==
X-Gm-Message-State: AAQBX9cHkGmqWpcE5YadB7xB3Jm3C2RqwZGRM2JH9864LTodT0MvY900
	zlGXvLRJ07LO9eCLuwgrjczOmg==
X-Google-Smtp-Source: AKy350a8Ym8XHInuF0mFeXBc2+oA8kajjJCNeYyHi0F4HD8cqx1mngs6rpkeTwZ7fiAYwBWCbSvEDg==
X-Received: by 2002:a17:902:ba89:b0:1a9:2693:2e29 with SMTP id k9-20020a170902ba8900b001a926932e29mr1536823pls.42.1681942722916;
        Wed, 19 Apr 2023 15:18:42 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:42 -0700 (PDT)
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
Subject: [RFC 33/48] RISC-V: KVM: Hookup TVM VCPU init/destroy
Date: Wed, 19 Apr 2023 15:17:01 -0700
Message-Id: <20230419221716.3603068-34-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_151843_426885_DB904D03 
X-CRM114-Status: GOOD (  11.85  )
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

The TVM VCPU create function requires the vcpu id which is generated
after the arch_create_vcpu returns. Thus, TVM vcpu init can not be
invoked from the arch_create_vcpu. Invoke it in post create for now.
However, post create doesn't return any error which is problematic
as vcpu creation can fail from TSM side.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 65f87e1..005c7c9 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -218,6 +218,17 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 
 void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
 {
+	int rc;
+	/*
+	 * TODO: Ideally it should be invoked in vcpu_create. but vcpu_idx
+	 * is allocated after returning create_vcpu. Find a better place to do it
+	 */
+	if (unlikely(is_cove_vcpu(vcpu))) {
+		rc = kvm_riscv_cove_vcpu_init(vcpu);
+		if (rc)
+			pr_err("%s: cove vcpu init failed %d\n", __func__, rc);
+	}
+
 	/**
 	 * vcpu with id 0 is the designated boot cpu.
 	 * Keep all vcpus with non-zero id in power-off state so that
@@ -237,6 +248,9 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 
 	kvm_riscv_vcpu_pmu_deinit(vcpu);
 
+	if (unlikely(is_cove_vcpu(vcpu)))
+		kvm_riscv_cove_vcpu_destroy(vcpu);
+
 	/* Free unused pages pre-allocated for G-stage page table mappings */
 	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_cache);
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
