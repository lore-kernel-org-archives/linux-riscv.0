Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9FCC77B7E
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 11:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fsm+PV/BSa0YEYnCK0ib9epgWyu3DHUGcOK5KjSVmdg=; b=UF5ksVlF/WVoo+
	y83bv8usYS80BWwrdoqX9s9EzTPUiC2lQmxntZKjHy0bxgdUFlzPSWF+2DfbhSF7/AeV5eq48Bpru
	A6sEGfDM5kD/N3PpxaYunk3kuUsa8Q+2xuuoM8Zrm50iZlcdUVl7XfWezzqV1hOEVhe2Hb55G0LZB
	sF1znbED225Ces9oOF89pDEimMLpwFFhlKJqNaIO3u5HB8j9SlgSX0gWNIeZPDo1uiUWQwihy3hTO
	7gqip59RL5z4lEo8EzfqaqPbsTWFIP9jqOLN+mBWQmunFnqWlytfw/iEZpXRTwSGVZKj8g/YAPhSV
	TGbpElDvklqKhe7/YFOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poNIR-00G1OD-1s;
	Mon, 17 Apr 2023 11:45:23 +0000
Received: from mail-ej1-f44.google.com ([209.85.218.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poMBp-00Fkv4-04
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 10:34:32 +0000
Received: by mail-ej1-f44.google.com with SMTP id q23so53335005ejz.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Apr 2023 03:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1681727667; x=1684319667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxMxSNgQ+RsN387v7SSVWDDXSMuoQxWzDizOBaXNBUg=;
        b=gSv1IotEZ+hannAqKuAx4jRBwsG1652WhulZhkjKaNShcb9Upyt5qpc/APDzcIALNn
         B8joeVdIvpInhh+spM1AdlrnIKLOmJgaxpXaZ3HXmiJvMIzMKM7teicUUqMrBvsh57nu
         MzygatgYCRgj7QXAjlv3/H/obnhFOERmfvfX4WMexMAK3w+5n1teBC/8kly5a0njIbo0
         SwXALEub7mcBIkSSLznetk8QE9eXj6mU4qPoOelX0FVm2x82W4Yh1orBKLJw1I3C1caN
         I6DS6MsDRN1ILNEkjiNX6Hvnk4DVmsC9yFCoyYk7RF51wITNDlRmH2Xa5OQRGVE1KA+g
         GKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681727667; x=1684319667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxMxSNgQ+RsN387v7SSVWDDXSMuoQxWzDizOBaXNBUg=;
        b=Cb4zXIjJaqhZlWCrBCK4+Ui/FmtXQY2w+Wz2eHwUXj4ttSK43D38S2Ghqr5cyfEz2Q
         5OVF3M8rH6GU+vAcWrtcAZgqdRP2EN812Xya3y9h+jzX6XEDXbUCn37MbmnJltItN90n
         LlcDMSquhlbVDW8P6kGqkrHBEvjuou5ytKlq2xFV1dtIu2vrq0g49b4FyHIvnEHrXPpn
         NEPcXaiCtT66F8C2vUBS3LBLwiP4AvlUzmF96glHlDZbNIl77ZeS5fwSmm6CyXXvQ+rw
         If1w5mvi33Ij0cAzc5wQb3h1E8Ex5EAzzKwcnMtayM8kwXAOcxPnjqqZgg53SEbQUX+T
         hREg==
X-Gm-Message-State: AAQBX9ffE9PClrdDvyTjagPdO+icnbsOAgLFiP15/y/9V8UJ9gjGk3Qf
	BvaQCFdxcv90fUomZM4BE37Xsw==
X-Google-Smtp-Source: AKy350ZGdaaGsbpUesbjDKenU9cymMKCgwDy8ljQiQ173np71NgEzAiXeRz+MvU8bg9r26r8H0EwDA==
X-Received: by 2002:a17:906:595a:b0:94e:dc3c:cca2 with SMTP id g26-20020a170906595a00b0094edc3ccca2mr6793535ejr.70.1681727666911;
        Mon, 17 Apr 2023 03:34:26 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id y14-20020a1709064b0e00b0094e60ac9678sm6334021eju.122.2023.04.17.03.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 03:34:26 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paolo Bonzini ' <pbonzini@redhat.com>,
	'Juergen Gross ' <jgross@suse.com>,
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: [RFC PATCH 13/14] KVM: selftests: riscv: Add RISCV_SBI_EXT_REG
Date: Mon, 17 Apr 2023 12:34:01 +0200
Message-Id: <20230417103402.798596-14-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417103402.798596-1-ajones@ventanamicro.com>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_033429_101390_38B6A069 
X-CRM114-Status: UNSURE (   8.62  )
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

Extend __kvm_reg_id() with subtype field support and add
RISCV_SBI_EXT_REG() which uses that field.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../selftests/kvm/include/riscv/processor.h    | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index 1c6908342f22..f052e8be0e42 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -10,10 +10,10 @@
 #include "kvm_util.h"
 #include <linux/stringify.h>
 
-static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t idx,
-				    uint64_t  size)
+static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t subtype,
+				    uint64_t idx, uint64_t size)
 {
-	return KVM_REG_RISCV | type | idx | size;
+	return KVM_REG_RISCV | type | subtype | idx | size;
 }
 
 #if __riscv_xlen == 64
@@ -22,22 +22,26 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t idx,
 #define KVM_REG_SIZE_ULONG	KVM_REG_SIZE_U32
 #endif
 
-#define RISCV_CONFIG_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CONFIG, \
+#define RISCV_CONFIG_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CONFIG, 0, \
 					     KVM_REG_RISCV_CONFIG_REG(name), \
 					     KVM_REG_SIZE_ULONG)
 
-#define RISCV_CORE_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CORE, \
+#define RISCV_CORE_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CORE, 0, \
 					     KVM_REG_RISCV_CORE_REG(name), \
 					     KVM_REG_SIZE_ULONG)
 
-#define RISCV_CSR_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CSR, \
+#define RISCV_CSR_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CSR, 0, \
 					     KVM_REG_RISCV_CSR_REG(name), \
 					     KVM_REG_SIZE_ULONG)
 
-#define RISCV_TIMER_REG(name)	__kvm_reg_id(KVM_REG_RISCV_TIMER, \
+#define RISCV_TIMER_REG(name)	__kvm_reg_id(KVM_REG_RISCV_TIMER, 0, \
 					     KVM_REG_RISCV_TIMER_REG(name), \
 					     KVM_REG_SIZE_U64)
 
+#define RISCV_SBI_EXT_REG(subtype, id)	__kvm_reg_id(KVM_REG_RISCV_SBI_EXT, \
+						     subtype, id, \
+						     KVM_REG_SIZE_ULONG)
+
 /* L3 index Bit[47:39] */
 #define PGTBL_L3_INDEX_MASK			0x0000FF8000000000ULL
 #define PGTBL_L3_INDEX_SHIFT			39
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
