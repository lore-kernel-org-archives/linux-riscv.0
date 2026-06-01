Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1C0CD6E61
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pCCrimwl0md3g3Y3xbWfdd0kpRVLCEWETsvfwAzCaf0=; b=T+cBRGsKs/gcVU
	FyawpQNOeV8eIy1VGPZxvQU57OTMyt24bhewhG2xQobp/xwhOmEuhTe/BCvxz282sMmfO/GcLd7zW
	GAxzsAIdfNrznrCR1oWbNc0bngNPzW9/unbX/tx331jvsONeuTudCfuMkNXE21w8u88XPPRBL0dvo
	KUvjJWVtcGpKX//ocC0huI8UePadso3CIWLVrhQwC/aO/Jg3hqJRl4QMaZkHIqNqRst+3VCmEIz18
	U/NnwDypJxcWS61RKfW3PIFBLIkLoEgxIFpoB6syU/DFXvtYn3eWsiiz8Vqx5W801y97Xhf8F9ttE
	8xiEHJXCmgq3NauB+hAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyCV-0000000ANXR-0DLF;
	Mon, 01 Jun 2026 08:40:47 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyCR-0000000ANTP-1HG7
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:40:45 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-304d0ac5e3cso4849040eec.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jun 2026 01:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1780303242; x=1780908042; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZpUjEIn4ZuMPGVsNdGCP5Htku1Dpr8xmIsStUVmQFFI=;
        b=lWrVEO7AC8e2nsbnnWn3rV3vv40opn8+4mqkBV7BNyWNjQkL7g8nOsh6poJp9v3sFZ
         tdgAeC5gXoAxVGPIXy4f2t+h388HB62hDlrszEoRJB73zQjWPPjHGhoKLD+YR7deAvAX
         7JMjTVFd88A5LEcoxR8eHgrox/KUl124db/ktFT7FOLzrBzAni/NuioO6Pl0ybFxH89O
         4ckIntY0+Qyg0LwsE/2rsqT790FgBk3C3N8cg8NY870KgWNhjQ0vCg3gHUxXuJZ7bfRS
         VHN9C0Nue8a0MWpfCZH0aPUW3FYwHcpuUrlj/RkCD2tguYAXTyORSgdG8CSh3jGy+lb2
         btpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303242; x=1780908042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZpUjEIn4ZuMPGVsNdGCP5Htku1Dpr8xmIsStUVmQFFI=;
        b=SNnac/OkrEuTRSob4Sln35G4+hfIojXfcw1gAxYngAEU90OUc6mHFtsqHdda0jRO9d
         XcrfVd1V3s2jd1PKN+/L5uwCTQBquQIkJ+3BeDEOFOBNB7DZRXKujV8IrozCdMfDuKyl
         /k1mstjNvkKDxSm/cPmlw+LnCgIkdWzM/dzlejRW2w1A0doTii51wD2Ox0LFDXsAWs3p
         KHjg1qKPZzhPUaypEWYRNG/CEJu/kNi/MNsBTH7KiHnBV3YeHe6mur6nYlIW+P0j6m+s
         bv8uHo9N9EqvHT/NYB/SWKQRZFR1AvHm0+mQc+CmndPp3JcqWtacD+sbGDZO71tqufGB
         QFPA==
X-Forwarded-Encrypted: i=1; AFNElJ/0CyA+TLzsTo1EgfUWFxNWwFms0E3rVRErPQApNzJxx4BPCnpIepbKt8xgHNXqwAh/3LUqfJyFIbdILg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk22niKf35YmiIe5k/zLegW33O2lg2x/zjt99ZsvNGRSvVcBeQ
	WiCnSdH2vFReQz4n9A5dBTM/Xk8GBVrbZAEMFnJUFDgCT6LVWJ9fZKrd+FWq1dX+Z04=
X-Gm-Gg: Acq92OGnV6Wsw7ytgMe545A8fghJeJOJwydHvWCPXdMkKZtxC7/8qYFeSK275u+VAi6
	zfm8o/PQFCBzdZ65p4VlR6BB1xyoSpYPa3iVHQSGRoTwSp85uSchmIfnAvHhMTGqs2Rhqh59NL+
	ojehY3t6WioL08ut8N83JBhAj7KqtMCjfUlMspf74a3nE0Om4vlcip0k9+RVW3VvTCl7SB1hFdx
	sBucfNk3/8bKDgIVXP9aB6lEpOGWXIBs8/kw8yR1Ff0VqRkcjuf71Kd18DQybuBI3IfJucQU2De
	yIpSrgvLp/rH13bB+TkvSN7oyS45EcmzQx+29Vc3mJD8Xwgq47IEtDt1HS3+mJUyCTezZI41QY3
	t3Yif7MUMzT9490R53wF/d9/Hq0GlE6xyacthnyioIRCxwS+SfOFLoRO1ShgevNgGSS3ctjDsqP
	AZ+kVhPRITBbQP4KKECiNqGbqDAJ3cbwIrUdERNjWIo/z/aHhuKgMc/jRGhQR2WGl2
