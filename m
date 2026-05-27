Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3B9CD6E45
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 05:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tKdsS1VIuy9KGTSDLAyZhhxFFH05PTmOO4PK9Qj5GhE=; b=Zp5g7i+ZTPirTa
	0xkM/7SUxukXgaf5NP+6T0eDoRoh2XRIKujQzHz4hoEAm33YMPraQ7Y6f2rg/P15gWJquQo4IV3FF
	bvk0qm0+Wt88epSo2BJ2qqldAp8/A+Mhs86DdxIp+EGMx8z8Vk/gNH6Evpp2701UqT8xQ3E95wk8L
	fuca/fEk6XP4s3KSO4onP5/UyNMrKpSz2vnBk4kbYAVXu8qmu49C4ilQkYw4cxR9Xq8TQH4neE+Gh
	P3hgLfdR81MMvkKvtn4QVnGTkC59nsFJK5SzLmdyjmDxSEWgKC2ebNO++kccvfId9s2W9PVx33Kko
	1QnqJs8w/KiJeBVetW0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS7CX-00000003Mmz-0ExA;
	Wed, 27 May 2026 05:53:09 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS7CT-00000003MkZ-1LQ3
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 05:53:07 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2f0ad52830cso14446096eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 26 May 2026 22:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1779861184; x=1780465984; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wp1oswXj3dj/ue+2mbG75NTENINWm5S4spwl9AqmaA8=;
        b=R1YjFD5qnJoiFgfcpXJr85JHpdkknevT5beZxN0HGUfUx50eQl7YYJLCOZx+QL6G/Q
         LEZKGvf86YMU66K+nJyzNQRtEnf90knSaG6bNxvxCVt5Zb1+HpwMVITzuCSoJ2tDl8hz
         6KLOgQZyAO+vjNyn41cNDqZoZi+xFjhpP8TV0Vo1XzaRold9MNLtOpJ9aEunUaay2YnW
         VuVW4VoynwnuY7ldc2M+QAaXeNBwdD2t5+FlCeVstx0jkvkQSYitIDv/bO/BOitkbtzn
         HLxnWJbiUCApEVAkfiFOUWTli7Bd8cvzjYt3MJ/xqzekrQ1Lkypx/fuVH5khx6fx7IFv
         GTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779861184; x=1780465984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wp1oswXj3dj/ue+2mbG75NTENINWm5S4spwl9AqmaA8=;
        b=PhPDBXnl9n/lwvr55kBvjkhvGghP4ftegvQCmsFqc2/0INHHm7+JsG2vVjv5Q8CgRV
         g7D8/TQ15rzd6G115uXCJPddKh9KyJmzSLGcYFA8TGv97EYKFwQl7h6W9PL4edOQ+y3o
         yigiJ6es8HxvrllNFBGx2HtxbSC05ZGhrdtsaP0EuNxyUxFz9XT9E1PlZzduLmY/MmEk
         V7n1oDZQTjN1fxVr8slmLhqgZtL0a/U5IVdXkQKNdLJ59BH7EsTcRw7MqpDKkdkr2ZyF
         LPN3dJT1WUoZvAFp9t+XcuTCzZzA1TkNBY6lH1CvnHAWRya6KY12AB3cc/qmzSznZOE0
         K8BA==
X-Forwarded-Encrypted: i=1; AFNElJ+9SKsm73oOvl9B3AvmS3Wao9N8CjPNepCeO52MpTMVD9YGGa9Rgo/AUeTk6gcD5Lj8bxu5nWbBoOLkxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMXVbHhoH9y+/6XtlI7fjSTsQIto2tJRR62lgK+4bwCtLq6XpP
	L0TJpnusADD80zfG2L9yyKcIb1xilPirp+Ren+1ICqY3Omk8gdYw0xH00q2obCoemsY=
X-Gm-Gg: Acq92OH8wR8yndM6DnpHITySvWI2t+Lf8vAFwMpA2BR8nrdQx5a2tA2mrLstiA6y4DV
	RPVvk5crVhmuIf1u+sOhgFS1CtCx7iJzQCHIvqnPHj9IGGbrPxvbK3IejGOo2a//OQLVj8u07sW
	3/OSNtZGqJH6HXPWrifKaa5tDXMdBxeLSmkASIAlHVBESVz2GH9b88uSqLGrjRIxEZg1E/vRsRz
	2kp/RnP8PJjFGib26bN0Kvtt+3GLjSP6v0MG+sewmUpDLRaz3MjNYLfS/t+MOPu5ypszns64hcO
	nL1bNYZDwUgr3n2v7wqcqq5ziTImyt169YVIEmNwgcy7y5z+QMvc+EZA8te0JDdLaEfohitGTKz
	beNweih/GL9waCsgC75RISrfPr6oyTX6lJOP+9BBOVlDQ9zS9HfyZlEmowN6cbMkkMdrTrhkzPo
	GzIuwxKV8cLikooj83PbgLYzEWMC6RcQ0XHPLK0mwA4pXr3w7mlOQo6g==
