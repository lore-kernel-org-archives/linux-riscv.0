Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8F9C001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 16:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nAJkGayy8dnvCHgAT0Ks0VviUxsrCMUlsiosD9FrgSE=; b=Axwv13fIXmyqWZ
	sJAhwyDGC6smYpWTjxlvUxGZdkk9y7W3x2n2CsMlfxnQwFWeTAegqrQMLnbgbxmD8MkN5vCmiiUji
	4Qcg3gbcZfeY6LO7CgnllDHUSESOT3jtEex/fDhWj5smmYWxNj4/7PxM0UFN3RPNuF/VD0Q+Mg/tt
	xB7lF7vj6IY4hiIwcH0hg3PKIR79z8FiTjEkXLxZPQrrWyuDAgYhk7Sf7DjDtKcZNhLpDBmGEViOc
	GNGTOk83TOxeXMQQf7id8+DZUu/nb4xIw7CZe54Woya3jfD8wuavILnFqBlTOJ4YQ8QoegZ6RATK+
	PeOcENdilxq+2pIXTRkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM9eo-0083LX-2U;
	Wed, 19 Jul 2023 16:04:06 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM9el-0083Hg-0P
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 16:04:04 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-66872d4a141so4719164b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 09:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689782636; x=1692374636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlB+T7yzO9OziPQ1iUKQmwo9q1VQUiAhA5RgkQ17Yds=;
        b=S0CwRa960QfnkaYp7LLnxZtPCD8r0WaIpoQ0JpsXWay9c1WmEVLO7ML/3hvbW3aOZ8
         5TJZ+ZhuarNTXP3pQgmBK8Ld5NhCeOShU4ORjTxWcQb90K91aGZAwuZLgocsLR7B2fyh
         ekpYEUR7rHAY1SkDE7KDr70xmXPLj+MG3fQ85XFwue8sWQThvRH6ta574vU72smYfW+l
         kmu+HGgJ0XnSiWtBOCW3Kp+z/TFh4qbqVufL8DhmANsPs3U8zZ86ERpGH6jNILi8vmaA
         EX/+mA/om+qXZVkJsFY4mdU6n8x9NUGfJUd+l12bIeS6Xvx/DkaNfrO8IrZPfw8Jm7pt
         VRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689782636; x=1692374636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlB+T7yzO9OziPQ1iUKQmwo9q1VQUiAhA5RgkQ17Yds=;
        b=cfyG8n80apkQ5dhIF+I6bXKnVG2t6F2ExIV7TWzGWkk61Enai/JdxEdId3B9uBC3sQ
         yBgwAcHHFCDSMuNRFfM9SwlJTU/WxLjYB0jlbaiP0HAk5i2Gafqw70PpsHHiZHcSQ5cw
         p6ZuAkI1dtUoV9v4YL8qil8s32Tk8aHSsN62yAQo0Lw/6aC/GAplTqXh9hkGXLqB4JJv
         iFX6PQ1etACKmT33TQACcczlk+oZVk5qDQcNfB3/2qVS1Q91EvCzJOkYBSfYEO2TH84s
         XOUM8gcWctIACJ4khkup9US3gcaY2rNxuwsae8dDOvYGneJQylMkp3TiAUmX/H9679cI
         M7rA==
X-Gm-Message-State: ABy/qLZy5zP76TB90QOoN8a9WMTjNY+keBx44rs56Cn0u9aY7poO1kTX
	t4qQN6/JiHDKox7GjotdK2LxgTOD65lQINcY2uv8Hg==
X-Google-Smtp-Source: APBJJlHhJ7qA3CLrPkBrsK1gKAGER1Ue9Bn8rL9l9X9nEj+U7eInfxwO6UrfwG3/YNMwtt8Z+DJxTw==
X-Received: by 2002:a05:6a00:1504:b0:682:95ab:32f with SMTP id q4-20020a056a00150400b0068295ab032fmr3556764pfu.1.1689782636526;
        Wed, 19 Jul 2023 09:03:56 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id i22-20020aa79096000000b00682936d04ccsm3447023pfa.180.2023.07.19.09.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 09:03:56 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v1 2/6] RISC-V: KVM: Add kvm_vcpu_config
