Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8006CC7EE2F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 17:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=55oGDZ1swgluN5Nb/VEzFtp5gLTeQBM6WRy91xzCG1U=; b=JvxJQ9C/pAj3Es
	3zbpmEQjRiiCvwBZsL43EtrnrZ2+fe7pS9SGGrYZbQIwc6RHrXMMgmq2AGExnS35yoUbL5/qD78Hc
	+yoMe4BVBrGYc9gE5rnlhEAHeCyEPUhc94t0hbwNBMTrPTaWpf98QFHl6tQmAiaEwzWmwmftEMBSl
	RkxvoMJ3ujVhAbQIMKGHVd/3SYf8Gm1IMyT0UYbvEgWU3WqQ8be6yDlU+qPMaconTdvW42Bd3Tm0N
	XB6pitEv9gEU6RxOEdZk3j+z/oyf0GLOqDjpocPIoaPfBQLkpZGbDSjGLHnjZzUM72uRa291v9PE9
	3VINOY2Hlyxl7I+B+1BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q43UZ-00Ensx-2a;
	Tue, 30 May 2023 17:50:43 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q43UV-00EnoL-0p
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 17:50:41 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-96f7bf29550so742955166b.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 10:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1685469034; x=1688061034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZ7mt7hAgt0ChIGOhE7jWmZoTbkGl00vhfgyqO7LfaY=;
        b=BnMk2qujw75SDBOeA0UIIeM+X2iL4tDzyIAtfBiVNFBGar1WtmHkNdpdQ4ZJxUR86l
         QDWvmfEom7LF0QHRP6CBNWB5GdfyL3D4+1xiXq8qac6qC58/HdkuzLUQ00SraDtGjW8+
         dsvWSOBiShZE4hPrVEbrAd2yvDNkIJ5m118L/qg/hcvwchEN8cY0J+7zU1jwSUzx7n3U
         SuGr622rJKjuWOvCL7GYJUzOTDHcdS84nwuWAJ7syVtJfIMNTOD3jYW/nTrIfA9/1wLZ
         TaPYivfQ4PidK+H4NIm+N9Ha1UCbftO7Y8DupPlU8R5x2HRoudjxN3TFB3vWeEbKD0kD
         nF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685469034; x=1688061034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZ7mt7hAgt0ChIGOhE7jWmZoTbkGl00vhfgyqO7LfaY=;
        b=iShh9SAOPxM2pFAGg53aFzvEFhaEReymRfAipb29vMOODHm9hq+6GjwacQRhKsFTxJ
         BFJON6RaZpz7tuSwkmDlZdZgb9nNb2D4mR5kMphq+sGk9DrYOyQURdSDgmgQ+fAafZuj
         sg6GTnnwt+xiIGXQkx3qc32KEpS6LDp8hXUzmqN/eToa0Zsip1C/xhoKPQWy2W/4JcDD
         hh2eUlQmI7w5JPGb9qxQ0KQ7pSr96uckqhNew2+URe/hYw81xJT06Ou3PAvqVTwd9UWf
         GUCvq2Vc3nDcsdw4e7DkL1GcGoqkNTLt0hSWEqQYA8G8jL1zUawGytimAK/tX288d3QL
         4oRQ==
X-Gm-Message-State: AC+VfDwZevoWmI+fXiUnbSZey17F6kishY9qpPkd/CEE5qB/pIEB+S1S
	soVwIYJ6s5CIknS291iBFy+yYSDCEuaScTSqMlQ=
X-Google-Smtp-Source: ACHHUZ5KZRZjpXX+VVQ/LJR8PrE1mg4lBgeV79qXz+dHnLkRbwWSWX9354VLsQM4QLmopKyDDoYv1A==
X-Received: by 2002:a17:907:9403:b0:966:5c04:2c61 with SMTP id dk3-20020a170907940300b009665c042c61mr2813013ejc.8.1685469034582;
        Tue, 30 May 2023 10:50:34 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id q15-20020a1709066b0f00b0096b4c3489e6sm7767748ejr.177.2023.05.30.10.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 10:50:34 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: [PATCH v3 3/3] RISC-V: KVM: Probe for SBI extension status
Date: Tue, 30 May 2023 19:50:24 +0200
Message-Id: <20230530175024.354527-4-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530175024.354527-1-ajones@ventanamicro.com>
References: <20230530175024.354527-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_105039_329227_5E82C72C 
X-CRM114-Status: GOOD (  22.42  )
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

