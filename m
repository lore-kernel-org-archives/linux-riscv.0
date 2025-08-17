Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F7CCA0EE4
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Aug 2025 12:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rxE6lv8LO3qcfbV4GWjuj3dBF3JCiJ1OwJ/QZ30tykw=; b=092I5uKvK0QcED
	Qh4545tmNQz30rACvxcPB04v4F3ww4TFlkA956aPFU/NPtNQi8tZoRMLHLQyZvOhzylOnmTrEPGID
	7N8VxEoo/J8cbXLtgjIiqxNtCXnJ9es1c16uc7PXXA7wAOhnidaMx+NCHur/6CGaCYxXtSmwWjrU/
	ArJ+eN20RgzFK1UEG1tFUtYDJdQHRwlPJF29RWB2wxm74jdd2gbiAGW65rM58KwIjxMBijFf4r6o4
	VCMhbJkZ7C/Z8jNE26+1cG/l1yweK2QB+rBf+SeM+1knkmtPFTQfl5hPNCf0QEmrh0ruJoqPpnHJv
	nddiZKNCEWA3jUuxF8VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uncaA-00000005eza-1owy;
	Sun, 17 Aug 2025 12:33:54 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unca7-00000005exH-34JY
	for linux-riscv@lists.infradead.org;
	Sun, 17 Aug 2025 12:33:52 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-323267b98a4so2704102a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 05:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755434031; x=1756038831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Chrrw+dyIJSlBaNuFfzfLJBXunJM56lFjN13/1zM0cU=;
        b=gq1P0r6ieioxN/m2E9PsDtSvZcHnAgEZMXDWztMT+AcZ0Nwf37aaR13f121OV486i9
         BDwsfj6TcYJOJ8nEzvEhawlB2EB0yXzfuzZ62hJ6B5gMdZfVqVc2wtd+dk0mD0lmirE9
         3iaV+P1RTYW8IcL/JOz1tm/5sknzAvzipGoVT7CKlXCnsDX6jvMwAvWpxLQC/J0eRk9o
         MED+DMvlvteAgdwVy1rKHohAxBoF/WIgZ6btUrOabYB/lI95o8GCiilcEZekQ6/X+77g
         sQvq7q18mz6+tQFXivv0S+AyWGgqKoGTgWc3gr79M+VKAWKoUhQKruqVTD4mvlC304Ab
         zRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755434031; x=1756038831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Chrrw+dyIJSlBaNuFfzfLJBXunJM56lFjN13/1zM0cU=;
        b=B7IJr0DZphZ09ih5zAwAdcOtlRWDjHL6NRA3MbOupy+IRpDcpdhtANHIEz/SVO9Bh5
         1pPbYR+8kcFeoTtWPVBABPiPWVRaVGXzTS591rADmVUj37E4oPDZGGUoHQHME91IKy0I
         mlkAH1JazAx0EmxNst4rKfI7UlZ3S7YpfeNcko4/pmltK8gbSgdal6bb/acU5E8+65Ar
         h+93ORtCYps1oNG3wfWsq+nGpsyJatmHcNwhD0RbkzzuiOclKfwYgQYMdts/t1V6Q+R4
         fTTBlOTYmZeM0LTokf9ylO4DiJdydt8/wb9zjyqDZgmoHjUjZhW0Nay1fTNgcyVzYtbK
         rMZg==
X-Forwarded-Encrypted: i=1; AJvYcCXEpjSABFCwxaWXcAjj1XyrDDV5XgZTJqHol0gPSe/fEM/QysghwPkRe6Y5SIvzqJBMALmn7YkPjbJshg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ8LSjR7H3lSwOkz+71kClJ22ZUwbyuDE4wrLg3tApUz64sqmZ
	faoe0rboM/xCLgKiAXs2X7OrdwDtx+3cMHXK9k2eqIzWlPWxmsPRFgL9r6Q2Hwv35lXXoM9V6C4
	dOO3x
X-Gm-Gg: ASbGnctvfFxROdTZJQAxOHR7Sepck1xVCUE/MMKa/rLJczsYYM1xDUCUVyYnBOQKN77
	JZ+Jsdbul2aINbmLreZ8sJDpxl5YMVG00I/MLPOfDygYZ0EXy0iimaeZfBnggzyCsj9697la8kD
	WWAeYprCRh3iIWh6HZA88G+xxVw2UMdQ7jwRBPvqccmavLrXeHutroC5bF/3Z2SvX466fLqFZCL
	3KWJQwN8X6eJgmdrkqxtu8SVALr8HRK1HsPgfGsYpHOsskkWyk2Z67OCbYH8mbBasuL5AU6ueeW
	wGzcltqb2kBtFapIuekQ+eM+C3NpgbrzQlTXoEx7ck4AcYCIMsfC9w5UR8KL2UEx4+5isygCJyz
	XsZfcT23fv+qV5gY1LucsccdjjPhQ1uC8tnos7MDd+xUuB0MS2Q8Htos=
