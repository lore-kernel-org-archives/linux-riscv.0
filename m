Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C55C46CA2
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 20:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wzUwzLYhOqC+UeyzUrE4AjOUxnoCNUNaFPFDad9Mn3Q=; b=ErL0X7EMWAWqCu
	TBUDyUClstWIgFYcHHimqgpr+7JywybqJ24IRoeK7MW0X0jAZGcWKT0WhTK9LanV6wyhp+suvXoao
	H6YW5hVtubuOjpmCZEdVy5IB9KJUz2IUicgGNF+Lnk0E2ABVR3BR5GypxzTOpeIa61w0v5BJ5J645
	sotkGWvyljflJTgZ9sn84h+MtB57OwhTvx1VTuXyaF12fi+BgMZeXlpmsNS9IbGKOUiSnYlDcxYK/
	iK0S4qUFyTJnT/ciMkDl4O56gkVnob+ZpF000Niktasgq1/Djh06iIY0GheSDsjsmEOA32WQdPaez
	Ie2ay+85+T/kmu/EwKXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rExwk-008Qa7-1B;
	Sun, 17 Dec 2023 20:41:10 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rExwc-008QNT-0v
	for linux-riscv@lists.infradead.org;
	Sun, 17 Dec 2023 20:41:07 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50e1d61b657so2752443e87.0
        for <linux-riscv@lists.infradead.org>; Sun, 17 Dec 2023 12:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702845660; x=1703450460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3/0Hma02Vd0ly7A0sb99/J3m8aSq89MJrcPUNSRUYI=;
        b=ho8tkRrrXmzJYZE95SV08DycyQjqKryT49/o3LFj8k8fqSuLNEtO/4MsaW0Ln+bB2E
         WDVmXeLpkDxhREZ9CxHqaaM7+uBGtxLsrBeMYcvDVwbOvDDhAD7J7iZuatfNx+j/FWvx
         Da9Z+FoQKqwwHmAvcrQgVS2ejaPVZbNY1BRWBq1TykoMNFOCo7R7es+vGPbuPzAuydBF
         1Y2BX+IA285i4HkFDVkhpR9cdpc76Rs4VNAEmiEIixd9CgNcVxCwAN/NhrZDfOBr4al3
         S66CkE5S/sR6f9xxp6WiaJgV0rU/kaOf0mbCmHBlVkM+h9pGMuODyAyr4F3RElEg7H7b
         n88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702845660; x=1703450460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3/0Hma02Vd0ly7A0sb99/J3m8aSq89MJrcPUNSRUYI=;
        b=fFyIq9vUB1i78t6N+kK7C7qHE4wgEEhsq9dvKBuBvD4uzyRftxTM36a68bEzEoUlFX
         gZYeecmxtTJUV5jEj21t9ZO8HOsvIzN8XgQtqf5eOMmfdKVD+zWBx4/OJhtDZ8f2X7F8
         l2ln1M8TLWILdAle9zeiectoiLcQ9bol1pomh6SZ7iKmWj/snKXjaiNT9qK6dff3OD3F
         bIgTmx4j7vB/2094gYgDg/CiKwROWh7Tkx+hb7tQ40Y3R7hqS1p138IjFDj/hqgQX/s5
         L5X/BHIEe+5ZBG9QFiNUC3HQfHfliKmqjbvHblITg4JiEeHUVN24ZwW5Hj1aF1C1AKJp
         j/FA==
X-Gm-Message-State: AOJu0YwRN00mcvcjSPwJCzpX8BFyK4cKPKRT5bmJKapMGPOmUNfnrERR
	Zf1nI7eDTkTT5y5rByQ5noicsQ==
X-Google-Smtp-Source: AGHT+IERXKNF/+s+NEEHzdapPwlDcWN89Zm4uZLWWe/4d5WgczvSO/z3yTIm2LP04zK6s+fR6i5MCg==
X-Received: by 2002:a05:6512:398e:b0:50d:12b4:e02c with SMTP id j14-20020a056512398e00b0050d12b4e02cmr7559657lfu.53.1702845659741;
        Sun, 17 Dec 2023 12:40:59 -0800 (PST)
Received: from localhost (cst-prg-88-42.cust.vodafone.cz. [46.135.88.42])
        by smtp.gmail.com with ESMTPSA id ul5-20020a170907ca8500b00a1fa7e39957sm9677795ejc.136.2023.12.17.12.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 12:40:59 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	pbonzini@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgross@suse.com,
	srivatsa@csail.mit.edu,
	guoren@kernel.org,
	conor.dooley@microchip.com
Subject: [PATCH v3 13/13] RISC-V: KVM: selftests: Add get-reg-list test for STA registers
Date: Sun, 17 Dec 2023 21:40:33 +0100
Message-ID: <20231217204019.36492-28-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231217204019.36492-15-ajones@ventanamicro.com>
References: <20231217204019.36492-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_124103_803285_E2DACA55 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