Rather than defaulting the status to available and allowing the user
to set availability, default to uninitialized and only allow the user
to set the status to unavailable. Then, when an extension is first
used, ensure it is available by invoking its probe function, if it
has one (an extension is assumed available if it doesn't have a probe
function). Checking the status in kvm_vcpu_sbi_find_ext() ensures
extension functions cannot be invoked when they're unavailable.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  1 +
 arch/riscv/kvm/vcpu_sbi.c             | 51 ++++++++++++++++++++-------
 2 files changed, 40 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index ad1588d6064b..14ee03df252d 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -15,6 +15,7 @@
 #define KVM_SBI_VERSION_MINOR 0
 
 enum kvm_riscv_sbi_ext_status {
+	KVM_RISCV_SBI_EXT_UNINITIALIZED,
 	KVM_RISCV_SBI_EXT_AVAILABLE,
 	KVM_RISCV_SBI_EXT_UNAVAILABLE,
 };
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 28e55ba023dc..b3e92c11e54f 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -155,8 +155,15 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
 	if (!sext)
 		return -ENOENT;
 
-	scontext->ext_status[sext->ext_idx] = reg_val ?
-		KVM_RISCV_SBI_EXT_AVAILABLE : KVM_RISCV_SBI_EXT_UNAVAILABLE;
+	/*
+	 * We can't set the extension status to available here, since it may
+	 * have a probe() function which needs to confirm availability first,
+	 * but it may be too early to call that here. We can set the status to
+	 * unavailable, though.
+	 */
+	if (!reg_val)
+		scontext->ext_status[sext->ext_idx] =
+			KVM_RISCV_SBI_EXT_UNAVAILABLE;
 
 	return 0;
 }
@@ -181,8 +188,15 @@ static int riscv_vcpu_get_sbi_ext_single(struct kvm_vcpu *vcpu,
 	if (!sext)
 		return -ENOENT;
 
-	*reg_val = scontext->ext_status[sext->ext_idx] ==
-				KVM_RISCV_SBI_EXT_AVAILABLE;
+	/*
+	 * If the extension status is still uninitialized, then we should probe
+	 * to determine if it's available, but it may be too early to do that
+	 * here. The best we can do is report that the extension has not been
+	 * disabled, i.e. we return 1 when the extension is available and also
+	 * when it only may be available.
+	 */
+	*reg_val = scontext->ext_status[sext->ext_idx] !=
+				KVM_RISCV_SBI_EXT_UNAVAILABLE;
 
 	return 0;
 }
@@ -309,19 +323,32 @@ int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
 const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
 				struct kvm_vcpu *vcpu, unsigned long extid)
 {
-	int i;
-	const struct kvm_riscv_sbi_extension_entry *sext;
 	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
+	const struct kvm_riscv_sbi_extension_entry *entry;
+	const struct kvm_vcpu_sbi_extension *ext;
+	int i;
 
 	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
-		sext = &sbi_ext[i];
-		if (sext->ext_ptr->extid_start <= extid &&
-		    sext->ext_ptr->extid_end >= extid) {
-			if (sext->ext_idx < KVM_RISCV_SBI_EXT_MAX &&
-			    scontext->ext_status[sext->ext_idx] ==
+		entry = &sbi_ext[i];
+		ext = entry->ext_ptr;
+
+		if (ext->extid_start <= extid && ext->extid_end >= extid) {
+			if (entry->ext_idx >= KVM_RISCV_SBI_EXT_MAX ||
+			    scontext->ext_status[entry->ext_idx] ==
+						KVM_RISCV_SBI_EXT_AVAILABLE)
+				return ext;
+			if (scontext->ext_status[entry->ext_idx] ==
 						KVM_RISCV_SBI_EXT_UNAVAILABLE)
 				return NULL;
-			return sbi_ext[i].ext_ptr;
+			if (ext->probe && !ext->probe(vcpu)) {
+				scontext->ext_status[entry->ext_idx] =
+					KVM_RISCV_SBI_EXT_UNAVAILABLE;
+				return NULL;
+			}
+
+			scontext->ext_status[entry->ext_idx] =
+				KVM_RISCV_SBI_EXT_AVAILABLE;
+			return ext;
 		}
 	}
 
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