X-Received: by 2002:a05:7300:e826:b0:304:8881:b82 with SMTP id 5a478bee46e88-30488810bd7mr4633718eec.1.1779861184313;
        Tue, 26 May 2026 22:53:04 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304be0851c9sm613202eec.23.2026.05.26.22.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 22:53:03 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Tue, 26 May 2026 22:52:40 -0700
Subject: [PATCH v2 3/3] KVM: riscv: selftests: Split SBI FWFT into separate
 feature-specific sublists
MIME-Version: 1.0
Message-Id: <20260526-kvm-get_reg_list-v2-v2-3-7940a401454a@sifive.com>
References: <20260526-kvm-get_reg_list-v2-v2-0-7940a401454a@sifive.com>
In-Reply-To: <20260526-kvm-get_reg_list-v2-v2-0-7940a401454a@sifive.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779861178; l=7898;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=PU3MvdV8tam4q1KMdiajihMJ3i8qhlgrfETzPE8HD/Y=;
 b=Rf/Bxb/Y6dVq19o6khyGvrIhnmWe6YPFVdkxBIChoeXeDEbJ5eD7cToZTzm/Vs3esy/8MC97k
 1y2/g4v/RwICUXDg73dHFNGlE0YaXfV2hGe0iNJyWyk9lFzoRaXUW+j
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_225305_375745_064925DC 
X-CRM114-Status: GOOD (  18.48  )
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

Divide the monolithic SBI FWFT (Firmware Features) register list into
separate sublists, each testing a specific FWFT feature independently
with proper dependency checking.

Previously, all FWFT features were tested together in a single sublist.
This caused issues because:
1. Not all FWFT features are available on all platforms
2. Some features depend on specific ISA extensions (e.g., pointer_masking
requires Smnpm)
3. Tests would fail if any single feature was unavailable

Add the feature-specific SBI FWFT sublists with the following
improvements:
- Add check_supported_reg() function to validate register availability
  based on required ISA extensions
- Add check_fwft_feature() helper to verify FWFT feature availability
  at runtime
- Update filter_reg() to handle per-feature FWFT register filtering

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 92 +++++++++++++++++++++---
 1 file changed, 82 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index cb16c638ce1a..6a34320be78c 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -26,7 +26,21 @@ enum {
 	KVM_RISC_V_REG_OFFSET_MAX,
 };
 
-static bool isa_ext_cant_disable[KVM_RISCV_ISA_EXT_MAX];
+static bool isa_ext_enabled[KVM_RISCV_ISA_EXT_MAX];
+
+bool check_supported_reg(struct kvm_vcpu *vcpu, __u64 reg)
+{
+	switch (reg & ~REG_MASK) {
+	case KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.enable):
+	case KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.flags):
+	case KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.value):
+		return isa_ext_enabled[KVM_RISCV_ISA_EXT_SMNPM];
+	default:
+		break;
+	}
+
+	return true;
+}
 
 bool filter_reg(__u64 reg)
 {
@@ -148,7 +162,12 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siph):
 	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1h):
 	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio2h):
-		return isa_ext_cant_disable[KVM_RISCV_ISA_EXT_SSAIA];
+		return isa_ext_enabled[KVM_RISCV_ISA_EXT_SSAIA];
+	/* KVM misaligned delegation registers are always visible when the host supports it */
+	case KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(misaligned_deleg.enable):
+	case KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(misaligned_deleg.flags):
+	case KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(misaligned_deleg.value):
+		return true;
 	default:
 		break;
 	}
@@ -193,15 +212,39 @@ static int override_vector_reg_size(struct kvm_vcpu *vcpu, struct vcpu_reg_subli
 	return 0;
 }
 