X-Received: by 2002:a05:7300:cd94:b0:2e0:4edd:64e4 with SMTP id 5a478bee46e88-304fa75091emr4500790eec.26.1780303242427;
        Mon, 01 Jun 2026 01:40:42 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5b9be7sm8011818eec.27.2026.06.01.01.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:40:41 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Mon, 01 Jun 2026 01:40:36 -0700
Subject: [PATCH v4 3/3] KVM: riscv: selftests: Split SBI FWFT into separate
 feature-specific sublists
MIME-Version: 1.0
Message-Id: <20260601-kvm-get_reg_list-v2-v4-3-c88abc81ebda@sifive.com>
References: <20260601-kvm-get_reg_list-v2-v4-0-c88abc81ebda@sifive.com>
In-Reply-To: <20260601-kvm-get_reg_list-v2-v4-0-c88abc81ebda@sifive.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780303237; l=6157;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=dvopGRgDaRky18g/xnQDE1UFxOqmLWbk1vHTjPzPMBI=;
 b=2HV2PtEehribkyjlVJiSDoKw01n9W76kDsd12gE0hfFft+547TXue2yYjgqmdzHfFWA9qYpdt
 qYXVGjh7cLfCjbRbfzHbu38BJLB5UyEVKjvAT3Mu+cfea8alvWtTAM9
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014043_393873_C9CF918D 
X-CRM114-Status: GOOD (  16.54  )
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
- Add check_fwft_feature() helper to verify FWFT feature availability
  at runtime
- Update filter_reg() to handle per-feature FWFT register filtering

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 60 ++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 5033c09201ef..cb86cb6b3635 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -27,6 +27,7 @@ enum {
 };
 
 static bool isa_ext_cant_disable[KVM_RISCV_ISA_EXT_MAX];
+static bool sbi_ext_enabled[KVM_RISCV_SBI_EXT_MAX];
 
 bool filter_reg(__u64 reg)
 {
@@ -149,6 +150,14 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1h):
 	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio2h):
 		return isa_ext_cant_disable[KVM_RISCV_ISA_EXT_SSAIA];
+	/*
+	 * FWFT misaligned delegation registers are always visible when the SBI FWFT
+	 * extension is enable and the host supports the misaligned delegation.
+	 */
+	case KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(misaligned_deleg.enable):
+	case KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(misaligned_deleg.flags):
+	case KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(misaligned_deleg.value):
+		return sbi_ext_enabled[KVM_RISCV_SBI_EXT_FWFT];
 	default:
 		break;
 	}
@@ -193,6 +202,27 @@ static int override_vector_reg_size(struct kvm_vcpu *vcpu, struct vcpu_reg_subli
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
 	unsigned long isa_ext_state[KVM_RISCV_ISA_EXT_MAX] = { 0 };
@@ -235,6 +265,9 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 			break;
 		case VCPU_FEATURE_SBI_EXT:
 			feature = RISCV_SBI_EXT_REG(s->feature);
+			if (s->feature == KVM_RISCV_SBI_EXT_FWFT)
+				check_fwft_feature(vcpu, s, feature);
+			sbi_ext_enabled[s->feature] = true;
 			break;
 		default:
 			TEST_FAIL("Unknown feature type");
@@ -897,11 +930,15 @@ static __u64 sbi_sta_regs[] = {
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
@@ -1129,7 +1166,6 @@ KVM_SBI_EXT_SIMPLE_CONFIG(pmu, PMU);
 KVM_SBI_EXT_SIMPLE_CONFIG(dbcn, DBCN);
 KVM_SBI_EXT_SIMPLE_CONFIG(susp, SUSP);
 KVM_SBI_EXT_SIMPLE_CONFIG(mpxy, MPXY);
-KVM_SBI_EXT_SUBLIST_CONFIG(fwft, FWFT);
 
 KVM_ISA_EXT_SUBLIST_CONFIG(aia, SSAIA);
 KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, F);
@@ -1206,6 +1242,23 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zvksed, ZVKSED);
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
@@ -1213,7 +1266,8 @@ struct vcpu_reg_list *vcpu_configs[] = {
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