Add SBI STA and its two registers to the get-reg-list test.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index b8da2e86bf9c..55dd1fc3c536 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -71,6 +71,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_HSM:
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_PMU:
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_DBCN:
+	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_STA:
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_EXPERIMENTAL:
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR:
 		return true;
@@ -461,6 +462,7 @@ static const char *sbi_ext_single_id_to_str(__u64 reg_off)
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_SRST),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_HSM),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_PMU),
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_STA),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_EXPERIMENTAL),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_VENDOR),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_DBCN),
@@ -509,6 +511,32 @@ static const char *sbi_ext_id_to_str(const char *prefix, __u64 id)
 	return strdup_printf("%lld | %lld /* UNKNOWN */", reg_subtype, reg_off);
 }
 
+static const char *sbi_sta_id_to_str(__u64 reg_off)
+{
+	switch (reg_off) {
+	case 0: return "KVM_REG_RISCV_SBI_STA | KVM_REG_RISCV_SBI_STA_REG(shmem_lo)";
+	case 1: return "KVM_REG_RISCV_SBI_STA | KVM_REG_RISCV_SBI_STA_REG(shmem_hi)";
+	}
+	return strdup_printf("KVM_REG_RISCV_SBI_STA | %lld /* UNKNOWN */", reg_off);
+}
+
+static const char *sbi_id_to_str(const char *prefix, __u64 id)
+{
+	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_SBI);
+	__u64 reg_subtype = reg_off & KVM_REG_RISCV_SUBTYPE_MASK;
+
+	assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_SBI);
+
+	reg_off &= ~KVM_REG_RISCV_SUBTYPE_MASK;
+
+	switch (reg_subtype) {
+	case KVM_REG_RISCV_SBI_STA:
+		return sbi_sta_id_to_str(reg_off);
+	}
+
+	return strdup_printf("%lld | %lld /* UNKNOWN */", reg_subtype, reg_off);
+}
+
 void print_reg(const char *prefix, __u64 id)
 {
 	const char *reg_size = NULL;
@@ -565,6 +593,10 @@ void print_reg(const char *prefix, __u64 id)
 		printf("\tKVM_REG_RISCV | %s | KVM_REG_RISCV_SBI_EXT | %s,\n",
 				reg_size, sbi_ext_id_to_str(prefix, id));
 		break;
+	case KVM_REG_RISCV_SBI:
+		printf("\tKVM_REG_RISCV | %s | KVM_REG_RISCV_SBI | %s,\n",
+				reg_size, sbi_id_to_str(prefix, id));
+		break;
 	default:
 		printf("\tKVM_REG_RISCV | %s | 0x%llx /* UNKNOWN */,\n",
 				reg_size, id & ~REG_MASK);
@@ -651,6 +683,12 @@ static __u64 sbi_base_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR,
 };
 
+static __u64 sbi_sta_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_STA,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI | KVM_REG_RISCV_SBI_STA | KVM_REG_RISCV_SBI_STA_REG(shmem_lo),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI | KVM_REG_RISCV_SBI_STA | KVM_REG_RISCV_SBI_STA_REG(shmem_hi),
+};
+
 static __u64 zicbom_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicbom_block_size),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM,
@@ -757,6 +795,9 @@ static __u64 fp_d_regs[] = {
 #define SUBLIST_SBI_BASE \
 	{"sbi-base", .feature_type = VCPU_FEATURE_SBI_EXT, .feature = KVM_RISCV_SBI_EXT_V01, \
 	 .regs = sbi_base_regs, .regs_n = ARRAY_SIZE(sbi_base_regs),}
+#define SUBLIST_SBI_STA \
+	{"sbi-sta", .feature_type = VCPU_FEATURE_SBI_EXT, .feature = KVM_RISCV_SBI_EXT_STA, \
+	 .regs = sbi_sta_regs, .regs_n = ARRAY_SIZE(sbi_sta_regs),}
 #define SUBLIST_ZICBOM \
 	{"zicbom", .feature = KVM_RISCV_ISA_EXT_ZICBOM, .regs = zicbom_regs, .regs_n = ARRAY_SIZE(zicbom_regs),}
 #define SUBLIST_ZICBOZ \
@@ -832,6 +873,7 @@ static struct vcpu_reg_list config_sbi_##ext = {		\
 /* Note: The below list is alphabetically sorted. */
 
 KVM_SBI_EXT_SUBLIST_CONFIG(base, BASE);
+KVM_SBI_EXT_SUBLIST_CONFIG(sta, STA);
 KVM_SBI_EXT_SIMPLE_CONFIG(pmu, PMU);
 KVM_SBI_EXT_SIMPLE_CONFIG(dbcn, DBCN);
 
@@ -858,6 +900,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zihpm, ZIHPM);
 
 struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_base,
+	&config_sbi_sta,
 	&config_sbi_pmu,
 	&config_sbi_dbcn,
 	&config_aia,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