Date: Wed, 19 Jul 2023 21:33:12 +0530
Message-Id: <20230719160316.4048022-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719160316.4048022-1-mchitale@ventanamicro.com>
References: <20230719160316.4048022-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_090403_165348_580425D6 
X-CRM114-Status: GOOD (  13.63  )
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

Add a placeholder for all registers such as henvcfg, hstateen etc
which have 'static' configurations depending on extensions supported by
the guest. The values are derived once and are then subsequently written
to the corresponding CSRs while switching to the vcpu.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h |  7 +++++++
 arch/riscv/kvm/vcpu.c             | 27 ++++++++++++++-------------
 2 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 2d8ee53b66c7..c0c50b4b3394 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -164,6 +164,10 @@ struct kvm_vcpu_csr {
 	unsigned long scounteren;
 };
 
+struct kvm_vcpu_config {
+	u64 henvcfg;
+};
+
 struct kvm_vcpu_arch {
 	/* VCPU ran at least once */
 	bool ran_atleast_once;
@@ -244,6 +248,9 @@ struct kvm_vcpu_arch {
 
 	/* Performance monitoring context */
 	struct kvm_pmu pmu_context;
+
+	/* 'static' configurations which are set only once */
+	struct kvm_vcpu_config cfg;
 };
 
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index d12ef99901fc..e01f47bb636f 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -980,31 +980,28 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
 	return -EINVAL;
 }
 
-static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
+static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
 {
-	u64 henvcfg = 0;
+	const unsigned long *isa = vcpu->arch.isa;
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
 
 	if (riscv_isa_extension_available(isa, SVPBMT))
-		henvcfg |= ENVCFG_PBMTE;
+		cfg->henvcfg |= ENVCFG_PBMTE;
 
 	if (riscv_isa_extension_available(isa, SSTC))
-		henvcfg |= ENVCFG_STCE;
+		cfg->henvcfg |= ENVCFG_STCE;
 
 	if (riscv_isa_extension_available(isa, ZICBOM))
-		henvcfg |= (ENVCFG_CBIE | ENVCFG_CBCFE);
+		cfg->henvcfg |= (ENVCFG_CBIE | ENVCFG_CBCFE);
 
 	if (riscv_isa_extension_available(isa, ZICBOZ))
-		henvcfg |= ENVCFG_CBZE;
-
-	csr_write(CSR_HENVCFG, henvcfg);
-#ifdef CONFIG_32BIT
-	csr_write(CSR_HENVCFGH, henvcfg >> 32);
-#endif
+		cfg->henvcfg |= ENVCFG_CBZE;
 }
 
 void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
 
 	csr_write(CSR_VSSTATUS, csr->vsstatus);
 	csr_write(CSR_VSIE, csr->vsie);
@@ -1015,8 +1012,9 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	csr_write(CSR_VSTVAL, csr->vstval);
 	csr_write(CSR_HVIP, csr->hvip);
 	csr_write(CSR_VSATP, csr->vsatp);
-
-	kvm_riscv_vcpu_update_config(vcpu->arch.isa);
+	csr_write(CSR_HENVCFG, cfg->henvcfg);
+	if (IS_ENABLED(CONFIG_32BIT))
+		csr_write(CSR_HENVCFGH, cfg->henvcfg >> 32);
 
 	kvm_riscv_gstage_update_hgatp(vcpu);
 
@@ -1136,6 +1134,9 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 	struct kvm_cpu_trap trap;
 	struct kvm_run *run = vcpu->run;
 
+	if (!vcpu->arch.ran_atleast_once)
+		kvm_riscv_vcpu_setup_config(vcpu);
+
 	/* Mark this VCPU ran at least once */
 	vcpu->arch.ran_atleast_once = true;
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
