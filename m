Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D446C7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 17:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pk9I7kUt/YPn1vA+Wr9D1wMV6kzTubXS/4ejfX/Dbp4=; b=2fUI+9/O9A4Mai
	5i6q+hk53+MH/TIfeTgDAxiKUIguIaAGoknFFhLsRImq+4JwaBVMlhXH82hAEmXWKpW6X1CHE04sx
	ProQ+htyiNUQ+GaayaeCvJCj+g9Sv3l3napteHWMFgoOVgE8qpoZEwTZKaa8qlcD+nrBEBqmpHaQp
	XVJRku6Ag4gMAyiZMYl3dPdR2RALlsW5NwAWY31b4czwZAgGfcFBmUG+dIy4UExlqPR7IRyy/Ymy8
	DCqS222wPEU++u63XPKUq58oQva5yB/c5SDd0j/ibcK1MdJyl/cN9limkN/uhxVhJHhmOmXRDbnzS
	xkBYKbDoEAcODsd+jsKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prii5-004UKg-0B;
	Wed, 26 Apr 2023 17:13:41 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prihz-004UFj-2e
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 17:13:38 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-94f3df30043so1190106766b.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 10:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682529213; x=1685121213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLvoZhq+rB4GKS9Jeshc9hm/LbfOD54WKU572zKZVKY=;
        b=OBBPINo2kNtRNJSI8ktm7BJfq5Zk0JiU0bS+6AwYo5IcWqTLd/MNnhBQfLuzkhbHff
         JijGxXkN8Ysv8GfbW7AIoTVTn8UWuksw6VZxXMUNMtkPCLhTn3x1k9XRncZt4chYhQkl
         izuuxNs1U0PNOR8aJYZC5aWQNNyX8oEiKgjsS8BeD0I7oob8Z/n5/A9JhA2OraB1ukDe
         8guTseXh3X0I5hvxfijRHiJjzeNWoFkMINU8hmPcls2GtM2kKsAfTKGeElzJPntgwCyC
         jA1gEnsPoBOcJKB4X+2m1IoRLQLUaA5Ofq3ejIihLNKlHGJtPTcsoj8EmMbowxXdR06k
         fmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682529213; x=1685121213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLvoZhq+rB4GKS9Jeshc9hm/LbfOD54WKU572zKZVKY=;
        b=T7KtxXxDSwHboJ4XyXHoJZZhSypbtBdMxElupEqDv2hOC5ul8K0gyWDC4Rd77j+40J
         nQu7o/KcKLbqB3vFnQhx0t43LJbfWvgdZXgC7pJgXxTkzjG+BkVOcwajp8s0rGPmZvpc
         x8lxtSsESg/b33JsquFP0KfsHC8stb5x0uXZ8JDFtFcT2iyAathbotgU0INjlA/vy3iT
         4qNf6cU8kopaSQLLDbelt/oDSoHHFnkYmpyfsE2BevF9eHpuC9gCXx1VmLbf79SpoRjQ
         DHJO+c3FR4QcRo0KYk517tghJSGFDUz9XK6KGBCJZBSYfnUKEMUifgGlyOGRMmVLm1xy
         aMVg==
X-Gm-Message-State: AC+VfDyHS01g7h5ms8J/QFAZAYvzVNgmrizvIOwNNDvJpmcI1KXAqSJZ
	WUOoejT8PzfRk1jxSkBAS5afXA==
X-Google-Smtp-Source: ACHHUZ7I35k4hyJXmFuZZC27P65C1wwJC8CBdqvTGrj5UGwV8XGPcbigbLRRGlp9HmITAJrveGNCPA==
X-Received: by 2002:a17:907:7da6:b0:95f:1359:84ae with SMTP id oz38-20020a1709077da600b0095f135984aemr2738820ejc.55.1682529212771;
        Wed, 26 Apr 2023 10:13:32 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id lh11-20020a170906f8cb00b0094a789256dcsm8525937ejb.111.2023.04.26.10.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 10:13:32 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: 'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>
Subject: [PATCH 2/3] RISC-V: KVM: Rename dis_idx to ext_idx
Date: Wed, 26 Apr 2023 19:13:27 +0200
Message-Id: <20230426171328.69663-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230426171328.69663-1-ajones@ventanamicro.com>
References: <20230426171328.69663-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_101335_861011_B7A2D30B 
X-CRM114-Status: GOOD (  13.01  )
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

