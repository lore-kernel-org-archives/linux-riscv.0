Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA67C7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 17:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HzPPNm0Rom4o1gz83176hzEWtV1lSkl5u7eMjOQFWWE=; b=nMozk3pOofoLbm
	z6bKnLG/iBjxZO71rcknH8twvWz3wi2T+yI///HZvkmmL6YvmOguO7TLvYOyX8a13NvtQXM0l+v3b
	u0MNhowAGq5dwPj0w3ewOI4W5F9GUstIxto/t6ak35sIWw2bqeL1S/j06Svtpd0XZuagOukYQHiA3
	kmIsbqLZsIO25/USLvwkjljUotjsfinoQ75kKIz+VHzUgrGTK9u9VwW00giiH0H+HwmOMNUm3P7Vi
	Gnd8SsjB46ZXyf7w1p8IAE34Ynfk0NneyS5Zy/XUGUvd0aRtWLNV+HMBY1EdqpyYta+3REUEVUmVc
	NM30Qe2uCV1ILqlqXJpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q43UX-00EnrI-06;
	Tue, 30 May 2023 17:50:41 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q43UT-00Enny-2B
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 17:50:39 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-514924b4f8cso6034253a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 10:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685469032; x=1688061032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKduwq6wpVNkg7sAm9uiVFoI5HTFVgtAWjSbzWy4dlI=;
        b=V863woOIox8DFbVeq6gWu99oQphcBHYsKcbfSYPC/hJkVcgmd4luxmuNawFAGFkQCU
         H34lq15NN4LOXkryaJte28eaGV7qv8ZZLhlZTJnj+USrsYciknH5+TYgcVKFKz1AbPba
         LKd2xB9LFpOXkVFOr4NFk4DvjEkP+pG1SE13xZdC8uYgHPPTAKQuoDkCO1/cM+lNC6R0
         Agz9PVuCanTBnOgECYVxyZGRkGsCRKDSJ2MsoY1G+OuwmObOjnqjin+i4XJMEvcuh7x5
         XhtyUf1HHUUF5Tg5g7hZkaDnCtJvvnGOnxVFPfqDfQJclLVDX0wOTYhpSicrbjubIyg0
         HiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685469032; x=1688061032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKduwq6wpVNkg7sAm9uiVFoI5HTFVgtAWjSbzWy4dlI=;
        b=ismK6zB+j0rSWO8OFNXx8ALj5tumFYatIPk0PEORYcgiK71gBPHIynnbBGewu8gXA/
         QqY9Y7a7RF2qYPPFCXQdLFY1CisXsknI2CKC75cDZTJZzxYW+ctmRK8zyfMVFLpB4Ivj
         IKuk0oSuLwhMh5vMrnWUv7Vi//V/zk5Cesbwl7CIjOA4eC37ERxgRcfaY4s6ZdXUWM9L
         4aBMTqbw3tedq4+X99aZRI5Zgxxge4iERUZBrHvTxgPLBkqeLiWH2uzl5DxpnbCSHOAo
         Az5ddWVUSiFuQ6ORKTeLYi/EGLZHf367h2xkOWVsPI/r59QLkowjFRz+knhGikxw2vPQ
         ocFw==
X-Gm-Message-State: AC+VfDy5eEfn1qcJTsKXXhPuDqTaNv0HImgwPbW++UiyBAocUVsorUKg
	Kl/HA3uMDaOND0GCtutJcWLvLyFT0Vbc9QTIe/E=
X-Google-Smtp-Source: ACHHUZ71ZR0poEV0QEIncEeKjyzEthFtWkk2OiX6zliv4imEM5URMWkqKeFQ0p4GLoPeKvtSTo2RBg==
X-Received: by 2002:a17:906:ef06:b0:973:940e:a01d with SMTP id f6-20020a170906ef0600b00973940ea01dmr3098942ejs.67.1685469032155;
        Tue, 30 May 2023 10:50:32 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id bg9-20020a170906a04900b0094f124a37c4sm7753393ejb.18.2023.05.30.10.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 10:50:31 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: [PATCH v3 1/3] RISC-V: KVM: Rename dis_idx to ext_idx
Date: Tue, 30 May 2023 19:50:22 +0200
Message-Id: <20230530175024.354527-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530175024.354527-1-ajones@ventanamicro.com>
References: <20230530175024.354527-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_105037_716076_86873C78 
X-CRM114-Status: GOOD (  13.27  )
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
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/kvm/vcpu_sbi.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index e52fde504433..6aa15f1b97d9 100644
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
@@ -315,8 +315,8 @@ const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
 		sext = &sbi_ext[i];
 		if (sext->ext_ptr->extid_start <= extid &&
 		    sext->ext_ptr->extid_end >= extid) {
-			if (sext->dis_idx < KVM_RISCV_SBI_EXT_MAX &&
-			    scontext->extension_disabled[sext->dis_idx])
+			if (sext->ext_idx < KVM_RISCV_SBI_EXT_MAX &&
+			    scontext->extension_disabled[sext->ext_idx])
 				return NULL;
 			return sbi_ext[i].ext_ptr;
 		}
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
