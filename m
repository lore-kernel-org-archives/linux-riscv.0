Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C316C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 09:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vaj5urGiGP1HsP9JjTue0YWKNO2knjS/e1esnaxehDI=; b=mR8YK6ddxZzWO1
	qsShAtVCVnHoMk1cqYEtr0qlCRVdNiZi0H7u2hI/LTMlqh7Abu6v8I8LiVFeknfB2tw6wZlmhBr4U
	9F1lmaAulXilZt6rEbn9u+92nsTw9atvjBPfsg3RLNkQtRO16/4HKDFZ3yDzfbOhz70XRKLYGqe85
	bshFEYfFRMmmLcri2+3X6P0WzmpEqYXjBxNuW/XaBG2dMrQkDdV6AXk5J4VGcfPXTDn8cVIZ/pU/e
	hsW8KEFr8ob0Pr7pCqsqznmitwIxXYDSXMC9UlzkOncaCbA6MK3b+XVkc6mCPFAVRVgshoKibCNOx
	tL3fzLm8moY3n7MAPCdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werY6-00000001EDn-1XNb;
	Wed, 01 Jul 2026 09:48:06 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werY3-00000001EBm-3fPN
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 09:48:04 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so2791295ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2026 02:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782899283; x=1783504083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YsyBUeISRtTsmCW0fRgq5oh/PaolZ1FgVZ4dpWHLHI=;
        b=Xox29ZQjZExnTx1tVktgF9h+B3whTEt+mXrk6k2tLE2StYCnLbctrYsw5WhC8Y4HVQ
         lRDwAlhTVxsfC4yKdvcQIDEsPvyCsIVzEP8wkAo+NLZ0Q3041JKCe+Kavh9XuP/IUSUZ
         +gNUfYyghQaiiJaCyS3ypXc67pmir1Rl+m8gfNt0+oDwGdxVumCNBo/nXD47qzT3oOf0
         3aAU5DtXN6gckdVv/Jnr8L4/GIDtmM5BFnAEZSGGkcCHqoD+l2hDoYIwqsCkL9U54lJh
         a7rGSX6rrrFNQqC7fCFEl5MZpRQV124t51qviT6tZkvTg9+yQlPszKpNoqupSjOlWsXp
         RzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782899283; x=1783504083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/YsyBUeISRtTsmCW0fRgq5oh/PaolZ1FgVZ4dpWHLHI=;
        b=DPJMzdYEFA4VNsBW2Tjh9sHt58J5t+moP4Wune9TXtCZL1NzziydxoIlnOXeQoeIbE
         vfFInJPdSo389IEAJ5NgwO8kppcJ23YSsw4jp3gkWBUtfEdePftRF841biPSUiG6aAMr
         Hrdol3VIKXlpj20NO01Vesc8UYpDQXPYnZFMviBjgBqefVkrNNq4RGaba6ZqDKReIQAk
         pdO7SdRrgdf3SlTOI0N1HEMg1VEfGaAgZ9IKgDfVutFAF9g5ynVN7Uv6N+xuQUAEU3HL
         OdJzFncMZgp2AcaU931nQ6d9Ubpnfy6YyyU1yavAM4AFWfbVvF0ImUj4kWgxyXeG6hUi
         uFGA==
X-Forwarded-Encrypted: i=1; AHgh+RqbMigFg018XZPOO2URrDz6H2bBG4E5/qepOGA0VALSbBEYhTrfy+EPRYVpd4ARgnBUPtCHF/j4RleyYg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHOYjHBspsHSJso9WfKTLXiel1EGVVLnqsl8G97AShhEb0JBEe
	8uG8ttVx93Fp9j9QhfEfz7W/L5hLDrNbhQAXCpxlYNsD+fj10+6lcwx6