X-Google-Smtp-Source: AGHT+IETV30d+U1cTWNm+PcAX8EyUCyQ87TNGD5UPWd2IWqoSPinHs4gpy114d5b7XZmASQs/fhxjw==
X-Received: by 2002:a17:90b:1f8f:b0:312:959:dc4f with SMTP id 98e67ed59e1d1-3234db7148cmr7188813a91.5.1755434030859;
        Sun, 17 Aug 2025 05:33:50 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3232b291449sm4480912a91.0.2025.08.17.05.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 05:33:50 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 2/6] RISC-V: KVM: Introduce feature specific reset for SBI FWFT
Date: Sun, 17 Aug 2025 18:03:20 +0530
Message-ID: <20250817123324.239423-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250817123324.239423-1-apatel@ventanamicro.com>
References: <20250817123324.239423-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_053351_794916_5BC444FB 
X-CRM114-Status: GOOD (  14.14  )
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

The SBI FWFT feature values must be reset upon VCPU reset so
introduce feature specific reset callback for this purpose.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi_fwft.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 164a01288b0a..5a3bad0f9330 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -30,6 +30,13 @@ struct kvm_sbi_fwft_feature {
 	 */
 	bool (*supported)(struct kvm_vcpu *vcpu);
 
+	/**
+	 * @reset: Reset the feature value irrespective whether feature is supported or not
+	 *
+	 * This callback is mandatory
+	 */
+	void (*reset)(struct kvm_vcpu *vcpu);
+
 	/**
 	 * @set: Set the feature value
 	 *
@@ -75,6 +82,13 @@ static bool kvm_sbi_fwft_misaligned_delegation_supported(struct kvm_vcpu *vcpu)
 	return misaligned_traps_can_delegate();
 }
 
+static void kvm_sbi_fwft_reset_misaligned_delegation(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
+
+	cfg->hedeleg &= ~MIS_DELEG;
+}
+
 static long kvm_sbi_fwft_set_misaligned_delegation(struct kvm_vcpu *vcpu,
 					struct kvm_sbi_fwft_config *conf,
 					unsigned long value)
@@ -124,6 +138,11 @@ static bool kvm_sbi_fwft_pointer_masking_pmlen_supported(struct kvm_vcpu *vcpu)
 	return fwft->have_vs_pmlen_7 || fwft->have_vs_pmlen_16;
 }
 
+static void kvm_sbi_fwft_reset_pointer_masking_pmlen(struct kvm_vcpu *vcpu)
+{
+	vcpu->arch.cfg.henvcfg &= ~ENVCFG_PMM;
+}
+
 static long kvm_sbi_fwft_set_pointer_masking_pmlen(struct kvm_vcpu *vcpu,
 						   struct kvm_sbi_fwft_config *conf,
 						   unsigned long value)
@@ -180,6 +199,7 @@ static const struct kvm_sbi_fwft_feature features[] = {
 	{
 		.id = SBI_FWFT_MISALIGNED_EXC_DELEG,
 		.supported = kvm_sbi_fwft_misaligned_delegation_supported,
+		.reset = kvm_sbi_fwft_reset_misaligned_delegation,
 		.set = kvm_sbi_fwft_set_misaligned_delegation,
 		.get = kvm_sbi_fwft_get_misaligned_delegation,
 	},
@@ -187,6 +207,7 @@ static const struct kvm_sbi_fwft_feature features[] = {
 	{
 		.id = SBI_FWFT_POINTER_MASKING_PMLEN,
 		.supported = kvm_sbi_fwft_pointer_masking_pmlen_supported,
+		.reset = kvm_sbi_fwft_reset_pointer_masking_pmlen,
 		.set = kvm_sbi_fwft_set_pointer_masking_pmlen,
 		.get = kvm_sbi_fwft_get_pointer_masking_pmlen,
 	},
@@ -321,11 +342,16 @@ static void kvm_sbi_ext_fwft_deinit(struct kvm_vcpu *vcpu)
 
 static void kvm_sbi_ext_fwft_reset(struct kvm_vcpu *vcpu)
 {
-	int i;
 	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
+	const struct kvm_sbi_fwft_feature *feature;
+	int i;
 
-	for (i = 0; i < ARRAY_SIZE(features); i++)
+	for (i = 0; i < ARRAY_SIZE(features); i++) {
 		fwft->configs[i].flags = 0;
+		feature = &features[i];
+		if (feature->reset)
+			feature->reset(vcpu);
+	}
 }
 
 const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft = {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