Make the name of the extension_disabled[] index more general in
order to expand its application.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index aa3c126d2e3c..a1a82f0fbad2 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -31,49 +31,49 @@ static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
 #endif
 
 struct kvm_riscv_sbi_extension_entry {
-	enum KVM_RISCV_SBI_EXT_ID dis_idx;
+	enum KVM_RISCV_SBI_EXT_ID ext_idx;
 	const struct kvm_vcpu_sbi_extension *ext_ptr;
 };
 
 static const struct kvm_riscv_sbi_extension_entry sbi_ext[] = {
 	{
-		.dis_idx = KVM_RISCV_SBI_EXT_V01,
+		.ext_idx = KVM_RISCV_SBI_EXT_V01,
 		.ext_ptr = &vcpu_sbi_ext_v01,
 	},
 	{
-		.dis_idx = KVM_RISCV_SBI_EXT_MAX, /* Can't be disabled */
+		.ext_idx = KVM_RISCV_SBI_EXT_MAX, /* Can't be disabled */
 		.ext_ptr = &vcpu_sbi_ext_base,
 	},
 	{
-		.dis_idx = KVM_RISCV_SBI_EXT_TIME,
+		.ext_idx = KVM_RISCV_SBI_EXT_TIME,
 		.ext_ptr = &vcpu_sbi_ext_time,
 	},
 	{
-		.dis_idx = KVM_RISCV_SBI_EXT_IPI,
+		.ext_idx = KVM_RISCV_SBI_EXT_IPI,
 		.ext_ptr = &vcpu_sbi_ext_ipi,
 	},
 	{
-		.dis_idx = KVM_RISCV_SBI_EXT_RFENCE,
+		.ext_idx = KVM_RISCV_SBI_EXT_RFENCE,
 		.ext_ptr = &vcpu_sbi_ext_rfence,
 	},
 	{
-		.dis_idx = KVM_RISCV_SBI_EXT_SRST,
+		.ext_idx = KVM_RISCV_SBI_EXT_SRST,
 		.ext_ptr = &vcpu_sbi_ext_srst,
 	},
 	{
-		.dis_idx = KVM_RISCV_SBI_EXT_HSM,
+		.ext_idx = KVM_RISCV_SBI_EXT_HSM,
 		.ext_ptr = &vcpu_sbi_ext_hsm,
 	},
 	{
-		.dis_idx = KVM_RISCV_SBI_EXT_PMU,
+		.ext_idx = KVM_RISCV_SBI_EXT_PMU,
 		.ext_ptr = &vcpu_sbi_ext_pmu,
 	},
 	{
-		.dis_idx = KVM_RISCV_SBI_EXT_EXPERIMENTAL,
+		.ext_idx = KVM_RISCV_SBI_EXT_EXPERIMENTAL,
 		.ext_ptr = &vcpu_sbi_ext_experimental,
 	},
 	{
-		.dis_idx = KVM_RISCV_SBI_EXT_VENDOR,
+		.ext_idx = KVM_RISCV_SBI_EXT_VENDOR,
 		.ext_ptr = &vcpu_sbi_ext_vendor,
 	},
 };
@@ -147,7 +147,7 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
 		return -EINVAL;
 
 	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
-		if (sbi_ext[i].dis_idx == reg_num) {
+		if (sbi_ext[i].ext_idx == reg_num) {
 			sext = &sbi_ext[i];
 			break;
 		}
@@ -155,7 +155,7 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
 	if (!sext)
 		return -ENOENT;
 
-	scontext->extension_disabled[sext->dis_idx] = !reg_val;
+	scontext->extension_disabled[sext->ext_idx] = !reg_val;
 
 	return 0;
 }
@@ -172,7 +172,7 @@ static int riscv_vcpu_get_sbi_ext_single(struct kvm_vcpu *vcpu,
 		return -EINVAL;
 
 	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
-		if (sbi_ext[i].dis_idx == reg_num) {
+		if (sbi_ext[i].ext_idx == reg_num) {
 			sext = &sbi_ext[i];
 			break;
 		}
@@ -180,7 +180,7 @@ static int riscv_vcpu_get_sbi_ext_single(struct kvm_vcpu *vcpu,
 	if (!sext)
 		return -ENOENT;
 
-	*reg_val = !scontext->extension_disabled[sext->dis_idx];
+	*reg_val = !scontext->extension_disabled[sext->ext_idx];
 
 	return 0;
 }
@@ -317,12 +317,12 @@ const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
 		ext = entry->ext_ptr;
 
 		if (ext->extid_start <= extid && ext->extid_end >= extid) {
-			if (entry->dis_idx >= KVM_RISCV_SBI_EXT_MAX)
+			if (entry->ext_idx >= KVM_RISCV_SBI_EXT_MAX)
 				return ext;
-			if (scontext->extension_disabled[entry->dis_idx])
+			if (scontext->extension_disabled[entry->ext_idx])
 				return NULL;
 			if (ext->probe && !ext->probe(vcpu)) {
-				scontext->extension_disabled[entry->dis_idx] = true;
+				scontext->extension_disabled[entry->ext_idx] = true;
 				return NULL;
 			}
 			return ext;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
