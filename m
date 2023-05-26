Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BDCC7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 10:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HzPPNm0Rom4o1gz83176hzEWtV1lSkl5u7eMjOQFWWE=; b=uumyauaqwEmc3R
	pqnH8aqvVQKVnZ6VUqyeTir8UQUYq38j6XxmcFSBb0yILpaFemxpvwZ37KonAlpgZfHWkARRl/Cip
	LcJIrfzW0TgWSNv53LEGDmkJiUYI3eXA+c+ELSCRdGFb7uwNW4RzxHEwhYKIIUkK+OK0Vua1NjLKQ
	gYY1TzRZnfKGAynVwJxbkPkcx051ZnAwydwvYF4RKN7/xAYW2Gl1ugpKpcNrw2CZ67SBKxpzFNjui
	ReNBpEj1m/Wn5myNN34n+ObeXqf8K4xX7K+ya7ZAa6lv0XOp9lWgwAD7GVkOlbnaDbojwey9MQjVu
	/XjMNrVxwdZ6yDF6bytg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Udp-0020uF-33;
	Fri, 26 May 2023 10:25:49 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Udk-0020qB-1l
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 10:25:46 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f6dbe3c230so6229505e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 May 2023 03:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685096743; x=1687688743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKduwq6wpVNkg7sAm9uiVFoI5HTFVgtAWjSbzWy4dlI=;
        b=Kkze308OvUU1/b5V6ndyvcMYYcrxPNPE6BdvttzptGqCwZKUO9PlCdYwW1OZDiFVli
         +38fGqzr5P4Zk+JTSs3i/yMAf7IicDFfWPJeqrSbIOJW7c3WRsltzYw4KlpDotfK2WL8
         Da5cN0BKMtNf3UkzINpKr+hMOv45vp0AugVwFEDQEy15d3UBOXvmEVB3h4qyRmsvnMjz
         Q3Z66ov9e5T7P28/DLNbB35KiCvt0CB7+xdwqmXIhEs/7EGiQVq1LJlpxWiFXeWXWPXU
         0mR0BdwLhNezkGEgpa36mw8XWYz+f7fRHUcLX7LBTwr/xMygL6osXQE+PYnn96Y++Baf
         3Cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685096743; x=1687688743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKduwq6wpVNkg7sAm9uiVFoI5HTFVgtAWjSbzWy4dlI=;
        b=LsR7rXHIszsb+7N8n9MFdsA4gj5EidzbnJH2+NK47NM1CEnL1gzYMXClAuamjpsOpG
         pWV/XIv83HqlBwp7DyoRViPTS1CgtPBeV9SE+3TVEBm3b3ZeEHjRgcNiBkGixVsNkfla
         Gm3hMiFv2dd39ruUTvEHcu8GGKkpht7XINnCisK7PFvAK4j3fl/YXhxHN2/KKlYyyv5B
         wsv7MMV5MXNJ//XoEsPhtl3ubjsSKcvarTezlLi/wW7N3GlidBVLOy5X/5r/ukE5xxt9
         djMhnCNOF402OisRcv0+qU2vGO28IIaWfYj2GxAVyYCeahXqhTBpw0uC0XRzNpZZqqbY
         U7DA==
X-Gm-Message-State: AC+VfDxOFrH6yWhS1fH79KJ48EyZ5qPHOHwGBooey+avtH2DG4BDdmEB
	6xWyh2C7ExmQmZ4Nc/Or8oxvV4l9YZrJKtcigFw=
X-Google-Smtp-Source: ACHHUZ6QIAWdldy5onc2nI5PYuIwZsyKKZKbgZTikR47aabYzTYuBv7vZ8ssU/ws+82AVbL0T4/G4Q==
X-Received: by 2002:a05:600c:2105:b0:3f5:faee:dace with SMTP id u5-20020a05600c210500b003f5faeedacemr1390382wml.32.1685096742884;
        Fri, 26 May 2023 03:25:42 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id f10-20020a7bc8ca000000b003f42ceb3bf4sm4742025wml.32.2023.05.26.03.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 03:25:42 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: 'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Atish Patra ' <atishp@atishpatra.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Anup Patel ' <anup@brainfault.org>
Subject: [PATCH v2 1/3] RISC-V: KVM: Rename dis_idx to ext_idx
Date: Fri, 26 May 2023 12:25:38 +0200
Message-Id: <20230526102540.105013-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526102540.105013-1-ajones@ventanamicro.com>
References: <20230526102540.105013-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_032544_599488_89C596E1 
X-CRM114-Status: GOOD (  12.89  )
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
