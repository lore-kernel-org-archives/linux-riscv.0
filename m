Return-Path: <SRS0=a4kH=HG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 105CBC433E9
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 05:33:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8374C64DF0
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Feb 2021 05:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8374C64DF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oOnKV9P86oVFaz3NlkELLsIXMU5F7k4MVgAaywK4Ai0=; b=LjJYRXsegE4KsghJy/5iFS9oE
	5YoEMH3rgF17MlX2/Jt8PCfhZbLvjsow///HkGxA6hadGVxnEojKhPTu5sXVByDozcbTcbJFDks+g
	AJ4jOOCZlDZC7dOyTHnTRRlt0GBsrk1zVcwgDpi9clzfwy72Hmve+Ko0E4hWfn86KCLf5Qn0ws7lK
	Yp3YqTCccaOwGDMTdW8KKIiHDwUsIoQTyb8/n6FeYCor/HfSGescZGBoS9+UbLwssbZy3quuj5IFI
	w63IlhGaSfFvHTNwP1YGhEEO+y2lO7kELZESoX28XWQ5zHIpAHPk8/yQrl+VPU+AJKQK7REQuHI5T
	3enCEnP2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7XGN-00069Z-TL; Thu, 04 Feb 2021 05:33:07 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7XGF-00063d-IU; Thu, 04 Feb 2021 05:33:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612416779; x=1643952779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hAGw3mc5c81wiYWE6AxTQ0aXDt7RC+LEa6RwXEaS5ec=;
 b=Mjlm8PaFQMP0Q3+hgk8gV1b9a/Ls0JpcCwk8ynvnHMYABRAaKBxg0RUN
 imNn6qQaviJXoN5EVpYSNeG8VR0z2lV4yIdUIaCqo6shRq7wumWffIPIT
 O3TpG9uzqH0FLpwZnP/UsHdR3XDZDK1FJJy3gujAWuH7QFRuQfHijKEht
 4XRWA5XbchCAyDfGcAdjTnW7Ayj6Aeuz3uifRxsyZBKcH8MeWJ67rBhsT
 y4a1peE/spX/3G3ccuCRl/yzoqndW5bI2Xbex864INg1nnPY6g1/qVBF7
 3KjFJYu2tYND62pj1GQTuCr6yJIzSVpJ2EatghmyCCBpZjZECfZf/Zlnl Q==;
IronPort-SDR: uEwvxBo9cZGbO4WaAvpR1yZVgwoSIT202j9lQPfb+pamMdOpUZe+qT5Jxi29dHWPV29+x9+fTr
 jo3EEBTty8gps6eMAsDZ6v8SKWUMOCF6rSo23vXYQqwlAxmp06+LsPn67yjpRHGmkolVUMIhdT
 RhS1m8SHMo/Oe+NIUJtmBt4YnYQh/sP01nR8G3rj9gVli0Wo00DUGNpsX8Yl7vdO0aRvyxvnts
 1yjiAxoDjqQPpQGf4LAGZoMo7i5Zj7VcQHwTnbQ50QGW06VvEbqhIL0DIiekmhSwOwJ0DgrhJX
 hag=
X-IronPort-AV: E=Sophos;i="5.79,400,1602518400"; d="scan'208";a="159086452"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Feb 2021 13:32:55 +0800
IronPort-SDR: abOcD2wOBPJSvokExERiFkwazsCxajZDtlwbRTOImWYOlJG1mlhCssUB7lQjp0RbWk0URX71bu
 JNA+kjSE3acsO21Lr0bTbzzLNHBC1mB25IfqMtUeLiv2NF9gTTFSkosYIe28TaqtFxUmoFYtCs
 fwBwjBpQRN+6Vf3vSzOtw1g2nQmiWH2aLM3pI2ykukpEGbXYqYe6Vze+2Sjja/Cnv10s+ssO48
 nOSlx0vcwaH08krVKqjPAxwZ4D/EBsrHHGCrDOM0fvLUphW5s6Ra9eZR0m+j7/kz4HHGkYxdQW
 zp5sGs7qtTBkA1p4ugRmR1Gf
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 21:14:59 -0800
IronPort-SDR: ObOo8zL6/WOxtdUYwrJVpJCxxHnhG5Dn0G/P4QVyky7k7hnsjmnjgCudZBupjhxWFenHBJO2LW
 d0DKvbeIZ6PLUZE6me+CW57MSnxdogA1bq4NGFVxoKR7n4gOF/FFUZX9L+B6e3XA7Ngwfcc+88
 7nIBqNTgUeeKA98mbcdaT49+2W6mtwDR40xn2jzOt/+9hA+NsFHIfh882MoLxmoXOOVkEoFm4j
 cHNZzj3hmD2AL0J8NgWzM02Nu/izgk9erzRtSP83IW2ADxH5FmTSjYlFUeuTrk5805lFnV/USM
 s8Y=
WDCIronportException: Internal
Received: from cnf008142.ad.shared (HELO jedi-01.hgst.com) ([10.86.63.165])
 by uls-op-cesaip02.wdc.com with ESMTP; 03 Feb 2021 21:32:55 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] RISC-V: Add SBI RESET extension in KVM
