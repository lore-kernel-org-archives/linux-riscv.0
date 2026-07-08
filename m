Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3914AC43458
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 03:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PalSQvjL4R76+PR0mcIFVK1klwO1CJ0oxAiSKsGLMSI=; b=AgdUqcwJB7/5WV
	JFOJ8Xwvz7TEkqSrtwTYkk6WrIIahqCxxbo1tN0GD38NUfXSaqW7q38/GjFef9JHWAXUVnSxhMe94
	hDmOgcpYUhpyYjOCZyFyraWGLmfhGxlERc1u69Miekh7nwKOgIeWBPKtHDhJwvFqCJZAE9Z+x/iqw
	N5fv6ng5kD9GNXWBZM1sqAnYzlJCGpkmqLQi3TxJ0VvD9dnrUeqgtUmmGFphX8LF7G5WTJ0FMY338
	IJ6Z6Hz7mYQFGTV+KMl9QPQp56hRmuj+dw7WX5lLsUMDa5ZwG56cZozASJi0CG/g7ccVUKuM/1/hE
	Vz1gyjwM4D2xegcT/8VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ64-0000000GGW5-0Wyv;
	Wed, 08 Jul 2026 03:37:16 +0000
Received: from mail-pg1-f171.google.com ([209.85.215.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5U-0000000GFnm-3HNi
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 03:36:53 +0000
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so109824a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jul 2026 20:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481800; x=1784086600; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUBZvRnL+ZXJbHfTUcziKP3eKEVdrudg5Rhw4iw5elg=;
        b=hp60B3ikVWZj1+29bepkxnNUQ4JFHh3/GfQZkYcSdjSFF/YOB1ALlm32VZWPrChf/Z
         EHf2VjoLHV3GWTRGKcytffd965ZyQduf5S4YgY7vWFofnQYZvzFHqHTe8JngSh5FkgWm
         OoWSUhRH4zwiKdJjn020qpxS4+B4yWy/hrLtDPD5HuIw83oo+hRBgL9phVV0yGYy64ge
         MKSGOeTGa92d/Ut/8T7Q8uPS9/A0izPuKycyi0iOvFccOsag3IgMKZVOBMv/bU6t12CJ
         V5jbWPjKS6s8Iuwuzba7JS8eNeMoefFjis1I1g/ZEH2k1kWmINnOfDlfGOGSb87YS3FO
         rPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481800; x=1784086600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aUBZvRnL+ZXJbHfTUcziKP3eKEVdrudg5Rhw4iw5elg=;
        b=klDXvGGKyW3Ggee9leKmo5W+ciJV62Zn6i276KzBPv/m5gUM1YBRS+iZHeHAggjewb
         ZFPpkI+7Ul+g6HlagEftRkxx596JkCPmR7lGzC3VsfIK1DwWA3LpPFw8vuja7vlFlcUf
         3npr0oB780vr/dUTbG+1qL4X3FPKeior2ApNQNhEf3JA86F21qeu7+BIt7REUgkh0tUN
         oZnvtV+CysUQmlOOhVSA+IFJs87PuPysX9ojhWtYsRaEfvbHZ6UcnZAHZjGN7yqi87gN
         9E9QDYm2KljZX8C8TP4c3lXXQccGignZROmXaeLqqgrSVAiMDWVmwacvYB7BhNzzlzJg
         su+g==
X-Gm-Message-State: AOJu0YzL58UWWhLVnX2u4YY6Eki337c/YAYTROx7mQKHufQ89aGUZ90u
	ZmxxMWhYk4N7u6WNvsskVFfvnxl75E+DPRP/w7sK9iJVvMz9eyfkp9Af
X-Gm-Gg: AfdE7cl7jjh5i9vFDqu7cmcMEI0ayrJiC73aUlNZj2i+wHvBrMt479bjtczZik1COX+
	dGlwlWRgz/de8XGTSfsLLtxTNc0CPgzK007vPfyaMqJGhpYnSi+/HS4W00pJO+TIMz6/zvJtag8
	gWGH15ayblcYd6H4U2ZKpMmpYpWDr5VeA9be4UoAMKmGEPB+wBe9MYiEdzaFIVzttXlidyB5Lj/
	AQxgMcDxjgPvx2fzWvsQBvxXogul98prFi48eFOEMyd+0a7my6F/rxsrK/oxow/piLwR1jbdhH7
	qZjaItmRgo/Gq5QLTp7xga1HbehXfAb5QZIz0oPc+I/vX61fHDQ6YdakcDUJuo3PlI0Tnn7p97G
	OSiPOUyOUzWlvy35Bw0YupF7mKmt8fd1/xcuqg4OzFCcVgO7hRz38I3GJc++pYAmo8oayeokqmn
	7GIJ8zzNt8rsLqLQ+bmngFSeJsfycCewK/nRUHDsQ=
X-Received: by 2002:a05:6a21:9148:b0:3bf:b885:2fad with SMTP id adf61e73a8af0-3c0bd15d917mr601381637.53.1783481799581;
        Tue, 07 Jul 2026 20:36:39 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:39 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 07 Jul 2026 20:34:35 -0700
Subject: [PATCH v3 12/17] riscv: kvm: Use generated instruction headers for
 mmio emulation
MIME-Version: 1.0
Message-Id: <20260707-riscv_insn_table-v3-12-3f8e5f75ba97@gmail.com>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
In-Reply-To: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alex@ghiti.fr>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Conor Dooley <conor@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481777; l=10392;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=N89WIRnSp7+lccD6RgSHGp1cFmRNkUgBxIpUGtfogCs=;
 b=xU60Iju/q7Uht8YVBsvojIlHWK4nDYtS77/JpXjoZFghY/EkcRwtDpB3cgwJ0Zt77D+OJ3xXs
 0yU3825ThEhCfY8H02GeXVVzrmVt9L60PYhistlObWfW7d4qTVmxY+b
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_203641_033863_F91E4812 
X-CRM114-Status: GOOD (  20.24  )
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

Migrate the mmio emulation code to use the generated instruction headers
instead of the hand-written instruction composition functions.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 arch/riscv/include/asm/kvm_vcpu_insn.h |   2 +-
 arch/riscv/kvm/vcpu_insn.c             | 156 +++++++++++++++------------------
 virt/kvm/mmio_test.c                   |   9 +-
 3 files changed, 75 insertions(+), 92 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_insn.h b/arch/riscv/include/asm/kvm_vcpu_insn.h
index 350011c83581..106fb4c45108 100644
--- a/arch/riscv/include/asm/kvm_vcpu_insn.h
+++ b/arch/riscv/include/asm/kvm_vcpu_insn.h
@@ -11,7 +11,7 @@ struct kvm_run;
 struct kvm_cpu_trap;
 
 struct kvm_mmio_decode {
-	unsigned long insn;
+	unsigned long rd;
 	int insn_len;
 	int len;
 	int shift;
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index a1898ab8bbe8..78adc2830819 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -379,7 +379,7 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			     unsigned long htinst)
 {
 	u8 data_buf[8];
-	unsigned long insn;
+	unsigned long insn, rd;
 	int shift = 0, len = 0, insn_len = 0;
 	struct kvm_cpu_trap utrap = { 0 };
 	struct kvm_cpu_context *ct = &vcpu->arch.guest_context;
@@ -411,44 +411,47 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	}
 
 	/* Decode length of MMIO and shift */
-	if ((insn & INSN_MASK_LW) == INSN_MATCH_LW) {
+	if (riscv_insn_is_lw(insn)) {
 		len = 4;
 		shift = 8 * (sizeof(ulong) - len);
-	} else if ((insn & INSN_MASK_LB) == INSN_MATCH_LB) {
+		rd = riscv_insn_lw_extract_xd(insn);
+	} else if (riscv_insn_is_lb(insn)) {
 		len = 1;
 		shift = 8 * (sizeof(ulong) - len);
-	} else if ((insn & INSN_MASK_LBU) == INSN_MATCH_LBU) {
+		rd = riscv_insn_lb_extract_xd(insn);
+	} else if (riscv_insn_is_lbu(insn)) {
 		len = 1;
-#ifdef CONFIG_64BIT
-	} else if ((insn & INSN_MASK_LD) == INSN_MATCH_LD) {
+		rd = riscv_insn_lbu_extract_xd(insn);
+	} else if (riscv_insn_is_ld(insn)) {
 		len = 8;
 		shift = 8 * (sizeof(ulong) - len);
-	} else if ((insn & INSN_MASK_LWU) == INSN_MATCH_LWU) {
+		rd = riscv_insn_ld_extract_xd(insn);
+	} else if (riscv_insn_is_lwu(insn)) {
 		len = 4;
-#endif
-	} else if ((insn & INSN_MASK_LH) == INSN_MATCH_LH) {
+		rd = riscv_insn_lwu_extract_xd(insn);
+	} else if (riscv_insn_is_lh(insn)) {
 		len = 2;
 		shift = 8 * (sizeof(ulong) - len);
-	} else if ((insn & INSN_MASK_LHU) == INSN_MATCH_LHU) {
+		rd = riscv_insn_lh_extract_xd(insn);
+	} else if (riscv_insn_is_lhu(insn)) {
 		len = 2;
-#ifdef CONFIG_64BIT
-	} else if ((insn & INSN_MASK_C_LD) == INSN_MATCH_C_LD) {
+		rd = riscv_insn_lhu_extract_xd(insn);
+	} else if (riscv_insn_is_c_ld(insn)) {
 		len = 8;
 		shift = 8 * (sizeof(ulong) - len);
-		insn = RVC_RS2S(insn) << SH_RD;
-	} else if ((insn & INSN_MASK_C_LDSP) == INSN_MATCH_C_LDSP &&
-		   ((insn >> SH_RD) & 0x1f)) {
+		rd = riscv_insn_c_ld_extract_xd(insn);
+	} else if (riscv_insn_is_c_ldsp(insn)) {
 		len = 8;
 		shift = 8 * (sizeof(ulong) - len);
-#endif
-	} else if ((insn & INSN_MASK_C_LW) == INSN_MATCH_C_LW) {
+		rd = riscv_insn_c_ldsp_extract_xd(insn);
+	} else if (riscv_insn_is_c_lw(insn)) {
 		len = 4;
 		shift = 8 * (sizeof(ulong) - len);
-		insn = RVC_RS2S(insn) << SH_RD;
-	} else if ((insn & INSN_MASK_C_LWSP) == INSN_MATCH_C_LWSP &&
-		   ((insn >> SH_RD) & 0x1f)) {
+		rd = riscv_insn_c_lw_extract_xd(insn);
+	} else if (riscv_insn_is_c_lwsp(insn)) {
 		len = 4;
 		shift = 8 * (sizeof(ulong) - len);
+		rd = riscv_insn_c_lwsp_extract_xd(insn);
 	} else {
 		return -EOPNOTSUPP;
 	}
@@ -458,7 +461,7 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		return -EIO;
 
 	/* Save instruction decode info */
-	vcpu->arch.mmio_decode.insn = insn;
+	vcpu->arch.mmio_decode.rd = rd;
 	vcpu->arch.mmio_decode.insn_len = insn_len;
 	vcpu->arch.mmio_decode.shift = shift;
 	vcpu->arch.mmio_decode.len = len;
@@ -501,11 +504,7 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			      unsigned long fault_addr,
 			      unsigned long htinst)
 {
-	u8 data8;
-	u16 data16;
-	u32 data32;
-	u64 data64;
-	ulong data;
+	ulong data, rs2;
 	unsigned long insn;
 	int len = 0, insn_len = 0;
 	struct kvm_cpu_trap utrap = { 0 };
@@ -537,35 +536,30 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		insn_len = INSN_LEN(insn);
 	}
 
-	data = GET_RS2(insn, &vcpu->arch.guest_context);
-	data8 = data16 = data32 = data64 = data;
-
-	if ((insn & INSN_MASK_SW) == INSN_MATCH_SW) {
+	if (riscv_insn_is_sw(insn)) {
 		len = 4;
-	} else if ((insn & INSN_MASK_SB) == INSN_MATCH_SB) {
+		rs2 = riscv_insn_sw_extract_xs2(insn);
+	} else if (riscv_insn_is_sb(insn)) {
 		len = 1;
-#ifdef CONFIG_64BIT
-	} else if ((insn & INSN_MASK_SD) == INSN_MATCH_SD) {
+		rs2 = riscv_insn_sb_extract_xs2(insn);
+	} else if (riscv_insn_is_sd(insn)) {
 		len = 8;
-#endif
-	} else if ((insn & INSN_MASK_SH) == INSN_MATCH_SH) {
+		rs2 = riscv_insn_sd_extract_xs2(insn);
+	} else if (riscv_insn_is_sh(insn)) {
 		len = 2;
-#ifdef CONFIG_64BIT
-	} else if ((insn & INSN_MASK_C_SD) == INSN_MATCH_C_SD) {
+		rs2 = riscv_insn_sh_extract_xs2(insn);
+	} else if (riscv_insn_is_c_sd(insn)) {
 		len = 8;
-		data64 = GET_RS2S(insn, &vcpu->arch.guest_context);
-	} else if ((insn & INSN_MASK_C_SDSP) == INSN_MATCH_C_SDSP &&
-		   ((insn >> SH_RD) & 0x1f)) {
+		rs2 = riscv_insn_c_sd_extract_xs2(insn);
+	} else if (riscv_insn_is_c_sdsp(insn)) {
 		len = 8;
-		data64 = GET_RS2C(insn, &vcpu->arch.guest_context);
-#endif
-	} else if ((insn & INSN_MASK_C_SW) == INSN_MATCH_C_SW) {
+		rs2 = riscv_insn_c_sdsp_extract_xs2(insn);
+	} else if (riscv_insn_is_c_sw(insn)) {
 		len = 4;
-		data32 = GET_RS2S(insn, &vcpu->arch.guest_context);
-	} else if ((insn & INSN_MASK_C_SWSP) == INSN_MATCH_C_SWSP &&
-		   ((insn >> SH_RD) & 0x1f)) {
+		rs2 = riscv_insn_c_sw_extract_xs2(insn);
+	} else if (riscv_insn_is_c_swsp(insn)) {
 		len = 4;
-		data32 = GET_RS2C(insn, &vcpu->arch.guest_context);
+		rs2 = riscv_insn_c_swsp_extract_xs2(insn);
 	} else {
 		return -EOPNOTSUPP;
 	}
@@ -574,26 +568,24 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	if (fault_addr & (len - 1))
 		return -EIO;
 
-	/* Save instruction decode info */
-	vcpu->arch.mmio_decode.insn = insn;
 	vcpu->arch.mmio_decode.insn_len = insn_len;
-	vcpu->arch.mmio_decode.shift = 0;
-	vcpu->arch.mmio_decode.len = len;
 	vcpu->arch.mmio_decode.return_handled = 0;
 
+	data = *((ulong *)(&vcpu->arch.guest_context) + rs2);
+
 	/* Copy data to kvm_run instance */
 	switch (len) {
 	case 1:
-		*((u8 *)run->mmio.data) = data8;
+		*((u8 *)run->mmio.data) = data;
 		break;
 	case 2:
-		*((u16 *)run->mmio.data) = data16;
+		*((u16 *)run->mmio.data) = data;
 		break;
 	case 4:
-		*((u32 *)run->mmio.data) = data32;
+		*((u32 *)run->mmio.data) = data;
 		break;
 	case 8:
-		*((u64 *)run->mmio.data) = data64;
+		*((u64 *)run->mmio.data) = data;
 		break;
 	default:
 		return -EOPNOTSUPP;
@@ -629,48 +621,40 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
  */
 int kvm_riscv_vcpu_mmio_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 {
-	u8 data8;
-	u16 data16;
-	u32 data32;
-	u64 data64;
-	ulong insn;
 	int len, shift;
+	unsigned long data;
 
 	if (vcpu->arch.mmio_decode.return_handled)
 		return 0;
 
 	vcpu->arch.mmio_decode.return_handled = 1;
-	insn = vcpu->arch.mmio_decode.insn;
 
 	if (run->mmio.is_write)
 		goto done;
 
-	len = vcpu->arch.mmio_decode.len;
-	shift = vcpu->arch.mmio_decode.shift;
+	if (vcpu->arch.mmio_decode.rd) {
+		len = vcpu->arch.mmio_decode.len;
+		shift = vcpu->arch.mmio_decode.shift;
 
-	switch (len) {
-	case 1:
-		data8 = *((u8 *)run->mmio.data);
-		SET_RD(insn, &vcpu->arch.guest_context,
-			(long)((ulong)data8 << shift) >> shift);
-		break;
-	case 2:
-		data16 = *((u16 *)run->mmio.data);
-		SET_RD(insn, &vcpu->arch.guest_context,
-			(long)((ulong)data16 << shift) >> shift);
-		break;
-	case 4:
-		data32 = *((u32 *)run->mmio.data);
-		SET_RD(insn, &vcpu->arch.guest_context,
-			(long)((ulong)data32 << shift) >> shift);
-		break;
-	case 8:
-		data64 = *((u64 *)run->mmio.data);
-		SET_RD(insn, &vcpu->arch.guest_context,
-			(long)((ulong)data64 << shift) >> shift);
-		break;
-	default:
-		return -EOPNOTSUPP;
+		switch (len) {
+		case 1:
+			data = *((u8 *)run->mmio.data);
+			break;
+		case 2:
+			data = *((u16 *)run->mmio.data);
+			break;
+		case 4:
+			data = *((u32 *)run->mmio.data);
+			break;
+		case 8:
+			data = *((u64 *)run->mmio.data);
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+
+		*((ulong *)(&vcpu->arch.guest_context) + vcpu->arch.mmio_decode.rd) =
+			(long)data << shift >> shift;
 	}
 
 done:
diff --git a/virt/kvm/mmio_test.c b/virt/kvm/mmio_test.c
index bd5f21a43ba8..b3fec6988333 100644
--- a/virt/kvm/mmio_test.c
+++ b/virt/kvm/mmio_test.c
@@ -55,6 +55,7 @@ static const struct kvm_io_device_ops mmio_ops = {
 static int mmio_test_create(struct kvm_device *dev, u32 type)
 {
 	struct mmio_test *mmio_test;
+	int ret;
 
 	mmio_test = kzalloc_obj(struct mmio_test, GFP_KERNEL);
 	if (!mmio_test)
@@ -66,10 +67,10 @@ static int mmio_test_create(struct kvm_device *dev, u32 type)
 	dev->private = mmio_test;
 
 	kvm_iodevice_init(&mmio_test->dev, &mmio_ops);
-	mutex_lock(&kvm->slots_lock);
+	mutex_lock(&dev->kvm->slots_lock);
 	ret = kvm_io_bus_register_dev(dev->kvm, KVM_MMIO_BUS, mmio_test->start,
 				mmio_test->size, &mmio_test->dev);
-	mutex_unlock(&kvm->slots_lock);
+	mutex_unlock(&dev->kvm->slots_lock);
 
 	if (ret < 0)
 		kfree(mmio_test);
@@ -79,9 +80,7 @@ static int mmio_test_create(struct kvm_device *dev, u32 type)
 
 static void mmio_test_destroy(struct kvm_device *dev)
 {
-	struct mmio_test *mmio_test = kvm_to_mmio_test_dev(dev);
-
-	kvm_io_bus_unregister_dev(dev->kvm, KVM_MMIO_BUS, &mmio_test->dev);
+	kvm_io_bus_unregister_dev(dev->kvm, KVM_MMIO_BUS, &((struct mmio_test *)dev->private)->dev);
 	kfree(dev->private);
 	kfree(dev);
 }

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
