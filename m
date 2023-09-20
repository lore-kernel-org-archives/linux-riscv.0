Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8671C04AA9
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 15:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DG+RNXEwphAu7ZdU+eRP3+/CnIAkfOnco086/DRBAXs=; b=pNoP2iQ7MDKbKm
	bMfepS718Fq1LTSlbdsbKL7fNQsx3rXDVL56Veft7w/HksSkkNkN/20m4tHaaH3NmYC9RYUhJklif
	57Mf9bunwIGQ6aPm0yeCuJoO6z03KdzLs1CRv6LwCUVh0zg+tdbuvHvSQ0Znhmgrhj+z7gaEcPieS
	UBx2CNP27xSn4vSvXk4oHwzauAtA/nJouROoBok0WlfkIqs9qf1+wPbl2Xv5RkGz9reP0nVP/2LQD
	4vrNjA74+6BnGED7cAom16RF/cvZQ6ztkUupWa2cZL24B4i5Zztz71WoJR2Cxst+ZQtVQTHbRY5/N
	Je6leDo2EArQGg039+9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qizPY-003Xvu-2W;
	Wed, 20 Sep 2023 15:46:44 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qizPV-003Xs8-2i
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 15:46:43 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1c3cbfa40d6so62348395ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 08:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695224800; x=1695829600; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEpzhn0/r3h7zE+n/9TA9uRn8epPj0d0ldcwcNh6iPI=;
        b=dEyzxBTsNOmBVy3CoKlDAAVnIK/d5C+JyAerntzTBcQkCDIZUEY+b+FtugE1AVCgca
         ymAUdOBNj23+/9dvzCSmRTBeMUxZKBZZiyQtwAn4Tfpkp15AQwij+jP2TcFbXHg+iO5p
         Y+hYyryqV3LkkqUAilx8d09IRKGzJAROj/ES+iwaX7OT3JYLwYE4ChORbbObe/+tjp1A
         tZ4Tj9lShc5S3rcZ24gxq6awSSI+8hOVIqKHccrzwPAvacRORKEKmdk3/NyY/aRF2W0m
         kWp2A7t71qZUJbxEtgeynINbZV5n+hgoEBa2kvvln8Uk+TJzkXefoN4y9h34AJkGd4l7
         qF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695224800; x=1695829600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEpzhn0/r3h7zE+n/9TA9uRn8epPj0d0ldcwcNh6iPI=;
        b=LDn6bHBty/iqm5tZH1I83U2PbEXo/pXsO2Z2duL3c0Dr6Cy3lZ4xkMqLr/GU7+uodQ
         0qa4YICp9gFAfK5cN4kEnT7hUsLtCXg+pdKDvgfekze42TYbITmykA6P/xAbSpsiI4aN
         /SA1I7CegDMeDRECnFLljn0yPBsb+WPNsynCpHFcuNGGwzcRxe9xOWm2Qhwh/y0DDUWu
         xfPwYalRAZgOiPW4EinGYdM7yd0asKwD++LFTWHDw0yN4ylXBWZGiwodIQurkaRC/gLt
         qCu3zqlD2cbs5EPVptIQkj2BnLvu6saWIQ/vETKboUHBcuw4LyqSpgglOywZOuE/Fnph
         QRDA==
X-Gm-Message-State: AOJu0Yw3RSRYsyK9f07uO44xo7ZhLLGxHB+yNJZvmlk2zBsZPrT2IQVC
	uoX4SlEZ97owwpKRymrTpCcyXw==
X-Google-Smtp-Source: AGHT+IH0BX50WXqhda/5zYoaq97TFshDXBpBPxC7g6dc7L/kU35EsxkrRUvI9RxqMXaOowOkBXyeUQ==
X-Received: by 2002:a17:902:c142:b0:1c4:bc8:4b64 with SMTP id 2-20020a170902c14200b001c40bc84b64mr2711290plj.5.1695224799935;
        Wed, 20 Sep 2023 08:46:39 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.109])
        by smtp.gmail.com with ESMTPSA id m7-20020a170902db0700b001c0de73564dsm11995153plx.205.2023.09.20.08.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 08:46:39 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 4/4] KVM: riscv: selftests: Selectively filter-out AIA registers
Date: Wed, 20 Sep 2023 21:16:08 +0530
Message-Id: <20230920154608.1447057-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920154608.1447057-1-apatel@ventanamicro.com>
References: <20230920154608.1447057-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_084641_929044_7DB5681E 
X-CRM114-Status: GOOD (  13.67  )
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

Currently the AIA ONE_REG registers are reported by get-reg-list
as new registers for various vcpu_reg_list configs whenever Ssaia
is available on the host because Ssaia extension can only be
disabled by Smstateen extension which is not always available.

To tackle this, we should filter-out AIA ONE_REG registers only
when Ssaia can't be disabled for a VCPU.

Fixes: 477069398ed6 ("KVM: riscv: selftests: Add get-reg-list test")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 76c0ad11e423..9f99ea42f45f 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -12,6 +12,8 @@
 
 #define REG_MASK (KVM_REG_ARCH_MASK | KVM_REG_SIZE_MASK)
 
+static bool isa_ext_cant_disable[KVM_RISCV_ISA_EXT_MAX];
+
 bool filter_reg(__u64 reg)
 {
 	switch (reg & ~REG_MASK) {
@@ -48,6 +50,15 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM:
 		return true;
+	/* AIA registers are always available when Ssaia can't be disabled */
+	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect):
+	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1):
+	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio2):
+	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(sieh):
+	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siph):
+	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1h):
+	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio2h):
+		return isa_ext_cant_disable[KVM_RISCV_ISA_EXT_SSAIA];
 	default:
 		break;
 	}
@@ -71,14 +82,22 @@ static inline bool vcpu_has_ext(struct kvm_vcpu *vcpu, int ext)
 
 void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 {
+	unsigned long isa_ext_state[KVM_RISCV_ISA_EXT_MAX] = { 0 };
 	struct vcpu_reg_sublist *s;
+	int rc;
+
+	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++)
+		__vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(i), &isa_ext_state[i]);
 
 	/*
 	 * Disable all extensions which were enabled by default
 	 * if they were available in the risc-v host.
 	 */
-	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++)
-		__vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(i), 0);
+	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++) {
+		rc = __vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(i), 0);
+		if (rc && isa_ext_state[i])
+			isa_ext_cant_disable[i] = true;
+	}
 
 	for_each_sublist(c, s) {
 		if (!s->feature)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