Date: Wed,  3 Feb 2021 21:32:39 -0800
Message-Id: <20210204053239.1609558-7-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204053239.1609558-1-atish.patra@wdc.com>
References: <20210204053239.1609558-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_003259_984087_A27BFC13 
X-CRM114-Status: GOOD (  15.74  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kvm@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SBI RESET extension allows OS to initiate a system wide reboot or shutdown.

Implement the SBI RESET extension so that guests can issue shutdown/reset
requests as well.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  1 +
 arch/riscv/kvm/vcpu_sbi.c             | 17 +++++++++++
 arch/riscv/kvm/vcpu_sbi_legacy.c      | 17 +----------
 arch/riscv/kvm/vcpu_sbi_replace.c     | 44 +++++++++++++++++++++++++++
 4 files changed, 63 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index e208c8ac57fe..4f08bb45d8ce 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -29,4 +29,5 @@ struct kvm_vcpu_sbi_extension {
 
 void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
 const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(unsigned long extid);
+void kvm_sbi_system_event(struct kvm_vcpu *vcpu, struct kvm_run *run, u32 type);
 #endif /* __RISCV_KVM_VCPU_SBI_H__ */
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 20ef59ed83a6..858203b46700 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -38,6 +38,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
 
 static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_legacy,
@@ -46,8 +47,24 @@ static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_ipi,
 	&vcpu_sbi_ext_rfence,
 	&vcpu_sbi_ext_hsm,
+	&vcpu_sbi_ext_srst,
 };
 
+void kvm_sbi_system_event(struct kvm_vcpu *vcpu,
+			  struct kvm_run *run, u32 type)
+{
+	int i;
+	struct kvm_vcpu *tmp;
+
+	kvm_for_each_vcpu(i, tmp, vcpu->kvm)
+		tmp->arch.power_off = true;
+	kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
+
+	memset(&run->system_event, 0, sizeof(run->system_event));
+	run->system_event.type = type;
+	run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
+}
+
 void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run)
 {
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
diff --git a/arch/riscv/kvm/vcpu_sbi_legacy.c b/arch/riscv/kvm/vcpu_sbi_legacy.c
index 126d97b1292d..9fd7ea386d5f 100644
--- a/arch/riscv/kvm/vcpu_sbi_legacy.c
+++ b/arch/riscv/kvm/vcpu_sbi_legacy.c
@@ -14,21 +14,6 @@
 #include <asm/kvm_vcpu_timer.h>
 #include <asm/kvm_vcpu_sbi.h>
 
-static void kvm_sbi_system_shutdown(struct kvm_vcpu *vcpu,
-				    struct kvm_run *run, u32 type)
-{
-	int i;
-	struct kvm_vcpu *tmp;
-
-	kvm_for_each_vcpu(i, tmp, vcpu->kvm)
-		tmp->arch.power_off = true;
-	kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
-
-	memset(&run->system_event, 0, sizeof(run->system_event));
-	run->system_event.type = type;
-	run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
-}
-
 static int kvm_sbi_ext_legacy_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 				      unsigned long *out_val,
 				      struct kvm_cpu_trap *utrap,
@@ -83,7 +68,7 @@ static int kvm_sbi_ext_legacy_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
 		}
 		break;
 	case SBI_EXT_0_1_SHUTDOWN:
-		kvm_sbi_system_shutdown(vcpu, run, KVM_SYSTEM_EVENT_SHUTDOWN);
+		kvm_sbi_system_event(vcpu, run, KVM_SYSTEM_EVENT_SHUTDOWN);
 		*exit = true;
 		break;
 	case SBI_EXT_0_1_REMOTE_FENCE_I:
diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
index dffb1930cada..7504e36ededb 100644
--- a/arch/riscv/kvm/vcpu_sbi_replace.c
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -134,3 +134,47 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence = {
 	.extid_end = SBI_EXT_RFENCE,
 	.handler = kvm_sbi_ext_rfence_handler,
 };
+
+static int kvm_sbi_ext_srst_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				      unsigned long *out_val,
+				      struct kvm_cpu_trap *utrap, bool *exit)
+{
+	int ret = 0;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	unsigned long reset_type = cp->a0;
+	unsigned long reset_reason = cp->a1;
+	unsigned long funcid = cp->a6;
+
+	if (!cp)
+		return -EINVAL;
+
+	if ((((u32)-1U) <= ((u64)reset_type)) ||
+	    (((u32)-1U) <= ((u64)reset_reason)))
+		return -EINVAL;
+
+	if ((funcid != SBI_EXT_SRST_RESET) ||
+	    (reset_reason > SBI_SRST_RESET_REASON_SYS_FAILURE))
+		ret = -EOPNOTSUPP;
+
+	switch (reset_type) {
+	case SBI_SRST_RESET_TYPE_SHUTDOWN:
+		kvm_sbi_system_event(vcpu, run, KVM_SYSTEM_EVENT_SHUTDOWN);
+		*exit = true;
+		break;
+	case SBI_SRST_RESET_TYPE_COLD_REBOOT:
+	case SBI_SRST_RESET_TYPE_WARM_REBOOT:
+		kvm_sbi_system_event(vcpu, run, KVM_SYSTEM_EVENT_RESET);
+		*exit = true;
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+	};
+
+	return ret;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst = {
+	.extid_start = SBI_EXT_SRST,
+	.extid_end = SBI_EXT_SRST,
+	.handler = kvm_sbi_ext_srst_handler,
+};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