X-Gm-Gg: AfdE7cnJyFDtdgbOmQdU6FAULwF+KfCiwxVKe6aANar7i5xak6nhcgXOfCMSwLG1uMa
	9toXn5jIvB9iSHq7B+a04ZBLiIQpc7zzns3zSvckDF9Ujk8m5sHMe195nNx3gkN5u7SuDi3hFWi
	rK0fndjo5vitomAg63TBFiNb9ZbuEjldehWVJEszUzWxlmDA/vbt7ErP5R9+cawy2OHdZPfvqVO
	J41SPEswUmkfDrBbIGQLs4kuehBhGR5HzEg+SU3yzBYtU6Ghf3XawV9w/Q5Ffz9dsW8ATVBg6cg
	QB8rhE2HEFxMg7ubPjfmRtJevSRtSWeGLF+F4Hc30CqqMGTaeERzamQBTL6WStWHHHqoQcNEP1L
	uKRHtlW5ZarlA1sbRZ3njiZsKjsQY1huRgiVajp39XvovSsQfcGCnOZew+pHam/CvkwccP2utof
	6qKpiZ/RB3eEA=
X-Received: by 2002:a17:902:e5c3:b0:2c9:c18f:7446 with SMTP id d9443c01a7336-2ca7e8dbc1amr9889895ad.27.1782899282902;
        Wed, 01 Jul 2026 02:48:02 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca4f2a71a9sm21530155ad.44.2026.07.01.02.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 02:48:02 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/3] RISC-V: KVM: Add SBI extension validate callback
Date: Wed,  1 Jul 2026 17:47:28 +0800
Message-ID: <20260701094731.1022163-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260701094731.1022163-1-inochiama@gmail.com>
References: <20260701094731.1022163-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_024803_913587_4C0263F6 
X-CRM114-Status: GOOD (  13.48  )
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

When user disable FWFT extension after setting any value of the
FWFT feature, the state of vCPU will be broken since the value
of disable FWFT feature is still functional.

Add the generic SBI extension validate callback so the FWFT
extension can fix its parameters before the first run.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  4 ++++
 arch/riscv/kvm/vcpu_config.c          |  2 ++
 arch/riscv/kvm/vcpu_sbi.c             | 23 +++++++++++++++++++++++
 3 files changed, 29 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index c1a7e3b40d9c..f01a2860c751 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -60,6 +60,9 @@ struct kvm_vcpu_sbi_extension {
 
 	void (*reset)(struct kvm_vcpu *vcpu);
 
+	/* Allow the extension to correct its parameters before the first run */
+	void (*validate)(struct kvm_vcpu *vcpu);
+
 	unsigned long state_reg_subtype;
 	unsigned long (*get_state_reg_count)(struct kvm_vcpu *vcpu);
 	int (*get_state_reg_id)(struct kvm_vcpu *vcpu, int index, u64 *reg_id);
@@ -93,6 +96,7 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
 void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_sbi_reset(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_sbi_validate(struct kvm_vcpu *vcpu);
 
 #ifdef CONFIG_RISCV_SBI_V01
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01;
diff --git a/arch/riscv/kvm/vcpu_config.c b/arch/riscv/kvm/vcpu_config.c
index 238418fed2b9..b68aa830aaf5 100644
--- a/arch/riscv/kvm/vcpu_config.c
+++ b/arch/riscv/kvm/vcpu_config.c
@@ -69,6 +69,8 @@ void kvm_riscv_vcpu_config_ran_once(struct kvm_vcpu *vcpu)
 
 	if (vcpu->guest_debug)
 		cfg->hedeleg &= ~BIT(EXC_BREAKPOINT);
+
+	kvm_riscv_vcpu_sbi_validate(vcpu);
 }
 
 void kvm_riscv_vcpu_config_load(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 46ab7b989432..b737e9a7a12a 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -723,3 +723,26 @@ void kvm_riscv_vcpu_sbi_reset(struct kvm_vcpu *vcpu)
 		ext->reset(vcpu);
 	}
 }
+
+void kvm_riscv_vcpu_sbi_validate(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
+	const struct kvm_riscv_sbi_extension_entry *entry;
+	const struct kvm_vcpu_sbi_extension *ext;
+	int idx, i;
+
+	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
+		entry = &sbi_ext[i];
+		ext = entry->ext_ptr;
+		idx = entry->ext_idx;
+
+		if (idx < 0 || idx >= ARRAY_SIZE(scontext->ext_status))
+			continue;
+
+		if (scontext->ext_status[idx] != KVM_RISCV_SBI_EXT_STATUS_ENABLED ||
+		    !ext->validate)
+			continue;
+
+		ext->validate(vcpu);
+	}
+}
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