+void check_fwft_feature(struct kvm_vcpu *vcpu, struct vcpu_reg_sublist *s, u64 feature)
+{
+	unsigned long value;
+	int rc;
+
+	/* Enable SBI FWFT extension so that we can check the supported register */
+	rc = __vcpu_set_reg(vcpu, feature, 1);
+	if (rc)
+		return;
+
+	for (int i = 0; i < s->regs_n; i++) {
+		if ((s->regs[i] & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_SBI_STATE) {
+			rc = __vcpu_get_reg(vcpu, s->regs[i], &value);
+			__TEST_REQUIRE(!rc, "%s not available, skipping tests", s->name);
+		}
+	}
+
+	/* We should assert if disabling failed here while enabling succeeded before */
+	vcpu_set_reg(vcpu, feature, 0);
+}
+
 void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 {
-	unsigned long isa_ext_state[KVM_RISCV_ISA_EXT_MAX] = { 0 };
+	unsigned long isa_ext_state;
 	struct vcpu_reg_sublist *s;
 	u64 feature;
 	int rc;
 
-	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++)
-		__vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(i), &isa_ext_state[i]);
+	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++) {
+		rc = __vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(i), &isa_ext_state);
+		if (!rc)
+			isa_ext_enabled[i] = !!isa_ext_state;
+	}
 
 	/*
 	 * Disable all extensions which were enabled by default
@@ -209,8 +252,10 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 	 */
 	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++) {
 		rc = __vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(i), 0);
-		if (rc && isa_ext_state[i])
-			isa_ext_cant_disable[i] = true;
+		if (rc && isa_ext_enabled[i])
+			isa_ext_enabled[i] = true;
+		else
+			isa_ext_enabled[i] = false;
 	}
 
 	for (int i = 0; i < KVM_RISCV_SBI_EXT_MAX; i++) {
@@ -229,9 +274,15 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 				goto skip;
 		}
 
+		if (s->feature == KVM_RISCV_SBI_EXT_FWFT) {
+			feature = RISCV_SBI_EXT_REG(KVM_RISCV_SBI_EXT_FWFT);
+			check_fwft_feature(vcpu, s, feature);
+		}
+
 		switch (s->feature_type) {
 		case VCPU_FEATURE_ISA_EXT:
 			feature = RISCV_ISA_EXT_REG(s->feature);
+			isa_ext_enabled[s->feature] = true;
 			break;
 		case VCPU_FEATURE_SBI_EXT:
 			feature = RISCV_SBI_EXT_REG(s->feature);
@@ -897,11 +948,15 @@ static __u64 sbi_sta_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_STA | KVM_REG_RISCV_SBI_STA_REG(shmem_hi),
 };
 
-static __u64 sbi_fwft_regs[] = {
+static __u64 sbi_fwft_misaligned_deleg_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_FWFT,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(misaligned_deleg.enable),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(misaligned_deleg.flags),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(misaligned_deleg.value),
+};
+
+static __u64 sbi_fwft_pointer_masking_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_FWFT,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.enable),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.flags),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.value),
@@ -1129,7 +1184,6 @@ KVM_SBI_EXT_SIMPLE_CONFIG(pmu, PMU);
 KVM_SBI_EXT_SIMPLE_CONFIG(dbcn, DBCN);
 KVM_SBI_EXT_SIMPLE_CONFIG(susp, SUSP);
 KVM_SBI_EXT_SIMPLE_CONFIG(mpxy, MPXY);
-KVM_SBI_EXT_SUBLIST_CONFIG(fwft, FWFT);
 
 KVM_ISA_EXT_SUBLIST_CONFIG(aia, SSAIA);
 KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, F);
@@ -1206,6 +1260,23 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zvksed, ZVKSED);
 KVM_ISA_EXT_SIMPLE_CONFIG(zvksh, ZVKSH);
 KVM_ISA_EXT_SIMPLE_CONFIG(zvkt, ZVKT);
 
+static struct vcpu_reg_list config_sbi_fwft_misaligned_deleg = {
+	.sublists = {
+		SUBLIST_BASE,
+		SUBLIST_SBI(fwft_misaligned_deleg, FWFT),
+		{0},
+	},
+};
+
+static struct vcpu_reg_list config_sbi_fwft_pointer_masking = {
+	.sublists = {
+		SUBLIST_BASE,
+		SUBLIST_ISA(smnpm, SMNPM),
+		SUBLIST_SBI(fwft_pointer_masking, FWFT),
+		{0},
+	},
+};
+
 struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_base,
 	&config_sbi_sta,
@@ -1213,7 +1284,8 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_dbcn,
 	&config_sbi_susp,
 	&config_sbi_mpxy,
-	&config_sbi_fwft,
+	&config_sbi_fwft_misaligned_deleg,
+	&config_sbi_fwft_pointer_masking,
 	&config_aia,
 	&config_fp_f,
 	&config_fp_d,

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
